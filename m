Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBD53A3DBC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 10:05:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045B26E828;
	Fri, 11 Jun 2021 08:05:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82576E828
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 08:05:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 51E80D2787
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 07:54:02 +0000 (UTC)
Received: (Authenticated sender: paul@opendingux.net)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id E806D20005;
 Fri, 11 Jun 2021 07:53:36 +0000 (UTC)
Date: Thu, 10 Jun 2021 16:09:19 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 04/11] drm/ingenic: Move no_vblank to private state
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <JFRHUQ.5QKJTG7CMA3P2@crapouillou.net>
In-Reply-To: <YLZWvFDJzZ6Ij2qy@phenom.ffwll.local>
References: <20210527232104.152577-1-paul@crapouillou.net>
 <20210527232104.152577-5-paul@crapouillou.net>
 <YLZWvFDJzZ6Ij2qy@phenom.ffwll.local>
X-Mailer: geary/40.0
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Le mar., juin 1 2021 at 17:48:12 +0200, Daniel Vetter <daniel@ffwll.ch>=20
a =E9crit :
> On Fri, May 28, 2021 at 12:20:58AM +0100, Paul Cercueil wrote:
>>  This information is carried from the ".atomic_check" to the
>>  ".atomic_commit_tail"; as such it is state-specific, and should be=20
>> moved
>>  to the private state structure.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>=20
> Not sure this applies to your hw, but drm_crtc_state.no_vblank exists.
> Might want to move to that instead of rolling your own. Or explain=20
> why you
> need your own here in your own private state. It does look quite a bit
> like you're just rolling your own version of this support that helpers
> gained meanwhile.

If I use drm_crtc_state->no_vblank, then I need a custom=20
.atomic_commit_tail() that only calls=20
drm_atomic_helper_wait_for_vblanks() when !no_vblank. That works, but I=20
don't understand why drm_atomic_helper_commit_tail() doesn't do that by=20
default, and makes me think I'm using it wrong.

Cheers,
-Paul

> -Daniel
>=20
>=20
>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 41=20
>> ++++++++++++++++++++---
>>   1 file changed, 37 insertions(+), 4 deletions(-)
>>=20
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index e81084eb3b0e..639994329c60 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -66,6 +66,8 @@ struct jz_soc_info {
>>=20
>>   struct ingenic_drm_private_state {
>>   	struct drm_private_state base;
>>  +
>>  +	bool no_vblank;
>>   };
>>=20
>>   struct ingenic_drm {
>>  @@ -87,7 +89,6 @@ struct ingenic_drm {
>>   	dma_addr_t dma_hwdescs_phys;
>>=20
>>   	bool panel_is_sharp;
>>  -	bool no_vblank;
>>=20
>>   	/*
>>   	 * clk_mutex is used to synchronize the pixel clock rate update=20
>> with
>>  @@ -113,6 +114,30 @@ to_ingenic_drm_priv_state(struct=20
>> drm_private_state *state)
>>   	return container_of(state, struct ingenic_drm_private_state,=20
>> base);
>>   }
>>=20
>>  +static struct ingenic_drm_private_state *
>>  +ingenic_drm_get_priv_state(struct ingenic_drm *priv, struct=20
>> drm_atomic_state *state)
>>  +{
>>  +	struct drm_private_state *priv_state;
>>  +
>>  +	priv_state =3D drm_atomic_get_private_obj_state(state,=20
>> &priv->private_obj);
>>  +	if (IS_ERR(priv_state))
>>  +		return ERR_CAST(priv_state);
>>  +
>>  +	return to_ingenic_drm_priv_state(priv_state);
>>  +}
>>  +
>>  +static struct ingenic_drm_private_state *
>>  +ingenic_drm_get_new_priv_state(struct ingenic_drm *priv, struct=20
>> drm_atomic_state *state)
>>  +{
>>  +	struct drm_private_state *priv_state;
>>  +
>>  +	priv_state =3D drm_atomic_get_new_private_obj_state(state,=20
>> &priv->private_obj);
>>  +	if (!priv_state)
>>  +		return NULL;
>>  +
>>  +	return to_ingenic_drm_priv_state(priv_state);
>>  +}
>>  +
>>   static bool ingenic_drm_writeable_reg(struct device *dev, unsigned=20
>> int reg)
>>   {
>>   	switch (reg) {
>>  @@ -268,6 +293,7 @@ static int ingenic_drm_crtc_atomic_check(struct=20
>> drm_crtc *crtc,
>>   									  crtc);
>>   	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>>   	struct drm_plane_state *f1_state, *f0_state, *ipu_state =3D NULL;
>>  +	struct ingenic_drm_private_state *priv_state;
>>=20
>>   	if (crtc_state->gamma_lut &&
>>   	    drm_color_lut_size(crtc_state->gamma_lut) !=3D=20
>> ARRAY_SIZE(priv->dma_hwdescs->palette)) {
>>  @@ -299,9 +325,13 @@ static int=20
>> ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>>   			}
>>   		}
>>=20
>>  +		priv_state =3D ingenic_drm_get_priv_state(priv, state);
>>  +		if (IS_ERR(priv_state))
>>  +			return PTR_ERR(priv_state);
>>  +
>>   		/* If all the planes are disabled, we won't get a VBLANK IRQ */
>>  -		priv->no_vblank =3D !f1_state->fb && !f0_state->fb &&
>>  -				  !(ipu_state && ipu_state->fb);
>>  +		priv_state->no_vblank =3D !f1_state->fb && !f0_state->fb &&
>>  +					!(ipu_state && ipu_state->fb);
>>   	}
>>=20
>>   	return 0;
>>  @@ -727,6 +757,7 @@ static void=20
>> ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
>>   	 */
>>   	struct drm_device *dev =3D old_state->dev;
>>   	struct ingenic_drm *priv =3D drm_device_get_priv(dev);
>>  +	struct ingenic_drm_private_state *priv_state;
>>=20
>>   	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>>=20
>>  @@ -736,7 +767,9 @@ static void=20
>> ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_s
>>=20
>>   	drm_atomic_helper_commit_hw_done(old_state);
>>=20
>>  -	if (!priv->no_vblank)
>>  +	priv_state =3D ingenic_drm_get_new_priv_state(priv, old_state);
>>  +
>>  +	if (!priv_state || !priv_state->no_vblank)
>>   		drm_atomic_helper_wait_for_vblanks(dev, old_state);
>>=20
>>   	drm_atomic_helper_cleanup_planes(dev, old_state);
>>  --
>>  2.30.2
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


