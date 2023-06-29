Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C2742F3B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 23:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D398A10E3FA;
	Thu, 29 Jun 2023 21:04:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B6A10E3FA;
 Thu, 29 Jun 2023 21:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688072660; x=1719608660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DKgzfp86Q0KqyedoDJ6vYBCPGtnMluW8FdLSwL2ABgg=;
 b=JYRxhKBLQnqC+vFl57iBzj1BdanXfIeiImuanSyVwNJ1ewOdTu6/L133
 HusdlHMKxgc+Niymmwkjd/Mygf2xcBD8Ajv8bzOg7h10guh/N0IfT5rPJ
 UPmUW35w3y/CgIOIFgnhIRR7c5HKjURMU2jmHOImODU0R8b9EhzaR/1GY
 q10uJPoZ8xdsON9M4KEzfxqHP8o8iynZY8Z0YdKzLLC61m9YyKgBirPx3
 aH7FSfD5+xkdvAbkBSohYmHtzIHgqrhdvWuEyhDvaRz3cW74UsT9OYJcr
 ZwsrLJrAdiJVrvNNmEo2cdsRBup7Pr4Yinblmd2cCJVXhTGYSa52DodAn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364807341"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="364807341"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 14:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891525907"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; d="scan'208";a="891525907"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 29 Jun 2023 14:04:18 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3] drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
Date: Thu, 29 Jun 2023 14:04:18 -0700
Message-Id: <20230629210418.1289315-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the ABI header, GUC_CTB_MSG_MIN_LEN is '1' because
GUC_CTB_HDR_LEN is 1. This aligns with H2G/G2H CTB specification
where all command formats are defined in units of dwords so that '1'
is a dword. Accordingly, GUC_CTB_MSG_MAX_LEN is 256-1 (i.e. 255
dwords). However, h2g_write was incorrectly assuming that
GUC_CTB_MSG_MAX_LEN was in bytes. Fix this.

v3: Fix nit on #define location.(Matt)
v2: By correctly treating GUC_CTB_MSG_MAX_LEN as dwords, it causes
    a local array to consume 4x the stack size. Rework the function
    to avoid consuming stack even if the action size is large. (Matt)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

---
 drivers/gpu/drm/xe/xe_guc_ct.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 22bc9ce846db..aa04b5c4822f 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -401,19 +401,21 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct guc_ctb *h2g = &ct->ctbs.h2g;
-	u32 cmd[GUC_CTB_MSG_MAX_LEN / sizeof(u32)];
-	u32 cmd_len = len + GUC_CTB_HDR_LEN;
-	u32 cmd_idx = 0, i;
+#define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
+	u32 cmd[H2G_CT_HEADERS];
 	u32 tail = h2g->info.tail;
+	u32 full_len;
 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
 							 tail * sizeof(u32));
 
+	full_len = len + GUC_CTB_HDR_LEN;
+
 	lockdep_assert_held(&ct->lock);
-	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
+	XE_BUG_ON(full_len > (GUC_CTB_MSG_MAX_LEN - GUC_CTB_HDR_LEN));
 	XE_BUG_ON(tail > h2g->info.size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
-	if (tail + cmd_len > h2g->info.size) {
+	if (tail + full_len > h2g->info.size) {
 		xe_map_memset(xe, &map, 0, 0,
 			      (h2g->info.size - tail) * sizeof(u32));
 		h2g_reserve_space(ct, (h2g->info.size - tail));
@@ -428,30 +430,33 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 	 * dw1: HXG header (including action code)
 	 * dw2+: action data
 	 */
-	cmd[cmd_idx++] = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
+	cmd[0] = FIELD_PREP(GUC_CTB_MSG_0_FORMAT, GUC_CTB_FORMAT_HXG) |
 		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
 		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
 	if (want_response) {
-		cmd[cmd_idx++] =
+		cmd[1] =
 			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
 			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
 				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
 	} else {
-		cmd[cmd_idx++] =
+		cmd[1] =
 			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_EVENT) |
 			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
 				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
 	}
-	for (i = 1; i < len; ++i)
-		cmd[cmd_idx++] = action[i];
+
+	/* H2G header in cmd[1] replaces action[0] so: */
+	--len;
+	++action;
 
 	/* Write H2G ensuring visable before descriptor update */
-	xe_map_memcpy_to(xe, &map, 0, cmd, cmd_len * sizeof(u32));
+	xe_map_memcpy_to(xe, &map, 0, cmd, H2G_CT_HEADERS * sizeof(u32));
+	xe_map_memcpy_to(xe, &map, H2G_CT_HEADERS * sizeof(u32), action, len * sizeof(u32));
 	xe_device_wmb(ct_to_xe(ct));
 
 	/* Update local copies */
-	h2g->info.tail = (tail + cmd_len) % h2g->info.size;
-	h2g_reserve_space(ct, cmd_len);
+	h2g->info.tail = (tail + full_len) % h2g->info.size;
+	h2g_reserve_space(ct, full_len);
 
 	/* Update descriptor */
 	desc_write(xe, h2g, tail, h2g->info.tail);

base-commit: 2ec46ad7578ebba3048d6031c1a75c21920f0e19
-- 
2.39.0

