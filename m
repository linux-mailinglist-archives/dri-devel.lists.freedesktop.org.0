Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2E26B925D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6853010E788;
	Tue, 14 Mar 2023 11:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A888F10E787
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jW2eNmf3u+BZnghwMIkumkKgmlFpqLlNexSh5uxFtN8w8I4mIIiZvdyugBvrLtV9EkC41jJlGvvzWGFoWEMxDMRF0WoyhDyU6xE9iDCYd4riIkmYtyurIhkW+VWoRiEY2qY7S5c26FlDevwT5UJKkUZNFJK4t+8eD065WkBcu7ZVWQYU+k2USIMHtwjY2UgFOgILvospsv9jCuQnOUmoUslhLTWc7p09CgoAUyFqcesnNbCSmWUkP2VIR2NX1pFDJABMVmMPON/O9sE05slKt7J5DbBpmS6bF9OD/Iwd6kdbZQFWxjUJWQdSJvpf1aaEFrjuoWGEVpkzVQRmJ8xzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q71o+vJoLo1CytcOkWcOHMXqoNQU4IlUCWcDpPNW+WI=;
 b=ZfclcPhXfl1MA1/OZQreh+xRVveKMxefdU6T5+IJWVv5D/x+v+pvWbii8bDwEhqjNt2Qo+sdGjXSF4gpWnkwB9CGahaW2Vj1z0ukScQbNiItzinSzm1BfQGluf76tEPQHPimLxqAcTvBk0jb2aY1NZVLGhlCj5xinGGOAcB+GN4GQS5uP+yjSUwwsuBPwRKiQITt0njVhj617yq5bpdUuCAUl70oXvacdoQF8gkikmA3NW/CiZFrYj5EKUMPRcUOWg4E0oELxZ8L58bV6RX4xN+B8Mc7JnW2LXcaB5XXGi5S9PZ7xQLMca7UkS2yDwagPjBnfzWeiAhYZs6vGudKiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q71o+vJoLo1CytcOkWcOHMXqoNQU4IlUCWcDpPNW+WI=;
 b=AiCGbHQ8zMI9sRKXO+0hXLbRuyHaxrv+UzJseP1z92W9of1pI1NShWRX7VPLJkPA5oORlwq8zrsEJLb7Fvc+3VBzA5h31ZHynP4m5wU9g5fK084aI/QKvxzo3v7FzD+NjH/JNUjHEcDQrtKcOETYXYS9AUi95HckhbIUg7F6R9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by AS8PR08MB9313.eurprd08.prod.outlook.com (2603:10a6:20b:5a4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:57:08 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:57:08 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] drm/panel: sitronix-st7789v: parse device tree to
 override timing mode
