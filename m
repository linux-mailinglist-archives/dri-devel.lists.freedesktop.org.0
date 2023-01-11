Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A200E6665B8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 22:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D7F10E0D4;
	Wed, 11 Jan 2023 21:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E6910E0E2;
 Wed, 11 Jan 2023 21:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673473350; x=1705009350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=99LwWWbj9sGrCwj1kyX+9Bhw14fR1D48Erpg2TgfQyc=;
 b=dfXLpdslz6Me28tK+DX91Udoy+IeqLPThuWuR/iOSoe9bNK3M0pwmJzv
 UDc9CdhpXkQSh1NjbJEWhkOVvctYNaCTNpAFuYfSoQK6sSB2Wa4v8Zaf/
 14Ffz54a6uIYUMkZuabt+MaErw2eu4NCGKJILO+2MhkYof+vYIu7FvWWj
 NP+aEm+ZTGDWC8S0T65CN8g1sNq8ogXWYNZGTESoFDNwEsImZGGYuRq7F
 qbj/3FftpDhaMcN5UcVgct9WCMYcmLkhGvPuz7UbLjqO++Y4xHunAeESl
 J+W0hIwO35mBPfBmU8IAmGxkr2FRk52z4yhpXqO4D4RIWl4xJh5fARK6w Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322244742"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="322244742"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 13:42:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607530423"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="607530423"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga003.jf.intel.com with ESMTP; 11 Jan 2023 13:42:28 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/9] drm/i915/pxp: Add GSC-CS back-end resource init and
 cleanup
Date: Wed, 11 Jan 2023 13:42:19 -0800
Message-Id: <20230111214226.907536-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
References: <20230111214226.907536-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MTL, PXP transport back-end uses the GSC engine to submit
HECI packets for PXP arb session management. The command submission
that uses non-priveleged mode requires us to allocate (or free)
a set of execution submission resources (buffer-object, batch-buffer
and context). Thus, do this one time allocation of resources in
GSC-CS init and clean them up in fini.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |   6 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 216 +++++++++++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   5 +
 3 files changed, 225 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index ad67e3f49c20..52b9a61bcdd4 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -10,7 +10,11 @@
 #include "intel_pxp_cmd_interface_cmn.h"
 
 /* PXP-Cmd-Op definitions */
-#define PXP43_CMDID_START_HUC_AUTH 0x0000003A
+#define PXP43_CMDID_START_HUC_AUTH	0x0000003A
+
+/* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
+#define PXP43_MAX_HECI_IN_SIZE		(SZ_32K)
+#define PXP43_MAX_HECI_OUT_SIZE		(SZ_32K)
 
 /* PXP-Input-Packet: HUC-Authentication */
 struct pxp43_start_huc_auth_in {
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index 21400650fc86..97ca187e6fde 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -3,9 +3,41 @@
  * Copyright(c) 2023 Intel Corporation.
  */
 
+#include "gem/i915_gem_internal.h"
+
+#include "gt/intel_context.h"
+
 #include "i915_drv.h"
-#include "intel_pxp_types.h"
+#include "intel_pxp_cmd_interface_43.h"
 #include "intel_pxp_gsccs.h"
+#include "intel_pxp_types.h"
+
+struct gsccs_session_resources {
+	struct mutex cmd_mutex; /* Protects submission for arb session */
+	u64 host_session_handle; /* used by firmware to link commands to sessions */
+
+	struct intel_context *ce; /* context for gsc command submission */
+	struct i915_ppgtt *ppgtt; /* ppgtt for gsc command submission */
+
+	struct drm_i915_gem_object *pkt_obj; /* PXP HECI message packet buffer */
+	struct i915_vma *pkt_vma; /* PXP HECI message packet vma */
+	void *pkt_vaddr;  /* PXP HECI message packet virt memory pointer */
+
+	/* Buffer info for GSC engine batch buffer: */
+	struct drm_i915_gem_object *bb_obj; /* batch buffer object */
+	struct i915_vma *bb_vma; /* batch buffer vma */
+	void *bb_vaddr; /* batch buffer virtual memory pointer */
+};
+
+struct gsccs_teelink_priv {
+	/** @arb_exec_res: resources for arb-session GSC-CS PXP command submission */
+	struct gsccs_session_resources arb_exec_res;
+};
+
+static inline struct gsccs_teelink_priv *pxp_to_gsccs_priv(struct intel_pxp *pxp)
+{
+	return (struct gsccs_teelink_priv *)pxp->gsccs_priv;
+}
 
 int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
 				   int arb_session_id)
