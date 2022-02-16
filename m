Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666504B8F76
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7251B10E8AB;
	Wed, 16 Feb 2022 17:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA8810E6F9;
 Wed, 16 Feb 2022 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033253; x=1676569253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d6dMIynrS2rGmAOA474mRAQAVPnGwjCRnYkBgDmZ95Y=;
 b=Vh5ldVzULWcRAgQnXUIZqCeJy0kipoermi++R7/br+yBK42ja/XcuRj3
 ZwgWMcb+vobTUZrzJWojL3oftRXmjQijMHCSk5Neyq0blSorsuxT8Wrja
 3U4dzLiU25o6stZvYW8WRifFY/8L0FwmMV0ZpGOvfelkULCgfFodP0roZ
 RCNujkUdNL2wK4LtJFJy8la2qDZKpfMep6tmwxD690vxleZnh8YCFDiIv
 prQRGolRlZu9veiQyn0ADNoqyCBLTu2VxewCNcWicwcRG80YBVvG++bxD
 0OFza67i9imxB+3HNObW3q52YBCM7G6VcKbFKAaEWXyh3iitO+fkCGqWT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641936"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641936"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226622"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:53 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/16] drm/i915/guc: Keep iosys_map of ads_blob around
Date: Wed, 16 Feb 2022 09:41:35 -0800
Message-Id: <20220216174147.3073235-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216174147.3073235-1-lucas.demarchi@intel.com>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matt Atwood <matthew.s.atwood@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert intel_guc_ads_create() and initialization to use iosys_map
rather than plain pointer and save it in the guc struct. This will help
with additional updates to the ads_blob after the
creation/initialization by abstracting the IO vs system memory.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.h     | 4 +++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 6 ++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 9d779de16613..f857e9190750 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -6,8 +6,9 @@
 #ifndef _INTEL_GUC_H_
 #define _INTEL_GUC_H_
 
-#include <linux/xarray.h>
 #include <linux/delay.h>
+#include <linux/iosys-map.h>
+#include <linux/xarray.h>
 
 #include "intel_uncore.h"
 #include "intel_guc_fw.h"
@@ -148,6 +149,7 @@ struct intel_guc {
 	struct i915_vma *ads_vma;
 	/** @ads_blob: contents of the GuC ADS */
 	struct __guc_ads_blob *ads_blob;
+	struct iosys_map ads_map;
 	/** @ads_regset_size: size of the save/restore regsets in the ADS */
 	u32 ads_regset_size;
 	/**
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 7e41175618f5..4ea842752bbc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -666,6 +666,11 @@ int intel_guc_ads_create(struct intel_guc *guc)
 	if (ret)
 		return ret;
 
+	if (i915_gem_object_is_lmem(guc->ads_vma->obj))
+		iosys_map_set_vaddr_iomem(&guc->ads_map, (void __iomem *)guc->ads_blob);
+	else
+		iosys_map_set_vaddr(&guc->ads_map, guc->ads_blob);
+
 	__guc_ads_init(guc);
 
 	return 0;
@@ -687,6 +692,7 @@ void intel_guc_ads_destroy(struct intel_guc *guc)
 {
 	i915_vma_unpin_and_release(&guc->ads_vma, I915_VMA_RELEASE_MAP);
 	guc->ads_blob = NULL;
+	iosys_map_clear(&guc->ads_map);
 	kfree(guc->ads_regset);
 }
 
-- 
2.35.1

