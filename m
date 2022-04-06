Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE34F5803
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969B210E05F;
	Wed,  6 Apr 2022 08:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 357 seconds by postgrey-1.36 at gabe;
 Wed, 06 Apr 2022 08:46:09 UTC
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA7A10E55F
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 08:46:09 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 05802201FAA;
 Wed,  6 Apr 2022 10:40:17 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 69486201E9B;
 Wed,  6 Apr 2022 10:40:16 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 4E5FA183AC8A; Wed,  6 Apr 2022 16:40:14 +0800 (+08)
From: Sandor.yu@nxp.com
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com
Subject: [PATCH v1 4/5] drm: bridge: dw_hdmi: add reset function for PHY GEN1
Date: Wed,  6 Apr 2022 16:48:36 +0800
Message-Id: <800262112191a720639ba321be18f0926d4e1d2a.1649230434.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1649230434.git.Sandor.yu@nxp.com>
References: <cover.1649230434.git.Sandor.yu@nxp.com>
In-Reply-To: <cover.1649230434.git.Sandor.yu@nxp.com>
References: <cover.1649230434.git.Sandor.yu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, amuel@sholland.org,
 cai.huoqing@linux.dev, maxime@cerno.tech, hverkuil-cisco@xs4all.nl
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

PHY reset register(MC_PHYRSTZ) active high reset control for PHY GEN2,
and active low reset control for PHY GEN1.

Rename function dw_hdmi_phy_reset to dw_hdmi_phy_gen2_reset.
Add dw_hdmi_phy_gen1_reset function for PHY GEN1.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 14 +++++++++++---
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c    |  2 +-
 include/drm/bridge/dw_hdmi.h              |  4 +++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index c7b11582529e..c6e701acd416 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1365,13 +1365,21 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
 			 HDMI_PHY_CONF0_SELDIPIF_MASK);
 }
 
-void dw_hdmi_phy_reset(struct dw_hdmi *hdmi)
+void dw_hdmi_phy_gen1_reset(struct dw_hdmi *hdmi)
+{
+	/* PHY reset. The reset signal is active low on Gen1 PHYs. */
+	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
+	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen1_reset);
+
+void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi)
 {
 	/* PHY reset. The reset signal is active high on Gen2 PHYs. */
 	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
 	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
 }
-EXPORT_SYMBOL_GPL(dw_hdmi_phy_reset);
+EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen2_reset);
 
 void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address)
 {
@@ -1525,7 +1533,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
 	if (phy->has_svsret)
 		dw_hdmi_phy_enable_svsret(hdmi, 1);
 
-	dw_hdmi_phy_reset(hdmi);
+	dw_hdmi_phy_gen2_reset(hdmi);
 
 	hdmi_writeb(hdmi, HDMI_MC_HEACPHY_RST_ASSERT, HDMI_MC_HEACPHY_RST);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
index 5e2b0175df36..2860e6bff8b7 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
@@ -135,7 +135,7 @@ static int sun8i_hdmi_phy_config_a83t(struct dw_hdmi *hdmi,
 	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
 	dw_hdmi_phy_gen2_pddq(hdmi, 1);
 
-	dw_hdmi_phy_reset(hdmi);
+	dw_hdmi_phy_gen2_reset(hdmi);
 
 	dw_hdmi_phy_gen2_pddq(hdmi, 0);
 
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 2a1f85f9a8a3..70082f80a8c8 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -187,9 +187,11 @@ void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address);
 void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
 			   unsigned char addr);
 
+void dw_hdmi_phy_gen1_reset(struct dw_hdmi *hdmi);
+
 void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable);
 void dw_hdmi_phy_gen2_txpwron(struct dw_hdmi *hdmi, u8 enable);
-void dw_hdmi_phy_reset(struct dw_hdmi *hdmi);
+void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi);
 
 enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
 					       void *data);
-- 
2.25.1

