Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA73CB15C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 06:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD966E8F4;
	Fri, 16 Jul 2021 04:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33CB6E8F2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 04:12:12 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="271783381"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="271783381"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; d="scan'208";a="495788600"
Received: from dceraolo-linux.fm.intel.com ([10.1.27.145])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 21:12:12 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/15] drm/i915/pxp: Create the arbitrary session after boot
Date: Thu, 15 Jul 2021 21:10:26 -0700
Message-Id: <20210716041034.382-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
References: <20210716041034.382-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	"Huang,  Sean Z" <sean.z.huang@intel.com>, Huang@freedesktop.org,
	Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Huang, Sean Z" <sean.z.huang@intel.com>

Create the arbitrary session, with the fixed session id 0xf, after
system boot, for the case that application allocates the protected
buffer without establishing any protection session. Because the
hardware requires at least one alive session for protected buffer
creation. This arbitrary session will need to be re-created after
teardown or power event because hardware encryption key won't be
valid after such cases.

The session ID is exposed as part of the uapi so it can be used as part
of userspace commands.

v2: use gt->uncore->rpm (Chris)
v3: s/arb_is_in_play/arb_is_valid (Chris), move set-up to the new
    init_hw function
v4: move interface defs to separate header, set arb_is valid to false
    on fini (Rodrigo)
v5: handle async component binding

Signed-off-by: Huang, Sean Z <sean.z.huang@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v4
---
 drivers/gpu/drm/i915/Makefile                 |  1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  7 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |  5 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  | 74 ++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h  | 15 ++++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 87 +++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h      |  3 +
 .../drm/i915/pxp/intel_pxp_tee_interface.h    | 37 ++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    | 12 +++
 include/uapi/drm/i915_drm.h                   |  3 +
 10 files changed, 244 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_session.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_session.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 05eb6b7753cc..946b56cff9cf 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -278,6 +278,7 @@ i915-y += i915_perf.o
 # Protected execution platform (PXP) support
 i915-$(CONFIG_DRM_I915_PXP) += \
 	pxp/intel_pxp.o \
+	pxp/intel_pxp_session.o \
 	pxp/intel_pxp_tee.o
 
 # Post-mortem debug and GPU hang state capture
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 66a98feb33ab..e1370f323126 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -3,6 +3,7 @@
  * Copyright(c) 2020 Intel Corporation.
  */
 #include "intel_pxp.h"
+#include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
 #include "gt/intel_context.h"
 #include "i915_drv.h"
@@ -65,6 +66,8 @@ void intel_pxp_init(struct intel_pxp *pxp)
 	if (!HAS_PXP(gt->i915))
 		return;
 
+	mutex_init(&pxp->tee_mutex);
+
 	ret = create_vcs_context(pxp);
 	if (ret)
 		return;
@@ -86,6 +89,8 @@ void intel_pxp_fini(struct intel_pxp *pxp)
 	if (!intel_pxp_is_enabled(pxp))
 		return;
 
+	pxp->arb_is_valid = false;
+
 	intel_pxp_tee_component_fini(pxp);
 
 	destroy_vcs_context(pxp);
@@ -94,6 +99,8 @@ void intel_pxp_fini(struct intel_pxp *pxp)
 void intel_pxp_init_hw(struct intel_pxp *pxp)
 {
 	kcr_pxp_enable(pxp_to_gt(pxp));
+
+	intel_pxp_create_arb_session(pxp);
 }
 
 void intel_pxp_fini_hw(struct intel_pxp *pxp)
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.h b/drivers/gpu/drm/i915/pxp/intel_pxp.h
index 5427c3b28aa9..8eeb65af78b1 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.h
@@ -19,6 +19,11 @@ static inline bool intel_pxp_is_enabled(const struct intel_pxp *pxp)
 	return pxp->ce;
 }
 
