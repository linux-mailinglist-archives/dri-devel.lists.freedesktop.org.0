Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DB03E3C33
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 20:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB86F89A67;
	Sun,  8 Aug 2021 18:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8435C89A67
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 18:33:55 +0000 (UTC)
Date: Sun, 08 Aug 2021 20:33:45 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/8] drm/ingenic: Remove dead code
To: Joe Perches <joe@perches.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, 
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net, Sam Ravnborg
 <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <98AJXQ.3ASLLMR2SY4@crapouillou.net>
In-Reply-To: <5a003da4e38fcb50782664496fc37b84773a7813.camel@perches.com>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-2-paul@crapouillou.net>
 <ff06e53b-ba7e-5535-8931-ce7f7cdae5a6@suse.de>
 <5a003da4e38fcb50782664496fc37b84773a7813.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
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

Hi Joe,

Le dim., ao=FBt 8 2021 at 11:27:34 -0700, Joe Perches <joe@perches.com>=20
a =E9crit :
> On Sun, 2021-08-08 at 19:58 +0200, Thomas Zimmermann wrote:
>>=20
>>  Am 08.08.21 um 15:45 schrieb Paul Cercueil:
>>  > The priv->ipu_plane would get a different value further down the=20
>> code,
>>  > without the first assigned value being read first; so the first
>>  > assignation can be dropped.
>>  >
>>  > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>=20
>>  Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I think this is at best an incomplete description.
>=20
> How is it known that this priv->ipu_plane assignment isn't
> necessary for any path of any failure path after this assignment
> and before the new assignment?

It is only used in the .atomic_begin and .atomic_check callbacks of the=20
CRTC. These will only ever be called after the call to=20
drm_dev_register() which happens at the end of the probe function.

Cheers,
-Paul

>>  > diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> []
>>  > @@ -984,9 +984,6 @@ static int ingenic_drm_bind(struct device=20
>> *dev, bool has_components)
>>  >   	priv->dma_hwdescs->hwdesc_pal.cmd =3D JZ_LCD_CMD_ENABLE_PAL
>>  >   		| (sizeof(priv->dma_hwdescs->palette) / 4);
>>  >
>>  > -	if (soc_info->has_osd)
>>  > -		priv->ipu_plane =3D drm_plane_from_index(drm, 0);
>>  > -
>>  >   	primary =3D priv->soc_info->has_osd ? &priv->f1 : &priv->f0;
>>  >
>>  >   	drm_plane_helper_add(primary, &ingenic_drm_plane_helper_funcs);
>>  >
>>=20
>=20
>=20


