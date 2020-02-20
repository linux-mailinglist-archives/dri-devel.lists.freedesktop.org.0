Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E5B1663E5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 18:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC066EDFC;
	Thu, 20 Feb 2020 17:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C226EDFC;
 Thu, 20 Feb 2020 17:06:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 09:06:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,465,1574150400"; d="scan'208";a="349202616"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2020 09:06:30 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>
Subject: [Intel-gfx] [PATCH v7 8/8] drm/i915/gvt: Make WARN* drm specific
 where vgpu ptr is available
Date: Thu, 20 Feb 2020 22:25:07 +0530
Message-Id: <20200220165507.16823-9-pankaj.laxminarayan.bharadiya@intel.com>
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

Drm specific drm_WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_device struct pointer is readily
available.

The conversion was done automatically with below coccinelle semantic
patch. checkpatch errors/warnings are fixed manually.

@@
identifier func, T;
@@
func(struct intel_vgpu *T,...) {
+struct drm_i915_private *i915 = T->gvt->dev_priv;
<+...
(
-WARN(
+drm_WARN(&i915->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&i915->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&i915->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&i915->drm,
...)
)
...+>

}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/gvt/cfg_space.c    | 23 +++++++++++--------
 drivers/gpu/drm/i915/gvt/display.c      |  3 ++-
 drivers/gpu/drm/i915/gvt/edid.c         | 17 +++++++++-----
 drivers/gpu/drm/i915/gvt/gtt.c          | 21 ++++++++++++-----
 drivers/gpu/drm/i915/gvt/handlers.c     | 20 ++++++++++++-----
 drivers/gpu/drm/i915/gvt/interrupt.c    | 15 ++++++++-----
 drivers/gpu/drm/i915/gvt/kvmgt.c        | 10 ++++++---
 drivers/gpu/drm/i915/gvt/mmio.c         | 30 +++++++++++++++----------
 drivers/gpu/drm/i915/gvt/mmio_context.c |  6 +++--
 drivers/gpu/drm/i915/gvt/scheduler.c    |  6 +++--
 drivers/gpu/drm/i915/gvt/vgpu.c         |  6 +++--
 11 files changed, 104 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index 19cf1bbe059d..7fd16bab2f39 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -106,10 +106,13 @@ static void vgpu_pci_cfg_mem_write(struct intel_vgpu *vgpu, unsigned int off,
 int intel_vgpu_emulate_cfg_read(struct intel_vgpu *vgpu, unsigned int offset,
 	void *p_data, unsigned int bytes)
 {
-	if (WARN_ON(bytes > 4))
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
+
+	if (drm_WARN_ON(&i915->drm, bytes > 4))
 		return -EINVAL;
 
-	if (WARN_ON(offset + bytes > vgpu->gvt->device_info.cfg_space_size))
+	if (drm_WARN_ON(&i915->drm,
+			offset + bytes > vgpu->gvt->device_info.cfg_space_size))
 		return -EINVAL;
 
 	memcpy(p_data, vgpu_cfg_space(vgpu) + offset, bytes);
@@ -297,34 +300,36 @@ static int emulate_pci_bar_write(struct intel_vgpu *vgpu, unsigned int offset,
 int intel_vgpu_emulate_cfg_write(struct intel_vgpu *vgpu, unsigned int offset,
 	void *p_data, unsigned int bytes)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	int ret;
 
-	if (WARN_ON(bytes > 4))
+	if (drm_WARN_ON(&i915->drm, bytes > 4))
 		return -EINVAL;
 
-	if (WARN_ON(offset + bytes > vgpu->gvt->device_info.cfg_space_size))
+	if (drm_WARN_ON(&i915->drm,
+			offset + bytes > vgpu->gvt->device_info.cfg_space_size))
 		return -EINVAL;
 
 	/* First check if it's PCI_COMMAND */
 	if (IS_ALIGNED(offset, 2) && offset == PCI_COMMAND) {
-		if (WARN_ON(bytes > 2))
+		if (drm_WARN_ON(&i915->drm, bytes > 2))
 			return -EINVAL;
 		return emulate_pci_command_write(vgpu, offset, p_data, bytes);
 	}
 
 	switch (rounddown(offset, 4)) {
 	case PCI_ROM_ADDRESS:
-		if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		if (drm_WARN_ON(&i915->drm, !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
 		return emulate_pci_rom_bar_write(vgpu, offset, p_data, bytes);
 
 	case PCI_BASE_ADDRESS_0 ... PCI_BASE_ADDRESS_5:
-		if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		if (drm_WARN_ON(&i915->drm, !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
 		return emulate_pci_bar_write(vgpu, offset, p_data, bytes);
 
 	case INTEL_GVT_PCI_SWSCI:
-		if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		if (drm_WARN_ON(&i915->drm, !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
 		ret = intel_vgpu_emulate_opregion_request(vgpu, *(u32 *)p_data);
 		if (ret)
@@ -332,7 +337,7 @@ int intel_vgpu_emulate_cfg_write(struct intel_vgpu *vgpu, unsigned int offset,
 		break;
 
 	case INTEL_GVT_PCI_OPREGION:
-		if (WARN_ON(!IS_ALIGNED(offset, 4)))
+		if (drm_WARN_ON(&i915->drm, !IS_ALIGNED(offset, 4)))
 			return -EINVAL;
 		ret = intel_vgpu_opregion_base_write_handler(vgpu,
 						   *(u32 *)p_data);
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 9a9329fb8d64..9bfc0ae30157 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -320,9 +320,10 @@ static void clean_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_num)
 static int setup_virtual_dp_monitor(struct intel_vgpu *vgpu, int port_num,
 				    int type, unsigned int resolution)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_vgpu_port *port = intel_vgpu_port(vgpu, port_num);
 
-	if (WARN_ON(resolution >= GVT_EDID_NUM))
+	if (drm_WARN_ON(&i915->drm, resolution >= GVT_EDID_NUM))
 		return -EINVAL;
 
 	port->edid = kzalloc(sizeof(*(port->edid)), GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index 97bf75890c7d..c093038eb30b 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -276,7 +276,9 @@ static int gmbus1_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 static int gmbus3_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 	void *p_data, unsigned int bytes)
 {
-	WARN_ON(1);
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
+
+	drm_WARN_ON(&i915->drm, 1);
 	return 0;
 }
 
@@ -371,7 +373,9 @@ static int gmbus2_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 int intel_gvt_i2c_handle_gmbus_read(struct intel_vgpu *vgpu,
 	unsigned int offset, void *p_data, unsigned int bytes)
 {
-	if (WARN_ON(bytes > 8 && (offset & (bytes - 1))))
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
+
+	if (drm_WARN_ON(&i915->drm, bytes > 8 && (offset & (bytes - 1))))
 		return -EINVAL;
 
 	if (offset == i915_mmio_reg_offset(PCH_GMBUS2))
@@ -399,7 +403,9 @@ int intel_gvt_i2c_handle_gmbus_read(struct intel_vgpu *vgpu,
 int intel_gvt_i2c_handle_gmbus_write(struct intel_vgpu *vgpu,
 		unsigned int offset, void *p_data, unsigned int bytes)
 {
-	if (WARN_ON(bytes > 8 && (offset & (bytes - 1))))
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
+
+	if (drm_WARN_ON(&i915->drm, bytes > 8 && (offset & (bytes - 1))))
 		return -EINVAL;
 
 	if (offset == i915_mmio_reg_offset(PCH_GMBUS0))
@@ -473,6 +479,7 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 				unsigned int offset,
 				void *p_data)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_vgpu_i2c_edid *i2c_edid = &vgpu->display.i2c_edid;
 	int msg_length, ret_msg_size;
 	int msg, addr, ctrl, op;
@@ -532,9 +539,9 @@ void intel_gvt_i2c_handle_aux_ch_write(struct intel_vgpu *vgpu,
 		 * support the gfx driver to do EDID access.
 		 */
 	} else {
-		if (WARN_ON((op & 0x1) != GVT_AUX_I2C_READ))
+		if (drm_WARN_ON(&i915->drm, (op & 0x1) != GVT_AUX_I2C_READ))
 			return;
-		if (WARN_ON(msg_length != 4))
+		if (drm_WARN_ON(&i915->drm, msg_length != 4))
 			return;
 		if (i2c_edid->edid_available && i2c_edid->slave_selected) {
 			unsigned char val = edid_get_byte(vgpu);
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 4a4828074cb7..25bd5c052909 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -71,8 +71,10 @@ bool intel_gvt_ggtt_validate_range(struct intel_vgpu *vgpu, u64 addr, u32 size)
 /* translate a guest gmadr to host gmadr */
 int intel_gvt_ggtt_gmadr_g2h(struct intel_vgpu *vgpu, u64 g_addr, u64 *h_addr)
 {
-	if (WARN(!vgpu_gmadr_is_valid(vgpu, g_addr),
-		 "invalid guest gmadr %llx\n", g_addr))
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
+
+	if (drm_WARN(&i915->drm, !vgpu_gmadr_is_valid(vgpu, g_addr),
+		     "invalid guest gmadr %llx\n", g_addr))
 		return -EACCES;
 
 	if (vgpu_gmadr_is_aperture(vgpu, g_addr))
@@ -87,8 +89,10 @@ int intel_gvt_ggtt_gmadr_g2h(struct intel_vgpu *vgpu, u64 g_addr, u64 *h_addr)
 /* translate a host gmadr to guest gmadr */
 int intel_gvt_ggtt_gmadr_h2g(struct intel_vgpu *vgpu, u64 h_addr, u64 *g_addr)
 {
-	if (WARN(!gvt_gmadr_is_valid(vgpu->gvt, h_addr),
-		 "invalid host gmadr %llx\n", h_addr))
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
+
+	if (drm_WARN(&i915->drm, !gvt_gmadr_is_valid(vgpu->gvt, h_addr),
+		     "invalid host gmadr %llx\n", h_addr))
 		return -EACCES;
 
 	if (gvt_gmadr_is_aperture(vgpu->gvt, h_addr))
@@ -940,6 +944,7 @@ static int ppgtt_invalidate_spt(struct intel_vgpu_ppgtt_spt *spt);
 static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
 		struct intel_gvt_gtt_entry *e)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
 	struct intel_vgpu_ppgtt_spt *s;
 	enum intel_gvt_gtt_type cur_pt_type;
@@ -952,7 +957,9 @@ static int ppgtt_invalidate_spt_by_shadow_entry(struct intel_vgpu *vgpu,
 
 		if (!gtt_type_is_pt(cur_pt_type) ||
 				!gtt_type_is_pt(cur_pt_type + 1)) {
-			WARN(1, "Invalid page table type, cur_pt_type is: %d\n", cur_pt_type);
+			drm_WARN(&i915->drm, 1,
+				 "Invalid page table type, cur_pt_type is: %d\n",
+				 cur_pt_type);
 			return -EINVAL;
 		}
 
@@ -2347,6 +2354,7 @@ int intel_vgpu_emulate_ggtt_mmio_write(struct intel_vgpu *vgpu,
 static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 		enum intel_gvt_gtt_type type)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_vgpu_gtt *gtt = &vgpu->gtt;
 	struct intel_gvt_gtt_pte_ops *ops = vgpu->gvt->gtt.pte_ops;
 	int page_entry_num = I915_GTT_PAGE_SIZE >>
@@ -2356,7 +2364,8 @@ static int alloc_scratch_pages(struct intel_vgpu *vgpu,
 	struct device *dev = &vgpu->gvt->dev_priv->drm.pdev->dev;
 	dma_addr_t daddr;
 
-	if (WARN_ON(type < GTT_TYPE_PPGTT_PTE_PT || type >= GTT_TYPE_MAX))
+	if (drm_WARN_ON(&i915->drm,
+			type < GTT_TYPE_PPGTT_PTE_PT || type >= GTT_TYPE_MAX))
 		return -EINVAL;
 
 	scratch_pt = (void *)get_zeroed_page(GFP_KERNEL);
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index 288572e27473..1793f6991fa8 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -1306,13 +1306,15 @@ static int pvinfo_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 static int pf_write(struct intel_vgpu *vgpu,
 		unsigned int offset, void *p_data, unsigned int bytes)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	u32 val = *(u32 *)p_data;
 
 	if ((offset == _PS_1A_CTRL || offset == _PS_2A_CTRL ||
 	   offset == _PS_1B_CTRL || offset == _PS_2B_CTRL ||
 	   offset == _PS_1C_CTRL) && (val & PS_PLANE_SEL_MASK) != 0) {
-		WARN_ONCE(true, "VM(%d): guest is trying to scaling a plane\n",
-			  vgpu->id);
+		drm_WARN_ONCE(&i915->drm, true,
+			      "VM(%d): guest is trying to scaling a plane\n",
+			      vgpu->id);
 		return 0;
 	}
 
@@ -1360,13 +1362,15 @@ static int fpga_dbg_mmio_write(struct intel_vgpu *vgpu,
 static int dma_ctrl_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	u32 mode;
 
 	write_vreg(vgpu, offset, p_data, bytes);
 	mode = vgpu_vreg(vgpu, offset);
 
 	if (GFX_MODE_BIT_SET_IN_MASK(mode, START_DMA)) {
-		WARN_ONCE(1, "VM(%d): iGVT-g doesn't support GuC\n",
+		drm_WARN_ONCE(&i915->drm, 1,
+				"VM(%d): iGVT-g doesn't support GuC\n",
 				vgpu->id);
 		return 0;
 	}
@@ -1377,10 +1381,12 @@ static int dma_ctrl_write(struct intel_vgpu *vgpu, unsigned int offset,
 static int gen9_trtte_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	u32 trtte = *(u32 *)p_data;
 
 	if ((trtte & 1) && (trtte & (1 << 1)) == 0) {
-		WARN(1, "VM(%d): Use physical address for TRTT!\n",
+		drm_WARN(&i915->drm, 1,
+				"VM(%d): Use physical address for TRTT!\n",
 				vgpu->id);
 		return -EINVAL;
 	}
@@ -1682,12 +1688,13 @@ static int mmio_read_from_hw(struct intel_vgpu *vgpu,
 static int elsp_mmio_write(struct intel_vgpu *vgpu, unsigned int offset,
 		void *p_data, unsigned int bytes)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	int ring_id = intel_gvt_render_mmio_to_ring_id(vgpu->gvt, offset);
 	struct intel_vgpu_execlist *execlist;
 	u32 data = *(u32 *)p_data;
 	int ret = 0;
 
-	if (WARN_ON(ring_id < 0 || ring_id >= I915_NUM_ENGINES))
+	if (drm_WARN_ON(&i915->drm, ring_id < 0 || ring_id >= I915_NUM_ENGINES))
 		return -EINVAL;
 
 	execlist = &vgpu->submission.execlist[ring_id];
@@ -3541,13 +3548,14 @@ bool intel_gvt_in_force_nonpriv_whitelist(struct intel_gvt *gvt,
 int intel_vgpu_mmio_reg_rw(struct intel_vgpu *vgpu, unsigned int offset,
 			   void *pdata, unsigned int bytes, bool is_read)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct intel_gvt_mmio_info *mmio_info;
 	struct gvt_mmio_block *mmio_block;
 	gvt_mmio_func func;
 	int ret;
 
-	if (WARN_ON(bytes > 8))
+	if (drm_WARN_ON(&i915->drm, bytes > 8))
 		return -EINVAL;
 
 	/*
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index 11accd3e1023..4d4783efc9b6 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -244,6 +244,7 @@ int intel_vgpu_reg_master_irq_handler(struct intel_vgpu *vgpu,
 int intel_vgpu_reg_ier_handler(struct intel_vgpu *vgpu,
 	unsigned int reg, void *p_data, unsigned int bytes)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct intel_gvt_irq_ops *ops = gvt->irq.ops;
 	struct intel_gvt_irq_info *info;
@@ -255,7 +256,7 @@ int intel_vgpu_reg_ier_handler(struct intel_vgpu *vgpu,
 	vgpu_vreg(vgpu, reg) = ier;
 
 	info = regbase_to_irq_info(gvt, ier_to_regbase(reg));
-	if (WARN_ON(!info))
+	if (drm_WARN_ON(&i915->drm, !info))
 		return -EINVAL;
 
 	if (info->has_upstream_irq)
@@ -282,6 +283,7 @@ int intel_vgpu_reg_ier_handler(struct intel_vgpu *vgpu,
 int intel_vgpu_reg_iir_handler(struct intel_vgpu *vgpu, unsigned int reg,
 	void *p_data, unsigned int bytes)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt_irq_info *info = regbase_to_irq_info(vgpu->gvt,
 		iir_to_regbase(reg));
 	u32 iir = *(u32 *)p_data;
@@ -289,7 +291,7 @@ int intel_vgpu_reg_iir_handler(struct intel_vgpu *vgpu, unsigned int reg,
 	trace_write_ir(vgpu->id, "IIR", reg, iir, vgpu_vreg(vgpu, reg),
 		       (vgpu_vreg(vgpu, reg) ^ iir));
 
-	if (WARN_ON(!info))
+	if (drm_WARN_ON(&i915->drm, !info))
 		return -EINVAL;
 
 	vgpu_vreg(vgpu, reg) &= ~iir;
@@ -319,6 +321,7 @@ static struct intel_gvt_irq_map gen8_irq_map[] = {
 static void update_upstream_irq(struct intel_vgpu *vgpu,
 		struct intel_gvt_irq_info *info)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt_irq *irq = &vgpu->gvt->irq;
 	struct intel_gvt_irq_map *map = irq->irq_map;
 	struct intel_gvt_irq_info *up_irq_info = NULL;
@@ -340,7 +343,8 @@ static void update_upstream_irq(struct intel_vgpu *vgpu,
 		if (!up_irq_info)
 			up_irq_info = irq->info[map->up_irq_group];
 		else
-			WARN_ON(up_irq_info != irq->info[map->up_irq_group]);
+			drm_WARN_ON(&i915->drm, up_irq_info !=
+				    irq->info[map->up_irq_group]);
 
 		bit = map->up_irq_bit;
 
@@ -350,7 +354,7 @@ static void update_upstream_irq(struct intel_vgpu *vgpu,
 			clear_bits |= (1 << bit);
 	}
 
-	if (WARN_ON(!up_irq_info))
+	if (drm_WARN_ON(&i915->drm, !up_irq_info))
 		return;
 
 	if (up_irq_info->group == INTEL_GVT_IRQ_INFO_MASTER) {
@@ -618,13 +622,14 @@ static struct intel_gvt_irq_ops gen8_irq_ops = {
 void intel_vgpu_trigger_virtual_event(struct intel_vgpu *vgpu,
 	enum intel_gvt_event_type event)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt *gvt = vgpu->gvt;
 	struct intel_gvt_irq *irq = &gvt->irq;
 	gvt_event_virt_handler_t handler;
 	struct intel_gvt_irq_ops *ops = gvt->irq.ops;
 
 	handler = get_event_virt_handler(irq, event);
-	WARN_ON(!handler);
+	drm_WARN_ON(&i915->drm, !handler);
 
 	handler(irq, event, vgpu);
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 3259a1fa69e1..f349e7acb375 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -120,6 +120,7 @@ static bool kvmgt_guest_exit(struct kvmgt_guest_info *info);
 static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long size)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	int total_pages;
 	int npage;
 	int ret;
@@ -130,7 +131,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
 		unsigned long cur_gfn = gfn + npage;
 
 		ret = vfio_unpin_pages(mdev_dev(vgpu->vdev.mdev), &cur_gfn, 1);
-		WARN_ON(ret != 1);
+		drm_WARN_ON(&i915->drm, ret != 1);
 	}
 }
 
@@ -808,6 +809,7 @@ static void intel_vgpu_release_msi_eventfd_ctx(struct intel_vgpu *vgpu)
 
 static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct kvmgt_guest_info *info;
 	int ret;
 
@@ -821,11 +823,13 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 
 	ret = vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_IOMMU_NOTIFY,
 					&vgpu->vdev.iommu_notifier);
-	WARN(ret, "vfio_unregister_notifier for iommu failed: %d\n", ret);
+	drm_WARN(&i915->drm, ret,
+		 "vfio_unregister_notifier for iommu failed: %d\n", ret);
 
 	ret = vfio_unregister_notifier(mdev_dev(vgpu->vdev.mdev), VFIO_GROUP_NOTIFY,
 					&vgpu->vdev.group_notifier);
-	WARN(ret, "vfio_unregister_notifier for group failed: %d\n", ret);
+	drm_WARN(&i915->drm, ret,
+		 "vfio_unregister_notifier for group failed: %d\n", ret);
 
 	/* dereference module reference taken at open */
 	module_put(THIS_MODULE);
diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
index a55178884d67..1046a68da888 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.c
+++ b/drivers/gpu/drm/i915/gvt/mmio.c
@@ -102,6 +102,7 @@ static void failsafe_emulate_mmio_rw(struct intel_vgpu *vgpu, u64 pa,
 int intel_vgpu_emulate_mmio_read(struct intel_vgpu *vgpu, u64 pa,
 		void *p_data, unsigned int bytes)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt *gvt = vgpu->gvt;
 	unsigned int offset = 0;
 	int ret = -EINVAL;
@@ -114,15 +115,17 @@ int intel_vgpu_emulate_mmio_read(struct intel_vgpu *vgpu, u64 pa,
 
 	offset = intel_vgpu_gpa_to_mmio_offset(vgpu, pa);
 
-	if (WARN_ON(bytes > 8))
+	if (drm_WARN_ON(&i915->drm, bytes > 8))
 		goto err;
 
 	if (reg_is_gtt(gvt, offset)) {
-		if (WARN_ON(!IS_ALIGNED(offset, 4) && !IS_ALIGNED(offset, 8)))
+		if (drm_WARN_ON(&i915->drm, !IS_ALIGNED(offset, 4) &&
+				!IS_ALIGNED(offset, 8)))
 			goto err;
-		if (WARN_ON(bytes != 4 && bytes != 8))
+		if (drm_WARN_ON(&i915->drm, bytes != 4 && bytes != 8))
 			goto err;
-		if (WARN_ON(!reg_is_gtt(gvt, offset + bytes - 1)))
+		if (drm_WARN_ON(&i915->drm,
+				!reg_is_gtt(gvt, offset + bytes - 1)))
 			goto err;
 
 		ret = intel_vgpu_emulate_ggtt_mmio_read(vgpu, offset,
@@ -132,16 +135,16 @@ int intel_vgpu_emulate_mmio_read(struct intel_vgpu *vgpu, u64 pa,
 		goto out;
 	}
 
-	if (WARN_ON_ONCE(!reg_is_mmio(gvt, offset))) {
+	if (drm_WARN_ON_ONCE(&i915->drm, !reg_is_mmio(gvt, offset))) {
 		ret = intel_gvt_hypervisor_read_gpa(vgpu, pa, p_data, bytes);
 		goto out;
 	}
 
-	if (WARN_ON(!reg_is_mmio(gvt, offset + bytes - 1)))
+	if (drm_WARN_ON(&i915->drm, !reg_is_mmio(gvt, offset + bytes - 1)))
 		goto err;
 
 	if (!intel_gvt_mmio_is_unalign(gvt, offset)) {
-		if (WARN_ON(!IS_ALIGNED(offset, bytes)))
+		if (drm_WARN_ON(&i915->drm, !IS_ALIGNED(offset, bytes)))
 			goto err;
 	}
 
@@ -174,6 +177,7 @@ int intel_vgpu_emulate_mmio_read(struct intel_vgpu *vgpu, u64 pa,
 int intel_vgpu_emulate_mmio_write(struct intel_vgpu *vgpu, u64 pa,
 		void *p_data, unsigned int bytes)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt *gvt = vgpu->gvt;
 	unsigned int offset = 0;
 	int ret = -EINVAL;
@@ -187,15 +191,17 @@ int intel_vgpu_emulate_mmio_write(struct intel_vgpu *vgpu, u64 pa,
 
 	offset = intel_vgpu_gpa_to_mmio_offset(vgpu, pa);
 
-	if (WARN_ON(bytes > 8))
+	if (drm_WARN_ON(&i915->drm, bytes > 8))
 		goto err;
 
 	if (reg_is_gtt(gvt, offset)) {
-		if (WARN_ON(!IS_ALIGNED(offset, 4) && !IS_ALIGNED(offset, 8)))
+		if (drm_WARN_ON(&i915->drm, !IS_ALIGNED(offset, 4) &&
+				!IS_ALIGNED(offset, 8)))
 			goto err;
-		if (WARN_ON(bytes != 4 && bytes != 8))
+		if (drm_WARN_ON(&i915->drm, bytes != 4 && bytes != 8))
 			goto err;
-		if (WARN_ON(!reg_is_gtt(gvt, offset + bytes - 1)))
+		if (drm_WARN_ON(&i915->drm,
+				!reg_is_gtt(gvt, offset + bytes - 1)))
 			goto err;
 
 		ret = intel_vgpu_emulate_ggtt_mmio_write(vgpu, offset,
@@ -205,7 +211,7 @@ int intel_vgpu_emulate_mmio_write(struct intel_vgpu *vgpu, u64 pa,
 		goto out;
 	}
 
-	if (WARN_ON_ONCE(!reg_is_mmio(gvt, offset))) {
+	if (drm_WARN_ON_ONCE(&i915->drm, !reg_is_mmio(gvt, offset))) {
 		ret = intel_gvt_hypervisor_write_gpa(vgpu, pa, p_data, bytes);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index a4a1de347af0..46c291e4926b 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -392,6 +392,7 @@ static void handle_tlb_pending_event(struct intel_vgpu *vgpu, int ring_id)
 static void switch_mocs(struct intel_vgpu *pre, struct intel_vgpu *next,
 			int ring_id)
 {
+	struct drm_i915_private *i915 = pre->gvt->dev_priv;
 	struct drm_i915_private *dev_priv;
 	i915_reg_t offset, l3_offset;
 	u32 old_v, new_v;
@@ -406,7 +407,7 @@ static void switch_mocs(struct intel_vgpu *pre, struct intel_vgpu *next,
 	int i;
 
 	dev_priv = pre ? pre->gvt->dev_priv : next->gvt->dev_priv;
-	if (WARN_ON(ring_id >= ARRAY_SIZE(regs)))
+	if (drm_WARN_ON(&i915->drm, ring_id >= ARRAY_SIZE(regs)))
 		return;
 
 	if (ring_id == RCS0 && IS_GEN(dev_priv, 9))
@@ -551,9 +552,10 @@ static void switch_mmio(struct intel_vgpu *pre,
 void intel_gvt_switch_mmio(struct intel_vgpu *pre,
 			   struct intel_vgpu *next, int ring_id)
 {
+	struct drm_i915_private *i915 = pre->gvt->dev_priv;
 	struct drm_i915_private *dev_priv;
 
-	if (WARN_ON(!pre && !next))
+	if (drm_WARN_ON(&i915->drm, !pre && !next))
 		return;
 
 	gvt_dbg_render("switch ring %d from %s to %s\n", ring_id,
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 685d1e04a5ff..cc89afd7b5f1 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -1309,6 +1309,7 @@ int intel_vgpu_select_submission_ops(struct intel_vgpu *vgpu,
 				     intel_engine_mask_t engine_mask,
 				     unsigned int interface)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_vgpu_submission *s = &vgpu->submission;
 	const struct intel_vgpu_submission_ops *ops[] = {
 		[INTEL_VGPU_EXECLIST_SUBMISSION] =
@@ -1316,10 +1317,11 @@ int intel_vgpu_select_submission_ops(struct intel_vgpu *vgpu,
 	};
 	int ret;
 
-	if (WARN_ON(interface >= ARRAY_SIZE(ops)))
+	if (drm_WARN_ON(&i915->drm, interface >= ARRAY_SIZE(ops)))
 		return -EINVAL;
 
-	if (WARN_ON(interface == 0 && engine_mask != ALL_ENGINES))
+	if (drm_WARN_ON(&i915->drm,
+			interface == 0 && engine_mask != ALL_ENGINES))
 		return -EINVAL;
 
 	if (s->active)
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 85bd9bf4f6ee..6f35e9a3a561 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -37,6 +37,7 @@
 
 void populate_pvinfo_page(struct intel_vgpu *vgpu)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	/* setup the ballooning information */
 	vgpu_vreg64_t(vgpu, vgtif_reg(magic)) = VGT_MAGIC;
 	vgpu_vreg_t(vgpu, vgtif_reg(version_major)) = 1;
@@ -69,7 +70,7 @@ void populate_pvinfo_page(struct intel_vgpu *vgpu)
 		vgpu_hidden_gmadr_base(vgpu), vgpu_hidden_sz(vgpu));
 	gvt_dbg_core("fence size %d\n", vgpu_fence_sz(vgpu));
 
-	WARN_ON(sizeof(struct vgt_if) != VGT_PVINFO_SIZE);
+	drm_WARN_ON(&i915->drm, sizeof(struct vgt_if) != VGT_PVINFO_SIZE);
 }
 
 #define VGPU_MAX_WEIGHT 16
@@ -270,11 +271,12 @@ void intel_gvt_release_vgpu(struct intel_vgpu *vgpu)
  */
 void intel_gvt_destroy_vgpu(struct intel_vgpu *vgpu)
 {
+	struct drm_i915_private *i915 = vgpu->gvt->dev_priv;
 	struct intel_gvt *gvt = vgpu->gvt;
 
 	mutex_lock(&vgpu->vgpu_lock);
 
-	WARN(vgpu->active, "vGPU is still active!\n");
+	drm_WARN(&i915->drm, vgpu->active, "vGPU is still active!\n");
 
 	intel_gvt_debugfs_remove_vgpu(vgpu);
 	intel_vgpu_clean_sched_policy(vgpu);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
