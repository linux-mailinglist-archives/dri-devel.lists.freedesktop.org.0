Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128026C9AA1
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 06:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F7A10E02A;
	Mon, 27 Mar 2023 04:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56F310E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 04:48:23 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 r7-20020a17090b050700b002404be7920aso6555412pjz.5
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 21:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679892503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b9Pd7dqqy0hzxVLL2WGmjbhWP2DILZx6QykeCiryBUI=;
 b=K76RAZ1rXnvXwh51XE0jU9ANX5FNSrfzvv804NOC2TOvQFUWDwOdMO1tgOdcUCrLDj
 SPcv4LgYZBA1gszS1K8Y0YwU0xEBA88q35DS7Y3KL7Akm8dmND7Gkx6fO4OMh0Gj1gnU
 gPFaD7hzL8aslS/A0P5SeX5Bv/cwJQraQA58A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679892503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b9Pd7dqqy0hzxVLL2WGmjbhWP2DILZx6QykeCiryBUI=;
 b=BUeDp+1BkN4JOLI+JwKKDcMKKP775sEqKYz2+WuJtNJZwSn6VFvjr05oPquUTjl0Sv
 bekFcX671kFPnXZVD3G64giV77TGPeInYsSeRLhiKbTYxhkybM/2ek0zSY7r5Imkd0xW
 9OKNlu5+4lwPJf3OHqUnMTRRUFFCJjfZvpamRCy57fqk2lJXIWuD02X8oMPJXoMPgEFj
 CBtWHVeEicp2HcVRoSufF2SadViE+8SG7sHXWfPOeq21NgrcONnPFWjubdNJiNF6jE1s
 Lz9FRuvZje/1Fi6INfSZnmsVuxD7tg8fvd8/nEnHiShqnwOnnmUQEWGY3UgGi5oggFx4
 rnAg==
X-Gm-Message-State: AO0yUKXbxv7OZIAMDM9dWSseoCL3wzzM+t+x+crqc3RkRXccMOOn610b
 bLDwCBWMeJMizEa+satY9nycYw==
X-Google-Smtp-Source: AK7set9p4OT6xKcpkNGCwHVp4BJQ0FTKN5V2C7YZEhCatLt09GE1Wxy/Uo9rbm+ZpJ3Rkw5qWwmAwA==
X-Received: by 2002:a05:6a20:47e2:b0:da:adbf:7b96 with SMTP id
 ey34-20020a056a2047e200b000daadbf7b96mr8761684pzb.21.1679892503103; 
 Sun, 26 Mar 2023 21:48:23 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5824:3912:1493:4862])
 by smtp.gmail.com with ESMTPSA id
 e25-20020aa78c59000000b0058837da69edsm17884391pfd.128.2023.03.26.21.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 21:48:22 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <rfoss@kernel.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] drm/bridge: it6505: Add range and selector_reg
Date: Mon, 27 Mar 2023 12:48:05 +0800
Message-Id: <20230327044804.3657551-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 kenneth.hung@ite.corp-partner.google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are 2 banks on it6505, and when writing to different bank,
REG_BANK_SEL needs to be set to the targeted bank. The current code set
this additionally, which causes a race condition when a process is
writing bank 0 registers while another process set the bank to 1. Set
ranges in regmap config so the regmap API would handle the bank changes.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 34 +++++++++++++++++++----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index bc451b2a77c28..abaf6e23775eb 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -258,12 +258,12 @@
 #define REG_AUD_INFOFRAM_SUM 0xFB
 
 /* the following six registers are in bank1 */
-#define REG_DRV_0_DB_800_MV 0x7E
-#define REG_PRE_0_DB_800_MV 0x7F
-#define REG_PRE_3P5_DB_800_MV 0x81
-#define REG_SSC_CTRL0 0x88
-#define REG_SSC_CTRL1 0x89
-#define REG_SSC_CTRL2 0x8A
+#define REG_DRV_0_DB_800_MV 0x17E
+#define REG_PRE_0_DB_800_MV 0x17F
+#define REG_PRE_3P5_DB_800_MV 0x181
+#define REG_SSC_CTRL0 0x188
+#define REG_SSC_CTRL1 0x189
+#define REG_SSC_CTRL2 0x18A
 
 #define RBR DP_LINK_BW_1_62
 #define HBR DP_LINK_BW_2_7
