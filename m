Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B91933397F4
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 21:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C392189DF7;
	Fri, 12 Mar 2021 20:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3737F89DF7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 20:06:22 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E111C1F46D11;
 Fri, 12 Mar 2021 20:06:20 +0000 (GMT)
Date: Fri, 12 Mar 2021 21:06:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
Message-ID: <20210312210617.044bf712@collabora.com>
In-Reply-To: <20210312192513.469462ef@collabora.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
 <20210311140023.2735aaa5@collabora.com>
 <CAOFGe94rnS+5FeJ1A8bLxgVDZB4_0Wp2Nx25iCCYGJ=j3KpOCA@mail.gmail.com>
 <20210311182458.0e0140a1@collabora.com>
 <CAOFGe95d-LQ_rNwncup-G5oj14uCnNrnHr=r1b5jLYnXfMSTiA@mail.gmail.com>
 <20210312083125.76063c77@collabora.com>
 <CAOFGe967tzx56OQv+z8L2ZB-d=1GST3LtuCQJ_LPHpjO2Km3oQ@mail.gmail.com>
 <20210312192513.469462ef@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Mar 2021 19:25:13 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > So where does this leave us?  Well, it depends on your submit model
> > and exactly how you handle pipeline barriers that sync between
> > engines.  If you're taking option 3 above and doing two command
> > buffers for each VkCommandBuffer, then you probably want two
> > serialized timelines, one for each engine, and some mechanism to tell
> > the kernel driver "these two command buffers have to run in parallel"
> > so that your ping-pong works.  If you're doing 1 or 2 above, I think
> > you probably still want two simple syncobjs, one for each engine.  You
> > don't really have any need to go all that far back in history.  All
> > you really need to describe is "command buffer X depends on previous
> > compute work" or "command buffer X depends on previous binning work".  
> 
> Okay, so this will effectively force in-order execution. Let's take your
> previous example and add 2 more jobs at the end that have no deps on
> previous commands:
> 
> vkBeginRenderPass() /* Writes to ImageA */
> vkCmdDraw()
> vkCmdDraw()
> ...
> vkEndRenderPass()
> vkPipelineBarrier(imageA /* fragment -> compute */)
> vkCmdDispatch() /* reads imageA, writes BufferB */
> vkBeginRenderPass() /* Writes to ImageC */
> vkCmdBindVertexBuffers(bufferB)
> vkCmdDraw();
> ...
> vkEndRenderPass()
> vkBeginRenderPass() /* Writes to ImageD */
> vkCmdDraw()
> ...
> vkEndRenderPass()
> 
> A: Vertex for the first draw on the compute engine
> B: Vertex for the first draw on the compute engine
> C: Fragment for the first draw on the binning engine; depends on A
> D: Fragment for the second draw on the binning engine; depends on B
> E: Compute on the compute engine; depends on C and D
> F: Vertex for the third draw on the compute engine; depends on E
> G: Fragment for the third draw on the binning engine; depends on F
> H: Vertex for the fourth draw on the compute engine
> I: Fragment for the fourth draw on the binning engine
> 
> When we reach E, we might be waiting for D to finish before scheduling
> the job, and because of the implicit serialization we have on the
> compute queue (F implicitly depends on E, and H on F) we can't schedule
> H either, which could, in theory be started. I guess that's where the
> term submission order is a bit unclear to me. The action of starting a
> job sounds like execution order to me (the order you starts jobs
> determines the execution order since we only have one HW queue per job
> type). All implicit deps have been calculated when we queued the job to
> the SW queue, and I thought that would be enough to meet the submission
> order requirements, but I might be wrong.
> 
> The PoC I have was trying to get rid of this explicit serialization on
> the compute and fragment queues by having one syncobj timeline
> (queue(<syncpoint>)) and synchronization points (Sx).
> 
> S0: in-fences=<waitSemaphores[]>, out-fences=<explicit_deps> #waitSemaphore sync point
> A: in-fences=<explicit_deps>, out-fences=<queue(1)>
> B: in-fences=<explicit_deps>, out-fences=<queue(2)>
> C: in-fences=<explicit_deps>, out-fence=<queue(3)> #implicit dep on A through the tiler context
> D: in-fences=<explicit_deps>, out-fence=<queue(4)> #implicit dep on B through the tiler context
> E: in-fences=<explicit_deps>, out-fence=<queue(5)> #implicit dep on D through imageA
> F: in-fences=<explicit_deps>, out-fence=<queue(6)> #implicit dep on E through buffer B
> G: in-fences=<explicit_deps>, out-fence=<queue(7)> #implicit dep on F through the tiler context
> H: in-fences=<explicit_deps>, out-fence=<queue(8)>
> I: in-fences=<explicit_deps>, out-fence=<queue(9)> #implicit dep on H through the tiler buffer
> S1: in-fences=<queue(9)>, out-fences=<signalSemaphores[],fence> #signalSemaphore,fence sync point
> # QueueWaitIdle is implemented with a wait(queue(0)), AKA wait on the last point
> 
> With this solution H can be started before E if the compute slot
> is empty and E's implicit deps are not done. It's probably overkill,
> but I thought maximizing GPU utilization was important.

Nevermind, I forgot the drm scheduler was dequeuing jobs in order, so 2
syncobjs (one per queue type) is indeed the right approach.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