Date: Tue, 14 Mar 2023 12:56:42 +0100
Message-Id: <20230314115644.3775169-6-gerald.loacker@wolfvision.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0032.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::18) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|AS8PR08MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef4ea0f-2ee5-4fe7-467d-08db24833ccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XBtTcsrYgkLu4PtbwlWpLmI83/JgI975SE9HvA6nD0N1FOxtcwa05Obq9WE05JSDdHx77HkV5JveQuEiWLKWyLD2ucO186RA8x9rhmrjjpdQJwNBCm2HSq7mS8X/Dd5moLeBR0nigZignkkzYa81c6DP8LJJOZIuDDPsESe4W6nOGYARSMaVb8Dk6IK50UfaMDWkB6w1LgtRb+qa7X6KUPRCtPyTzW1dp+WKEVYLwUXQeHZZP1ypyGfFXgkxD0mIe5NRBjvHKGqXzqydcD3CN3Zh0xxMeh/BH7QQ3dEgovtilJ0BuUncJ7xddiB+uaiu4tD6P88CFRsydJc1wxwXla8ZQivY/wZ3GTMMkLXIROIVEx9PLA4mehRGuBZ2ZfPDezOSIKwQYwz4tErix4Q3IS6p2zb6LIMWR683ujzgDyF68+AD0QU0uXzu/cfp07LzYv41YTcbjIxCWMYQXl+cFRc5HiJKmBbydVSw3HI2PmEuct0yX8o5qyKxS2ZZJeuUZLXoCt0eS4C1w0qo7W/nVBc22YxR+CcdCTNzJpEJxGlIO6pxKbnUAx2vyStrY5+6IjcB5pOsKElVytJFCwkVhkIVMoVCOXF8YU0P0aXPOPssyvG8yb730idDfvSA8MFLgaCMQuj9eebGn0snteS0mBf2LIRo3hQ3PzIg8VKwXZVtFhKMtL/slU9q8W32UHwW5LeepRIrE473DFg03VzHgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(451199018)(478600001)(52116002)(186003)(26005)(83380400001)(107886003)(6666004)(6486002)(66556008)(54906003)(66476007)(316002)(6506007)(2616005)(66946007)(6512007)(8676002)(41300700001)(4326008)(1076003)(8936002)(44832011)(5660300002)(7416002)(38100700002)(38350700002)(2906002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oqvvJ3+IL3mVZaKi8inZKseCiVVRTChCK7Jjn4RUX62NJz+GOlqSfbWx1qiR?=
 =?us-ascii?Q?dVQfh2O8gvnPHD11w6tsEgTR+Gk/UuRRf0RMLx9NAz9dip+l4soj+F3OEx8Q?=
 =?us-ascii?Q?Z+sECrMGl0kDVhLeOrwQspkPF2UzH9kouiP8Nj1IVQCdH8aEyY3q+GaXj/OW?=
 =?us-ascii?Q?oLPejt3jz+jfog5OEtFGfOpPR4+bzmdlNUzqQCWaszeS1iivhgEJHet98nvX?=
 =?us-ascii?Q?xS8U6wFKt7g7E9pvNHEDDggPka+nqA9fX/dzPK/BRondzBG/9XWdA+1/enfV?=
 =?us-ascii?Q?M+wZ153+g+X0scNifs87tD8CEQJN+xthUdv225PcQOMRP/ZEBi/pfvfsp4DP?=
 =?us-ascii?Q?ErVkGsT+p/zBzws9NyfeDDD6CZEOlCwC+wPkI1VxO5K3R9PwAry9wXW1zLzf?=
 =?us-ascii?Q?PE0xOhzVYp/Rl4TgSR/2o051qQL6yIgQzPbJJaIPnoeVYkMIJMmErQF4/FfX?=
 =?us-ascii?Q?qPOQRQm0FY9UHAQ86l4Y5ZnHR+fVc1bjlQ+lrYkiHbX/GxFcY/fBVhFAtlOf?=
 =?us-ascii?Q?tVH7vKtz20TbnlsSxPUAEoxlyufnRwawjduBQ9XcojiEyCp70/PG4Ny+OdzT?=
 =?us-ascii?Q?29rsrkilcMNyH9BTOlm0DdZrUTuGHIvmqKuBGdtJENLd6s7RZkEetXFn7pqO?=
 =?us-ascii?Q?AT4BUofVJ0QwaeTjYVzhysEqcezQMkY+pMcTvft4CTpS3k3KxPAEordaLWsJ?=
 =?us-ascii?Q?b2ICM/h/wE7ZES/s2HF+Amsi3fh2tQyEqYY1ydEEhQMUiXoRwGxNE5ssfv6F?=
 =?us-ascii?Q?vZk84XGjhrbpMEDo50FF4mxCL7JAWh/m9b7qRrzdi5uDXftpYTD2TaqCDzZ4?=
 =?us-ascii?Q?dMDqOawaft7iTMmzJupZVWgZacGzwz42diC5Ex6kGZgDrCteo8P68UL+UZnR?=
 =?us-ascii?Q?XUP09iGmRv+FlyOlSbq3P8LLozrqIbmNfpXIOzBdc0hZTGdfoxnX8ZLIxiku?=
 =?us-ascii?Q?ndhaQZNHEgbdEh4TPfK8qcynr5Nr/noFGAj0HHbf3WwuXmpMgfvvp0wUmCBm?=
 =?us-ascii?Q?u3FEwT/hj/AnAcFB0npbQP1sfgVzAKQPx3pLpJ9GvparwImCKXNzcF3KkLRd?=
 =?us-ascii?Q?nEETSptYxg43G9nDfTk8JMz5j6egA6zCyywidJDcO4JcfHUsZbPy4wyGzPnF?=
 =?us-ascii?Q?/7EGIsJhFCW5bLYicKALyc9ZyL3IRAJCG+qPzi8r/vabV3dMhP0k3Viy4cAy?=
 =?us-ascii?Q?fEAyClgdkkS4YlGcm69JVZZkFxIyiBPbn3xo7IEbftow5FNO8Htkoq+xPpTu?=
 =?us-ascii?Q?WICRSq93jguC6o846AyvBd80T1PxfVpmX3H+2jIFDbsoboameBrP1F47uy9+?=
 =?us-ascii?Q?1kdtsnZB+19c+UsznRkDUBqot7Nm9kE97Px+TsK8dNfWVcBWS3H1n2gnlSzN?=
 =?us-ascii?Q?1INXFULMZvoK+d6lWMA6zugs1cKWExB71a5QvNFDHDMCV/YnHgv6N5YXZ86X?=
 =?us-ascii?Q?cppnF3ofTt5+ratJXTTAD8bQx+wkjSl3TzE79uqdOAZ/+E/n+i2MbfrfS1jk?=
 =?us-ascii?Q?uutCC23ctR6I7h5OrQogK19C7RSioK8Git1CExsxNZzTPhiIEmMY09uyFe/s?=
 =?us-ascii?Q?Zgh/0Loga8VUY/2VtWCz23om/ikZLhU0t9oCm3FvgOu/ekUwAV8nZT/aULsp?=
 =?us-ascii?Q?IBd+SOHrJou7kqlfoKCgHX0=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef4ea0f-2ee5-4fe7-467d-08db24833ccc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:57:08.3799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEl8Cq/zq2j3/jjft67M+7XvhjLfqQfigisg6Q7qmGTvZkFRIdsZdpsTW0o31WLwkBJ6lIluMRFqN0FPrrICtMwzX7u9BLyJ0mnZeLWh588=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9313
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
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Parse device tree for panel-timing and allow to override the typical
timing. This requires the timing to be defined as display_timing instead
of drm_display_mode.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 174 +++++++++++++++---
 1 file changed, 144 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 1ca04585aff2..ebde8a70deee 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -10,6 +10,9 @@
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 
+#include <video/display_timing.h>
+#include <video/of_display_timing.h>
+#include <video/videomode.h>
 #include <video/mipi_display.h>
 
 #include <drm/drm_device.h>
@@ -28,6 +31,8 @@
 #define ST7789V_RGBCTRL_CMD		0xb1
 #define ST7789V_RGBCTRL_WO			BIT(7)
 #define ST7789V_RGBCTRL_RCM(n)			(((n) & 3) << 5)
+#define ST7789V_RGBCTRL_RCM_DE			2
+#define ST7789V_RGBCTRL_RCM_HV			3
 #define ST7789V_RGBCTRL_VSYNC_HIGH		BIT(3)
 #define ST7789V_RGBCTRL_HSYNC_HIGH		BIT(2)
 #define ST7789V_RGBCTRL_PCLK_HIGH		BIT(1)
@@ -117,6 +122,7 @@ struct st7789v {
 	struct spi_device *spi;
 	struct gpio_desc *reset;
 	struct regulator *power;
+	struct drm_display_mode override_mode;
 	enum drm_panel_orientation orientation;
 };
 
@@ -157,39 +163,84 @@ static int st7789v_write_data(struct st7789v *ctx, u8 cmd)
 	return st7789v_spi_write(ctx, ST7789V_DATA, cmd);
 }
 
