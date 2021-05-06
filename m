Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD068375ABE
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 20:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486EA6ECF4;
	Thu,  6 May 2021 18:57:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2426B6ED05;
 Thu,  6 May 2021 18:57:13 +0000 (UTC)
IronPort-SDR: Dn7+fghrPzA104SV4vYHmDAMpY9OwfNLCsRDzJVDH1gF3Q97pJ3okX6Rzhz4Zhh5U0iyL5etAw
 wL+gSlPHLlXQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="198195441"
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="198195441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:11 -0700
IronPort-SDR: RZJDVtU5qFgvvTC7JjxoyzDmBTtVCM8LxuDdrqXBdWIofZY0cnKLuaGS5X9y0Az792zbwsJagK
 6T07RV08fiMQ==
X-IronPort-AV: E=Sophos;i="5.82,278,1613462400"; d="scan'208";a="469583434"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2021 11:57:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 25/97] drm/i915/guc: New definition of the CTB descriptor
Date: Thu,  6 May 2021 12:13:39 -0700
Message-Id: <20210506191451.77768-26-matthew.brost@intel.com>
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

Definition of the CTB descriptor has changed, leaving only
minimal shared fields like HEAD/TAIL/STATUS.

Both HEAD and TAIL are now in dwords.

Add some ABI documentation and implement required changes.

GuC: 57.0.0
GuC: 60.0.0
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 .../gt/uc/abi/guc_communication_ctb_abi.h     | 70 ++++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 70 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |  2 +-
 3 files changed, 85 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
index d38935f47ecf..c2a069a78e01 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
@@ -7,6 +7,58 @@
 #define _ABI_GUC_COMMUNICATION_CTB_ABI_H
 
 #include <linux/types.h>
+#include <linux/build_bug.h>
+
+#include "guc_messages_abi.h"
+
+/**
+ * DOC: CT Buffer
+ *
+ * TBD
+ */
+
+/**
+ * DOC: CTB Descriptor
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |  31:0 | **HEAD** - offset (in dwords) to the last dword that was     |
+ *  |   |       | read from the `CT Buffer`_.                                  |
+ *  |   |       | It can only be updated by the receiver.                      |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 |  31:0 | **TAIL** - offset (in dwords) to the last dword that was     |
+ *  |   |       | written to the `CT Buffer`_.                                 |
+ *  |   |       | It can only be updated by the sender.                        |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | **STATUS** - status of the CTB                               |
+ *  |   |       |                                                              |
+ *  |   |       |   - _`GUC_CTB_STATUS_NO_ERROR` = 0 (normal operation)        |
+ *  |   |       |   - _`GUC_CTB_STATUS_OVERFLOW` = 1 (head/tail too large)     |
+ *  |   |       |   - _`GUC_CTB_STATUS_UNDERFLOW` = 2 (truncated message)      |
+ *  |   |       |   - _`GUC_CTB_STATUS_MISMATCH` = 4 (head/tail modified)      |
+ *  |   |       |   - _`GUC_CTB_STATUS_NO_BACKCHANNEL` = 8                     |
+ *  |   |       |   - _`GUC_CTB_STATUS_MALFORMED_MSG` = 16                     |
+ *  +---+-------+--------------------------------------------------------------+
+ *  |...|       | RESERVED = MBZ                                               |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 15|  31:0 | RESERVED = MBZ                                               |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+
+struct guc_ct_buffer_desc {
+	u32 head;
+	u32 tail;
+	u32 status;
+#define GUC_CTB_STATUS_NO_ERROR				0
+#define GUC_CTB_STATUS_OVERFLOW				(1 << 0)
+#define GUC_CTB_STATUS_UNDERFLOW			(1 << 1)
+#define GUC_CTB_STATUS_MISMATCH				(1 << 2)
+#define GUC_CTB_STATUS_NO_BACKCHANNEL			(1 << 3)
+#define GUC_CTB_STATUS_MALFORMED_MSG			(1 << 4)
+	u32 reserved[13];
+} __packed;
+static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
 
 /**
  * DOC: CTB based communication
@@ -60,24 +112,6 @@
  * - **flags**, holds various bits to control message handling
  */
 
-/*
- * Describes single command transport buffer.
- * Used by both guc-master and clients.
- */
-struct guc_ct_buffer_desc {
-	u32 addr;		/* gfx address */
-	u64 host_private;	/* host private data */
-	u32 size;		/* size in bytes */
-	u32 head;		/* offset updated by GuC*/
-	u32 tail;		/* offset updated by owner */
-	u32 is_in_error;	/* error indicator */
-	u32 reserved1;
-	u32 reserved2;
-	u32 owner;		/* id of the channel owner */
-	u32 owner_sub_id;	/* owner-defined field for extra tracking */
-	u32 reserved[5];
-} __packed;
-
 /* Type of command transport buffer */
 #define INTEL_GUC_CT_BUFFER_TYPE_SEND	0x0u
 #define INTEL_GUC_CT_BUFFER_TYPE_RECV	0x1u
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 178f73ab2c96..282df9706912 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -112,32 +112,28 @@ static inline const char *guc_ct_buffer_type_to_str(u32 type)
 	}
 }
 
