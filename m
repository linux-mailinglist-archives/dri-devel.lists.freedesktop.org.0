Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807BC6EB9B2
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 16:45:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8FF10E183;
	Sat, 22 Apr 2023 14:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E70A10EE4D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 15:43:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-2f917585b26so1752169f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682091822; x=1684683822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BW+ZUAXLkCPmnHoH/QEWH9O+WPgZx65WOCCFjz1CHAM=;
 b=nb+hBMdcrVgPdTEAAlhH8tvqLPcAcJz+qsG46asq6w5gBoiU5xFayTkS7/4G+oltwJ
 XSZuXpr+7JFOUgx0PcxT6Wqcfgp1YnxK2AYDwOi/zC8lIFKuzqnXRTNNShhLITdvV7ZS
 tVuFm9N04qTVemGS43Bnm1XLQyJmX+05/tgvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682091822; x=1684683822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BW+ZUAXLkCPmnHoH/QEWH9O+WPgZx65WOCCFjz1CHAM=;
 b=VdoSCDLVSLpNeBHdHLJ9/BtFQ3PSOLWrsCwhkBX9w1qPYwIBzJFi3JkRRCduafAPKE
 d3YCTCJlnpZTcQ3yB/P8nML98f27PxIJ8K2FfzY0MyDVwaSzJtdsR9pEBMHnvnf+mRLY
 A5zMWmx6mzbDydKWnAjzoYgYeTf7GmlovYiY3U0AEV4N2NeHuzHY26XhgsyfidbZmRas
 jOPmN/5YTIbMB07CKFeeuoug8uIkrUDr7ZmXaVAriUB/nQJryevL2DDJN1HDD962Aj3w
 gVGyJywhlVxa7wqJx6fYJSdxm1M3uE/DrMEGj/AvJHJQopkhrV+d4iUOU4jtZSUebiV8
 q4aA==
X-Gm-Message-State: AAQBX9fmQaItxz0ZLqc4lw652WHXaUOahHHMtLP1jtRsbnLT5k9jmtUC
 342baGHf9gK7eTQLYi1NJok/GZhuoxvm+4rIQIx0hg==
X-Google-Smtp-Source: AKy350aUqpOsGEUBPKmap982V3lMw+ed8+6wFN3e0Ia5CaZJ75H/BTx+qZ+ozLC13BwPYgKq1yWzWw==
X-Received: by 2002:a5d:6e02:0:b0:2fd:98a8:e800 with SMTP id
 h2-20020a5d6e02000000b002fd98a8e800mr4176367wrz.7.1682091822487; 
 Fri, 21 Apr 2023 08:43:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.127.129])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a5d5552000000b002e51195a3e2sm4651609wrw.79.2023.04.21.08.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 08:43:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] drm/panel: ilitek-ili9805: add support for Tianma
 TM041XDHG01 panel
Date: Fri, 21 Apr 2023 17:43:08 +0200
Message-Id: <20230421154308.527128-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
References: <20230421154308.527128-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Apr 2023 14:45:29 +0000
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 michael@amarulasolutions.com, Sam Ravnborg <sam@ravnborg.org>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Trimarchi <michael@amarulasolutions.com>

Tianma TM041XDHG01 utilizes the Ilitek ILI9805 controller.

Add this panel's initialzation sequence and timing to ILI9805 driver.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/gpu/drm/panel/panel-ilitek-ili9805.c | 53 ++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
index 749959e10d92..cd187b0b1998 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9805.c
@@ -89,6 +89,36 @@ static const struct ili9805_instr gpm1780a0_init[] = {
 	ILI9805_INSTR(0, 0xB9, 0x02, 0x00),
 };
 
