Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005705A50E2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 18:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6B810E1C9;
	Mon, 29 Aug 2022 16:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8292010E1C9;
 Mon, 29 Aug 2022 16:01:58 +0000 (UTC)
Date: Mon, 29 Aug 2022 16:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661788915; x=1662048115;
 bh=/Cv97LwSvECAAMjpB8VY1nPcGlJSFZCarof/Yl0xZZk=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=KNy9ce4elJi6IyXtjZGZre583E1Ie7ISdGN+kgrU4nSDWTfRgBAB8151bQz8PKyXa
 gNDUnu71L8stloV7KCW/p47//hz5pIUEIQCdegu3pxlzYnX3wTYRVKoBbOGTtiOc+H
 AM/QgwPBsWSicTNbJPPFoTgEZ7xpKLB2JnkHmNqABXDe9546WgbyT6gK9uoUr9Pi3H
 ZJlq1HKKagzayVkEhXBiD9Q8z0+hO87N/+C7zu8jvrM/jJWNxEVBPhTCxpkMOwmx3P
 kYhqNJFcXHSTM6uOUUcqhDaNyJ+rOT/cESklH5cC9E3f1LGWd74O+y5xU8Y9OmmFIq
 e3pi+RMGHE1Aw==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Message-ID: <mCt6wEhtsKHH_vfQEi0RwUQspNiKfFez4v8ZWlMW-sqZ5xaiUqMpRCF7na84A2nOLw5MA59fQ6IWddLCAg76XwWagCYMthzTLKLPQ9m0MfI=@emersion.fr>
In-Reply-To: <YwiB/xQf6Z6ScU+Z@intel.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-4-contact@emersion.fr> <YwiB/xQf6Z6ScU+Z@intel.com>
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 Pekka Paalanen <ppaalanen@gmail.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, hwentlan@amd.com, nicholas.kazlauskas@amd.com,
 joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, August 26th, 2022 at 10:19, Ville Syrj=C3=A4l=C3=A4 <ville.syrja=
la@linux.intel.com> wrote:

> On Wed, Aug 24, 2022 at 03:08:55PM +0000, Simon Ser wrote:
> > This new kernel capability indicates whether async page-flips are
> > supported via the atomic uAPI. DRM clients can use it to check
> > for support before feeding DRM_MODE_PAGE_FLIP_ASYNC to the kernel.
>=20
> I think we'd need to clarify the semantics of the async flag
> for atomic commits.
>=20
> Eg. on Intel hw only pure page flips are possible async, if you do
> anything else (change plane size/pos/scaling/etc.) you will need
> to do a sync update. Technically not even all page flips (from the
> uapi POV) might be possible as the exact scanout source address
> is specified via two registers, only one of which can be update
> async. So technically the two framebuffers might be laid out
> just slightly differently which could prevent an async flip.
> Also only some subset of planes actually support async flips.

Also IIRC some format modifiers don't support async flip at all (CCS)?

> And on hw where multiple planes support it on the same crtc, only one
> plane can do it at a time. Well, more accurately we can only select
> one plane at a time to give us the "flip done" interrupt. I guess
> if the user wants to async flip multiple planes at the same time
> we could do them serially as opposed to in parallel to make sure
> all the flips actually happened before we signal completion of the
> entire commit. Async flips of multiple planes probably won't
> happen atomically anyway so doing them serially seems fine.
>=20
> ATM in i915 we probably don't have sufficient state checks in
> place to catch all the restrictions, and instead in part we rely
> on the limited scope of the legacy async flip ioctl to make sure
> the operation doesn't attempt something the hw can't do.

Yeah, that makes sense.

In the documentation patch discussion [1], it appears it's not clear what
drivers should do when async flip isn't possible with the legacy uAPI.

For the atomic uAPI, we need to pick on of these two approaches:

1. Let the kernel fall back to a sync flip if async isn't possible. This
   simplifies user-space, but then user-space has no reliable way to figure=
 out
   what really happened (sync or async?). That could be fixed with a new
   read-only CRTC prop indicating whether the last flip was async or not.
   However, maybe someone will come up in the future with user-space which
   needs to only apply an update if async flip is possible, in which case t=
his
   approach falls short.
2. Make the kernel return EINVAL if async flip isn't possible. This adds mo=
re
   complexity to user-space, but enables a more reliable and deterministic
   uAPI. This is also more consistent with the rest of the existing atomic
   uAPI.

Note, current user-space would only need to opportunistically enable async
flip. IOW, I think that for current user-space plans "async if possible,
otherwise sync" is good enough. That behavior maps well to the Vulkan prese=
nt
modes as well (which says that "this mode *may* result in visible tearing",=
 but
doesn't guarantee it).

Another possible shortcoming of the proposed new uAPI here is that user-spa=
ce
cannot submit a single atomic commit which updates multiple CRTCs, and
individually select which CRTC does an async flip. This could be fixed with
a "ASYNC_FLIP" CRTC prop which the kernel always resets to 0 on commit. I'm=
 not
sure we want/need to cross that bridge right now, it would be easy enough t=
o
add as a second step if some user-space would benefit from it.

What do you think?

[1]: https://lore.kernel.org/dri-devel/ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEz=
kQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=3D@=
emersion.fr/