-static const struct drm_display_mode default_mode = {
-	.clock = 7000,
-	.hdisplay = 240,
-	.hsync_start = 240 + 38,
-	.hsync_end = 240 + 38 + 10,
-	.htotal = 240 + 38 + 10 + 10,
-	.vdisplay = 320,
-	.vsync_start = 320 + 8,
-	.vsync_end = 320 + 8 + 4,
-	.vtotal = 320 + 8 + 4 + 4,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+static const struct display_timing st7789v_timing = {
+	.pixelclock = { 1, 7000000, 8333333 },
+	.hactive = { 240, 240, 240 },
+	.hfront_porch = { 2, 38, 500 },
+	.hback_porch = { 4, 10, 21 },
+	.hsync_len = { 2, 10, 10 },
+	.vactive = { 320, 320, 320 },
+	.vfront_porch = { 8, 8, 500 },
+	.vback_porch = { 4, 4, 117 },
+	.vsync_len = { 4, 4, 10 },
+	.flags = DISPLAY_FLAGS_HSYNC_HIGH | DISPLAY_FLAGS_VSYNC_HIGH |
+		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
+		 DISPLAY_FLAGS_SYNC_POSEDGE,
 };
 
-static int st7789v_get_modes(struct drm_panel *panel,
-			     struct drm_connector *connector)
+struct panel_desc {
+	u32 bus_format;
+	u32 bus_flags;
+};
+
+static struct panel_desc st7789v_desc = {
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+};
+
+static unsigned int st7789v_get_timings_modes(struct drm_panel *panel,
+					      struct drm_connector *connector)
 {
-	struct st7789v *ctx = panel_to_st7789v(panel);
 	struct drm_display_mode *mode;
-	u32 bus_format = MEDIA_BUS_FMT_RGB666_1X18;
 
-	mode = drm_mode_duplicate(connector->dev, &default_mode);
+	const struct display_timing *dt = &st7789v_timing;
+	struct videomode vm;
+
+	videomode_from_timing(dt, &vm);
+	mode = drm_mode_create(connector->dev);
 	if (!mode) {
-		dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
-			default_mode.hdisplay, default_mode.vdisplay,
-			drm_mode_vrefresh(&default_mode));
-		return -ENOMEM;
+		dev_err(panel->dev, "failed to add timing %ux%ux\n",
+			dt->hactive.typ, dt->vactive.typ);
+		return 0;
 	}
 
-	drm_mode_set_name(mode);
+	drm_display_mode_from_videomode(&vm, mode);
+
+	mode->type |= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
+	return 1;
+}
+
+static int st7789v_get_modes(struct drm_panel *panel,
+			     struct drm_connector *connector)
+{
+	struct st7789v *ctx = panel_to_st7789v(panel);
+	struct drm_display_mode *mode;
+	bool has_override = ctx->override_mode.type;
+	u32 bus_format = MEDIA_BUS_FMT_RGB666_1X18;
+	unsigned int num;
+
+	if (has_override) {
+		mode = drm_mode_duplicate(connector->dev, &ctx->override_mode);
+		if (!mode) {
+			dev_err(panel->dev, "failed to add mode %ux%ux@%u\n",
+				ctx->override_mode.hdisplay,
+				ctx->override_mode.vdisplay,
+				drm_mode_vrefresh(&ctx->override_mode));
+			return 0;
+		}
+
+		drm_mode_set_name(mode);
+
+		mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+		drm_mode_probed_add(connector, mode);
+		num = 1;
+	} else {
+		num = st7789v_get_timings_modes(panel, connector);
+	}
+
 	connector->display_info.width_mm = 61;
 	connector->display_info.height_mm = 103;
 
@@ -204,7 +255,7 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
-	return 1;
+	return num;
 }
 
 static enum drm_panel_orientation st7789v_get_orientation(struct drm_panel *p)
