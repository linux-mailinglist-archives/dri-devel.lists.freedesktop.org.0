Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856A976659D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D8D10E666;
	Fri, 28 Jul 2023 07:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177A910E183;
 Fri, 28 Jul 2023 01:12:48 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36S0iVcO008778; Fri, 28 Jul 2023 01:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=KhcCqwVaz3UL4ECXqC1Z980gukwotXZHOchHP5gPpb4=;
 b=TZ5/s8/B1zClwVxUZen/c+oM7CGAMyIlfTDc4GO2B6CLs6kgOAySpAbfBzL8JYPurNtD
 EIGwG9ey4BV1cHcuvvZwqr7EHF6PGrx5P/G7Qzc7mNwM5pDdrprfsuOV75mXQ7oAwtk6
 iMM1qLITLxODDkpgr1uuJKOPT5v3E9dc0wmwu7cJq4W84qcBsRzmzxoCOzUBLIMnK7GO
 mz5VEXXPZhh3CiSYpJateqY7SBxybOTapm+SFmXhsxotP+quD3fpFeO+PQR9PVFexrye
 ON2WZye0uzJzWdcY3DjhjuPkif7+y4wmf+Z6OkuZqt6TKqXl1qLh0lZkdXwFDv1QSkAr tA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s336t48aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 01:12:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36S1CWvk022058
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jul 2023 01:12:32 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 27 Jul 2023 18:12:31 -0700
From: parellan <parellan@quicinc.com>
To: <neil.armstrong@linaro.org>, <sam@ravnborg.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH] drm/panel: Enable DSC and CMD mode for Visionox VTDR6130 panel
Date: Thu, 27 Jul 2023 18:12:15 -0700
Message-ID: <20230728011218.14630-1-parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7hbaKR9C9i608I0ieQIBn3o_E-mVLs7s
X-Proofpoint-GUID: 7hbaKR9C9i608I0ieQIBn3o_E-mVLs7s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280009
X-Mailman-Approved-At: Fri, 28 Jul 2023 07:44:51 +0000
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
Cc: marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org, Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paloma Arellano <quic_parellan@quicinc.com>

Enable display compression (DSC v1.2) and CMD mode for 1080x2400 Visionox
VTDR6130 AMOLED DSI panel. In addition, this patch will set the default
to command mode with DSC enabled.

Note: This patch has only been validated DSC over command mode as DSC over
video mode has never been validated for the MSM driver before.

Depends on: "Add prepare_prev_first flag to Visionox VTDR6130" [1]

[1] https://patchwork.freedesktop.org/series/121337/

Suggested-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 .../gpu/drm/panel/panel-visionox-vtdr6130.c   | 77 ++++++++++++++++++-
 1 file changed, 73 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
index e1363e128e7e..5658d39a3a6b 100644
--- a/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
+++ b/drivers/gpu/drm/panel/panel-visionox-vtdr6130.c
@@ -9,6 +9,7 @@
 #include <linux/of.h>
 
 #include <drm/display/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
@@ -20,7 +21,8 @@ struct visionox_vtdr6130 {
 	struct mipi_dsi_device *dsi;
 	struct gpio_desc *reset_gpio;
 	struct regulator_bulk_data supplies[3];
-	bool prepared;
+	bool prepared, enabled;
+	bool video_mode;
 };
 
 static inline struct visionox_vtdr6130 *to_visionox_vtdr6130(struct drm_panel *panel)
@@ -50,12 +52,18 @@ static int visionox_vtdr6130_on(struct visionox_vtdr6130 *ctx)
 	if (ret)
 		return ret;
 
+	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x01);
 	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
 	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_DISPLAY_BRIGHTNESS, 0x00, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x09);
 	mipi_dsi_dcs_write_seq(dsi, 0x6c, 0x01);
 	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
+	
+	if (ctx->video_mode)
+		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x01);
+	else
+		mipi_dsi_dcs_write_seq(dsi, 0x6f, 0x02);
+
 	mipi_dsi_dcs_write_seq(dsi, 0x70,
 			       0x12, 0x00, 0x00, 0xab, 0x30, 0x80, 0x09, 0x60, 0x04,
 			       0x38, 0x00, 0x28, 0x02, 0x1c, 0x02, 0x1c, 0x02, 0x00,
@@ -214,6 +222,42 @@ static const struct drm_display_mode visionox_vtdr6130_mode = {
 	.height_mm = 157,
 };
 
+static int visionox_vtdr6130_enable(struct drm_panel *panel)
+{
+	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct drm_dsc_picture_parameter_set pps;
+	int ret;
+
+	if (ctx->enabled)
+		return 0;
+
+	if (!dsi->dsc) {
+		dev_err(&dsi->dev, "DSC not attached to DSI\n");
+		return -ENODEV;
+	}
+
+	drm_dsc_pps_payload_pack(&pps, dsi->dsc);
+	ret = mipi_dsi_picture_parameter_set(dsi, &pps);
+	if (ret) {
+		dev_err(&dsi->dev, "Failed to set PPS\n");
+		return ret;
+	}
+
+	ctx->enabled = true;
+
+	return 0;
+}
+
+static int visionox_vtdr6130_disable(struct drm_panel *panel)
+{
+	struct visionox_vtdr6130 *ctx = to_visionox_vtdr6130(panel);
+
+	ctx->enabled = false;
+
+	return 0;
+}
+
 static int visionox_vtdr6130_get_modes(struct drm_panel *panel,
 				       struct drm_connector *connector)
 {
@@ -237,6 +281,8 @@ static const struct drm_panel_funcs visionox_vtdr6130_panel_funcs = {
 	.prepare = visionox_vtdr6130_prepare,
 	.unprepare = visionox_vtdr6130_unprepare,
 	.get_modes = visionox_vtdr6130_get_modes,
+	.enable = visionox_vtdr6130_enable,
+	.disable = visionox_vtdr6130_disable,
 };
 
 static int visionox_vtdr6130_bl_update_status(struct backlight_device *bl)
@@ -269,11 +315,31 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
 	struct visionox_vtdr6130 *ctx;
+	struct drm_dsc_config *dsc;
 	int ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
+	
+	ctx->video_mode = of_property_read_bool(dev->of_node, "enforce-video-mode");
+
+	dsc = devm_kzalloc(dev, sizeof(*dsc), GFP_KERNEL);
+	if (!dsc)
+		return -ENOMEM;
+
+	/* Set DSC params */
+	dsc->dsc_version_major = 0x1;
+	dsc->dsc_version_minor = 0x2;
+
+	dsc->slice_height = 40;
+	dsc->slice_width = 540;
+	dsc->slice_count = 2;
+	dsc->bits_per_component = 8;
+	dsc->bits_per_pixel = 8 << 4;
+	dsc->block_pred_enable = true;
+
+	dsi->dsc = dsc;
 
 	ctx->supplies[0].supply = "vddio";
 	ctx->supplies[1].supply = "vci";
@@ -294,8 +360,11 @@ static int visionox_vtdr6130_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_NO_EOT_PACKET |
-			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
+
+	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	if (ctx->video_mode)
+		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO;
+
 	ctx->panel.prepare_prev_first = true;
 
 	drm_panel_init(&ctx->panel, dev, &visionox_vtdr6130_panel_funcs,
-- 
2.41.0

