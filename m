Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3754E6128
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 10:35:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4571310E849;
	Thu, 24 Mar 2022 09:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64FB10E849;
 Thu, 24 Mar 2022 09:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648114548; x=1679650548;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZCLxOEX/FkYbf6RtVxN2iY0TKX42gsdgqedL72ORiss=;
 b=kV/fOy38ewcx4vI6poqsZSOjF0CcJL73SaRnM+rsCM2IrycUjttit0u8
 EennnVixf3Od1F7+D80QqbB0uBK6py+RkjyqD3WHGtIcvhM58qnOTtqP8
 RjG1zIhGAmNP32E5XrtVGX0U+z7Yu9E9O2Jc0BgfIH4a+uP/usDM0/vlU
 FPcGwvWsQ3Gd3PX9sycOxPKnRcqkLLYIRxnPalsiVX5ngH2QOgkYQzg0s
 yc++aXwWHzsYSkozgWvNlDE3jTek6GfQDFQSsuPylVDj403bs6MG7rFGR
 NgRZHGJX5Nyz9wKiVs8dkLonvu4NoNds8ZL0JY/GqueePp0fZAk+1JSMZ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258518045"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="258518045"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 02:35:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="561300084"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.252.56.159])
 ([10.252.56.159])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2022 02:35:46 -0700
Message-ID: <f40a1ecc-742a-de77-9d23-b2ca48ffac85@linux.intel.com>
Date: Thu, 24 Mar 2022 10:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Correctly free guc capture
 struct on error
Content-Language: en-US
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220324000439.2370440-1-daniele.ceraolospurio@intel.com>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <20220324000439.2370440-1-daniele.ceraolospurio@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

On 3/24/2022 1:04 AM, Daniele Ceraolo Spurio wrote:
> On error the "new" allocation is not freed, so add the required kfree.
>
> Fixes: 247f8071d5893 ("drm/i915/guc: Pre-allocate output nodes for extraction")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> index afdcbe63e9eb1..c4e25966d3e9f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
> @@ -1040,6 +1040,7 @@ guc_capture_alloc_one_node(struct intel_guc *guc)
>   		if (!new->reginfo[i].regs) {
>   			while (i)
>   				kfree(new->reginfo[--i].regs);
> +			kfree(new);
>   			return NULL;
>   		}
>   	}
