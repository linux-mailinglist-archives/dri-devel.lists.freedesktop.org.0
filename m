Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5AB59A8EA
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 00:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A498610EEA5;
	Fri, 19 Aug 2022 22:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649CF10E54E;
 Fri, 19 Aug 2022 22:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660949640; x=1692485640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IT8TIbrmhx/FAf+6Oz3QnK3gGxovWYC/sPSA267QNRY=;
 b=IitbKmxc43biHHammYl0dIQs1AhRt9kRQh7F9AF+1Rq+xFPWYgi6MHjY
 0GXZJ5/0pchMEL7CG9l3cL9gemmsOXA+V/mHFwoBrDbXL8BbwtM/W2HnT
 A+ecaY/LLKlOiLmqOyfWFgTKa7c8LHSb/ne0SzLiBzSO4YEIi+Rbui5nQ
 o/e2tRIvsha7JB/EEr3CXaz/E43hJxa74/IQZFlWPlwMrm5zPswMgCTty
 UE43FY7avn+/TAv0Xi4MwmyVEa59eDtPeI/pHxW3EwMcir1mLJUxSXtqt
 yb2SDQ6lY8r2R0MxWWtZQLgF1MwdCaToZn1rac6NhsLCRpxCiBi4zmenr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="273513240"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="273513240"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 15:54:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="936378496"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 15:54:00 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 08/15] drm/i915/pxp: implement function for sending tee
 stream command
Date: Fri, 19 Aug 2022 15:53:28 -0700
Message-Id: <20220819225335.3947346-9-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
References: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomas Winkler <tomas.winkler@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vitaly Lubart <vitaly.lubart@intel.com>

Command to be sent via the stream interface are written to a local
memory page, whose address is then provided to the GSC.
The interface supports providing a full sg with multiple pages for both
input and output messages, but since for now we only aim to support short
and synchronous messages we can use a single page for both input and
output.

Note that the mei interface expects an sg of 4k pages, while our lmem pages
are 64k. If we ever need to support more than 4k we'll need to convert.
Added a TODO comment to the code to record this.

Signed-off-by: Vitaly Lubart <vitaly.lubart@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c   | 114 ++++++++++++++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h   |   5 +
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h |   6 ++
 3 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index 2c1fc49ecec1..e0d09455a92e 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -7,6 +7,7 @@
 
 #include <drm/i915_pxp_tee_interface.h>
 #include <drm/i915_component.h>
+#include "gem/i915_gem_region.h"
 
 #include "i915_drv.h"
 #include "intel_pxp.h"
@@ -69,6 +70,47 @@ static int intel_pxp_tee_io_message(struct intel_pxp *pxp,
 	return ret;
 }
 
