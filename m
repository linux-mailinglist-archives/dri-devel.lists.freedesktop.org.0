Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED21917992
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 09:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C1610E797;
	Wed, 26 Jun 2024 07:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="QJ03VIWa";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HATLGglR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FF710E759
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1719377918; x=1750913918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vG2Rc4xkGFImIioZv6ZRCJMBuYbFRtMECaHSkdBskOE=;
 b=QJ03VIWaNN1juQdRszA9BalHxivIz5MGQxvu+CXYT3yOFeC4pFTK6+GN
 1+Qslm5W7F/hjUfk/sBOFo+Okm3royS7Y4Tnqumm8IMiEzR2cqih1Ba6Z
 pmZOi3WvKy4XNhPMsi4rracYCOEbP0P+CMvm4bgwjpryUnITs9kUmNZWW
 9qcCb31/LddljM0k4YE5ds5c1QliNOpG35TSCLUvKyZ3Y+5a2ajle+yl5
 9/P2hsVhsCrj1wwNVwjjDhB5nijCTTwZwYsHeE6dJyZir9bETkdCJjAMh
 lFdQusQBp5tsgkcbrjH1GSN2Ju/uelwh0PgAsZ4KvKSCJZfXEjJwMifz2 g==;
X-CSE-ConnectionGUID: 7E+dOCUBTiS18j49G/35uQ==
X-CSE-MsgGUID: xt2H0tgQQHiCJZdsUyj98A==
X-IronPort-AV: E=Sophos;i="6.08,265,1712613600"; d="scan'208";a="37587119"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 26 Jun 2024 06:51:27 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB1781639F7; Wed, 26 Jun 2024 06:51:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1719377483; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=vG2Rc4xkGFImIioZv6ZRCJMBuYbFRtMECaHSkdBskOE=;
 b=HATLGglRbaAsM8WFN40WYfLHukhc5KL6OXmy7n5yO/quND9gKiD3nT55P51mvfqCzh4YrT
 6vHnPBQWKI3ZZAAbpus8PK+oPjCVTe/QlWvjWPUHCzGkZ49fafNCHN+KfTxzrSJzUpkuVF
 I1exw/VWEU++748D202jtaqKy7alrmLojhHwCdGhrlsI0DYwAyFit2RnIpClo67X/2dQTf
 goAXwAcDdNKreA4aBRehAauezj9W9Oh6qersDCL8ODyzLupLsbRMKYXLxmEew42W26DcoY
 t1RqAXJXUo+yhirXnS/TTPN+eDBJyc/0elrQvO9nZzTkNCW5R3V4CXdSsO2/Vg==
From: Paul Gerber <paul.gerber@ew.tq-group.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Paul Gerber <paul.gerber@ew.tq-group.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/panel: simple: Add AUO G104STN01 panel entry
Date: Wed, 26 Jun 2024 06:36:29 +0200
Message-ID: <20240626044727.2330191-3-paul.gerber@ew.tq-group.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240626044727.2330191-1-paul.gerber@ew.tq-group.com>
References: <20240626044727.2330191-1-paul.gerber@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Wed, 26 Jun 2024 07:22:57 +0000
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

Add support for the AUO G104STN01 10.4" (800x600) LCD-TFT panel.

Signed-off-by: Paul Gerber <paul.gerber@ew.tq-group.com>
---
Tested on TQ MBa8MPxL with TQMa8MPxL.

 drivers/gpu/drm/panel/panel-simple.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dcb6d0b6ced0..5eacd2085a53 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1081,6 +1081,30 @@ static const struct panel_desc auo_g104sn02 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct drm_display_mode auo_g104stn01_mode = {
+	.clock = 40000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 40,
+	.hsync_end = 800 + 40 + 88,
+	.htotal = 800 + 40 + 88 + 128,
+	.vdisplay = 600,
+	.vsync_start = 600 + 1,
+	.vsync_end = 600 + 1 + 23,
+	.vtotal = 600 + 1 + 23 + 4,
+};
+
+static const struct panel_desc auo_g104stn01 = {
+	.modes = &auo_g104stn01_mode,
+	.num_modes = 1,
+	.bpc = 8,
+	.size = {
+		.width = 211,
+		.height = 158,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing auo_g121ean01_timing = {
 	.pixelclock = { 60000000, 74400000, 90000000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -4434,6 +4458,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "auo,g104sn02",
 		.data = &auo_g104sn02,
+	}, {
+		.compatible = "auo,g104stn01",
+		.data = &auo_g104stn01,
 	}, {
 		.compatible = "auo,g121ean01",
 		.data = &auo_g121ean01,
-- 
2.44.1

