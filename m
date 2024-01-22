Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5A8836C11
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E5E10E11F;
	Mon, 22 Jan 2024 16:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jan 2024 16:57:15 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2967410E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705942635; x=1737478635;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EZEN8wunnYsDyYg7Dr1Xlc4lB1BxwhqBccW9u8ITo2Q=;
 b=SoZh3K8XF0ZexHtBsXsyE4tK/8dcv9Lv3AnCC/vZbRwvOZLVhwUdyinQ
 i2ctlvxaoJ5KKLndwI6vsNTVn4CqHgD5zPwwL77iU0d9yUbIC+vrrO9Xm
 CLWPaFVYxr5JI+yqFjdAJBuVaFDu/MJnm7rqXx7+tgGTZv8GLm6JWRZei
 et46BL+2pDAOdI8EW9QkvVLiR7/NmyWMrRoVcKhoL2F66vUyfSp0qljJd
 gqIMRaSpthokIlm9UJXu1Fk6HZ+TGbqJPe+4kmV+chkywPtHcJPHj4wrG
 9y/P5CgJZBcI1vk0Jpd4LzN1cvnScD2EGdLQNwQBGevoMEe+gg/UWoj5q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="150551"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="150551"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 08:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="819776348"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="819776348"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Jan 2024 08:50:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 22 Jan 2024 18:50:00 +0200
Date: Mon, 22 Jan 2024 18:50:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 6.1 04/53] drm: Fix color LUT rounding
Message-ID: <Za6ano6dg0Mau7OI@intel.com>
References: <20240122150949.994249-1-sashal@kernel.org>
 <20240122150949.994249-4-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240122150949.994249-4-sashal@kernel.org>
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
Cc: tzimmermann@suse.de, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, daniel@ffwll.ch,
 airlied@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 10:08:05AM -0500, Sasha Levin wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> [ Upstream commit c6fbb6bca10838485b820e8a26c23996f77ce580 ]

Why is this being backported?

> 
> The current implementation of drm_color_lut_extract()
> generates weird results. Eg. if we go through all the
> values for 16->8bpc conversion we see the following pattern:
> 
> in            out (count)
>    0 -   7f ->  0 (128)
>   80 -  17f ->  1 (256)
>  180 -  27f ->  2 (256)
>  280 -  37f ->  3 (256)
> ...
> fb80 - fc7f -> fc (256)
> fc80 - fd7f -> fd (256)
> fd80 - fe7f -> fe (256)
> fe80 - ffff -> ff (384)
> 
> So less values map to 0 and more values map 0xff, which
> doesn't seem particularly great.
> 
> To get just the same number of input values to map to
> the same output values we'd just need to drop the rounding
> entrirely. But perhaps a better idea would be to follow the
> OpenGL int<->float conversion rules, in which case we get
> the following results:
> 
> in            out (count)
>    0 -   80 ->  0 (129)
>   81 -  181 ->  1 (257)
>  182 -  282 ->  2 (257)
>  283 -  383 ->  3 (257)
> ...
> fc7c - fd7c -> fc (257)
> fd7d - fe7d -> fd (257)
> fe7e - ff7e -> fe (257)
> ff7f - ffff -> ff (129)
> 
> Note that since the divisor is constant the compiler
> is able to optimize away the integer division in most
> cases. The only exception is the _ULL() case on 32bit
> architectures since that gets emitted as inline asm
> via do_div() and thus the compiler doesn't get to
> optimize it.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20231013131402.24072-2-ville.syrjala@linux.intel.com
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  include/drm/drm_color_mgmt.h | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 81c298488b0c..54b2b2467bfd 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -36,20 +36,17 @@ struct drm_plane;
>   *
>   * Extract a degamma/gamma LUT value provided by user (in the form of
>   * &drm_color_lut entries) and round it to the precision supported by the
> - * hardware.
> + * hardware, following OpenGL int<->float conversion rules
> + * (see eg. OpenGL 4.6 specification - 2.3.5 Fixed-Point Data Conversions).
>   */
>  static inline u32 drm_color_lut_extract(u32 user_input, int bit_precision)
>  {
> -	u32 val = user_input;
> -	u32 max = 0xffff >> (16 - bit_precision);
> -
> -	/* Round only if we're not using full precision. */
> -	if (bit_precision < 16) {
> -		val += 1UL << (16 - bit_precision - 1);
> -		val >>= 16 - bit_precision;
> -	}
> -
> -	return clamp_val(val, 0, max);
> +	if (bit_precision > 16)
> +		return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(user_input, (1 << bit_precision) - 1),
> +					     (1 << 16) - 1);
> +	else
> +		return DIV_ROUND_CLOSEST(user_input * ((1 << bit_precision) - 1),
> +					 (1 << 16) - 1);
>  }
>  
>  u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n);
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
