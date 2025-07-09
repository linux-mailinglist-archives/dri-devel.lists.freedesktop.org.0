Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 878FFAFF217
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE8B10E827;
	Wed,  9 Jul 2025 19:56:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mBsvRYmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7262510E819;
 Wed,  9 Jul 2025 19:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v50Es8LiRxQaBzdyvHIUhOSjlF/TdkUwMMDLgC34goc=; b=mBsvRYmVQZ4S1C7sVri/6BUxz2
 Ch/p+rREhgYdaDr7Lvj6yPkmMm3UGnqECTLJVJdoaoAMpLtlSNgvLtAF+SF4JTAtZNNummYyQQidT
 X4hfTt7U1D3j5o13TCHT1MqRQkMG01RjxYRMDoIDAI7+e5DBZukMDnlAH0cLjPIFyYmVdsUOcUb6Z
 mUALEiQV8GR92IMnMpuGJPwcNWFRzPi4Vk0h4rE5ls0IzPV625Knl+L/UpZBM3PqmHuepkaYZS38E
 Z9xEcQf5e84WeXJOUSX6eHI1vTXv40j8SRAbCy8MOw+OItb7MbXmjxREcShoyGr+RFPWb2nrh4DsF
 34bK7Uig==;
Received: from [165.204.54.249] (helo=[192.168.111.39])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uZau8-00EcoL-IB; Wed, 09 Jul 2025 21:56:32 +0200
Message-ID: <a56d267c-734e-4787-a035-c39eb062bc3f@igalia.com>
Date: Wed, 9 Jul 2025 15:56:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 45/46] drm/amd/display: Ensure 3D LUT for color
 pipeline
