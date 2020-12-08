Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555F02D2AEA
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774426E95D;
	Tue,  8 Dec 2020 12:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC276E974
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:30:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CUk4N067369;
 Tue, 8 Dec 2020 06:30:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607430646;
 bh=FUQDAhBDKj6vFDMkTHn4HVjvTq5vQa7CU914GKl/Ozk=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=niTENnBGDd/MPwqXrFcKZOqpvX7VkwTPziBpnpLxxeCri1ABiou6jwPnf/jmcVi8l
 Dcsk1k0y7XU2BH52HZbqk/yaGjgdUl/4H8Sq2WyKRwQiTOP7fS6KDk7ARXvrI1lGIJ
 PgzH5J+C43qx7jdchF+/0PH7pivU+4iXJsHTl39g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CUkcg014806
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 06:30:46 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:30:45 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:30:45 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjd095068;
 Tue, 8 Dec 2020 06:30:43 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 25/29] drm/omap: dsi: split video mode enable/disable into
 separate func
Date: Tue, 8 Dec 2020 14:28:51 +0200
Message-ID: <20201208122855.254819-26-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up the code by separating video-mode enable/disable code into
functions of their own.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 101 +++++++++++++++++-------------
 1 file changed, 57 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index c32884f167b8..71de6119d2de 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -3207,12 +3207,61 @@ static int dsi_configure_pins(struct dsi_data *dsi,
 	return 0;
 }
 
-static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
+static int dsi_enable_video_mode(struct dsi_data *dsi, int vc)
 {
-	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
 	u8 data_type;
 	u16 word_count;
+
+	switch (dsi->pix_fmt) {
+	case MIPI_DSI_FMT_RGB888:
+		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
+		break;
+	case MIPI_DSI_FMT_RGB666:
+		data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
+		break;
+	case MIPI_DSI_FMT_RGB666_PACKED:
+		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
+		break;
+	case MIPI_DSI_FMT_RGB565:
+		data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dsi_if_enable(dsi, false);
+	dsi_vc_enable(dsi, vc, false);
+
+	/* MODE, 1 = video mode */
+	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 4, 4);
+
+	word_count = DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
+
+	dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, data_type,
+			word_count, 0);
+
+	dsi_vc_enable(dsi, vc, true);
+	dsi_if_enable(dsi, true);
+
+	return 0;
+}
+
+static void dsi_disable_video_mode(struct dsi_data *dsi, int vc)
+{
+	dsi_if_enable(dsi, false);
+	dsi_vc_enable(dsi, vc, false);
+
+	/* MODE, 0 = command mode */
+	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 0, 4, 4);
+
+	dsi_vc_enable(dsi, vc, true);
+	dsi_if_enable(dsi, true);
+}
+
+static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
+{
+	struct dsi_data *dsi = to_dsi_data(dssdev);
 	int r;
 
 	r = dsi_init_dispc(dsi);
@@ -3222,37 +3271,9 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
 	}
 
 	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
-		switch (dsi->pix_fmt) {
-		case MIPI_DSI_FMT_RGB888:
-			data_type = MIPI_DSI_PACKED_PIXEL_STREAM_24;
-			break;
-		case MIPI_DSI_FMT_RGB666:
-			data_type = MIPI_DSI_PIXEL_STREAM_3BYTE_18;
-			break;
-		case MIPI_DSI_FMT_RGB666_PACKED:
-			data_type = MIPI_DSI_PACKED_PIXEL_STREAM_18;
-			break;
-		case MIPI_DSI_FMT_RGB565:
-			data_type = MIPI_DSI_PACKED_PIXEL_STREAM_16;
-			break;
-		default:
-			r = -EINVAL;
-			goto err_pix_fmt;
-		}
-
-		dsi_if_enable(dsi, false);
-		dsi_vc_enable(dsi, vc, false);
-
-		/* MODE, 1 = video mode */
-		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 4, 4);
-
-		word_count = DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
-
-		dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, data_type,
-				word_count, 0);
-
-		dsi_vc_enable(dsi, vc, true);
-		dsi_if_enable(dsi, true);
+		r = dsi_enable_video_mode(dsi, vc);
+		if (r)
+			goto err_video_mode;
 	}
 
 	r = dss_mgr_enable(&dsi->output);
@@ -3266,7 +3287,7 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
 		dsi_if_enable(dsi, false);
 		dsi_vc_enable(dsi, vc, false);
 	}
-err_pix_fmt:
+err_video_mode:
 	dsi_uninit_dispc(dsi);
 	dev_err(dsi->dev, "failed to enable DSI encoder!\n");
 	return;
@@ -3276,16 +3297,8 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int vc)
 {
 	struct dsi_data *dsi = to_dsi_data(dssdev);
 
-	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
-		dsi_if_enable(dsi, false);
-		dsi_vc_enable(dsi, vc, false);
-
-		/* MODE, 0 = command mode */
-		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 0, 4, 4);
-
-		dsi_vc_enable(dsi, vc, true);
-		dsi_if_enable(dsi, true);
-	}
+	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE)
+		dsi_disable_video_mode(dsi, vc);
 
 	dss_mgr_disable(&dsi->output);
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
