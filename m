Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FD39DAEF6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 22:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7C110EBF1;
	Wed, 27 Nov 2024 21:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0NHse+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8296510EBED;
 Wed, 27 Nov 2024 21:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732743088; x=1764279088;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5gX/BBzCWzxSRfndkFudZxhHTGAXgl1Vg5VP8CzICIg=;
 b=L0NHse+N2YHX/Wm9GBeLOg/vYvvuKjA62hsNqtJ5V9EujmkRTn1BqI0z
 EhyU/GjALKyXnztwBUcpAaPKsrOXrhV9eAnUjYmz8fV2FQOJYXkGApLVy
 kwHm8X4eQEQ5FqfywR8zd4k5CRafMjY1jAdyyJdsyanTDjJsZ6lr2J+c8
 anKdz76xxE2QMn5jLWbaSygohM9uly0YlLTbXiZ5x40WIJ9NGRpstuWFf
 Xz2zto+PgXt/bFgHwntEag71Q2spM5yQ9gYGJw39f0sZLSspQcM5bPOVq
 YYEAfzRn/+EzzIVV+oEteI8Vy+nmnnmGeqfKPvX9Y4duAGYGzNyMheAJH A==;
X-CSE-ConnectionGUID: qp6KG/47STuTvi9hPqKfow==
X-CSE-MsgGUID: YHcTMibUTo6P9lhn3IK2pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33117930"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="33117930"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 13:31:28 -0800
X-CSE-ConnectionGUID: 1dBFlnUQQsqatZA8PRY1qg==
X-CSE-MsgGUID: Hml2wat3RDKTqIUIGT4b1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; d="scan'208";a="92224366"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa008.fm.intel.com with ESMTP; 27 Nov 2024 13:31:27 -0800
Received: from [10.245.96.154] (unknown [10.245.96.154])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7EDC32FC50;
 Wed, 27 Nov 2024 21:31:25 +0000 (GMT)
Message-ID: <79c6d852-0d0c-41e1-9dfc-b879290b4e39@intel.com>
Date: Wed, 27 Nov 2024 22:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/drm_mm: Safe macro for iterating through nodes
 in range
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20241123031333.3435414-1-tomasz.lis@intel.com>
 <20241123031333.3435414-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20241123031333.3435414-2-tomasz.lis@intel.com>
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

same as previously, please don't forget to include dri-devel for all drm
level changes

On 23.11.2024 04:13, Tomasz Lis wrote:
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

