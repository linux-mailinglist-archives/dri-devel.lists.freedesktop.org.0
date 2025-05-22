Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B77C2AC079D
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 10:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA8610EAE4;
	Thu, 22 May 2025 08:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+RsEX2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F4010EAE4;
 Thu, 22 May 2025 08:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747903718; x=1779439718;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gPbmcoAhu21skBOvOw2Q8GnxCXe8UDdrh6x3Op/NBhI=;
 b=f+RsEX2CDPwRnOX7KF/Cz9+LRD3UB0DCx66Fj+iVwFDc9NO4Yu2ZW9Nc
 zyN2fC7qKqUgW966gt3HTiNKnKy7d8Kt12rDZvhWMFdyPF3vbLn8FVlxE
 9Ne2HAE4RpMd6wS26Cz/N7a0ThFbu9lyyQukDMhjroVDlAeNHA9yGCAmD
 E1qqMRs+/hXJS5s39OkfnUyEfbLO1zmPpzfhtgeDzHcfp/9QflaZg7Evv
 7wCQl0+YnzK1VtuDUWfOU9t7WwEuLGj38dCKKK6LTePd9uOIbiTiOTu60
 Zgih9eOmlVvUQ3WiuYxGFp4Mf/MTAfgNFKQG3a93JevUJoOhP6wklk5Kt w==;
X-CSE-ConnectionGUID: SzFdS7LBSB+Ra0yK5jCH1Q==
X-CSE-MsgGUID: cWQBWHyASLehcVF63YoiAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="50072535"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="50072535"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 01:48:32 -0700
X-CSE-ConnectionGUID: gPVfa59BQ1WoXfA7yzoADg==
X-CSE-MsgGUID: l/7nDzPMQy+zhd1qUSquew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140906517"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.112])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 01:48:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
In-Reply-To: <20250522065519.318013-10-airlied@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
Date: Thu, 22 May 2025 11:48:28 +0300
Message-ID: <8734cxt4ir.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 May 2025, Dave Airlie <airlied@gmail.com> wrote:
> From: Dave Airlie <airlied@redhat.com>
>
> This reduces this struct from 16 to 8 bytes, and it gets embedded
> into a lot of things.

It's an abomination.

And i915 has helpers for it. Because of course it does.

i915_utils.h contains ptr_mask_bits(), ptr_unmask_bits(),
ptr_pack_bits() and ptr_unpack_bits() to do this, uh, cleanly.

Should we try to promote the helpers somewhere in include/linux and use
them here?


BR,
Jani.


>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  include/linux/iosys-map.h | 30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
>
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index a6c2cc9ca756..44479966ce24 100644
> --- a/include/linux/iosys-map.h
> +++ b/include/linux/iosys-map.h
> @@ -99,29 +99,27 @@
>   *	iosys_map_incr(&map, len); // go to first byte after the memcpy
>   */
>  
> +#define _IOSYS_MAP_IS_IOMEM 1
>  /**
>   * struct iosys_map - Pointer to IO/system memory
>   * @vaddr_iomem:	The buffer's address if in I/O memory
>   * @vaddr:		The buffer's address if in system memory
> - * @is_iomem:		True if the buffer is located in I/O memory, or false
> - *			otherwise.
>   */
>  struct iosys_map {
>  	union {
>  		void __iomem *_vaddr_iomem;
>  		void *_vaddr;
>  	};
> -	bool _is_iomem;
>  };
>  
>  static inline bool iosys_map_is_iomem(const struct iosys_map *map)
>  {
> -	return map->_is_iomem;
> +	return ((unsigned long)map->_vaddr) & _IOSYS_MAP_IS_IOMEM;
>  }
>  
>  static inline void __iomem *iosys_map_ioptr(const struct iosys_map *map)
>  {
> -	return map->_vaddr_iomem;
> +	return (void __iomem *)((unsigned long)map->_vaddr_iomem & ~_IOSYS_MAP_IS_IOMEM);
>  }
>  
>  static inline void *iosys_map_ptr(const struct iosys_map *map)
> @@ -136,7 +134,6 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>  #define IOSYS_MAP_INIT_VADDR(vaddr_)	\
>  	{				\
>  		._vaddr = (vaddr_),	\
> -		._is_iomem = false,	\
>  	}
>  
>  /**
> @@ -145,8 +142,7 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>   */
>  #define IOSYS_MAP_INIT_VADDR_IOMEM(vaddr_iomem_)	\
>  	{						\
> -		._vaddr_iomem = (vaddr_iomem_),		\
> -		._is_iomem = true,			\
> +		._vaddr_iomem = (void __iomem *)(((unsigned long)(vaddr_iomem_) | _IOSYS_MAP_IS_IOMEM)), \
>  	}
>  
>  /**
> @@ -198,7 +194,6 @@ static inline void *iosys_map_ptr(const struct iosys_map *map)
>  static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
>  {
>  	map->_vaddr = vaddr;
> -	map->_is_iomem = false;
>  }
>  
>  /**
> @@ -211,8 +206,7 @@ static inline void iosys_map_set_vaddr(struct iosys_map *map, void *vaddr)
>  static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
>  					     void __iomem *vaddr_iomem)
>  {
> -	map->_vaddr_iomem = vaddr_iomem;
> -	map->_is_iomem = true;
> +	map->_vaddr_iomem = (void __iomem *)((unsigned long)vaddr_iomem | _IOSYS_MAP_IS_IOMEM);
>  }
>  
>  /**
> @@ -229,12 +223,9 @@ static inline void iosys_map_set_vaddr_iomem(struct iosys_map *map,
>  static inline bool iosys_map_is_equal(const struct iosys_map *lhs,
>  				      const struct iosys_map *rhs)
>  {
> -	if (lhs->_is_iomem != rhs->_is_iomem)
> +	if (lhs->_vaddr != rhs->_vaddr)
>  		return false;
> -	else if (lhs->_is_iomem)
> -		return lhs->_vaddr_iomem == rhs->_vaddr_iomem;
> -	else
> -		return lhs->_vaddr == rhs->_vaddr;
> +	return true;
>  }
>  
>  /**
> @@ -279,12 +270,7 @@ static inline bool iosys_map_is_set(const struct iosys_map *map)
>   */
>  static inline void iosys_map_clear(struct iosys_map *map)
>  {
> -	if (map->_is_iomem) {
> -		map->_vaddr_iomem = NULL;
> -		map->_is_iomem = false;
> -	} else {
> -		map->_vaddr = NULL;
> -	}
> +	map->_vaddr = NULL;
>  }
>  
>  /**

-- 
Jani Nikula, Intel
