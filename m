Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC1838F20E
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 19:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295636E20A;
	Mon, 24 May 2021 17:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884126E20A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 17:11:24 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id c20so42989521ejm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 10:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ORWSaFMqVHUSJySHHAKif8GIucS6+/A6detHwcyZGIA=;
 b=XmV474mnExBe/6bcq9lvRZsjkHbJ6nhBECq0LEeibO+7AO03YOhY+N741tDiqQtp7F
 4sBE4cSpgYlf2qMZaTOveON3pe+q43FLIaMTT5v1b7WQLOGDNvyP06UtzUI3KJTDV5eg
 S4srAE1d2/iMXcNnzbdYEqP/+hZ93hSsRagey4SnAU3brZDFGAVXgZbTPlY14tCo6e7p
 4erSprmo6fhk50pVr4rsTqwhCevBwByRk8MtF2wfX02EPPGdouxF7SP65Qe10xj+bVsN
 95g6PRuerWHhNWSfuzFCq2Ci7kdINq9Pn99URqwRMcb+HpztJi/4MeuJ05746uT3SBx/
 lPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ORWSaFMqVHUSJySHHAKif8GIucS6+/A6detHwcyZGIA=;
 b=XEGK6JY3tqjO/fD+itK9K+Wj6f2JIl1lrZWJUJHUZMt3O9ek5eWkZX5Sqqe+sxXVO/
 ckwn5vfRxIJznNt2/3dNL+RZkY3pIbt9rFf2NIZxDcJqbzImjhRo+WJu4/HiICtq0852
 UixsnqRv0FvdGz2wvqd7BmVUnoKqWNfGoozySoNa/+ISiaMJhgXYwVyY/Ff9X+Yn6DcP
 St1cVwdT2kSMLPrSMCKjGh4Zku67cvNDt7PKpD25kQKt+GeSF8wRHBk2IlH5B68vCayB
 an3twrAU6VfJQNlvi6J3K8FT6EZOqEytef93WMIW7baBfWBnJybmbFLKRNxueTv3Aha3
 abRg==
X-Gm-Message-State: AOAM532poY5yIs573fCoeBPZ6toH+7qXNmEDIe5aPHZGm5p5SUZHL2ZK
 RY5AGzolBpkO48u+yEiwwaifI1Hbg34138I8JusXIA==
X-Google-Smtp-Source: ABdhPJxFKuDcfV3ax+8OzuaZB5cI3dPnw0ud+tAvewJ7qwk6wRaXYHvX7K8oq11QLkDlRb50Rb1/tT0uXT2vdizBIJw=
X-Received: by 2002:a17:906:1806:: with SMTP id
 v6mr4357387eje.454.1621876282632; 
 Mon, 24 May 2021 10:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
In-Reply-To: <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 24 May 2021 12:11:11 -0500
Message-ID: <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Daniel Stone <daniel@fooishbar.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 22, 2021 at 3:05 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Thu, 20 May 2021 at 20:00, Jason Ekstrand <jason@jlekstrand.net> wrote:
> > In the Vulkan world, this is useful for dealing with the out-fence from
> > vkQueuePresent.  Current Linux window-systems (X11, Wayland, etc.) all
> > rely on dma-buf implicit sync.  Since Vulkan is an explicit sync API, we
> > get a set of fences (VkSemaphores) in vkQueuePresent and have to stash
> > those as an exclusive (write) fence on the dma-buf.  We handle it in
> > Mesa today with the above mentioned dummy submit trick.  This ioctl
> > would allow us to set it directly without the dummy submit.
> >
> > This may also open up possibilities for GPU drivers to move away from
> > implicit sync for their kernel driver uAPI and instead provide sync
> > files and rely on dma-buf import/export for communicating with other
> > implicit sync clients.
> >
> > We make the explicit choice here to only allow setting RW fences which
> > translates to an exclusive fence on the dma_resv.  There's no use for
> > read-only fences for communicating with other implicit sync userspace
> > and any such attempts are likely to be racy at best.
>
> I think I almost follow, but I'm not quite seeing the race you allude
> to. Let me talk through my understanding so it's hopefully more clear
> for others as a summary. Please correct me on anything I've
> misunderstood or just missed completely. (I thought when I wrote this
> intro that the email might be relatively snappy, but it's really long
> and takes in a lot of breadth. Sorry.)
>
> So as far as I'm reading this patchset and the Mesa MR, this _only_
> concerns the out-fence (i.e. compositor -> client AcquireNextImage
> semaphore/fence) so far. The in-fence (client->compositor QueuePresent
> wait-semaphores/fences) is handled by the driver ensuring that an
> exclusive resv is placed on the union of the signal semaphores passed
> to QueuePresent, either through flags on its CS ioctl, or amdgpu's BO
> flags, or ... either way, no problem as it should always be exclusive,
> and it seems pretty uncontroversial that we should pull the wait
> semaphore into an exclusive fence so that no downstream consumer will
> begin using it until the client ops have fully retired.
>
> For AcquireNextImage, your patchset exports all the fences (shared and
> exclusive both) on the dma_resv out into the semaphore/fence such that
> the client can't progress (CPU-side for VkFence, GPU-side for
> VkSemaphore) until all currently queued operations have completely
> retired. So, as long as the server ensures that all its kernel-side
> work is flushed before its IPC to unblock ANI (wl_buffer.release or
> DRI3 PresentIdle, both indicating that the client is free to reuse the
> buffer, subject to synchronising against implicit fences on the resv),
> all good: we snapshot the current resv state, wrap the relevant
> driver-side Vulkan primitive around it, and go back to explicit
> synchronisation. The client can't race generating new work against
> this, because it can't queue any work until ANI has returned and
> queued a signaling op on the semaphore/fence.
>
> So far, so good. I really like both your series up until this
> narrative point; as I was saying in the userspace-fence thread, the
> WSI<->client thread is certainly pulling a very big lever with a
> heavyweight transition between the two different worlds, and I like
> that the new export ioctl lets us be very clear about what exactly is
> happening under the hood. Good stuff.

