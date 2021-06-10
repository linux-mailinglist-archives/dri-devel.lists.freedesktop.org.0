Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A7C3A2336
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 06:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1576E81B;
	Thu, 10 Jun 2021 04:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811F66E455;
 Thu, 10 Jun 2021 04:19:01 +0000 (UTC)
IronPort-SDR: vZxaiVu5Juvu3LT8S6v9y3nbIdzM/wuW0JUt2mIDBqCLYjPqEpM7XoZLuqMyaGtLBcm9UdyiGL
 qpm7vPqpG9zQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203373012"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="203373012"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:01 -0700
IronPort-SDR: YRV1kI+791NojKDHA/E8hz4rEpmUVN/kfcldcTqvfurTnTdRxqnua62qgFtgclljec/nH4WwxB
 RPev47KdDP3Q==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="485997270"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/13] drm/i915/guc: New definition of the CTB registration
 action
Date: Wed,  9 Jun 2021 21:36:43 -0700
Message-Id: <20210610043649.144416-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210610043649.144416-1-matthew.brost@intel.com>
References: <20210610043649.144416-1-matthew.brost@intel.com>
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

Definition of the CTB registration action has changed.
Add some ABI documentation and implement required changes.

v2:
 (Checkpoint)
  - Fix warnings
 (Daniele)
  - Drop FIXME
 (John H)
  - Drop value in kernel doc, just use define

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com> #4
---
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++++++++++++++
 .../gt/uc/abi/guc_communication_ctb_abi.h     |   4 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     |  76 ++++++++-----
 3 files changed, 152 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
index 90efef8a73e4..dfaea0b54370 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
@@ -6,6 +6,113 @@
 #ifndef _ABI_GUC_ACTIONS_ABI_H
 #define _ABI_GUC_ACTIONS_ABI_H
 
