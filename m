Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459C44F7263
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 04:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFCF10E6D8;
	Thu,  7 Apr 2022 02:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431010E6BE;
 Thu,  7 Apr 2022 02:57:06 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id B80A928A5A9;
 Thu,  7 Apr 2022 03:57:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1649300224; bh=NV0Yn7cdHu6fJ9Gbs3jziR1myA+JbmRSPOMuY7MsD5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cz6+qMMHxVVEW49pVgxbs7Zj/Zrh76KOf2yC6fy93sEa9OY/MG9yqQWJ9Pz0bCdnc
 mGGUxdIOuxQREKP5ChgE23JzS7P/+izLhzvRLTdOvcpcFV3PzEZZZtHTAMCjVdbZpU
 U1uScfz7cWbspzfXceBYVAdozUXStPCgR4tCLjji1vM+7lhXmZFUElsKCYAzw36FuN
 kgvAkmWoWIEtfHNlwd36XXg6DBcn4Ebdnj0uoGbee9B37oLlKWAUdOYt53ItRUKDHm
 /QInuRBiAL+etNRfLXhy0ttTrb2EbpO7zx4Erew2dwuKBR4QkTZaFfshGWGk2qtPk8
 s9IyzKkRTmbZQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/qxl: Use TTM builtin resource manager debugfs code
Date: Wed,  6 Apr 2022 22:56:50 -0400
Message-Id: <20220407025652.146426-5-zack@kde.org>
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
Cc: David Airlie <airlied@linux.ie>, virtualization@lists.linux-foundation.org,
 krastevm@vmware.com, Huang Rui <ray.huang@amd.com>,
 spice-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>, mombasawalam@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Switch to using the TTM resource manager debugfs helpers. The
functionality is largely the same, except that the entries live under
/sys/kernel/debug/ttm/ and their lifetimes are managed by TTM.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 40 ++++++-----------------------------
 1 file changed, 7 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 95df5750f47f..c31d4d751dc4 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -222,41 +222,15 @@ void qxl_ttm_fini(struct qxl_device *qdev)
 	DRM_INFO("qxl: ttm finalized\n");
 }
 
-#define QXL_DEBUGFS_MEM_TYPES 2
-
-#if defined(CONFIG_DEBUG_FS)
-static int qxl_mm_dump_table(struct seq_file *m, void *data)
-{
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
-	struct ttm_resource_manager *man = (struct ttm_resource_manager *)node->info_ent->data;
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	ttm_resource_manager_debug(man, &p);
-	return 0;
-}
-#endif
-
 void qxl_ttm_debugfs_init(struct qxl_device *qdev)
 {
 #if defined(CONFIG_DEBUG_FS)
-	static struct drm_info_list qxl_mem_types_list[QXL_DEBUGFS_MEM_TYPES];
-	static char qxl_mem_types_names[QXL_DEBUGFS_MEM_TYPES][32];
-	unsigned int i;
-
-	for (i = 0; i < QXL_DEBUGFS_MEM_TYPES; i++) {
-		if (i == 0)
-			sprintf(qxl_mem_types_names[i], "qxl_mem_mm");
-		else
-			sprintf(qxl_mem_types_names[i], "qxl_surf_mm");
-		qxl_mem_types_list[i].name = qxl_mem_types_names[i];
-		qxl_mem_types_list[i].show = &qxl_mm_dump_table;
-		qxl_mem_types_list[i].driver_features = 0;
-		if (i == 0)
-			qxl_mem_types_list[i].data = ttm_manager_type(&qdev->mman.bdev, TTM_PL_VRAM);
-		else
-			qxl_mem_types_list[i].data = ttm_manager_type(&qdev->mman.bdev, TTM_PL_PRIV);
-
-	}
-	qxl_debugfs_add_files(qdev, qxl_mem_types_list, i);
+	const char * const ttm_placement_names[] = {
+		[TTM_PL_VRAM] = "qxl_mem_mm",
+		[TTM_PL_PRIV] = "qxl_surf_mm",
+	};
+	ttm_resource_manager_debugfs_init(&qdev->mman.bdev,
+					  ttm_placement_names,
+					  ARRAY_SIZE(ttm_placement_names));
 #endif
 }
-- 
2.32.0

