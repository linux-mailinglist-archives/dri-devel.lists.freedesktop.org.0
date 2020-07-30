Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EAF234030
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0276EA09;
	Fri, 31 Jul 2020 07:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2996E920
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 16:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1596126074; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GLywFInFbZpsDWDDgkVCtHSQx1nOq8RfSg1sbqqGqrc=;
 b=lcmdvNQVbj+DlLOZwcGS+JUlh+v7lQJ4ZPJYFbLEiFzficmHr7lqicyHxRIoYnw1sxvJnG
 8C89/bQKHAB5fus62ESfN6xAf3mB0oYeUC3qHMlnspX5TE5/2d2pwZiX5gSLtoLHdz+B/D
 ayrjUH08OFO7gTXOYbfdHFP1v4cbv7U=
Date: Thu, 30 Jul 2020 18:21:05 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/3] drm/ingenic: ipu: Only enable clock when needed
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <6RIAEQ.2KRLCE1YRKKB1@crapouillou.net>
In-Reply-To: <20200730152958.GB1474381@ravnborg.org>
References: <20200730144830.10479-1-paul@crapouillou.net>
 <20200730144830.10479-4-paul@crapouillou.net>
 <20200730152958.GB1474381@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jul 2020 07:36:08 +0000
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
Cc: David Airlie <airlied@linux.ie>, od@zcrc.me,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le jeu. 30 juil. 2020 =E0 17:29, Sam Ravnborg <sam@ravnborg.org> a =

=E9crit :
> On Thu, Jul 30, 2020 at 04:48:30PM +0200, Paul Cercueil wrote:
>>  Instead of keeping the IPU clock enabled constantly, enable and =

>> disable
>>  it on demand, when the IPU plane is used. That way, we won't use any
>>  extra power when the IPU is not used.
>> =

>>  v2: Explain the reason of this patch
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> =

> And thanks for the quick update!

Pushed to drm-misc-next. Thanks!

Cheers,
-Paul

> =

> 	Sam
> =

>>  ---
>>   drivers/gpu/drm/ingenic/ingenic-ipu.c | 23 ++++++++++++++++++++---
>>   1 file changed, 20 insertions(+), 3 deletions(-)
>> =

>>  diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c =

>> b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>  index 7dd2a6ae4994..fc8c6e970ee3 100644
>>  --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>  +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
>>  @@ -49,6 +49,7 @@ struct ingenic_ipu {
>>   	struct regmap *map;
>>   	struct clk *clk;
>>   	const struct soc_info *soc_info;
>>  +	bool clk_enabled;
>> =

>>   	unsigned int num_w, num_h, denom_w, denom_h;
>> =

>>  @@ -288,12 +289,23 @@ static void =

>> ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
>>   	const struct drm_format_info *finfo;
>>   	u32 ctrl, stride =3D 0, coef_index =3D 0, format =3D 0;
>>   	bool needs_modeset, upscaling_w, upscaling_h;
>>  +	int err;
>> =

>>   	if (!state || !state->fb)
>>   		return;
>> =

>>   	finfo =3D drm_format_info(state->fb->format->format);
>> =

>>  +	if (!ipu->clk_enabled) {
>>  +		err =3D clk_enable(ipu->clk);
>>  +		if (err) {
>>  +			dev_err(ipu->dev, "Unable to enable clock: %d\n", err);
>>  +			return;
>>  +		}
>>  +
>>  +		ipu->clk_enabled =3D true;
>>  +	}
>>  +
>>   	/* Reset all the registers if needed */
>>   	needs_modeset =3D drm_atomic_crtc_needs_modeset(state->crtc->state);
>>   	if (needs_modeset) {
>>  @@ -578,6 +590,11 @@ static void =

>> ingenic_ipu_plane_atomic_disable(struct drm_plane *plane,
>>   	regmap_clear_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_CHIP_EN);
>> =

>>   	ingenic_drm_plane_disable(ipu->master, plane);
>>  +
>>  +	if (ipu->clk_enabled) {
>>  +		clk_disable(ipu->clk);
>>  +		ipu->clk_enabled =3D false;
>>  +	}
>>   }
>> =

>>   static const struct drm_plane_helper_funcs =

>> ingenic_ipu_plane_helper_funcs =3D {
>>  @@ -761,9 +778,9 @@ static int ingenic_ipu_bind(struct device *dev, =

>> struct device *master, void *d)
>>   	drm_object_attach_property(&plane->base, ipu->sharpness_prop,
>>   				   ipu->sharpness);
>> =

>>  -	err =3D clk_prepare_enable(ipu->clk);
>>  +	err =3D clk_prepare(ipu->clk);
>>   	if (err) {
>>  -		dev_err(dev, "Unable to enable clock\n");
>>  +		dev_err(dev, "Unable to prepare clock\n");
>>   		return err;
>>   	}
>> =

>>  @@ -775,7 +792,7 @@ static void ingenic_ipu_unbind(struct device =

>> *dev,
>>   {
>>   	struct ingenic_ipu *ipu =3D dev_get_drvdata(dev);
>> =

>>  -	clk_disable_unprepare(ipu->clk);
>>  +	clk_unprepare(ipu->clk);
>>   }
>> =

>>   static const struct component_ops ingenic_ipu_ops =3D {
>>  --
>>  2.27.0


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
