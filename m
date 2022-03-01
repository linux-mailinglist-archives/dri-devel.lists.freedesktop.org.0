Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B674C858F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE3C10E5A1;
	Tue,  1 Mar 2022 07:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BAD10E598;
 Tue,  1 Mar 2022 07:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646121169; x=1677657169;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yYyK75pOzfD0du+hl77CkC3Aa5sssxmcZxU5m62PwJQ=;
 b=kSirss2f4kn18D/7yQClc6AoS/eficHCEq7rilMuw9ukBbqoNnThzxGz
 F7PjyEb4+M6br2pFHIzfJfjHQeLRBVWLEMIxdn9Uj3IjnDuh4ZT1S1/Oh
 kUZ/4WtJ2plwijTss/zGzGQmQ5N7t/yKf4UT/sOTEW68o0Tar296mC9gT
 1B0KJ0D/fSUjby8bkg6ZKGUxlG1hv5Zqi/3EpzGJtLyqCK6uCIV6AeZob
 k80Zo5l5McXcUeYbNIqDaThLrgx/cC47PD+Zq1K88p62zY92FYdSFuFS/
 m1OqVcoIZrrM7hmPYEsGsPN/oLI6Bh890MWc+n9vjCxaQzLkX2yudr/el Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="253271667"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="253271667"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:52:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="608722765"
Received: from ramyaman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.150.64])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 23:52:48 -0800
Date: Mon, 28 Feb 2022 23:52:48 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/7] drm/i915: use the memcpy_from_wc call
 from the drm
Message-ID: <20220301075248.j5ie22pk46yg5fjh@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
 <20220222145206.76118-4-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220222145206.76118-4-balasubramani.vivekanandan@intel.com>
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
Cc: siva.mullati@intel.com, intel-gfx@lists.freedesktop.org,
 michael.cheng@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 08:22:02PM +0530, Balasubramani Vivekanandan wrote:
>memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
>by the implementation in drm_cache.c.
>Updated to use the functions provided by drm_cache.c.
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/i915/gem/i915_gem_object.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>index 2d593d573ef1..49ff8e3e71d9 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>@@ -449,16 +449,16 @@ static void
> i915_gem_object_read_from_page_iomap(struct drm_i915_gem_object *obj, u64 offset, void *dst, int size)
> {
> 	void __iomem *src_map;
>-	void __iomem *src_ptr;
>+	struct iosys_map src_ptr;
>+
> 	dma_addr_t dma = i915_gem_object_get_dma_address(obj, offset >> PAGE_SHIFT);
>
> 	src_map = io_mapping_map_wc(&obj->mm.region->iomap,
> 				    dma - obj->mm.region->region.start,
> 				    PAGE_SIZE);
>
>-	src_ptr = src_map + offset_in_page(offset);
>-	if (!i915_memcpy_from_wc(dst, (void __force *)src_ptr, size))
>-		memcpy_fromio(dst, src_ptr, size);
>+	iosys_map_set_vaddr_iomem(&src_ptr, (src_map + offset_in_page(offset)));

Too many parenthesis -----------------------^

other than that.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+	drm_memcpy_from_wc_vaddr(dst, &src_ptr, size);
>
> 	io_mapping_unmap(src_map);
> }
>-- 
>2.25.1
>
