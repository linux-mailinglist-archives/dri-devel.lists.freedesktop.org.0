Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA72AA14E97
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 12:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166DC10EAD5;
	Fri, 17 Jan 2025 11:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="qsFKFIIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F8310E3BB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 11:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1737114019; x=1737373219;
 bh=bfduMRq8Z9GW3AugrfuZMoccSpYdve41FbOKEkaZjVk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=qsFKFIIxxKzsHLthav2trKaWexxjHNaVA1djtP+R9cqdsMkQf5MOMvjJ71e3qF4KQ
 9hKVdf8mzjI4c3OWAcou6+/QZSjmSV6NFekRHwAKt+eJPQx70T7FUoRLapBnKYxK8y
 P0BDMj65V6pu114hdfwvf+5oWaQHWUPLwV/BWcqkd0vW/PK1QOtXGd0bWwG/imimxL
 yLGc0CfJSMFhyjBWgiUJG+OtI2Dc586H/NYBIMdANMQeCiN7jKNY8LT3u2BRgP6WFP
 tpGgzTDvmXCjt5RZI1SAaxJQZ3B6zwCWDAXStcu6dtmi7K1oHJgC+34cpTtw3A7VqP
 L2KMd3y8/YQWQ==
Date: Fri, 17 Jan 2025 11:40:15 +0000
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Turner <david.turner@raspberrypi.com>
Subject: Re: [PATCH] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions with
 atomic
Message-ID: <bJlwXyrHx2dVR07f-XR1pvRbKIYBNPCXNptvmU81YxnaCJ2nCfxBNinnpasJdXStjbGzJ0pCY9TlzOdWqWqdDYpaWYjGepN6DDXVhBwpNHM=@emersion.fr>
In-Reply-To: <Z4o_zteNVH6gqn2h@intel.com>
References: <20250116162528.2235991-1-contact@emersion.fr>
 <Z4o_zteNVH6gqn2h@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 94b5c214ba94f569292337863a5055a4a38be97e
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, January 17th, 2025 at 12:32, Ville Syrj=C3=A4l=C3=A4 <ville.syrj=
ala@linux.intel.com> wrote:

> > + * When used with atomic uAPI, one event will be delivered per CRTC in=
cluded in
> > + * the atomic commit. A CRTC is included in an atomic commit if one of=
 its
> > + * properties is set, or if a property is set on a connector or plane =
linked
> > + * via the CRTC_ID property to the CRTC. At least one CRTC must be inc=
luded,
> > + * and all pulled in CRTCs must be either previously or newly powered =
on (in
> > + * other words, a powered off CRTC which stays off cannot be included =
in the
> > + * atomic commit).
>=20
> I don't understand all this stuff about powered off crtcs? If
> someone sucks in a powered off thing then things will generally
> work just fine.

Not with the page-flip event flag:

=09/*
=09 * Reject event generation for when a CRTC is off and stays off.
=09 * It wouldn't be hard to implement this, but userspace has a track
=09 * record of happily burning through 100% cpu (or worse, crash) when the
=09 * display pipe is suspended. To avoid all that fun just reject updates
=09 * that ask for events since likely that indicates a bug in the
=09 * compositor's drawing loop. This is consistent with the vblank IOCTL
=09 * and legacy page_flip IOCTL which also reject service on a disabled
=09 * pipe.
=09 */
=09if (new_crtc_state->event &&
=09    !new_crtc_state->active && !old_crtc_state->active) {
=09=09drm_dbg_atomic(crtc->dev,
=09=09=09       "[CRTC:%d:%s] requesting event but off\n",
=09=09=09       crtc->base.id, crtc->name);
=09=09return -EINVAL;
=09}

> There is a bit of corner case with the way we internally complete
> the commits for disabled things (not just crtcs, but also planes
> and connectors) and that can apparently happen a bit later than
> the commit completion for the enabled things. That seems to be
> causing a bit of grief for sway which insists on adding all kinds
> of disabled planes to every commit:
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13410

Hm, interesting. So including an already-disabled cursor plane in a
commit may fail the next commit with EBUY? I expect a lot of user-space
to do this as well, e.g. Weston.
