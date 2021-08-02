Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DF43DD0CB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 08:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89036E02B;
	Mon,  2 Aug 2021 06:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE916E02B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 06:51:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="298987469"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="298987469"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2021 23:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; d="scan'208";a="418590026"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 01 Aug 2021 23:51:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 1 Aug 2021 23:51:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Sun, 1 Aug 2021 23:51:33 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.010;
 Sun, 1 Aug 2021 23:51:33 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Gerd
 Hoffmann" <kraxel@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>, "Simon
 Ser" <contact@emersion.fr>, =?iso-8859-1?Q?Michel_D=E4nzer?=
 <michel@daenzer.net>, "Zhang, Tina" <tina.zhang@intel.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, "Singh, Satyeshwar" <satyeshwar.singh@intel.com>
Subject: RE: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Topic: [RFC v1 0/4] drm: Add support for DRM_CAP_DEFERRED_OUT_FENCE
 capability
Thread-Index: AQHXhFPnN1B4zkQxMkK/V9zRY5/TqKtbxyyAgABF0uA=
Date: Mon, 2 Aug 2021 06:51:33 +0000
Message-ID: <612fd31a51384cb28ac6da9db3e840ca@intel.com>
References: <20210729081659.2255499-1-vivek.kasireddy@intel.com>
 <YQPTo0D5SZfX44dn@phenom.ffwll.local>
In-Reply-To: <YQPTo0D5SZfX44dn@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

>=20
> On Thu, Jul 29, 2021 at 01:16:55AM -0700, Vivek Kasireddy wrote:
> > By separating the OUT_FENCE signalling from pageflip completion allows
> > a Guest compositor to start a new repaint cycle with a new buffer
> > instead of waiting for the old buffer to be free.
> >
> > This work is based on the idea/suggestion from Simon and Pekka.
> >
> > This capability can be a solution for this issue:
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/514
> >
> > Corresponding Weston MR:
> > https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/668
>=20
> Uh I kinda wanted to discuss this a bit more before we jump into typing
> code, but well I guess not that much work yet.
[Kasireddy, Vivek] Right, it wasn't a lot of work :)

>=20
> So maybe I'm not understanding the problem, but I think the fundamental
> underlying issue is that with KMS you can have at most 2 buffers
> in-flight, due to our queue depth limit of 1 pending flip.
[Kasireddy, Vivek] Let me summarize the problem again from the perspective =
of
both the Host (Weston) and Guest (Weston) compositors assuming a refresh-ra=
te
of 60 -- which implies the Vblank/Vsync is generated every ~16.66 ms.
Host compositor:
- After a pageflip completion event, it starts its next repaint cycle by wa=
iting for 9 ms
and then submits the atomic commit and at the tail end of its cycle sends a=
 frame callback
event to all its clients (who registered and submitted frames) indicating t=
o them to=20
start their next redraw  -- giving them at-least ~16 ms to submit a new fra=
me to be
included in its next repaint. Why a configurable 9 ms delay is needed is ex=
plained
in Pekka's blog post here:
https://ppaalanen.blogspot.com/2015/02/weston-repaint-scheduling.html

- It'll send a wl_buffer.release event for a client submitted previous buff=
er only
when the client has submitted a new buffer and:
a) When it hasn't started its repaint cycle yet OR
b) When it clears its old state after it gets a pageflip completion event -=
- if it had
flipped the client's buffer onto a hardware plane.

Guest compositor:
- After a pageflip completion is sent by Guest KMS, it takes about 10-12 ms=
 for the=20
Guest compositor to submit a new atomic commit. This time of 10-12 ms inclu=
des the
9 ms wait -- just like the Host compositor -- for its clients to submit new=
 buffers.
- When it gets a pageflip completion, it assumes that the previously submit=
ted buffer
is free for re-use and uses it again -- resulting in the usage of only 2 ou=
t of a maximum
of 4 backbuffers included as part of the Mesa GBM surface implementation.

