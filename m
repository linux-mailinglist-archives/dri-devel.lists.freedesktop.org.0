Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E04E9D8B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B53610E260;
	Mon, 28 Mar 2022 17:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2A710E260;
 Mon, 28 Mar 2022 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648488594; x=1680024594;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=m/j2V9yf1L3LvQtq4bCakKH+ZEwuVdJHX5X3zJ10PfQ=;
 b=IlgBZbT/FUvWTMpK14991WisE3BIHs5mt4IiDOTZcKntmz5nnQAKnxem
 lpqkNTuFvqZe7W/LQINfV64GeykfU72ShWPqJ+20xFZVpGuCp+GxR6qrC
 bDf7BGX0IxqRPGJjpVkQZBYVD/5M6Acm03bvygPMsf9EaJnvJErgXoM9x
 DiEqbBIIBK7lYJljF4609UxGsdUruUy2xiZ136y63aUraSChIbJJvWJwb
 lcp76mK+iyxyBc0eoApBMt/u1+TkxGN/h9KskhFOoXPTUNFsuq4O4qjJo
 8FIMbixe0CuJMHBfovmIldp5765/bu2chTBX/A7DfMeSiPsGoZ6dS5Pek A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="259249787"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="259249787"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 10:29:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; d="scan'208";a="585275355"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
 by orsmga001.jf.intel.com with SMTP; 28 Mar 2022 10:29:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 28 Mar 2022 20:29:50 +0300
Date: Mon, 28 Mar 2022 20:29:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3 05/12] drm/edid: use struct detailed_timing member
 access in is_rb()
Message-ID: <YkHwjkY89nQjw1J+@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
 <c069669c2fe8f9c3061c7d1a413c75a33ec48813.1648477901.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c069669c2fe8f9c3061c7d1a413c75a33ec48813.1648477901.git.jani.nikula@intel.com>
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

On Mon, Mar 28, 2022 at 05:34:26PM +0300, Jani Nikula wrote:
> Use struct detailed_timing member access instead of direct offsets to
> avoid casting.
> 
> Use BUILD_BUG_ON() for sanity check.
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 10da6b9b14fb..39c8bf4ca082 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2408,15 +2408,19 @@ drm_for_each_detailed_block(u8 *raw_edid, detailed_cb *cb, void *closure)
>  }
>  
>  static void
> -is_rb(struct detailed_timing *t, void *data)
> +is_rb(struct detailed_timing *descriptor, void *data)
>  {
> -	u8 *r = (u8 *)t;
> +	bool *res = data;
>  
> -	if (!is_display_descriptor(t, EDID_DETAIL_MONITOR_RANGE))
> +	if (!is_display_descriptor(descriptor, EDID_DETAIL_MONITOR_RANGE))
>  		return;
>  
> -	if (r[10] == DRM_EDID_CVT_SUPPORT_FLAG && r[15] & 0x10)
> -		*(bool *)data = true;
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.flags) != 10);
> +	BUILD_BUG_ON(offsetof(typeof(*descriptor), data.other_data.data.range.formula.cvt.flags) != 15);
> +
> +	if (descriptor->data.other_data.data.range.flags == DRM_EDID_CVT_SUPPORT_FLAG &&
> +	    descriptor->data.other_data.data.range.formula.cvt.flags & 0x10)
> +		*res = true;
>  }
>  
>  /* EDID 1.4 defines this explicitly.  For EDID 1.3, we guess, badly. */
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
