Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D258A4FCD23
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 05:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF4C10FB48;
	Tue, 12 Apr 2022 03:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCCF10FB44
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 03:35:34 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id E1175283884;
 Tue, 12 Apr 2022 04:35:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649734532; bh=mjcdiG3O6sVl3q++Zmc4p1pfQ8dqNUTi4b+plpf3ivc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HWGwodvmPPbHe4e1q8vD2HB5Pfb/eaOax/cpZ35l+g3v9uRTAIbZZ25NX5iyHgU4/
 mG4Ir7zuETLjKM6Ur1Ab3LO12RCYIRnFc/PgZ0TGjJbHa8lSg2cZdZeZzDt9GAaZ7I
 l/GL1yUWQm74dj4aRlInEIv0zU+EYgXlOsGISIseHoCbiBLw05wSFQwZN6+See13T+
 5ogfREmd1OSVye7rk9i7f5vB/c4HK4dGn9mUWPFNE3m2FMFMF4b/Pvz8tjNhG0bIY/
 o7nj78GWlzpRcVczXgtTKARAaOSFWNQjNx6KhwMDMt8MfN8fiGpxI06WGBH6kLt/x3
 j9b5yl/u6cS+A==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/5] drm/ttm: Add common debugfs code for resource managers
Date: Mon, 11 Apr 2022 23:35:22 -0400
Message-Id: <20220412033526.369115-2-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220412033526.369115-1-zack@kde.org>
References: <20220412033526.369115-1-zack@kde.org>
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
ttm resource managers. To fix it add common TTM resource manager debugfs
code that each driver can reuse.

Specific resource managers can overwrite
ttm_resource_manager_func::debug to get more information from those
debugfs entries.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 34 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     |  4 ++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 492ba3157e75..543db15bce5e 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -644,3 +644,37 @@ ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
 
 	ttm_mem_io_free(bdev, mem);
 }
+
+#if defined(CONFIG_DEBUG_FS)
+
+static int ttm_resource_manager_show(struct seq_file *m, void *unused)
+{
+	struct ttm_resource_manager *man =
+		(struct ttm_resource_manager *)m->private;
+	struct drm_printer p = drm_seq_file_printer(m);
+	ttm_resource_manager_debug(man, &p);
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(ttm_resource_manager);
+
+#endif
+
+/**
+ * ttm_resource_manager_create_debugfs - Create debugfs entry for specified
+ * resource manager.
+ * @man: The TTM resource manager for which the debugfs stats file be creates
+ * @parent: debugfs directory in which the file will reside
+ * @name: The filename to create.
+ *
+ * This function setups up a debugfs file that can be used to look
+ * at debug statistics of the specified ttm_resource_manager.
+ */
+void ttm_resource_manager_create_debugfs(struct ttm_resource_manager *man,
+					 struct dentry * parent,
+					 const char *name)
+{
+#if defined(CONFIG_DEBUG_FS)
+	debugfs_create_file(name, 0444, parent, man, &ttm_resource_manager_fops);
+#endif
+}
+EXPORT_SYMBOL(ttm_resource_manager_create_debugfs);
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index 4428a62e5f0e..c702e00fb16e 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -383,4 +383,8 @@ ttm_kmap_iter_linear_io_init(struct ttm_kmap_iter_linear_io *iter_io,
 void ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
 				  struct ttm_device *bdev,
 				  struct ttm_resource *mem);
+
+void ttm_resource_manager_create_debugfs(struct ttm_resource_manager *man,
+					 struct dentry * parent,
+					 const char *name);
 #endif
-- 
2.32.0

