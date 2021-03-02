Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA5232A5CC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 17:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AD46E1F7;
	Tue,  2 Mar 2021 16:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C726E1FB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 16:24:15 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id H7oZlNjwSOruFH7ojlAWNn; Tue, 02 Mar 2021 17:24:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1614702253; bh=OaJqdVTBPrMHS8u/9CNzq/j1aIrPc080TZS3zZHbMb8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
 b=hdu3/d/F5gOs+r20PkYXhUWWeiucJZ1PIm2XWsfDCb3UiRfWANcx2ve4KZu6s7yhX
 cbQ4DtWXCjq26F1qIrPQD6RVh2OlnYgklsOIVHB3iqZ9P77EYEGLSIPOsSbPBWcAU2
 tb+QAVNzui0WRFhWqRP4oT7NROjoHysacOIbJsgzoAyvpZFpTEjZ0owb6TbHC02by0
 sKr6MrNuZTRbo/aRwCJvVD/1gtzyg+amQ3MC04QScF2z0g2j91bgfBL7cFVPKarKWN
 iVBo9WlXIXu740+MAzZWvXSUGshitvQLSEYnXzUIefpMYpYZss2RHnZOfgsP0iC4F0
 G9EzLWT6bpMOg==
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv2 2/6] drm/omapdrm/dss/hdmi4: switch to the connector bridge
 ops
Date: Tue,  2 Mar 2021 17:23:59 +0100
Message-Id: <20210302162403.983585-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfH1WztQd5puTGwx9jr7Qnb4a6LSVKsuJG9LXZaF/19eoi/zr0o+zEmykIrlunj4rGbDj3oLAAcpap3fmA4yi700pShKgsJ36UmKM8zK0vFiMwowA0McA
 p0X7zcRF1f0Bt+0TiMwZV69oE5p+edWDprPpFmNQSTufy0OnE/pQhC92xNtsLnqWVDfoZxiFtpAEvcC7/+KkUrstDwDV/M1SeLECy7LVFrVhs5vUwU4KnGGZ
 wNPMe4tXVnFU+jl0wKuYsOHJ7Cuozz3/FIm0BZtB3U74UIwhzitCO3SxTmRI7KJ8IlGcpVvNqtsjY3Gker1BwIfleBPvbm+oBjKwM97ip75SiLhsR/j6wuoy
 FSuLKjGs6uTuwyNBnpk965gvV2ayGJirHEoBuzo3qRK4kJPO50FFGWqbcWHauP12Of9frF5+Uq6vUeXHjagZry7XZKFS7H5XgG5IlIqkKWNVaiwNc7MO1hyj
 LVjo6Z5G+y/8Rv+pCmMoSJaVlYfFnG5ksHrCQHLCcaG8Rp/bCtrjct65LZc=
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the new connector_attach/detach bridge ops. This makes it
possible to associate a CEC adapter with a drm connector, which helps
userspace determine which cec device node belongs to which drm connector.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c     | 27 +++++++++++++++++--------
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c |  9 ++++++---
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h |  7 ++++---
 3 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 35b750cebaeb..c387156a5cbb 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -482,6 +482,22 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 	return edid;
 }
 
+static void hdmi4_bridge_connector_attach(struct drm_bridge *bridge,
+					  struct drm_connector *conn)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	hdmi4_cec_init(hdmi->pdev, &hdmi->core, &hdmi->wp, conn);
+}
+
+static void hdmi4_bridge_connector_detach(struct drm_bridge *bridge,
+					  struct drm_connector *conn)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	hdmi4_cec_uninit(&hdmi->core);
+}
+
 static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 	.attach = hdmi4_bridge_attach,
 	.mode_set = hdmi4_bridge_mode_set,
@@ -492,6 +508,8 @@ static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 	.atomic_disable = hdmi4_bridge_disable,
 	.hpd_notify = hdmi4_bridge_hpd_notify,
 	.get_edid = hdmi4_bridge_get_edid,
