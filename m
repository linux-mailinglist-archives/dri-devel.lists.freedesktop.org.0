Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F8339180
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 16:38:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06206E0C2;
	Fri, 12 Mar 2021 15:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20C46E0C2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 15:38:01 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id k16so634789ejx.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 07:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ihKylbU9HAdpr1yj9x1AaTze50PGzunh50+y40gS2NU=;
 b=arlyn3m/nePn1MkGugTj7/5dh5YaA1/yViAWh0fjkXLdqoq6TvxtgIa2gfQcYnRtei
 q6OJ5ePz2VRXWE2p06VZBjRt5X0ca1QJCC6Cl40gaG9awAXQqrncexP1anVlsqsYiJZv
 lQaGcA5D+VadR9enV5grQDALk3y+lI+yUEyzITVC/hP4ICbGWVhY1yokTYeHeUhwa+Ew
 HOXRg3F7TGlaZRfTq8PfMsXNT88s1qfEqmdqSVB/4l9Tl0a6fitOnTIjce/1FHMOX2EB
 Cfm2V6iY8OGb3R3LL6Y1tIEFJO7bCno/qc5s2owVhAHwg0+kyO+2lEZplbVQAGo7MtBA
 3Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ihKylbU9HAdpr1yj9x1AaTze50PGzunh50+y40gS2NU=;
 b=adyfSJimjsU9QUbHy+pCWqLuHfDv8eIzBlpWtMthqZdRqfSZjzjeIxXlY33oyUBWxs
 BOotE3/ObG3drsT3sO9G29tmMP8gGRYVCWZ/wP2/kp0ikZ98pGwWLswXoOHmWAAVNRVN
 EGF5pxWqbSKSBunHOR8kXOT7v/O3lPNnLUr+h1eH/qbV+DVSGgPoEu9+bubm0QwI5q8I
 uJBxryWuiaLql+bQFNorj6s3hhdmKA03x4QwEDW1Q3Z6g2pZ1lcg7DKL0Q7CG0fiXeoI
 kscdfoLFhbdX2Zbs8q8w5xUIvA2/Zdl04ulB0qCz2K6+r9h9Wyu6OFGe20Gk27fKWeEE
 hk7g==
X-Gm-Message-State: AOAM531jyexOOLGErVdUpw8lLZ68guv/CRnqz58TQlaCpRTQVdzrtW4G
 KWQ3bUornocOXQbMRm/UqiSfEpF9WvBySp5xh72rcg==
X-Google-Smtp-Source: ABdhPJw7vUZAlWn8+Ffm2ew55WwbkfBGAYXiwAAZUdxOriEe/esbz/DBSuR11BbUJxnW22VB7Cvjf5hZ6/4BMDcOlzQ=
X-Received: by 2002:a17:906:b288:: with SMTP id
 q8mr9138256ejz.210.1615563480336; 
 Fri, 12 Mar 2021 07:38:00 -0800 (PST)
MIME-Version: 1.0
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
 <20210311140023.2735aaa5@collabora.com>
 <CAOFGe94rnS+5FeJ1A8bLxgVDZB4_0Wp2Nx25iCCYGJ=j3KpOCA@mail.gmail.com>
 <20210311182458.0e0140a1@collabora.com>
 <CAOFGe95d-LQ_rNwncup-G5oj14uCnNrnHr=r1b5jLYnXfMSTiA@mail.gmail.com>
 <20210312083125.76063c77@collabora.com>
In-Reply-To: <20210312083125.76063c77@collabora.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 12 Mar 2021 09:37:49 -0600
Message-ID: <CAOFGe967tzx56OQv+z8L2ZB-d=1GST3LtuCQJ_LPHpjO2Km3oQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
To: Boris Brezillon <boris.brezillon@collabora.com>
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

