Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2792769406
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 13:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8815310E25C;
	Mon, 31 Jul 2023 11:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBA410E25C
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 11:00:44 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bbf0f36ce4so15742125ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20221208.gappssmtp.com; s=20221208; t=1690801244; x=1691406044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/44d4gE6s90tJ4HpPTJnrDZsNfnP3IoIMwE03rP6nw=;
 b=b3ZHVX6YzJck8pzSA3I7P/Qai2d3M5FOXfj79iwJ7tadVo4ydDSqTCo0K0gjSxzsUh
 uQGNtTUAJ6AE+WlA2eBXDeccaOqRfXp7lkEjcleh7VdGIbhLkRdf1z4JvPIfIVANPWej
 G5zlBrBcO5GEpvrforXkuyQTFSgTzdr+h5EI5ADaEf1vlTSVkL5XUkofBnwBghUeWRmb
 KAxR0lKu4XtLYOT8LFY7krOrgAZ2pBzRk1FRoovjmpKl0KVpwYjbCv7aEJ9dIqa9s0cZ
 vKHYriCg0yfM5ga2IuxAlMiX+b3B+oW7K9RdKQS3xhHDmTWzz3r/aRDXJkIxo2kgknNZ
 8Z6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690801244; x=1691406044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/44d4gE6s90tJ4HpPTJnrDZsNfnP3IoIMwE03rP6nw=;
 b=LrVmXKRfOn07cjg6PZs7QIq4Tu0Wi+m/5EW2PFt6/Vf7aVbAKCOIHFN2aSH3iJD0x4
 X4Z9+crHQOwjoSDjvJu6KG8Hot7J+Sc+SYuef9sSGRJc5HLIT/H5diwzgw5nU79jO5Mu
 eizJzufVPrUIEAGYO0rNavOcgrpHL8rDP7rii6KGhSrbRuKTqf0NAmjQRQp7RuI8OAIA
 C//+WFuUgOSK5VvQIGZWz941RM+V2eK6J9PJw38esJVEnAkAt/wwrYaHEOspUn7je1Ht
 H9K0fqX63q7hL/d+d7+aUJS+PTW8kjWJhLMuwPz1Q41YC5gQIm4msYmpvs21Mrlv2vFX
 7VRQ==
X-Gm-Message-State: ABy/qLYwwbNZyqRZ0eCYDn/lOX1zKMNfCfdkk9n34FpmrM84etNa8Zva
 S8tAUzGz9qw/Y66+kBM03jmA3yPpOgejNsxjnrGPSA==
X-Google-Smtp-Source: APBJJlEBCCUKqrbud2fZPNHB09BhUDJFQrxUOBlXTBBSux2ugg2ShoIkCVkM4cgzVJSWlIogtNilTw==
X-Received: by 2002:a17:903:455:b0:1b5:5a5f:369b with SMTP id
 iw21-20020a170903045500b001b55a5f369bmr8118251plb.65.1690801244371; 
 Mon, 31 Jul 2023 04:00:44 -0700 (PDT)
Received: from localhost.localdomain ([49.205.243.15])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1709028c8e00b001b1a2c14a4asm8281096plo.38.2023.07.31.04.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jul 2023 04:00:43 -0700 (PDT)
From: Jagan Teki <jagan@edgeble.ai>
To: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 06/14] drm/rockchip: vop: Add rv1126 vop_lite support
Date: Mon, 31 Jul 2023 16:30:04 +0530
Message-Id: <20230731110012.2913742-7-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230731110012.2913742-1-jagan@edgeble.ai>
References: <20230731110012.2913742-1-jagan@edgeble.ai>
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RV1126 VOP_LITE supports the video output processing ofMIPI DSI,
RGB display interfaces with max output resolution of 1920x1080.

Add support for rv1126 vop.

Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Cc: dri-devel@lists.freedesktop.org
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 55 +++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 7b2805006776..d053ef027552 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -1120,6 +1120,59 @@ static const struct vop_data rk3328_vop = {
 	.max_output = { 4096, 2160 },
 };
 