To: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com, arthurgrillo@riseup.net
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-46-alex.hung@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20250617041746.2884343-46-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 17/06/2025 00:17, Alex Hung wrote:
> Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops in
> colorpipeline and handling these colorops.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
> V10:
>   - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops
>     (Melissa Wen)
>
>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  47 ++++----
>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 103 +++++++++---------
>   2 files changed, 78 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index b53aecd1bebc..c6d4a9365c00 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -1825,6 +1825,7 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   {
>   	struct drm_colorop *colorop = plane_state->color_pipeline;
>   	struct drm_device *dev = plane_state->plane->dev;
> +	struct amdgpu_device *adev = drm_to_adev(dev);
>   	int ret;
>   
>   	/* 1D Curve - DEGAM TF */
> @@ -1857,32 +1858,34 @@ amdgpu_dm_plane_set_colorop_properties(struct drm_plane_state *plane_state,
>   	if (ret)
>   		return ret;
>   
> -	/* 1D Curve & LUT - SHAPER TF & LUT */
> -	colorop = colorop->next;
> -	if (!colorop) {
> -		drm_dbg(dev, "no Shaper TF colorop found\n");
> -		return -EINVAL;
> -	}
> +	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {

No I think it will not work as expected for movable 3D LUT, since 
movable 3D LUT is a MPC capability.
I have actually sent a patch in the past to clarify this on DCN401. So, 
this check doesn't cover this driver anymore, for example.
- https://lore.kernel.org/amd-gfx/20250425205236.318520-1-mwen@igalia.com/

But I also don't know how to make a more generic check in this movable 
3D LUT case.
Any better idea?

Melissa

> +		/* 1D Curve & LUT - SHAPER TF & LUT */
> +		colorop = colorop->next;
> +		if (!colorop) {
> +			drm_dbg(dev, "no Shaper TF colorop found\n");
> +			return -EINVAL;
> +		}
>   
> -	ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
> -	if (ret)
> -		return ret;
> +		ret = __set_dm_plane_colorop_shaper(plane_state, dc_plane_state, colorop);
> +		if (ret)
> +			return ret;
>   
> -	/* Shaper LUT colorop is already handled, just skip here */
> -	colorop = colorop->next;
> -	if (!colorop)
> -		return -EINVAL;
> +		/* Shaper LUT colorop is already handled, just skip here */
> +		colorop = colorop->next;
> +		if (!colorop)
> +			return -EINVAL;
>   
> -	/* 3D LUT */
> -	colorop = colorop->next;
> -	if (!colorop) {
> -		drm_dbg(dev, "no 3D LUT colorop found\n");
> -		return -EINVAL;
> -	}
> +		/* 3D LUT */
> +		colorop = colorop->next;
> +		if (!colorop) {
> +			drm_dbg(dev, "no 3D LUT colorop found\n");
> +			return -EINVAL;
> +		}
>   
> -	ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
> -	if (ret)
> -		return ret;
> +		ret = __set_dm_plane_colorop_3dlut(plane_state, dc_plane_state, colorop);
> +		if (ret)
> +			return ret;
> +	}
>   
>   	/* 1D Curve & LUT - BLND TF & LUT */
>   	colorop = colorop->next;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index 680b4e783959..fdb653548c9a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -31,6 +31,7 @@
>   
>   #include "amdgpu.h"
>   #include "amdgpu_dm_colorop.h"
> +#include "dc.h"
>   
>   const u64 amdgpu_dm_supported_degam_tfs =
>   	BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
> @@ -55,6 +56,7 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   {
>   	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
>   	struct drm_device *dev = plane->dev;
> +	struct amdgpu_device *adev = drm_to_adev(dev);
>   	int ret;
>   	int i = 0;
>   
> @@ -108,57 +110,58 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_plane *plane, struct drm_pr
>   
>   	i++;
>   
> -	/* 1D curve - SHAPER TF */
> -	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> -	if (!ops[i]) {
> -		ret = -ENOMEM;
> -		goto cleanup;
> -	}
> -
> -	ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> -					      amdgpu_dm_supported_shaper_tfs,
> -					      DRM_COLOROP_FLAG_ALLOW_BYPASS);
> -	if (ret)
> -		goto cleanup;
> -
> -	drm_colorop_set_next_property(ops[i-1], ops[i]);
> -
> -	i++;
> -
> -	/* 1D LUT - SHAPER LUT */
> -	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> -	if (!ops[i]) {
> -		ret = -ENOMEM;
> -		goto cleanup;
> +	if (adev->dm.dc->caps.color.dpp.hw_3d_lut) {
> +		/* 1D curve - SHAPER TF */
> +		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +		if (!ops[i]) {
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +
> +		ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +						amdgpu_dm_supported_shaper_tfs,
> +						DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +		if (ret)
> +			goto cleanup;
> +
> +		drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +		i++;
> +
> +		/* 1D LUT - SHAPER LUT */
> +		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +		if (!ops[i]) {
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +
> +		ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
> +							DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +							DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +		if (ret)
> +			goto cleanup;
> +
> +		drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +		i++;
> +
> +		/* 3D LUT */
> +		ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> +		if (!ops[i]) {
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +
> +		ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
> +					DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> +					DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +		if (ret)
> +			goto cleanup;
> +
> +		drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +		i++;
>   	}
> -
> -	ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, MAX_COLOR_LUT_ENTRIES,
> -						  DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> -						  DRM_COLOROP_FLAG_ALLOW_BYPASS);
> -	if (ret)
> -		goto cleanup;
> -
> -	drm_colorop_set_next_property(ops[i-1], ops[i]);
> -
> -	i++;
> -
> -	/* 3D LUT */
> -	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
> -	if (!ops[i]) {
> -		ret = -ENOMEM;
> -		goto cleanup;
> -	}
> -
> -	ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, LUT3D_SIZE,
> -				     DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> -				     DRM_COLOROP_FLAG_ALLOW_BYPASS);
> -	if (ret)
> -		goto cleanup;
> -
> -	drm_colorop_set_next_property(ops[i-1], ops[i]);
> -
> -	i++;
> -
>   	/* 1D curve - BLND TF */
>   	ops[i] = kzalloc(sizeof(struct drm_colorop), GFP_KERNEL);
>   	if (!ops[i]) {