Glad to hear.  If you turned that into RBs on the first three patches
in this series and all but the last patch on the Mesa MR, it'd make me
even happier. :-D

At this point, I think everyone is pretty happy with the first three
patches and the export ioctl.  In the Vulkan WSI code, it solves a
significant over-synchronization issue for ANV.  Also, the uAPI
shouldn't be controversial at all because it's identical to poll()
except that it gives you a FD you can poll on later to get the result
of the poll as it would be now.  I think if we get some Mesa reviews,
we should be able to land those.  It's import that's trickier.

> So, what gives with the import ioctl? Taking a guess at where you're
> going, the import ioctl is going to be used in QueuePresent just as
> the export ioctl is in ANI: instead of having CS flags to write into
> the resv exclusive slot or per-BO flags to always dump in exclusive,
> there's a forthcoming patch somewhere which lets drivers skip this and
> instead have common QueuePresent code dump the wait semaphore into the
> resv, so servers on the other side of an implicit-only protocol will
> synchronise their access against the fence imported as part of
> client-side QueuePresent?

Correct.  And the patch isn't forthcoming.  It already exists as the
top patch in the Mesa MR (!4037).

> That makes sense to me and is nicely symmetrical, plus it gets GPU
> drivers further out of the business of doing magic winsys/display
> synchronisation, which is good. But why enforce that imported fences
> have to go into the exclusive slot? It makes sense from the point of
> view of clients doing QueueSubmit, but I think it might preclude other
> uses for no particularly good reason.

Mostly, I was trying to limit the scope a bit.  Import is tricky and,
to be honest, I'm still not 100% sure that it's safe.  I probably
should have left RFC on this patch.

As long as we keep everything inside the kernel, there's a requirement
that any work which triggers any fence on a dma_resv waits on the
exclusive fence, if any.  Work which sets the exclusive fence has to
wait on all fences.  With the import ioctl, we can guarantee that the
fences fire in the right order by making an array fence containing the
new fence and all other fences and using that as the exclusive fence.
What we can't do, however, is ensure that the work which triggers the
fence actually blocks on ANY of the fences on the dma_resv.

Hrm... I think I've now convinced myself that importing shared fences
is no more dangerous than importing an exclusive fence because they
share the same set of problems.  Unfortunately, I've unconvinced
myself of the safety of either.  I've got to think some more....

The most convincing argument I can make to myself is that this ioctl
is like having a one-shot little queue that contains tiny little work
jobs which wait on whatever sync_file you provide, do nothing, and
then signal.  That should be safe, right?

