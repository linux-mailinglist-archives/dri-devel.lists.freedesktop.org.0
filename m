Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F429210497
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700686E7F5;
	Wed,  1 Jul 2020 07:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1286E291
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 14:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1593527972; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F4JdLZF8aOmJqaBMAyUE1KSq9Zs1SRVZRjDKFXNAkX4=;
 b=bLdiJz6pdBNGjfpeKKpVAJi3c2K+LxkxMxgdVpCBowfKb/Ssu2sDcMMkKyJZqwykOpAgub
 NWhR+YxXzVLF02JEqA55LB9nXrdoIOS6z6xmAbUqDhSBBiFJv9dUKRxduVbqlRk4o6u1eZ
 6ksF4GYlEROt5mq2+6ApKcVLtaLZgV0=
Date: Tue, 30 Jun 2020 16:39:21 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 08/10] drm/ingenic: Add support for OSD mode
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <L1UQCQ.949D9CHUW4H1@crapouillou.net>
In-Reply-To: <20200630120518.GD560155@ravnborg.org>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-8-paul@crapouillou.net>
 <20200630120518.GD560155@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 01 Jul 2020 07:12:04 +0000
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, David Airlie <airlied@linux.ie>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Le mar. 30 juin 2020 =E0 14:05, Sam Ravnborg <sam@ravnborg.org> a =E9crit =

:
> Hi Paul.
> =

> On Tue, Jun 30, 2020 at 01:52:08AM +0200, Paul Cercueil wrote:
>>  All Ingenic SoCs starting from the JZ4725B support OSD mode.
>> =

>>  In this mode, two separate planes can be used. They can have =

>> different
>>  positions and sizes, and one can be overlayed on top of the other.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> =

> OSD? On screen Display?

Yes... That's how it's called in the programming manual.

I believe it's because this mode adds the possibility to create OSDs =

with the overlay plane.

> Some random comments in the following - from my attempt to follow the
> code.
> =

> 	Sam
> =

> =

>>  ---
>> =

>>  Notes:
>>      v2: Use fallthrough; instead of /* fall-through */
>> =

>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 271 =

>> +++++++++++++++++-----
>>   drivers/gpu/drm/ingenic/ingenic-drm.h     |  35 +++
>>   2 files changed, 254 insertions(+), 52 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c =

