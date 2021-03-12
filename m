Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE7E339659
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 19:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFBD6E5B2;
	Fri, 12 Mar 2021 18:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F2266E5AB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 18:25:23 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E4D861F46EB0;
 Fri, 12 Mar 2021 18:25:17 +0000 (GMT)
Date: Fri, 12 Mar 2021 19:25:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
Message-ID: <20210312192513.469462ef@collabora.com>
In-Reply-To: <CAOFGe967tzx56OQv+z8L2ZB-d=1GST3LtuCQJ_LPHpjO2Km3oQ@mail.gmail.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
 <20210311140023.2735aaa5@collabora.com>
 <CAOFGe94rnS+5FeJ1A8bLxgVDZB4_0Wp2Nx25iCCYGJ=j3KpOCA@mail.gmail.com>
 <20210311182458.0e0140a1@collabora.com>
 <CAOFGe95d-LQ_rNwncup-G5oj14uCnNrnHr=r1b5jLYnXfMSTiA@mail.gmail.com>
 <20210312083125.76063c77@collabora.com>
 <CAOFGe967tzx56OQv+z8L2ZB-d=1GST3LtuCQJ_LPHpjO2Km3oQ@mail.gmail.com>
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

On Fri, 12 Mar 2021 09:37:49 -0600
Jason Ekstrand <jason@jlekstrand.net> wrote:

