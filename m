Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002C639AE5A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 00:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4226E106;
	Thu,  3 Jun 2021 22:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AEB6E106;
 Thu,  3 Jun 2021 22:46:20 +0000 (UTC)
IronPort-SDR: 1CX1zpR+VDgbQeffP0Tyq0/qYC8ZRdOe7WY0eWCqrb7bvig+ZyVTJT5LjnfBcgBgX6nyOpIg62
 HqBjkQxZNO0A==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="191280004"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="191280004"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 15:46:17 -0700
IronPort-SDR: zeBUY6PSvjRfLIkS1piibYsMQJGbrovJxs5LH+PjaQFwxQY9OYEqIvLxnPsfBGJUvE6NpWvcr5
 hWQXD7cupxMQ==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="468130291"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 15:46:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <daniel.vetter@intel.com>
Subject: [v3 PATCH 2/2] drm/i915/guc: Update sizes of CTB buffers
Date: Thu,  3 Jun 2021 16:04:08 -0700
Message-Id: <20210603230408.54856-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210603230408.54856-1-matthew.brost@intel.com>
References: <YLlLlTdvaTGrNmzV@phenom.ffwll.local>
 <20210603230408.54856-1-matthew.brost@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Future GuC will require CTB buffers sizes to be multiple of 4K.
Make these changes now as this shouldn't impact us too much.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 60 ++++++++++++-----------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index ec795d7c3a7d..8d1173032431 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -38,6 +38,32 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
 #define CT_PROBE_ERROR(_ct, _fmt, ...) \
 	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__)
 
+/**
+ * DOC: CTB Blob
+ *
+ * We allocate single blob to hold both CTB descriptors and buffers:
+ *
+ *      +--------+-----------------------------------------------+------+
+ *      | offset | contents                                      | size |
+ *      +========+===============================================+======+
+ *      | 0x0000 | H2G `CTB Descriptor`_ (send)                  |      |
+ *      +--------+-----------------------------------------------+  4K  |
+ *      | 0x0800 | G2H `CTB Descriptor`_ (recv)                  |      |
+ *      +--------+-----------------------------------------------+------+
+ *      | 0x1000 | H2G `CT Buffer`_ (send)                       | n*4K |
+ *      |        |                                               |      |
+ *      +--------+-----------------------------------------------+------+
+ *      | 0x1000 | G2H `CT Buffer`_ (recv)                       | m*4K |
+ *      | + n*4K |                                               |      |
+ *      +--------+-----------------------------------------------+------+
+ *
+ * Size of each `CT Buffer`_ must be multiple of 4K.
+ * As we don't expect too many messages, for now use minimum sizes.
+ */
+#define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
+#define CTB_H2G_BUFFER_SIZE	(SZ_4K)
+#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
+
 struct ct_request {
 	struct list_head link;
 	u32 fence;
@@ -175,29 +201,7 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
 
 	GEM_BUG_ON(ct->vma);
 
-	/* We allocate 1 page to hold both descriptors and both buffers.
-	 *       ___________.....................
-	 *      |desc (SEND)|                   :
-	 *      |___________|                   PAGE/4
-	 *      :___________....................:
-	 *      |desc (RECV)|                   :
-	 *      |___________|                   PAGE/4
-	 *      :_______________________________:
-	 *      |cmds (SEND)                    |
-	 *      |                               PAGE/4
-	 *      |_______________________________|
-	 *      |cmds (RECV)                    |
-	 *      |                               PAGE/4
-	 *      |_______________________________|
-	 *
-	 * Each message can use a maximum of 32 dwords and we don't expect to
-	 * have more than 1 in flight at any time, so we have enough space.
-	 * Some logic further ahead will rely on the fact that there is only 1
-	 * page and that it is always mapped, so if the size is changed the
-	 * other code will need updating as well.
-	 */
-
-	blob_size = PAGE_SIZE;
+	blob_size = 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE + CTB_G2H_BUFFER_SIZE;
 	err = intel_guc_allocate_and_map_vma(guc, blob_size, &ct->vma, &blob);
 	if (unlikely(err)) {
 		CT_PROBE_ERROR(ct, "Failed to allocate %u for CTB data (%pe)\n",
@@ -209,17 +213,17 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
 
 	/* store pointers to desc and cmds for send ctb */
 	desc = blob;
-	cmds = blob + PAGE_SIZE / 2;
-	cmds_size = PAGE_SIZE / 4;
+	cmds = blob + 2 * CTB_DESC_SIZE;
+	cmds_size = CTB_H2G_BUFFER_SIZE;
 	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "send",
 		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
 
 	guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size);
 
 	/* store pointers to desc and cmds for recv ctb */
-	desc = blob + PAGE_SIZE / 4;
-	cmds = blob + PAGE_SIZE / 4 + PAGE_SIZE / 2;
-	cmds_size = PAGE_SIZE / 4;
+	desc = blob + CTB_DESC_SIZE;
+	cmds = blob + 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE;
+	cmds_size = CTB_G2H_BUFFER_SIZE;
 	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "recv",
 		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
 
-- 
2.28.0

