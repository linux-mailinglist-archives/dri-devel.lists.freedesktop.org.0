Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B50539AE5C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 00:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F3046F53E;
	Thu,  3 Jun 2021 22:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDB96E110;
 Thu,  3 Jun 2021 22:46:20 +0000 (UTC)
IronPort-SDR: Sfr3SFstAfGiDnvxbWvvjneEpPlEZARgRMBmyiPTh60DWdTQSzWLAz9/C0ocQS6tL/u6oLKx0T
 RTwM9nIWBU4g==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="191280005"
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="191280005"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 15:46:17 -0700
IronPort-SDR: Eh+Fv++PXllqd3gakBt+csvv5opEtRLIHUN9v+gFg5nGwjTQJNKQf6qcwIZLKVyNqTXQ2bRVmo
 KSfhh/Yuig6w==
X-IronPort-AV: E=Sophos;i="5.83,246,1616482800"; d="scan'208";a="468130295"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 15:46:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <daniel.vetter@intel.com>
Subject: [v3 PATCH 1/2] drm/i915/guc: Replace CTB array with explicit members
Date: Thu,  3 Jun 2021 16:04:07 -0700
Message-Id: <20210603230408.54856-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <YLlLlTdvaTGrNmzV@phenom.ffwll.local>
References: <YLlLlTdvaTGrNmzV@phenom.ffwll.local>
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

Upcoming GuC firmware will always require just two CTBs and we
also plan to configure them with different sizes, so definining
them as array is no longer suitable.

v2: Use %p for ptrdiff print
v3: Use %tx for ptrdiff print

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 46 ++++++++++++-----------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  7 +++-
 2 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 34c582105860..ec795d7c3a7d 100644
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
+	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "send",
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
+	CT_DEBUG(ct, "%s desc %#tx cmds %#tx size %u\n", "recv",
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