@@ -217,6 +268,8 @@ static enum drm_panel_orientation st7789v_get_orientation(struct drm_panel *p)
 static int st7789v_prepare(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
+	struct drm_display_mode mode = ctx->override_mode;
+	u16 hbp, vbp, rcm, hsync = 0, vsync = 0, pclk = 0;
 	int ret;
 
 	ret = regulator_enable(ctx->power);
@@ -327,15 +380,29 @@ static int st7789v_prepare(struct drm_panel *panel)
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_EPF(3) |
 					     ST7789V_RAMCTRL_MAGIC));
 
+	if ((st7789v_desc.bus_flags & DRM_BUS_FLAG_DE_HIGH) ||
+	    (st7789v_desc.bus_flags & DRM_BUS_FLAG_DE_LOW))
+		rcm = ST7789V_RGBCTRL_RCM_DE;
+	else
+		rcm = ST7789V_RGBCTRL_RCM_HV;
+
+	if (st7789v_desc.bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE)
+		pclk = ST7789V_RGBCTRL_PCLK_HIGH;
+
+	if (mode.flags & DRM_MODE_FLAG_PHSYNC)
+		hsync = ST7789V_RGBCTRL_HSYNC_HIGH;
+
+	if (mode.flags & DRM_MODE_FLAG_PVSYNC)
+		vsync = ST7789V_RGBCTRL_VSYNC_HIGH;
+
+	vbp = mode.vtotal - mode.vsync_start;
+	hbp = mode.htotal - mode.hsync_start;
 	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RGBCTRL_CMD));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_WO |