On Fri, Mar 12, 2021 at 1:31 AM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Thu, 11 Mar 2021 12:11:48 -0600
> Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> > > > > > > 2/ Queued jobs might be executed out-of-order (unless they have
> > > > > > >     explicit/implicit deps between them), and Vulkan asks that the out
> > > > > > >     fence be signaled when all jobs are done. Timeline syncobjs are a
> > > > > > >     good match for that use case. All we need to do is pass the same
> > > > > > >     fence syncobj to all jobs being attached to a single QueueSubmit
> > > > > > >     request, but a different point on the timeline. The syncobj
> > > > > > >     timeline wait does the rest and guarantees that we've reached a
> > > > > > >     given timeline point (IOW, all jobs before that point are done)
> > > > > > >     before declaring the fence as signaled.
> > > > > > >     One alternative would be to have dummy 'synchronization' jobs that
> > > > > > >     don't actually execute anything on the GPU but declare a dependency
> > > > > > >     on all other jobs that are part of the QueueSubmit request, and
> > > > > > >     signal the out fence (the scheduler would do most of the work for
> > > > > > >     us, all we have to do is support NULL job heads and signal the
> > > > > > >     fence directly when that happens instead of queueing the job).
> > > > > >
> > > > > > I have to admit to being rather hazy on the details of timeline
> > > > > > syncobjs, but I thought there was a requirement that the timeline moves
> > > > > > monotonically. I.e. if you have multiple jobs signalling the same
> > > > > > syncobj just with different points, then AFAIU the API requires that the
> > > > > > points are triggered in order.
> > > > >
> > > > > I only started looking at the SYNCOBJ_TIMELINE API a few days ago, so I
> > > > > might be wrong, but my understanding is that queuing fences (addition
> > > > > of new points in the timeline) should happen in order, but signaling
> > > > > can happen in any order. When checking for a signaled fence the
> > > > > fence-chain logic starts from the last point (or from an explicit point
> > > > > if you use the timeline wait flavor) and goes backward, stopping at the
> > > > > first un-signaled node. If I'm correct, that means that fences that
> > > > > are part of a chain can be signaled in any order.
> > > >
> > > > You don't even need a timeline for this.  Just have a single syncobj
> > > > per-queue and make each submit wait on it and then signal it.
> > > > Alternatively, you can just always hang on to the out-fence from the
> > > > previous submit and make the next one wait on that.
> > >
> > > That's what I have right now, but it forces the serialization of all
> > > jobs that are pushed during a submit (and there can be more than one
> > > per command buffer on panfrost :-/). Maybe I'm wrong, but I thought it'd
> > > be better to not force this serialization if we can avoid it.
> >
> > I'm not familiar with panfrost's needs and I don't work on a tiler and
> > I know there are different issues there.  But...
> >
> > The Vulkan spec requires that everything that all the submits that
> > happen on a given vkQueue happen in-order.  Search the spec for
> > "Submission order" for more details.
>
> Duh, looks like I completely occulted the "Submission order"
> guarantees. This being said, even after reading this chapter multiple
> times I'm not sure what kind of guarantee this gives us, given the
> execution itself can be out-of-order. My understanding is that
> submission order matters for implicit deps, say you have 2 distinct
> VkSubmitInfo, the first one (in submission order) writing to a buffer
> and the second one reading from it, you really want the first one to
> be submitted first and the second one to wait on the implicit BO fence
> created by the first one. If we were to submit out-of-order, this
> guarantee wouldn't be met. OTOH, if we have 2 completely independent
> submits, I don't really see what submission order gives us if execution
> is out-of-order.

Right, this is where things get sticky.  What's guaranteed there is
submission order not execution order.  But, sadly, there's more hidden
in there than you might think.  Before we can go there, though, we
need to establish a few details of Mali hardware works.

My understanding (feel free to correct me if I'm wrong) is that,
roughly, Mali has two engines which have to work together to render:
One engine for compute/vertex/geometry and one for binning and
fragment.  When you go to submit a draw, you fire off any geometry
work on the compute engine and the fragment work on the binning
engine.  At a tile flush boundary (or renderpass in Vulkan), you
insert a dependency between the geometry work you put on the compute
engine and the binning/fragment work.  In a GL driver, you'd probably
kick it off to the kernel at this point.

In Vulkan, things are going to get more tricky.  You can't just kick
off to the kernel at tile flush boundaries.  You also can't assume
that all vertex work within a given command buffer is independent of
all the fragment work.  Let's say you have a sequence like this:

vkBeginRenderPass() /* Writes to ImageA */
vkCmdDraw()
vkCmdDraw()
...
vkEndRenderPass()
vkPipelineBarrier(imageA /* fragment -> compute */)
vkCmdDispatch() /* reads imageA, writes BufferB */
vkBeginRenderPass() /* Writes to ImageC */
vkCmdBindVertexBuffers(bufferB)
vkCmdDraw();
...
vkEndRenderPass()

Now you have, in a single command buffer, a draw which writes to an
image which is read by a compute shader which writes to a buffer which
is read by vertex fetch for another draw.  The only way to implement
this on a Mali like device is to ping-pong back and forth between the
compute and binning engines.  It'd look something like this (assuming
my mental model):

A: Vertex for the first draw on the compute engine
B: Vertex for the first draw on the compute engine
C: Fragment for the first draw on the binning engine; depends on A
D: Fragment for the second draw on the binning engine; depends on B
E: Compute on the compute engine; depends on C and D
F: Vertex for the third draw on the compute engine; depends on E
G: Fragment for the third draw on the binning engine; depends on F

There are a couple of options for how to do this:

 1. Each VkCommandBuffer is actually a bunch of command buffers for
each engine with dependencies.  vkQueueSubmit() calls the kernel
submit ioctl a brezillion times to submit them all.

 2. Same as 1, only the submit ioctl takes an array of things with
