Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8545B6BB7C1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 16:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFA510E2F8;
	Wed, 15 Mar 2023 15:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D160B10E2F8;
 Wed, 15 Mar 2023 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678894113; x=1710430113;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yvgNWg9FppzY1THYBN9OsZwxW1rRDB/DRylJp/MMUyM=;
 b=Ugs10em/fAgL3QjoyhmzdTMoey/oxYn1dqgtCrwzBK8RQq+DSRqcrgDF
 LH7DRV2pJRbQPleQkUdJ4+dUGV2xEsw8A8rao5iRtl7Ftz4sHrKPpFIjQ
 r993TXijpxe1RlDNY07kBznhepoHtLY1xffWtJGb5fsIhyDeqpBGDq5rO
 RrEw547MfV9TnIUl4CtZt4xfNRcWnPwIt37i9hh1vULu3nPX3wrJhJekz
 cblV8o6y1QhlrCm/r7qgbqcBWckyjp8vvPnZwxI6bJL3HwaTX/Bv09CCG
 OJ/1WunB+hlqDWR5xT6mRPr6Temqe+HF9rOqlRB3IfZ2ASPB156aG+u6a w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="365419904"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="365419904"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="1008877154"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="1008877154"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.23.62])
 ([10.213.23.62])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 08:28:31 -0700
Message-ID: <8b0af9b3-9588-da47-6b73-3f7c97f6c2c2@intel.com>
Date: Wed, 15 Mar 2023 16:28:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [Intel-gfx] [PATCH v2] drm/i915/mtl: Disable stolen memory backed
 FB for A0
Content-Language: en-US
To: Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230310094544.3865-1-nirmoy.das@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230310094544.3865-1-nirmoy.das@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.03.2023 10:45, Nirmoy Das wrote:
> Stolen memory is not usable for MTL A0 stepping beyond
> certain access size and we have no control over userspace
> access size of /dev/fb which can be backed by stolen memory.
> So disable stolen memory backed fb by setting i915->dsm.usable_size
> to zero.
> 
> v2: remove hsdes reference and fix commit message(Andi)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index d8e06e783e30..bf0f0a5f2a5c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -535,6 +535,15 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>   	/* Basic memrange allocator for stolen space. */
>   	drm_mm_init(&i915->mm.stolen, 0, i915->dsm.usable_size);
>   
> +	/*
> +	 * Access to stolen lmem beyond certain size for MTL A0 stepping
> +	 * would crash the machine. Disable stolen lmem for userspace access
> +	 * by setting usable_size to zero.
> +	 */
> +	if (IS_MTL_GRAPHICS_STEP(i915, M, STEP_A0, STEP_B0) ||
> +	    IS_MTL_GRAPHICS_STEP(i915, P, STEP_A0, STEP_B0))
> +		i915->dsm.usable_size = 0;
> +
>   	return 0;
>   }
>   

