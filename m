Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F11A87A36
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 10:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9E210E4CD;
	Mon, 14 Apr 2025 08:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="lvJCVR8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B0C10E4D9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 08:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1744619089; x=1744878289;
 bh=1zT88YVcAtYblI3KeYRMymEMBDO/CkXrCqQV/Fe4xUc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=lvJCVR8vxJVz13xXHNFLCACRJXzreltDzKj9P7AG9RcXvdhjR10x1pT6eOxW3oY1l
 x87z5FOwIgo6BtoA+pK4CJ+394pp0iXy8fam1A1K3axF5UfgSoxNgs0tXTlOBGTAN1
 mJ3OYoD3GiC3iAA9pfMzXJciYGKaDXcj2Q69I+jD9CVDv33eeUv8XsLsiVDc1ZgCRS
 HRlt0FzBFKp9y+zcXTWIqUAbMB4gt9yRHMTAh/yUWZUB5B4NfUtVYFVSCbS9HkdIKh
 i44zTw/YfBD4xfMeRGPvXElPnxIuhl4opokt8gGOeYqu6VNioeJ9lJUR+NViQ/jxD7
 Z1DqDmbGnyiFg==
Date: Mon, 14 Apr 2025 08:24:44 +0000
To: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>,
 =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 David Turner <david.turner@raspberrypi.com>
Subject: Re: [PATCH] drm: document DRM_MODE_PAGE_FLIP_EVENT interactions with
 atomic
Message-ID: <wKekuqyfg94IU93Ol9YIZU1bw1eBz0wva56a6US3DBfn5vBBUmvNMRWOIPUD4HL16evFO-j561hsuczkwZuU0nbHdYjOAtGvAufvoqkj1Lc=@emersion.fr>
In-Reply-To: <20250117131543.38f0f60d@eldfell>
References: <20250116162528.2235991-1-contact@emersion.fr>
 <20250117131543.38f0f60d@eldfell>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 0aa29c0682b6bf7f6c13f38aaee5a853ffb33f96
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

On Friday, January 17th, 2025 at 12:15, Pekka Paalanen <pekka.paalanen@halo=
niitty.fi> wrote:

> On Thu, 16 Jan 2025 16:25:35 +0000
> Simon Ser contact@emersion.fr wrote:
>=20
> > It's not obvious off-hand which CRTCs will get a page-flip event
> > when using this flag in an atomic commit, because it's all
> > implicitly implied based on the contents of the atomic commit.
> > Document requirements for using this flag and
>=20
> and?

Oops, sounds like I stopped here to write the next paragraph and forgot
to go back and finish the sentence=E2=80=A6

> > Note, because prepare_signaling() runs right after
> > drm_atomic_set_property() calls, page-flip events are not delivered
> > for CRTCs pulled in later by DRM core (e.g. on modeset by
> > drm_atomic_helper_check_modeset()) or the driver (e.g. other CRTCs
> > sharing a DP-MST connector).
> >=20
> > Signed-off-by: Simon Ser contact@emersion.fr
> > Cc: Simona Vetter simona.vetter@ffwll.ch
> > Cc: Ville Syrj=C3=A4l=C3=A4 ville.syrjala@linux.intel.com
> > Cc: Pekka Paalanen pekka.paalanen@collabora.com
> > Cc: David Turner david.turner@raspberrypi.com
> > ---
> > include/uapi/drm/drm_mode.h | 8 ++++++++
> > 1 file changed, 8 insertions(+)
> >=20
> > diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> > index c082810c08a8..a122bea25593 100644
> > --- a/include/uapi/drm/drm_mode.h
> > +++ b/include/uapi/drm/drm_mode.h
> > @@ -962,6 +962,14 @@ struct hdr_output_metadata {
> > * Request that the kernel sends back a vblank event (see
> > * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when =
the
> > * page-flip is done.
> > + *
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
> Sounds right. I imagine this doc needs to be extended when drm_colorop
> lands, as yet another way to pull in a CRTC.

Yeah, I suppose so.

> Wasn't this also conditional on the DRM_CAP_CRTC_IN_VBLANK_EVENT or did
> userspace really need to count the events even without it?

DRM_CAP_CRTC_IN_VBLANK_EVENT is unconditionally set to 1. It doesn't seem
like there is any interaction between these two. So yeah, I suppose
user-space needs to count if they are on kernel < v4.12.

> Nevertheless, should there be a "see also DRM_CAP_CRTC_IN_VBLANK_EVENT"?

This sounds a bit out-of-place to me TBH. It's orthogonal to event delivery
and it's linked from struct drm_event_vblank already.