> Certainly on X11 there's no real use for the shared slot - you get
> into difficulties with mixed client/server rendering - but at least
> Wayland and GBM are always non-destructive, so conceptually have a
> good use for being able to import fences into the shared resv. This
> goes for media and KMS access as well, if you think beyond the usecase
> of an explicit Vulkan client sending through to a dumb implicit server
> which just wants to texture.
>
> Media clients are definitely a relevant usecase, both directly with
> V4L2/VA-API, neither of which have support for explicit
> synchronisation yet and (at least for V4L2) are unlikely to do so in
> the near future, but even more with pipeline frameworks like GStreamer
> and PipeWire, which don't have fundamental awareness (they're prepared
> to deal with deep pipelines which return at arbitrary times, but once
> anything is returned, it is available for immediate use). Maybe
> open-coding CPU-side waits in these users is the best way longer term,
> but for easier interop if nothing else, being able to pull shared
> fences in seems like it could be a win ('the compositor is still
> texturing from this for now, so feel free to read back from ref
> frames, but don't scribble over it until it's finished').
>
> I'm slightly bemused that there's so much energy spent on designing
> around winsys being dumb and implicit.

I'd like to address this one as it's a comment you've made several
times.  Once you've fixed raw X11 (not just XWayland) and a new
release has been made (hah!) and is shipping in distros with said
support, then we can talk.  Sorry if that comes off as overly snarky
but that's reality that we (driver devs) are living with.  To make
things even worse, when we're in Vulkan land (as opposed to GL), we
can't tell up-front whether or not our window-system supports foo
fences and adjust accordingly.  We have to start up, begin rendering,
and only later figure out "oops, this one goes to X11".  We really
can't say things like "when running on modern Wayland, do things the
new way" because Vulkan doesn't have a concept of "running on" a
window system.

FWIW, I do have a Mesa MR somewhere which adds explicit sync for
Vulkan+Wayland when the wayland protocols are there.  I don't remember
why it didn't land.  Maybe lack of acquire fence support?  I think the
protocol issues have been fixed, so we should up-rev the requirements
as needed and land it.

> We did take a long time to roll
> out sync_file support, but that was only because we didn't quite
> understand all the nuances of why implicit sync is so difficult for
> GPU drivers on modern architectures and how it was actually a win
> compared to doing nothing; maybe we should have some kind of
> conference where we all get together and talk to each other ... ?
> Anyway, by the time we got to the cusp of rolling out bi-directional
> sync_file support, suddenly we had drm_syncobj. By the time that had
> semi-settled down and started to be rolled out, then we suddenly had
> userspace fences on the horizon. And what do we do with those?

You're not wrong....  And that's the second reason for the gymnastics
above.  Ever since Vulkan launched, we've been fumbling around trying
to figure out how to best do synchronization.  'm reasonably certain
that userspace memory fences are the future but I'm much less certain
about the path to get there.  It's been a process of patient
experimentation so far and I think we're getting closer.  Syncobj,
timeline syncobj, etc. have all been steps along that path.  I've been
hesitant to ask the window-system people to draft piles of extensions
until we're sure we've found "the one".  It's bad enough iterating in
kernel-space and userspace without bringing Wayland protocol into each
iteration step.  For that reason, one of my goals along this process
has been to try and decouple things as much as we can.

So, in summary, none of this is because I think that window systems
are dumb and implicit or for any lack of respect for the people that
work on them.  I assume that X11 will always be dumb and implicit.
(I'd love to be proven wrong!)  For Wayland (and XWayland, probably),
I assume the people are very smart and active and will implement
whatever APIs we (the driver people) need as long as they're
reasonable.  I just don't know what to ask for yet.

> We've - certainly Weston, and I'm pretty confident I speak for Simon
> on the wlroots side and Jonas for Mutter - landed on accepting that
> we're going to have to deal with timeline semaphores and
> wait-before-signal; we have a credible plan (we think) for protocol to
> deal with at least syncobj, which should conceptually extend to
> userspace fences. The biggest blocker there is the syncobj uAPI.
> Compositors aren't Vulkan clients - we don't have one thread per group
> of work, because the inter-client synchronisation becomes nightmarish
> overhead for little gain. I don't think this will ever change, because
> the balance of work is totally different between client and
> compositor.
>
> Anyway, the problem with syncobj is that the ioctl to wait for a
> sync_file to materialise for a given timeline point only allows us to
> block with a timeout; this is a non-starter, because we need something
> which fits into epoll. The most optimal case is returning a new
> eventfd or similar which signals when a given timeline point becomes
> available or signaled, but in extremis a syncobj FD becoming readable
> when any activity which would change the result of any zero-timeout
> wait on that syncobj is more or less workable.

Right.  You could call this an oversight.  Really, though, it was
because the use-cases we were interested in were ones where a wait
with a timeout was perfectly acceptable and where the extra overhead
of setting an epoll with ioctls wasn't.  It shouldn't be too hard to
wire up if that helps (cross your fingers).  But....

If we go the direction of userspace memory fences (which I think is
likely), there is no such thing as "wait for the fence to
materialize".  The work is either done or it isn't.  There is no
enforceable concept of "about to be done".  The word "enforceable" is
important there.  We could add such a concept but it'd be dependent on
the userspace client (not driver) to let us know when it's just about
ready and then we'd have to VK_ERROR_DEVICE_LOST on them or similar if
they break the contract.  Maybe possible but there's some design work
required there.  The other option is to make the compositors handle
this new way of thinking more thoroughly and eat the latency hit.

> What we do want to do though, regardless of the primitive or its
> semantics, is to only have to go through this once, not rework it all
> in six months, and have to support a bunch of diverging codepaths. So
> what is the optimal synchronisation primitive we should be aiming for
> on the winsys side? Is sync_file a good enough lowest common
> denominator, or should we do timeline-syncobj for fancy clients, in
> tandem with sync_file bolted on the side for media and ancient GPUs?
> Or are userspace fences going to give us some new primitive? And if
> so, can we please talk about those semantics now, so we don't end up
> with three synchronisation mechanisms which are all sort of but not
> really alike?

As I said above, I think we're getting close but I don't think we're there yet.

> As far as I can tell, the three relevant vendors with (more or less)
> upstream drivers here are AMD, Arm, and Intel. Arm is obviously a bit
> more up in the air as the hardware and specs aren't currently
> available to the upstream development teams, but hopefully we can
> bring them into this conversation. I think it's looking like we're
> optimising for all of the following, without leaving anyone out in the
> cold:
>
> 1. Modern userspace-fencing hardware running on a
> userspace-fencing-aware winsys, i.e. new AMD/Arm/Intel on one of the
> big three Wayland compositors which handle enough synchronisation
> logic internally that the choice of underlying
> composition/presentation API is immaterial (for which any new API is
> important)
> 2. Modern userspace-fencing hardware running on Xwayland, for which
> we'll inevitably have to type out new DRI3 synchronsiation, but
> derived purely from the Wayland protocols so it can be passed through
> quite directly, and with any mixed X11<->user buffer client
> interaction (e.g. subwindows) being penalised by a long blocking wait
> in the X server
> 3. sync_file-oriented hardware, for which we need to do ~nothing
> 4. Modern userspace-fencing hardware and APIs which need to interop
> with media units, for all four combinations of client/server
> source/sink; for some APIs like Vulkan Video synchronisation is not a
> problem, for others like VA-API/V4L2/GStreamer we're probably need
> going to live with the implicit semantics for the foreseeable future,
> which means we should do the right thing for them up front, because
> why would you even be playing games if you're not streaming them to
> Twitch at the same time? (Personally I'm much happier that no-one
> other than my friends who already know I'm terrible can see me playing
> CoD, but y'know, kids these days ...)
>
> The fifth case I've left out is clients who want to smash Vulkan
> content directly into the display. For games and Kodi-like UI I'm just
> going to ignore this, because (maybe I'm biased, but) using KMS
> directly is difficult enough that you shouldn't do it and just use a
> winsys because we've spent a very long time dealing with these
> problems for you. The remaining usecase there is XR, but their uses
> are very different, and OpenXR already deals with a _lot_ of this for
> you, with the runtimes having sufficiently sophisticated
> synchronisation internally that whatever we come up with won't be
> onerous for them to implement. Either way, integration with KMS/GBM
> has the same problem as Wayland, in that unless you fully encapsulate
> it in something like VK_KHR_display, you don't get to throw a thread
> under the bus to do delayed submit, because you need to actually
> return something to the caller.

You're missing a use-case:  Modern userspace-fencing hardware running
on bare X11.  I don't know that we should optimize for this case, so
to speak, but it has to work non-terribly.  Also, as I alluded to
above, I really don't want to be maintaining two drivers forever: One
for X11 and ancient Wayland and one for modern Wayland.  We need to be
able to modernize the driver and still support the old window-systems.
Unless you can promise me that X11 and KDE/Wayland will either go away
or else get modernized, I need a fall-back plan.  And even if you make
me said promise, I'm not going to believe you. :-P  8-9 years ago, I
was one of the people making those promises.  Now I'm writing X11
winsys code for drivers.  And... now I'm re-thinking some of my life
choices....

> Ultimately, I think I'm leaning towards agreeing with Christian that I
> would like to see a good holistic model for how this works in a
> variety of usecases before we progress new uAPI, but also to agreeing
> with you and Dan in that how amdgpu currently implements things is
> currently objectively very wrong (despite the motivations for having
> implemented it that way).
>
> If there are any usecases I've missed then I'm all ears, but else I
> think we should take this forward by working with
> Vulkan/EGL/Wayland/X11/media/KMS and coming up with realistic
> skeletons for end-to-end synchronisation through those usecases. It's
> clear that this never happened for syncobj, because it's just not
> usable as a primitive in any compositor which exists today: let's make
> sure we don't get into the same trap again. If we can do this over
> email/GitLab then that's great, but if not, maybe we need to do a kind
> of mini-XDC with some kind of virtual whiteboard we can all scribble
> over.

I think what we're looking at is roughly three steps, the first two of
which are mostly there on the Wayland side:

 1. Implicit sync.  We know what this one is.  glFlush/vkQueueSubmit
on the one side, start texturing on the other, and it all works.

 2. Immutable SW fences, i.e. sync_file.  This is where we have a
fence object that gets returned from the flush/submit and can be
passed into the texture op to provide a dependency.  Syncobj may be
useful here but only as a container.  If a sync_file is a dma_fence*,
a syncobj should be thought of as a dma_fence**.  This may be useful
if we want to retrofit sync_file into X11 where the current DRI3
explicit sync stuff is based on creating an object and then re-using
it for every present.

 3. Userspace memory fences.

Note that timeline syncobj is NOT in that list.  IMO, all the "wait
for submit" stuff is an implementation detail we needed in order to
get the timeline semantics on top of immutable SW fences.  Under the
hood it's all dma_fence; this just gives us a shareable container so
we can implement VK_KHR_timeline_semaphore with sharing.  I really
don't want to make Wayland protocol around it if memory fences are the
final solution.


> (As a coda to this, I'm pretty sure I understand the subtleties of the
> memory fences for relocation/shootdown, but it would be _really_ good
> to have a coherent description everyone agrees on written down
> somewhere, so people can understand the issues without having to read
> 250 emails with people at loggerheads.)

Let me give it a try.  I define a userspace memory fence as follows:
 - The fence object is fundamentally a bit of mappable gpu-accessible
memory which stores a 64-bit counter value which is used as a
timeline.  (On Windows, they require it to live in system memory.)
 - For sharable memory fences, each one probably has to go in its own page. :-(
 - The value is initialized to 0.
 - To signal the fence, someone (GPU or CPU) writes a new 64-bit value.
 - Waits on the fence are waits for it to be >= some value.

Depending on circumstances, the wait may be a 32-bit comparison and
may be >= with wrap-around.  For the purposes of window-system
protocol, I think we can assume 64-bit >= with no wrap-around.

There are a few very important points worth noting about them, however:
 - No one except the userspace client (not driver!) has any idea
when/if a value will be signaled
 - The value may never be signaled
 - Someone may submit a wait before someone submits a signal; we have
to deal with that
 - There is no concept of "about to be signaled"
 - For the kernel/firmware GPU scheduler handling waits, this means it
just keeps trying to run work and hopes the wait eventually unblocks.
It also means we need to totally decouple kernel synchronization for
memory management purposes from synchronization for work scheduling.
 - For a compositor, I'm still not 100% sure what this means.  TBD, I think.

There are some ways to work around some of these issues.  Windows has
a few tricks which we might be able to steal if we want.

Why would anyone want such a horrid thing?  Application developers
absolutely love them.  They can write massively multi-threaded apps
with piles of work queues that require very little cross-thread
synchronization and the GPU scheduler sorts it all out for them in the
end.  If you're a 3D game engine developer, this timeline model is
very powerful.  If you're a driver or window-system developer, you
really have to just embrace the lack of knowledge and trust apps.

Oof... That got long.  I hope it was informative.

--Jason


> Cheers,
> Daniel
>
>
>
>
>
>
>
>
> > When we got to
> > insert the RW fence, the actual fence we set as the new exclusive fence
> > is a combination of the sync_file provided by the user and all the other
> > fences on the dma_resv.  This ensures that the newly added exclusive
> > fence will never signal before the old one would have and ensures that
> > we don't break any dma_resv contracts.  We require userspace to specify
> > RW in the flags for symmetry with the export ioctl and in case we ever
> > want to support read fences in the future.
> >
> > There is one downside here that's worth documenting:  If two clients
> > writing to the same dma-buf using this API race with each other, their
> > actions on the dma-buf may happen in parallel or in an undefined order.
> > Both with and without this API, the pattern is the same:  Collect all
> > the fences on dma-buf, submit work which depends on said fences, and
> > then set a new exclusive (write) fence on the dma-buf which depends on
> > said work.  The difference is that, when it's all handled by the GPU
> > driver's submit ioctl, the three operations happen atomically under the
> > dma_resv lock.  If two userspace submits race, one will happen before
> > the other.  You aren't guaranteed which but you are guaranteed that
> > they're strictly ordered.  If userspace manages the fences itself, then
> > these three operations happen separately and the two render operations
> > may happen genuinely in parallel or get interleaved.  However, this is a
> > case of userspace racing with itself.  As long as we ensure userspace
> > can't back the kernel into a corner, it should be fine.
> >
> > v2 (Jason Ekstrand):
> >  - Use a wrapper dma_fence_array of all fences including the new one
> >    when importing an exclusive fence.
> >
> > v3 (Jason Ekstrand):
> >  - Lock around setting shared fences as well as exclusive
> >  - Mark SIGNAL_SYNC_FILE as a read-write ioctl.
> >  - Initialize ret to 0 in dma_buf_wait_sync_file
> >
> > v4 (Jason Ekstrand):
> >  - Use the new dma_resv_get_singleton helper
> >
> > v5 (Jason Ekstrand):
> >  - Rename the IOCTLs to import/export rather than wait/signal
> >  - Drop the WRITE flag and always get/set the exclusive fence
> >
> > v5 (Jason Ekstrand):
> >  - Split import and export into separate patches
> >  - New commit message
> >
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/dma-buf/dma-buf.c    | 32 ++++++++++++++++++++++++++++++++
> >  include/uapi/linux/dma-buf.h |  1 +
> >  2 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 7679562b57bfc..c9d6b9195c00c 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -417,6 +417,36 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
> >         put_unused_fd(fd);
> >         return ret;
> >  }
> > +
> > +static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
> > +                                    const void __user *user_data)
> > +{
> > +       struct dma_buf_sync_file arg;
> > +       struct dma_fence *fence, *singleton = NULL;
> > +       int ret = 0;
> > +
> > +       if (copy_from_user(&arg, user_data, sizeof(arg)))
> > +               return -EFAULT;
> > +
> > +       if (arg.flags != DMA_BUF_SYNC_RW)
> > +               return -EINVAL;
> > +
> > +       fence = sync_file_get_fence(arg.fd);
> > +       if (!fence)
> > +               return -EINVAL;
> > +
> > +       dma_resv_lock(dmabuf->resv, NULL);
> > +
> > +       ret = dma_resv_get_singleton_rcu(dmabuf->resv, fence, &singleton);
> > +       if (!ret && singleton)
> > +               dma_resv_add_excl_fence(dmabuf->resv, singleton);
> > +
> > +       dma_resv_unlock(dmabuf->resv);
> > +
> > +       dma_fence_put(fence);
> > +
> > +       return ret;
> > +}
> >  #endif
> >
> >  static long dma_buf_ioctl(struct file *file,
> > @@ -465,6 +495,8 @@ static long dma_buf_ioctl(struct file *file,
> >  #if IS_ENABLED(CONFIG_SYNC_FILE)
> >         case DMA_BUF_IOCTL_EXPORT_SYNC_FILE:
> >                 return dma_buf_export_sync_file(dmabuf, (void __user *)arg);
> > +       case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
> > +               return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
> >  #endif
> >
> >         default:
> > diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> > index f902cadcbdb56..75fdde4800267 100644
> > --- a/include/uapi/linux/dma-buf.h
> > +++ b/include/uapi/linux/dma-buf.h
> > @@ -70,5 +70,6 @@ struct dma_buf_sync_file {
> >  #define DMA_BUF_SET_NAME_A     _IOW(DMA_BUF_BASE, 1, u32)
> >  #define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, u64)
> >  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct dma_buf_sync_file)
> > +#define DMA_BUF_IOCTL_IMPORT_SYNC_FILE _IOW(DMA_BUF_BASE, 3, struct dma_buf_sync)
> >
> >  #endif
> > --
> > 2.31.1
> >
