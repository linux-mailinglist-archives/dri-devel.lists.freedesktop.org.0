Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA89232B58
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 07:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB74D6E851;
	Thu, 30 Jul 2020 05:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0AB6E851
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 05:27:08 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 022F0804D8;
 Thu, 30 Jul 2020 07:27:03 +0200 (CEST)
Date: Thu, 30 Jul 2020 07:27:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] drm/ingenic: ipu: Only restart manually on older SoCs
Message-ID: <20200730052702.GA1429781@ravnborg.org>
References: <20200730014626.83895-1-paul@crapouillou.net>
 <20200730014626.83895-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200730014626.83895-2-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8
 a=OIODGcd-7M2Q43qThiUA:9 a=tsY6iTuTbHcPZO7O:21 a=fjEtzezOzUu0zJxH:21
 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 03:46:24AM +0200, Paul Cercueil wrote:
> On older SoCs, it is necessary to restart manually the IPU when a frame
> is done processing. Doing so on newer SoCs (JZ4760/70) kinds of work
> too, until the input or output resolutions or the framerate are too
> high.
> 
> Make it work properly on newer SoCs by letting the LCD controller
> trigger the IPU frame restart signal.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/ingenic/ingenic-ipu.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> index 7a0a8bd865d3..7eae56fa92ea 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
> @@ -35,6 +35,7 @@ struct soc_info {
>  	const u32 *formats;
>  	size_t num_formats;
>  	bool has_bicubic;
> +	bool manual_restart;
>  
>  	void (*set_coefs)(struct ingenic_ipu *ipu, unsigned int reg,
>  			  unsigned int sharpness, bool downscale,
> @@ -645,7 +646,8 @@ static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
>  	unsigned int dummy;
>  
>  	/* dummy read allows CPU to reconfigure IPU */
> -	regmap_read(ipu->map, JZ_REG_IPU_STATUS, &dummy);
> +	if (ipu->soc_info->manual_restart)
> +		regmap_read(ipu->map, JZ_REG_IPU_STATUS, &dummy);
>  
>  	/* ACK interrupt */
>  	regmap_write(ipu->map, JZ_REG_IPU_STATUS, 0);
> @@ -656,7 +658,8 @@ static irqreturn_t ingenic_ipu_irq_handler(int irq, void *arg)
>  	regmap_write(ipu->map, JZ_REG_IPU_V_ADDR, ipu->addr_v);
>  
>  	/* Run IPU for the new frame */
> -	regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_RUN);
> +	if (ipu->soc_info->manual_restart)
> +		regmap_set_bits(ipu->map, JZ_REG_IPU_CTRL, JZ_IPU_CTRL_RUN);
>  
>  	drm_crtc_handle_vblank(crtc);
>  
> @@ -806,6 +809,7 @@ static const struct soc_info jz4725b_soc_info = {
>  	.formats	= jz4725b_ipu_formats,
>  	.num_formats	= ARRAY_SIZE(jz4725b_ipu_formats),
>  	.has_bicubic	= false,
> +	.manual_restart	= true,
>  	.set_coefs	= jz4725b_set_coefs,
>  };
>  
> @@ -831,6 +835,7 @@ static const struct soc_info jz4760_soc_info = {
>  	.formats	= jz4760_ipu_formats,
>  	.num_formats	= ARRAY_SIZE(jz4760_ipu_formats),
>  	.has_bicubic	= true,
> +	.manual_restart	= false,
>  	.set_coefs	= jz4760_set_coefs,
>  };
>  
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
