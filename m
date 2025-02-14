Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F4FA36707
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 21:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B116010E069;
	Fri, 14 Feb 2025 20:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IujXM0Wd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD99B10E033;
 Fri, 14 Feb 2025 20:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739565480; x=1771101480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4KP3WUSJF+piJ2OJ5kO8VzXNGEWgFcKQfFU0wjFN8+k=;
 b=IujXM0WdhTz7vRl5PuXZ8hRUZkYiBnojTVPbq1R4j1ordDWSJth+N5Ts
 Ljw99Tv+vHgnp+AYM9adsZMivHdKVSaMXMEZcQiPePde0pOvBSTSh0tqY
 1Suj1mMGIUURlJ6BK7I1SSQbSCjfjfb/53ZLXfeup9WRxdArdv7iFDLCp
 vkCtUff1iiMxMIOBKa0EMDBiWPeG26RKsZMDNerZA2xcn3FSbzqs4DgfS
 9RLUoMCNUDRVmL+FErJVLoI7xcN7MSe40BzU6bjXgZIDeOJrkMaRyCVS0
 ITgdrYvXnN/d+PrE8XRAF45NfuNurLv0ynNSoRkq6qUwvXcMFiJRFwGWp A==;
X-CSE-ConnectionGUID: cs8Es7nwTye4MahojrO2SA==
X-CSE-MsgGUID: 3OKa0dzLRyavBnEk54MMuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39558869"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="39558869"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:38:00 -0800
X-CSE-ConnectionGUID: WbK6vzdlQd2XKg5fUKENJw==
X-CSE-MsgGUID: 9+oZy52OT6qRnw/N2LZHnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118760825"
Received: from dut4066lnl.fm.intel.com ([10.105.8.61])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 12:38:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jonathan.cavitt@intel.com,
 saurabhg.gupta@intel.com, alex.zuo@intel.com, joonas.lahtinen@intel.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com
Subject: [PATCH 4/4] drm/xe/xe_drm_client: Add per drm client reset stats
Date: Fri, 14 Feb 2025 20:37:57 +0000
Message-ID: <20250214203757.27895-5-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250214203757.27895-1-jonathan.cavitt@intel.com>
References: <20250214203757.27895-1-jonathan.cavitt@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a counter to xe_drm_client that tracks the number of times the
engine has been reset since the drm client was created.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 drivers/gpu/drm/xe/xe_drm_client.h | 2 ++
 drivers/gpu/drm/xe/xe_guc_submit.c | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index f15560d0b6ff..ecd2ce99fd19 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -492,6 +492,8 @@ static void show_blames(struct drm_printer *p, struct drm_file *file)
 
 	client = xef->client;
 
+	drm_printf(p, "drm-client-reset-count:%u\n",
+		   atomic_read(&client->reset_count));
 	drm_printf(p, "\n");
 	drm_printf(p, "- Exec queue ban list -\n");
 	spin_lock(&client->blame_lock);
diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
index d21fd0b90742..c35de675ccfa 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.h
+++ b/drivers/gpu/drm/xe/xe_drm_client.h
@@ -53,6 +53,8 @@ struct xe_drm_client {
 	 * Protected by @blame_lock;
 	 */
 	struct list_head blame_list;
+	/** @reset_count: number of times this drm client has seen an engine reset */
+	atomic_t reset_count;
 #endif
 };
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index d9da5c89429e..8810abc8f04a 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1988,7 +1988,9 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
 		return -EPROTO;
 
 	hwe = q->hwe;
-
+#ifdef CONFIG_PROC_FS
+	atomic_inc(&q->xef->client->reset_count);
+#endif
 	xe_gt_info(gt, "Engine reset: engine_class=%s, logical_mask: 0x%x, guc_id=%d",
 		   xe_hw_engine_class_to_str(q->class), q->logical_mask, guc_id);
 
-- 
2.43.0

