Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77075686F41
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 20:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C2B10E448;
	Wed,  1 Feb 2023 19:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-237.mta1.migadu.com (out-237.mta1.migadu.com
 [IPv6:2001:41d0:203:375::ed])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB2110E40D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 15:15:19 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1675264016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ISBw+lLJjP7BznW362jdcm4uRG8zECZCwrXeRkCYy54=;
 b=tgYIEpHQtF/Kfu53JmIYWDDhcYwE5D/cE/tmHIxCDMDRBJQjwwThWoAEHfz1+oIwyIoCd5
 o/FMIT31dndyeScfWf2EYmUp9OWVKOoq8l4nict1MKRrHuuWQBgPAxdl+DTisc3k3dsEWm
 0rKfOJ5ITQR3W8lAmtqYjT9IQu4opTE=
From: richard.leitner@linux.dev
Date: Wed, 01 Feb 2023 16:06:30 +0100
Subject: [PATCH v2 2/2] drm/panel: simple: Add InnoLux G070ACE-L01
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230201-innolux-g070ace-v2-2-ebac7aaf004f@skidata.com>
References: <20230201-innolux-g070ace-v2-0-ebac7aaf004f@skidata.com>
In-Reply-To: <20230201-innolux-g070ace-v2-0-ebac7aaf004f@skidata.com>
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2026;
 i=richard.leitner@skidata.com; h=from:subject:message-id;
 bh=fBnNe8I6HAau6f0o9ypbleDL5b5fImuqgTaYxzEslLM=;
 b=owGbwMvMwCX2R2KahkXN7wuMp9WSGJJvNfAzb7R7svwCi16y9n/f1de56pmPS63h3vPecaqjjehe
 570pHaUsDGJcDLJiiiz2xlzt7rll7ysVdXJh5rAygQxh4OIUgIk4tzP8T9+76f35H9/C0y+fC1zTz1
 Xd+Tjccsv6te+uR+zYN+P9xwqGvyKXV245HVV22yjEfMG/33vnuK1SupYjVCNjuvPm65UJLhwA
X-Developer-Key: i=richard.leitner@skidata.com; a=openpgp;
 fpr=3F330A87476D76EF79212C6DFC189628387CFBD0
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Wed, 01 Feb 2023 19:50:13 +0000
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Richard Leitner <richard.leitner@skidata.com>

Add InnoLux G070ACE-L01 7" 800x480 TFT LCD with WLED backlight panel
support. Timing data was extracted from datasheet and vendor provided
EDID file.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 8a3b685c2fcc..d90f86ad3789 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2142,6 +2142,38 @@ static const struct panel_desc innolux_at070tn92 = {
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static const struct display_timing innolux_g070ace_l01_timing = {
+	.pixelclock = { 25200000, 35000000, 35700000 },
+	.hactive = { 800, 800, 800 },
+	.hfront_porch = { 30, 32, 87 },
+	.hback_porch = { 30, 32, 87 },
+	.hsync_len = { 1, 1, 1 },
+	.vactive = { 480, 480, 480 },
+	.vfront_porch = { 3, 3, 3 },
+	.vback_porch = { 13, 13, 13 },
+	.vsync_len = { 1, 1, 4 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc innolux_g070ace_l01 = {
+	.timings = &innolux_g070ace_l01_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.delay = {
+		.prepare = 10,
+		.enable = 50,
+		.disable = 50,
+		.unprepare = 500,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing innolux_g070y2_l01_timing = {
 	.pixelclock = { 28000000, 29500000, 32000000 },
 	.hactive = { 800, 800, 800 },
@@ -4098,6 +4130,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,at070tn92",
 		.data = &innolux_at070tn92,
+	}, {
+		.compatible = "innolux,g070ace-l01",
+		.data = &innolux_g070ace_l01,
 	}, {
 		.compatible = "innolux,g070y2-l01",
 		.data = &innolux_g070y2_l01,

-- 
2.39.1

