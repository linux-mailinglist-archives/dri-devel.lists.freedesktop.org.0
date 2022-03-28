Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4324E4E9D9C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28EC10E733;
	Mon, 28 Mar 2022 17:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CED10E6EE;
 Mon, 28 Mar 2022 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648488862; x=1680024862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wZNHv4DXrOOI+eiU0sWSP/rDSDLyq0LSOu+zTTL71JM=;
 b=P4Egk/hipGJ594fnKm+O91W0AJVZz/aBV8hRR4LqSqr3Pv+gOSm+WnpN
 VjodkFLrtO3H4NSfUaB1pjsSkYNj0W2BcMXaVejhuCgLx3+KX9671LZeg
 Lbov3/ui0q2VfXx5C6K9HQagZb+IUmUXwvk42U82zDFVfNK31PT2BqlUJ
 FRZS7nRNs7gq8j896arYu33ViJHyzal9f/wAQBe2nZjYiWhzogApppNyb
 A9S/zZA5UHo3B++/Ub9owQtcwW+vE+2veG9EdeZqM86REJ/hh7ex7Npyp
 ZEPN0tkP4+zovwMU1V/IS7KdEOujooZMZ667aJu9OmLGi4evoIUfpD8e9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="259032511"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="259032511"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="518290648"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga002.jf.intel.com with SMTP; 28 Mar 2022 10:34:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 20:34:17 +0300
Date: Mon, 28 Mar 2022 20:34:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 06/12] drm/edid: use struct detailed_timing member
 access in gtf2 functions
Message-ID: <YkHxmUkxFmEfhV5S@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
 <9fe5f5c39039e585fecfffb390297d49262e5fd3.1648477901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fe5f5c39039e585fecfffb390297d49262e5fd3.1648477901.git.jani.nikula@intel.com>
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

On Mon, Mar 28, 2022 at 05:34:27PM +0300, Jani Nikula wrote:
> Use struct detailed_timing member access instead of direct offsets to
> avoid casting.
> 
> Use BUILD_BUG_ON() for sanity check.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 57 +++++++++++++++++++++++++-------------
>  1 file changed, 37 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 39c8bf4ca082..27a0e9bf260c 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2438,61 +2438,78 @@ drm_monitor_supports_rb(struct edid *edid)
>  }
>  
>  static void
> -find_gtf2(struct detailed_timing *t, void *data)
> +find_gtf2(struct detailed_timing *descriptor, void *data)
>  {
> -	u8 *r = (u8 *)t;
> +	struct detailed_timing **res = data;
>  
> -	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(descriptor, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
> -	if (r[10] == 0x02)
> -		*(u8 **)data = r;
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.flags) != 10);
> +
> +	if (descriptor->data.other_data.data.range.flags == 0x02)
> +		*res = descriptor;
>  }
>  
>  /* Secondary GTF curve kicks in above some break frequency */
>  static int
>  drm_gtf2_hbreak(struct edid *edid)
>  {
> -	u8 *r = NULL;
> +	struct detailed_timing *descriptor = NULL;
> +
> +	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
>  
> -	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> -	return r ? (r[12] * 2) : 0;
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.hfreq_start_khz) != 12);
> +
> +	return descriptor ? descriptor->data.other_data.data.range.formula.gtf2.hfreq_start_khz * 2 : 0;
>  }
>  
>  static int
>  drm_gtf2_2c(struct edid *edid)
>  {
> -	u8 *r = NULL;
> +	struct detailed_timing *descriptor = NULL;
> +
> +	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
> +
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.c) != 13);
>  
> -	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> -	return r ? r[13] : 0;
> +	return descriptor ? descriptor->data.other_data.data.range.formula.gtf2.c : 0;
>  }
>  
>  static int
>  drm_gtf2_m(struct edid *edid)
>  {
> -	u8 *r = NULL;
> +	struct detailed_timing *descriptor = NULL;
>  
> -	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> -	return r ? (r[15] << 8) + r[14] : 0;
> +	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
> +
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.m) != 14);
> +
> +	return descriptor ? le16_to_cpu(descriptor->data.other_data.data.range.formula.gtf2.m) : 0;
>  }
>  
>  static int
>  drm_gtf2_k(struct edid *edid)
>  {
> -	u8 *r = NULL;
> +	struct detailed_timing *descriptor = NULL;
> +
> +	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
>  
> -	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> -	return r ? r[16] : 0;
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.k) != 16);
> +
> +	return descriptor ? descriptor->data.other_data.data.range.formula.gtf2.k : 0;
>  }
>  
>  static int
>  drm_gtf2_2j(struct edid *edid)
>  {
> -	u8 *r = NULL;
> +	struct detailed_timing *descriptor = NULL;
> +
> +	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &descriptor);
> +
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.gtf2.j) != 17);
>  
> -	drm_for_each_detailed_block((u8 *)edid, find_gtf2, &r);
> -	return r ? r[17] : 0;
> +	return descriptor ? descriptor->data.other_data.data.range.formula.gtf2.j : 0;
>  }
>  
>  /**
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