@@ -13,11 +45,193 @@ int intel_pxp_gsccs_create_session(struct intel_pxp *pxp,
 	return -ENODEV;
 }
 
+static void
+gsccs_destroy_buffer(struct drm_i915_private *i915, struct i915_vma *vma,
+		     struct drm_i915_gem_object *obj)
+{
+	int err;
+
+	i915_vma_unpin(vma);
+	err = i915_vma_unbind(vma);
+	if (err)
+		drm_dbg(&i915->drm, "Unexpected failure when vma-unbinding = %d\n", err);
+
+	i915_gem_object_unpin_map(obj);
+	i915_gem_object_unpin_pages(obj);
+	i915_gem_object_put(obj);
+}
+
+static int
+gsccs_create_buffer(struct drm_i915_private *i915, const char *bufname,
+		    size_t size, struct i915_ppgtt *ppgtt,
+		    struct drm_i915_gem_object **obj,
+		    struct i915_vma **vma, void **map)
+{
+	int err = 0;
+
+	*obj = i915_gem_object_create_internal(i915, size);
+	if (IS_ERR(*obj)) {
+		drm_err(&i915->drm, "Failed to allocate gsccs backend %s.\n", bufname);
+		err = PTR_ERR(*obj);
+		goto out_none;
+	}
+
+	*vma = i915_vma_instance(*obj, &ppgtt->vm, NULL);
+	if (IS_ERR(*vma)) {
+		drm_err(&i915->drm, "Failed to vma-instance gsccs backend %s.\n", bufname);
+		err = PTR_ERR(*vma);
+		goto out_put;
+	}
+
+	err = i915_gem_object_pin_pages_unlocked(*obj);
+	if (err) {
+		drm_err(&i915->drm, "Failed to pin gsccs backend %s.\n", bufname);
+		goto out_put;
+	}
+
+	/* map to the virtual memory pointer */
+	*map = i915_gem_object_pin_map_unlocked(*obj, i915_coherent_map_type(i915, *obj, true));
+	if (IS_ERR(*map)) {
+		drm_err(&i915->drm, "Failed to map gsccs backend %s.\n", bufname);
+		err = PTR_ERR(*map);
+		goto out_unpin;
+	}
+
+	/* all PXP sessions commands are treated as non-priveleged */
+	err = i915_vma_pin(*vma, 0, 0, PIN_USER);
+	if (err) {
+		drm_err(&i915->drm, "Failed to vma-pin gsccs backend %s.\n", bufname);
+		goto out_unmap;
+	}
+
+	return 0;
+
+out_unmap:
+	i915_gem_object_unpin_map(*obj);
+out_unpin:
+	i915_gem_object_unpin_pages(*obj);
+out_put:
+	i915_gem_object_put(*obj);
+out_none:
+	*obj = NULL;
+	*vma = NULL;
+	*map = NULL;
+
+	return err;
+}
+
+static void
+gsccs_destroy_execution_resource(struct intel_pxp *pxp,
+				 struct gsccs_session_resources *strm_res)
+{
+	if (strm_res->ce)
+		intel_context_put(strm_res->ce);
+	if (strm_res->bb_obj)
+		gsccs_destroy_buffer(pxp->ctrl_gt->i915, strm_res->bb_vma, strm_res->bb_obj);
+	if (strm_res->pkt_obj)
+		gsccs_destroy_buffer(pxp->ctrl_gt->i915, strm_res->pkt_vma, strm_res->pkt_obj);
+	if (strm_res->ppgtt)
+		i915_vm_put(&strm_res->ppgtt->vm);
+
+	memset(strm_res, 0, sizeof(*strm_res));
+}
+
+static int
+gsccs_allocate_execution_resource(struct intel_pxp *pxp,
+				  struct gsccs_session_resources *strm_res)
+{
+	struct intel_gt *gt = pxp->ctrl_gt;
+	struct intel_engine_cs *engine = gt->engine[GSC0];
+	struct i915_ppgtt *ppgtt;
+	struct intel_context *ce;
+	int err = 0;
+
+	/*
+	 * First, ensure the GSC engine is present.
+	 * NOTE: Backend should would only be called with the correct gt.
+	 */
+	if (!engine)
+		return -ENODEV;
+
+	mutex_init(&strm_res->cmd_mutex);
+
+	ppgtt = i915_ppgtt_create(gt, 0);
+	if (IS_ERR(ppgtt))
+		return PTR_ERR(ppgtt);
+
+	strm_res->ppgtt = ppgtt;
+
+	/*
+	 * Now, allocate, pin and map two objects, one for the heci message packet
+	 * and another for the batch buffer we submit into GSC engine (that includes the packet).
+	 * NOTE: GSC-CS backend is currently only supported on MTL, so we allocate shmem.
+	 */
+	err = gsccs_create_buffer(pxp->ctrl_gt->i915, "Heci Packet",
+				  PXP43_MAX_HECI_IN_SIZE + PXP43_MAX_HECI_OUT_SIZE,
+				  strm_res->ppgtt,
+				  &strm_res->pkt_obj, &strm_res->pkt_vma,
+				  &strm_res->pkt_vaddr);
+	if (err) {
+		gsccs_destroy_execution_resource(pxp, strm_res);
+		return err;
+	}
+
+	err = gsccs_create_buffer(pxp->ctrl_gt->i915, "Batch Buffer",
+				  PAGE_SIZE, strm_res->ppgtt,
+				  &strm_res->bb_obj, &strm_res->bb_vma,
+				  &strm_res->bb_vaddr);
+	if (err) {
+		gsccs_destroy_execution_resource(pxp, strm_res);
+		return err;
+	}
+	/*
+	 * TODO: Consider optimization of pre-populating batch buffer
+	 * with the send-HECI instruction now at init and reuse through its life.
+	 */
+
+	/* Finally, create an intel_context to be used during the submission */
+	ce = intel_context_create(engine);
+	if (IS_ERR(ce)) {
+		drm_err(&gt->i915->drm, "Failed creating gsccs backend ctx\n");
+		gsccs_destroy_execution_resource(pxp, strm_res);
+		return PTR_ERR(ce);
+	}
+	i915_vm_put(ce->vm);
+	ce->vm = i915_vm_get(&ppgtt->vm);
+
+	strm_res->ce = ce;
+
+	return 0;
+}
+
 void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
 {
+	struct gsccs_teelink_priv *gsccs = pxp_to_gsccs_priv(pxp);
+
+	if (!gsccs)
+		return;
+
+	gsccs_destroy_execution_resource(pxp, &gsccs->arb_exec_res);
+	kfree(gsccs);
+	pxp->gsccs_priv = NULL;
 }
 
 int intel_pxp_gsccs_init(struct intel_pxp *pxp)
 {
+	struct gsccs_teelink_priv *gsccs;
+	int ret;
+
+	gsccs = kzalloc(sizeof(*gsccs), GFP_KERNEL);
+	if (!gsccs)
+		return -ENOMEM;
+
+	ret = gsccs_allocate_execution_resource(pxp, &gsccs->arb_exec_res);
+	if (ret) {
+		kfree(gsccs);
+		return ret;
+	}
+
+	pxp->gsccs_priv = gsccs;
+
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 43aa61c26de5..fdcb9a66f691 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -32,6 +32,11 @@ struct intel_pxp {
 	 */
 	bool uses_gsccs;
 
+	/**
+	 * @gsccs_priv: GSC-CS based tee-link private context.
+	 */
+	void *gsccs_priv;
+
 	/**
 	 * @pxp_component: i915_pxp_component struct of the bound mei_pxp
 	 * module. Only set and cleared inside component bind/unbind functions,
-- 
2.39.0

