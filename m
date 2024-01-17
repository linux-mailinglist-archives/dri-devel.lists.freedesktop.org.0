Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A174830EF0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 23:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D4A10E89A;
	Wed, 17 Jan 2024 22:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC9C10E008;
 Wed, 17 Jan 2024 22:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705528906; x=1737064906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fBy/nGHk4g7eyh/WjuYu7v2iQ0vWUflQsL/txH5D3k4=;
 b=fuzobl7cEcJqCcvBEaa/03H2DIW3u/NOq0xx/tz99I2jzRmxvUDHTaL7
 DCropwkKCIoGHaWqG6ptzN3Fgt8h67vJtJs4XIhx6/1Vgy+bXVtrGF9KO
 UMGsYSlsPOT6YZW3wSSIWocf5uLUyZSzWYiaX6Ar4avluqjNz0ESw5vco
 x8vAtmXjA2pX37PqdD0mDeIUP+AwSUCNWyLS87YG63g/4VpyrPDSywjb2
 KG7YOVuYrpBBH75z/bm5EROzInD9vP66yag/DubXI+ETqjuMjghnzKvfF
 jfnKZjN/0zrv39LddrgieC0Vfs2w3bFftaVNR2N/LJerZ+rf9XYqqowgA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7657618"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7657618"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="734089231"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="734089231"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 14:01:45 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 05/23] drm/xe/svm: add helper to retrieve svm range from
 address
Date: Wed, 17 Jan 2024 17:12:05 -0500
Message-Id: <20240117221223.18540-6-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20240117221223.18540-1-oak.zeng@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 brian.welty@intel.com, himal.prasad.ghimiray@intel.com,
 krishnaiah.bommu@intel.com, niranjana.vishwanathapura@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All valid virtual address range are maintained in svm's
range_tree. This functions iterate svm's range tree and
return the svm range that contains specific address.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h       |  2 ++
 drivers/gpu/drm/xe/xe_svm_range.c | 32 +++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm_range.c

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index cd3cf92f3784..3ed106ecc02b 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -67,4 +67,6 @@ struct xe_svm_range {
 void xe_destroy_svm(struct xe_svm *svm);
 struct xe_svm *xe_create_svm(struct xe_vm *vm);
 struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
+struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
+								unsigned long addr);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm_range.c b/drivers/gpu/drm/xe/xe_svm_range.c
new file mode 100644
index 000000000000..d8251d38f65e
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm_range.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/interval_tree.h>
+#include <linux/container_of.h>
+#include <linux/mutex.h>
+#include "xe_svm.h"
+
+/**
+ * xe_svm_range_from_addr() - retrieve svm_range contains a virtual address
+ *
+ * @svm: svm that the virtual address belongs to
+ * @addr: the virtual address to retrieve svm_range for
+ *
+ * return the svm range found,
+ * or NULL if no range found
+ */
+struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
+									unsigned long addr)
+{
+	struct interval_tree_node *node;
+
+	mutex_lock(&svm->mutex);
+	node = interval_tree_iter_first(&svm->range_tree, addr, addr);
+	mutex_unlock(&svm->mutex);
+	if (!node)
+		return NULL;
+
+	return container_of(node, struct xe_svm_range, inode);
+}
-- 
2.26.3

