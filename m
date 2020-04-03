Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E409B19E4F3
	for <lists+dri-devel@lfdr.de>; Sat,  4 Apr 2020 14:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859556E1BE;
	Sat,  4 Apr 2020 12:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910856EC13
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 15:37:17 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ED5CA40883;
 Fri,  3 Apr 2020 15:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585928236; bh=XfWRK5ci1g92QcGgqp5/G8r/T/7SvyOdfC2oNaCPKe0=;
 h=From:To:Cc:Subject:Date:From;
 b=bBGZO4VKyf215fwjJDUh8SdD3FCsezzyNP6Vgowz+0hUZrToMCRZNa0dXvrv2LAU8
 TjKd/Q14rp5Cj+n9oP0RQHXEbCnzmk/++iKW/cgFRcIa+vBHjwlwIx1ctgbtjjY1tE
 8TfKf+NNdQRgXI3HvlmqjgYEAC3WQlDjs/gAcY1SPjrABeg7vRS9jCHk3EEksp81z9
 ei2tp6KvFFSLTK25G4XqZ5EPela3T+LhmDyl1XYouSg/YQ9q0Rw7bsE5DLL3N8G0g9
 JQTyuwpFJT7xbSmvRcKZhBKlHwZ5RupMVj87jig2WkhfKdkdb5tnvVeYotBlY/bCLO
 Jx3261hbfUBYg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 63F43A005C;
 Fri,  3 Apr 2020 15:37:11 +0000 (UTC)
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: yannick.fertre@st.com, philippe.cornu@st.com, benjamin.gaignard@st.com,
 airlied@linux.ie, daniel@ffwll.ch, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: dw-mipi-dsi.c: Add VPG runtime config through
 debugfs
Date: Fri,  3 Apr 2020 17:36:46 +0200
Message-Id: <a5aa527c2cd66b55b4246b9c122c702a279b37f0.1585928032.git.angelo.ribeiro@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 04 Apr 2020 12:45:43 +0000
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Joao Pinto <Joao.Pinto@synopsys.com>,
 Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the video pattern generator (VPG) BER pattern mode and
configuration in runtime.

This enables using the debugfs interface to manipulate the VPG after
the pipeline is set.
Also, enables the usage of the VPG BER pattern.

Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Joao Pinto <jpinto@synopsys.com>
Cc: Jose Abreu <jose.abreu@synopsys.com>
Signed-off-by: Angelo Ribeiro <angelo.ribeiro@synopsys.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 97 ++++++++++++++++++++++++---
 1 file changed, 89 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index b18351b..512c922 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -221,6 +221,21 @@
 #define PHY_STATUS_TIMEOUT_US		10000
 #define CMD_PKT_STATUS_TIMEOUT_US	20000
 
+#ifdef CONFIG_DEBUG_FS
+#define VPG_DEFS(name, dsi) \
+	((void __force *)&((*dsi).vpg_defs.name))
+
+#define REGISTER(name, mask, dsi) \
+	{ #name, VPG_DEFS(name, dsi), mask, dsi }
+
+struct debugfs_entries {
+	const char				*name;
+	bool					*reg;
+	u32					mask;
+	struct dw_mipi_dsi			*dsi;
+};
+#endif /* CONFIG_DEBUG_FS */
+
 struct dw_mipi_dsi {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
@@ -238,9 +253,12 @@ struct dw_mipi_dsi {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
-
-	bool vpg;
-	bool vpg_horizontal;
+	struct debugfs_entries *debugfs_vpg;
+	struct {
+		bool vpg;
+		bool vpg_horizontal;
+		bool vpg_ber_pattern;
+	} vpg_defs;
 #endif /* CONFIG_DEBUG_FS */
 
 	struct dw_mipi_dsi *master; /* dual-dsi master ptr */
@@ -530,9 +548,11 @@ static void dw_mipi_dsi_video_mode_config(struct dw_mipi_dsi *dsi)
 		val |= VID_MODE_TYPE_NON_BURST_SYNC_EVENTS;
 
 #ifdef CONFIG_DEBUG_FS
-	if (dsi->vpg) {
+	if (dsi->vpg_defs.vpg) {
 		val |= VID_MODE_VPG_ENABLE;
-		val |= dsi->vpg_horizontal ? VID_MODE_VPG_HORIZONTAL : 0;
+		val |= dsi->vpg_defs.vpg_horizontal ?
+		       VID_MODE_VPG_HORIZONTAL : 0;
+		val |= dsi->vpg_defs.vpg_ber_pattern ? VID_MODE_VPG_MODE : 0;
 	}
 #endif /* CONFIG_DEBUG_FS */
 
@@ -961,6 +981,68 @@ static const struct drm_bridge_funcs dw_mipi_dsi_bridge_funcs = {
 
 #ifdef CONFIG_DEBUG_FS
 
+ssize_t dw_mipi_dsi_debugfs_write(void *data, u64 val)
+{
+	struct debugfs_entries *vpg = data;
+	struct dw_mipi_dsi *dsi;
+	u32 mode_cfg;
+
+	if (!vpg)
+		return -ENODEV;
+
+	dsi = vpg->dsi;
+
+	*vpg->reg = (bool)val;
+
+	mode_cfg = dsi_read(dsi, DSI_VID_MODE_CFG);
+
+	if (*vpg->reg)
+		mode_cfg |= vpg->mask;
+	else
+		mode_cfg &= ~vpg->mask;
+
+	dsi_write(dsi, DSI_VID_MODE_CFG, mode_cfg);
+
+	return 0;
+}
+
+ssize_t dw_mipi_dsi_debugfs_show(void *data, u64 *val)
+{
+	struct debugfs_entries *vpg = data;
+
+	if (!vpg)
+		return -ENODEV;
+
+	*val = *vpg->reg;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_x32, dw_mipi_dsi_debugfs_show,
+			 dw_mipi_dsi_debugfs_write, "%llu\n");
+
+static void debugfs_create_files(void *data)
+{
+	struct dw_mipi_dsi *dsi = data;
+	struct debugfs_entries debugfs[] = {
+		REGISTER(vpg, VID_MODE_VPG_ENABLE, dsi),
+		REGISTER(vpg_horizontal, VID_MODE_VPG_HORIZONTAL, dsi),
+		REGISTER(vpg_ber_pattern, VID_MODE_VPG_MODE, dsi),
+	};
+	int i;
+
+	dsi->debugfs_vpg = kmalloc(sizeof(debugfs), GFP_KERNEL);
+	if (!dsi->debugfs_vpg)
+		return;
+
+	memcpy(dsi->debugfs_vpg, debugfs, sizeof(debugfs));
+
+	for (i = 0; i < ARRAY_SIZE(debugfs); i++)
+		debugfs_create_file(dsi->debugfs_vpg[i].name, 0644,
+				    dsi->debugfs, &dsi->debugfs_vpg[i],
+				    &fops_x32);
+}
+
 static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
 {
 	dsi->debugfs = debugfs_create_dir(dev_name(dsi->dev), NULL);
@@ -969,14 +1051,13 @@ static void dw_mipi_dsi_debugfs_init(struct dw_mipi_dsi *dsi)
 		return;
 	}
 
-	debugfs_create_bool("vpg", 0660, dsi->debugfs, &dsi->vpg);
-	debugfs_create_bool("vpg_horizontal", 0660, dsi->debugfs,
-			    &dsi->vpg_horizontal);
+	debugfs_create_files(dsi);
 }
 
 static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi)
 {
 	debugfs_remove_recursive(dsi->debugfs);
+	kfree(dsi->debugfs_vpg);
 }
 
 #else
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