Guest KMS/Virtio-gpu/Qemu Wayland UI:
- Because no_vblank=3Dtrue for Guest KMS and since the vblank event (which =
also serves
as the pageflip completion event for user-space) is sent right away after a=
tomic commit,
as Gerd said, we use an internal dma-fence to block/wait the Guest KMS unti=
l we know for
sure that the Host is completely done using the buffer. To ensure this, we =
signal the dma-fence
only after the Host compositor sends a wl_buffer.release event or an equiva=
lent signal.

The goal:
- Maintain full framerate even when the Guest scanout FB is flipped onto a =
hardware plane
on the Host -- regardless of either compositor's scheduling policy -- witho=
ut making any
copies and ensuring that both Host and Guest are not accessing the buffer a=
t the same time.

The problem:
- If the Host compositor flips the client's buffer (in this case Guest comp=
ositor's buffer)=20
onto a hardware plane, then it can send a wl_buffer.release event for the p=
revious buffer
only after it gets a pageflip completion. And, if the Guest compositor take=
s 10-12 ms to
submit a new buffer and given the fact that the Host compositor waits only =
for 9 ms, the
Guest compositor will miss the Host's repaint cycle resulting in halved fra=
me-rate.

The solution:
- To ensure full framerate, the Guest compositor has to start it's repaint =
cycle (including
the 9 ms wait) when the Host compositor sends the frame callback event to i=
ts clients.
In order for this to happen, the dma-fence that the Guest KMS waits on -- b=
efore sending
pageflip completion -- cannot be tied to a wl_buffer.release event. This me=
ans that, the
Guest compositor has to be forced to use a new buffer for its next repaint =
cycle when it
gets a pageflip completion.
- The Weston MR I linked above does this by getting an out_fence fd and tak=
ing a reference
on all the FBs included in the atomic commit forcing the compositor to use =
new FBs for its
next repaint cycle. It releases the references when the out_fence is signal=
led later when
the Host compositor sends a wl_buffer.release event.

>=20
> Unfortunately that means for virtual hw where it takes a few more
> steps/vblanks until the framebuffer actually shows up on screen and is
> scanned out, we suffer deeply. The usual fix for that is to drop the
> latency and increase throughput, and have more buffers in-flight. Which
> this patch tries to do.
>=20
> Now I think where we go wrong here is that we're trying to hack this up b=
y
> defining different semantics for the out-fence and for the drm-event. Imo
> that's wrong, they're both meant to show eactly the same thing:
> - when is the new frame actually visible to the user (as in, eyeballs in =
a
>   human head, preferrably, not the time when we've handed the buffer off
>   to the virtual hw)
> - when is the previous buffer no longer being used by the scanout hw
[Kasireddy, Vivek] Right, they both mean the same thing but I think using b=
oth
at the same time would be redundant in the case of Weston. That's why I am =
trying
to repurpose the usage of out_fence in this case by introducing a new capab=
ility
that may not be relevant for bare-metal KMS drivers but would be useful for
virtual KMS drivers.

>=20
> We do cheat a bit right now in so far that we assume they're both the
> same, as in, panel-side latency is currently the compositor's problem to
> figure out.
>=20
> So for virtual hw I think the timestamp and even completion really need t=
o
> happen only when the buffer has been pushed through the entire
> virtualization chain, i.e. ideally we get the timestamp from the kms
> driver from the host side. Currently that's not done, so this is most
> likely quite broken already (virtio relies on the no-vblank auto event
> sending, which definitely doesn't wait for anything, or I'm completely
> missing something).
[Kasireddy, Vivek] You are right; virtio_gpu does use the no_vblank auto ev=
ent but
as I mentioned above we do use an internal dma-fence to wait until the subm=
itted
buffer is no longer used by the Host. In other words, we wait (in update_pl=
anes hook)
until we get an appropriate signal from the Host to proceed to make sure th=
at we are
not rendering faster than what the Host can display.

