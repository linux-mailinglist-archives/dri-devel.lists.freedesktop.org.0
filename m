Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCA2606E67
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 05:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4E010E508;
	Fri, 21 Oct 2022 03:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B47D10E260
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 03:44:18 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id DCC8F33EED9;
 Fri, 21 Oct 2022 04:44:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1666323857; bh=6Xz2BBaseeaXMFEGywcoOKS9ZDkFugwVa8i4lZ77P3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MBptvJKSebgEp+kVYhUCTTVx+CzfJ1yICUK+VwiW7AnjeF4/vD0mYZhvkDU9iZZ8p
 gFwoCJjarSrEioLxJCXoK9u4vi7Jj97hEwK45q65RcmdrIOiMhBkM5dzNyqM4FNdLh
 /woihCWCkuX8d0SCAA6aQRX/iQukWzJPB2PM7ZyJUT2y6U7j//BKVcCrQWZ5oc9NJd
 spxARIaSmXv9ggYQlG4Ib2pr2uG4S41bmT+LuG9sdsiEPUVVHpQ4B50URp4hCnZ7C8
 dyQZgUkPvU4mDrbx0K4Q3kz3in5nq/EGU8/YNbZ/OvbFQ6fZKcFyU7lrtS/yf2aeCt
 g9a8gYA0uLfrQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 15/17] drm/vmwgfx: Add a mksstat counter for cotable resizes
Date: Thu, 20 Oct 2022 23:43:58 -0400
Message-Id: <20221021034400.542909-16-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021034400.542909-1-zack@kde.org>
References: <20221021034400.542909-1-zack@kde.org>
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
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

There's been a lot of cotable resizes on startup which we can track
by adding a mks stat to measure both the invocation count and
time spent doing cotable resizes.

This is only used if kernel is configured with CONFIG_DRM_VMWGFX_MKSSTATS
The stats are collected on the host size inside the vmware-stats.log
file.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Michael Banack <banackm@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c | 13 +++++++++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h |  2 ++
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c     | 16 +++++++++-------
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index 79b30dc9d825..a4c30f950d7c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -33,6 +33,7 @@
 #include <drm/ttm/ttm_placement.h>
 
 #include "vmwgfx_drv.h"
+#include "vmwgfx_mksstat.h"
 #include "vmwgfx_resource_priv.h"
 #include "vmwgfx_so.h"
 
@@ -395,9 +396,12 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 	int ret;
 	size_t i;
 
+	MKS_STAT_TIME_DECL(MKSSTAT_KERN_COTABLE_RESIZE);
+	MKS_STAT_TIME_PUSH(MKSSTAT_KERN_COTABLE_RESIZE);
+
 	ret = vmw_cotable_readback(res);
 	if (ret)
-		return ret;
+		goto out_done;
 
 	cur_size_read_back = vcotbl->size_read_back;
 	vcotbl->size_read_back = old_size_read_back;
@@ -411,7 +415,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 			    true, true, vmw_bo_bo_free, &buf);
 	if (ret) {
 		DRM_ERROR("Failed initializing new cotable MOB.\n");
-		return ret;
+		goto out_done;
 	}
 
 	bo = &buf->base;
@@ -485,6 +489,8 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 	/* Release the pin acquired in vmw_bo_init */
 	ttm_bo_unpin(bo);
 
+	MKS_STAT_TIME_POP(MKSSTAT_KERN_COTABLE_RESIZE);
+
 	return 0;
 
 out_map_new:
@@ -494,6 +500,9 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 	ttm_bo_unreserve(bo);
 	vmw_bo_unreference(&buf);
 
+out_done:
+	MKS_STAT_TIME_POP(MKSSTAT_KERN_COTABLE_RESIZE);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h b/drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h
index 0509f55f07b4..ede74c7fdbbf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h
@@ -29,6 +29,7 @@
 #define _VMWGFX_MKSSTAT_H_
 
 #include <asm/page.h>
+#include <linux/kconfig.h>
 
 /* Reservation marker for mksstat pid's */
 #define MKSSTAT_PID_RESERVED -1
@@ -41,6 +42,7 @@
 
 typedef enum {
 	MKSSTAT_KERN_EXECBUF, /* vmw_execbuf_ioctl */
+	MKSSTAT_KERN_COTABLE_RESIZE,
 
 	MKSSTAT_KERN_COUNT /* Reserved entry; always last */
 } mksstat_kern_stats_t;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index a6cea35eaa01..8700d038d74d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -85,7 +85,14 @@ struct rpc_channel {
 	u32 cookie_low;
 };
 
-
+#if IS_ENABLED(CONFIG_DRM_VMWGFX_MKSSTATS)
+/* Kernel mksGuestStats counter names and desciptions; same order as enum mksstat_kern_stats_t */
+static const char* const mksstat_kern_name_desc[MKSSTAT_KERN_COUNT][2] =
+{
+	{ "vmw_execbuf_ioctl", "vmw_execbuf_ioctl" },
+	{ "vmw_cotable_resize", "vmw_cotable_resize" },
+};
+#endif
 
 /**
  * vmw_open_channel
@@ -695,12 +702,6 @@ static inline void hypervisor_ppn_remove(PPN64 pfn)
 /* Header to the text description of mksGuestStat instance descriptor */
 #define MKSSTAT_KERNEL_DESCRIPTION "vmwgfx"
 
-/* Kernel mksGuestStats counter names and desciptions; same order as enum mksstat_kern_stats_t */
-static const char* const mksstat_kern_name_desc[MKSSTAT_KERN_COUNT][2] =
-{
-	{ "vmw_execbuf_ioctl", "vmw_execbuf_ioctl" },
-};
-
 /**
  * mksstat_init_record: Initializes an MKSGuestStatCounter-based record
  * for the respective mksGuestStat index.
@@ -786,6 +787,7 @@ static int mksstat_init_kern_id(struct page **ppage)
 	/* Set up all kernel-internal counters and corresponding structures */
 	pstrs_acc = pstrs;
 	pstrs_acc = mksstat_init_record_time(MKSSTAT_KERN_EXECBUF, pstat, pinfo, pstrs_acc);
+	pstrs_acc = mksstat_init_record_time(MKSSTAT_KERN_COTABLE_RESIZE, pstat, pinfo, pstrs_acc);
 
 	/* Add new counters above, in their order of appearance in mksstat_kern_stats_t */
 
-- 
2.34.1