+static const struct vop_common rv1126_common = {
+	.standby = VOP_REG_SYNC(PX30_SYS_CTRL2, 0x1, 1),
+	.out_mode = VOP_REG(PX30_DSP_CTRL2, 0xf, 16),
+	.dsp_blank = VOP_REG(PX30_DSP_CTRL2, 0x1, 14),
+	.dither_down_en = VOP_REG(PX30_DSP_CTRL2, 0x1, 8),
+	.dither_down_sel = VOP_REG(PX30_DSP_CTRL2, 0x1, 7),
+	.dither_down_mode = VOP_REG(PX30_DSP_CTRL2, 0x1, 6),
+	.cfg_done = VOP_REG_SYNC(PX30_REG_CFG_DONE, 0x1, 0),
+	.dither_up = VOP_REG(PX30_DSP_CTRL2, 0x1, 2),
+	.dsp_lut_en = VOP_REG(PX30_DSP_CTRL2, 0x1, 5),
+	.gate_en = VOP_REG(PX30_DSP_CTRL2, 0x1, 0),
+};
+
+static const struct vop_modeset rv1126_modeset = {
+	.htotal_pw = VOP_REG(PX30_DSP_HTOTAL_HS_END, 0x0fff0fff, 0),
+	.hact_st_end = VOP_REG(PX30_DSP_HACT_ST_END, 0x0fff0fff, 0),
+	.vtotal_pw = VOP_REG(PX30_DSP_VTOTAL_VS_END, 0x0fff0fff, 0),
+	.vact_st_end = VOP_REG(PX30_DSP_VACT_ST_END, 0x0fff0fff, 0),
+};
+
+static const struct vop_output rv1126_output = {
+	.rgb_dclk_pol = VOP_REG(PX30_DSP_CTRL0, 0x1, 1),
+	.rgb_pin_pol = VOP_REG(PX30_DSP_CTRL0, 0x7, 2),
+	.rgb_en = VOP_REG(PX30_DSP_CTRL0, 0x1, 0),
+	.mipi_dclk_pol = VOP_REG(PX30_DSP_CTRL0, 0x1, 25),
+	.mipi_pin_pol = VOP_REG(PX30_DSP_CTRL0, 0x7, 26),
+	.mipi_en = VOP_REG(PX30_DSP_CTRL0, 0x1, 24),
+};
+
+static const struct vop_misc rv1126_misc = {
+	.global_regdone_en = VOP_REG(PX30_SYS_CTRL2, 0x1, 13),
+};
+
+static const struct vop_win_data rv1126_vop_win_data[] = {
+	{ .base = 0x00, .phy = &px30_win0_data,
+	  .type = DRM_PLANE_TYPE_OVERLAY },
+	{ .base = 0x00, .phy = &px30_win2_data,
+	  .type = DRM_PLANE_TYPE_PRIMARY },
+};
+
+static const struct vop_data rv1126_vop = {
+	.version = VOP_VERSION(2, 0xb),
+	.intr = &px30_intr,
+	.common = &rv1126_common,
+	.modeset = &rv1126_modeset,
+	.output = &rv1126_output,
+	.misc = &rv1126_misc,
+	.win = rv1126_vop_win_data,
+	.win_size = ARRAY_SIZE(rv1126_vop_win_data),
+	.max_output = { 1920, 1080 },
+	.lut_size = 1024,
+};
+
 static const struct of_device_id vop_driver_dt_match[] = {
 	{ .compatible = "rockchip,rk3036-vop",
 	  .data = &rk3036_vop },
@@ -1147,6 +1200,8 @@ static const struct of_device_id vop_driver_dt_match[] = {
 	  .data = &rk3228_vop },
 	{ .compatible = "rockchip,rk3328-vop",
 	  .data = &rk3328_vop },
+	{ .compatible = "rockchip,rv1126-vop",
+	  .data = &rv1126_vop },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vop_driver_dt_match);
-- 
2.25.1

