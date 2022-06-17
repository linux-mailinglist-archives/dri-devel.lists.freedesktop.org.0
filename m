Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600F54FBC3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 18:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4C7A10F4A0;
	Fri, 17 Jun 2022 16:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FE210F3F3;
 Fri, 17 Jun 2022 16:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655485047; x=1687021047;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2m1bgtwS0biejynEJ/rL0hPZ5Kd6L18he6WCBxiL8Ig=;
 b=ME7z4MXa4HzbA/NFFg/MdUznf6WvgWrsHNJsIIwHMrveqN0vP3f2e8n6
 i/qR6ERAzEgw/qwNyumk+5fp2vF7+bKDE2lqWo6Hhh245Qkg336LgocR+
 6kuci6McAX/8p8l623PNQWJOKMDImwpj/M8oLoq788WRJxAWQoGzl5sVV
 +Mr9CKtCFKmQEw5Nxx9jaNmcQW16DYmIyWoCL9lydQ3fVzve5VZ/kwXjo
 0UudcHutisG+ExexuBNVPJA123xszBqwTpJNKcBxWy1UEevITOYHggTj3
 cp/Q6Jn3ef5+/9dJA5aFRkPUTqLiUCqP4dJIYh9Kc2EtCpEOalSR3b3qQ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304939762"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="304939762"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 08:56:35 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="728382997"
Received: from ecastill-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.204.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 08:56:34 -0700
Date: Fri, 17 Jun 2022 08:56:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 1/2] iosys-map: Add per-word read
Message-ID: <20220617155634.2p6j4xehoc5lnegl@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220617085204.1678035-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220617085204.1678035-1-lucas.demarchi@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, christian.koenig@amd.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 01:52:03AM -0700, Lucas De Marchi wrote:
>Instead of always falling back to memcpy_fromio() for any size, prefer
>using read{b,w,l}(). When reading struct members it's common to read
>individual integer variables individually. Going through memcpy_fromio()
>for each of them poses a high penalty.
>
>Employ a similar trick as __seqprop() by using _Generic() to generate
>only the specific call based on a type-compatible variable.
>
>For a pariticular i915 workload producing GPU context switches,
>__get_engine_usage_record() is particularly hot since the engine usage
>is read from device local memory with dgfx, possibly multiple times
>since it's racy. Test execution time for this test shows a ~12.5%
>improvement with DG2:
>
>Before:
>	nrepeats = 1000; min = 7.63243e+06; max = 1.01817e+07;
>	median = 9.52548e+06; var = 526149;
>After:
>	nrepeats = 1000; min = 7.03402e+06; max = 8.8832e+06;
>	median = 8.33955e+06; var = 333113;
>
>Other things attempted that didn't prove very useful:
>1) Change the _Generic() on x86 to just dereference the memory address
>2) Change __get_engine_usage_record() to do just 1 read per loop,
>   comparing with the previous value read
>3) Change __get_engine_usage_record() to access the fields directly as it
>   was before the conversion to iosys-map
>
>(3) did gave a small improvement (~3%), but doesn't seem to scale well
>to other similar cases in the driver.
>
>Additional test by Chris Wilson using gem_create from igt with some
>changes to track object creation time. This happens to accidentally
>stress this code path:
>
>	Pre iosys_map conversion of engine busyness:
>	lmem0: Creating    262144 4KiB objects took 59274.2ms
>
>	Unpatched:
>	lmem0: Creating    262144 4KiB objects took 108830.2ms
>
>	With readl (this patch):
>	lmem0: Creating    262144 4KiB objects took 61348.6ms
>
>	s/readl/READ_ONCE/
>	lmem0: Creating    262144 4KiB objects took 61333.2ms
>
>So we do take a little bit more time than before the conversion, but
>that is due to other factors: bringing the READ_ONCE back would be as
>good as just doing this conversion.
>
>v2:
>- Remove default from _Generic() - callers wanting to read more
>  than u64 should use iosys_map_memcpy_from()
>- Add READ_ONCE() cases dereferencing the pointer when using system
>  memory
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Christian König <christian.koenig@amd.com> # v1
>---
> include/linux/iosys-map.h | 45 +++++++++++++++++++++++++++++++--------
> 1 file changed, 36 insertions(+), 9 deletions(-)
>
>diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
>index 4b8406ee8bc4..f59dd00ed202 100644
>--- a/include/linux/iosys-map.h
>+++ b/include/linux/iosys-map.h
>@@ -6,6 +6,7 @@
> #ifndef __IOSYS_MAP_H__
> #define __IOSYS_MAP_H__
>
>+#include <linux/compiler_types.h>
> #include <linux/io.h>
> #include <linux/string.h>
>
>@@ -333,6 +334,26 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
> 		memset(dst->vaddr + offset, value, len);
> }
>
>+#ifdef CONFIG_64BIT
>+#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
>+	u64: val_ = readq(vaddr_iomem_)
>+#else
>+#define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
>+	u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))

I tested io/sys and forgot again to test it for 32-bit :(. This
should fix the build for 32-bits:

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 580e14cd360c..f8bc052f8975 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -341,7 +341,7 @@ static inline void iosys_map_memset(struct iosys_map *dst, size_t offset,
  	u64: writeq(val_, vaddr_iomem_)
  #else
  #define __iosys_map_rd_io_u64_case(val_, vaddr_iomem_)				\
-	u64: memcpy_fromio(&(val_), vaddr_iomem__, sizeof(u64))
+	u64: memcpy_fromio(&(val_), vaddr_iomem_, sizeof(u64))
  #define __iosys_map_wr_io_u64_case(val_, vaddr_iomem_)			\
  	u64: memcpy_toio(vaddr_iomem_, &(val_), sizeof(u64))
  #endif

Lucas De Marchi
