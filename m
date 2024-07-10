Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD0092D0CC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 13:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C261310E748;
	Wed, 10 Jul 2024 11:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZcX9lg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE0410E19E;
 Wed, 10 Jul 2024 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720611524; x=1752147524;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PCQvDnX2bhe1pCmu3mB/ovER9ZpvXqvbBRYqScZ2liM=;
 b=cZcX9lg6PGM0avAnTiHx0fczij4qiA4bvww2socWcZbuntP9QgAZsh+V
 fZnPGHI7AloYgMYQxUmoO62vq3F2Ym87kyn8Z4p3pVY5HiJXxLNV24I+z
 z41rtpJgVvY8rEaXri5MynMSrimDRPioiLQdLgScnSs6bBIZPmqf8fjO4
 lvROmPx/lkVlTZiMuLUlOAXBY4OodoC6RPTfitLfUKdRFO9PSO2RlbWH+
 7QyabyTysMZ/gkWxtRskoV0/XOZd59976lj8ZVwpITlzYXh5CzwRQOU9W
 hwbn9s5LQeC7llxHjaTo/wuw8F0xYyehZWYEgr5i7dsa7mHspVhwVMEN1 A==;
X-CSE-ConnectionGUID: Tk897xzaSMCRuCCPlDjeLw==
X-CSE-MsgGUID: 4oNvKAiwSIakZuJbkIw6tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21689627"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="21689627"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 04:38:43 -0700
X-CSE-ConnectionGUID: tONXe3SRSGa5RO1tJjqqSQ==
X-CSE-MsgGUID: 9ZYTMnmuTJSCj8yEenubjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="48170737"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 10 Jul 2024 04:38:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2024 14:38:38 +0300
Date: Wed, 10 Jul 2024 14:38:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Explicitly cast divisor to fix Coccinelle
 warning
Message-ID: <Zo5yvk69FB-jEgd8@intel.com>
References: <20240710074650.419902-2-thorsten.blum@toblux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240710074650.419902-2-thorsten.blum@toblux.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 10, 2024 at 09:46:51AM +0200, Thorsten Blum wrote:
> As the comment explains, the if check ensures that the divisor oa_period
> is a u32. Explicitly cast oa_period to u32 to remove the following
> Coccinelle/coccicheck warning reported by do_div.cocci:
> 
>   WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  drivers/gpu/drm/i915/i915_perf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 0b1cd4c7a525..24722e758aaf 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4103,7 +4103,7 @@ static int read_properties_unlocked(struct i915_perf *perf,
>  			 */
>  			if (oa_period <= NSEC_PER_SEC) {
>  				u64 tmp = NSEC_PER_SEC;
> -				do_div(tmp, oa_period);
> +				do_div(tmp, (u32)oa_period);

Why is this code even using do_div() when it doesn't need the
remainder?

>  				oa_freq_hz = tmp;
>  			} else
>  				oa_freq_hz = 0;
> -- 
> 2.45.2

-- 
Ville Syrjälä
Intel