dependencies so that you don't have to do as many round-trips to
kernels space.

 3. Each VkCommandBuffer is two command buffers: one for compute and
one for binning, and you use some sort of HW synchronization mechanism
to handle the dependencies as you ping-pong between them.

Option 1 is the easiest to get going with if you're working on a
kernel driver that was designed for OpenGL but it has the obvious
drawback of lots of smaller command buffers and lots of submits.  It's
not going to scale well.  Option 3 is nice if the hardware can do it
(I have no idea if Mali can).

Sorry if that's all a re-hash of stuff you already know.  I'm just
trying to establish a baseline here so we're all talking about the
same things.

Ok, so what does this have to do with submission order in the spec?
The mental model of the Vulkan spec is that you have queues and you
submit commands to those queues.  Command buffers are just big
sequences of commands.  Those commands kick off work.  The kick-off
happens in-order but completion is out-of-order.  There are then
pipeline barriers which allow you to specify dependencies between
those bits of work such as "future compute work depends on previous
fragment work".  Importantly, those dependencies can even apply across
command buffers.

So where does this leave us?  Well, it depends on your submit model
and exactly how you handle pipeline barriers that sync between
engines.  If you're taking option 3 above and doing two command
buffers for each VkCommandBuffer, then you probably want two
serialized timelines, one for each engine, and some mechanism to tell
the kernel driver "these two command buffers have to run in parallel"
so that your ping-pong works.  If you're doing 1 or 2 above, I think
you probably still want two simple syncobjs, one for each engine.  You
don't really have any need to go all that far back in history.  All
you really need to describe is "command buffer X depends on previous
compute work" or "command buffer X depends on previous binning work".
As long as your multi-submit ioctl processes the command buffers
in-order, you can do it all with two syncobjs.

Sorry for the tome.  I hope it wasn't too wrong and was at least a
little helpful.

--Jason

> In our case, the kernel driver takes care of the submission
> serialization (gathering implicit and explicit deps, queuing the job and
> assigning the "done" fence to the output sync objects). Once things
> are queued, it's the scheduler (drm_sched) deciding of the execution
> order.
>
> >
> > So, generally speaking, there are some in-order requirements there.
> > Again, not having a lot of tiler experience, I'm not the one to weigh
> > in.
> >
> > > > Timelines are overkill here, IMO.
> > >
> > > Mind developing why you think this is overkill? After looking at the
> > > kernel implementation I thought using timeline syncobjs would be
> > > pretty cheap compared to the other options I considered.
> >
> > If you use a regular syncobj, every time you wait on it it inserts a
> > dependency between the current submit and the last thing to signal it
> > on the CPU timeline.  The internal dma_fences will hang around
> > as-needed to ensure those dependencies.  If you use a timeline, you
> > have to also track a uint64_t to reference the current time point.
> > This may work if you need to sync a bunch of in-flight stuff at one
> > go, that may work but if you're trying to serialize, it's just extra
> > tracking for no point.  Again, maybe there's something I'm missing and
> > you don't actually want to serialize.
>
> My understanding (and I might very much be wrong here) is that using a
> regular syncobj to do this actually enforces not only the submission
> order but also the execution order (each job waiting on the previous
> one to complete before being scheduled). The idea of the timeline
> syncobj approach is that jobs that have no inter dependencies can be
> started in any order, the scheduler picking the first whose deps are
> ready (which might not necessarily match submission order). The
> timeline syncobj allows us to have one point per kernel-submission and
> eventually wait on the last point for the fence passed to
> vkSubmitQueue(), and some specific point on the timeline for
> pSignalSemaphores entries.
>
> What's more challenging is signal operation ordering:
>
> "
> Signal operation order is a fundamental ordering in Vulkan, giving
> meaning to the order in which semaphore and fence signal operations
> occur when submitted to a single queue.
>
>
>
> 1.  The initial order is determined by the order in which
>     vkQueueSubmit commands are executed on the host, for a single
>     queue, from first to last.
>
> 2.  The order in which VkSubmitInfo structures are specified in the
>     pSubmits parameter of vkQueueSubmit, from lowest index to highest.
>
> 3.  The fence signal operation defined by the fence parameter of a
>     vkQueueSubmit or vkQueueBindSparse command is ordered after all
>     semaphore signal operations defined by that command.
> "
>
> This means we have to add implicit dependencies on the signaling
> itself. We have two options to guarantee that:
>
> 1/ Transfer one of the queue syncobj timeline point to each semaphore
>    and fence after job submission (the point itself being dependent
>    on the position of the submit entry in the array for semaphores, and
>    the last point for the fence). Problem with this approach is that we
>    now have an extra TRANSFER_SYNCOBJ call per semaphore/fence
>
> 2/ Add SYNC jobs (jobs that do not actually execute on the GPU, but
>    serve as a synchronization point) whose responsibility would be to
>    do this muxing/transfer as part of the batch submission process.
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
