Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHM4OqGkb2n0DgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F75146C10
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 16:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD2D10E610;
	Tue, 20 Jan 2026 14:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VUNHmrdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AC010E60D;
 Tue, 20 Jan 2026 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768919725; x=1800455725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CcR8WWhjCXEIGjN5Z77f7XLe7vIqq2ciTdPVJ57DYQE=;
 b=VUNHmrdRjZIZEm7n1E6kJMNgTRICixChh9/JUcdhzer1ZJVhz7bbYe4j
 q5Cc4Wlax9wf5wWOd6eGEZ4/8V+QEnfWxDtGwlCaFB/liSDG+//X2q/Dc
 UJ1zPb1I92nnCoJtSdM+S1z8aCYRcaTdYFda5E+TuqjqxTFII353j77p2
 e8lK+jPzxeUUkz3xZA/XsOfFZlHrT2DivjeKChUqB1s1TuxMOXo+9NHw7
 8TGcHEgjqr8nlRez2Hc0dSWoLb30JdMvse/e7iOPJmi2NAOfUWyf3BqcR
 NAH9RscDMI90dlG5+yOw3EeGjNQJiaFILmtIGWI2ZZDlPzSYJJ5IMgX47 Q==;
X-CSE-ConnectionGUID: T6eDrw/lRoKgb/l3LxFkWw==
X-CSE-MsgGUID: C7hloLcUSmKvmyAeNWJV7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69327961"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="69327961"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:35:25 -0800
X-CSE-ConnectionGUID: Q2M738IbT/OJ/ksNIpAHYg==
X-CSE-MsgGUID: jfckAYjmQLWCm7UsLMNjHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="206171973"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.250])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:35:24 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Subject: [PATCH v2 1/2] drm,
 drm/xe: Fix xe userptr in the absence of CONFIG_DEVICE_PRIVATE
Date: Tue, 20 Jan 2026 15:34:58 +0100
Message-ID: <20260120143459.9485-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120143459.9485-1-thomas.hellstrom@linux.intel.com>
References: <20260120143459.9485-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 7F75146C10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CONFIG_DEVICE_PRIVATE is not selected by default by some distros,
for example Fedora, and that leads to a regression in the xe driver
since userptr support gets compiled out.

It turns out that DRM_GPUSVM, which is needed for xe userptr support
compiles also without CONFIG_DEVICE_PRIVATE, but doesn't compile
without CONFIG_ZONE_DEVICE.
Exclude the drm_pagemap files from compilation with !CONFIG_ZONE_DEVICE,
and remove the CONFIG_DEVICE_PRIVATE dependency from CONFIG_DRM_GPUSVM and
the xe driver's selection of it, re-enabling xe userptr for those configs.

v2:
- Don't compile the drm_pagemap files unless CONFIG_ZONE_DEVICE is set.
- Adjust the drm_pagemap.h header accordingly.

Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.18+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/Kconfig    |  2 +-
 drivers/gpu/drm/Makefile   |  4 +++-
 drivers/gpu/drm/xe/Kconfig |  2 +-
 include/drm/drm_pagemap.h  | 18 ++++++++++++++----
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index a33b90251530..d3d52310c9cc 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -210,7 +210,7 @@ config DRM_GPUVM
 
 config DRM_GPUSVM
 	tristate
-	depends on DRM && DEVICE_PRIVATE
+	depends on DRM
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	help
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 0deee72ef935..0c21029c446f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -108,9 +108,11 @@ obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
 
 drm_gpusvm_helper-y := \
-	drm_gpusvm.o\
+	drm_gpusvm.o
+drm_gpusvm_helper-$(CONFIG_ZONE_DEVICE) += \
 	drm_pagemap.o\
 	drm_pagemap_util.o
+
 obj-$(CONFIG_DRM_GPUSVM) += drm_gpusvm_helper.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 4b288eb3f5b0..c34be1be155b 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -39,7 +39,7 @@ config DRM_XE
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
-	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
+	select DRM_GPUSVM if !UML
 	select DRM_GPUVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
diff --git a/include/drm/drm_pagemap.h b/include/drm/drm_pagemap.h
index 46e9c58f09e0..2baf0861f78f 100644
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@ -243,6 +243,8 @@ struct drm_pagemap_devmem_ops {
 			   struct dma_fence *pre_migrate_fence);
 };
 
+#if IS_ENABLED(CONFIG_ZONE_DEVICE)
+
 int drm_pagemap_init(struct drm_pagemap *dpagemap,
 		     struct dev_pagemap *pagemap,
 		     struct drm_device *drm,
@@ -252,17 +254,22 @@ struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
 				       struct dev_pagemap *pagemap,
 				       const struct drm_pagemap_ops *ops);
 
-#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
 
 void drm_pagemap_put(struct drm_pagemap *dpagemap);
 
 #else
 
+static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page)
+{
+	return NULL;
+}
+
 static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
 {
 }
 
-#endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
+#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
 
 /**
  * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
@@ -334,6 +341,8 @@ struct drm_pagemap_migrate_details {
 	u32 source_peer_migrates : 1;
 };
 
+#if IS_ENABLED(CONFIG_ZONE_DEVICE)
+
 int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_allocation,
 				  struct mm_struct *mm,
 				  unsigned long start, unsigned long end,
@@ -343,8 +352,6 @@ int drm_pagemap_evict_to_ram(struct drm_pagemap_devmem *devmem_allocation);
 
 const struct dev_pagemap_ops *drm_pagemap_pagemap_ops_get(void);
 
-struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
-
 void drm_pagemap_devmem_init(struct drm_pagemap_devmem *devmem_allocation,
 			     struct device *dev, struct mm_struct *mm,
 			     const struct drm_pagemap_devmem_ops *ops,
@@ -359,4 +366,7 @@ int drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_reclaim);
 
 int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
+
+#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
+
 #endif
-- 
2.52.0

