Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4457A7E755B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 00:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25AF10E240;
	Thu,  9 Nov 2023 23:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD1210E240
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 23:56:51 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-77784edc2edso91058585a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 15:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1699574210; x=1700179010; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KOGnrwGuPglkUh0+Fj19u8kSBzGFAbbmPxBOgbMVl8k=;
 b=NIsVLCjIEIkyKygGxfohyKqa1m6QcKaWIoW92kbYXXPh3C5VOijUcHJ16UV+gK0qYV
 og1tAMoFt/YNViBe5BwQtmBeT4LpE1KBadF20BOFEZ+1gk1o6tGL7LJwg58Ru2ZJTd6S
 ExXQN76/epZDweD3dab93lt/RfCrow05RwrSSPAACvsm213K//xKinSi7jIJBE31OcKh
 IaKjVZE8zWwiXUClipNESAwZzXxBXrxIi1XvxgcwlmIXlDcdsiJQmsRMnmFeTU1JNGsz
 U8e43EvdANSz2cgUDueMpwtJeGbbhjJF0IpaonbLlI5G9uzVj8AKv3FQMWtNBBqnmHzt
 nz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699574210; x=1700179010;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KOGnrwGuPglkUh0+Fj19u8kSBzGFAbbmPxBOgbMVl8k=;
 b=mKXgCONNUzqaLAv/S68nxsBHQGVJuAGiGbkK+hYqzr2ZiGrNawwOvnqX+aiTToY5qY
 0A4nhNLdFzG9ajrXvOPmpH+pceKsVgV7qV4wGDKuCmdMEly/b5OlqG7dBub2ErvStAu0
 zHrk+6861YQfqyupiz+gDkH4xFK/A0UAztBnxZ41J3Fq83cSAwFdM3Iw4DH4/kXd+rTt
 eYP+uP+gw4KFsPwUG0YlQgTxiGPieoZrGZXP19v3BusHB0gOVV/ETq8M7jdgPovaeYRo
 wqnlzlytB1PjaqbiDQ5kAHwePG9HYD9izXMSuz1YMNPFKS04Hvb65+svUQa3WnAKZnaQ
 a1Ww==
X-Gm-Message-State: AOJu0YyysT6eo2fAm/ga+Qmv5Qd2NAwD8Qg5Ytby/V4dDTL2T501wO88
 0ch7sEXMpFJuLRIIv3fu0RsU6P/aRs5M6ZosPv8=
X-Google-Smtp-Source: AGHT+IGCEs76KiGmSEnDezMN2gqFvgJH8aqukcTT1Et69lNkzS+DPn40neuscPII0MMkpYwp9e1tCQ==
X-Received: by 2002:a05:620a:29c9:b0:778:91f0:e541 with SMTP id
 s9-20020a05620a29c900b0077891f0e541mr7487802qkp.23.1699574210077; 
 Thu, 09 Nov 2023 15:56:50 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 bl1-20020a05620a1a8100b00777063b89casm299211qkb.5.2023.11.09.15.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 15:56:49 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy
Date: Thu,  9 Nov 2023 18:54:10 -0500
Message-Id: <20231109235412.29343-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: Vinod Koul <vkoul@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the same value as the downstream driver. This change is needed for CPHY
mode to work correctly.

Fixes: 93f0ca6fd61c ("drm/msm/dsi: fix VREG_CTRL_1 value for 4nm cphy")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 3b1ed02f644d..89a6344bc865 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -918,7 +918,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
 		if (phy->cphy_mode) {
 			vreg_ctrl_0 = 0x45;
-			vreg_ctrl_1 = 0x45;
+			vreg_ctrl_1 = 0x41;
 			glbl_rescode_top_ctrl = 0x00;
 			glbl_rescode_bot_ctrl = 0x00;
 		} else {
-- 
2.26.1

