Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A05A5048
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C5310F416;
	Mon, 29 Aug 2022 15:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEF110F401
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:38:05 +0000 (UTC)
Date: Mon, 29 Aug 2022 15:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661787483; x=1662046683;
 bh=meonT+z76J66+0Utr6h+eYff5/VnSkxlYN/zV7IelcY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=UkqUCVciXxxPfOteQdm9QZ/hX/BpoegBsRXCzDjcUdoOFVPIQpRAGRX1Y6c6H/+pl
 R9SDgV9dAj0XRY0nS9iummbla00OwmU0iVxmPzUuDPzbZnUsJFuPgMqDnebWer7K4y
 8rhAl2ky2gCl8gtcqQ06p3TmBdxTta9kXp4ZNSUHk/QI73ZLeFqa9mrJDFJ9jixqa6
 R6BGKbiOBS7Rm2vSydHxUersh3wIqC4a6FTt30n0FvtGAsRkGCiqFUup/lKUyZCMJC
 LAD4Qacq73B/RKeF5IgjVLHY8VqAwCVCJnpdgoLIEry2Hc7XG9c96N3g+pbKC0tUzi
 36JdWHbWssHng==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=@emersion.fr>
In-Reply-To: <20220826115355.668e13ca@eldfell>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC Ville for the ASYNC bits, see below.

On Friday, August 26th, 2022 at 10:53, Pekka Paalanen <ppaalanen@gmail.com>=
 wrote:

> > +/**
> > + * DRM_MODE_PAGE_FLIP_EVENT
> > + *
> > + * Request that the kernel sends back a vblank event (see
> > + * struct drm_event_vblank) when the page-flip is done.
>=20
> ...with type =3D DRM_EVENT_FLIP_COMPLETE?
>=20
> This was a bit new to me, because libdrm abstracts vblank and pageflip
> events into different APIs.

Indeed.

Maybe should clarify what "done" means here? Would "when the page-flip has =
been
displayed on-screen" be correct?

> > + */
> >  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
> > +/**
> > + * DRM_MODE_PAGE_FLIP_ASYNC
> > + *
> > + * Request that the page-flip is performed as soon as possible, ie. wi=
th no
> > + * delay due to waiting for vblank. This may cause tearing to be visib=
le on
> > + * the screen.
>=20
> Btw. does the kernel fail the flip if the driver does not support async?
> Or does it silently fall back to sync flip?
> Asking for both legacy and atomic APIs.

Atomic doesn't support this yet, so it's pretty much TBD (see Ville's reply=
 [1]).

For legacy, it seems like drivers do what they want. AFAIU, i915 will rejec=
t
(see intel_async_flip_check_uapi etc), and amdgpu will silently fall back t=
o
vsync (see the `acrtc_state->update_type =3D=3D UPDATE_TYPE_FAST` check in
amdgpu_dm_commit_planes).

Maybe one of the drivers is wrong here and should be fixed?

[1]: https://lore.kernel.org/dri-devel/YwiB%2FxQf6Z6ScU+Z@intel.com/

> > +/**
> > + * DRM_MODE_ATOMIC_NONBLOCK
> > + *
> > + * Do not block while applying the atomic commit.
>=20
> Maybe add something like:
>=20
> =09The atomic commit ioctl returns immediately instead of waiting
> =09for the changes to be applied in hardware.

Good idea. Also added:

    Note, the driver will still check that the update can be applied before
    retuning.

> > + */
> >  #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
> > +/**
> > + * DRM_MODE_ATOMIC_ALLOW_MODESET
> > + *
> > + * Allow the update to result in visible artifacts such as a black scr=
een.
>=20
> Maybe add:
>=20
> =09...temporary or transient visible artifacts while the update is
> =09being applied. Applying the update may also take significantly
> =09more time than a page flip. The visual artifacts will not
> =09appear after the update is completed.
>=20
> =09This flag must be set when the KMS update might cause visible
> =09artifacts. Without this flag such KMS update will return EINVAL
> =09error. What kind of updates may cause visible artifacts depends
> =09on the driver and the hardware. Userspace that needs to know
> =09beforehand if an update might cause visible artifacts can use
> =09DRM_MODE_ATOMIC_TEST_ONLY without DRM_MODE_ATOMIC_ALLOW_MODESET
> =09to see if it fails.
>=20
> =09Visual artifacts are guaranteed to not appear when this flag is
> =09not set.
>=20
> That "artifacts will not appear after the update is completed" is a bit
> awkward, because when this commit completes and triggers the completion
> event (if requested), the visual artifacts might still be on screen, but
> as soon as the scanout cycle that just started finishes, all artifacts
> are gone for good. Isn't that how it works?
>=20
> Or does the kernel wait with the completion event until a good picture
> has been fully scanned out at least once? I'd expect not.

That generally looks like a good description to me, and AFAIK is how things
work indeed.
