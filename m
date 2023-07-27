Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEA3765E8F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA7910E617;
	Thu, 27 Jul 2023 21:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qs51p00im-qukt01072101.me.com (qs51p00im-qukt01072101.me.com
 [17.57.155.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A3510E617
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 21:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1690494767; bh=mguhDgGjsBNB0fhbVis30YaUXi1UXdYfdMasDcaxP0c=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=IQ2y9FWGHs0BG2Gco/IW9dcM+R71hK8rvu4P6/oa6/64wiO6ECiyZFaAWEouvZBBB
 2YUGCeUjJ+Hb5V8yupap0+WxQqe8/n4jVeLtl3/61QgC9x3vL9iwVMfO9UBtP3mppw
 BWH10kl2DBY0SGBLI30EwP4rbWUDMtMB0oS8FDdtw2lEgY0Rpp+y6tFf/NMNPtkK7I
 i7NUhtqgb8cAQqyDBxsXBrBnmkB9O8FFA+G5efjU4cM8LnP9tFunH8W9+6IwWTRcSh
 1BXQbl+OMNOOwr4/NdyiSUomhrY78m/LblERwKWey6487GVw2Cmu56/c8v8rr4bChH
 9dw4DP/FGsC8A==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01072101.me.com (Postfix) with ESMTPSA id
 F0CE9409F5; Thu, 27 Jul 2023 21:52:46 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 09/14] drm/sti: add support for GDPPLUS / stih418 GDPs
Date: Thu, 27 Jul 2023 21:51:33 +0000
Message-Id: <20230727215141.53910-10-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727215141.53910-1-avolmat@me.com>
References: <20230727215141.53910-1-avolmat@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nKb5f2cpnaihHY5bXmpaeaKvag7Hfgjh
X-Proofpoint-ORIG-GUID: nKb5f2cpnaihHY5bXmpaeaKvag7Hfgjh
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-11=5F01:2022-01-11=5F01,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 clxscore=1015 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2307270199
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The STiH418 platform embeds two kinds of graphical planes (GDP),
so called GDPPLUS which has additional (yet unimplemented)
features compared to the GDP, and also the GDP.
Register map of GDPPLUS slightly differ from the GDP even if,
for common functionalities registers name and behavior are the
same (but not at same addresses).  For that purpose, this commit
rework the way of addressing the GDP(PLUS) registers.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 drivers/gpu/drm/sti/sti_compositor.c |   4 +
 drivers/gpu/drm/sti/sti_compositor.h |   1 +
 drivers/gpu/drm/sti/sti_gdp.c        | 250 ++++++++++++++++-----------
 drivers/gpu/drm/sti/sti_gdp.h        |   8 +-
 4 files changed, 163 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_compositor.c b/drivers/gpu/drm/sti/sti_compositor.c
index 33487a1fed8f..4bd7e305ab75 100644
--- a/drivers/gpu/drm/sti/sti_compositor.c
+++ b/drivers/gpu/drm/sti/sti_compositor.c
@@ -87,6 +87,7 @@ static int sti_compositor_bind(struct device *dev,
 					     compo->regs + desc[i].offset);
 			break;
 		case STI_GPD_SUBDEV:
+		case STI_GPDPLUS_SUBDEV:
 		case STI_CURSOR_SUBDEV:
 			/* Nothing to do, wait for the second round */
 			break;
@@ -120,7 +121,10 @@ static int sti_compositor_bind(struct device *dev,
 			}
 			break;
 		case STI_GPD_SUBDEV:
+		case STI_GPDPLUS_SUBDEV:
 			primary = sti_gdp_create(drm_dev, compo->dev,
+						 desc[i].type == STI_GPD_SUBDEV ?
+						 STI_GDP_TYPE_GDP : STI_GDP_TYPE_GDPPLUS,
 						 desc[i].id,
 						 compo->regs + desc[i].offset,
 						 (1 << mixer_id) - 1,
diff --git a/drivers/gpu/drm/sti/sti_compositor.h b/drivers/gpu/drm/sti/sti_compositor.h
index 25bb01bdd013..62545210b96d 100644
--- a/drivers/gpu/drm/sti/sti_compositor.h
+++ b/drivers/gpu/drm/sti/sti_compositor.h
@@ -24,6 +24,7 @@ enum sti_compositor_subdev_type {
 	STI_MIXER_MAIN_SUBDEV,
 	STI_MIXER_AUX_SUBDEV,
 	STI_GPD_SUBDEV,
+	STI_GPDPLUS_SUBDEV,
 	STI_VID_SUBDEV,
 	STI_CURSOR_SUBDEV,
 };
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 43c72c2604a0..1f4064d64f15 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -55,6 +55,7 @@ static struct gdp_format_to_str {
 		GDP2STR(ARGB4444)
 		};
 
+/* GDP register offsets */
 #define GAM_GDP_CTL_OFFSET      0x00
 #define GAM_GDP_AGC_OFFSET      0x04
 #define GAM_GDP_VPO_OFFSET      0x0C
@@ -67,8 +68,45 @@ static struct gdp_format_to_str {
 #define GAM_GDP_KEY2_OFFSET     0x2C
 #define GAM_GDP_PPT_OFFSET      0x34
 #define GAM_GDP_CML_OFFSET      0x3C
+#define GAM_GDP_NODE_SIZE	0x40
 #define GAM_GDP_MST_OFFSET      0x68
 
+/* GDPPLUS register offsets */
+#define	GAM_GDPPLUS_CTL_OFFSET	0x00
+#define	GAM_GDPPLUS_AGC_OFFSET	0x04
+#define	GAM_GDPPLUS_VPO_OFFSET	0x08
+#define	GAM_GDPPLUS_VPS_OFFSET	0x0C
+#define	GAM_GDPPLUS_PML_OFFSET	0x10
+#define	GAM_GDPPLUS_PMP_OFFSET	0x14
+#define	GAM_GDPPLUS_SIZE_OFFSET	0x18
+#define	GAM_GDPPLUS_NVN_OFFSET	0x1C
+#define	GAM_GDPPLUS_KEY1_OFFSET	0x20
+#define	GAM_GDPPLUS_KEY2_OFFSET	0x24
+#define	GAM_GDPPLUS_HFP_OFFSET	0x28
+#define	GAM_GDPPLUS_PPT_OFFSET	0x2C
+#define	GAM_GDPPLUS_VFP_OFFSET	0x30
+#define	GAM_GDPPLUS_CML_OFFSET	0x34
+#define	GAM_GDPPLUS_CROP_OFFSET	0x38
+#define	GAM_GDPPLUS_BT0_OFFSET	0x3C
+#define	GAM_GDPPLUS_BT1_OFFSET	0x40
+#define	GAM_GDPPLUS_BT2_OFFSET	0x44
+#define	GAM_GDPPLUS_BT3_OFFSET	0x48
+#define	GAM_GDPPLUS_BT4_OFFSET	0x4C
+#define	GAM_GDPPLUS_HSRC_OFFSET	0x50
+#define	GAM_GDPPLUS_HIP_OFFSET	0x54
+#define	GAM_GDPPLUS_HP1_OFFSET	0x58
+#define	GAM_GDPPLUS_HP2_OFFSET	0x5C
+#define	GAM_GDPPLUS_VSRC_OFFSET	0x60
+#define	GAM_GDPPLUS_VIP_OFFSET	0x64
+#define	GAM_GDPPLUS_VP1_OFFSET	0x68
+#define	GAM_GDPPLUS_VP2_OFFSET	0x6C
+#define GAM_GDPPLUS_NODE_SIZE	0x500
+
+/* Accessor for common registers */
+#define GAM_OFFSET(reg, type)	((type) == STI_GDP_TYPE_GDP ? GAM_GDP_ ## reg ## _OFFSET :\
+				 GAM_GDPPLUS_ ## reg ## _OFFSET)
+#define GAM_OFFSET_U32(reg, type)	(GAM_OFFSET(reg, type) >> 2)
+
 #define GAM_GDP_ALPHARANGE_255  BIT(5)
 #define GAM_GDP_AGC_FULL_RANGE  0x00808080
 #define GAM_GDP_PPT_IGNORE      (BIT(1) | BIT(0))
@@ -79,29 +117,10 @@ static struct gdp_format_to_str {
 #define GDP_NODE_NB_BANK        2
 #define GDP_NODE_PER_FIELD      2
 
-struct sti_gdp_node {
-	u32 gam_gdp_ctl;
-	u32 gam_gdp_agc;
-	u32 reserved1;
-	u32 gam_gdp_vpo;
-	u32 gam_gdp_vps;
-	u32 gam_gdp_pml;
-	u32 gam_gdp_pmp;
-	u32 gam_gdp_size;
-	u32 reserved2;
-	u32 gam_gdp_nvn;
-	u32 gam_gdp_key1;
-	u32 gam_gdp_key2;
-	u32 reserved3;
-	u32 gam_gdp_ppt;
-	u32 reserved4;
-	u32 gam_gdp_cml;
-};
-
 struct sti_gdp_node_list {
-	struct sti_gdp_node *top_field;
+	u32 *top_field;
 	dma_addr_t top_field_paddr;
-	struct sti_gdp_node *btm_field;
+	u32 *btm_field;
 	dma_addr_t btm_field_paddr;
 };
 
@@ -130,6 +149,7 @@ struct sti_gdp {
 	bool is_curr_top;
 	struct sti_gdp_node_list node_list[GDP_NODE_NB_BANK];
 	struct sti_vtg *vtg;
+	enum sti_gdp_type type;
 };
 
 #define to_sti_gdp(x) container_of(x, struct sti_gdp, plane)
@@ -145,8 +165,8 @@ static const uint32_t gdp_supported_formats[] = {
 	DRM_FORMAT_RGB888,
 };
 
-#define DBGFS_DUMP(reg) seq_printf(s, "\n  %-25s 0x%08X", #reg, \
-				   readl(gdp->regs + reg ## _OFFSET))
+#define DBGFS_DUMP(reg, offset) seq_printf(s, "\n  %-25s 0x%08X", #reg, \
+					   readl(gdp->regs + (offset)))
 
 static void gdp_dbg_ctl(struct seq_file *s, int val)
 {
@@ -216,6 +236,7 @@ static int gdp_dbg_show(struct seq_file *s, void *data)
 {
 	struct drm_info_node *node = s->private;
 	struct sti_gdp *gdp = (struct sti_gdp *)node->info_ent->data;
+	struct device_node *np = gdp->dev->of_node;
 	struct drm_plane *drm_plane = &gdp->plane.drm_plane;
 	struct drm_crtc *crtc;
 
@@ -226,26 +247,28 @@ static int gdp_dbg_show(struct seq_file *s, void *data)
 	seq_printf(s, "%s: (vaddr = 0x%p)",
 		   sti_plane_to_str(&gdp->plane), gdp->regs);
 
-	DBGFS_DUMP(GAM_GDP_CTL);
-	gdp_dbg_ctl(s, readl(gdp->regs + GAM_GDP_CTL_OFFSET));
-	DBGFS_DUMP(GAM_GDP_AGC);
-	DBGFS_DUMP(GAM_GDP_VPO);
-	gdp_dbg_vpo(s, readl(gdp->regs + GAM_GDP_VPO_OFFSET));
-	DBGFS_DUMP(GAM_GDP_VPS);
-	gdp_dbg_vps(s, readl(gdp->regs + GAM_GDP_VPS_OFFSET));
-	DBGFS_DUMP(GAM_GDP_PML);
-	DBGFS_DUMP(GAM_GDP_PMP);
-	DBGFS_DUMP(GAM_GDP_SIZE);
-	gdp_dbg_size(s, readl(gdp->regs + GAM_GDP_SIZE_OFFSET));
-	DBGFS_DUMP(GAM_GDP_NVN);
-	gdp_dbg_nvn(s, gdp, readl(gdp->regs + GAM_GDP_NVN_OFFSET));
-	DBGFS_DUMP(GAM_GDP_KEY1);
-	DBGFS_DUMP(GAM_GDP_KEY2);
-	DBGFS_DUMP(GAM_GDP_PPT);
-	gdp_dbg_ppt(s, readl(gdp->regs + GAM_GDP_PPT_OFFSET));
-	DBGFS_DUMP(GAM_GDP_CML);
-	DBGFS_DUMP(GAM_GDP_MST);
-	gdp_dbg_mst(s, readl(gdp->regs + GAM_GDP_MST_OFFSET));
+	DBGFS_DUMP(CTL, GAM_OFFSET(CTL, gdp->type));
+	gdp_dbg_ctl(s, readl(gdp->regs + GAM_OFFSET(CTL, gdp->type)));
+	DBGFS_DUMP(AGC, GAM_OFFSET(AGC, gdp->type));
+	DBGFS_DUMP(VPO, GAM_OFFSET(VPO, gdp->type));
+	gdp_dbg_vpo(s, readl(gdp->regs + GAM_OFFSET(VPO, gdp->type)));
+	DBGFS_DUMP(VPS, GAM_OFFSET(VPS, gdp->type));
+	gdp_dbg_vps(s, readl(gdp->regs + GAM_OFFSET(VPS, gdp->type)));
+	DBGFS_DUMP(PML, GAM_OFFSET(PML, gdp->type));
+	DBGFS_DUMP(PMP, GAM_OFFSET(PMP, gdp->type));
+	DBGFS_DUMP(SIZE, GAM_OFFSET(SIZE, gdp->type));
+	gdp_dbg_size(s, readl(gdp->regs + GAM_OFFSET(SIZE, gdp->type)));
+	DBGFS_DUMP(NVN, GAM_OFFSET(NVN, gdp->type));
+	gdp_dbg_nvn(s, gdp, readl(gdp->regs + GAM_OFFSET(NVN, gdp->type)));
+	DBGFS_DUMP(KEY1, GAM_OFFSET(KEY1, gdp->type));
+	DBGFS_DUMP(KEY2, GAM_OFFSET(KEY2, gdp->type));
+	DBGFS_DUMP(PPT, GAM_OFFSET(PPT, gdp->type));
+	gdp_dbg_ppt(s, readl(gdp->regs + GAM_OFFSET(PPT, gdp->type)));
+	DBGFS_DUMP(CML, GAM_OFFSET(CML, gdp->type));
+	if (of_device_is_compatible(np, "st,stih407-compositor")) {
+		DBGFS_DUMP(MST, GAM_GDP_MST_OFFSET);
+		gdp_dbg_mst(s, readl(gdp->regs + GAM_GDP_MST_OFFSET));
+	}
 
 	seq_puts(s, "\n\n");
 	if (!crtc)
@@ -257,26 +280,26 @@ static int gdp_dbg_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static void gdp_node_dump_node(struct seq_file *s, struct sti_gdp_node *node)
+static void gdp_node_dump_node(struct seq_file *s, u32 *node, enum sti_gdp_type type)
 {
 	seq_printf(s, "\t@:0x%p", node);
-	seq_printf(s, "\n\tCTL  0x%08X", node->gam_gdp_ctl);
-	gdp_dbg_ctl(s, node->gam_gdp_ctl);
-	seq_printf(s, "\n\tAGC  0x%08X", node->gam_gdp_agc);
-	seq_printf(s, "\n\tVPO  0x%08X", node->gam_gdp_vpo);
-	gdp_dbg_vpo(s, node->gam_gdp_vpo);
-	seq_printf(s, "\n\tVPS  0x%08X", node->gam_gdp_vps);
-	gdp_dbg_vps(s, node->gam_gdp_vps);
-	seq_printf(s, "\n\tPML  0x%08X", node->gam_gdp_pml);
-	seq_printf(s, "\n\tPMP  0x%08X", node->gam_gdp_pmp);
-	seq_printf(s, "\n\tSIZE 0x%08X", node->gam_gdp_size);
-	gdp_dbg_size(s, node->gam_gdp_size);
-	seq_printf(s, "\n\tNVN  0x%08X", node->gam_gdp_nvn);
-	seq_printf(s, "\n\tKEY1 0x%08X", node->gam_gdp_key1);
-	seq_printf(s, "\n\tKEY2 0x%08X", node->gam_gdp_key2);
-	seq_printf(s, "\n\tPPT  0x%08X", node->gam_gdp_ppt);
-	gdp_dbg_ppt(s, node->gam_gdp_ppt);
-	seq_printf(s, "\n\tCML  0x%08X\n", node->gam_gdp_cml);
+	seq_printf(s, "\n\tCTL  0x%08X", node[GAM_OFFSET_U32(CTL, type)]);
+	gdp_dbg_ctl(s, node[GAM_OFFSET_U32(CTL, type)]);
+	seq_printf(s, "\n\tAGC  0x%08X", node[GAM_OFFSET_U32(AGC, type)]);
+	seq_printf(s, "\n\tVPO  0x%08X", node[GAM_OFFSET_U32(VPO, type)]);
+	gdp_dbg_vpo(s, node[GAM_OFFSET_U32(VPO, type)]);
+	seq_printf(s, "\n\tVPS  0x%08X", node[GAM_OFFSET_U32(VPS, type)]);
+	gdp_dbg_vps(s, node[GAM_OFFSET_U32(VPS, type)]);
+	seq_printf(s, "\n\tPML  0x%08X", node[GAM_OFFSET_U32(PML, type)]);
+	seq_printf(s, "\n\tPMP  0x%08X", node[GAM_OFFSET_U32(PMP, type)]);
+	seq_printf(s, "\n\tSIZE 0x%08X", node[GAM_OFFSET_U32(SIZE, type)]);
+	gdp_dbg_size(s, node[GAM_OFFSET_U32(SIZE, type)]);
+	seq_printf(s, "\n\tNVN  0x%08X", node[GAM_OFFSET_U32(NVN, type)]);
+	seq_printf(s, "\n\tKEY1 0x%08X", node[GAM_OFFSET_U32(KEY1, type)]);
+	seq_printf(s, "\n\tKEY2 0x%08X", node[GAM_OFFSET_U32(KEY2, type)]);
+	seq_printf(s, "\n\tPPT  0x%08X", node[GAM_OFFSET_U32(PPT, type)]);
+	gdp_dbg_ppt(s, node[GAM_OFFSET_U32(PPT, type)]);
+	seq_printf(s, "\n\tCML  0x%08X\n", node[GAM_OFFSET_U32(CML, type)]);
 }
 
 static int gdp_node_dbg_show(struct seq_file *s, void *arg)
@@ -287,9 +310,9 @@ static int gdp_node_dbg_show(struct seq_file *s, void *arg)
 
 	for (b = 0; b < GDP_NODE_NB_BANK; b++) {
 		seq_printf(s, "\n%s[%d].top", sti_plane_to_str(&gdp->plane), b);
-		gdp_node_dump_node(s, gdp->node_list[b].top_field);
+		gdp_node_dump_node(s, gdp->node_list[b].top_field, gdp->type);
 		seq_printf(s, "\n%s[%d].btm", sti_plane_to_str(&gdp->plane), b);
-		gdp_node_dump_node(s, gdp->node_list[b].btm_field);
+		gdp_node_dump_node(s, gdp->node_list[b].btm_field, gdp->type);
 	}
 
 	return 0;
@@ -315,6 +338,16 @@ static struct drm_info_list gdp3_debugfs_files[] = {
 	{ "gdp3_node", gdp_node_dbg_show, 0, NULL },
 };
 
+static struct drm_info_list gdp4_debugfs_files[] = {
+	{ "gdp4", gdp_dbg_show, 0, NULL },
+	{ "gdp4_node", gdp_node_dbg_show, 0, NULL },
+};
+
+static struct drm_info_list gdp5_debugfs_files[] = {
+	{ "gdp5", gdp_dbg_show, 0, NULL },
+	{ "gdp5_node", gdp_node_dbg_show, 0, NULL },
+};
+
 static int gdp_debugfs_init(struct sti_gdp *gdp, struct drm_minor *minor)
 {
 	unsigned int i;
@@ -338,6 +371,14 @@ static int gdp_debugfs_init(struct sti_gdp *gdp, struct drm_minor *minor)
 		gdp_debugfs_files = gdp3_debugfs_files;
 		nb_files = ARRAY_SIZE(gdp3_debugfs_files);
 		break;
+	case STI_GDP_4:
+		gdp_debugfs_files = gdp4_debugfs_files;
+		nb_files = ARRAY_SIZE(gdp4_debugfs_files);
+		break;
+	case STI_GDP_5:
+		gdp_debugfs_files = gdp5_debugfs_files;
+		nb_files = ARRAY_SIZE(gdp5_debugfs_files);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -397,9 +438,10 @@ static int sti_gdp_get_alpharange(int format)
 static struct sti_gdp_node_list *sti_gdp_get_free_nodes(struct sti_gdp *gdp)
 {
 	int hw_nvn;
+	u32 nvn_off = GAM_OFFSET(NVN, gdp->type);
 	unsigned int i;
 
-	hw_nvn = readl(gdp->regs + GAM_GDP_NVN_OFFSET);
+	hw_nvn = readl(gdp->regs + nvn_off);
 	if (!hw_nvn)
 		goto end;
 
@@ -429,9 +471,10 @@ static
 struct sti_gdp_node_list *sti_gdp_get_current_nodes(struct sti_gdp *gdp)
 {
 	int hw_nvn;
+	u32 nvn_off = GAM_OFFSET(NVN, gdp->type);
 	unsigned int i;
 
-	hw_nvn = readl(gdp->regs + GAM_GDP_NVN_OFFSET);
+	hw_nvn = readl(gdp->regs + nvn_off);
 	if (!hw_nvn)
 		goto end;
 
@@ -456,13 +499,14 @@ struct sti_gdp_node_list *sti_gdp_get_current_nodes(struct sti_gdp *gdp)
 static void sti_gdp_disable(struct sti_gdp *gdp)
 {
 	unsigned int i;
+	u32 ppt_off = GAM_OFFSET_U32(PPT, gdp->type);
 
 	DRM_DEBUG_DRIVER("%s\n", sti_plane_to_str(&gdp->plane));
 
 	/* Set the nodes as 'to be ignored on mixer' */
 	for (i = 0; i < GDP_NODE_NB_BANK; i++) {
-		gdp->node_list[i].top_field->gam_gdp_ppt |= GAM_GDP_PPT_IGNORE;
-		gdp->node_list[i].btm_field->gam_gdp_ppt |= GAM_GDP_PPT_IGNORE;
+		gdp->node_list[i].top_field[ppt_off] |= GAM_GDP_PPT_IGNORE;
+		gdp->node_list[i].btm_field[ppt_off] |= GAM_GDP_PPT_IGNORE;
 	}
 
 	if (sti_vtg_unregister_client(gdp->vtg, &gdp->vtg_field_nb))
@@ -519,11 +563,16 @@ static void sti_gdp_init(struct sti_gdp *gdp)
 	struct device_node *np = gdp->dev->of_node;
 	dma_addr_t dma_addr;
 	void *base;
-	unsigned int i, size;
+	unsigned int i, size, gdp_node_size;
+
+	/* Check the type of GDP */
+	if (gdp->type == STI_GDP_TYPE_GDP)
+		gdp_node_size = GAM_GDP_NODE_SIZE;
+	else
+		gdp_node_size = GAM_GDPPLUS_NODE_SIZE;
 
 	/* Allocate all the nodes within a single memory page */
-	size = sizeof(struct sti_gdp_node) *
-	    GDP_NODE_PER_FIELD * GDP_NODE_NB_BANK;
+	size = gdp_node_size * GDP_NODE_PER_FIELD * GDP_NODE_NB_BANK;
 	base = dma_alloc_wc(gdp->dev, size, &dma_addr, GFP_KERNEL);
 
 	if (!base) {
@@ -541,8 +590,8 @@ static void sti_gdp_init(struct sti_gdp *gdp)
 		gdp->node_list[i].top_field_paddr = dma_addr;
 
 		DRM_DEBUG_DRIVER("node[%d].top_field=%p\n", i, base);
-		base += sizeof(struct sti_gdp_node);
-		dma_addr += sizeof(struct sti_gdp_node);
+		base += gdp_node_size;
+		dma_addr += gdp_node_size;
 
 		if (dma_addr & 0xF) {
 			DRM_ERROR("Mem alignment failed\n");
@@ -551,8 +600,8 @@ static void sti_gdp_init(struct sti_gdp *gdp)
 		gdp->node_list[i].btm_field = base;
 		gdp->node_list[i].btm_field_paddr = dma_addr;
 		DRM_DEBUG_DRIVER("node[%d].btm_field=%p\n", i, base);
-		base += sizeof(struct sti_gdp_node);
-		dma_addr += sizeof(struct sti_gdp_node);
+		base += gdp_node_size;
+		dma_addr += gdp_node_size;
 	}
 
 	if (of_device_is_compatible(np, "st,stih407-compositor")) {
@@ -717,7 +766,7 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 	struct drm_gem_dma_object *dma_obj;
 	struct sti_gdp_node_list *list;
 	struct sti_gdp_node_list *curr_list;
-	struct sti_gdp_node *top_field, *btm_field;
+	u32 *top_field, *btm_field;
 	u32 dma_updated_top;
 	u32 dma_updated_btm;
 	int format;
@@ -771,12 +820,12 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 		sti_plane_to_str(plane), top_field, btm_field);
 
 	/* build the top field */
-	top_field->gam_gdp_agc = GAM_GDP_AGC_FULL_RANGE;
-	top_field->gam_gdp_ctl = WAIT_NEXT_VSYNC;
+	top_field[GAM_OFFSET_U32(AGC, gdp->type)] = GAM_GDP_AGC_FULL_RANGE;
+	top_field[GAM_OFFSET_U32(CTL, gdp->type)] = WAIT_NEXT_VSYNC;
 	format = sti_gdp_fourcc2format(fb->format->format);
-	top_field->gam_gdp_ctl |= format;
-	top_field->gam_gdp_ctl |= sti_gdp_get_alpharange(format);
-	top_field->gam_gdp_ppt &= ~GAM_GDP_PPT_IGNORE;
+	top_field[GAM_OFFSET_U32(CTL, gdp->type)] |= format;
+	top_field[GAM_OFFSET_U32(CTL, gdp->type)] |= sti_gdp_get_alpharange(format);
+	top_field[GAM_OFFSET_U32(PPT, gdp->type)] &= ~GAM_GDP_PPT_IGNORE;
 
 	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 
@@ -786,9 +835,9 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 
 	/* pixel memory location */
 	bpp = fb->format->cpp[0];
-	top_field->gam_gdp_pml = (u32) dma_obj->dma_addr + fb->offsets[0];
-	top_field->gam_gdp_pml += src_x * bpp;
-	top_field->gam_gdp_pml += src_y * fb->pitches[0];
+	top_field[GAM_OFFSET_U32(PML, gdp->type)] = (u32)dma_obj->dma_addr + fb->offsets[0];
+	top_field[GAM_OFFSET_U32(PML, gdp->type)] += src_x * bpp;
+	top_field[GAM_OFFSET_U32(PML, gdp->type)] += src_y * fb->pitches[0];
 
 	/* output parameters (clamped / cropped) */
 	dst_w = sti_gdp_get_dst(gdp->dev, dst_w, src_w);
@@ -797,23 +846,25 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 	yds = sti_vtg_get_line_number(*mode, dst_y + dst_h - 1);
 	xdo = sti_vtg_get_pixel_number(*mode, dst_x);
 	xds = sti_vtg_get_pixel_number(*mode, dst_x + dst_w - 1);
-	top_field->gam_gdp_vpo = (ydo << 16) | xdo;
-	top_field->gam_gdp_vps = (yds << 16) | xds;
+	top_field[GAM_OFFSET_U32(VPO, gdp->type)] = (ydo << 16) | xdo;
+	top_field[GAM_OFFSET_U32(VPS, gdp->type)] = (yds << 16) | xds;
 
 	/* input parameters */
 	src_w = dst_w;
-	top_field->gam_gdp_pmp = fb->pitches[0];
-	top_field->gam_gdp_size = src_h << 16 | src_w;
+	top_field[GAM_OFFSET_U32(PMP, gdp->type)] = fb->pitches[0];
+	top_field[GAM_OFFSET_U32(SIZE, gdp->type)] = src_h << 16 | src_w;
 
 	/* Same content and chained together */
-	memcpy(btm_field, top_field, sizeof(*btm_field));
-	top_field->gam_gdp_nvn = list->btm_field_paddr;
-	btm_field->gam_gdp_nvn = list->top_field_paddr;
+	memcpy(btm_field, top_field,
+	       gdp->type == STI_GDP_TYPE_GDP ?
+	       GAM_GDP_NODE_SIZE : GAM_GDPPLUS_NODE_SIZE);
+	top_field[GAM_OFFSET_U32(NVN, gdp->type)] = list->btm_field_paddr;
+	btm_field[GAM_OFFSET_U32(NVN, gdp->type)] = list->top_field_paddr;
 
 	/* Interlaced mode */
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
-		btm_field->gam_gdp_pml = top_field->gam_gdp_pml +
-					 fb->pitches[0];
+		btm_field[GAM_OFFSET_U32(PML, gdp->type)] =
+			top_field[GAM_OFFSET_U32(PML, gdp->type)] + fb->pitches[0];
 
 	/* Update the NVN field of the 'right' field of the current GDP node
 	 * (being used by the HW) with the address of the updated ('free') top
@@ -829,10 +880,10 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 	dma_updated_btm = list->btm_field_paddr;
 
 	dev_dbg(gdp->dev, "Current NVN:0x%X\n",
-		readl(gdp->regs + GAM_GDP_NVN_OFFSET));
+		readl(gdp->regs + GAM_OFFSET(NVN, gdp->type)));
 	dev_dbg(gdp->dev, "Posted buff: %lx current buff: %x\n",
 		(unsigned long) dma_obj->dma_addr,
-		readl(gdp->regs + GAM_GDP_PML_OFFSET));
+		readl(gdp->regs + GAM_OFFSET(PML, gdp->type)));
 
 	if (!curr_list) {
 		/* First update or invalid node should directly write in the
@@ -842,7 +893,7 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 
 		writel(gdp->is_curr_top ?
 				dma_updated_btm : dma_updated_top,
-				gdp->regs + GAM_GDP_NVN_OFFSET);
+				gdp->regs + GAM_OFFSET(NVN, gdp->type));
 		goto end;
 	}
 
@@ -851,15 +902,15 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 			/* Do not update in the middle of the frame, but
 			 * postpone the update after the bottom field has
 			 * been displayed */
-			curr_list->btm_field->gam_gdp_nvn = dma_updated_top;
+			curr_list->btm_field[GAM_OFFSET_U32(NVN, gdp->type)] = dma_updated_top;
 		} else {
 			/* Direct update to avoid one frame delay */
 			writel(dma_updated_top,
-			       gdp->regs + GAM_GDP_NVN_OFFSET);
+			       gdp->regs + GAM_OFFSET(NVN, gdp->type));
 		}
 	} else {
 		/* Direct update for progressive to avoid one frame delay */
-		writel(dma_updated_top, gdp->regs + GAM_GDP_NVN_OFFSET);
+		writel(dma_updated_top, gdp->regs + GAM_OFFSET(NVN, gdp->type));
 	}
 
 end:
@@ -914,7 +965,7 @@ static const struct drm_plane_funcs sti_gdp_plane_helpers_funcs = {
 };
 
 struct drm_plane *sti_gdp_create(struct drm_device *drm_dev,
-				 struct device *dev, int desc,
+				 struct device *dev, enum sti_gdp_type gdp_type, int desc,
 				 void __iomem *baseaddr,
 				 unsigned int possible_crtcs,
 				 enum drm_plane_type type)
@@ -932,6 +983,7 @@ struct drm_plane *sti_gdp_create(struct drm_device *drm_dev,
 	gdp->regs = baseaddr;
 	gdp->plane.desc = desc;
 	gdp->plane.status = STI_PLANE_DISABLED;
+	gdp->type = gdp_type;
 
 	gdp->vtg_field_nb.notifier_call = sti_gdp_field_cb;
 
diff --git a/drivers/gpu/drm/sti/sti_gdp.h b/drivers/gpu/drm/sti/sti_gdp.h
index deb07e34173d..b1f06a0c5c37 100644
--- a/drivers/gpu/drm/sti/sti_gdp.h
+++ b/drivers/gpu/drm/sti/sti_gdp.h
@@ -16,8 +16,14 @@
 struct drm_device;
 struct device;
 
+enum sti_gdp_type {
+	STI_GDP_TYPE_GDP,
+	STI_GDP_TYPE_GDPPLUS,
+};
+
 struct drm_plane *sti_gdp_create(struct drm_device *drm_dev,
-				 struct device *dev, int desc,
+				 struct device *dev, enum sti_gdp_type gdp_type,
+				 int desc,
 				 void __iomem *baseaddr,
 				 unsigned int possible_crtcs,
 				 enum drm_plane_type type);
-- 
2.34.1