>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  index 6590b61cb915..a8573da1d577 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>  @@ -43,12 +43,13 @@ struct ingenic_dma_hwdesc {
>> =

>>   struct jz_soc_info {
>>   	bool needs_dev_clk;
>>  +	bool has_osd;
>>   	unsigned int max_width, max_height;
>>   };
>> =

>>   struct ingenic_drm {
>>   	struct drm_device drm;
>>  -	struct drm_plane primary;
>>  +	struct drm_plane f0, f1;
> =

> A small comment about when f0 and f1 is used and how they are the
> primary plane would be good here.

Right.

> =

>>   	struct drm_crtc crtc;
>>   	struct drm_encoder encoder;
>> =

>>  @@ -57,8 +58,8 @@ struct ingenic_drm {
>>   	struct clk *lcd_clk, *pix_clk;
>>   	const struct jz_soc_info *soc_info;
>> =

>>  -	struct ingenic_dma_hwdesc *dma_hwdesc;
>>  -	dma_addr_t dma_hwdesc_phys;
>>  +	struct ingenic_dma_hwdesc *dma_hwdesc[2];
>>  +	dma_addr_t dma_hwdesc_phys[2];
>> =

>>   	bool panel_is_sharp;
>>   };
>>  @@ -90,7 +91,7 @@ static const struct regmap_config =

>> ingenic_drm_regmap_config =3D {
>>   	.val_bits =3D 32,
>>   	.reg_stride =3D 4,
>> =

>>  -	.max_register =3D JZ_REG_LCD_CMD1,
>>  +	.max_register =3D JZ_REG_LCD_SIZE1,
>>   	.writeable_reg =3D ingenic_drm_writeable_reg,
>>   };
>> =

>>  @@ -110,11 +111,6 @@ drm_encoder_get_priv(struct drm_encoder =

>> *encoder)
>>   	return container_of(encoder, struct ingenic_drm, encoder);
>>   }
>> =

>>  -static inline struct ingenic_drm *drm_plane_get_priv(struct =

>> drm_plane *plane)
>>  -{
>>  -	return container_of(plane, struct ingenic_drm, primary);
>>  -}
>>  -
>>   static void ingenic_drm_crtc_atomic_enable(struct drm_crtc *crtc,
>>   					   struct drm_crtc_state *state)
>>   {
>>  @@ -185,34 +181,17 @@ static void =

>> ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
>>   		regmap_write(priv->map, JZ_REG_LCD_SPL, hpe << 16 | (hpe + 1));
>>   		regmap_write(priv->map, JZ_REG_LCD_REV, mode->htotal << 16);
>>   	}
>>  -}
>>  -
>>  -static void ingenic_drm_crtc_update_ctrl(struct ingenic_drm *priv,
>>  -					 const struct drm_format_info *finfo)
>>  -{
>>  -	unsigned int ctrl =3D JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16;
>>  -
>>  -	switch (finfo->format) {
>>  -	case DRM_FORMAT_XRGB1555:
>>  -		ctrl |=3D JZ_LCD_CTRL_RGB555;
>>  -		/* fall-through */
>>  -	case DRM_FORMAT_RGB565:
>>  -		ctrl |=3D JZ_LCD_CTRL_BPP_15_16;
>>  -		break;
>>  -	case DRM_FORMAT_XRGB8888:
>>  -		ctrl |=3D JZ_LCD_CTRL_BPP_18_24;
>>  -		break;
>>  -	}
>> =

>>   	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>>  -			   JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16 |
>>  -			   JZ_LCD_CTRL_BPP_MASK, ctrl);
>>  +			   JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16,
>>  +			   JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16);
> It looks like regmap_update_bits() is no longer the best choice here.

I see that regmap_set_bits() appeared in 5.8, I'll just use that.

>>   }
>> =

>>   static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>>   					 struct drm_crtc_state *state)
>>   {
>>   	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>>  +	struct drm_plane_state *f1_state, *f0_state;
>>   	long rate;
>> =

>>   	if (!drm_atomic_crtc_needs_modeset(state))
>>  @@ -227,6 +206,15 @@ static int =

>> ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>>   	if (rate < 0)
>>   		return rate;
>> =

>>  +	if (priv->soc_info->has_osd) {
>>  +		f1_state =3D drm_atomic_get_plane_state(state->state, &priv->f1);
>>  +		f0_state =3D drm_atomic_get_plane_state(state->state, &priv->f0);
>>  +
>>  +		/* If all the planes are disabled, we won't get a VBLANK IRQ */
>>  +		if (!f1_state->fb && !f0_state->fb)
>>  +			state->no_vblank =3D true;
>>  +	}
>>  +
>>   	return 0;
>>   }
>> =

>>  @@ -236,14 +224,9 @@ static void =

>> ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>>   	struct ingenic_drm *priv =3D drm_crtc_get_priv(crtc);
>>   	struct drm_crtc_state *state =3D crtc->state;
>>   	struct drm_pending_vblank_event *event =3D state->event;
>>  -	struct drm_framebuffer *drm_fb =3D crtc->primary->state->fb;
>>  -	const struct drm_format_info *finfo;
>> =

>>   	if (drm_atomic_crtc_needs_modeset(state)) {
>>  -		finfo =3D drm_format_info(drm_fb->format->format);
>>  -
>>   		ingenic_drm_crtc_update_timings(priv, &state->mode);
>>  -		ingenic_drm_crtc_update_ctrl(priv, finfo);
>> =

>>   		clk_set_rate(priv->pix_clk, state->adjusted_mode.clock * 1000);
>>   	}
>>  @@ -260,12 +243,149 @@ static void =

>> ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
>>   	}
>>   }
>> =

>>  +static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
>>  +					  struct drm_plane_state *state)
>>  +{
>>  +	struct ingenic_drm *priv =3D drm_device_get_priv(plane->dev);
>>  +	struct drm_crtc_state *crtc_state;
>>  +	struct drm_crtc *crtc =3D state->crtc ?: plane->state->crtc;
>>  +	int ret;
>>  +
>>  +	if (!crtc)
>>  +		return 0;
>>  +
>>  +	crtc_state =3D drm_atomic_get_existing_crtc_state(state->state, =

>> crtc);
>>  +	if (WARN_ON(!crtc_state))
>>  +		return -EINVAL;
>>  +
>>  +	ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
>>  +						  DRM_PLANE_HELPER_NO_SCALING,
>>  +						  DRM_PLANE_HELPER_NO_SCALING,
>>  +						  priv->soc_info->has_osd,
>>  +						  true);
>>  +	if (ret)
>>  +		return ret;
>>  +
>>  +	if (!priv->soc_info->has_osd &&
>>  +	    (state->src_x !=3D 0 ||
>>  +	     (state->src_w >> 16) !=3D state->crtc_w ||
>>  +	     (state->src_h >> 16) !=3D state->crtc_h))
>>  +		return -EINVAL;
> This check could bebefit from a small comment.
> I cannot see the purpose of " >> 16" on the src_* fields...

I can add a comment, yes.

The src_* fields of a drm_plane are in 16.16 fixed-point format, hence =

the >>16. I didn't invent that here.

