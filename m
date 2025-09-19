Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F5DB89831
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 14:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEC910E9AB;
	Fri, 19 Sep 2025 12:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="d2zuy98N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB5F10E9AD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 12:44:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0B2361A0F14;
 Fri, 19 Sep 2025 12:44:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BB46D606A8;
 Fri, 19 Sep 2025 12:44:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 20368102F1847; 
 Fri, 19 Sep 2025 14:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1758285867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=6EuFRSBEJ49nCnM0kFPun8PUGYSyL4tgpIJXd9V9+nc=;
 b=d2zuy98NKJAhJ076/aVd+4uYZCWSzMFEWE6FGyTBFGYm4KmBfI1BIGreRusympFPDumfgF
 VIFslIDCiaTKo7P88Rd2NDyCSN7YNcDsKWadlPFTeZJwcM6iICiOHyrn9q0N4BHzVZzdTh
 Z2CT1ZSKvPA8A/KyjwAvKuNXh5WL3G6zqXHAt73CT6DuzuRr+dUHRSwdRoZ+mKpfjC10NP
 DBbgOOKEPY2F9Qv7hnqswlcqzSRFYLtwFUDcpWCzsRLvjEamhvJOLT+jWkx/foALG3xGyx
 1i5CGryWbZImZW1MQfWFopY0CDdI+xgsLI6sU5kyLHn7uxIIZaLp9kXFXZErag==
Message-ID: <df347ef3-f4b5-4402-bc37-dec03e6b1ad6@bootlin.com>
Date: Fri, 19 Sep 2025 14:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH RFC v2 10/20] drm/colorop: Introduce colorop helpers for
 crtc
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
 <20250917-mtk-post-blend-color-pipeline-v2-10-ac4471b44758@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-10-ac4471b44758@collabora.com>
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
> Introduce colorop helper counterparts for post-blend color pipelines
> that take a CRTC instead of a plane.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/drm_colorop.c | 73 +++++++++++++++++++++++++++++++++++++++++++
>   include/drm/drm_colorop.h     |  8 +++++
>   2 files changed, 81 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index db137169effa6cd9e6d5805f65bdfd1cc6882075..b0c3216f4dac22f3408cbd537a20f38d03abc0a7 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -168,6 +168,20 @@ static int drm_plane_colorop_init(struct drm_device *dev,
>   	return ret;
>   }
>   
> +static int drm_crtc_colorop_init(struct drm_device *dev,
> +				 struct drm_colorop *colorop,
> +				 struct drm_crtc *crtc,
> +				 enum drm_colorop_type type, uint32_t flags)
> +{
> +	int ret;
> +
> +	ret = drm_common_colorop_init(dev, colorop, type, flags);
> +
> +	colorop->crtc = crtc;
> +
> +	return ret;
> +}
> +
>   /**
>    * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
>    *
> @@ -293,6 +307,23 @@ int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *
>   }
>   EXPORT_SYMBOL(drm_plane_colorop_curve_1d_init);
>   
> +int drm_crtc_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				   struct drm_crtc *crtc, u64 supported_tfs, uint32_t flags)
> +{
> +	int ret;
> +
> +	ret = drm_colorop_has_supported_tf(dev, &crtc->base, crtc->name, supported_tfs);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_1D_CURVE, flags);
> +	if (ret)
> +		return ret;
> +
> +	return drm_common_colorop_curve_1d_init(dev, colorop, supported_tfs, flags);
> +}
> +EXPORT_SYMBOL(drm_crtc_colorop_curve_1d_init);
> +
>   static int drm_colorop_create_data_prop(struct drm_device *dev, struct drm_colorop *colorop)
>   {
>   	struct drm_property *prop;
> @@ -381,6 +412,35 @@ drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *
>   }
>   EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>   
> +/**
> + * drm_crtc_colorop_curve_1d_lut_init - Initialize a DRM_COLOROP_1D_LUT
> + *
> + * @dev: DRM device
> + * @colorop: The drm_colorop object to initialize
> + * @crtc: The associated drm_crtc
> + * @lut_size: LUT size supported by driver
> + * @lut1d_interpolation: 1D LUT interpolation type
> + * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
> + * @return zero on success, -E value on failure
> + */
> +int
> +drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev,
> +				   struct drm_colorop *colorop,
> +				   struct drm_crtc *crtc, uint32_t lut_size,
> +				   enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
> +				   uint32_t flags)
> +{
> +	int ret;
> +
> +	ret = drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_1D_LUT, flags);
> +	if (ret)
> +		return ret;
> +
> +	return drm_common_colorop_curve_1d_lut_init(dev, colorop, lut_size,
> +						    lut1d_interpolation, flags);
> +}
> +EXPORT_SYMBOL(drm_crtc_colorop_curve_1d_lut_init);
> +
>   static int drm_common_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>   					   uint32_t flags)
>   {
> @@ -408,6 +468,19 @@ int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *c
>   }
>   EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>   
> +int drm_crtc_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				   struct drm_crtc *crtc, uint32_t flags)
> +{
> +	int ret;
> +
> +	ret = drm_crtc_colorop_init(dev, colorop, crtc, DRM_COLOROP_CTM_3X4, flags);
> +	if (ret)
> +		return ret;
> +
> +	return drm_common_colorop_ctm_3x4_init(dev, colorop, flags);
> +}
> +EXPORT_SYMBOL(drm_crtc_colorop_ctm_3x4_init);
> +
>   /**
>    * drm_plane_colorop_mult_init - Initialize a DRM_COLOROP_MULTIPLIER
>    *
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index 3e223f3b3597978c5d702ce7622ae30b8aa9dddb..e7d1e5e95a901b1bd91fd8580e2fcb367c0253ce 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -377,14 +377,22 @@ static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
>   
>   void drm_colorop_pipeline_destroy(struct drm_device *dev);
>   
> +int drm_crtc_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				       struct drm_crtc *crtc, uint32_t lut_size,
> +				       enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
> +				       uint32_t flags);
>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
>   				    struct drm_plane *plane, u64 supported_tfs, uint32_t flags);
> +int drm_crtc_colorop_curve_1d_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				   struct drm_crtc *crtc, u64 supported_tfs, uint32_t flags);
>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *colorop,
>   					struct drm_plane *plane, uint32_t lut_size,
>   					enum drm_colorop_lut1d_interpolation_type lut1d_interpolation,
>   					uint32_t flags);
>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
>   				   struct drm_plane *plane, uint32_t flags);
> +int drm_crtc_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
> +				   struct drm_crtc *crtc, uint32_t flags);
>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
>   				struct drm_plane *plane, uint32_t flags);
>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *colorop,
> 

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


