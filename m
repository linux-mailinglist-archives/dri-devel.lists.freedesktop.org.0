Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF66B89825
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 14:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6152810E9A0;
	Fri, 19 Sep 2025 12:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="s/S6JLhp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F20710E9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 12:43:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3287D4E40CF6;
 Fri, 19 Sep 2025 12:43:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 05310606A8;
 Fri, 19 Sep 2025 12:43:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 56EBC102F1935; 
 Fri, 19 Sep 2025 14:43:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758285807; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=YN0QUcu+9ztr+BxYPiX7mYVoICxMc0GmiDvU/ArXCAI=;
 b=s/S6JLhpOD0F0gG1RuW79ixYnNOKQAK7lgszzTGSPOcAT5/XlubpWJzSTRxNcxExt2mK2P
 HShV5VsxE+fKiWTRgP3aTlPfgQhxlO1PWlmYd6yBXrCjoCLexgDUhoGht318U48S9kae15
 TWhnKJXCNVoELLtCMpJWuUm7w5UBNMJgYYsTM89IZ1YFlu5bZVBC96g1goK5bBYi7AcPEl
 5nkI+XNcyMj5T4hL/ooJG7XZTyNUJRTbuY1GqS1YDCGL2e803lHr23rhugKrktavZ3o+f4
 MwMcz+SY/5tn8IaIqNzk3x4nWZiiNDsC6yD7216FRM9s09D+gLsEbCgbUM9SoA==
Message-ID: <0f3cbb7c-d627-44ed-b400-3b26b2acbde5@bootlin.com>
Date: Fri, 19 Sep 2025 14:43:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH RFC v2 03/20] drm: Factor out common color_pipeline
 property initialization code
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, kernel@collabora.com,
 daniels@collabora.com, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
 <20250917-mtk-post-blend-color-pipeline-v2-3-ac4471b44758@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-3-ac4471b44758@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 18/09/2025 à 02:43, Nícolas F. R. A. Prado a écrit :
> In preparation for sharing the initialization code for the color
> pipeline property between pre- and post-blend color pipelines, factor
> out the common initialization to a separate function.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/drm_crtc.c          | 44 +++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_crtc_internal.h |  5 +++++
>   drivers/gpu/drm/drm_plane.c         | 36 +++++-------------------------
>   3 files changed, 54 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 46655339003db2a1b43441434839e26f61d79b4e..94e60cffd29972aa979ac2f1932be7a6a97f3ada 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -959,3 +959,47 @@ bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
>   	return hweight32(crtc_state->encoder_mask) > 1;
>   }
>   EXPORT_SYMBOL(drm_crtc_in_clone_mode);
> +
> +struct drm_property *
> +drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
> +					  const struct drm_prop_enum_list *pipelines,
> +					  int num_pipelines)
> +{
> +	struct drm_prop_enum_list *all_pipelines;
> +	struct drm_property *prop;
> +	int len = 0;
> +	int i;
> +
> +	all_pipelines = kcalloc(num_pipelines + 1,
> +				sizeof(*all_pipelines),
> +				GFP_KERNEL);
> +
> +	if (!all_pipelines) {
> +		drm_err(dev, "failed to allocate color pipeline\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	/* Create default Bypass color pipeline */
> +	all_pipelines[len].type = 0;
> +	all_pipelines[len].name = "Bypass";
> +	len++;
> +
> +	/* Add all other color pipelines */
> +	for (i = 0; i < num_pipelines; i++, len++) {
> +		all_pipelines[len].type = pipelines[i].type;
> +		all_pipelines[len].name = pipelines[i].name;
> +	}
> +
> +	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
> +					"COLOR_PIPELINE",
> +					all_pipelines, len);
> +	if (IS_ERR(prop)) {
> +		kfree(all_pipelines);
> +		return prop;
> +	}
> +
> +	drm_object_attach_property(obj, prop, 0);
> +
> +	kfree(all_pipelines);
> +	return prop;
> +}
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index c094092296448093c5cd192ecdc8ea9a50769c90..e3dbdcbfa385b940ec0b5476adde6146fe4afde1 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -35,6 +35,7 @@
>   #ifndef __DRM_CRTC_INTERNAL_H__
>   #define __DRM_CRTC_INTERNAL_H__
>   
> +#include <drm/drm_property.h>
>   #include <linux/err.h>
>   #include <linux/types.h>
>   
> @@ -79,6 +80,10 @@ int drm_crtc_check_viewport(const struct drm_crtc *crtc,
>   int drm_crtc_register_all(struct drm_device *dev);
>   void drm_crtc_unregister_all(struct drm_device *dev);
>   int drm_crtc_force_disable(struct drm_crtc *crtc);
> +struct drm_property *
> +drm_common_create_color_pipeline_property(struct drm_device *dev, struct drm_mode_object *obj,
> +					  const struct drm_prop_enum_list *pipelines,
> +					  int num_pipelines);
>   
>   struct dma_fence *drm_crtc_create_fence(struct drm_crtc *crtc);
>   
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index f6cfa8ac090c7bc49c7f276993bba7e9800da140..60dbfcab495600dd44c15260a1fa6135db59c6e2 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1839,43 +1839,17 @@ int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
>   					     const struct drm_prop_enum_list *pipelines,
>   					     int num_pipelines)
>   {
> -	struct drm_prop_enum_list *all_pipelines;
>   	struct drm_property *prop;
> -	int len = 0;
> -	int i;
> -
> -	all_pipelines = kcalloc(num_pipelines + 1,
> -				sizeof(*all_pipelines),
> -				GFP_KERNEL);
> -
> -	if (!all_pipelines) {
> -		drm_err(plane->dev, "failed to allocate color pipeline\n");
> -		return -ENOMEM;
> -	}
>   
> -	/* Create default Bypass color pipeline */
> -	all_pipelines[len].type = 0;
> -	all_pipelines[len].name = "Bypass";
> -	len++;
> -
> -	/* Add all other color pipelines */
> -	for (i = 0; i < num_pipelines; i++, len++) {
> -		all_pipelines[len].type = pipelines[i].type;
> -		all_pipelines[len].name = pipelines[i].name;
> -	}
> -
> -	prop = drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
> -					"COLOR_PIPELINE",
> -					all_pipelines, len);
> -	if (IS_ERR(prop)) {
> -		kfree(all_pipelines);
> +	prop = drm_common_create_color_pipeline_property(plane->dev,
> +							 &plane->base,
> +							 pipelines,
> +							 num_pipelines);
> +	if (IS_ERR(prop))
>   		return PTR_ERR(prop);
> -	}
>   
> -	drm_object_attach_property(&plane->base, prop, 0);
>   	plane->color_pipeline_property = prop;
>   
> -	kfree(all_pipelines);
>   	return 0;
>   }
>   EXPORT_SYMBOL(drm_plane_create_color_pipeline_property);
> 

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


