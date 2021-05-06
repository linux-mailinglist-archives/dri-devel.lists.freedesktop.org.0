Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE428375AA4
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADFA6ED88;
	Thu,  6 May 2021 18:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4C86ECE1;
 Thu,  6 May 2021 18:57:11 +0000 (UTC)
IronPort-SDR: gzaW0lhSL0XK+gHnMoIhON7PcsnFLh4Bs3CBlg9MqujPvKaRuLSWCVYP/cz+AnhwWdicile4DX
 63sZdB0BaY+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196530991"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196530991"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
IronPort-SDR: dgx/nakS0KWvqra9uwLbsZgxGXUf1S57dZ8lWlVKSfeDFTKfRLvGrGV8Mb1KgRejSJfxBB93xG
 zVfZQyW+PMrw==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583401"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 14/97] drm/i915/guc: Update sizes of CTB buffers
Date: Thu,  6 May 2021 12:13:28 -0700
Message-Id: <20210506191451.77768-15-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210506191451.77768-1-matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@intel.com,
 daniele.ceraolospurio@intel.com, jason.ekstrand@intel.com,
 jon.bloomfield@intel.com, daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Future GuC will require CTB buffers sizes to be multiple of 4K.
Make these changes now as this shouldn't impact us too much.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 60 ++++++++++++-----------
 1 file changed, 32 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index c54a29176862..c87a0a8bef26 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -38,6 +38,32 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
 #define CT_PROBE_ERROR(_ct, _fmt, ...) \
 	i915_probe_error(ct_to_i915(ct), "CT: " _fmt, ##__VA_ARGS__);
 
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
 	CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "send",
 		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
 
 	guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size);
 
 	/* store pointers to desc and cmds for recv ctb */
-	desc = blob + PAGE_SIZE / 4;
-	cmds = blob + PAGE_SIZE / 4 + PAGE_SIZE / 2;
-	cmds_size = PAGE_SIZE / 4;
+	desc = blob + CTB_DESC_SIZE;
+	cmds = blob + 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE;
+	cmds_size = CTB_G2H_BUFFER_SIZE;
 	CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "recv",
 		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
 
-- 
2.28.0

