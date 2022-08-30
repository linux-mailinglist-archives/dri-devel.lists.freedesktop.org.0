Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92725A636D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 14:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7E410E086;
	Tue, 30 Aug 2022 12:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3DD10E086;
 Tue, 30 Aug 2022 12:33:24 +0000 (UTC)
Date: Tue, 30 Aug 2022 12:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1661862801; x=1662122001;
 bh=k4bjCIZlfR6uAEnqa7JIBECWzqVFuz3cOXa0dtxIcxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=OWb7DjjpNRddgGqi45oPUClR2novWSTKiKxATdvCweQV0g91qJXUYaEPCxDga4pF2
 dOBteW8f2w6Nkc73Me9HyKBtOL+IhpLiigNqxLTyZQxVV8/DN8Qnvu3M7QuWNptoEv
 fbXkvZDonZUqmHJE8pI3o6B41NkBb2RYAZh9ILxWubQtq48ek/YU0ZcvnAPSCDPinA
 gzDBdGuMo/mpad/CJj03iL3Wru4LLKF/8FLW7wCT1DF/pBLMpdwR4Fc4/0qgduroz5
 eHR8yN5sulEzZLZr3e+nASd/GakJwISkFDfz0uVCV1Pf93+RPdHpLubL8eXs5ewq04
 8jMP6GsCbGn6w==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/4] drm: introduce DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP
Message-ID: <sJDm7mQ_I6f_f57JcZtnc2UQY0UC4xYACRJ_mysKwd7bUT7S4j-ypHmTB-QXwuvFFcpi7bupnVg8sV7-ylo0ocn0x3cmaatMtm5tlw-wtao=@emersion.fr>
In-Reply-To: <Yw3FdhzAst1RRPxy@intel.com>
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-4-contact@emersion.fr> <YwiB/xQf6Z6ScU+Z@intel.com>
 <mCt6wEhtsKHH_vfQEi0RwUQspNiKfFez4v8ZWlMW-sqZ5xaiUqMpRCF7na84A2nOLw5MA59fQ6IWddLCAg76XwWagCYMthzTLKLPQ9m0MfI=@emersion.fr>
 <Yw3FdhzAst1RRPxy@intel.com>
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

On Tuesday, August 30th, 2022 at 10:08, Ville Syrj=C3=A4l=C3=A4 <ville.syrj=
ala@linux.intel.com> wrote:

> > In the documentation patch discussion [1], it appears it's not clear wh=
at
> > drivers should do when async flip isn't possible with the legacy uAPI.
> >
> > For the atomic uAPI, we need to pick on of these two approaches:
> >
> > 1. Let the kernel fall back to a sync flip if async isn't possible. Thi=
s
> >    simplifies user-space, but then user-space has no reliable way to fi=
gure out
> >    what really happened (sync or async?). That could be fixed with a ne=
w
> >    read-only CRTC prop indicating whether the last flip was async or no=
t.
> >    However, maybe someone will come up in the future with user-space wh=
ich
> >    needs to only apply an update if async flip is possible, in which ca=
se this
> >    approach falls short.
> > 2. Make the kernel return EINVAL if async flip isn't possible. This add=
s more
> >    complexity to user-space, but enables a more reliable and determinis=
tic
> >    uAPI. This is also more consistent with the rest of the existing ato=
mic
> >    uAPI.
>=20
> The current behaviour is somewhat a combination of the two. We return
> an error if async flip is not possible at all given the current state.
>=20
> When async flip is possible we return success, but may still internally
> fall back to a sync flip for the first flip. That is required on some
> borked hardware that can't switch from sync flips to async flips without
> doing an extra sync flip. Also on some other hardware we intentionally
> fall back to a sync flip for the first async flip, so that we can
> reprogram some display FIFO stuff (aimed to make the subsequent async
> flips faster).

Hm. Would it be possible for the atomic uAPI to return EINVAL in this case =
too,
to let user-space know what really happened? I suppose user-space could the=
n
(mistakenly) assume that async flip is never possible, and never try again?

> > Note, current user-space would only need to opportunistically enable as=
ync
> > flip. IOW, I think that for current user-space plans "async if possible=
,
> > otherwise sync" is good enough. That behavior maps well to the Vulkan p=
resent
> > modes as well (which says that "this mode *may* result in visible teari=
ng", but
> > doesn't guarantee it).
>=20
> The current behaviour is to fall back to a blit if the async
> flip fails. So you still get the same effective behaviour, just
> not as efficient. I think that's a reasonable way to handle it.

After some discussion on IRC: the above describes Xorg's behavior.

To reproduce this behavior with the atomic uAPI, it is necessary to use
approach (2): make the atomic commit fail if async flip isn't possible, to =
let
user-space fall back to a blit.

> > Another possible shortcoming of the proposed new uAPI here is that user=
-space
> > cannot submit a single atomic commit which updates multiple CRTCs, and
> > individually select which CRTC does an async flip. This could be fixed =
with
> > a "ASYNC_FLIP" CRTC prop which the kernel always resets to 0 on commit.=
 I'm not
> > sure we want/need to cross that bridge right now, it would be easy enou=
gh to
> > add as a second step if some user-space would benefit from it.
>=20
> Technically it should really be per-plane since that is what does
> the flip. But I have a feeling that allowing a mix of async and
> sync in the same commit is just going to make everything more
> complicated without really helping anything (async flips won't
> happen atomically anyway with anything else).

Agreed.

> One (crazy?) idea I had for the atomic api is that we could even
> reject most of the properties already on the uapi level before anyone
> gets to examine the final state. Ie. as soon as the atomic ioctl sees
> eg. a gamma LUT property change it would just immediately return
> an error if async flip is also requested.

Hm, I guess... Although amdgpu doesn't really need this, it already has all
of the logic checking for stuff like gamma LUT property change + async. Cou=
ld
maybe be a DRM helper if other drivers need it.
