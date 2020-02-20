Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883251663E4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 18:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2C76EDF8;
	Thu, 20 Feb 2020 17:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D496EDF8;
 Thu, 20 Feb 2020 17:06:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 09:06:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,465,1574150400"; d="scan'208";a="349202600"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2020 09:06:26 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [Intel-gfx] [PATCH v7 7/8] drm/i915/gvt: Make WARN* drm specific
 where drm_priv ptr is available
Date: Thu, 20 Feb 2020 22:25:06 +0530
Message-Id: <20200220165507.16823-8-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200220165507.16823-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200220165507.16823-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_i915_private struct pointer is
readily available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule2@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/gvt/aperture_gm.c  | 6 +++---
 drivers/gpu/drm/i915/gvt/cmd_parser.c   | 4 ++--
 drivers/gpu/drm/i915/gvt/display.c      | 3 ++-
 drivers/gpu/drm/i915/gvt/dmabuf.c       | 4 ++--
 drivers/gpu/drm/i915/gvt/edid.c         | 2 +-
 drivers/gpu/drm/i915/gvt/gvt.c          | 4 ++--
 drivers/gpu/drm/i915/gvt/handlers.c     | 2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c | 2 +-
 8 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 771420453f82..29eed8400647 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -134,11 +134,11 @@ void intel_vgpu_write_fence(struct intel_vgpu *vgpu,
 
 	assert_rpm_wakelock_held(&dev_priv->runtime_pm);
 
-	if (WARN_ON(fence >= vgpu_fence_sz(vgpu)))
+	if (drm_WARN_ON(&dev_priv->drm, fence >= vgpu_fence_sz(vgpu)))
 		return;
 
 	reg = vgpu->fence.regs[fence];
-	if (WARN_ON(!reg))
+	if (drm_WARN_ON(&dev_priv->drm, !reg))
 		return;
 
 	fence_reg_lo = FENCE_REG_GEN6_LO(reg->id);
@@ -167,7 +167,7 @@ static void free_vgpu_fence(struct intel_vgpu *vgpu)
 	struct i915_fence_reg *reg;
 	u32 i;
 
-	if (WARN_ON(!vgpu_fence_sz(vgpu)))
+	if (drm_WARN_ON(&dev_priv->drm, !vgpu_fence_sz(vgpu)))
 		return;
 
 	intel_runtime_pm_get(&dev_priv->runtime_pm);
diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index 21a176cd8acc..73a2891114a4 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -1230,7 +1230,7 @@ static int gen8_decode_mi_display_flip(struct parser_exec_state *s,
 	dword2 = cmd_val(s, 2);
 
 	v = (dword0 & GENMASK(21, 19)) >> 19;
-	if (WARN_ON(v >= ARRAY_SIZE(gen8_plane_code)))
+	if (drm_WARN_ON(&dev_priv->drm, v >= ARRAY_SIZE(gen8_plane_code)))
 		return -EBADRQC;
 
 	info->pipe = gen8_plane_code[v].pipe;
@@ -1250,7 +1250,7 @@ static int gen8_decode_mi_display_flip(struct parser_exec_state *s,
 		info->stride_reg = SPRSTRIDE(info->pipe);
 		info->surf_reg = SPRSURF(info->pipe);
 	} else {
-		WARN_ON(1);
+		drm_WARN_ON(&dev_priv->drm, 1);
 		return -EBADRQC;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index e1c313da6c00..9a9329fb8d64 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -71,7 +71,8 @@ int pipe_is_enabled(struct intel_vgpu *vgpu, int pipe)
 {
 	struct drm_i915_private *dev_priv = vgpu->gvt->dev_priv;
 
-	if (WARN_ON(pipe < PIPE_A || pipe >= I915_MAX_PIPES))
+	if (drm_WARN_ON(&dev_priv->drm,
+			pipe < PIPE_A || pipe >= I915_MAX_PIPES))
 		return -EINVAL;
 
 	if (vgpu_vreg_t(vgpu, PIPECONF(pipe)) & PIPECONF_ENABLE)
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 2477a1e5a166..b854bd243e11 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -67,11 +67,11 @@ static int vgpu_gem_get_pages(
 	u32 page_num;
 
 	fb_info = (struct intel_vgpu_fb_info *)obj->gvt_info;
-	if (WARN_ON(!fb_info))
+	if (drm_WARN_ON(&dev_priv->drm, !fb_info))
 		return -ENODEV;
 
 	vgpu = fb_info->obj->vgpu;
-	if (WARN_ON(!vgpu))
+	if (drm_WARN_ON(&dev_priv->drm, !vgpu))
 		return -ENODEV;
 
 	st = kmalloc(sizeof(*st), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index 1fe6124918f1..97bf75890c7d 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -153,7 +153,7 @@ static int gmbus0_mmio_write(struct intel_vgpu *vgpu,
 		port = cnp_get_port_from_gmbus0(pin_select);
 	else
 		port = get_port_from_gmbus0(pin_select);
-	if (WARN_ON(port < 0))
+	if (drm_WARN_ON(&dev_priv->drm, port < 0))
 		return 0;
 
 	vgpu->display.i2c_edid.state = I2C_GMBUS;
diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
index 8f37eefa0a02..d51684627f3d 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.c
+++ b/drivers/gpu/drm/i915/gvt/gvt.c
@@ -267,7 +267,7 @@ void intel_gvt_clean_device(struct drm_i915_private *dev_priv)
 {
 	struct intel_gvt *gvt = to_gvt(dev_priv);
 
-	if (WARN_ON(!gvt))
+	if (drm_WARN_ON(&dev_priv->drm, !gvt))
 		return;
 
 	intel_gvt_destroy_idle_vgpu(gvt->idle_vgpu);
@@ -306,7 +306,7 @@ int intel_gvt_init_device(struct drm_i915_private *dev_priv)
 	struct intel_vgpu *vgpu;
 	int ret;
 
-	if (WARN_ON(dev_priv->gvt))
+	if (drm_WARN_ON(&dev_priv->drm, dev_priv->gvt))
 		return -EEXIST;
 
 	gvt = kzalloc(sizeof(struct intel_gvt), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index ae6700dc9d73..288572e27473 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -836,7 +836,7 @@ static int trigger_aux_channel_interrupt(struct intel_vgpu *vgpu,
 		 reg == i915_mmio_reg_offset(DP_AUX_CH_CTL(AUX_CH_D)))
 		event = AUX_CHANNEL_D;
 	else {
-		WARN_ON(true);
+		drm_WARN_ON(&dev_priv->drm, true);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index aaf15916d29a..a4a1de347af0 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -357,7 +357,7 @@ static void handle_tlb_pending_event(struct intel_vgpu *vgpu, int ring_id)
 	if (!regs)
 		return;
 
-	if (WARN_ON(ring_id >= cnt))
+	if (drm_WARN_ON(&dev_priv->drm, ring_id >= cnt))
 		return;
 
 	if (!test_and_clear_bit(ring_id, (void *)s->tlb_handle_pending))
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
