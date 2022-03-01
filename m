Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7E74C8614
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 09:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD27310EB38;
	Tue,  1 Mar 2022 08:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D1710EAF4;
 Tue,  1 Mar 2022 08:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646122400; x=1677658400;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OqjjUYfX+BrY+XLsyJWJxPhIRLjnn7G5vgAckv7kkoU=;
 b=iE5+Yu4bsgQP2RCqtQa9+Z6RYkNJV45oVVxGZq3hqTdqi3Mcqn+cdw6R
 YYZWFsB8YgBpUqbclAA3LM3g3n1yFbexVaQFarwu7C7e7QQtG2tFaahdG
 VMyAXqg7aaC412c8/rmk8H5ADicAxdq/2szkTWaJm5nIf10cpZEBuAM4l
 Qt48v4SSdSnTDDkHWr2nsnTwpJoeuqyIYHLIiOWltHFC+6Xqp8kD1GqrO
 SteXj2RW9xK1bJFDlVLm/Fbqesgd8cdDmSSeEUo6b7+g+IJqxlTUe+Jqu
 JhKkBS4HPPt5NGk3Bx5LimKFPt4RgG6OImdw1PRaUqg/ccZD9nMDOp4hn A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="339516889"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="339516889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 00:13:12 -0800
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="778373205"
Received: from ramyaman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.150.64])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 00:13:12 -0800
Date: Tue, 1 Mar 2022 00:13:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH 5/7] drm/i915/selftests: use the memcpy_from_wc call from
 the drm
Message-ID: <20220301081311.bqx6yxysvbjybuom@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
 <20220222145206.76118-6-balasubramani.vivekanandan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220222145206.76118-6-balasubramani.vivekanandan@intel.com>
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
Cc: michael.cheng@intel.com, wayne.boyer@intel.com,
 intel-gfx@lists.freedesktop.org, casey.g.bowman@intel.com,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 08:22:04PM +0530, Balasubramani Vivekanandan wrote:
>memcpy_from_wc functions in i915_memcpy.c will be removed and replaced
>by the implementation in drm_cache.c.
>Updated to use the functions provided by drm_cache.c.
>
>Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>---
> drivers/gpu/drm/i915/selftests/intel_memory_region.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>index 7acba1d2135e..d7531aa6965a 100644
>--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
>@@ -7,6 +7,7 @@
> #include <linux/sort.h>
>
> #include <drm/drm_buddy.h>
>+#include <drm/drm_cache.h>
>
> #include "../i915_selftest.h"
>
>@@ -1033,7 +1034,10 @@ static inline void igt_memcpy(void *dst, const void *src, size_t size)
>
> static inline void igt_memcpy_from_wc(void *dst, const void *src, size_t size)
> {
>-	i915_memcpy_from_wc(dst, src, size);
>+	struct iosys_map src_map;
>+
>+	iosys_map_set_vaddr(&src_map, (void *)src);

src is not guaranteed to be system memory. See
perf_memcpy():

         for_each_memory_region(src_mr, i915, src_id) {
                 for_each_memory_region(dst_mr, i915, dst_id) {
			...

Lucas De Marchi

>+	drm_memcpy_from_wc_vaddr(dst, &src_map, size);
> }
>
> static int _perf_memcpy(struct intel_memory_region *src_mr,
>@@ -1057,7 +1061,7 @@ static int _perf_memcpy(struct intel_memory_region *src_mr,
> 		{
> 			"memcpy_from_wc",
> 			igt_memcpy_from_wc,
>-			!i915_has_memcpy_from_wc(),
>+			!drm_memcpy_fastcopy_supported(),
> 		},
> 	};
> 	struct drm_i915_gem_object *src, *dst;
>-- 
>2.25.1
>
