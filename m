Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BD5672187
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 16:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F54D10E76E;
	Wed, 18 Jan 2023 15:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE13E10E76E;
 Wed, 18 Jan 2023 15:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674056471; x=1705592471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SxtG2gyel1mvg//mOJI9CRFqYiLMBMT1Rr2aAUB6AtY=;
 b=H4A3nmprKyhqhImowbGluryFWc7A9dBaJO11bNm6I6nvw/n2HuMBUnIV
 zlCcoSBULXmIJt72zdNPog13fI2L5zLYhsQVTsJUFHkCrbNUYJScffIP5
 vf3B3Fo5BdVb2Gv1zYf99Mp7plI8PabG3ZPIOX9Q5PHhTjtr80hXcai8x
 sjvMq85yZP4dVEBftK1dWRc2+4zjcT8zyG+vh4L5cM2lh8IcixJiGDf5P
 BlKUS6i8Zl42R7fdFRPDcq3rmj+zTnNm3n9/X6zrQl3rRPzMV4AYOd8E4
 P2Zkpiqa9q2spmPXVWiWGZthh07sNpY1hgKQE/K18TNLK8Sbf7CE9kSz3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="387359894"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="387359894"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 07:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690230758"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="690230758"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by orsmga008.jf.intel.com with SMTP; 18 Jan 2023 07:41:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Jan 2023 17:41:07 +0200
Date: Wed, 18 Jan 2023 17:41:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v7 09/22] drm/edid: fix and clarify HDMI VSDB audio
 latency parsing
Message-ID: <Y8gTE05TMrsEfND6@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
 <80426772a2d2e17bebf6f58d99b7d0cf6260c2d6.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80426772a2d2e17bebf6f58d99b7d0cf6260c2d6.1672826282.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 12:05:24PM +0200, Jani Nikula wrote:
> Add helpers for Latency_Fields_Present and I_Latency_Fields_Present
> bits, and fix the parsing:
> 
> - Respect specification regarding "I_Latency_Fields_Present shall be
>   zero if Latency_Fields_Present is zero".
> 
> - Don't claim latency fields are present if the data block isn't big
>   enough to hold them.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 076ba125c38d..847076b29594 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -4685,6 +4685,16 @@ static int add_3d_struct_modes(struct drm_connector *connector, u16 structure,
>  	return modes;
>  }
>  
> +static bool hdmi_vsdb_latency_present(const u8 *db)
> +{
> +	return db[8] & BIT(7);
> +}
> +
> +static bool hdmi_vsdb_i_latency_present(const u8 *db)
> +{
> +	return hdmi_vsdb_latency_present(db) && db[8] & BIT(6);
> +}
> +
>  /*
>   * do_hdmi_vsdb_modes - Parse the HDMI Vendor Specific data block
>   * @connector: connector corresponding to the HDMI sink
> @@ -5357,6 +5367,7 @@ drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
>  	}
>  }
>  
> +/* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
>  static void
>  drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
>  {
> @@ -5364,18 +5375,18 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
>  
>  	if (len >= 6 && (db[6] & (1 << 7)))
>  		connector->eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= DRM_ELD_SUPPORTS_AI;
> -	if (len >= 8) {
> -		connector->latency_present[0] = db[8] >> 7;
> -		connector->latency_present[1] = (db[8] >> 6) & 1;
> -	}
> -	if (len >= 9)
> +
> +	if (len >= 10 && hdmi_vsdb_latency_present(db)) {
> +		connector->latency_present[0] = true;
>  		connector->video_latency[0] = db[9];
> -	if (len >= 10)
>  		connector->audio_latency[0] = db[10];
> -	if (len >= 11)
> +	}
> +
> +	if (len >= 12 && hdmi_vsdb_i_latency_present(db)) {
> +		connector->latency_present[1] = true;
>  		connector->video_latency[1] = db[11];
> -	if (len >= 12)
>  		connector->audio_latency[1] = db[12];
> +	}
>  
>  	drm_dbg_kms(connector->dev,
>  		    "[CONNECTOR:%d:%s] HDMI: latency present %d %d, video latency %d %d, audio latency %d %d\n",
> -- 
> 2.34.1

-- 
Ville Syrjälä
Intel