+/**
+ * DOC: HOST2GUC_REGISTER_CTB
+ *
+ * This message is used as part of the `CTB based communication`_ setup.
+ *
+ * This message must be sent as `MMIO HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_REGISTER_CTB`                 |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 | 31:12 | RESERVED = MBZ                                               |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  11:8 | **TYPE** - type for the `CT Buffer`_                         |
+ *  |   |       |                                                              |
+ *  |   |       |   - _`GUC_CTB_TYPE_HOST2GUC` = 0                             |
+ *  |   |       |   - _`GUC_CTB_TYPE_GUC2HOST` = 1                             |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |   7:0 | **SIZE** - size of the `CT Buffer`_ in 4K units minus 1      |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 2 |  31:0 | **DESC_ADDR** - GGTT address of the `CTB Descriptor`_        |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 3 |  31:0 | **BUFF_ADDF** - GGTT address of the `CT Buffer`_             |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = MBZ                                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_HOST2GUC_REGISTER_CTB		0x4505
+
+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 3u)
+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_0_MBZ		GUC_HXG_REQUEST_MSG_0_DATA0
+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_MBZ		(0xfffff << 12)
+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_TYPE	(0xf << 8)
+#define   GUC_CTB_TYPE_HOST2GUC				0u
+#define   GUC_CTB_TYPE_GUC2HOST				1u
+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_SIZE	(0xff << 0)
+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR	GUC_HXG_REQUEST_MSG_n_DATAn
+#define HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR	GUC_HXG_REQUEST_MSG_n_DATAn
+
+#define HOST2GUC_REGISTER_CTB_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define HOST2GUC_REGISTER_CTB_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
+
+/**
+ * DOC: HOST2GUC_DEREGISTER_CTB
+ *
+ * This message is used as part of the `CTB based communication`_ teardown.
+ *
+ * This message must be sent as `MMIO HXG Message`_.
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 27:16 | DATA0 = MBZ                                                  |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  15:0 | ACTION = _`GUC_ACTION_HOST2GUC_DEREGISTER_CTB`               |
+ *  +---+-------+--------------------------------------------------------------+
+ *  | 1 | 31:12 | RESERVED = MBZ                                               |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  11:8 | **TYPE** - type of the `CT Buffer`_                          |
+ *  |   |       |                                                              |
+ *  |   |       | see `GUC_ACTION_HOST2GUC_REGISTER_CTB`_                      |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |   7:0 | RESERVED = MBZ                                               |
+ *  +---+-------+--------------------------------------------------------------+
+ *
+ *  +---+-------+--------------------------------------------------------------+
+ *  |   | Bits  | Description                                                  |
+ *  +===+=======+==============================================================+
+ *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
+ *  |   +-------+--------------------------------------------------------------+
+ *  |   |  27:0 | DATA0 = MBZ                                                  |
+ *  +---+-------+--------------------------------------------------------------+
+ */
+#define GUC_ACTION_HOST2GUC_DEREGISTER_CTB		0x4506
+
+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_LEN		(GUC_HXG_REQUEST_MSG_MIN_LEN + 1u)
+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_MBZ	(0xfffff << 12)
+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE	(0xf << 8)
+#define HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_MBZ2	(0xff << 0)
+
+#define HOST2GUC_DEREGISTER_CTB_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
+#define HOST2GUC_DEREGISTER_CTB_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
+
+/* legacy definitions */
+
 enum intel_guc_action {
 	INTEL_GUC_ACTION_DEFAULT = 0x0,
 	INTEL_GUC_ACTION_REQUEST_PREEMPTION = 0x2,
diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
index 88f1fc2a19e0..6735f1fdaa2a 100644
--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
@@ -110,10 +110,6 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
  * - **flags**, holds various bits to control message handling
  */
 
-/* Type of command transport buffer */
-#define INTEL_GUC_CT_BUFFER_TYPE_SEND	0x0u
-#define INTEL_GUC_CT_BUFFER_TYPE_RECV	0x1u
-
 /*
  * Definition of the command transport message header (DW0)
  *
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
index 3241a477196f..6a29be779cc9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
@@ -103,9 +103,9 @@ void intel_guc_ct_init_early(struct intel_guc_ct *ct)
 static inline const char *guc_ct_buffer_type_to_str(u32 type)
 {
 	switch (type) {
-	case INTEL_GUC_CT_BUFFER_TYPE_SEND:
+	case GUC_CTB_TYPE_HOST2GUC:
 		return "SEND";
-	case INTEL_GUC_CT_BUFFER_TYPE_RECV:
+	case GUC_CTB_TYPE_GUC2HOST:
 		return "RECV";
 	default:
 		return "<invalid>";
@@ -136,25 +136,33 @@ static void guc_ct_buffer_init(struct intel_guc_ct_buffer *ctb,
 	guc_ct_buffer_reset(ctb);
 }
 
-static int guc_action_register_ct_buffer(struct intel_guc *guc,
-					 u32 desc_addr,
-					 u32 type)
+static int guc_action_register_ct_buffer(struct intel_guc *guc, u32 type,
+					 u32 desc_addr, u32 buff_addr, u32 size)
 {
-	u32 action[] = {
-		INTEL_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER,
-		desc_addr,
-		sizeof(struct guc_ct_buffer_desc),
-		type
+	u32 request[HOST2GUC_REGISTER_CTB_REQUEST_MSG_LEN] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_HOST2GUC_REGISTER_CTB),
+		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_SIZE, size / SZ_4K - 1) |
+		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_1_TYPE, type),
+		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_2_DESC_ADDR, desc_addr),
+		FIELD_PREP(HOST2GUC_REGISTER_CTB_REQUEST_MSG_3_BUFF_ADDR, buff_addr),
 	};
 
-	/* Can't use generic send(), CT registration must go over MMIO */
-	return intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
+	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
+	GEM_BUG_ON(size % SZ_4K);
+
+	/* CT registration must go over MMIO */
+	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
 }
 
