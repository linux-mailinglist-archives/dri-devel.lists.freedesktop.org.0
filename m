Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29939B81FD3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 23:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB3010E598;
	Wed, 17 Sep 2025 21:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCg+2FH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D74C10E598
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 21:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758145073; x=1789681073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=33SZ49GjNEe06bgd3y9ELSYhJx2arhYWD0l5PDLrrGQ=;
 b=WCg+2FH7u1+AGxu8iys3nSLoCsPgFhz51oHwmUX/S9zA3HQDxsYJRzxr
 wfIrHlblr0/LjX+Fn4vgtWR+5vHTOXyXWP8rjIlGyK9SjAxuClJBTY0Yv
 XPktXT77kr13HQvzBxdpYibYZXtsrGDRxuyJdi6pAU5+UmmvzJLeaSJue
 NZIVdn2h9scudJS/VlhGPAd9LSHT7bhkUeTH15HnsfFJGkiyLl9YtQiFV
 5HFJb3ftgNrWhRukCCy7prVbUBmmsVIRehFSLNj0bqPB3Xfrz5n/9uX9e
 creWWzSkyoahvDzmeU/i+wm3+8C58VNJ3TGM4Hf4iroRc847AIqFaV7pz Q==;
X-CSE-ConnectionGUID: abay2zETR26k1ooTAFwAUA==
X-CSE-MsgGUID: z7zct410T8u9EutexcRfzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60522751"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60522751"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 14:37:52 -0700
X-CSE-ConnectionGUID: hioxbvtfT++IZdbCneVf0Q==
X-CSE-MsgGUID: urLIJHlAQl2VgGlnP/buPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; d="scan'208";a="179643060"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 14:37:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 3/3] drm/xe: Move rebar to its own file
Date: Wed, 17 Sep 2025 14:37:32 -0700
Message-ID: <20250917-xe-pci-rebar-2-v1-3-005daa7c19be@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
References: <20250917-xe-pci-rebar-2-v1-0-005daa7c19be@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-b03c7
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

Now that xe_pci.c calls the rebar directly, it doens't make sense to
keep it in xe_vram.c since it's closer to the PCI initialization than to
the vram. Move it to its own file.

While at it, add a better comment to document the possible values for
the vram_bar_size module parameter.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/Makefile       |   1 +
 drivers/gpu/drm/xe/xe_pci.c       |   3 +-
 drivers/gpu/drm/xe/xe_pci_rebar.c | 125 ++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pci_rebar.h |  13 ++++
 drivers/gpu/drm/xe/xe_vram.c      | 109 ---------------------------------
 drivers/gpu/drm/xe/xe_vram.h      |   1 -
 6 files changed, 141 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 7a065c98a3b85..5a66d7a53d0db 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_observation.o \
 	xe_pat.o \
 	xe_pci.o \
+	xe_pci_rebar.o \
 	xe_pcode.o \
 	xe_pm.o \
 	xe_preempt_fence.o \
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 1f4120b535137..6cc5e7b6901a8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -27,6 +27,7 @@
 #include "xe_macros.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
+#include "xe_pci_rebar.h"
 #include "xe_pci_sriov.h"
 #include "xe_pci_types.h"
 #include "xe_pm.h"
@@ -866,7 +867,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (err)
 		return err;
 
