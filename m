Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0D49D007F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 19:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5BF210E169;
	Sat, 16 Nov 2024 18:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQbqY92V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D6010E169;
 Sat, 16 Nov 2024 18:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731781789; x=1763317789;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RnF1zFXaysG3FnzzjVW8cGmYIll7FPIY/xYNFp812/E=;
 b=kQbqY92VnltjDRSmDYnCzQW2kYWCKC6qIG1JqECzIdxVPoM4piEtFaSn
 JcipliW5hgnJ6mqXM+swqKV+86LnyUA3tFk9gz2n5928HKEzORBQzXfmp
 9dm6lVzGDNeEnfZz+J/TghH4ujSRQ3lmiupWllH5OPKm+jjTxdWwv7cSX
 FHibRi09Rfu6cC+DRbgJ/ECXl7DsuuO+qqNgEwy9GLe85m44UnoT4hdij
 3rulFIQL5vj4PCBl5KEpqBUM/AI8XFQFIoJzpnh6PzRE4NSIq6T7AfFY8
 O9h8f4BEDlDrtv666pSvKHL5t9GaGekV2GwKiCZQgeZehHBbdTe/LNF7q A==;
X-CSE-ConnectionGUID: amu3Hfz+S96ceUcgduIx7Q==
X-CSE-MsgGUID: KKtbtT7wQGWigISM7ADb7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31873879"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; d="scan'208";a="31873879"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2024 10:29:49 -0800
X-CSE-ConnectionGUID: 8bXoAnfrSQa2LV59An1HNw==
X-CSE-MsgGUID: tir32lvwRFa1RJ0Zyau8dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; d="scan'208";a="119777545"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 16 Nov 2024 10:29:48 -0800
Received: from [10.245.96.66] (mwajdecz-MOBL.ger.corp.intel.com [10.245.96.66])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8D49C2878B;
 Sat, 16 Nov 2024 18:29:46 +0000 (GMT)
Message-ID: <9cf8e6ff-97fb-47c0-bbf0-58888f310559@intel.com>
Date: Sat, 16 Nov 2024 19:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/drm_mm: Safe macro for iterating through nodes
 in range
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20241116021238.2486287-1-tomasz.lis@intel.com>
 <20241116021238.2486287-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241116021238.2486287-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+ dri-devel

On 16.11.2024 03:12, Tomasz Lis wrote:
> Benefits of drm_mm_for_each_node_safe and drm_mm_for_each_node_in_range
> squished together into one macro.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  include/drm/drm_mm.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
> index f654874c4ce6..43e99441f6ba 100644
> --- a/include/drm/drm_mm.h
> +++ b/include/drm/drm_mm.h
> @@ -504,6 +504,25 @@ __drm_mm_interval_first(const struct drm_mm *mm, u64 start, u64 last);
>  	     node__->start < (end__);					\
>  	     node__ = list_next_entry(node__, node_list))
>  
> +/**
> + * drm_mm_for_each_node_in_range_safe - iterator to walk over a range of
> + * allocated nodes
> + * @node__: drm_mm_node structure to assign to in each iteration step
> + * @next__: &struct drm_mm_node to store the next step
> + * @mm__: drm_mm allocator to walk
> + * @start__: starting offset, the first node will overlap this
> + * @end__: ending offset, the last node will start before this (but may overlap)
> + *
> + * This iterator walks over all nodes in the range allocator that lie
> + * between @start and @end. It is implemented similarly to list_for_each_safe(),
> + * so safe against removal of elements.
> + */
> +#define drm_mm_for_each_node_in_range_safe(node__, next__, mm__, start__, end__)	\
> +	for (node__ = __drm_mm_interval_first((mm__), (start__), (end__)-1), \
> +		next__ = list_next_entry(node__, node_list); \
> +	     node__->start < (end__);					\
> +	     node__ = next__, next__ = list_next_entry(next__, node_list))
> +
>  void drm_mm_scan_init_with_range(struct drm_mm_scan *scan,
>  				 struct drm_mm *mm,
>  				 u64 size, u64 alignment, unsigned long color,