> On Fri, Mar 12, 2021 at 1:31 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Thu, 11 Mar 2021 12:11:48 -0600
> > Jason Ekstrand <jason@jlekstrand.net> wrote:
> >  
> > > > > > > > 2/ Queued jobs might be executed out-of-order (unless they have
> > > > > > > >     explicit/implicit deps between them), and Vulkan asks that the out
> > > > > > > >     fence be signaled when all jobs are done. Timeline syncobjs are a
> > > > > > > >     good match for that use case. All we need to do is pass the same
> > > > > > > >     fence syncobj to all jobs being attached to a single QueueSubmit
> > > > > > > >     request, but a different point on the timeline. The syncobj
> > > > > > > >     timeline wait does the rest and guarantees that we've reached a
> > > > > > > >     given timeline point (IOW, all jobs before that point are done)
> > > > > > > >     before declaring the fence as signaled.
> > > > > > > >     One alternative would be to have dummy 'synchronization' jobs that
> > > > > > > >     don't actually execute anything on the GPU but declare a dependency
> > > > > > > >     on all other jobs that are part of the QueueSubmit request, and
> > > > > > > >     signal the out fence (the scheduler would do most of the work for
> > > > > > > >     us, all we have to do is support NULL job heads and signal the
> > > > > > > >     fence directly when that happens instead of queueing the job).  
> > > > > > >
> > > > > > > I have to admit to being rather hazy on the details of timeline
> > > > > > > syncobjs, but I thought there was a requirement that the timeline moves
> > > > > > > monotonically. I.e. if you have multiple jobs signalling the same
> > > > > > > syncobj just with different points, then AFAIU the API requires that the
> > > > > > > points are triggered in order.  
> > > > > >
> > > > > > I only started looking at the SYNCOBJ_TIMELINE API a few days ago, so I
> > > > > > might be wrong, but my understanding is that queuing fences (addition
> > > > > > of new points in the timeline) should happen in order, but signaling
> > > > > > can happen in any order. When checking for a signaled fence the
> > > > > > fence-chain logic starts from the last point (or from an explicit point
> > > > > > if you use the timeline wait flavor) and goes backward, stopping at the
> > > > > > first un-signaled node. If I'm correct, that means that fences that
> > > > > > are part of a chain can be signaled in any order.  
> > > > >
> > > > > You don't even need a timeline for this.  Just have a single syncobj
> > > > > per-queue and make each submit wait on it and then signal it.
> > > > > Alternatively, you can just always hang on to the out-fence from the
> > > > > previous submit and make the next one wait on that.  
> > > >
> > > > That's what I have right now, but it forces the serialization of all
> > > > jobs that are pushed during a submit (and there can be more than one
> > > > per command buffer on panfrost :-/). Maybe I'm wrong, but I thought it'd
> > > > be better to not force this serialization if we can avoid it.  
> > >
> > > I'm not familiar with panfrost's needs and I don't work on a tiler and
> > > I know there are different issues there.  But...
> > >
> > > The Vulkan spec requires that everything that all the submits that
> > > happen on a given vkQueue happen in-order.  Search the spec for
> > > "Submission order" for more details.  
> >
> > Duh, looks like I completely occulted the "Submission order"
> > guarantees. This being said, even after reading this chapter multiple
> > times I'm not sure what kind of guarantee this gives us, given the
> > execution itself can be out-of-order. My understanding is that
> > submission order matters for implicit deps, say you have 2 distinct
> > VkSubmitInfo, the first one (in submission order) writing to a buffer
> > and the second one reading from it, you really want the first one to
> > be submitted first and the second one to wait on the implicit BO fence
> > created by the first one. If we were to submit out-of-order, this
> > guarantee wouldn't be met. OTOH, if we have 2 completely independent
> > submits, I don't really see what submission order gives us if execution
> > is out-of-order.  
> 
> Right, this is where things get sticky.  What's guaranteed there is
> submission order not execution order.  But, sadly, there's more hidden
> in there than you might think.  Before we can go there, though, we
> need to establish a few details of Mali hardware works.
> 
> My understanding (feel free to correct me if I'm wrong) is that,
> roughly, Mali has two engines which have to work together to render:
> One engine for compute/vertex/geometry and one for binning and
> fragment.  When you go to submit a draw, you fire off any geometry
> work on the compute engine and the fragment work on the binning
> engine.  At a tile flush boundary (or renderpass in Vulkan), you
> insert a dependency between the geometry work you put on the compute
> engine and the binning/fragment work.  In a GL driver, you'd probably
> kick it off to the kernel at this point.
> 
> In Vulkan, things are going to get more tricky.  You can't just kick
> off to the kernel at tile flush boundaries.  You also can't assume
> that all vertex work within a given command buffer is independent of
> all the fragment work.  Let's say you have a sequence like this:
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
> 
> Now you have, in a single command buffer, a draw which writes to an
> image which is read by a compute shader which writes to a buffer which
> is read by vertex fetch for another draw.  The only way to implement
> this on a Mali like device is to ping-pong back and forth between the
> compute and binning engines.  It'd look something like this (assuming
> my mental model):
> 
> A: Vertex for the first draw on the compute engine
> B: Vertex for the first draw on the compute engine
> C: Fragment for the first draw on the binning engine; depends on A
> D: Fragment for the second draw on the binning engine; depends on B
> E: Compute on the compute engine; depends on C and D
> F: Vertex for the third draw on the compute engine; depends on E
> G: Fragment for the third draw on the binning engine; depends on F
> 
> There are a couple of options for how to do this:
> 
>  1. Each VkCommandBuffer is actually a bunch of command buffers for
> each engine with dependencies.  vkQueueSubmit() calls the kernel
> submit ioctl a brezillion times to submit them all.

This is what we currently have.

> 
>  2. Same as 1, only the submit ioctl takes an array of things with
> dependencies so that you don't have to do as many round-trips to
> kernels space.


This is the PoC I worked on.

> 
>  3. Each VkCommandBuffer is two command buffers: one for compute and
> one for binning, and you use some sort of HW synchronization mechanism
> to handle the dependencies as you ping-pong between them.

I didn't consider that option. We have a DOORBELL instruction on Bifrost
to wake up the CPU when the GPU wants to report something (not even
sure we have something equivalent on Midgard), but there's no
inter-queue sync mechanism AFAICT.

