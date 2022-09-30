Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AED5F0CD2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99B610ED0F;
	Fri, 30 Sep 2022 13:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10BD910ED0D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 13:56:32 +0000 (UTC)
Date: Fri, 30 Sep 2022 13:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1664546189; x=1664805389;
 bh=cu9NzPYuwmV2LIQD2ELCv5fVgsv89UQlLcoBUaRxZe8=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=EtZ7omISzDbfLkz7bbJG8BVd2rA0vTnI3D/5DXcTAqNTc3h3IIOQnoMbYYqLYGqNT
 ktCeN0X5gfedCjc5M6WCgnhrjUJVHGGZI6zJZgr03kVbWpaV6UyabmlLfr4F1rtNCA
 yT3XNd9P6+jl5U/k8IoKT/K36zDFoFqO77sXBedrD2vBQWJcFGnSxOhMsVedXXilIA
 WCirneUv8x8TLEmp93WV/IP99qM2oSOX7VjtKoSVbk5Yv30lSdzmsQw4tvosmBtmNr
 pXo2lTsJiF8iGsBVS8DXAoCtz9TxAAX1bd7NGRIooznSOYfmaH9iTZMCdJ8LnADXMK
 WVD5bcGBVhMIA==
To: =?utf-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v3 3/6] drm: introduce
 drm_mode_config.atomic_async_page_flip_not_supported
Message-ID: <TIyTbXwbugAMrWLflS6c6MSMb8Nfv0n3kzxZS8XYDPW2KhtzVxazMJUQPRdq0c7BUNLAaT125oFiZYCTIT-tF5QVCnKxffLfGYOMBCBpQWQ=@emersion.fr>
In-Reply-To: <Yzb0xhcvwnWg4iY6@intel.com>
References: <20220929184307.258331-1-contact@emersion.fr>
 <20220929184307.258331-4-contact@emersion.fr> <Yzb0xhcvwnWg4iY6@intel.com>
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, September 30th, 2022 at 15:53, Ville Syrj=C3=A4l=C3=A4 <ville.sy=
rjala@linux.intel.com> wrote:

> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/driver=
s/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 44235345fd57..7500e82cf06a 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -3808,6 +3808,7 @@ static int amdgpu_dm_mode_config_init(struct amdg=
pu_device *adev)
> >  =09=09adev_to_drm(adev)->mode_config.prefer_shadow =3D 1;
> >  =09/* indicates support for immediate flip */
> >  =09adev_to_drm(adev)->mode_config.async_page_flip =3D true;
> > +=09adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported=
 =3D true;
>=20
> The flag polarity seems weird. Why opt out and not opt in?

Explained in the commit message.