+static const struct ili9805_instr tm041xdhg01_init[] = {
+	ILI9805_INSTR(100, ILI9805_EXTCMD_CMD_SET_ENABLE_REG, ILI9805_SETEXTC_PARAMETER1,
+		      ILI9805_SETEXTC_PARAMETER2, ILI9805_SETEXTC_PARAMETER3),
+	ILI9805_INSTR(100, 0xFD, 0x0F, 0x13, 0x44, 0x00),
+	ILI9805_INSTR(0, 0xf8, 0x18, 0x02, 0x02, 0x18, 0x02, 0x02, 0x30, 0x01,
+		      0x01, 0x30, 0x01, 0x01, 0x30, 0x01, 0x01),
+	ILI9805_INSTR(0, 0xB8, 0x74),
+	ILI9805_INSTR(0, 0xF1, 0x00),
+	ILI9805_INSTR(0, 0xF2, 0x00, 0x58, 0x40),
+	ILI9805_INSTR(0, 0xFC, 0x04, 0x0F, 0x01),
+	ILI9805_INSTR(0, 0xEB, 0x08, 0x0F),
+	ILI9805_INSTR(0, 0xe0, 0x01, 0x0d, 0x15, 0x0e, 0x0f, 0x0f, 0x0b, 0x08, 0x04,
+		      0x07, 0x0a, 0x0d, 0x0c, 0x15, 0x0f, 0x08),
+	ILI9805_INSTR(0, 0xe1, 0x01, 0x0d, 0x15, 0x0e, 0x0f, 0x0f, 0x0b, 0x08, 0x04,
+		      0x07, 0x0a, 0x0d, 0x0c, 0x15, 0x0f, 0x08),
+	ILI9805_INSTR(10, 0xc1, 0x15, 0x03, 0x03, 0x31),
+	ILI9805_INSTR(10, 0xB1, 0x00, 0x12, 0x14),
+	ILI9805_INSTR(10, 0xB4, 0x02),
+	ILI9805_INSTR(0, 0xBB, 0x14, 0x55),
+	ILI9805_INSTR(0, MIPI_DCS_SET_ADDRESS_MODE, 0x0a),
+	ILI9805_INSTR(0, MIPI_DCS_SET_PIXEL_FORMAT, 0x77),
+	ILI9805_INSTR(0, 0x20),
+	ILI9805_INSTR(0, 0xB0, 0x00),
+	ILI9805_INSTR(0, 0xB6, 0x01),
+	ILI9805_INSTR(0, 0xc2, 0x11),
+	ILI9805_INSTR(0, 0x51, 0xFF),
+	ILI9805_INSTR(0, 0x53, 0x24),
+	ILI9805_INSTR(0, 0x55, 0x00),
+};
+
 static inline struct ili9805 *panel_to_ili9805(struct drm_panel *panel)
 {
 	return container_of(panel, struct ili9805, panel);
@@ -239,6 +269,20 @@ static const struct drm_display_mode gpm1780a0_timing = {
 	.vtotal = 480 + 2 + 4 + 10,
 };
 
+static const struct drm_display_mode tm041xdhg01_timing = {
+	.clock = 26227,
+
+	.hdisplay = 480,
+	.hsync_start = 480 + 10,
+	.hsync_end = 480 + 10 + 2,
+	.htotal = 480 + 10 + 2 + 36,
+
+	.vdisplay = 768,
+	.vsync_start = 768 + 2,
+	.vsync_end = 768 + 10 + 4,
+	.vtotal = 768 + 2 + 4 + 10,
+};
+
 static int ili9805_get_modes(struct drm_panel *panel,
 			      struct drm_connector *connector)
 {
@@ -343,8 +387,17 @@ static const struct ili9805_desc gpm1780a0_desc = {
 	.height_mm = 65,
 };
 
+static const struct ili9805_desc tm041xdhg01_desc = {
+	.init = tm041xdhg01_init,
+	.init_length = ARRAY_SIZE(tm041xdhg01_init),
+	.mode = &tm041xdhg01_timing,
+	.width_mm = 42,
+	.height_mm = 96,
+};
+
 static const struct of_device_id ili9805_of_match[] = {
 	{ .compatible = "giantplus,gpm1790a0", .data = &gpm1780a0_desc },
+	{ .compatible = "tianma,tm041xdhg01", .data = &tm041xdhg01_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ili9805_of_match);
-- 
2.32.0

