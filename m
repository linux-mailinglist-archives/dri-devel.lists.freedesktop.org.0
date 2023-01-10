Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B87F663AE8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 09:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1741D10E548;
	Tue, 10 Jan 2023 08:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4B710E548;
 Tue, 10 Jan 2023 08:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673339017; x=1704875017;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YnwMpLTH8VtZZ7XMXcWwqe1wq17GI5tRIh8zor324oE=;
 b=AlOEQvaJrSoUvKgQKj5ZZh4nbFSwAdHgp+RP9TqtE5X1uTU3KPIXkmOk
 +stOWY5OdE+hhhtoxYCsYGCoQnubAehKIfgrXTNMYnQicp5GlWCTKkDqV
 coAWOBSxgNin4TxcfUdl9EKH0sSnzeuzERelJRs7ZFHm5hmkR51WJt/ZO
 LGwkTSTwSF70fhZvBwDuTXyswFRKTFah5p/vEpBADi+Z0piUQ+2GN+5wN
 L3lHvACSnfegCBos+mvZoOBevUCGvDclH5/EHkofwWK3W6q0GWvnyJthW
 25GefaFCpGKYNfH+WbRgJ9Gi2PthoqEF2sG0yCt9w26mar6GKJDPS38O/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="385393117"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; d="scan'208";a="385393117"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 00:23:37 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="656964699"
X-IronPort-AV: E=Sophos;i="5.96,314,1665471600"; d="scan'208";a="656964699"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.8.19])
 ([10.213.8.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 00:23:35 -0800
Message-ID: <ba227180-066a-8e07-9df6-a9d4e6ec2a05@intel.com>
Date: Tue, 10 Jan 2023 09:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/i915: Do not cover all future platforms in TLB
 invalidation
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230106103835.640924-1-tvrtko.ursulin@linux.intel.com>
 <20230109122442.713861-1-tvrtko.ursulin@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230109122442.713861-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09.01.2023 13:24, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Revert to the original explicit approach and document the reasoning
> behind it.
>
> v2:
>   * DG2 needs to be covered too. (Matt)
>
> v3:
>   * Full version check for Gen12 to avoid catching all future platforms.
>     (Matt)
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c | 17 +++++++++++++++--
>   1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 7eeee5a7cb33..5521fa057aab 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1070,10 +1070,23 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>   	unsigned int num = 0;
>   	unsigned long flags;
>   
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * New platforms should not be added with catch-all-newer (>=)
> +	 * condition so that any later platform added triggers the below warning
> +	 * and in turn mandates a human cross-check of whether the invalidation
> +	 * flows have compatible semantics.
> +	 *
> +	 * For instance with the 11.00 -> 12.00 transition three out of five
> +	 * respective engine registers were moved to masked type. Then after the
> +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
> +	    GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
>   		regs = NULL;
>   		num = ARRAY_SIZE(xehp_regs);
> -	} else if (GRAPHICS_VER(i915) == 12) {
> +	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> +		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {

MTL support is lost? IP_VER(12, 70)

And again it looks for me inconsistent, some unknown platforms are 
covered, for example 12.54, some not, for example 12.11.

Regards
Andrzej

>   		regs = gen12_regs;
>   		num = ARRAY_SIZE(gen12_regs);
>   	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {

