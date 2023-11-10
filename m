Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFCC7E75A1
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B7510E34C;
	Fri, 10 Nov 2023 00:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3767C10E38C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:03:32 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-66d09b6d007so9460316d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1699574611; x=1700179411; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X8kRvGVwwQROTbtBALdJ/O4XXBQy9n/2BNY8tadKsdI=;
 b=NDD+1uooTrY1Mb+7b38RFKqM++EBCwqqM5hCdasZ70VEMplx8qjzYnw0gOkpYg4K5i
 UkIjJkgSLATFdmrEGxYvNdMQb3HUMMgbhN0qNIrU6hU4AZAjUeWCkgbUFiTvOgWecERB
 jpkYYgUMWFZrNFFfASurcAmJqXj+4LBIIid2SHCI2ewDM7666Xa+aOSF4EXRZTJTcyND
 gVFyqJcyEoYVY6KLKPbOh8xJNB4Rfgmu1SNDy8wVdcKvzmKv5lDH8kBRHrL7n2EdtGko
 bCMWcrAxMDYbouosGr3qYZVx+vAac1dwsSmD4NOWj7qvE0g9E6vgdB/SR324/UtNrPlm
 7/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699574611; x=1700179411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X8kRvGVwwQROTbtBALdJ/O4XXBQy9n/2BNY8tadKsdI=;
 b=CQyHGpa74RWFxjr5tp8206+XDcqtfxcvRp1bNP8T1Otz61LBI/YtZOAQiAO37cyDf5
 9mx0vkACwqf0UKZ+mDnI89KWbJxzmxxIEwMW/gKWju7xkYAynDKD8K7QitoCRDpZXVBZ
 TXeMavGEFzDhMXLPnm32pSIxT501dJe1MDc83BxgJo2lB5pHPQrV1vPC6saVhPZZvPuT
 wt4S/XCClEnj+xQT6hCfaom6VLaFesS6XZdnvKbhD3UKxxXAyCej5aJSrjEvNPyyFPe4
 qbYisdK1/3bETerQVYcieyy20VExfufb4GiX/bc8wWddAA/9rDffvO1GKDH1H4nDJRab
 a18Q==
X-Gm-Message-State: AOJu0Yx9vA3c6xlN2VyFF93g/LXeZRYOhScBfAHsDuxyPkEw2CRFQkZa
 rexiJgIlRFjt1fJw3tN0WoblUw==
X-Google-Smtp-Source: AGHT+IGYCXADfCmllu0MdkQC6KJQ2Cnx9eUW550qzPyNlADCiAziRwgvnW3qjd1nZZKBRjkl2P01xQ==
X-Received: by 2002:a05:6214:411:b0:66d:1624:2203 with SMTP id
 z17-20020a056214041100b0066d16242203mr7062080qvx.20.1699574611676; 
 Thu, 09 Nov 2023 16:03:31 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a0cfe04000000b0065b0554ae78sm2455969qvr.100.2023.11.09.16.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 16:03:31 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dsi: use the correct VREG_CTRL_1 value for 4nm cphy
Date: Thu,  9 Nov 2023 19:02:14 -0500
Message-Id: <20231110000216.29979-1-jonathan@marek.ca>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the same value as the downstream driver. This change is needed for CPHY
mode to work correctly.

Fixes: 8b034e6771113 ("drm/msm/dsi: add support for DSI-PHY on SM8550")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
v2: fixed the Fixes: line

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

