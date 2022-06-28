Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC155BF9C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 10:53:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5480C12A992;
	Tue, 28 Jun 2022 08:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E44512A991
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 08:53:46 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id l6so10454907plg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3IiMMMDPLwz9F3UeFSzYtl7u8epQnprjfnqcTqmPDdc=;
 b=M7FwbiPTrRshJ5EgrsPP+VaYq1MR/BrHKsCNp7qXs2Gn3eknJyZQR1pI797nCEBhZ0
 4QcsntzPyK7fynPM//y8CVknu8gqk/1DTCG2yjXz9uEKfUrWboN0zRKdUeL38lKfovY4
 RNOy0ERd+CxpfopeTzXUGDbhSTg/txJXaZud9pVuSnG+gt5wP5MHVqxonqpWDQ+Br3KZ
 tncEz7nyiYSo4CEe7eXGNHADuOXhcI0FRD/H2IsDyufXgmyZBnidDmVGMtOADgSleBgD
 cHrxBvUOnuNSITpAUmbaqSKDfDIRuzJseLDwuXuXwLOkpGbLI1MEFb0tHUBAPMA1NNG4
 vSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3IiMMMDPLwz9F3UeFSzYtl7u8epQnprjfnqcTqmPDdc=;
 b=Q+Z+OxhCF2kaPM50A1DLUBA9i4zgViPczgbYXWr0kWBNz6rVMz92W0GDXkdDG/SZR+
 zmwxDLqnZgtBDhwjvLgtjmNOTtxEbna2+JSaxhX7FK8HLiehhNoDbCzFASa4oKF1B03a
 QGFCioV8OBzHGEwtisx5J8Y06ZOz45E2lQPmqWp5Bw7016MzHpVpr3HahJUkOj7SVjvl
 hWN4XHOvmtVG38FYIWeYNVjnm/z2cgZhQPh6MfQy8ezy8Mpk6FVQ0By2lSUuWd9xT7yk
 IvA/5z2dE/aFmuMRNcuOoTzAE8oM62/Kk30A55V+Efx+igSCx7+WA0sxy3UUxy+BTZxh
 riTA==
X-Gm-Message-State: AJIora/omcNlByA8F+TT21dmhcwqBZyqg/CkZBvDOMao9rNBfJgBkPkc
 krZ5O/lghoqDh4cTmxam36A=
X-Google-Smtp-Source: AGRyM1tQQaTMMPE0J7kPg5DjNRTKWH4fPNaHPbowka1suIhUb1wyYd5iyqgMSyFEIQR/Xy2Qz8J/8w==
X-Received: by 2002:a17:902:ccc4:b0:156:5d37:b42f with SMTP id
 z4-20020a170902ccc400b001565d37b42fmr2555328ple.157.1656406425734; 
 Tue, 28 Jun 2022 01:53:45 -0700 (PDT)
Received: from chrome.huaqin.com ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id
 md6-20020a17090b23c600b001e305f5cd22sm8875970pjb.47.2022.06.28.01.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 01:53:45 -0700 (PDT)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] drm/panel-edp: Add eDP innolux panel support
Date: Tue, 28 Jun 2022 16:53:37 +0800
Message-Id: <20220628085337.2147369-1-rexnie3@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, spanda@codeaurora.org, robh+dt@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Rex Nie <rexnie3@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 14" innolux,n140hca-eac eDP panel.

Signed-off-by: Rex Nie <rexnie3@gmail.com>
Acked-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3626469c4cc2..2a8fcdffe80c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1355,6 +1355,29 @@ static const struct panel_desc innolux_n125hce_gn1 = {
 	},
 };
 
+static const struct display_timing innolux_n140hca_eac_timing = {
+	.pixelclock = { 72600000, 76420000, 80240000 },
+	.hactive = { 1920, 1920, 1920 },
+	.hfront_porch = { 80, 80, 80 },
+	.hback_porch = { 190, 190, 190 },
+	.hsync_len = { 60, 60, 60 },
+	.vactive = { 1080, 1080, 1080 },
+	.vfront_porch = { 6, 6, 6 },
+	.vback_porch = { 38, 38, 38 },
+	.vsync_len = { 8, 8, 8 },
+	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW,
+};
+
+static const struct panel_desc innolux_n140hca_eac = {
+	.timings = &innolux_n140hca_eac_timing,
+	.num_timings = 1,
+	.bpc = 6,
+	.size = {
+		.width = 309,
+		.height = 174,
+	},
+};
+
 static const struct drm_display_mode innolux_p120zdg_bf1_mode = {
 	.clock = 206016,
 	.hdisplay = 2160,
@@ -1775,6 +1798,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,n125hce-gn1",
 		.data = &innolux_n125hce_gn1,
+	}, {
+		.compatible = "innolux,n140hca-eac",
+		.data = &innolux_n140hca_eac,
 	}, {
 		.compatible = "innolux,p120zdg-bf1",
 		.data = &innolux_p120zdg_bf1,
-- 
2.25.1

