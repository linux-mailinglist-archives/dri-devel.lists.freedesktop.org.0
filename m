Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217AD3915B8
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DCD6EC7F;
	Wed, 26 May 2021 11:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A55A96EC7F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:09:08 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so3146031wmc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 04:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qcZDEzIvoGxOE7q1GNtkkEcDa3xQviXvykYe9dlXqXQ=;
 b=NpHmcUo1XiPy07kb5ug5JEdQO/fLjw26JRU2febLQ0OZRjttlPG9urk35AU6V5Zf39
 M8pyPYSzU7kPydw8Kmj8MJZYVzdmkANVHxm0HvkOa4fm/DJt/e78ixKDXUjGJmBLwiIY
 fNz9bZ5fZE3RZRe0muHZFzQmHJz6nJVE+wgDLsXcW4+th6JnwQoWMRRptuId3qtZRq7x
 leoNXBzKqnT2DBHREbaHVjX5PFNb+YCPZANnIKbrxJn/I4XRy0sdkMEHIFU29ZBmthgr
 kiLAVlPI7RL3ZWRgfRrxhsHodbNifGIoycwcsZQMDZy6nbOYrKre7W4nHLBpICFEb2kF
 lHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qcZDEzIvoGxOE7q1GNtkkEcDa3xQviXvykYe9dlXqXQ=;
 b=oCgbkQNjYfZj/pFDxOby+zQrSgnZvTAdNdC6PNjakKL9tSzfM0vmI8V5QCSTpTRH4B
 ioKC9JJsR7cmNNutHrgiv6IVe80EC06wgsVDiMpBad9nBkbBszfRJjLgVXsIJr1Tgtec
 flPF6Jq7KUA4dUz7FoMvH5OS6iZ7f41V6la+NzVcetuDa0aF/9bD5IwMaa6WZm+zSawM
 z67pkakwumLQNkh0PzV5/Poj2USH8aXmy0bM6ntH8rUoY0Dgquuoz0uUEl/geR0C+/c3
 CjnlMtz1If+Zot1JMfh6JcCDI3V4Jqk/mgQofuoydt9xGGHEKOeblvuXpOMQGmpp5AEz
 sg3g==
X-Gm-Message-State: AOAM530zySC8/BsffrXGFefb7a8HGeiD1f9TL+iC9KYyFGzICj4cLZFn
 72i0/iVJcQaA1JZDg/fyvc2/4eWmpLBnePjvc8vvmw==
X-Google-Smtp-Source: ABdhPJx1eYt5QJIbZCL6poZCtoQZ58JxXSKUhNz0YCgrh+FqtuGhi773j9vdwzCdUacxq8RzCSK3sEjeoQWe0UkofJI=
X-Received: by 2002:a7b:cd04:: with SMTP id f4mr29343958wmj.84.1622027346912; 
 Wed, 26 May 2021 04:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
In-Reply-To: <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 26 May 2021 12:08:54 +0100
Message-ID: <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
To: Jason Ekstrand <jason@jlekstrand.net>
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

Hey,

On Mon, 24 May 2021 at 18:11, Jason Ekstrand <jason@jlekstrand.net> wrote:
> On Sat, May 22, 2021 at 3:05 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > So far, so good. I really like both your series up until this
> > narrative point; as I was saying in the userspace-fence thread, the
> > WSI<->client thread is certainly pulling a very big lever with a
> > heavyweight transition between the two different worlds, and I like
> > that the new export ioctl lets us be very clear about what exactly is
> > happening under the hood. Good stuff.
>
> Glad to hear.  If you turned that into RBs on the first three patches
> in this series and all but the last patch on the Mesa MR, it'd make me
> even happier. :-D
>
> At this point, I think everyone is pretty happy with the first three
> patches and the export ioctl.  In the Vulkan WSI code, it solves a
> significant over-synchronization issue for ANV.  Also, the uAPI
> shouldn't be controversial at all because it's identical to poll()
> except that it gives you a FD you can poll on later to get the result
> of the poll as it would be now.  I think if we get some Mesa reviews,
> we should be able to land those.  It's import that's trickier.

Agree. Have a few more burning things on my list (not least fd.o infra
this week) but will get to it so we can land.

