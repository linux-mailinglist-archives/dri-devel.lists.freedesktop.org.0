Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D873853A506
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 14:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B23210E67F;
	Wed,  1 Jun 2022 12:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676D010E2E8;
 Wed,  1 Jun 2022 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654086646; x=1685622646;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AFnl00QtA5J4KAkOr04zWJM4zWEBPNa76pLFaqSeSMY=;
 b=mSbGPa33VsvxoyTcHp3RiaI/PVxsS2cnI40CoZOdaWKfBUm0pUCzMp/K
 JhLBwTLjTWq4yhGdxpfa3hDGvwgS2jmci0El8LIAgB+xOWP46ZMPehMNh
 4yHyPsNE0ReuXOjkBv+wrOcJN1mGD5ZIW6f/gn59etkkV6XddhUiPUOl7
 AtRRMKAF/rbZXnWgmm0a5ZszTD1msN2JUyeTAw1sejUZMTr489tW7RpbU
 iPZkn0dv29kmSIyr+ICTVFl6SPSS9OZszF7JTG66xB03KRqusvus4CWSa
 G2kK0CEJu/SV2z2TcM9FO+/QVhFYUrMkTeIQQWqeCcxBJYAHE4uDL0Omi Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="273137950"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="273137950"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 05:30:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; d="scan'208";a="576912228"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.213.124])
 ([10.251.213.124])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2022 05:30:44 -0700
Message-ID: <c9999878-2e73-c43d-382d-6d75d6efe827@linux.intel.com>
Date: Wed, 1 Jun 2022 14:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [PATCH 07/10] drm/i915/error: skip non-mappable pages
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220525184337.491763-1-matthew.auld@intel.com>
 <20220525184337.491763-8-matthew.auld@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220525184337.491763-8-matthew.auld@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 5/25/2022 8:43 PM, Matthew Auld wrote:
> Skip capturing any lmem pages that can't be copied using the CPU. This
> in now only best effort on platforms that have small BAR.
>
> Testcase: igt@gem-exec-capture@capture-invisible
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Kenneth Graunke <kenneth@whitecape.org>
> Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 0512c66fa4f3..77df899123c2 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1116,11 +1116,15 @@ i915_vma_coredump_create(const struct intel_gt *gt,
>   		dma_addr_t dma;
>   
>   		for_each_sgt_daddr(dma, iter, vma_res->bi.pages) {
> +			dma_addr_t offset = dma - mem->region.start;
>   			void __iomem *s;
>   
> -			s = io_mapping_map_wc(&mem->iomap,
> -					      dma - mem->region.start,
> -					      PAGE_SIZE);
> +			if (offset + PAGE_SIZE > mem->io_size) {
> +				ret = -EINVAL;
> +				break;
> +			}
> +
> +			s = io_mapping_map_wc(&mem->iomap, offset, PAGE_SIZE);
>   			ret = compress_page(compress,
>   					    (void __force *)s, dst,
>   					    true);
