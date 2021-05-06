Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9C3375A91
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D17B6ED8E;
	Thu,  6 May 2021 18:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87DA56ECE2;
 Thu,  6 May 2021 18:57:11 +0000 (UTC)
IronPort-SDR: pCFP7Q7lKIJeqoR7DcI8RUXOfhhPp07X4+wwzs73sh9inrWIRVS8g3V/R9kQ4aGIJJ9CqN4cbh
 YKr9tPfYY4rw==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="196530989"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="196530989"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:10 -0700
IronPort-SDR: UqxrCEAqlclmZx6K2+ND/BalOt77e8405THOqb0znIx2MfEM6Zc/lc4r+52HelAUepwLAzSzqw
 pWOSHOrEJgWw==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583391"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 13/97] drm/i915/guc: Replace CTB array with explicit
 members
Date: Thu,  6 May 2021 12:13:27 -0700
Message-Id: <20210506191451.77768-14-matthew.brost@intel.com>
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

Upcoming GuC firmware will always require just two CTBs and we
also plan to configure them with different sizes, so definining
them as array is no longer suitable.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 46 ++++++++++++-----------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  7 +++-
 2 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index fbd6bd20f588..c54a29176862 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -168,10 +168,10 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
 	struct intel_guc *guc = ct_to_guc(ct);
 	struct guc_ct_buffer_desc *desc;
 	u32 blob_size;
+	u32 cmds_size;
 	void *blob;
 	u32 *cmds;
 	int err;
-	int i;
 
 	GEM_BUG_ON(ct->vma);
 
@@ -207,15 +207,23 @@ int intel_guc_ct_init(struct intel_guc_ct *ct)
 
 	CT_DEBUG(ct, "base=%#x size=%u\n", intel_guc_ggtt_offset(guc, ct->vma), blob_size);
 
-	/* store pointers to desc and cmds */
-	for (i = 0; i < ARRAY_SIZE(ct->ctbs); i++) {
-		GEM_BUG_ON((i !=  CTB_SEND) && (i != CTB_RECV));
+	/* store pointers to desc and cmds for send ctb */
+	desc = blob;
+	cmds = blob + PAGE_SIZE / 2;
+	cmds_size = PAGE_SIZE / 4;
+	CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "send",
+		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
 
-		desc = blob + PAGE_SIZE / 4 * i;
-		cmds = blob + PAGE_SIZE / 4 * i + PAGE_SIZE / 2;
+	guc_ct_buffer_init(&ct->ctbs.send, desc, cmds, cmds_size);
 
-		guc_ct_buffer_init(&ct->ctbs[i], desc, cmds, PAGE_SIZE / 4);
-	}
+	/* store pointers to desc and cmds for recv ctb */
+	desc = blob + PAGE_SIZE / 4;
+	cmds = blob + PAGE_SIZE / 4 + PAGE_SIZE / 2;
+	cmds_size = PAGE_SIZE / 4;
+	CT_DEBUG(ct, "%s desc %#lx cmds %#lx size %u\n", "recv",
+		 ptrdiff(desc, blob), ptrdiff(cmds, blob), cmds_size);
+
+	guc_ct_buffer_init(&ct->ctbs.recv, desc, cmds, cmds_size);
 
 	return 0;
 }
@@ -246,7 +254,6 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 	u32 base, cmds;
 	void *blob;
 	int err;
-	int i;
 
 	GEM_BUG_ON(ct->enabled);
 
@@ -257,28 +264,25 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 
 	/* blob should start with send descriptor */
 	blob = __px_vaddr(ct->vma->obj);
-	GEM_BUG_ON(blob != ct->ctbs[CTB_SEND].desc);
+	GEM_BUG_ON(blob != ct->ctbs.send.desc);
 
 	/* (re)initialize descriptors */
-	for (i = 0; i < ARRAY_SIZE(ct->ctbs); i++) {
-		GEM_BUG_ON((i != CTB_SEND) && (i != CTB_RECV));
+	cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
+	guc_ct_buffer_reset(&ct->ctbs.send, cmds);
 
-		cmds = base + ptrdiff(ct->ctbs[i].cmds, blob);
-		CT_DEBUG(ct, "%d: cmds addr=%#x\n", i, cmds);
-
-		guc_ct_buffer_reset(&ct->ctbs[i], cmds);
-	}
+	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
+	guc_ct_buffer_reset(&ct->ctbs.recv, cmds);
 
 	/*
 	 * Register both CT buffers starting with RECV buffer.
 	 * Descriptors are in first half of the blob.
 	 */
-	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs[CTB_RECV].desc, blob),
+	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs.recv.desc, blob),
 				 INTEL_GUC_CT_BUFFER_TYPE_RECV);
 	if (unlikely(err))
 		goto err_out;
 
-	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs[CTB_SEND].desc, blob),
+	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs.send.desc, blob),
 				 INTEL_GUC_CT_BUFFER_TYPE_SEND);
 	if (unlikely(err))
 		goto err_deregister;
@@ -341,7 +345,7 @@ static int ct_write(struct intel_guc_ct *ct,
 		    u32 len /* in dwords */,
 		    u32 fence)
 {
-	struct intel_guc_ct_buffer *ctb = &ct->ctbs[CTB_SEND];
+	struct intel_guc_ct_buffer *ctb = &ct->ctbs.send;
 	struct guc_ct_buffer_desc *desc = ctb->desc;
 	u32 head = desc->head;
 	u32 tail = desc->tail;
@@ -557,7 +561,7 @@ static inline bool ct_header_is_response(u32 header)
 
 static int ct_read(struct intel_guc_ct *ct, u32 *data)
 {
-	struct intel_guc_ct_buffer *ctb = &ct->ctbs[CTB_RECV];
+	struct intel_guc_ct_buffer *ctb = &ct->ctbs.recv;
 	struct guc_ct_buffer_desc *desc = ctb->desc;
 	u32 head = desc->head;
 	u32 tail = desc->tail;
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 4009e2dd0de4..fc9486779e87 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -47,8 +47,11 @@ struct intel_guc_ct {
 	struct i915_vma *vma;
 	bool enabled;
 
-	/* buffers for sending(0) and receiving(1) commands */
-	struct intel_guc_ct_buffer ctbs[2];
+	/* buffers for sending and receiving commands */
+	struct {
+		struct intel_guc_ct_buffer send;
+		struct intel_guc_ct_buffer recv;
+	} ctbs;
 
 	struct {
 		u32 last_fence; /* last fence used to send request */
-- 
2.28.0

