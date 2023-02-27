Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1076A3FCB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 11:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3710E1CA;
	Mon, 27 Feb 2023 10:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595E510E1C3;
 Mon, 27 Feb 2023 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677495500; x=1709031500;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hwdLr331ukM6N2pylNn8Bx92mtzEy4WdJY/XiKnJ71k=;
 b=M+ahNMYUil2reXIpeqvczpRkmOEDp3CTK6qoStTfUgQdHo+0rHFJmknt
 hO6xOpvf6FeJtHoHQrDi6JFvdA+fpA0XbKx6MfuVcpwVKKCFjzYVOEyap
 hZ54tffg4QSxNVgINUvltwOSIaYBuT9BNjfASJ8/0CKwR0coUX8izjy8I
 UEUkqXWdPspfXgrjAKcN3HwX9ybDoAfXMaD6M6WMmWIWUMvdI39Ij8KD2
 5xUEbRz13yuKtTSapc5/nOznKV54IJf65GfGGzLSwW8IZn0DVlhInfBCV
 ZSnlY5Yke8yC8OxSzc3GMIdZvfbadAYgeQvXLYjI4jQ4lQ7yuRZuZFWVA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="361389297"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="361389297"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 02:58:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="919264761"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="919264761"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 02:58:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Yaroslav Bolyukin <iam@lach.pw>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drm/edid: parse DRM VESA dsc bpp target
In-Reply-To: <20230226141051.21767-2-iam@lach.pw>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230226141051.21767-1-iam@lach.pw>
 <20230226141051.21767-2-iam@lach.pw>
Date: Mon, 27 Feb 2023 12:58:11 +0200
Message-ID: <874jr72x4s.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 Yaroslav Bolyukin <iam@lach.pw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 26 Feb 2023, Yaroslav Bolyukin <iam@lach.pw> wrote:
> As per DisplayID v2.0 Errata E9 spec "DSC pass-through timing support"
> VESA vendor-specific data block may contain target DSC bits per pixel
> fields
>
> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
> ---
>  drivers/gpu/drm/drm_edid.c  | 38 +++++++++++++++++++++++++------------
>  include/drm/drm_connector.h |  6 ++++++
>  include/drm/drm_displayid.h |  4 ++++
>  3 files changed, 36 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 3d0a4da661bc..aa88ac82cbe0 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6338,7 +6338,7 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  	if (oui(vesa->oui[0], vesa->oui[1], vesa->oui[2]) != VESA_IEEE_OUI)
>  		return;
>  
> -	if (sizeof(*vesa) != sizeof(*block) + block->num_bytes) {
> +	if (block->num_bytes < 5) {
>  		drm_dbg_kms(connector->dev,
>  			    "[CONNECTOR:%d:%s] Unexpected VESA vendor block size\n",
>  			    connector->base.id, connector->name);
> @@ -6361,24 +6361,37 @@ static void drm_parse_vesa_mso_data(struct drm_connector *connector,
>  		break;
>  	}
>  
> -	if (!info->mso_stream_count) {
> -		info->mso_pixel_overlap = 0;
> -		return;
> -	}
> +	info->mso_pixel_overlap = 0;
> +
> +	if (info->mso_stream_count) {
> +		info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
> +
> +		if (info->mso_pixel_overlap > 8) {
> +			drm_dbg_kms(connector->dev,
> +				    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
> +				    connector->base.id, connector->name,
> +				    info->mso_pixel_overlap);
> +			info->mso_pixel_overlap = 8;
> +		}
>  
> -	info->mso_pixel_overlap = FIELD_GET(DISPLAYID_VESA_MSO_OVERLAP, vesa->mso);
> -	if (info->mso_pixel_overlap > 8) {
>  		drm_dbg_kms(connector->dev,
> -			    "[CONNECTOR:%d:%s] Reserved MSO pixel overlap value %u\n",
> +			    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
>  			    connector->base.id, connector->name,
> -			    info->mso_pixel_overlap);
> -		info->mso_pixel_overlap = 8;
> +			    info->mso_stream_count, info->mso_pixel_overlap);
> +	}
> +
> +	if (block->num_bytes < 7) {
> +		/* DSC bpp is optional */
> +		return;
>  	}
>  
> +	info->dp_dsc_bpp = FIELD_GET(DISPLAYID_VESA_DSC_BPP_INT, vesa->dsc_bpp_int) * 16
> +		+ FIELD_GET(DISPLAYID_VESA_DSC_BPP_FRACT, vesa->dsc_bpp_fract);
> +

Matter of taste, but I'd probably use << 4 and |. *shrug*

>  	drm_dbg_kms(connector->dev,
> -		    "[CONNECTOR:%d:%s] MSO stream count %u, pixel overlap %u\n",
> +		    "[CONNECTOR:%d:%s] DSC bits per pixel %u\n",
>  		    connector->base.id, connector->name,
> -		    info->mso_stream_count, info->mso_pixel_overlap);
> +		    info->dp_dsc_bpp);
>  }
>  
>  static void drm_update_mso(struct drm_connector *connector,
> @@ -6425,6 +6438,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
>  	info->mso_stream_count = 0;
>  	info->mso_pixel_overlap = 0;
>  	info->max_dsc_bpp = 0;
> +	info->dp_dsc_bpp = 0;
>  
>  	kfree(info->vics);
>  	info->vics = NULL;
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 7b5048516185..1d01e0146a7f 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -719,6 +719,12 @@ struct drm_display_info {
>  	 */
>  	u32 max_dsc_bpp;
>  
> +	/**
> +	 * @dp_dsc_bpp: DP Display-Stream-Compression (DSC) timing's target
> +	 * DST bits per pixel in 6.4 fixed point format. 0 means undefined

DST?

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> +	 */
> +	u16 dp_dsc_bpp;
> +
>  	/**
>  	 * @vics: Array of vics_len VICs. Internal to EDID parsing.
>  	 */
> diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
> index 49649eb8447e..0fc3afbd1675 100644
> --- a/include/drm/drm_displayid.h
> +++ b/include/drm/drm_displayid.h
> @@ -131,12 +131,16 @@ struct displayid_detailed_timing_block {
>  
>  #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
>  #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
> +#define DISPLAYID_VESA_DSC_BPP_INT	GENMASK(5, 0)
> +#define DISPLAYID_VESA_DSC_BPP_FRACT	GENMASK(3, 0)
>  
>  struct displayid_vesa_vendor_specific_block {
>  	struct displayid_block base;
>  	u8 oui[3];
>  	u8 data_structure_type;
>  	u8 mso;
> +	u8 dsc_bpp_int;
> +	u8 dsc_bpp_fract;
>  } __packed;
>  
>  /* DisplayID iteration */

-- 
Jani Nikula, Intel Open Source Graphics Center
