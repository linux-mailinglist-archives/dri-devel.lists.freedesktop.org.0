Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B4455BF48
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 09:57:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA85E11BCF1;
	Tue, 28 Jun 2022 07:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0996411BCEF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:57:43 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 a11-20020a17090acb8b00b001eca0041455so11589986pju.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 00:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Stsk2/bOU7vOuNWE32xaiTWPsuWgFOSh1G81qAcroFs=;
 b=efvDGc/ev+4cijhfPBF4Nvzs0ZZXbPwU0xQNMKkm4gKXuxNXfvFsypMVj9enPRWDqi
 PAVEbSmWuTTvrK+kuBK9YqUjKTCVa2LFiyIPiuFg5BxhukouXY1SX9WVZrNJYo27/Mbg
 oiJ9y2eoiqadbtnV2Y0wNyNmFSizMGZx4OjZBx2tJ2QgiCI+rqoIzOHfWwfyZU76EerD
 CVG36y/FRvuye/I9qEQ6n7eCTMm/+87SaWW1VippGe/xUZncXJz4eohEo31TzBSNrrvH
 CM74J7TPDHLRy0/Y+tTrgxuJqGZKQkztz+drwsES06Y0GR+KLgPxvj2I9D0I32t+1LjF
 V6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Stsk2/bOU7vOuNWE32xaiTWPsuWgFOSh1G81qAcroFs=;
 b=ADFdATPtuP2p5g3u28zPeZnR+7pS+vRrA3R+f/h3uMx73LClC0IpV1Lw1JFkTMBnHA
 51OTQMRdE4Wy76T6dvoxlTFK5ROMaYpXQ10BA7I8GUnSpbhhpY5UG5XnO7rT0wdMLlts
 3hic7DsExT6fkKuYFfVFCrPD1jl9J9i0B/9T0m5f+qKMbjG0Leu0PyrF8xqg0MR0mCti
 O8GkKAvhUc6g1cwJQMymV1IjM6+OfNEI91C9HWjB7UfoMp3lilZAZQguw8dcPCiHXG8P
 hz2FLB81hEIW3k6CM/QTXwTSEOKmHWyP4gYWsTlsv8HrlGz8REDM1w4/45QZz8sbpONy
 TZoA==
X-Gm-Message-State: AJIora8HThyLBlvvFeNHDmsakp5yCmTCOqjMi08P7oarK/WmbyBpj4q8
 ZpRXWu9HMYDRQ6dA66scO7M=
X-Google-Smtp-Source: AGRyM1uJlUVe1iOIyNUKGWDPgE10yf8e8d2ulYavyVmHfDTzgRpQbDfQXTH5ef6GSc7P2RmMP/oaMA==
X-Received: by 2002:a17:90b:38cc:b0:1ed:474a:a675 with SMTP id
 nn12-20020a17090b38cc00b001ed474aa675mr18224216pjb.149.1656403062615; 
 Tue, 28 Jun 2022 00:57:42 -0700 (PDT)
Received: from chrome.huaqin.com ([101.78.151.222])
 by smtp.gmail.com with ESMTPSA id
 p31-20020a056a000a1f00b0051bdb735647sm8681944pfh.159.2022.06.28.00.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 00:57:42 -0700 (PDT)
From: Rex Nie <rexnie3@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] drm/panel-edp: Add eDP innolux panel support
Date: Tue, 28 Jun 2022 15:57:35 +0800
Message-Id: <20220628075735.2142949-1-rexnie3@gmail.com>
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