-	xe_vram_resize_bar(xe);
+	xe_pci_rebar(xe);
 
 	err = xe_device_probe_early(xe);
 	/*
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.c b/drivers/gpu/drm/xe/xe_pci_rebar.c
new file mode 100644
index 0000000000000..e04416630b573
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.c
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_pci_rebar.h"
+
+#include <linux/pci.h>
+#include <linux/types.h>
+
+#include <drm/drm_print.h>
+
+#include "regs/xe_bars.h"
+#include "xe_device_types.h"
+#include "xe_module.h"
+
+#define BAR_SIZE_SHIFT 20
+
+static void release_bars(struct pci_dev *pdev)
+{
+	int resno;
+
+	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
+		if (pci_resource_len(pdev, resno))
+			pci_release_resource(pdev, resno);
+	}
+}
+
+static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
+{
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	int bar_size = pci_rebar_bytes_to_size(size);
+	int ret;
+
+	release_bars(pdev);
+
+	ret = pci_resize_resource(pdev, resno, bar_size);
+	if (ret) {
+		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
+			 resno, 1 << bar_size, ERR_PTR(ret));
+		return;
+	}
+
+	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
+}
+
+void xe_pci_rebar(struct xe_device *xe)
+{
+	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
+	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
+	struct pci_bus *root = pdev->bus;
+	resource_size_t current_size;
+	resource_size_t rebar_size;
+	struct resource *root_res;
+	u32 bar_size_mask;
+	u32 pci_cmd;
+	int i;
+
+	/* gather some relevant info */
+	current_size = pci_resource_len(pdev, LMEM_BAR);
+	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
+
+	if (!bar_size_mask)
+		return;
+
+	/*
+	 * Handle force_vram_bar_size:
+	 * - negative: resize is disabled
+	 * - 0: try to resize to maximum possible
+	 * - positive: resize to specific value
+	 */
+	if (force_vram_bar_size < 0)
+		return;
+
+	if (force_vram_bar_size) {
+		u32 bar_size_bit;
+
+		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
+
+		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
+
+		if (!bar_size_bit) {
+			drm_info(&xe->drm,
+				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
+				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
+			return;
+		}
+
+		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
+
+		if (rebar_size == current_size)
+			return;
+	} else {
+		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
+
+		/* only resize if larger than current */
+		if (rebar_size <= current_size)
+			return;
+	}
+
+	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
+		 (u64)current_size >> 20, (u64)rebar_size >> 20);
+
+	while (root->parent)
+		root = root->parent;
+
+	pci_bus_for_each_resource(root, root_res, i) {
+		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
+		    (u64)root_res->start > 0x100000000ul)
+			break;
+	}
+
+	if (!root_res) {
+		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
+		return;
+	}
+
+	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
+
+	resize_bar(xe, LMEM_BAR, rebar_size);
+
+	pci_assign_unassigned_bus_resources(pdev->bus);
+	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
+}
diff --git a/drivers/gpu/drm/xe/xe_pci_rebar.h b/drivers/gpu/drm/xe/xe_pci_rebar.h
new file mode 100644
index 0000000000000..c87aa58aee718
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_pci_rebar.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_PCI_REBAR_H_
+#define _XE_PCI_REBAR_H_
+
+struct xe_device;
+
+void xe_pci_rebar(struct xe_device *xe);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 4fb5a8426531a..caab5c1ff7ba9 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -24,115 +24,6 @@
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
-#define BAR_SIZE_SHIFT 20
-
-static void release_bars(struct pci_dev *pdev)
-{
-	int resno;
-
-	for (resno = PCI_STD_RESOURCES; resno < PCI_STD_RESOURCE_END; resno++) {
-		if (pci_resource_len(pdev, resno))
-			pci_release_resource(pdev, resno);
-	}
-}
-
-static void resize_bar(struct xe_device *xe, int resno, resource_size_t size)
-{
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	int bar_size = pci_rebar_bytes_to_size(size);
-	int ret;
-
-	release_bars(pdev);
-
-	ret = pci_resize_resource(pdev, resno, bar_size);
-	if (ret) {
-		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
-			 resno, 1 << bar_size, ERR_PTR(ret));
-		return;
-	}
-
-	drm_info(&xe->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
-}
-
-/*
- * if force_vram_bar_size is set, attempt to set to the requested size
- * else set to maximum possible size
- */
-void xe_vram_resize_bar(struct xe_device *xe)
-{
-	int force_vram_bar_size = xe_modparam.force_vram_bar_size;
-	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
-	struct pci_bus *root = pdev->bus;
-	resource_size_t current_size;
-	resource_size_t rebar_size;
-	struct resource *root_res;
-	u32 bar_size_mask;
-	u32 pci_cmd;
-	int i;
-
-	/* gather some relevant info */
-	current_size = pci_resource_len(pdev, LMEM_BAR);
-	bar_size_mask = pci_rebar_get_possible_sizes(pdev, LMEM_BAR);
-
-	if (!bar_size_mask)
-		return;
-
-	if (force_vram_bar_size < 0)
-		return;
-
-	/* set to a specific size? */
-	if (force_vram_bar_size) {
-		u32 bar_size_bit;
-
-		rebar_size = force_vram_bar_size * (resource_size_t)SZ_1M;
-
-		bar_size_bit = bar_size_mask & BIT(pci_rebar_bytes_to_size(rebar_size));
-
-		if (!bar_size_bit) {
-			drm_info(&xe->drm,
-				 "Requested size: %lluMiB is not supported by rebar sizes: 0x%x. Leaving default: %lluMiB\n",
-				 (u64)rebar_size >> 20, bar_size_mask, (u64)current_size >> 20);
-			return;
-		}
-
-		rebar_size = 1ULL << (__fls(bar_size_bit) + BAR_SIZE_SHIFT);
-
-		if (rebar_size == current_size)
-			return;
-	} else {
-		rebar_size = 1ULL << (__fls(bar_size_mask) + BAR_SIZE_SHIFT);
-
-		/* only resize if larger than current */
-		if (rebar_size <= current_size)
-			return;
-	}
-
-	drm_info(&xe->drm, "Attempting to resize bar from %lluMiB -> %lluMiB\n",
-		 (u64)current_size >> 20, (u64)rebar_size >> 20);
-
-	while (root->parent)
-		root = root->parent;
-
-	pci_bus_for_each_resource(root, root_res, i) {
-		if (root_res && root_res->flags & (IORESOURCE_MEM | IORESOURCE_MEM_64) &&
-		    (u64)root_res->start > 0x100000000ul)
-			break;
-	}
-
-	if (!root_res) {
-		drm_info(&xe->drm, "Can't resize VRAM BAR - platform support is missing. Consider enabling 'Resizable BAR' support in your BIOS\n");
-		return;
-	}
-
-	pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd & ~PCI_COMMAND_MEMORY);
-
-	resize_bar(xe, LMEM_BAR, rebar_size);
-
-	pci_assign_unassigned_bus_resources(pdev->bus);
-	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
-}
-
 static bool resource_is_valid(struct pci_dev *pdev, int bar)
 {
 	if (!pci_resource_flags(pdev, bar))
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 13505cfb184dc..72860f714fc66 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -11,7 +11,6 @@
 struct xe_device;
 struct xe_vram_region;
 
-void xe_vram_resize_bar(struct xe_device *xe);
 int xe_vram_probe(struct xe_device *xe);
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);

-- 
2.50.1

