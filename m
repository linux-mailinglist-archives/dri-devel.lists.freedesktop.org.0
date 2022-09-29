Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EAF5EFCB8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2510010EBCA;
	Thu, 29 Sep 2022 18:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C22110EBCA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:10:43 +0000 (UTC)
Date: Thu, 29 Sep 2022 18:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664475041; x=1664734241;
 bh=fXJ7nUIpWyyetT2Bb9oKYrTdZHaDtERnJcKPXNc3EVY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=XuJy/zWwdRqrG8EOvX9Ms/TSN3BQYCAlxagFMvaiTOR9SI/6N1puPYmmfgB138tLh
 zdVF1oq9jKEksTC7wA73ijyWWX9SWgplpyaEXstLnSH5zI+gsFCWp8P18itQETGLL2
 ka46MRbgtyAUum0VAkUWiZroKowNEr6k2wI0g53IyX1IZcuDDjq8U298vFyttLosnn
 ozAEioR7f2VMI7rsT1Uq1EwJMzS3/68CwpZaRZF8LeUxseUY5YyCx58SxCUlVcQbKp
 9ADnrXHbhNUl4Ei7lPvtFxVhc13S4cVjTCTDhsWSVUACji45vXx8aWdipL6H65aWo0
 /OcWHjA7PCYRg==
To: Pekka Paalanen <ppaalanen@gmail.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3] drm: document uAPI page-flip flags
Message-ID: <aP95gLg6WmDLYM18uEppie64PTBeG8L7xEHbDjTgYgil7h_aABI04mgTXkqwRjN3BUfax3IYjB507EsGnKWrtM_uy_oti7Ks_Bfh9VKMtQs=@emersion.fr>
In-Reply-To: <20220928130623.60b56910@eldfell>
References: <20220928094149.118943-1-contact@emersion.fr>
 <20220928130623.60b56910@eldfell>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday, September 28th, 2022 at 12:06, Pekka Paalanen <ppaalanen@gmai=
l.com> wrote:

> > +/**
> > + * DRM_MODE_PAGE_FLIP_FLAGS
> > + *
> > + * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags=
.
>=20
> Should this mention also drm_mode_crtc_page_flip.flags?
>=20
> UAPI header defines both structs.

drm_mode_crtc_page_flip is "v1", drm_mode_crtc_page_flip_target is "v2". Th=
e
latter just replaces a reserved field with a new one. So I figured "v1" is
mostly kept around for backwards compat and everybody should use "v2" for
simplicity's sake.

> > +/**
> > + * DRM_MODE_ATOMIC_ALLOW_MODESET
> > + *
> > + * Allow the update to result in temporary or transient visible artifa=
cts while
> > + * the update is being applied. Applying the update may also take sign=
ificantly
> > + * more time than a page flip. All visual artifacts will disappear by =
the time
> > + * the update is completed, as signalled throught the vblank event's t=
imestamp
>=20
> typo: throught

Indeed!

> > + * (see struct drm_event_vblank).
> > + *
> > + * This flag must be set when the KMS update might cause visible artif=
acts.
> > + * Without this flag such KMS update will return a EINVAL error. What =
kind of
> > + * update may cause visible artifacts depends on the driver and the ha=
rdware.
> > + * User-space that needs to know beforehand if an update might cause v=
isible
> > + * artifacts can use &DRM_MODE_ATOMIC_TEST_ONLY without
> > + * &DRM_MODE_ATOMIC_ALLOW_MODESET to see if it fails.
> > + *
> > + * To the best of the driver's knowledge, visual artifacts are guarant=
eed to
> > + * not appear when this flag is not set. Some sinks might display visu=
al
> > + * artifacts outside of the driver's control.
>=20
> Ok, so we kept the "visual artifacts" semantics and allow monitors to
> do otherwise.
>=20
> I'm still not sure what this means for things like infoframe data where
> changing a certain field (e.g. HDR_OUTPUT_METADATA structure's EOTF
> field) has a high risk of causing a visual glitch. I cannot imagine why
> a monitor manufacturer would not be able to avoid the glitch if they
> wanted to. The glitch might or might not happen, and we cannot know in
> advance or afterwards whether it did happen, but it is probable that
> many monitors will glitch.
>=20
> I think "To the best of driver's knowledge" means that if someone
> reports a monitor to glitch, the driver/kernel would need to add that
> field to the "needs modeset" set. But doing so can regress other
> monitors that didn't glitch, so it needs to be a monitor quirk.
>=20
> This is not something for this patch, but would it be possible to agree
> on the kernel development policy here? Should glitches be reported and
> added to monitor quirks list? Or should drivers be defensive from the
> start and require modeset if the field is known to cause glitches on
> some monitors?

Good question. I am not sure there is even a desire to have a quirks table =
for
this among driver developers.

This reminds me of some VRR displays showing visual artifacts when user-spa=
ce
changes its page-flip rate. If we took this definition by the letter, the
kernel should require ALLOW_MODESET at each page-flip... (The better soluti=
on
would be to just to have a slew rate implemented in the kernel. I think it'=
s
implemented to some extent in amdgpu/i915 but still some monitors are havin=
g
issues.)
