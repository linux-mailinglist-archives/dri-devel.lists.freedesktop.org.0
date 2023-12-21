Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E79AC81ADF2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2142F10E652;
	Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA0810E646;
 Thu, 21 Dec 2023 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132902; x=1734668902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fBy/nGHk4g7eyh/WjuYu7v2iQ0vWUflQsL/txH5D3k4=;
 b=eUP1Je9Ot6bq/HFOq+D2aAv3XPg07z3tvRw4mPqe3+8JBbKs3kQNQKy0
 ofk712zAC3O4rO9SEgB/aFClrxGwI31PB0+ln7RZLUw0ITePZH0uuZbhf
 4EJyaNuZK1VTkGiq6A0KOEVW/hVR75cfERZ+ttfE4qqzzm3oS4IEUU0U4
 DaIUtS7Zxdu6dsXTYdaJP6RUgodogqk5WTHeEKFOdwRsfSIhu2b+b4bnr
 U4PokjHIEXhWyMe3GlIYubwPqi4PDVQsVxvz9VUOs4sfMguQZPEA2+dsj
 a5BZyeHgmGpdmWabtJ4ekB9oOZRwjBm7YtdyRMsR4G4kUeTMZMcUBoB4q Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069764"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069764"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481351"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481351"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 05/22] drm/xe/svm: add helper to retrieve svm range from
 address
Date: Wed, 20 Dec 2023 23:37:55 -0500
Message-Id: <20231221043812.3783313-6-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
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