@@ -489,7 +489,7 @@ static const struct it6505_audio_sample_rate_map audio_sample_rate_map[] = {
 };
 
 static const struct regmap_range it6505_bridge_volatile_ranges[] = {
-	{ .range_min = 0, .range_max = 0xFF },
+	{ .range_min = 0, .range_max = 0x1FF },
 };
 
 static const struct regmap_access_table it6505_bridge_volatile_table = {
@@ -497,11 +497,27 @@ static const struct regmap_access_table it6505_bridge_volatile_table = {
 	.n_yes_ranges = ARRAY_SIZE(it6505_bridge_volatile_ranges),
 };
 
+static const struct regmap_range_cfg it6505_regmap_banks[] = {
+	{
+		.name = "it6505",
+		.range_min = 0x00,
+		.range_max = 0x1FF,
+		.selector_reg = REG_BANK_SEL,
+		.selector_mask = 0x1,
+		.selector_shift = 0,
+		.window_start = 0x00,
+		.window_len = 0x100,
+	},
+};
+
 static const struct regmap_config it6505_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.volatile_table = &it6505_bridge_volatile_table,
 	.cache_type = REGCACHE_NONE,
+	.ranges = it6505_regmap_banks,
+	.num_ranges = ARRAY_SIZE(it6505_regmap_banks),
+	.max_register = 0x1FF,
 };
 
 static int it6505_read(struct it6505 *it6505, unsigned int reg_addr)
@@ -1267,7 +1283,6 @@ static void it6505_init(struct it6505 *it6505)
 	it6505_write(it6505, REG_TIME_STMP_CTRL,
 		     EN_SSC_GAT | EN_ENHANCE_VID_STMP | EN_ENHANCE_AUD_STMP);
 	it6505_write(it6505, REG_INFOFRAME_CTRL, 0x00);
-	it6505_write(it6505, REG_BANK_SEL, 0x01);
 	it6505_write(it6505, REG_DRV_0_DB_800_MV,
 		     afe_setting_table[it6505->afe_setting][0]);
 	it6505_write(it6505, REG_PRE_0_DB_800_MV,
@@ -1277,7 +1292,6 @@ static void it6505_init(struct it6505 *it6505)
 	it6505_write(it6505, REG_SSC_CTRL0, 0x9E);
 	it6505_write(it6505, REG_SSC_CTRL1, 0x1C);
 	it6505_write(it6505, REG_SSC_CTRL2, 0x42);
-	it6505_write(it6505, REG_BANK_SEL, 0x00);
 }
 
 static void it6505_video_disable(struct it6505 *it6505)
@@ -1506,11 +1520,9 @@ static void it6505_setup_ssc(struct it6505 *it6505)
 	it6505_set_bits(it6505, REG_TRAIN_CTRL0, SPREAD_AMP_5,
 			it6505->enable_ssc ? SPREAD_AMP_5 : 0x00);
 	if (it6505->enable_ssc) {
-		it6505_write(it6505, REG_BANK_SEL, 0x01);
 		it6505_write(it6505, REG_SSC_CTRL0, 0x9E);
 		it6505_write(it6505, REG_SSC_CTRL1, 0x1C);
 		it6505_write(it6505, REG_SSC_CTRL2, 0x42);
-		it6505_write(it6505, REG_BANK_SEL, 0x00);
 		it6505_write(it6505, REG_SP_CTRL0, 0x07);
 		it6505_write(it6505, REG_IP_CTRL1, 0x29);
 		it6505_write(it6505, REG_IP_CTRL2, 0x03);
-- 
2.40.0.348.gf938b09366-goog

