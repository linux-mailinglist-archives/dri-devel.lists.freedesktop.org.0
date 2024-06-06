Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CDA8FE06B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 10:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E8210E36D;
	Thu,  6 Jun 2024 08:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=norik.com header.i=@norik.com header.b="SXN9Ece0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A834A10E355
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WWms8HVZIOvAc05XHHH+pWslve4mOHOukt9ISJZLU5w=; b=SXN9Ece0ZBT0vNsILoNPj6JQHO
 Y5yWIwU3/j32mSRdN3IxiFvFhphFWyfyUYx4uvAsu26Xnfs5eezFvuPHUVDPKPSyBUKSdQ540GCcT
 4UQBF3ht2HlRALgHG6Z3AnDTX+J0VmrjyKjHEEnBYbq6GMqZgTzLZAhSBBfdIcxiy1VHh8ZYQ75iL
 wNqbeZw2S0vLc+VtngOuFnkq1xP/e4alDIH+kl0z/Yv/OWjCf1fflnqiBo6uWQe3LYlTbBcWfpTlP
 9JINjK7wHWdd7JHdMsl3NyCFEDV8c95v3ladhVphWsk8ZSMga0R3hLGfAH5QwQ+/+VDu/QOtZdQQ7
 Eqc8XHVQ==;
Received: from [89.212.21.243] (port=51044 helo=localhost.localdomain)
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <primoz.fiser@norik.com>) id 1sF83c-00BWkF-0M;
 Thu, 06 Jun 2024 10:01:11 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: upstream@lists.phytec.de
Subject: [PATCH v2 3/3] drm/panel: simple: Add PrimeView PM070WL4 support
Date: Thu,  6 Jun 2024 10:01:04 +0200
Message-Id: <20240606080104.3663355-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606080104.3663355-1-primoz.fiser@norik.com>
References: <20240606080104.3663355-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

Add support for PrimeView PM070WL4 7.0" (800x480) TFT-LCD panel.
Datasheet can be found at [1].

[1] https://www.beyondinfinite.com/lcd/Library/Pvi/PM070WL4-V1.0.pdf

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- sort alphabetically

 drivers/gpu/drm/panel/panel-simple.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dcb6d0b6ced0..80cca841db15 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3567,6 +3567,32 @@ static const struct panel_desc powertip_ph800480t013_idf02  = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct drm_display_mode primeview_pm070wl4_mode = {
+	.clock = 32000,
+	.hdisplay = 800,
+	.hsync_start = 800 + 42,
+	.hsync_end = 800 + 42 + 128,
+	.htotal = 800 + 42 + 128 + 86,
+	.vdisplay = 480,
+	.vsync_start = 480 + 10,
+	.vsync_end = 480 + 10 + 2,
+	.vtotal = 480 + 10 + 2 + 33,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
+static const struct panel_desc primeview_pm070wl4 = {
+	.modes = &primeview_pm070wl4_mode,
+	.num_modes = 1,
+	.bpc = 6,
+	.size = {
+		.width = 152,
+		.height = 91,
+	},
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
+	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
+};
+
 static const struct drm_display_mode qd43003c0_40_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -4725,6 +4751,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "powertip,ph800480t013-idf02",
 		.data = &powertip_ph800480t013_idf02,
+	}, {
+		.compatible = "primeview,pm070wl4",
+		.data = &primeview_pm070wl4,
 	}, {
 		.compatible = "qiaodian,qd43003c0-40",
 		.data = &qd43003c0_40,
-- 
2.25.1