-static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc,
-				    u32 cmds_addr, u32 size)
+static void guc_ct_buffer_desc_init(struct guc_ct_buffer_desc *desc)
 {
 	memset(desc, 0, sizeof(*desc));
-	desc->addr = cmds_addr;
-	desc->size = size;
-	desc->owner = CTB_OWNER_HOST;
 }
 
-static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb, u32 cmds_addr)
+static void guc_ct_buffer_reset(struct intel_guc_ct_buffer *ctb)
 {
 	ctb->broken = false;
-	guc_ct_buffer_desc_init(ctb->desc, cmds_addr, ctb->size);
+	guc_ct_buffer_desc_init(ctb->desc);
 }
 
 static void guc_ct_buffer_init(struct intel_guc_ct_buffer *ctb,
 			       struct guc_ct_buffer_desc *desc,
-			       u32 *cmds, u32 size)
+			       u32 *cmds, u32 size_in_bytes)
 {
-	GEM_BUG_ON(size % 4);
+	GEM_BUG_ON(size_in_bytes % 4);
 
 	ctb->desc = desc;
 	ctb->cmds = cmds;
-	ctb->size = size;
+	ctb->size = size_in_bytes / 4;
 
-	guc_ct_buffer_reset(ctb, 0);
+	guc_ct_buffer_reset(ctb);
 }
 
 static int guc_action_register_ct_buffer(struct intel_guc *guc,
@@ -279,10 +275,10 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 
 	/* (re)initialize descriptors */
 	cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
-	guc_ct_buffer_reset(&ct->ctbs.send, cmds);
+	guc_ct_buffer_reset(&ct->ctbs.send);
 
 	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
-	guc_ct_buffer_reset(&ct->ctbs.recv, cmds);
+	guc_ct_buffer_reset(&ct->ctbs.recv);
 
 	/*
 	 * Register both CT buffers starting with RECV buffer.
@@ -369,17 +365,15 @@ static int ct_write(struct intel_guc_ct *ct,
 	if (unlikely(ctb->broken))
 		return -EPIPE;
 
-	if (unlikely(desc->is_in_error))
+	if (unlikely(desc->status))
 		goto corrupted;
 
-	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
-		     (tail | head) >= size))
+	if (unlikely((tail | head) >= size)) {
+		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
+			 head, tail, size);
+		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		goto corrupted;
-
-	/* later calculations will be done in dwords */
-	head /= 4;
-	tail /= 4;
-	size /= 4;
+	}
 
 	/*
 	 * tail == head condition indicates empty. GuC FW does not support
@@ -419,14 +413,14 @@ static int ct_write(struct intel_guc_ct *ct,
 	}
 	GEM_BUG_ON(tail > size);
 
-	/* now update desc tail (back in bytes) */
-	desc->tail = tail * 4;
+	/* now update descriptor */
+	WRITE_ONCE(desc->tail, tail);
+
 	return 0;
 
 corrupted:
-	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
-		 desc->addr, desc->head, desc->tail, desc->size);
-	desc->is_in_error = 1;
+	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
+		 desc->head, desc->tail, desc->status);
 	ctb->broken = true;
 	return -EPIPE;
 }
@@ -616,17 +610,15 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	if (unlikely(ctb->broken))
 		return -EPIPE;
 
-	if (unlikely(desc->is_in_error))
+	if (unlikely(desc->status))
 		goto corrupted;
 
-	if (unlikely(!IS_ALIGNED(head | tail, 4) ||
-		     (tail | head) >= size))
+	if (unlikely((tail | head) >= size)) {
+		CT_ERROR(ct, "Invalid offsets head=%u tail=%u (size=%u)\n",
+			 head, tail, size);
+		desc->status |= GUC_CTB_STATUS_OVERFLOW;
 		goto corrupted;
-
-	/* later calculations will be done in dwords */
-	head /= 4;
-	tail /= 4;
-	size /= 4;
+	}
 
 	/* tail == head condition indicates empty */
 	available = tail - head;
@@ -653,6 +645,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 			      size - head : available - 1), &cmds[head],
 			 4 * (head + available - 1 > size ?
 			      available - 1 - size + head : 0), &cmds[0]);
+		desc->status |= GUC_CTB_STATUS_UNDERFLOW;
 		goto corrupted;
 	}
 
@@ -675,13 +668,14 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
 	}
 	CT_DEBUG(ct, "received %*ph\n", 4 * len, (*msg)->msg);
 
-	desc->head = head * 4;
+	/* now update descriptor */
+	WRITE_ONCE(desc->head, head);
+
 	return available - len;
 
 corrupted:
-	CT_ERROR(ct, "Corrupted descriptor addr=%#x head=%u tail=%u size=%u\n",
-		 desc->addr, desc->head, desc->tail, desc->size);
-	desc->is_in_error = 1;
+	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
+		 desc->head, desc->tail, desc->status);
 	ctb->broken = true;
 	return -EPIPE;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
index 7d3cd375d6a7..905202caaad3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
@@ -31,7 +31,7 @@ struct intel_guc;
  * @lock: protects access to the commands buffer and buffer descriptor
  * @desc: pointer to the buffer descriptor
  * @cmds: pointer to the commands buffer
- * @size: size of the commands buffer
+ * @size: size of the commands buffer in dwords
  * @broken: flag to indicate if descriptor data is broken
  */
 struct intel_guc_ct_buffer {
-- 
2.28.0