-static int ct_register_buffer(struct intel_guc_ct *ct, u32 desc_addr, u32 type)
+static int ct_register_buffer(struct intel_guc_ct *ct, u32 type,
+			      u32 desc_addr, u32 buff_addr, u32 size)
 {
-	int err = guc_action_register_ct_buffer(ct_to_guc(ct), desc_addr, type);
+	int err;
 
+	err = guc_action_register_ct_buffer(ct_to_guc(ct), type,
+					    desc_addr, buff_addr, size);
 	if (unlikely(err))
 		CT_ERROR(ct, "Failed to register %s buffer (err=%d)\n",
 			 guc_ct_buffer_type_to_str(type), err);
@@ -163,14 +171,17 @@ static int ct_register_buffer(struct intel_guc_ct *ct, u32 desc_addr, u32 type)
 
 static int guc_action_deregister_ct_buffer(struct intel_guc *guc, u32 type)
 {
-	u32 action[] = {
-		INTEL_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER,
-		CTB_OWNER_HOST,
-		type
+	u32 request[HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_LEN] = {
+		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
+		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
+		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_HOST2GUC_DEREGISTER_CTB),
+		FIELD_PREP(HOST2GUC_DEREGISTER_CTB_REQUEST_MSG_1_TYPE, type),
 	};
 
-	/* Can't use generic send(), CT deregistration must go over MMIO */
-	return intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
+	GEM_BUG_ON(type != GUC_CTB_TYPE_HOST2GUC && type != GUC_CTB_TYPE_GUC2HOST);
+
+	/* CT deregistration must go over MMIO */
+	return intel_guc_send_mmio(guc, request, ARRAY_SIZE(request), NULL, 0);
 }
 
 static int ct_deregister_buffer(struct intel_guc_ct *ct, u32 type)
@@ -258,7 +269,7 @@ void intel_guc_ct_fini(struct intel_guc_ct *ct)
 int intel_guc_ct_enable(struct intel_guc_ct *ct)
 {
 	struct intel_guc *guc = ct_to_guc(ct);
-	u32 base, cmds;
+	u32 base, desc, cmds;
 	void *blob;
 	int err;
 
@@ -274,23 +285,26 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 	GEM_BUG_ON(blob != ct->ctbs.send.desc);
 
 	/* (re)initialize descriptors */
-	cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
 	guc_ct_buffer_reset(&ct->ctbs.send);
-
-	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
 	guc_ct_buffer_reset(&ct->ctbs.recv);
 
 	/*
 	 * Register both CT buffers starting with RECV buffer.
 	 * Descriptors are in first half of the blob.
 	 */
-	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs.recv.desc, blob),
-				 INTEL_GUC_CT_BUFFER_TYPE_RECV);
+	desc = base + ptrdiff(ct->ctbs.recv.desc, blob);
+	cmds = base + ptrdiff(ct->ctbs.recv.cmds, blob);
+	err = ct_register_buffer(ct, GUC_CTB_TYPE_GUC2HOST,
+				 desc, cmds, ct->ctbs.recv.size * 4);
+
 	if (unlikely(err))
 		goto err_out;
 
-	err = ct_register_buffer(ct, base + ptrdiff(ct->ctbs.send.desc, blob),
-				 INTEL_GUC_CT_BUFFER_TYPE_SEND);
+	desc = base + ptrdiff(ct->ctbs.send.desc, blob);
+	cmds = base + ptrdiff(ct->ctbs.send.cmds, blob);
+	err = ct_register_buffer(ct, GUC_CTB_TYPE_HOST2GUC,
+				 desc, cmds, ct->ctbs.send.size * 4);
+
 	if (unlikely(err))
 		goto err_deregister;
 
@@ -299,7 +313,7 @@ int intel_guc_ct_enable(struct intel_guc_ct *ct)
 	return 0;
 
 err_deregister:
-	ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
+	ct_deregister_buffer(ct, GUC_CTB_TYPE_GUC2HOST);
 err_out:
 	CT_PROBE_ERROR(ct, "Failed to enable CTB (%pe)\n", ERR_PTR(err));
 	return err;
@@ -318,8 +332,8 @@ void intel_guc_ct_disable(struct intel_guc_ct *ct)
 	ct->enabled = false;
 
 	if (intel_guc_is_fw_running(guc)) {
-		ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_SEND);
-		ct_deregister_buffer(ct, INTEL_GUC_CT_BUFFER_TYPE_RECV);
+		ct_deregister_buffer(ct, GUC_CTB_TYPE_HOST2GUC);
+		ct_deregister_buffer(ct, GUC_CTB_TYPE_GUC2HOST);
 	}
 }
 
-- 
2.28.0

