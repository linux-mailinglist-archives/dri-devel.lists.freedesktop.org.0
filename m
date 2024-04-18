Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4828A9C3C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:06:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA11113CC0;
	Thu, 18 Apr 2024 14:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="geRVJk7t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC530113CBD
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT1WXVw5ALlXRqEa84bFFojiPG5dR9JPQ8j7RwKdHXyg20MnrQvrv+7JZNtM2TytFNkxApIFrjCPIEhJF71Hav3pXNTr7fv6+/+98R0r/DkziBKGtk9qpBpwxuzHRbw+wCh4BLKJH3b6HPJnEstOrTEu0uNMb+fnWxM/4NTFO/EbXhfUxYB483LkdA/wzPWngY+voT+HANtYTWUrVi/XQvUBuvlrMai6TSIswWCwj/UpeBvsSr6M+wQysUhQMUJZCjso05eIboNHpvrLjiUGNfmgwNCPIK+5A5V/G0T28YEnTzOLN63HmRYQeQeHAwTSXe+ItDz2iSglPGT7hn7Tzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpfg3g86U30WOag0s9btWQ57QAcyhFrJDXUYQicaCLQ=;
 b=C/4D8/Rik5YYx9m3PlKCfA5ClTCw9iypDdnKX9sN3crhcMQ4xWLUPOlf6gnn45C9KRAFhdir23dmR6z4pXEMRbMuSYj2rngW1QjE6nKJoMOuex2O7BVMgq95jHySUKpTIoDIKj3vkJVBL93UxOx75CmLj3NhNr1Gxum4fvQPgby46s83/Vcmyl2Ht93JYPEuuhrY52Pk37iWYTtBFaCl46vMz6i0ILik6DIhk3lMTW44jgYxO8A5YlAyu+gkdbPJHnrbsNK8YKYAi15u+W64fvQQ6dEqq+/YxvbVco+HLyK2tcF4Kp55gk7Oz68427S+VHg2ALtZXGzcI9fHXyGVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lpfg3g86U30WOag0s9btWQ57QAcyhFrJDXUYQicaCLQ=;
 b=geRVJk7tlWJec9m1AXXEoXwGmFstqK/CIt0P1eAiLHxcj152nyxhO9X57yvZ9acx/0CuTR56aNZXLgIrpSnwutdxU2Zgz8F7m/O+eGn3aeqQsuIrohe0qNtyoYyS3DhZVnnihs64eNG8wenWobdt6AIr6kHTVVBrozef4lsJNW8=
Received: from DB7PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:10:52::37)
 by DU0PR02MB8385.eurprd02.prod.outlook.com (2603:10a6:10:3b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 14:01:31 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:52:cafe::4f) by DB7PR02CA0024.outlook.office365.com
 (2603:10a6:10:52::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Thu, 18 Apr 2024 14:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 14:01:30 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 Apr
 2024 16:01:30 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 Apr
 2024 16:01:30 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 Apr 2024 16:01:30 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 30431315E;
 Thu, 18 Apr 2024 16:01:30 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
 id 2B57E4027BC9; Thu, 18 Apr 2024 16:01:30 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Thu, 18 Apr 2024 16:01:14 +0200
Subject: [PATCH 1/2] drm/panel: panel-simple: Add generic panel-dsi driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240418-foo-fix-v1-1-461bcc8f5976@axis.com>
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
In-Reply-To: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
CC: Johan Adolfsson <johan.adolfsson@axis.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|DU0PR02MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: cae9f3d7-16ec-4f80-6715-08dc5fb00ca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e3b1T4VBXzwkCEDtp0+8/cCnXdDH5Jq6K43f2kyA/81u3amIal1tUAaUe+XgIDJWWVYCq0oTdil0fRIwzYv9ONFvGa+f/TBk6jMmPvDVCqOQugN9BZNxLpa3hJSdLoadOVC87IQYX2Hr4zxlVOfMhFj+Kd1hZXwQBKdeL63/KE+rSN36hAS6UAPta/krwu1K9XvAQ+3fmUi6KduE5UtpZDhfQsiP2YLTc+V3j3Amdoam0UfwhPD59VXOkxN2aUm7shfCqM5JLLQ9BD1m+PQch08m+FSUMJULyKdpAHEYhhR6EuOjh6FfbJh30/p5grroPyUZw00AqqX7zaqlFoGsNyOKWtuyieXAZ5jWPyjA6yuc9Utw5LWcpgPhlOTdoHZ1ipxNWGTLBIfnvbqVKjr8DQ3JKsJnuDx+Iuu4hurzgl3mb4vzDscfqhGeGLDwZzEFMF+zIeZOyPyYdBf+y+Iviny+0AluNbMuvZTGPhpL3YOxS0hf4utwPyr5Jd0gEYfG2Fn5Bb9eTawX0PH0qLwbr2ahQYKRhgBOgdODnwc8YLWuMZSEpM4DNr4JXSj4YLBmCUibj0Yfv+E9dUszkDCNqQ9Mw4K99wYJa6Qbne75Uefc8NogBeKAEUzON2MpFXk0kx4I895jAuejttEkvKNyBbB3alk6biKdxgE8clJGSCwbNeccWHZ+9t2C7/9/r+lEc2x/TNq5o6l8Lws7gpFUYILkgFx7bUl51aAAxl2B+kWQQ1X6n0YAzqaWTkxvncDtDvn6QfgNjRROfJJPRrLFFw==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(1800799015)(82310400014)(36860700004)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:01:30.9708 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cae9f3d7-16ec-4f80-6715-08dc5fb00ca0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8385
X-Mailman-Approved-At: Thu, 18 Apr 2024 14:05:57 +0000
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

Add generic panel-dsi panel, similar to panel-dpi that can have it's
timing, lanes and flags overridden by devicetree.
Add some dev_err() and dev_warn() calls.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 76 ++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index d493ee735c73..3b812fb9ae9e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -455,7 +455,9 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.get_timings = panel_simple_get_timings,
 };
 