>>  +
>>  +	/*
>>  +	 * Require full modeset if if enabling or disabling a plane, or =

>> changing
> Too many ifs?
> =

>>  +	 * its position, size or depth.
>>  +	 */
>>  +	if (priv->soc_info->has_osd &&
>>  +	    (!plane->state->fb || !state->fb ||
>>  +	     plane->state->crtc_x !=3D state->crtc_x ||
>>  +	     plane->state->crtc_y !=3D state->crtc_y ||
>>  +	     plane->state->crtc_w !=3D state->crtc_w ||
>>  +	     plane->state->crtc_h !=3D state->crtc_h ||
>>  +	     plane->state->fb->format->format !=3D =

>> state->fb->format->format))
>>  +		crtc_state->mode_changed =3D true;
>>  +
>>  +	return 0;
>>  +}
>>  +
>>  +static void ingenic_drm_plane_enable(struct ingenic_drm *priv,
>>  +				      struct drm_plane *plane)
>>  +{
>>  +	unsigned int en_bit;
>>  +
>>  +	if (priv->soc_info->has_osd) {
>>  +		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>>  +			en_bit =3D JZ_LCD_OSDC_F1EN;
>>  +		else
>>  +			en_bit =3D JZ_LCD_OSDC_F0EN;
>>  +
>>  +		regmap_update_bits(priv->map, JZ_REG_LCD_OSDC, en_bit, en_bit);
> I think you can use a more direct way to do the assignment.
> Like before where the same pattern was used (last two arguments the
> same).
> =

>>  +	}
>>  +}
>>  +
>>  +static void ingenic_drm_plane_atomic_disable(struct drm_plane =

>> *plane,
>>  +					     struct drm_plane_state *old_state)
>>  +{
>>  +	struct ingenic_drm *priv =3D drm_device_get_priv(plane->dev);
>>  +	unsigned int en_bit;
>>  +
>>  +	if (priv->soc_info->has_osd) {
>>  +		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
>>  +			en_bit =3D JZ_LCD_OSDC_F1EN;
>>  +		else
>>  +			en_bit =3D JZ_LCD_OSDC_F0EN;
>>  +
>>  +		regmap_update_bits(priv->map, JZ_REG_LCD_OSDC, en_bit, 0);
>>  +	}
>>  +}
>>  +
>>  +static void ingenic_drm_plane_config(struct ingenic_drm *priv,
>>  +				     struct drm_plane *plane, u32 fourcc)
>>  +{
>>  +	struct drm_plane_state *state =3D plane->state;
>>  +	unsigned int xy_reg, size_reg;
>>  +	unsigned int ctrl =3D 0;
>>  +
>>  +	ingenic_drm_plane_enable(priv, plane);
>>  +
>>  +	if (priv->soc_info->has_osd &&
>>  +	    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>>  +		switch (fourcc) {
>>  +		case DRM_FORMAT_XRGB1555:
>>  +			ctrl |=3D JZ_LCD_OSDCTRL_RGB555;
>>  +			fallthrough;
>>  +		case DRM_FORMAT_RGB565:
>>  +			ctrl |=3D JZ_LCD_OSDCTRL_BPP_15_16;
>>  +			break;
>>  +		case DRM_FORMAT_XRGB8888:
>>  +			ctrl |=3D JZ_LCD_OSDCTRL_BPP_18_24;
>>  +			break;
>>  +		}
>>  +
>>  +		regmap_update_bits(priv->map, JZ_REG_LCD_OSDCTRL,
>>  +				   JZ_LCD_OSDCTRL_BPP_MASK, ctrl);
>>  +	} else {
>>  +		switch (fourcc) {
>>  +		case DRM_FORMAT_XRGB1555:
>>  +			ctrl |=3D JZ_LCD_CTRL_RGB555;
>>  +			fallthrough;
>>  +		case DRM_FORMAT_RGB565:
>>  +			ctrl |=3D JZ_LCD_CTRL_BPP_15_16;
>>  +			break;
>>  +		case DRM_FORMAT_XRGB8888:
>>  +			ctrl |=3D JZ_LCD_CTRL_BPP_18_24;
>>  +			break;
>>  +		}
>>  +
>>  +		regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>>  +				   JZ_LCD_CTRL_BPP_MASK, ctrl);
>>  +	}
>>  +
>>  +	if (priv->soc_info->has_osd) {
>>  +		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>>  +			xy_reg =3D JZ_REG_LCD_XYP1;
>>  +			size_reg =3D JZ_REG_LCD_SIZE1;
>>  +		} else {
>>  +			xy_reg =3D JZ_REG_LCD_XYP0;
>>  +			size_reg =3D JZ_REG_LCD_SIZE0;
>>  +		}
>>  +
>>  +		regmap_write(priv->map, xy_reg,
>>  +			     state->crtc_x << JZ_LCD_XYP01_XPOS_LSB |
>>  +			     state->crtc_y << JZ_LCD_XYP01_YPOS_LSB);
>>  +		regmap_write(priv->map, size_reg,
>>  +			     state->crtc_w << JZ_LCD_SIZE01_WIDTH_LSB |
>>  +			     state->crtc_h << JZ_LCD_SIZE01_HEIGHT_LSB);
>>  +	}
>>  +}
>>  +
>>   static void ingenic_drm_plane_atomic_update(struct drm_plane =

>> *plane,
>>   					    struct drm_plane_state *oldstate)
>>   {
>>  -	struct ingenic_drm *priv =3D drm_plane_get_priv(plane);
>>  +	struct ingenic_drm *priv =3D drm_device_get_priv(plane->dev);
>>   	struct drm_plane_state *state =3D plane->state;
>>   	unsigned int width, height, cpp;
>>  +	unsigned int hwdesc_idx;
>>   	dma_addr_t addr;
>> =

>>   	if (state && state->fb) {
>>  @@ -274,9 +394,18 @@ static void =

>> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>>   		height =3D state->src_h >> 16;
>>   		cpp =3D state->fb->format->cpp[0];
>> =

>>  -		priv->dma_hwdesc->addr =3D addr;
>>  -		priv->dma_hwdesc->cmd =3D width * height * cpp / 4;
>>  -		priv->dma_hwdesc->cmd |=3D JZ_LCD_CMD_EOF_IRQ;
>>  +		if (!priv->soc_info->has_osd)
>>  +			hwdesc_idx =3D 0;
>>  +		else
> =

>>  +			hwdesc_idx =3D plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY;
> This looks ugly.
> "plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY" evaluates to a boolean.
> This is then ocnverted to an int used as index to an array later.
> Something a bit more explicit would be more readable.

I'll come up with something better.

>>  +
>>  +		priv->dma_hwdesc[hwdesc_idx]->addr =3D addr;
>>  +		priv->dma_hwdesc[hwdesc_idx]->cmd =3D width * height * cpp / 4;
>>  +		priv->dma_hwdesc[hwdesc_idx]->cmd |=3D JZ_LCD_CMD_EOF_IRQ;
>>  +
>>  +		if (drm_atomic_crtc_needs_modeset(state->crtc->state))
>>  +			ingenic_drm_plane_config(priv, plane,
>>  +						 state->fb->format->format);
>>   	}
>>   }
>> =

