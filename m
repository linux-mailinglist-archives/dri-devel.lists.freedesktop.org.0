Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CA76AD8A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CC710E368;
	Tue,  1 Aug 2023 09:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22C710E1D9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 09:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690882208; x=1722418208;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+ZeJP/xkyI2kTZxoz/E3PvGR0Hq4tjVxJSVN6RH3DV8=;
 b=NuKfzNnYPBcZGXPqzitsRf5AmL7EukrK/K5/1Oman0mwYnaf3OQbbc5R
 ZODDU5oGPP3PJbLl/pEDDsSVYk8GIkuMMSWovLxGyHz+7g420eX2gFqq6
 4hJLB0ad8RRUKOrh0bvajdtH0WTHLP/54hPV6A4FDnUqW0m37RUMXsQty
 1PkYDqgw3m8aw26F6I8BBbB8NXPCtboXlHmkYw0wGmqq2VsshudCigNzX
 W8L2NvG+YNlG2A1CEMVFYb9pLWbiycYTWP5TaUem+xBMlXdhapkw7ARA6
 MGuEqySsfkiL9CHMiXbbX7Wqri+7Zw91eWX75xSzghOhjB0lK3R97laFY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371961917"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="371961917"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:30:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="798596374"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="798596374"
Received: from igorban-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:30:02 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ziqi Zhao <astrajoan@yahoo.com>, astrajoan@yahoo.com, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 ivan.orlov0322@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, skhan@linuxfoundation.org, tzimmermann@suse.de
Subject: Re: [PATCH] drm/modes: Fix division by zero error
In-Reply-To: <20230721160749.8489-1-astrajoan@yahoo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230709011213.17890-1-astrajoan@yahoo.com>
 <20230721160749.8489-1-astrajoan@yahoo.com>
Date: Tue, 01 Aug 2023 12:30:00 +0300
Message-ID: <87o7jrw1nr.fsf@intel.com>
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
Cc: netdev@vger.kernel.org, dsahern@kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, jiri@nvidia.com,
 jacob.e.keller@intel.com, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Jul 2023, Ziqi Zhao <astrajoan@yahoo.com> wrote:
> In the bug reported by Syzbot, the variable `den == (1 << 22)` and
> `mode->vscan == (1 << 10)`, causing the multiplication to overflow and
> accidentally make `den == 0`. To prevent any chance of overflow, we
> replace `num` and `den` with 64-bit unsigned integers, and explicitly
> check if the divisor `den` will overflow. If so, we employ full 64-bit
> division with rounding; otherwise we keep the 64-bit to 32-bit division
> that could potentially be better optimized.
>
> In order to minimize the performance overhead, the overflow check for
> `den` is wrapped with an `unlikely` condition. Please let me know if
> this usage is appropriate.
>
> Reported-by: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
> Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
> ---
>  drivers/gpu/drm/drm_modes.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index ac9a406250c5..aa98bd7b8bc9 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1285,13 +1285,13 @@ EXPORT_SYMBOL(drm_mode_set_name);
>   */
>  int drm_mode_vrefresh(const struct drm_display_mode *mode)
>  {
> -	unsigned int num, den;
> +	unsigned long long num, den;

I think making them u64 would be more clear.

>  
>  	if (mode->htotal == 0 || mode->vtotal == 0)
>  		return 0;
>  
> -	num = mode->clock;
> -	den = mode->htotal * mode->vtotal;
> +	num = mul_u32_u32(mode->clock, 1000);
> +	den = mul_u32_u32(mode->htotal, mode->vtotal);
>  
>  	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>  		num *= 2;
> @@ -1300,7 +1300,10 @@ int drm_mode_vrefresh(const struct drm_display_mode *mode)
>  	if (mode->vscan > 1)
>  		den *= mode->vscan;
>  
> -	return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
> +	if (unlikely(den >> 32))

More intuitively, den > UINT_MAX.

> +		return div64_u64(num + (den >> 1), den);

More intuitively, DIV64_U64_ROUND_CLOSEST(num, den).

> +	else

The else after a branch with return is unnecessary. Someone's going to
send a patch to remove it later if you leave it in.

BR,
Jani.

> +		return DIV_ROUND_CLOSEST_ULL(num, (unsigned int) den);
>  }
>  EXPORT_SYMBOL(drm_mode_vrefresh);

-- 
Jani Nikula, Intel Open Source Graphics Center
