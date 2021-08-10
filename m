Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3823E588B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C1B8982D;
	Tue, 10 Aug 2021 10:46:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26D38982D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:46:13 +0000 (UTC)
Date: Tue, 10 Aug 2021 12:46:05 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/8] drm/ingenic: Use standard
 drm_atomic_helper_commit_tail
To: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, "H . Nikolaus Schaller"
 <hns@goldelico.com>, Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <TWDMXQ.LWEW6X38G98J@crapouillou.net>
In-Reply-To: <YRJS9kZt5jUe5Z3r@phenom.ffwll.local>
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-4-paul@crapouillou.net>
 <YRJS9kZt5jUe5Z3r@phenom.ffwll.local>
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

Hi Daniel,

Le mar., ao=FBt 10 2021 at 12:20:38 +0200, Daniel Vetter=20
<daniel@ffwll.ch> a =E9crit :
> On Sun, Aug 08, 2021 at 03:45:21PM +0200, Paul Cercueil wrote:
>>  By making the CRTC's .vblank_enable() function return an error when=20
>> it
>>  is known that the hardware won't deliver a VBLANK, we can drop the
>>  ingenic_drm_atomic_helper_commit_tail() function and use the=20
>> standard
>>  drm_atomic_helper_commit_tail() function instead.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28=20
>> ++++-------------------
>>   1 file changed, 4 insertions(+), 24 deletions(-)
>>=20
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index bc71ba44ccf4..3ed7c27a8dde 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -706,29 +706,6 @@ static int=20
>> ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
>>   	}
>>   }
>>=20
>>  -static void ingenic_drm_atomic_helper_commit_tail(struct=20
>> drm_atomic_state *old_state)
>>  -{
>>  -	/*
>>  -	 * Just your regular drm_atomic_helper_commit_tail(), but only=20
>> calls
>>  -	 * drm_atomic_helper_wait_for_vblanks() if priv->no_vblank.
>>  -	 */
>>  -	struct drm_device *dev =3D old_state->dev;
>>  -	struct ingenic_drm *priv =3D drm_device_get_priv(dev);
>>  -
>>  -	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>>  -
>>  -	drm_atomic_helper_commit_planes(dev, old_state, 0);
>>  -
>>  -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>>  -
>>  -	drm_atomic_helper_commit_hw_done(old_state);
>>  -
>>  -	if (!priv->no_vblank)
>>  -		drm_atomic_helper_wait_for_vblanks(dev, old_state);
>>  -
>>  -	drm_atomic_helper_cleanup_planes(dev, old_state);
>>  -}
>>  -
>>   static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
>>   {
>>   	struct ingenic_drm *priv =3D drm_device_get_priv(arg);
>>  @@ -749,6 +726,9 @@ static int ingenic_drm_enable_vblank(struct=20
>> drm_crtc *crtc)
>>   {
>>   	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>>=20
>>  +	if (priv->no_vblank)
>>  +		return -EWOULDBLOCK;
>=20
> I think other drivers return EINVAL here. I'm not sure exactly this is
> specified, but the errno here is visible to userspace.
>=20
> Maybe would be good to update the kerneldoc for this hook?
>=20
> Anyway this is great, with the errno fixed:
>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I thought about it afterwards, that my error code wasn't great. In my=20
mind it was "the driver will hang while waiting for vblank" hence=20
-EWOULDBLOCK ;)

I'll need to v2 anyway so I'll change it to -EINVAL then.

Cheers,
-Paul

>=20
>>  +
>>   	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>>   			   JZ_LCD_CTRL_EOF_IRQ, JZ_LCD_CTRL_EOF_IRQ);
>>=20
>>  @@ -856,7 +836,7 @@ static const struct drm_mode_config_funcs=20
>> ingenic_drm_mode_config_funcs =3D {
>>   };
>>=20
>>   static struct drm_mode_config_helper_funcs=20
>> ingenic_drm_mode_config_helpers =3D {
>>  -	.atomic_commit_tail =3D ingenic_drm_atomic_helper_commit_tail,
>>  +	.atomic_commit_tail =3D drm_atomic_helper_commit_tail,
>>   };
>>=20
>>   static void ingenic_drm_unbind_all(void *d)
>>  --
>>  2.30.2
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