-					     ST7789V_RGBCTRL_RCM(2) |
-					     ST7789V_RGBCTRL_VSYNC_HIGH |
-					     ST7789V_RGBCTRL_HSYNC_HIGH |
-					     ST7789V_RGBCTRL_PCLK_HIGH));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));
-	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_HBP(20)));
-
+					     ST7789V_RGBCTRL_RCM(rcm) |
+					     vsync | hsync | pclk));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(vbp)));
+	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_HBP(hbp)));
 	return 0;
 }
 
@@ -377,8 +444,50 @@ static const struct drm_panel_funcs st7789v_drm_funcs = {
 	.unprepare = st7789v_unprepare,
 };
 
+static void st7789v_set_videomode(struct device *dev, struct st7789v *ctx,
+				  const struct display_timing *dt)
+{
+	struct videomode vm;
+
+	videomode_from_timing(dt, &vm);
+	drm_display_mode_from_videomode(&vm, &ctx->override_mode);
+	ctx->override_mode.type |= DRM_MODE_TYPE_DRIVER |
+				   DRM_MODE_TYPE_PREFERRED;
+
+	drm_bus_flags_from_videomode(&vm, &st7789v_desc.bus_flags);
+}
+
+#define ST7789V_BOUNDS_CHECK(to_check, bounds, field) \
+	(to_check->field.typ >= bounds->field.min &&  \
+	 to_check->field.typ <= bounds->field.max)
+static void st7789v_parse_panel_timing_node(struct device *dev,
+					    struct st7789v *ctx,
+					    const struct display_timing *ot)
+{
+	const struct display_timing *dt;
+	bool ot_timing_valid = true;
+
+	dt = &st7789v_timing;
+
+	if (!ST7789V_BOUNDS_CHECK(ot, dt, hactive) ||
+	    !ST7789V_BOUNDS_CHECK(ot, dt, hfront_porch) ||
+	    !ST7789V_BOUNDS_CHECK(ot, dt, hback_porch) ||
+	    !ST7789V_BOUNDS_CHECK(ot, dt, hsync_len) ||
+	    !ST7789V_BOUNDS_CHECK(ot, dt, vactive) ||
+	    !ST7789V_BOUNDS_CHECK(ot, dt, vfront_porch) ||
+	    !ST7789V_BOUNDS_CHECK(ot, dt, vback_porch) ||
+	    !ST7789V_BOUNDS_CHECK(ot, dt, vsync_len))
+		ot_timing_valid = false;
+
+	if (ot_timing_valid)
+		dt = ot;
+
+	st7789v_set_videomode(dev, ctx, dt);
+}
+
 static int st7789v_probe(struct spi_device *spi)
 {
+	struct display_timing dt;
 	struct st7789v *ctx;
 	int ret;
 
@@ -408,6 +517,11 @@ static int st7789v_probe(struct spi_device *spi)
 
 	of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
 
+	if (!of_get_display_timing(spi->dev.of_node, "panel-timing", &dt))
+		st7789v_parse_panel_timing_node(&spi->dev, ctx, &dt);
+	else
+		st7789v_set_videomode(&spi->dev, ctx, &st7789v_timing);
+
 	drm_panel_add(&ctx->panel);
 
 	return 0;
-- 
2.37.2

