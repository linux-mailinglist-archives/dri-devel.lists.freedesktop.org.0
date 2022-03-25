Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B04E73EE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 14:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E885F10E8F2;
	Fri, 25 Mar 2022 13:06:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDDC10E74A;
 Fri, 25 Mar 2022 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648213599; x=1679749599;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LAbVCviSkiyx0IorRFxxyAB7MRVxHY8DxH84RXhJWQ4=;
 b=BWJkdZ620fjWUkskamdQKK/PR7XtqxuriOKA/XK5i2GyvWL0uAnFD6KR
 QZVnVibX9Ti+5A6PaN4MjA4qBVwPo/djO5VeWczqhwfDYg4Bl2HhQKkB1
 667wq5UkeBw2i+98SzxVcBOr3dgQ85+8UJcHvUirvM+lJFNy1LUdbTzZ9
 +vt1Kt6er9je6mi9oWEh8FzJh7w4T+mV2OVlpZHNNgjczjzc/qctydSYK
 P0ISL0nRwhDAHA3KJC6VP41hxJGGy40vrhAJR2o15FATxeMDjB1lKHz9r
 GtSJdMuwHVg1h/xZwuaHdXCtolVy4Hohjk5+FHknesGqxU2CEwkjwLq4V A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="319336151"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="319336151"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 06:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="693674950"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by fmsmga001.fm.intel.com with SMTP; 25 Mar 2022 06:06:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 25 Mar 2022 15:06:35 +0200
Date: Fri, 25 Mar 2022 15:06:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 3/9] drm/edid: use struct detailed_timing member access
 in is_rb()
Message-ID: <Yj2+W4LXRBd3a+5j@intel.com>
References: <cover.1648210803.git.jani.nikula@intel.com>
 <7fd382f989d169f6a03c473699e1385dd145069e.1648210803.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fd382f989d169f6a03c473699e1385dd145069e.1648210803.git.jani.nikula@intel.com>
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

On Fri, Mar 25, 2022 at 02:25:25PM +0200, Jani Nikula wrote:
> Use struct detailed_timing member access instead of direct offsets to
> avoid casting.
> 
> Use BUILD_BUG_ON() for sanity check.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Note: Why can we use range.formula.cvt.flags directly in is_rb() while
> gtf2 functions check for range.flags == 0x02 first to ensure it's gtf2?

Looks to me like is_rb() is just borked.

Other weird stuff I just noticed is get_monitor_range() not doing
anything for flags!=0x1 cases. It also fails to handle the other
flags that were added to byte 4 in EDID 1.4.

> ---
>  drivers/gpu/drm/drm_edid.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 48707eef1dc2..5396fa78e864 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2405,15 +2405,17 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
>  }
>  
>  static void
> -is_rb(struct detailed_timing *t, void *data)
> +is_rb(struct detailed_timing *timing, void *data)
>  {
> -	u8 *r = (u8 *)t;
> +	bool *res = data;
>  
> -	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(timing, EDID_DETAIL_MONITOR_RANGE))

Calling this 'timing' when it's not is a bit confusing. I'd probably
rename it to something else for all the display descriptor cases.

>  		return;
>  
> -	if (r[15] & 0x10)
> -		*(bool *)data = true;
> +	BUILD_BUG_ON(offsetof(typeof(*timing), data.other_data.data.range.formula.cvt.flags) != 15);
> +
> +	if (timing->data.other_data.data.range.formula.cvt.flags & 0x10)
> +		*res = true;
>  }
>  
>  /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
