Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A060973A60F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 18:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA7F10E057;
	Thu, 22 Jun 2023 16:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4D310E057;
 Thu, 22 Jun 2023 16:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687451243; x=1718987243;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qchmNdCeo8GpHGV3qIN6ESvhTvvCcrAo5F5Zyw/kb7M=;
 b=OlJMxPy57V06nW8qgx2iX67US3UVUOWO1IN/JOQ91AAExwCB1/BfLY8E
 ww6nFLgow1SI5f5IqCbAvFBEUujXoYOihyDakaZJinu70oDYmlRLl4g/z
 oqFCQg9K39+8qD0ayVbd3D2BeMHIGCG4dzEgN3K1YqvQ15jNlwLfLU5hc
 ga7snDdEOMtaq6pYYhf9JyUep1Lcp0n0pATa02N04OwPDKm5U+lwCwMJp
 JU7FrD0bf9iDU/VWUMCtv9DNZzNkszs82+h/GZ9k29XDOonf4rs8kJ8J7
 kFNVwodwcV4Mvr9+PJq5bAeYZXzZTD+3EYdci2mP+id7JwMQJcptyGB3c A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="360564843"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="360564843"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 09:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="859511650"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="859511650"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2023 09:27:15 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2] drm/xe/guc: Fix h2g_write usage of GUC_CTB_MSG_MAX_LEN
Date: Thu, 22 Jun 2023 09:27:14 -0700
Message-Id: <20230622162714.396367-1-alan.previn.teres.alexis@intel.com>
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

v2: By correctly treating GUC_CTB_MSG_MAX_LEN as dwords, it causes
    a local array to consume 4x the stack size. Rework the function
    to avoid consuming stack even if the action size is large.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_ct.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 22bc9ce846db..45fdc0ebcc0e 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -401,19 +401,22 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
 {
 	struct xe_device *xe = ct_to_xe(ct);
 	struct guc_ctb *h2g = &ct->ctbs.h2g;
-	u32 cmd[GUC_CTB_MSG_MAX_LEN / sizeof(u32)];
-	u32 cmd_len = len + GUC_CTB_HDR_LEN;
-	u32 cmd_idx = 0, i;
+#define H2G_CT_HEADERS 2  /* one for CTB header and one for HxG header */
+	u32 cmd[H2G_CT_HEADERS];
 	u32 tail = h2g->info.tail;
+	u32 full_len;
 	struct iosys_map map = IOSYS_MAP_INIT_OFFSET(&h2g->cmds,
 							 tail * sizeof(u32));
 
+	--len; /* cmd[1] replaces action[0], so len is one dw less */
+	full_len = len + H2G_CT_HEADERS;
+
 	lockdep_assert_held(&ct->lock);
-	XE_BUG_ON(len * sizeof(u32) > GUC_CTB_MSG_MAX_LEN);
+	XE_BUG_ON(len > (GUC_CTB_MSG_MAX_LEN - H2G_CT_HEADERS));
 	XE_BUG_ON(tail > h2g->info.size);
 
 	/* Command will wrap, zero fill (NOPs), return and check credits again */
-	if (tail + cmd_len > h2g->info.size) {
+	if (tail + H2G_CT_HEADERS + len > h2g->info.size) {
 		xe_map_memset(xe, &map, 0, 0,
 			      (h2g->info.size - tail) * sizeof(u32));
 		h2g_reserve_space(ct, (h2g->info.size - tail));
@@ -428,30 +431,30 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
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

base-commit: f0727faae3ac98601f3f4299a967f26542b3e482
-- 
2.39.0