>>  @@ -437,6 +566,8 @@ static const struct drm_crtc_funcs =

>> ingenic_drm_crtc_funcs =3D {
>> =

>>   static const struct drm_plane_helper_funcs =

>> ingenic_drm_plane_helper_funcs =3D {
>>   	.atomic_update		=3D ingenic_drm_plane_atomic_update,
>>  +	.atomic_check		=3D ingenic_drm_plane_atomic_check,
>>  +	.atomic_disable		=3D ingenic_drm_plane_atomic_disable,
>>   	.prepare_fb		=3D drm_gem_fb_prepare_fb,
>>   };
>> =

>>  @@ -463,8 +594,10 @@ static void ingenic_drm_free_dma_hwdesc(void =

>> *d)
>>   {
>>   	struct ingenic_drm *priv =3D d;
>> =

>>  -	dma_free_coherent(priv->dev, sizeof(*priv->dma_hwdesc),
>>  -			  priv->dma_hwdesc, priv->dma_hwdesc_phys);
>>  +	dma_free_coherent(priv->dev, sizeof(*priv->dma_hwdesc[0]),
>>  +			  priv->dma_hwdesc[0], priv->dma_hwdesc_phys[0]);
>>  +	dma_free_coherent(priv->dev, sizeof(*priv->dma_hwdesc[1]),
>>  +			  priv->dma_hwdesc[1], priv->dma_hwdesc_phys[1]);
>>   }
>> =

>>   static int ingenic_drm_probe(struct platform_device *pdev)
>>  @@ -549,23 +682,32 @@ static int ingenic_drm_probe(struct =

>> platform_device *pdev)
>>   		bridge =3D devm_drm_panel_bridge_add_typed(dev, panel,
>>   							 DRM_MODE_CONNECTOR_DPI);
>> =

>>  -	priv->dma_hwdesc =3D dma_alloc_coherent(dev, =

>> sizeof(*priv->dma_hwdesc),
>>  -					      &priv->dma_hwdesc_phys,
>>  -					      GFP_KERNEL);
>>  -	if (!priv->dma_hwdesc)
>>  +	priv->dma_hwdesc[0] =3D dma_alloc_coherent(dev, =

>> sizeof(*priv->dma_hwdesc[0]),
>>  +						 &priv->dma_hwdesc_phys[0],
>>  +						 GFP_KERNEL);
>>  +	if (!priv->dma_hwdesc[0])
>>  +		return -ENOMEM;
>>  +
>>  +	priv->dma_hwdesc[0]->next =3D priv->dma_hwdesc_phys[0];
>>  +	priv->dma_hwdesc[0]->id =3D 0xdeafbead;
>>  +
>>  +	priv->dma_hwdesc[1] =3D dma_alloc_coherent(dev, =

>> sizeof(*priv->dma_hwdesc[1]),
>>  +						 &priv->dma_hwdesc_phys[1],
>>  +						 GFP_KERNEL);
>>  +	if (!priv->dma_hwdesc[1])
>>   		return -ENOMEM;
> Here you should undo the first allocation??
> I think the code could benefit from using dmam_alloc_coherent().

Right, good catch.

Thanks for the review!

Cheers,
-Paul

> =

>> =

>>  +	priv->dma_hwdesc[1]->next =3D priv->dma_hwdesc_phys[1];
>>  +	priv->dma_hwdesc[1]->id =3D 0xdeadbabe;
>>  +
>>   	ret =3D devm_add_action_or_reset(dev, ingenic_drm_free_dma_hwdesc, =

>> priv);
>>   	if (ret)
>>   		return ret;
>> =

>>  -	priv->dma_hwdesc->next =3D priv->dma_hwdesc_phys;
>>  -	priv->dma_hwdesc->id =3D 0xdeafbead;
>>  -
>>  -	drm_plane_helper_add(&priv->primary, =

>> &ingenic_drm_plane_helper_funcs);
>>  +	drm_plane_helper_add(&priv->f1, &ingenic_drm_plane_helper_funcs);
>> =

>>  -	ret =3D drm_universal_plane_init(drm, &priv->primary,
>>  -				       0, &ingenic_drm_primary_plane_funcs,
>>  +	ret =3D drm_universal_plane_init(drm, &priv->f1, 1,
>>  +				       &ingenic_drm_primary_plane_funcs,
>>   				       ingenic_drm_primary_formats,
>>   				       ARRAY_SIZE(ingenic_drm_primary_formats),
>>   				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>>  @@ -576,13 +718,30 @@ static int ingenic_drm_probe(struct =

>> platform_device *pdev)
>> =

>>   	drm_crtc_helper_add(&priv->crtc, &ingenic_drm_crtc_helper_funcs);
>> =

>>  -	ret =3D drm_crtc_init_with_planes(drm, &priv->crtc, &priv->primary,
>>  +	ret =3D drm_crtc_init_with_planes(drm, &priv->crtc, &priv->f1,
>>   					NULL, &ingenic_drm_crtc_funcs, NULL);
>>   	if (ret) {
>>   		dev_err(dev, "Failed to init CRTC: %i\n", ret);
>>   		return ret;
>>   	}
>> =

>>  +	if (soc_info->has_osd) {
>>  +		drm_plane_helper_add(&priv->f0,
>>  +				     &ingenic_drm_plane_helper_funcs);
>>  +
>>  +		ret =3D drm_universal_plane_init(drm, &priv->f0, 1,
>>  +					       &ingenic_drm_primary_plane_funcs,
>>  +					       ingenic_drm_primary_formats,
>>  +					       ARRAY_SIZE(ingenic_drm_primary_formats),
>>  +					       NULL, DRM_PLANE_TYPE_OVERLAY,
>>  +					       NULL);
>>  +		if (ret) {
>>  +			dev_err(dev, "Failed to register overlay plane: %i\n",
>>  +				ret);
>>  +			return ret;
>>  +		}
>>  +	}
>>  +
>>   	priv->encoder.possible_crtcs =3D 1;
>> =

>>   	drm_encoder_helper_add(&priv->encoder,
>>  @@ -644,7 +803,12 @@ static int ingenic_drm_probe(struct =

>> platform_device *pdev)
>>   	}
>> =

>>   	/* Set address of our DMA descriptor chain */
>>  -	regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc_phys);
>>  +	regmap_write(priv->map, JZ_REG_LCD_DA0, priv->dma_hwdesc_phys[0]);
>>  +	regmap_write(priv->map, JZ_REG_LCD_DA1, priv->dma_hwdesc_phys[1]);
>>  +
>>  +	/* Enable OSD if available */
>>  +	if (soc_info->has_osd)
>>  +		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
>> =

>>   	ret =3D drm_dev_register(drm, 0);
>>   	if (ret) {
>>  @@ -680,18 +844,21 @@ static int ingenic_drm_remove(struct =

>> platform_device *pdev)
>> =

>>   static const struct jz_soc_info jz4740_soc_info =3D {
>>   	.needs_dev_clk =3D true,
>>  +	.has_osd =3D false,
>>   	.max_width =3D 800,
>>   	.max_height =3D 600,
>>   };
>> =

>>   static const struct jz_soc_info jz4725b_soc_info =3D {
>>   	.needs_dev_clk =3D false,
>>  +	.has_osd =3D true,
>>   	.max_width =3D 800,
>>   	.max_height =3D 600,
>>   };
>> =

>>   static const struct jz_soc_info jz4770_soc_info =3D {
>>   	.needs_dev_clk =3D false,
>>  +	.has_osd =3D true,
>>   	.max_width =3D 1280,
>>   	.max_height =3D 720,
>>   };
>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h =

>> b/drivers/gpu/drm/ingenic/ingenic-drm.h
>>  index cb578cff7bb1..d0b827a9fe83 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-drm.h
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
>>  @@ -30,6 +30,18 @@
>>   #define JZ_REG_LCD_SA1				0x54
>>   #define JZ_REG_LCD_FID1				0x58
>>   #define JZ_REG_LCD_CMD1				0x5C
>>  +#define JZ_REG_LCD_OSDC				0x100
>>  +#define JZ_REG_LCD_OSDCTRL			0x104
>>  +#define JZ_REG_LCD_OSDS				0x108
>>  +#define JZ_REG_LCD_BGC				0x10c
>>  +#define JZ_REG_LCD_KEY0				0x110
>>  +#define JZ_REG_LCD_KEY1				0x114
>>  +#define JZ_REG_LCD_ALPHA			0x118
>>  +#define JZ_REG_LCD_IPUR				0x11c
>>  +#define JZ_REG_LCD_XYP0				0x120
>>  +#define JZ_REG_LCD_XYP1				0x124
>>  +#define JZ_REG_LCD_SIZE0			0x128
>>  +#define JZ_REG_LCD_SIZE1			0x12c
>> =

>>   #define JZ_LCD_CFG_SLCD				BIT(31)
>>   #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
>>  @@ -123,4 +135,27 @@
>>   #define JZ_LCD_STATE_SOF_IRQ			BIT(4)
>>   #define JZ_LCD_STATE_DISABLED			BIT(0)
>> =

>>  +#define JZ_LCD_OSDC_OSDEN			BIT(0)
>>  +#define JZ_LCD_OSDC_F0EN			BIT(3)
>>  +#define JZ_LCD_OSDC_F1EN			BIT(4)
>>  +
>>  +#define JZ_LCD_OSDCTRL_IPU			BIT(15)
>>  +#define JZ_LCD_OSDCTRL_RGB555			BIT(4)
>>  +#define JZ_LCD_OSDCTRL_CHANGE			BIT(3)
>>  +#define JZ_LCD_OSDCTRL_BPP_15_16		0x4
>>  +#define JZ_LCD_OSDCTRL_BPP_18_24		0x5
>>  +#define JZ_LCD_OSDCTRL_BPP_30			0x7
>>  +#define JZ_LCD_OSDCTRL_BPP_MASK			(JZ_LCD_OSDCTRL_RGB555 | 0x7)
>>  +
>>  +#define JZ_LCD_OSDS_READY			BIT(0)
>>  +
>>  +#define JZ_LCD_IPUR_IPUREN			BIT(31)
>>  +#define JZ_LCD_IPUR_IPUR_LSB			0
>>  +
>>  +#define JZ_LCD_XYP01_XPOS_LSB			0
>>  +#define JZ_LCD_XYP01_YPOS_LSB			16
>>  +
>>  +#define JZ_LCD_SIZE01_WIDTH_LSB			0
>>  +#define JZ_LCD_SIZE01_HEIGHT_LSB		16
>>  +
>>   #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
>>  --
>>  2.27.0
>> =

>>  _______________________________________________
>>  dri-devel mailing list
>>  dri-devel@lists.freedesktop.org
>>  https://lists.freedesktop.org/mailman/listinfo/dri-devel


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