(Clarified on IRC that my description above was accurate to the best
of our shared understanding, so we're all on the same page here.)

> > That makes sense to me and is nicely symmetrical, plus it gets GPU
> > drivers further out of the business of doing magic winsys/display
> > synchronisation, which is good. But why enforce that imported fences
> > have to go into the exclusive slot? It makes sense from the point of
> > view of clients doing QueueSubmit, but I think it might preclude other
> > uses for no particularly good reason.
>
> Mostly, I was trying to limit the scope a bit.  Import is tricky and,
> to be honest, I'm still not 100% sure that it's safe.  I probably
> should have left RFC on this patch.
>
> As long as we keep everything inside the kernel, there's a requirement
> that any work which triggers any fence on a dma_resv waits on the
> exclusive fence, if any.  Work which sets the exclusive fence has to
> wait on all fences.  With the import ioctl, we can guarantee that the
> fences fire in the right order by making an array fence containing the
> new fence and all other fences and using that as the exclusive fence.
> What we can't do, however, is ensure that the work which triggers the
> fence actually blocks on ANY of the fences on the dma_resv.
>
> Hrm... I think I've now convinced myself that importing shared fences
> is no more dangerous than importing an exclusive fence because they
> share the same set of problems.  Unfortunately, I've unconvinced
> myself of the safety of either.  I've got to think some more....
>
> The most convincing argument I can make to myself is that this ioctl
> is like having a one-shot little queue that contains tiny little work
> jobs which wait on whatever sync_file you provide, do nothing, and
> then signal.  That should be safe, right?

Yeah, I don't think there's any difference between shared and
exclusive wrt safety. The difference lies in, well, exclusive putting
a hard serialisation barrier between everything which comes before and
everything that comes after, and shared being more relaxed to allow
for reads to retire in parallel.

As said below, I think there's a good argument for the latter once you
get out of the very straightforward uses. One of the arguments for
these ioctls is to eliminate oversync, but then the import ioctl
mandates oversync in the case where the consumer only does
non-destructive reads - which is the case for the vast majority of
users!

> > Certainly on X11 there's no real use for the shared slot - you get
> > into difficulties with mixed client/server rendering - but at least
> > Wayland and GBM are always non-destructive, so conceptually have a
> > good use for being able to import fences into the shared resv. This
> > goes for media and KMS access as well, if you think beyond the usecase
> > of an explicit Vulkan client sending through to a dumb implicit server
> > which just wants to texture.
> >
> > Media clients are definitely a relevant usecase, both directly with
> > V4L2/VA-API, neither of which have support for explicit
> > synchronisation yet and (at least for V4L2) are unlikely to do so in
> > the near future, but even more with pipeline frameworks like GStreamer
> > and PipeWire, which don't have fundamental awareness (they're prepared
> > to deal with deep pipelines which return at arbitrary times, but once
> > anything is returned, it is available for immediate use). Maybe
> > open-coding CPU-side waits in these users is the best way longer term,
> > but for easier interop if nothing else, being able to pull shared
> > fences in seems like it could be a win ('the compositor is still
> > texturing from this for now, so feel free to read back from ref
> > frames, but don't scribble over it until it's finished').
> >
> > I'm slightly bemused that there's so much energy spent on designing
> > around winsys being dumb and implicit.
>
> I'd like to address this one as it's a comment you've made several
> times.  Once you've fixed raw X11 (not just XWayland) and a new
> release has been made (hah!) and is shipping in distros with said
> support, then we can talk.  Sorry if that comes off as overly snarky
> but that's reality that we (driver devs) are living with.  To make
> things even worse, when we're in Vulkan land (as opposed to GL), we
> can't tell up-front whether or not our window-system supports foo
> fences and adjust accordingly.  We have to start up, begin rendering,
> and only later figure out "oops, this one goes to X11".  We really
> can't say things like "when running on modern Wayland, do things the
> new way" because Vulkan doesn't have a concept of "running on" a
> window system.

Hey, no offence taken, and even if there was, there's no point denying
the reality that we don't still have Wayland absolutely everywhere,
and even when we do, there's still a Streams-sized elephant in the
room that no-one wants to talk about.

Ultimately though, there will always be two codepaths. Xorg (as
opposed to Xwayland) is currently unmaintained, and I expect it to
remain so forever. The last times we tried to plumb synchronisation
through to native-Xorg, it collapsed in conflicting requests for
rewriting the presentation mechanism (which very few people understand
and even fewer people can make work reliably), and I don't see that
changing any time soon. Plus the single biggest remaining use for
native-Xorg is that it implements tearflips by blitting to a single
internal frontbuffer which is currently being scanned out, which is
going to be ... difficult ... to square with the goal of actually
synchronising things.

What I mean though is that I don't think it makes sense to have three
design points.

Previously, the only effort put into explicit synchronisation on the
winsys side was using it was a means to surface the timings for both
tracing and being able to calibrate compositor repaints. Given that we
need to support interop with the implicit world forever, and given
that there was no explicit interaction with the implicit resv slots
(solved by this new uAPI), and given that the sync_file vs.
drm_syncobj vs. ?? userspace fence story wasn't clear, it didn't seem
like a practical benefit to sink time into supporting it, just that it
ticked a 'yep we're doing things explicitly' box, which was not
practically useful since EGL doesn't let you opt out of implicit
semantics anyway.

Now with the details having come out of AMD/Arm/Intel about future
gens, and the driver-side pain being properly understood, as well as
the new uAPI actually giving us clear benefit, there's a good reason
to work on it. So we'll do that on the winsys side, and support the
new explicitly-managed-implicit-slot world, and everyone's lives will
be better. Which gives us two design points: unaware implicit-only
users (Xorg, old Wayland, old GPU, media), and fully-aware
extremely-explicit users (Mutter, Weston, wlroots, new GPU).

Having the new uAPI makes the transitions clear and explicit, as
opposed to the previous halfway house where we'd dutifully import and
export sync_files, but the kernel would just do the exact same resv
bookkeeping anyway as if we were implicit.

> FWIW, I do have a Mesa MR somewhere which adds explicit sync for
> Vulkan+Wayland when the wayland protocols are there.  I don't remember
> why it didn't land.  Maybe lack of acquire fence support?  I think the
> protocol issues have been fixed, so we should up-rev the requirements
> as needed and land it.

Depends what you mean by acquire-fence? Assuming you mean ANI
(compositor release -> client reuse), we never hooked that up in
Weston because we were waiting for things to settle down with e.g.
syncobj, but I guess we've just written ourselves into a catch-22
there. Something to fix. In the meantime we do have the
timeline-syncobj protocol typed out, but it's not useful to us until
it works with epoll.

> > We did take a long time to roll
> > out sync_file support, but that was only because we didn't quite
> > understand all the nuances of why implicit sync is so difficult for
> > GPU drivers on modern architectures and how it was actually a win
> > compared to doing nothing; maybe we should have some kind of
> > conference where we all get together and talk to each other ... ?
> > Anyway, by the time we got to the cusp of rolling out bi-directional
> > sync_file support, suddenly we had drm_syncobj. By the time that had
> > semi-settled down and started to be rolled out, then we suddenly had
> > userspace fences on the horizon. And what do we do with those?
>
> You're not wrong....  And that's the second reason for the gymnastics
> above.  Ever since Vulkan launched, we've been fumbling around trying
> to figure out how to best do synchronization.  'm reasonably certain
> that userspace memory fences are the future but I'm much less certain
> about the path to get there.  It's been a process of patient
> experimentation so far and I think we're getting closer.  Syncobj,
> timeline syncobj, etc. have all been steps along that path.  I've been
> hesitant to ask the window-system people to draft piles of extensions
> until we're sure we've found "the one".  It's bad enough iterating in
> kernel-space and userspace without bringing Wayland protocol into each
> iteration step.  For that reason, one of my goals along this process
> has been to try and decouple things as much as we can.
>
> So, in summary, none of this is because I think that window systems
> are dumb and implicit or for any lack of respect for the people that
> work on them.  I assume that X11 will always be dumb and implicit.
> (I'd love to be proven wrong!)  For Wayland (and XWayland, probably),
> I assume the people are very smart and active and will implement
> whatever APIs we (the driver people) need as long as they're
> reasonable.  I just don't know what to ask for yet.

Typing out timeline-syncobj support gets us like 90% of the way to
userspace fences. At the moment, the protocol only has the concept of
fully-materialised fences which will definitely retire at some point;
typing out timeline-syncobj gives us the two concepts of syncobj/val
and not-yet-materialised fences (i.e. wait-before-signal).

The former is just typing, whereas the latter is a fairly violent
compositor-internal change to decouple the scene graph across contexts
- stalling your desktop for a second because a fence takes too long to
retire is not nice, but stalling your desktop infinitely because the
client gave you an infinite WBS is less acceptable.

Once we've done that, userspace fence support is slightly annoying to
type out (new polling mechanism, compositor balancing burning CPU
polling excessively vs. getting your VRR frames in as early as
possible), but the protocol sed job and polling switch-up is nothing
compared to being WBS-aware.

So I think it does make perfect sense for us to get typing on
timeline-syncobj, and then all our compositors are 95% of the way to
being ready for userspace fences.

> > We've - certainly Weston, and I'm pretty confident I speak for Simon
> > on the wlroots side and Jonas for Mutter - landed on accepting that
> > we're going to have to deal with timeline semaphores and
> > wait-before-signal; we have a credible plan (we think) for protocol to
> > deal with at least syncobj, which should conceptually extend to
> > userspace fences. The biggest blocker there is the syncobj uAPI.
> > Compositors aren't Vulkan clients - we don't have one thread per group
> > of work, because the inter-client synchronisation becomes nightmarish
> > overhead for little gain. I don't think this will ever change, because
> > the balance of work is totally different between client and
> > compositor.
> >
> > Anyway, the problem with syncobj is that the ioctl to wait for a
> > sync_file to materialise for a given timeline point only allows us to
> > block with a timeout; this is a non-starter, because we need something
> > which fits into epoll. The most optimal case is returning a new
> > eventfd or similar which signals when a given timeline point becomes
> > available or signaled, but in extremis a syncobj FD becoming readable
> > when any activity which would change the result of any zero-timeout
> > wait on that syncobj is more or less workable.
>
> Right.  You could call this an oversight.  Really, though, it was
> because the use-cases we were interested in were ones where a wait
> with a timeout was perfectly acceptable and where the extra overhead
> of setting an epoll with ioctls wasn't.  It shouldn't be too hard to
> wire up if that helps (cross your fingers).  But....
>
> If we go the direction of userspace memory fences (which I think is
> likely), there is no such thing as "wait for the fence to
> materialize".  The work is either done or it isn't.  There is no
> enforceable concept of "about to be done".  The word "enforceable" is
> important there.  We could add such a concept but it'd be dependent on
> the userspace client (not driver) to let us know when it's just about
> ready and then we'd have to VK_ERROR_DEVICE_LOST on them or similar if
> they break the contract.  Maybe possible but there's some design work
> required there.  The other option is to make the compositors handle
> this new way of thinking more thoroughly and eat the latency hit.

There's no good answer whatsoever to combining pure userspace fences
and VRR, because either you burn your CPU polling at 200Hz, or you're
late getting frames to screen.

But again, once we're timeline-syncobj-aware, we're pretty much
already userspace-fence aware. Compositors already have very separate
timed points for client buffer submit (arbitrary time), to scheduling
output repaint (as needed), to launching output repaint (negative
delta from deadline), to frame deadline (fixed by hardware, VRR
notwithstanding).

Timeline syncobjs hurt because we have to introduce an additional
stage where we check if a client's fence has materialised; the surface
tree has to live in limbo until they have, with the scene-graph update
happening when they have. Userspace fencing just switches the trigger
from 'epoll tells us the fence is materialised and/or signalled' to
'epoll tells us it's time to wake up and check the fence'. Again, just
tedious typing, not actually conceptually difficult.

> > As far as I can tell, the three relevant vendors with (more or less)
> > upstream drivers here are AMD, Arm, and Intel. Arm is obviously a bit
> > more up in the air as the hardware and specs aren't currently
> > available to the upstream development teams, but hopefully we can
> > bring them into this conversation. I think it's looking like we're
> > optimising for all of the following, without leaving anyone out in the
> > cold:
> >
> > [...]
>
> You're missing a use-case:  Modern userspace-fencing hardware running
> on bare X11.  I don't know that we should optimize for this case, so
> to speak, but it has to work non-terribly.  Also, as I alluded to
> above, I really don't want to be maintaining two drivers forever: One
> for X11 and ancient Wayland and one for modern Wayland.  We need to be
> able to modernize the driver and still support the old window-systems.
> Unless you can promise me that X11 and KDE/Wayland will either go away
> or else get modernized, I need a fall-back plan.  And even if you make
> me said promise, I'm not going to believe you. :-P  8-9 years ago, I
> was one of the people making those promises.  Now I'm writing X11
> winsys code for drivers.  And... now I'm re-thinking some of my life
> choices....

KWinFT is based on wlroots, so it gets everything for free.

You're right about X11, but weirdly this is the one case that's really
easy. X11 WSI already throws a client submit thread under the bus for
asynchronous presentation. This invalidates every possible guarantee:
you can't do vkQueuePresentKHR() followed by native X11 rendering,
because the queue may not have flushed out to the server. So just do
the same thing: use the present thread that already exists, but make
it spin on completion instead, and then the server doesn't need to do
any synchronisation on QueuePresent, just on ANI. And you don't get
eaten by Xorg grues.

> > Ultimately, I think I'm leaning towards agreeing with Christian that I
> > would like to see a good holistic model for how this works in a
> > variety of usecases before we progress new uAPI, but also to agreeing
> > with you and Dan in that how amdgpu currently implements things is
> > currently objectively very wrong (despite the motivations for having
> > implemented it that way).
> >
> > If there are any usecases I've missed then I'm all ears, but else I
> > think we should take this forward by working with
> > Vulkan/EGL/Wayland/X11/media/KMS and coming up with realistic
> > skeletons for end-to-end synchronisation through those usecases. It's
> > clear that this never happened for syncobj, because it's just not
> > usable as a primitive in any compositor which exists today: let's make
> > sure we don't get into the same trap again. If we can do this over
> > email/GitLab then that's great, but if not, maybe we need to do a kind
> > of mini-XDC with some kind of virtual whiteboard we can all scribble
> > over.
>
> I think what we're looking at is roughly three steps, the first two of
> which are mostly there on the Wayland side:
>
>  1. Implicit sync.  We know what this one is.  glFlush/vkQueueSubmit
> on the one side, start texturing on the other, and it all works.

Done.

>  2. Immutable SW fences, i.e. sync_file.  This is where we have a
> fence object that gets returned from the flush/submit and can be
> passed into the texture op to provide a dependency.  Syncobj may be
> useful here but only as a container.  If a sync_file is a dma_fence*,
> a syncobj should be thought of as a dma_fence**.  This may be useful
> if we want to retrofit sync_file into X11 where the current DRI3
> explicit sync stuff is based on creating an object and then re-using
> it for every present.

Mostly done for Wayland, but as above we never bothered typing out the
sync_file return path in any implementation.

>  3. Userspace memory fences.
>
> Note that timeline syncobj is NOT in that list.  IMO, all the "wait
> for submit" stuff is an implementation detail we needed in order to
> get the timeline semantics on top of immutable SW fences.  Under the
> hood it's all dma_fence; this just gives us a shareable container so
> we can implement VK_KHR_timeline_semaphore with sharing.  I really
> don't want to make Wayland protocol around it if memory fences are the
> final solution.

Typing out the Wayland protocol isn't the hard bit. If we just need to
copy and sed syncobj to weirdsyncobj, no problem really, and it gives
us a six-month head start on painful compositor-internal surgery
whilst we work on common infrastructure to ship userspace fences
around (mappable dmabuf with the sync bracketing? FD where every
read() gives you the current value? memfd? other?).

> > (As a coda to this, I'm pretty sure I understand the subtleties of the
> > memory fences for relocation/shootdown, but it would be _really_ good
> > to have a coherent description everyone agrees on written down
> > somewhere, so people can understand the issues without having to read
> > 250 emails with people at loggerheads.)
>
> Let me give it a try.  I define a userspace memory fence as follows:
>  [...]

Thanks, and I completely agree with your description. What I meant
though was the 'relocation fences' Christian has for amdgpu, and Intel
semi-has with ttm_bo->moving. This is semi-orthogonal, but
understanding how it's supposed to interact is pretty critical I
think.

> There are some ways to work around some of these issues.  Windows has
> a few tricks which we might be able to steal if we want.
>
> Why would anyone want such a horrid thing?  Application developers
> absolutely love them.  They can write massively multi-threaded apps
> with piles of work queues that require very little cross-thread
> synchronization and the GPU scheduler sorts it all out for them in the
> end.  If you're a 3D game engine developer, this timeline model is
> very powerful.  If you're a driver or window-system developer, you
> really have to just embrace the lack of knowledge and trust apps.
>
> Oof... That got long.  I hope it was informative.

It was! Thanks for the write-up.

Cheers,
Daniel
