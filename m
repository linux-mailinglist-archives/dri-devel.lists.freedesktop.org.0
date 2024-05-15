Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE9B8C6442
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 11:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A8F10E527;
	Wed, 15 May 2024 09:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="MmL39VOY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B240110E067
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 09:51:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44F9pgPE050666;
 Wed, 15 May 2024 04:51:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1715766702;
 bh=QEDRLbkhxvtAigQy5Rs5N47y14IQjDB/BRmR0H8DoJo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=MmL39VOYy+l7fLyQ59epnRm/k/5ZR2tVEd6kETXxVtFpDRTvfCZT98RFxq/bYRT5A
 s9GrOF94kRsXMGaALa2H5Yay/0bmHq6qQXFGoGAJDSeFPjVDaxW+niw1OE+T3hpbbD
 ryhrdNZEAvpEwfrzthiWTN8zkSp6rH8piwUglWZs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44F9pgeh057794
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 15 May 2024 04:51:42 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 15
 May 2024 04:51:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 15 May 2024 04:51:41 -0500
Received: from localhost (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44F9pf5t125411;
 Wed, 15 May 2024 04:51:41 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>, Thierry Reding
 <thierry.reding@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Devicetree List
 <devicetree@vger.kernel.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [PATCH v3 4/6] drm/panel: simple: Add Lincoln Tech Sol LCD185-101CT
 panel
Date: Wed, 15 May 2024 15:21:31 +0530
Message-ID: <20240515095133.745492-5-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515095133.745492-1-a-bhatia1@ti.com>
References: <20240515095133.745492-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for Lincoln Technology Solutions LCD185-101CT, 10.1",
1920x1200, 8-bit TFT LCD with LVDS interface, LED backlight and PCAP
touch support (Goodix GT928).

[0]: Panel Datasheet
https://lincolntechsolutions.com/wp-content/uploads/2023/04/LCD185-101CTL1ARNTT_DS_R1.3.pdf

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dcb6d0b6ced0..10e974bffd28 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2870,6 +2870,35 @@ static const struct panel_desc lg_lb070wv8 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode lincolntech_lcd185_101ct_mode = {
+	.clock = 155127,
+	.hdisplay = 1920,
+	.hsync_start = 1920 + 128,
+	.hsync_end = 1920 + 128 + 20,
+	.htotal = 1920 + 128 + 20 + 12,
+	.vdisplay = 1200,
+	.vsync_start = 1200 + 19,
+	.vsync_end = 1200 + 19 + 4,
+	.vtotal = 1200 + 19 + 4 + 20,
+};
+
+static const struct panel_desc lincolntech_lcd185_101ct = {
+	.modes = &lincolntech_lcd185_101ct_mode,
+	.bpc = 8,
+	.num_modes = 1,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.delay = {
+		.prepare = 50,
+		.disable = 50,
+	},
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing logictechno_lt161010_2nh_timing = {
 	.pixelclock = { 26400000, 33300000, 46800000 },
 	.hactive = { 800, 800, 800 },
@@ -4644,6 +4673,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "lg,lb070wv8",
 		.data = &lg_lb070wv8,
+	}, {
+		.compatible = "lincolntech,lcd185-101ct",
+		.data = &lincolntech_lcd185_101ct,
 	}, {
 		.compatible = "logicpd,type28",
 		.data = &logicpd_type_28,
-- 
2.34.1

