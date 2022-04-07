Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD234F725E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 04:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25FB10E6B5;
	Thu,  7 Apr 2022 02:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A12410E6B5
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 02:57:02 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 50BAD28A548;
 Thu,  7 Apr 2022 03:57:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649300221; bh=urgAcrcSVTVzOrPatNxysr8nxX5U50eiydADAYbpzh8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GtZHO3o/0zOiJlAMUUPgbU+bbNj01g9onvVHfUleoPnVLLpoerVWkRPFTtXvKjhci
 IcXivCyDW21u4oS6/CwRmq+xQ7bok1Io/0NeAW+u5jqnOEAfr4LI1Uuau3UxpEbanB
 OyPVHv3ZD33kUS7Kc9MKtMd56MMpU0x5WNdFOn13cdKwZnzgXw5VAuvWVoV32zP7z9
 y16PkVRG54MqWdS+nb+umADgX1nWLtr6+xQ/qA7EI9RaIjcVRQ6ULiClzzDqpdnnk6
 +gqVWiHrK7zb+eOLc21FzFmgoq5MSI2Pr5sPtTIKr8Nf2JaUjx1dpbWycrVZRpIiDo
 OwEBqhB+Ar8HQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/ttm: Add common debugfs code for resource managers
Date: Wed,  6 Apr 2022 22:56:47 -0400
Message-Id: <20220407025652.146426-2-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407025652.146426-1-zack@kde.org>
References: <20220407025652.146426-1-zack@kde.org>
MIME-Version: 1.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, krastevm@vmware.com,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Drivers duplicate the code required to add debugfs entries for various
ttm resource managers. To fix it add common TTM resource manager
code that each driver can reuse.

Because TTM resource managers can be initialized and set a lot later
than TTM device initialization a seperate init function is required.
Specific resource managers can overwrite
ttm_resource_manager_func::debug to get more information from those
debugfs entries.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 65 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     |  4 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 492ba3157e75..6392ad3e9a88 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -29,6 +29,8 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_bo_driver.h>
 
+#include "ttm_module.h"
+
 /**
  * ttm_lru_bulk_move_init - initialize a bulk move structure
  * @bulk: the structure to init
@@ -644,3 +646,66 @@ ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
 
 	ttm_mem_io_free(bdev, mem);
 }
+
+#if defined(CONFIG_DEBUG_FS)
+
+#define TTM_RES_MAN_SHOW(i) \
+	static int ttm_resource_manager##i##_show(struct seq_file *m, void *unused) \
+	{ \
+		struct ttm_device *bdev = (struct ttm_device *)m->private; \
+		struct ttm_resource_manager *man = ttm_manager_type(bdev, i); \
+		struct drm_printer p = drm_seq_file_printer(m); \
+		ttm_resource_manager_debug(man, &p); \
+		return 0; \
+	}\
+	DEFINE_SHOW_ATTRIBUTE(ttm_resource_manager##i)
+
+TTM_RES_MAN_SHOW(0);
+TTM_RES_MAN_SHOW(1);
+TTM_RES_MAN_SHOW(2);
+TTM_RES_MAN_SHOW(3);
+TTM_RES_MAN_SHOW(4);
+TTM_RES_MAN_SHOW(5);
+TTM_RES_MAN_SHOW(6);
+
+#endif
+
+/**
+ * ttm_resource_manager_debugfs_init - Setup debugfs entries for specified
+ * resource managers.
+ * @bdev: The TTM device
+ * @file_names: A mapping between TTM_TT placements and the debugfs file
+ * names
+ * @num_file_names: The array size of @file_names.
+ *
+ * This function setups up debugfs files that can be used to look
+ * at debug statistics of the specified ttm_resource_managers.
+ * @file_names array is used to figure out which ttm placements
+ * will get debugfs files created for them.
+ */
+void
+ttm_resource_manager_debugfs_init(struct ttm_device *bdev,
+				  const char * const file_names[],
+				  uint32_t num_file_names)
+{
+#if defined(CONFIG_DEBUG_FS)
+	uint32_t i;
+	const struct file_operations *fops[] = {
+		&ttm_resource_manager0_fops,
+		&ttm_resource_manager1_fops,
+		&ttm_resource_manager2_fops,
+		&ttm_resource_manager3_fops,
+		&ttm_resource_manager4_fops,
+		&ttm_resource_manager5_fops,
+		&ttm_resource_manager6_fops,
+	};
+
+	WARN_ON(num_file_names > ARRAY_SIZE(fops));
+
+	for (i = 0; i < num_file_names; ++i)
+		if (file_names[i] && fops[i])
+			debugfs_create_file(file_names[i], 0444,
+					    ttm_debugfs_root, bdev, fops[i]);
+#endif
+}
+EXPORT_SYMBOL(ttm_resource_manager_debugfs_init);
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 4428a62e5f0e..3c85cdd21ca5 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -383,4 +383,8 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
 void ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
 				  struct ttm_device *bdev,
 				  struct ttm_resource *mem);
+
+void ttm_resource_manager_debugfs_init(struct ttm_device *bdev,
+				       const char * const file_name[],
+				       uint32_t num_file_names);
 #endif
-- 
2.32.0

