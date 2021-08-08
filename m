Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1073E3CA6
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 22:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65229899A3;
	Sun,  8 Aug 2021 20:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9144899A3
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 20:09:23 +0000 (UTC)
Date: Sun, 08 Aug 2021 22:09:14 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/8] drm/ingenic: Use standard
 drm_atomic_helper_commit_tail
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Paul Boddie
 <paul@boddie.org.uk>, list@opendingux.net, Sam Ravnborg <sam@ravnborg.org>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <ENEJXQ.6TCYILUOPORD@crapouillou.net>
In-Reply-To: <f3b761ed-4e71-e8b8-f2b5-f4f7f1547fed@wanadoo.fr>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-4-paul@crapouillou.net>
 <f3b761ed-4e71-e8b8-f2b5-f4f7f1547fed@wanadoo.fr>
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

Hi Christophe,

Le dim., ao=FBt 8 2021 at 21:50:04 +0200, Christophe JAILLET=20
<christophe.jaillet@wanadoo.fr> a =E9crit :
> Le 08/08/2021 =E0 15:45, Paul Cercueil a =E9crit :
>> By making the CRTC's .vblank_enable() function return an error when=20
>> it
>> is known that the hardware won't deliver a VBLANK, we can drop the
>> ingenic_drm_atomic_helper_commit_tail() function and use the standard
>> drm_atomic_helper_commit_tail() function instead.
>>=20
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>> ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28=20
>> ++++-------------------
>>   1 file changed, 4 insertions(+), 24 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> index bc71ba44ccf4..3ed7c27a8dde 100644
>> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>> @@ -706,29 +706,6 @@ static int=20
>> ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
>>   	}
>>   }
>>   =7F-static void ingenic_drm_atomic_helper_commit_tail(struct=20
>> drm_atomic_state *old_state)
>> -{
>> -	/*
>> -	 * Just your regular drm_atomic_helper_commit_tail(), but only=20
>> calls
>> -	 * drm_atomic_helper_wait_for_vblanks() if priv->no_vblank.
>> -	 */
>> -	struct drm_device *dev =3D old_state->dev;
>> -	struct ingenic_drm *priv =3D drm_device_get_priv(dev);
>> -
>> -	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>> -
>> -	drm_atomic_helper_commit_planes(dev, old_state, 0);
>> -
>> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>> -
>> -	drm_atomic_helper_commit_hw_done(old_state);
>> -
>> -	if (!priv->no_vblank)
>> -		drm_atomic_helper_wait_for_vblanks(dev, old_state);
>> -
>> -	drm_atomic_helper_cleanup_planes(dev, old_state);
>> -}
>>=20
>=20
> Hi,
> if this function is removed, shouldn't:
>   static struct drm_mode_config_helper_funcs=20
> ingenic_drm_mode_config_helpers =3D {
>   	.atomic_commit_tail =3D ingenic_drm_atomic_helper_commit_tail,
>   };
> be updated as well?
>=20
> I've not seen it in the serie.

It is there though :) At the bottom of this very patch.

> Just my 2v.
> CJ

Cheers,
-Paul


