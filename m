Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFC939E5BD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9366E98E;
	Mon,  7 Jun 2021 17:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14D76E986;
 Mon,  7 Jun 2021 17:46:06 +0000 (UTC)
IronPort-SDR: gkfE6Bc0WqnkTXLd4ntVUoj70FgmFDbvlU71VKZmlN9a4YtXG4+bwZlz0ctQd8T5LMzk79t9oZ
 1AfAFjz4PK3A==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204695176"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="204695176"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:05 -0700
IronPort-SDR: xUcwrLz8hz9rHB2zawGLNyP+azXGmtOv127lVGemw5i2APPf0BSk2bOa/xcBHS9wLq3aTVIiUV
 7LXJdTPQayHA==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="551970164"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 10:46:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/13] drm/i915/guc: Add flag for mark broken CTB
Date: Mon,  7 Jun 2021 11:03:47 -0700
Message-Id: <20210607180356.165785-6-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210607180356.165785-1-matthew.brost@intel.com>
References: <20210607180356.165785-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Once CTB descriptor is found in error state, either set by GuC
or us, there is no need continue checking descriptor any more,
we can rely on our internal flag.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 13 +++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |  2 ++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 3f7f48611487..63056ea0631e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -123,6 +123,7 @@ static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
 
 static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb, u32 cmds_addr)
 {
+	ctb->broken = false;
 	guc_ct_buffer_desc_init(ctb->desc, cmds_addr, ctb->size);
 }
 
@@ -387,9 +388,12 @@ static int ct_write(struct intel_guc_ct *ct,
 	u32 *cmds = ctb->cmds;
 	unsigned int i;
 
-	if (unlikely(desc->is_in_error))
+	if (unlikely(ctb->broken))
 		return -EPIPE;
 
+	if (unlikely(desc->is_in_error))
+		goto corrupted;
+
 	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
 		     (tail | head) >= size))
 		goto corrupted;
@@ -451,6 +455,7 @@ static int ct_write(struct intel_guc_ct *ct,
 	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
 		 desc->addr, desc->head, desc->tail, desc->size);
 	desc->is_in_error = 1;
+	ctb->broken = true;
 	return -EPIPE;
 }
 
@@ -632,9 +637,12 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	unsigned int i;
 	u32 header;
 
-	if (unlikely(desc->is_in_error))
+	if (unlikely(ctb->broken))
 		return -EPIPE;
 
+	if (unlikely(desc->is_in_error))
+		goto corrupted;
+
 	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
 		     (tail | head) >= size))
 		goto corrupted;
@@ -698,6 +706,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
 		 desc->addr, desc->head, desc->tail, desc->size);
 	desc->is_in_error = 1;
+	ctb->broken = true;
 	return -EPIPE;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index cb222f202301..7d3cd375d6a7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -32,12 +32,14 @@ struct intel_guc;
  * @desc: pointer to the buffer descriptor
  * @cmds: pointer to the commands buffer
  * @size: size of the commands buffer
+ * @broken: flag to indicate if descriptor data is broken
  */
 struct intel_guc_ct_buffer {
 	spinlock_t lock;
 	struct guc_ct_buffer_desc *desc;
 	u32 *cmds;
 	u32 size;
+	bool broken;
 };
 
 
-- 
2.28.0