+int intel_pxp_tee_stream_message(struct intel_pxp *pxp,
+				 u8 client_id, u32 fence_id,
+				 void *msg_in, size_t msg_in_len,
+				 void *msg_out, size_t msg_out_len)
+{
+	/* TODO: for bigger objects we need to use a sg of 4k pages */
+	const size_t max_msg_size = PAGE_SIZE;
+	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
+	struct i915_pxp_component *pxp_component = pxp->pxp_component;
+	unsigned int offset = 0;
+	struct scatterlist *sg;
+	int ret;
+
+	if (msg_in_len > max_msg_size || msg_out_len > max_msg_size)
+		return -ENOSPC;
+
+	mutex_lock(&pxp->tee_mutex);
+
+	if (unlikely(!pxp_component || !pxp_component->ops->gsc_command)) {
+		ret = -ENODEV;
+		goto unlock;
+	}
+
+	GEM_BUG_ON(!pxp->stream_cmd.obj);
+
+	sg = i915_gem_object_get_sg_dma(pxp->stream_cmd.obj, 0, &offset);
+
+	memcpy(pxp->stream_cmd.vaddr, msg_in, msg_in_len);
+
+	ret = pxp_component->ops->gsc_command(pxp_component->tee_dev, client_id,
+					      fence_id, sg, msg_in_len, sg);
+	if (ret < 0)
+		drm_err(&i915->drm, "Failed to send PXP TEE gsc command\n");
+	else
+		memcpy(msg_out, pxp->stream_cmd.vaddr, msg_out_len);
+
+unlock:
+	mutex_unlock(&pxp->tee_mutex);
+	return ret;
+}
+
 /**
  * i915_pxp_tee_component_bind - bind function to pass the function pointers to pxp_tee
  * @i915_kdev: pointer to i915 kernel device
@@ -126,6 +168,66 @@ static const struct component_ops i915_pxp_tee_component_ops = {
 	.unbind = i915_pxp_tee_component_unbind,
 };
 
+static int alloc_streaming_command(struct intel_pxp *pxp)
+{
+	struct drm_i915_private *i915 = pxp_to_gt(pxp)->i915;
+	struct drm_i915_gem_object *obj = NULL;
+	void *cmd;
+	int err;
+
+	pxp->stream_cmd.obj = NULL;
+	pxp->stream_cmd.vaddr = NULL;
+
+	if (!IS_DGFX(i915))
+		return 0;
+
+	/* allocate lmem object of one page for PXP command memory and store it */
+	obj = i915_gem_object_create_lmem(i915, PAGE_SIZE, I915_BO_ALLOC_CONTIGUOUS);
+	if (IS_ERR(obj)) {
+		drm_err(&i915->drm, "Failed to allocate pxp streaming command!\n");
+		return PTR_ERR(obj);
+	}
+
+	err = i915_gem_object_pin_pages_unlocked(obj);
+	if (err) {
+		drm_err(&i915->drm, "Failed to pin gsc message page!\n");
+		goto out_put;
+	}
+
+	/* map the lmem into the virtual memory pointer */
+	cmd = i915_gem_object_pin_map_unlocked(obj, i915_coherent_map_type(i915, obj, true));
+	if (IS_ERR(cmd)) {
+		drm_err(&i915->drm, "Failed to map gsc message page!\n");
+		err = PTR_ERR(cmd);
+		goto out_unpin;
+	}
+
+	memset(cmd, 0, obj->base.size);
+
+	pxp->stream_cmd.obj = obj;
+	pxp->stream_cmd.vaddr = cmd;
+
+	return 0;
+
+out_unpin:
+	i915_gem_object_unpin_pages(obj);
+out_put:
+	i915_gem_object_put(obj);
+	return err;
+}
+
+static void free_streaming_command(struct intel_pxp *pxp)
+{
+	struct drm_i915_gem_object *obj = fetch_and_zero(&pxp->stream_cmd.obj);
+
+	if (!obj)
+		return;
+
+	i915_gem_object_unpin_map(obj);
+	i915_gem_object_unpin_pages(obj);
+	i915_gem_object_put(obj);
+}
+
 int intel_pxp_tee_component_init(struct intel_pxp *pxp)
 {
 	int ret;
@@ -134,16 +236,24 @@ int intel_pxp_tee_component_init(struct intel_pxp *pxp)
 
 	mutex_init(&pxp->tee_mutex);
 
+	ret = alloc_streaming_command(pxp);
+	if (ret)
+		return ret;
+
 	ret = component_add_typed(i915->drm.dev, &i915_pxp_tee_component_ops,
 				  I915_COMPONENT_PXP);
 	if (ret < 0) {
 		drm_err(&i915->drm, "Failed to add PXP component (%d)\n", ret);
-		return ret;
+		goto out_free;
 	}
 
 	pxp->pxp_component_added = true;
 
 	return 0;
+
+out_free:
+	free_streaming_command(pxp);
+	return ret;
 }
 
 void intel_pxp_tee_component_fini(struct intel_pxp *pxp)
@@ -155,6 +265,8 @@ void intel_pxp_tee_component_fini(struct intel_pxp *pxp)
 
 	component_del(i915->drm.dev, &i915_pxp_tee_component_ops);
 	pxp->pxp_component_added = false;
+
+	free_streaming_command(pxp);
 }
 
 int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
index c136053ce340..aeb3dfe7ce96 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.h
@@ -14,4 +14,9 @@ void intel_pxp_tee_component_fini(struct intel_pxp *pxp);
 int intel_pxp_tee_cmd_create_arb_session(struct intel_pxp *pxp,
 					 int arb_session_id);
 
+int intel_pxp_tee_stream_message(struct intel_pxp *pxp,
+				 u8 client_id, u32 fence_id,
+				 void *msg_in, size_t msg_in_len,
+				 void *msg_out, size_t msg_out_len);
+
 #endif /* __INTEL_PXP_TEE_H__ */
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
index 7ce5f37ee12e..f74b1e11a505 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_types.h
@@ -53,6 +53,12 @@ struct intel_pxp {
 	/** @tee_mutex: protects the tee channel binding and messaging. */
 	struct mutex tee_mutex;
 
+	/** @stream_cmd: LMEM obj used to send stream PXP commands to the GSC */
+	struct {
+		struct drm_i915_gem_object *obj; /* contains PXP command memory */
+		void *vaddr; /* virtual memory for PXP command */
+	} stream_cmd;
+
 	/**
 	 * @hw_state_invalidated: if the HW perceives an attack on the integrity
 	 * of the encryption it will invalidate the keys and expect SW to
-- 
2.37.2

