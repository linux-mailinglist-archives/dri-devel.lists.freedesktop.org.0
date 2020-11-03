Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748352A3E9C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AB06EC48;
	Tue,  3 Nov 2020 08:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEBB6E027
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 05:21:06 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y16so17668742ljk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 21:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qUicjP+v0HaQMZynXCSs8AooRA15wIyKRPujWnHwXA=;
 b=gTLt9LU4dNi71Ach/3FommeyVFcloj4FE0O5y/oJtVmUFbk2YKaHnhJCks2FSFu3eU
 WZW30LZTgHPxVlQ6t3tbL9TyKmHKz6Sa00kHMADyxTIlFyOsonfafAkKbo52YOBFgj6L
 b35McKkPBbWzABNMKgL/+FR4PzXgZGuG0TtfKxrkok0T8j9jawqkAyYyxkAlpeHa3bJp
 eem30aERkMDUcLS4n8znrEzGnTkT+ETACzW6oRAFCE0e8Bl6LavZyAJeWp2tXtMlmD6P
 U1g0hpHjwWJ2xZQqFd5rhX0ZepMrMcteNQicmatSQW6jFgy/0welWHyPYZ6nqgm241u2
 XlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qUicjP+v0HaQMZynXCSs8AooRA15wIyKRPujWnHwXA=;
 b=gBDyvoNOJeFHTXcl3bOkWDM+/nuuG7yvxRmSE/4ifhiXA69RNzFgVkF44HWa0G0wIO
 HO4cO8WNVgQESRV/DPF+cB6QQuKHGmYRe3cyhC+lOxaJgV9qtr5RaWLlXfy5pFWo2LKn
 GeNbsDa339kDy8cETUK5LJkd9W5brdj23PSDwEKt0kJmMsOtg/ypNmKy0N0CSnsH/Kia
 DCAPLCxAcqDJeKXmXNVetc3QY8CGXVjZE6OFUMDNQRAxvebeJmaUmIPtJmHWdT+YKkT1
 kXWFk+fo8oAjo/GC4Sq/QM49pH2T02yoII0DZxHXkGhPsaRzYHew1hO+RMpdVGaIc8C8
 OyKw==
X-Gm-Message-State: AOAM533QvXpXmoYUIrbru97L3IVrAKiOWdTMkiMyYdq+6HOoZKnFWzgt
 /eTcxsEiPmI/rAip+ofrvL8Ihg==
X-Google-Smtp-Source: ABdhPJy7kXRfNzR867c0ewzrxViD/OGfhbRsiHJBS6wEA43Csv4zRqJrzCC/fEeTIRM8PWj9wRJ6YA==
X-Received: by 2002:a2e:7217:: with SMTP id n23mr8067777ljc.43.1604380865255; 
 Mon, 02 Nov 2020 21:21:05 -0800 (PST)
Received: from eriador.lan ([94.25.229.254])
 by smtp.gmail.com with ESMTPSA id d26sm3649474ljj.102.2020.11.02.21.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 21:21:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH] drm/msm/dpu: enable DSPP support on SM8[12]50
Date: Tue,  3 Nov 2020 08:21:02 +0300
Message-Id: <20201103052102.1465314-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Harigovindan P <harigovi@codeaurora.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for color correction sub block on SM8150 and SM8250.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 26 +++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  3 +--
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index bb1add2e49dd..240a21c5e5fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -466,9 +466,9 @@ static const struct dpu_lm_cfg sc7180_lm[] = {
 
 static const struct dpu_lm_cfg sm8150_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
@@ -487,16 +487,28 @@ static const struct dpu_dspp_sub_blks sc7180_dspp_sblk = {
 		.len = 0x90, .version = 0x10000},
 };
 
-#define DSPP_BLK(_name, _id, _base) \
+static const struct dpu_dspp_sub_blks sm8150_dspp_sblk = {
+	.pcc = {.id = DPU_DSPP_PCC, .base = 0x1700,
+		.len = 0x90, .version = 0x40000},
+};
+
+#define DSPP_BLK(_name, _id, _base, _sblk) \
 		{\
 		.name = _name, .id = _id, \
 		.base = _base, .len = 0x1800, \
 		.features = DSPP_SC7180_MASK, \
-		.sblk = &sc7180_dspp_sblk \
+		.sblk = _sblk \
 		}
 
 static const struct dpu_dspp_cfg sc7180_dspp[] = {
-	DSPP_BLK("dspp_0", DSPP_0, 0x54000),
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, &sc7180_dspp_sblk),
+};
+
+static const struct dpu_dspp_cfg sm8150_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, &sm8150_dspp_sblk),
 };
 
 /*************************************************************
@@ -888,6 +900,8 @@ static void sm8150_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.sspp = sdm845_sspp,
 		.mixer_count = ARRAY_SIZE(sm8150_lm),
 		.mixer = sm8150_lm,
+		.dspp_count = ARRAY_SIZE(sm8150_dspp),
+		.dspp = sm8150_dspp,
 		.pingpong_count = ARRAY_SIZE(sm8150_pp),
 		.pingpong = sm8150_pp,
 		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
@@ -919,6 +933,8 @@ static void sm8250_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
 		.sspp = sm8250_sspp,
 		.mixer_count = ARRAY_SIZE(sm8150_lm),
 		.mixer = sm8150_lm,
+		.dspp_count = ARRAY_SIZE(sm8150_dspp),
+		.dspp = sm8150_dspp,
 		.pingpong_count = ARRAY_SIZE(sm8150_pp),
 		.pingpong = sm8150_pp,
 		.merge_3d_count = ARRAY_SIZE(sm8150_merge_3d),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index a7a24539921f..e42f901a7de5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -57,8 +57,7 @@ static void dpu_setup_dspp_pcc(struct dpu_hw_dspp *ctx,
 static void _setup_dspp_ops(struct dpu_hw_dspp *c,
 		unsigned long features)
 {
-	if (test_bit(DPU_DSPP_PCC, &features) &&
-		IS_SC7180_TARGET(c->hw.hwversion))
+	if (test_bit(DPU_DSPP_PCC, &features))
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 }
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
