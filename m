Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F6757B82
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 14:10:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0034A10E333;
	Tue, 18 Jul 2023 12:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A3F10E333;
 Tue, 18 Jul 2023 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689682253; x=1721218253;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g861e9x38BavCkoCdJAt5TnAFAkblB6XYSxbGTOkjLc=;
 b=CkmZRk4IFqG1SXUbKBltwWjxYwb5kpsV6vPqLTqI8gRHhBgQxjtbm8To
 sZXSV1Pbi/0w0e17wAhQ71fEpMEFyNtoiPKZl7kDoPG8BHQ06pLlSsCOv
 theU8XVzGHeR2fBm8IRa1q9VCg4OvrpbP3rCn2xc0p+L6gpdcgPRzyy81
 Uzqyfdsf24fXArnRuLaqyCZURLrzjuWEsR6Oyd/u1L1c5VKYAzV9aGzc3
 IbrGtGKF6IK30B0VakaGW7ocmQ8fljF2/mgjEuNqHjvLBHlXI5Ojgrv7C
 oNhupTLLJCLkVo5HzchDTDAxwEQYToOiRhb0cV6eQ/WWtCj66JXb6ohf1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="366230096"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="366230096"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 05:10:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="793605769"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="793605769"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.19.167])
 ([10.213.19.167])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 05:10:48 -0700
Message-ID: <e1dafe04-0375-08a0-dca0-707d68ea5bd5@intel.com>
Date: Tue, 18 Jul 2023 14:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fix an error handling path in
 igt_write_huge()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <7a036b88671312ee9adc01c74ef5b3376f690b76.1689619758.git.christophe.jaillet@wanadoo.fr>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7a036b88671312ee9adc01c74ef5b3376f690b76.1689619758.git.christophe.jaillet@wanadoo.fr>
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
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17.07.2023 20:49, Christophe JAILLET wrote:
> All error handling paths go to 'out', except this one. Be consistent and
> also branch to 'out' here.
> 
> Fixes: c10a652e239e ("drm/i915/selftests: Rework context handling in hugepages selftests")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>


For me seems correct.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> ---
> /!\ Speculative /!\
> 
>     This patch is based on analysis of the surrounding code and should be
>     reviewed with care !
> 
>     If the patch is wrong, maybe a comment in the code could explain why.
> 
> /!\ Speculative /!\
> ---
>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> index df6c9a84252c..6b9f6cf50bf6 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
> @@ -1246,8 +1246,10 @@ static int igt_write_huge(struct drm_i915_private *i915,
>   	 * times in succession a possibility by enlarging the permutation array.
>   	 */
>   	order = i915_random_order(count * count, &prng);
> -	if (!order)
> -		return -ENOMEM;
> +	if (!order) {
> +		err = -ENOMEM;
> +		goto out;
> +	}
>   
>   	max_page_size = rounddown_pow_of_two(obj->mm.page_sizes.sg);
>   	max = div_u64(max - size, max_page_size);