-static struct panel_desc panel_dpi;
+static struct panel_desc panel_dpi = {
+	.connector_type = DRM_MODE_CONNECTOR_DPI
+};
 
 static int panel_dpi_probe(struct device *dev,
 			   struct panel_simple *panel)
@@ -471,6 +473,8 @@ static int panel_dpi_probe(struct device *dev,
 	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
 	if (!desc)
 		return -ENOMEM;
+	if (panel->desc)
+		*desc = *panel->desc;
 
 	timing = devm_kzalloc(dev, sizeof(*timing), GFP_KERNEL);
 	if (!timing)
@@ -503,6 +507,20 @@ static int panel_dpi_probe(struct device *dev,
 	return 0;
 }
 
+static int panel_dsi_probe(struct device *dev,
+			   struct panel_simple *panel)
+{
+	int ret;
+
+	ret = panel_dpi_probe(dev, panel);
+	if (panel->desc) {
+		struct panel_desc *desc = (struct panel_desc *)panel->desc;
+
+		desc->connector_type = DRM_MODE_CONNECTOR_DSI;
+	}
+	return ret;
+}
+
 #define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
 	(to_check->field.typ >= bounds->field.min && \
 	 to_check->field.typ <= bounds->field.max)
@@ -533,11 +551,16 @@ static void panel_simple_parse_panel_timing_node(struct device *dev,
 		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vactive) ||
 		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vfront_porch) ||
 		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vback_porch) ||
-		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vsync_len))
+		    !PANEL_SIMPLE_BOUNDS_CHECK(ot, dt, vsync_len)) {
+			dev_warn(dev, "timing bounds failed\n");
 			continue;
+		}
 
-		if (ot->flags != dt->flags)
+		/* Allow mismatch in flags for last entry */
+		if (i + 1 < panel->desc->num_timings && ot->flags != dt->flags) {
+			dev_warn(dev, "flags mismatch: ot %x vs dt %x\n", ot->flags, dt->flags);
 			continue;
+		}
 
 		videomode_from_timing(ot, &vm);
 		drm_display_mode_from_videomode(&vm, &panel->override_mode);
@@ -4752,6 +4775,39 @@ struct panel_desc_dsi {
 	unsigned int lanes;
 };
 
+static const struct display_timing generic_800x480_timing = {
+	.pixelclock = { 16400000, 864 * 490 * 60, (1920 + 512) * (1920 + 512) * 60 },
+	.hactive = { 400, 800, 1920 },
+	.hfront_porch = { 2, 16, 512 },
+	.hback_porch = { 2, 16, 512 },
+	.hsync_len = { 1, 10, 40 },
+	.vactive = { 400, 480, 1920 },
+	.vfront_porch = { 2, 5, 512 },
+	.vback_porch = { 2, 5, 512 },
+	.vsync_len = { 1, 10, 20 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_SYNC_POSEDGE
+};
+
+static struct panel_desc_dsi panel_dsi = {
+	.desc = {
+		.timings = &generic_800x480_timing,
+		.num_timings = 1,
+		.bpc = 8,
+		.size = {
+			.width = 152,
+			.height = 91,
+		},
+		.connector_type = DRM_MODE_CONNECTOR_DSI,
+	 },
+	.flags = MIPI_DSI_MODE_VIDEO |
+		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		 MIPI_DSI_MODE_VIDEO_HSE | /* Needed to generate Hsync End Short package */
+		 MIPI_DSI_MODE_VIDEO_NO_HBP,
+	.format = MIPI_DSI_FMT_RGB888,
+	.lanes = 2,
+};
+
 static const struct drm_display_mode auo_b080uan01_mode = {
 	.clock = 154500,
 	.hdisplay = 1200,
@@ -4976,6 +5032,9 @@ static const struct of_device_id dsi_of_match[] = {
 	}, {
 		.compatible = "osddisplays,osd101t2045-53ts",
 		.data = &osd101t2045_53ts
+	}, {
+		.compatible = "panel-dsi",
+		.data = &panel_dsi,
 	}, {
 		/* sentinel */
 	}
@@ -4992,17 +5051,28 @@ static int panel_simple_dsi_probe(struct mipi_dsi_device *dsi)
 		return -ENODEV;
 
 	err = panel_simple_probe(&dsi->dev, &desc->desc);
+	if (err)
+		dev_err(&dsi->dev, "%s: err %i\n", __func__, err);
+
+	if (desc == &panel_dsi) {
+		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
+		/* Handle the generic panel-dsi binding */
+		err = panel_dsi_probe(&dsi->dev, panel);
+	}
+
 	if (err < 0)
 		return err;
 
 	dsi->mode_flags = desc->flags;
 	dsi->format = desc->format;
 	dsi->lanes = desc->lanes;
+	of_property_read_u32(dsi->dev.of_node, "lanes", &dsi->lanes);
 
 	err = mipi_dsi_attach(dsi);
 	if (err) {
 		struct panel_simple *panel = mipi_dsi_get_drvdata(dsi);
 
+		dev_err(&dsi->dev, "probe attach err: %i", err);
 		drm_panel_remove(&panel->base);
 	}
 

-- 
2.30.2

