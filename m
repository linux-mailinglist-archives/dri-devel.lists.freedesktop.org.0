Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D47566D8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 16:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D56010E0C2;
	Mon, 17 Jul 2023 14:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD90610E0C2;
 Mon, 17 Jul 2023 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689605582; x=1721141582;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PaYQUrnIAw10UGRh51Er0CiQIbO+1qEOK90eqGzlL3M=;
 b=ktI/SBeSGFeViZ21yY4vkJ1kAny1rLi50XAeE5FPZ9vhc3IQXNmo4xWL
 VWvHGSuNbns2VWNoParX1QHMV+PjTcOFy7+Nano3GOCKHJmx38NX78Vzr
 5yrjxvCqX1Me5dNXLOGyvnNyXnNx2iLTa3Pt9dduFGS+evA/HLAZj57UF
 7ngtF4jo1jX1k0l3NYZBENUmdXHsmNT0pjOKmsDfd0Rg5wLY4Yc4kfRxm
 Fp59pyYH5UWmp/hbglycrIeVeGJLgUwFN+xF+VeEy3lgHTlhbLIoS/UTS
 6U/H7Y63aWjMFDVgYk4GC5lHdiQUdM4Passq61Ftb2joVkMWQr77cwRcz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="432120117"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="432120117"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 07:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="788686219"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="788686219"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.9.23])
 ([10.213.9.23])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 07:52:55 -0700
Message-ID: <0cae35ea-7635-383d-cae5-2051abbc6d64@intel.com>
Date: Mon, 17 Jul 2023 16:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/i915/tv: avoid possible division by zero
To: Su Hui <suhui@nfschina.com>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, airlied@gmail.com, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com
References: <20230717062209.124106-1-suhui@nfschina.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230717062209.124106-1-suhui@nfschina.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mripard@kernel.org,
 ankit.k.nautiyal@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.07.2023 08:22, Su Hui wrote:
> Clang warning: drivers/gpu/drm/i915/display/intel_tv.c:
> line 991, column 22 Division by zero.
> Assuming tv_mode->oversample=1 and (!tv_mode->progressive)=1,
> then division by zero will happen.
>
> Fixes: 1bba5543e4fe ("drm/i915: Fix TV encoder clock computation")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>   drivers/gpu/drm/i915/display/intel_tv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_tv.c b/drivers/gpu/drm/i915/display/intel_tv.c
> index 36b479b46b60..82b54af51f23 100644
> --- a/drivers/gpu/drm/i915/display/intel_tv.c
> +++ b/drivers/gpu/drm/i915/display/intel_tv.c
> @@ -988,7 +988,8 @@ intel_tv_mode_to_mode(struct drm_display_mode *mode,
>   		      const struct tv_mode *tv_mode,
>   		      int clock)
>   {
> -	mode->clock = clock / (tv_mode->oversample >> !tv_mode->progressive);
> +	mode->clock = clock / (tv_mode->oversample != 1 ?
> +			tv_mode->oversample >> !tv_mode->progressive : 1);

Seems too smart to me, why not just:
mode->clock = clock / tv_mode->oversample;
if (!tv_mode->progressive)
     mode->clock <<= 1;
Or trying being smart:
mode->clock = clock / tv_mode->oversample << !tv_mode->progressive;

Btw in both cases there is assumption tv_mode->oversample != 0, I guess 
it is true.

Regards
Andrzej

>   
>   	/*
>   	 * tv_mode horizontal timings:

