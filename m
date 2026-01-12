Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDBFD13272
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 15:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8949710E3E6;
	Mon, 12 Jan 2026 14:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="yBh5Kpju";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F3E10E3E6;
 Mon, 12 Jan 2026 14:33:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EA98DC20868;
 Mon, 12 Jan 2026 14:32:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6D907606FA;
 Mon, 12 Jan 2026 14:33:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E869103C8C61; Mon, 12 Jan 2026 15:33:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1768228391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=qmlshV5NpxO8re8gvlPG+CnbWdNv+haEK2zKL5reHog=;
 b=yBh5KpjuyCAR31FHRku/3KZ8H68Lu9Il+dB25bH0IsabcG+1DWEM1r6eHvGIezdFQeQhdP
 i2SHLnzOI4leV/m4Qabu3ugBz08r9Tj1vfosrhilaeMfZgPGIxYiyZBnfcpQj1v/Wmk2Jz
 BEF+JAPZSK47oPEc7k5bGyiS1BMx/lsxRs9NE2Dbd28yFdHedviEKRrWHOacHbGInJbjYk
 2mrx5p81XkS8od7/TKw8lHDisz8YnJSl+UmPjnNaZ6Iqse32CHOeRvl9vw43Y1wNQf79Bx
 yYW3dpbTQTvOoEkOgTyR61Ou3kZebUlBiedUiSLYmkESSzNbd3Le6FM898YBzw==
Message-ID: <0f403bff-c82c-4b36-b6d7-b6b03a0b6be8@bootlin.com>
Date: Mon, 12 Jan 2026 15:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/13] drm/vkms: Hook up colorop destroy helper for
 plane pipelines
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
 <20260109081728.478844-9-chaitanya.kumar.borah@intel.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260109081728.478844-9-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 1/9/26 09:17, Chaitanya Kumar Borah wrote:
> Provide a drm_colorop_funcs instance for vkms color pipeline
> objects and hook up the common drm_colorop_destroy() helper as the
> destroy callback.
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Reviewed-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>   drivers/gpu/drm/vkms/vkms_colorop.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/vkms/vkms_colorop.c
> index 9e9dd0494628..ba826ad384b7 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -12,6 +12,10 @@ static const u64 supported_tfs =
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF);
>   
> +static const struct drm_colorop_funcs vkms_colorop_funcs = {
> +	.destroy = drm_colorop_destroy,
> +};
> +
>   #define MAX_COLOR_PIPELINE_OPS 4
>   
>   static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_prop_enum_list *list)
> @@ -31,7 +35,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &vkms_colorop_funcs,
> +					      supported_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
> @@ -48,7 +53,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, &vkms_colorop_funcs,
>   					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
> @@ -65,7 +70,7 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +	ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, &vkms_colorop_funcs,
>   					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;
> @@ -82,7 +87,8 @@ static int vkms_initialize_color_pipeline(struct drm_plane *plane, struct drm_pr
>   		goto cleanup;
>   	}
>   
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, supported_tfs,
> +	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, &vkms_colorop_funcs,
> +					      supported_tfs,
>   					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
>   	if (ret)
>   		goto cleanup;

