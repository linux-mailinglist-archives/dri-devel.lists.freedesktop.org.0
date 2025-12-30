Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A348CCE9B81
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 13:59:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBF0910E114;
	Tue, 30 Dec 2025 12:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HHyAaFvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889A510E114
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 12:59:28 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-c03e8ac1da3so8717602a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 04:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767099568; x=1767704368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jG1mbeCtoKdKSqmTwCxzqoc0CL/c5V/aFZf0JDXVCB4=;
 b=HHyAaFvHkuVeSunZDWhRU2cLXzn8HIKqVe1BOWy1eb9uhRSngQ28KHaoBTKF869xqb
 Bfst09+jzV1QZhHzYDEpWnRyHLJZveJm9pODpkIUgGlfKyIsssxrJgOY0lZkIqRLEDof
 tVxCQqFU2/Yu6B7L7SuvvfxKUwjVnMsmFyObuNedL7ApiOIPQ0gorI+fpPl7/p8qU4Bk
 oq3jg8ae8j+CuN5qmkg8A3/mqcUh2+ZNLyxIgWf9c5z33xrULwZoLkOpeqM/GUxo4CDa
 deiifM/dEQGyE+3f1yMkS07qadt1cw8u+yq1bGuINaRyBn+FdGmkMOkhayMouWLgf9W/
 ptpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767099568; x=1767704368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jG1mbeCtoKdKSqmTwCxzqoc0CL/c5V/aFZf0JDXVCB4=;
 b=wG/ZAHHrAemxpJG6QeqBsqBWvaY7HlQ2B2k8V1DZJiCPEpDSCjyFhEYoTDwuF7SXw/
 FUh7PvwhDZBj0MOKprECHFLyEKu6zOXXVGKVxf3fkJBVR/yMmVObtmonex8myyO4ulQ+
 heCNGqeQgSudQxcxMtQI/6MRLmToxt/BxPuvN5ZxYn4qKT50PG89ZEaSdj446TIPzwlB
 mm4CammdrMOKcttDSjToQvK6SA/1pxl4JZGxs7EYT26y8uF1c/8kzRTS26GOMaTKS8DY
 evo1a6XsYOe6mjbLqbWByGnybcPqOxq9pIYoRJSb8GW8G8RLmEp+L0cY2sEIUDWDn9RN
 OKiA==
X-Gm-Message-State: AOJu0Yz9qqfOFaCes9ryPJRsfSPNCZGmm7V06KVlIjQxlwmtSPzl6Rhp
 i/FYfKW0BA8HL5SfT5lvgStDUUSAjavcCzoD4r/GS5yfMCVr8eGcgBqr
X-Gm-Gg: AY/fxX4oRbx/SDxNVq7AOMbO5MiOQ4rtyAHKgjuEMLAxwAipz0n0GX7hh2q/tKNxOGU
 eP5Jy11xEc2BWxn7vf6UgvgB9bnAXhuzGHk7zQMcckMRrUhos0wONuKoStZXCggjKTNdj8TfRK4
 HkcnuuzHM9XmNmRg6X0aBro+MNtGSfizPUL56hWCb6KwVGXKqKskvAZaxxmoFJlqjiCmwNNaWX5
 IMFJM7y9FsXHHKol9owwPKPQvJNrvsGD+nJQcQB/fuuVThz2XbgtpCp2MclVo/5ouAvIka9GGK6
 9mCGXp7DImHVIUWO+FPej5ZMsOWiDuvmCXVWxa6Yh9bKL+S38UrA0pe2rlREs9/vXtghwO/YWv2
 e68/+/Nj7HuHhgZUue4hRTmyvf+Q2WqKy8zqS1/nf2ZqCNaIcH/T/VzHGp3psMB1Oa3bWHmlqDW
 T2X+ZMUtkRB0+4ddt5XohyBE7L
X-Google-Smtp-Source: AGHT+IHJMfFXi8CJeuCE1+e1JHWGesxleL10YTuQ6J1StQpMNTg/PwHmSKzoAole6DZrAbGfkiLEkg==
X-Received: by 2002:a05:7300:ea95:b0:2b0:52ac:92fe with SMTP id
 5a478bee46e88-2b05ec30bbfmr35004053eec.21.1767099567895; 
 Tue, 30 Dec 2025 04:59:27 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ae10:4ecf:7e5a:aa6f])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b05ffad66fsm75132634eec.4.2025.12.30.04.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 04:59:27 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH 2/2] drm/panel: simple: Add Innolux G150XGE-L05 panel entry
Date: Tue, 30 Dec 2025 09:59:13 -0300
Message-Id: <20251230125913.3670617-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230125913.3670617-1-festevam@gmail.com>
References: <20251230125913.3670617-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Fabio Estevam <festevam@nabladev.com>

Add support for the Innolux G150XGE-L05 15.0" TFT 1024x768 LVDS panel.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3acc9f3dac16..c606e5932ca7 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2836,6 +2836,32 @@ static const struct panel_desc innolux_g121xce_l01 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing innolux_g150xge_l05_timing = {
+	.pixelclock   = { 53350000, 65000000, 80000000 },
+	.hactive      = { 1024, 1024, 1024 },
+	.hfront_porch = { 58, 160, 288 },
+	.hback_porch  = { 58, 160, 288 },
+	.hsync_len    = { 1, 1, 1 },
+	.vactive      = { 768, 768, 768 },
+	.vfront_porch = { 6, 19, 216 },
+	.vback_porch  = { 6, 19, 216 },
+	.vsync_len    = { 1, 1, 1 },
+	.flags        = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc innolux_g150xge_l05 = {
+	.timings = &innolux_g150xge_l05_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width  = 304,
+		.height = 228,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing innolux_g156hce_l01_timings = {
 	.pixelclock = { 120000000, 141860000, 150000000 },
 	.hactive = { 1920, 1920, 1920 },
@@ -5314,6 +5340,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,g121xce-l01",
 		.data = &innolux_g121xce_l01,
+	}, {
+		.compatible = "innolux,g150xge-l05",
+		.data = &innolux_g150xge_l05,
 	}, {
 		.compatible = "innolux,g156hce-l01",
 		.data = &innolux_g156hce_l01,
-- 
2.34.1

