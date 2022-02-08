Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774AE4AE53B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 00:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A772B10E358;
	Tue,  8 Feb 2022 23:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B6F10E1AD;
 Tue,  8 Feb 2022 23:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644361742; x=1675897742;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=oal+gQKf3u99XjXeoyGRyMf04kAHmHh5erLeuZ8piyQ=;
 b=bCHg2QBFwblMTA5Q2aT5/f/JF+EYdspAM+QKvrhnWX7e5Ejl5AuKf2Yq
 gXxhzFAOxbFXOjPiB1CQoGL2o6+0vOFv7WlkoseHjpn89lXH+VzUmG0RD
 N8QpwnQVpMH0q5UqM5rjZ/AO3b2Vu/jgf5JtCCT43bYznyZcwOQL9F+R5
 mHIaoBeaZtmLS8VstfoGzHp61YGEwYIp8nQ3ESWqiZC6GeTru5d9aVKe9
 0zIs1V4RGv6uE2wcaURuxJmJd6oHkepRGZafjVUA3V+2Xh+Fu0FLY983M
 W6n/Jk8I/ciFb42+cBfyPLWKxm7cDWSh8KY1cmHVbdiEgq55PNa42ke92 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="232638417"
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="232638417"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 15:08:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,354,1635231600"; d="scan'208";a="540830241"
Received: from mduanebx-mobl1.amr.corp.intel.com (HELO msatwood-mobl)
 ([10.212.243.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 15:08:57 -0800
Date: Tue, 8 Feb 2022 15:08:43 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>;,
 intel-gfx@lists.freedesktop.org;, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v2 03/18] drm/i915/gt: Add helper for shmem
 copy to iosys_map
Message-ID: <20220208230843.GB11859@msatwood-mobl>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
 <20220208104524.2516209-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220208104524.2516209-4-lucas.demarchi@intel.com>
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

On Tue, Feb 08, 2022 at 02:45:09AM -0800, Lucas De Marchi wrote:
> Add a variant of shmem_read() that takes a iosys_map pointer rather
> than a plain pointer as argument. It's mostly a copy __shmem_rw() but
> adapting the api and removing the write support since there's currently
> only need to use iosys_map as destination.
> 
> Reworking __shmem_rw() to share the implementation was tempting, but
> finding a good balance between reuse and clarity pushed towards a little
> code duplication. Since the function is small, just add the similar
> function with a copy/paste/adapt approach.
> 
> v2: Add an offset as argument and instead of using a map iterator, use the
> offset to keep track of where we are writing data to.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/shmem_utils.c | 32 +++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/shmem_utils.h |  3 +++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
> index 0683b27a3890..402f085f3a02 100644
> --- a/drivers/gpu/drm/i915/gt/shmem_utils.c
> +++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2020 Intel Corporation
>   */
>  
> +#include <linux/iosys-map.h>
>  #include <linux/mm.h>
>  #include <linux/pagemap.h>
>  #include <linux/shmem_fs.h>
> @@ -123,6 +124,37 @@ static int __shmem_rw(struct file *file, loff_t off,
>  	return 0;
>  }
>  
> +int shmem_read_to_iosys_map(struct file *file, loff_t off,
> +			    struct iosys_map *map, size_t map_off, size_t len)
> +{
> +	unsigned long pfn;
> +
> +	for (pfn = off >> PAGE_SHIFT; len; pfn++) {
> +		unsigned int this =
> +			min_t(size_t, PAGE_SIZE - offset_in_page(off), len);
> +		struct page *page;
> +		void *vaddr;
> +
> +		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
> +						   GFP_KERNEL);
> +		if (IS_ERR(page))
> +			return PTR_ERR(page);
> +
> +		vaddr = kmap(page);
> +		iosys_map_memcpy_to(map, map_off, vaddr + offset_in_page(off),
> +				    this);
> +		mark_page_accessed(page);
> +		kunmap(page);
> +		put_page(page);
> +
> +		len -= this;
> +		map_off += this;
> +		off = 0;
> +	}
> +
> +	return 0;
> +}
> +
>  int shmem_read(struct file *file, loff_t off, void *dst, size_t len)
>  {
>  	return __shmem_rw(file, off, dst, len, false);
> diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.h b/drivers/gpu/drm/i915/gt/shmem_utils.h
> index c1669170c351..b2b04d88c6e5 100644
> --- a/drivers/gpu/drm/i915/gt/shmem_utils.h
> +++ b/drivers/gpu/drm/i915/gt/shmem_utils.h
> @@ -8,6 +8,7 @@
>  
>  #include <linux/types.h>
>  
> +struct iosys_map;
>  struct drm_i915_gem_object;
>  struct file;
>  
> @@ -17,6 +18,8 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj);
>  void *shmem_pin_map(struct file *file);
>  void shmem_unpin_map(struct file *file, void *ptr);
>  
> +int shmem_read_to_iosys_map(struct file *file, loff_t off,
> +			    struct iosys_map *map, size_t map_off, size_t len);
>  int shmem_read(struct file *file, loff_t off, void *dst, size_t len);
>  int shmem_write(struct file *file, loff_t off, void *src, size_t len);
>  
> -- 
> 2.35.1
> 