> 
> Option 1 is the easiest to get going with if you're working on a
> kernel driver that was designed for OpenGL but it has the obvious
> drawback of lots of smaller command buffers and lots of submits.  It's
> not going to scale well.  Option 3 is nice if the hardware can do it
> (I have no idea if Mali can).
> 
> Sorry if that's all a re-hash of stuff you already know.  I'm just
> trying to establish a baseline here so we're all talking about the
> same things.
> 
> Ok, so what does this have to do with submission order in the spec?
> The mental model of the Vulkan spec is that you have queues and you
> submit commands to those queues.  Command buffers are just big
> sequences of commands.  Those commands kick off work.  The kick-off
> happens in-order but completion is out-of-order.  There are then
> pipeline barriers which allow you to specify dependencies between
> those bits of work such as "future compute work depends on previous
> fragment work".  Importantly, those dependencies can even apply across
> command buffers.
> 
> So where does this leave us?  Well, it depends on your submit model
> and exactly how you handle pipeline barriers that sync between
> engines.  If you're taking option 3 above and doing two command
> buffers for each VkCommandBuffer, then you probably want two
> serialized timelines, one for each engine, and some mechanism to tell
> the kernel driver "these two command buffers have to run in parallel"
> so that your ping-pong works.  If you're doing 1 or 2 above, I think
> you probably still want two simple syncobjs, one for each engine.  You
> don't really have any need to go all that far back in history.  All
> you really need to describe is "command buffer X depends on previous
> compute work" or "command buffer X depends on previous binning work".

Okay, so this will effectively force in-order execution. Let's take your
previous example and add 2 more jobs at the end that have no deps on
previous commands:

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
vkBeginRenderPass() /* Writes to ImageD */
vkCmdDraw()
...
vkEndRenderPass()

A: Vertex for the first draw on the compute engine
B: Vertex for the first draw on the compute engine
C: Fragment for the first draw on the binning engine; depends on A
D: Fragment for the second draw on the binning engine; depends on B
E: Compute on the compute engine; depends on C and D
F: Vertex for the third draw on the compute engine; depends on E
G: Fragment for the third draw on the binning engine; depends on F
H: Vertex for the fourth draw on the compute engine
I: Fragment for the fourth draw on the binning engine

When we reach E, we might be waiting for D to finish before scheduling
the job, and because of the implicit serialization we have on the
compute queue (F implicitly depends on E, and H on F) we can't schedule
H either, which could, in theory be started. I guess that's where the
term submission order is a bit unclear to me. The action of starting a
job sounds like execution order to me (the order you starts jobs
determines the execution order since we only have one HW queue per job
type). All implicit deps have been calculated when we queued the job to
the SW queue, and I thought that would be enough to meet the submission
order requirements, but I might be wrong.

The PoC I have was trying to get rid of this explicit serialization on
the compute and fragment queues by having one syncobj timeline
(queue(<syncpoint>)) and synchronization points (Sx).

S0: in-fences=<waitSemaphores[]>, out-fences=<explicit_deps> #waitSemaphore sync point
A: in-fences=<explicit_deps>, out-fences=<queue(1)>
B: in-fences=<explicit_deps>, out-fences=<queue(2)>
C: in-fences=<explicit_deps>, out-fence=<queue(3)> #implicit dep on A through the tiler context
D: in-fences=<explicit_deps>, out-fence=<queue(4)> #implicit dep on B through the tiler context
E: in-fences=<explicit_deps>, out-fence=<queue(5)> #implicit dep on D through imageA
F: in-fences=<explicit_deps>, out-fence=<queue(6)> #implicit dep on E through buffer B
G: in-fences=<explicit_deps>, out-fence=<queue(7)> #implicit dep on F through the tiler context
H: in-fences=<explicit_deps>, out-fence=<queue(8)>
I: in-fences=<explicit_deps>, out-fence=<queue(9)> #implicit dep on H through the tiler buffer
S1: in-fences=<queue(9)>, out-fences=<signalSemaphores[],fence> #signalSemaphore,fence sync point
# QueueWaitIdle is implemented with a wait(queue(0)), AKA wait on the last point

With this solution H can be started before E if the compute slot
is empty and E's implicit deps are not done. It's probably overkill,
but I thought maximizing GPU utilization was important.

> As long as your multi-submit ioctl processes the command buffers
> in-order, you can do it all with two syncobjs.
> 
> Sorry for the tome.  I hope it wasn't too wrong and was at least a
> little helpful.

It definitely helps, even if the concept of submission order is still
unclear to me, especially when applied to GPUs that have a single HW
queue, and where submission and execution order could be considered the
same thing.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
