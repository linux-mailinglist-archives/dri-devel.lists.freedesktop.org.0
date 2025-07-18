Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8805B0A68C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 16:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CE510E9CF;
	Fri, 18 Jul 2025 14:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLOZNbXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A244F10E9CC;
 Fri, 18 Jul 2025 14:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752850073; x=1784386073;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EQOUoJ6qtPVhLjWRhgsbFhY/p1NRW9EH1xCvBrK+f/0=;
 b=GLOZNbXc2erKqc7IIfANkONrqu8L5l/Jg1o4phatYl3UiLfJuCEPz5Fz
 HrsDuHMCGvfTMpdXJYEWQO6z1+yGxyhuwJirDPN3QI/ipF8jv8ZgfqIE3
 lfRkLyC7had9rpQyfJMeXL3kvuDqXAMh7xL+zLVSerMy7eQLDXAwzTSJ6
 /5wuY1A8kBogaGhaKUZ91bAQdubwH03f+Rt/KXUkWEWniP8/9bqkFM9L7
 FbIQZJiFOcS2sUtqcwNGGQB8HICFebe8xg2rAarc8vYn3X0sYTazaT8Lz
 lBdAPfQiyL05qOrUXRPIc4fdYrdxLq1ru2Lvq8pHCdUXE1/NO4gfZ/oDk Q==;
X-CSE-ConnectionGUID: yN3SsxYkSa61AAgpe7K6Tg==
X-CSE-MsgGUID: HTSuVgTwQBCNvQvLaOTU4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="80591160"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="80591160"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:47:53 -0700
X-CSE-ConnectionGUID: qz72rKN7RNu/CF6WL1I9Uw==
X-CSE-MsgGUID: 8qbokRXbQs2JN4e7VNsDJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="189061034"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.245.84])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 07:47:51 -0700
Date: Fri, 18 Jul 2025 16:47:48 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] iosys-map: Fix undefined behavior in iosys_map_clear()
Message-ID: <aHpelIVPhfR74SUH@ashyti-mobl2.lan>
References: <20250718105051.2709487-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718105051.2709487-1-nitin.r.gote@intel.com>
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

Hi Nitin,

On Fri, Jul 18, 2025 at 04:20:51PM +0530, Nitin Gote wrote:
> The current iosys_map_clear() implementation reads the potentially
> uninitialized 'is_iomem' boolean field to decide which union member
> to clear. This causes undefined behavior when called on uninitialized
> structures, as 'is_iomem' may contain garbage values like 0xFF.
> 
> UBSAN detects this as:
>     UBSAN: invalid-load in include/linux/iosys-map.h:267
>     load of value 255 is not a valid value for type '_Bool'
> 
> Fix by unconditionally clearing the entire structure with memset(),
> eliminating the need to read uninitialized data and ensuring all
> fields are set to known good values.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14639
> Fixes: 01fd30da0474 ("dma-buf: Add struct dma-buf-map for storing struct dma_buf.vaddr_ptr")
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

+Thomas and the dri-devel mailing list.

In any case, your patch makes sense to me:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

> ---
>  include/linux/iosys-map.h | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index 4696abfd311c..3e85afe794c0 100644
> --- a/include/linux/iosys-map.h
> +++ b/include/linux/iosys-map.h
> @@ -264,12 +264,7 @@ static inline bool iosys_map_is_set(const struct iosys_map *map)
>   */
>  static inline void iosys_map_clear(struct iosys_map *map)
>  {
> -	if (map->is_iomem) {
> -		map->vaddr_iomem = NULL;
> -		map->is_iomem = false;
> -	} else {
> -		map->vaddr = NULL;
> -	}
> +	memset(map, 0, sizeof(*map));
>  }
>  
>  /**
> -- 
> 2.25.1