However, as you suggest below, we could set no_vblank=3Dfalse and send the =
vblank/
pageflip completion event from the virtio-gpu driver instead of having the =
DRM
core send it. This can prevent the DRM core from signalling the out_fence a=
s well
which is my intended objective and what my first patch tries to do. I'd sti=
ll need the
new capability though to include the patch in Weston that deals with out_fe=
nce --
unless Weston upstream can accept the patch after reviewing it without this=
 newly
added capability which would be redundant but it does solve my problem. Wou=
ld
this be acceptable?

>=20
> I think instead of hacking up some ill-defined 1.5 queue depth support,
> what we should do is support queue depth > 1 properly. So:
>=20
> - Change atomic to support queue depth > 1, this needs to be a per-driver
>   thing due to a bunch of issues in driver code. Essentially drivers must
>   never look at obj->state pointers, and only ever look up state through
>   the passed-in drm_atomic_state * update container.
>=20
> - Aside: virtio should loose all it's empty hooks, there's no point in
>   that.
>=20
> - We fix virtio to send out the completion event at the end of this entir=
e
>   pipeline, i.e. virtio code needs to take care of sending out the
>   crtc_state->event correctly.
>=20
> - We probably also want some kind of (maybe per-crtc) recommended queue
>   depth property so compositors know how many buffers to keep in flight.
>   Not sure about that.
>=20
> It's a bit more work, but also a lot less hacking around infrastructure i=
n
> dubious ways.
>=20
> Thoughts?
[Kasireddy, Vivek] IIUC, you are suggesting that we should make it possible=
 to
submit a new atomic commit even though the completion event for the previou=
s
one has not come in yet. This may potentially solve my problem but it sound=
s very
disruptive and not very useful for bare-metal cases. It also means that the=
 compositors,
DRM core and the drivers need to keep track of multiple states -- as oppose=
d to new and
old -- for all objects such as crtcs, planes, etc and account for multiple =
completion events.
I guess it is doable but as you suggest it seems like a lot of work with ma=
ny pitfalls ahead.

Thanks,
Vivek
>=20
> Cheers, Daniel
>=20
> >
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Pekka Paalanen <ppaalanen@gmail.com>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Michel D=E4nzer <michel@daenzer.net>
> > Cc: Tina Zhang <tina.zhang@intel.com>
> > Cc: Dongwon Kim <dongwon.kim@intel.com>
> >
> > Vivek Kasireddy (4):
> >   drm: Add a capability flag to support deferred out_fence signalling
> >   virtio-gpu uapi: Add VIRTIO_GPU_F_OUT_FENCE feature
> >   drm/virtio: Add VIRTIO_GPU_CMD_RESOURCE_OUT_FENCE cmd
> >   drm/virtio: Probe and implement VIRTIO_GPU_F_OUT_FENCE feature
> >
> >  drivers/gpu/drm/drm_file.c               | 11 +++---
> >  drivers/gpu/drm/drm_ioctl.c              |  3 ++
> >  drivers/gpu/drm/virtio/virtgpu_debugfs.c |  1 +
> >  drivers/gpu/drm/virtio/virtgpu_drv.c     |  1 +
> >  drivers/gpu/drm/virtio/virtgpu_drv.h     |  6 ++++
> >  drivers/gpu/drm/virtio/virtgpu_fence.c   |  9 +++++
> >  drivers/gpu/drm/virtio/virtgpu_kms.c     | 10 ++++--
> >  drivers/gpu/drm/virtio/virtgpu_plane.c   | 44 +++++++++++++++++++++++-
> >  drivers/gpu/drm/virtio/virtgpu_vq.c      | 17 +++++++++
> >  include/drm/drm_mode_config.h            |  9 +++++
> >  include/uapi/drm/drm.h                   |  1 +
> >  include/uapi/linux/virtio_gpu.h          | 12 +++++++
> >  12 files changed, 117 insertions(+), 7 deletions(-)
> >
> > --
> > 2.30.2
> >
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