+	.connector_attach = hdmi4_bridge_connector_attach,
+	.connector_detach = hdmi4_bridge_connector_detach,
 };
 
 static void hdmi4_bridge_init(struct omap_hdmi *hdmi)
@@ -647,14 +665,10 @@ static int hdmi4_bind(struct device *dev, struct device *master, void *data)
 	if (r)
 		goto err_runtime_put;
 
-	r = hdmi4_cec_init(hdmi->pdev, &hdmi->core, &hdmi->wp);
-	if (r)
-		goto err_pll_uninit;
-
 	r = hdmi_audio_register(hdmi);
 	if (r) {
 		DSSERR("Registering HDMI audio failed\n");
-		goto err_cec_uninit;
+		goto err_pll_uninit;
 	}
 
 	hdmi->debugfs = dss_debugfs_create_file(dss, "hdmi", hdmi_dump_regs,
@@ -664,8 +678,6 @@ static int hdmi4_bind(struct device *dev, struct device *master, void *data)
 
 	return 0;
 
-err_cec_uninit:
-	hdmi4_cec_uninit(&hdmi->core);
 err_pll_uninit:
 	hdmi_pll_uninit(&hdmi->pll);
 err_runtime_put:
@@ -682,7 +694,6 @@ static void hdmi4_unbind(struct device *dev, struct device *master, void *data)
 	if (hdmi->audio_pdev)
 		platform_device_unregister(hdmi->audio_pdev);
 
-	hdmi4_cec_uninit(&hdmi->core);
 	hdmi_pll_uninit(&hdmi->pll);
 }
 
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
index 43592c1cf081..80ec52c9c846 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
@@ -335,10 +335,10 @@ void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
 }
 
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
-		  struct hdmi_wp_data *wp)
+		   struct hdmi_wp_data *wp, struct drm_connector *conn)
 {
-	const u32 caps = CEC_CAP_TRANSMIT | CEC_CAP_LOG_ADDRS |
-			 CEC_CAP_PASSTHROUGH | CEC_CAP_RC;
+	const u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO;
+	struct cec_connector_info conn_info;
 	int ret;
 
 	core->adap = cec_allocate_adapter(&hdmi_cec_adap_ops, core,
@@ -346,6 +346,8 @@ int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
 	ret = PTR_ERR_OR_ZERO(core->adap);
 	if (ret < 0)
 		return ret;
+	cec_fill_conn_info_from_drm(&conn_info, conn);
+	cec_s_conn_info(core->adap, &conn_info);
 	core->wp = wp;
 
 	/* Disable clock initially, hdmi_cec_adap_enable() manages it */
@@ -354,6 +356,7 @@ int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
 	ret = cec_register_adapter(core->adap, &pdev->dev);
 	if (ret < 0) {
 		cec_delete_adapter(core->adap);
+		core->adap = NULL;
 		return ret;
 	}
 	return 0;
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
index 0292337c97cc..b59a54c3040e 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h
@@ -29,7 +29,7 @@ struct platform_device;
 void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa);
 void hdmi4_cec_irq(struct hdmi_core_data *core);
 int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
-		  struct hdmi_wp_data *wp);
+		   struct hdmi_wp_data *wp, struct drm_connector *conn);
 void hdmi4_cec_uninit(struct hdmi_core_data *core);
 #else
 static inline void hdmi4_cec_set_phys_addr(struct hdmi_core_data *core, u16 pa)
@@ -41,8 +41,9 @@ static inline void hdmi4_cec_irq(struct hdmi_core_data *core)
 }
 
 static inline int hdmi4_cec_init(struct platform_device *pdev,
-				struct hdmi_core_data *core,
-				struct hdmi_wp_data *wp)
+				 struct hdmi_core_data *core,
+				 struct hdmi_wp_data *wp,
+				 struct drm_connector *conn)
 {
 	return 0;
 }
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