+static inline bool intel_pxp_is_active(const struct intel_pxp *pxp)
+{
+	return pxp->arb_is_valid;
+}
+
 #ifdef CONFIG_DRM_I915_PXP
 void intel_pxp_init(struct intel_pxp *pxp);
 void intel_pxp_fini(struct intel_pxp *pxp);
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
new file mode 100644
index 000000000000..3331868f354c
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#include "drm/i915_drm.h"
+#include "i915_drv.h"
+
+#include "intel_pxp.h"
+#include "intel_pxp_session.h"
+#include "intel_pxp_tee.h"
+#include "intel_pxp_types.h"
+
+#define ARB_SESSION I915_PROTECTED_CONTENT_DEFAULT_SESSION /* shorter define */
+
+#define GEN12_KCR_SIP _MMIO(0x32260) /* KCR hwdrm session in play 0-31 */
+
+static bool intel_pxp_session_is_in_play(struct intel_pxp *pxp, u32 id)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+	intel_wakeref_t wakeref;
+	u32 sip = 0;
+
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		sip = intel_uncore_read(gt->uncore, GEN12_KCR_SIP);
+
+	return sip & BIT(id);
+}
+
+static int pxp_wait_for_session_state(struct intel_pxp *pxp, u32 id, bool in_play)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+	intel_wakeref_t wakeref;
+	u32 mask = BIT(id);
+	int ret;
+
+	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
+		ret = intel_wait_for_register(gt->uncore,
+					      GEN12_KCR_SIP,
+					      mask,
+					      in_play ? mask : 0,
+					      100);
+
+	return ret;
+}
+
+int intel_pxp_create_arb_session(struct intel_pxp *pxp)
+{
+	struct intel_gt *gt = pxp_to_gt(pxp);
+	int ret;
+
+	pxp->arb_is_valid = false;
+
+	if (intel_pxp_session_is_in_play(pxp, ARB_SESSION)) {
+		drm_err(&gt->i915->drm, "arb session already in play at creation time\n");
+		return -EEXIST;
+	}
+
+	ret = intel_pxp_tee_cmd_create_arb_session(pxp, ARB_SESSION);
+	if (ret) {
+		drm_err(&gt->i915->drm, "tee cmd for arb session creation failed\n");
+		return ret;
+	}
+
+	ret = pxp_wait_for_session_state(pxp, ARB_SESSION, true);
+	if (ret) {
+		drm_err(&gt->i915->drm, "arb session failed to go in play\n");
+		return ret;
+	}
+
+	pxp->arb_is_valid = true;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.h b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
new file mode 100644
index 000000000000..316c3bebed9c
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_SESSION_H__
+#define __INTEL_PXP_SESSION_H__
+
+#include <linux/types.h>
+
+struct intel_pxp;
+
+int intel_pxp_create_arb_session(struct intel_pxp *pxp);
+
+#endif /* __INTEL_PXP_SESSION_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 33130fb7113b..3662bf67407a 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -8,13 +8,63 @@
 #include "drm/i915_component.h"
 #include "i915_drv.h"
 #include "intel_pxp.h"
+#include "intel_pxp_session.h"
 #include "intel_pxp_tee.h"
+#include "intel_pxp_tee_interface.h"
 
 static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
 {
 	return &kdev_to_i915(i915_kdev)->gt.pxp;
 }
 
+static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
+				    void *msg_in, u32 msg_in_size,
+				    void *msg_out, u32 msg_out_max_size,
+				    u32 *msg_out_rcv_size)
+{
+	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
+	struct i915_pxp_component *pxp_component = pxp->pxp_component;
+	int ret = 0;
+
+	mutex_lock(&pxp->tee_mutex);
+
+	/*
+	 * The binding of the component is asynchronous from i915 probe, so we
+	 * can't be sure it has happened.
+	 */
+	if (!pxp_component) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
+	ret = pxp_component->ops->send(pxp_component->tee_dev, msg_in, msg_in_size);
+	if (ret) {
+		drm_err(&i915->drm, "Failed to send PXP TEE message\n");
+		goto unlock;
+	}
+
+	ret = pxp_component->ops->recv(pxp_component->tee_dev, msg_out, msg_out_max_size);
+	if (ret < 0) {
+		drm_err(&i915->drm, "Failed to receive PXP TEE message\n");
+		goto unlock;
+	}
+
+	if (ret > msg_out_max_size) {
+		drm_err(&i915->drm,
+			"Failed to receive PXP TEE message due to unexpected output size\n");
+		ret = -ENOSPC;
+		goto unlock;
+	}
+
+	if (msg_out_rcv_size)
+		*msg_out_rcv_size = ret;
+
+	ret = 0;
+unlock:
+	mutex_unlock(&pxp->tee_mutex);
+	return ret;
+}
+
 /**
  * i915_pxp_tee_component_bind - bind function to pass the function pointers to pxp_tee
  * @i915_kdev: pointer to i915 kernel device
@@ -28,14 +78,24 @@ static inline struct intel_pxp *i915_dev_to_pxp(struct device *i915_kdev)
 static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 				       struct device *tee_kdev, void *data)
 {
+	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
 	struct intel_pxp *pxp = i915_dev_to_pxp(i915_kdev);
 
+	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = data;
 	pxp->pxp_component->tee_dev = tee_kdev;
+	mutex_unlock(&pxp->tee_mutex);
 
 	/* the component is required to fully start the PXP HW */
 	intel_pxp_init_hw(pxp);
 
+	if (!pxp->arb_is_valid) {
+		drm_err(&i915->drm, "Failed to create arb session during bind\n");
+		intel_pxp_fini_hw(pxp);
+		pxp->pxp_component = NULL;
+		return -EIO;
+	}
+
 	return 0;
 }
 
@@ -46,7 +106,9 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
 
 	intel_pxp_fini_hw(pxp);
 
+	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = NULL;
+	mutex_unlock(&pxp->tee_mutex);
 }
 
 static const struct component_ops i915_pxp_tee_component_ops = {
@@ -80,3 +142,28 @@ void intel_pxp_tee_component_fini(struct intel_pxp *pxp)
 
 	component_del(i915->drm.dev, &i915_pxp_tee_component_ops);
 }
+
+int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
+					 int arb_session_id)
+{
+	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
+	struct pxp_tee_create_arb_in msg_in = {0};
+	struct pxp_tee_create_arb_out msg_out = {0};
+	int ret;
+
+	msg_in.header.api_version = PXP_TEE_APIVER;
+	msg_in.header.command_id = PXP_TEE_ARB_CMDID;
+	msg_in.header.buffer_len = sizeof(msg_in) - sizeof(msg_in.header);
+	msg_in.protection_mode = PXP_TEE_ARB_PROTECTION_MODE;
+	msg_in.session_id = arb_session_id;
+
+	ret = intel_pxp_tee_io_message(pxp,
+				       &msg_in, sizeof(msg_in),
+				       &msg_out, sizeof(msg_out),
+				       NULL);
+
+	if (ret)
+		drm_err(&i915->drm, "Failed to send tee msg ret=[%d]\n", ret);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
index 23d050a5d3e7..c136053ce340 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
@@ -11,4 +11,7 @@
 int intel_pxp_tee_component_init(struct intel_pxp *pxp);
 void intel_pxp_tee_component_fini(struct intel_pxp *pxp);
 
+int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
+					 int arb_session_id);
+
 #endif /* __INTEL_PXP_TEE_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h b/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
new file mode 100644
index 000000000000..1af6c0061e11
--- /dev/null
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee_interface.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright(c) 2020, Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INTEL_PXP_TEE_INTERFACE_H__
+#define __INTEL_PXP_TEE_INTERFACE_H__
+
+#include <linux/types.h>
+
+#define PXP_TEE_APIVER 0x40002
+#define PXP_TEE_ARB_CMDID 0x1e
+#define PXP_TEE_ARB_PROTECTION_MODE 0x2
+
+/* PXP TEE message header */
+struct pxp_tee_cmd_header {
+	u32 api_version;
+	u32 command_id;
+	u32 status;
+	/* Length of the message (excluding the header) */
+	u32 buffer_len;
+} __packed;
+
+/* PXP TEE message input to create a arbitrary session */
+struct pxp_tee_create_arb_in {
+	struct pxp_tee_cmd_header header;
+	u32 protection_mode;
+	u32 session_id;
+} __packed;
+
+/* PXP TEE message output to create a arbitrary session */
+struct pxp_tee_create_arb_out {
+	struct pxp_tee_cmd_header header;
+} __packed;
+
+
+#endif /* __INTEL_PXP_TEE_INTERFACE_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 3e95d21513e8..a4797a98c1f9 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -6,6 +6,9 @@
 #ifndef __INTEL_PXP_TYPES_H__
 #define __INTEL_PXP_TYPES_H__
 
+#include <linux/mutex.h>
+#include <linux/types.h>
+
 struct intel_context;
 struct i915_pxp_component;
 
@@ -13,6 +16,15 @@ struct intel_pxp {
 	struct i915_pxp_component *pxp_component;
 
 	struct intel_context *ce;
+
+	/*
+	 * After a teardown, the arb session can still be in play on the HW
+	 * even if the keys are gone, so we can't rely on the HW state of the
+	 * session to know if it's valid and need to track the status in SW.
+	 */
+	bool arb_is_valid;
+
+	struct mutex tee_mutex; /* protects the tee channel binding */
 };
 
 #endif /* __INTEL_PXP_TYPES_H__ */
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index e54f9efaead0..5296e4f77e0a 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -2898,6 +2898,9 @@ struct drm_i915_gem_create_ext_memory_regions {
 	__u64 regions;
 };
 
+/* ID of the protected content session managed by i915 when PXP is active */
+#define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.32.0

