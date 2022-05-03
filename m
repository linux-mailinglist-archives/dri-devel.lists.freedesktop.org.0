Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262A8518F2A
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 22:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BBE10E66F;
	Tue,  3 May 2022 20:43:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD1510F49C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 20:43:43 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h29so25012433lfj.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 13:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BZXNy598rjzssFVD4qqnZnAbN1Mi7pj3r4jBP97stCk=;
 b=aFed9C8zIczapSE4riexLt2XAw8h3LYQtY5IQY+ksLkEQDCcFzc3V2U5C6ZMNPZ7n7
 68cmZlUPlcNdgurL+47g3j2gXWj4TOkuqvnfAD7dCX0oaFic5IVB8WTPSo1TJuXuS9Bn
 esBKOdtY7tZdfwmU8BbKO4h4toxuHjZcJh//BAJskyrJWgwIUTcmtNB+Nki2SAt1A0f5
 je/otKYLIQsudjFd94fhdlWhb7X9bf4Xk8Yb2Z319l+5BmthjB4mwdtyMa2U54SY/E8y
 gQJapgBBtiSqPqupZVt0Ly9ligt/FhpgKarnSDDrtt37sqkElSdhHayhWX0I+qS6ni0l
 Tdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BZXNy598rjzssFVD4qqnZnAbN1Mi7pj3r4jBP97stCk=;
 b=kocLGnmVLB2v0PebhnUzIlZIy/bTUB9NgcSBV+txzZwGLagvNbCL2ywDbiaEg5lviC
 PZ6StEiBBGtXZ0tq0DTeUecxbVVowo9aP4M7QWvvqf9wJa41OFBeoGiWuU/V+ySg+K61
 uCCfzG+rYEWwF9l+K2Qy1wLyFG7EtSOPv25y3zgvyZ386DpGB7sUqWYLDzKBPzmc3Vi8
 gdM/x8Std97utS0bXlvsogyiqv9RbLNVzTKMeVv5VhzCqBQ+sDkOs1nTRXPGLTIe5/DB
 M60d8G9keQjnpgIN3reYQjrsjMbGrsKk1IS9v7Xb9wty5o81tpaZdCHbr/4f/au3TE8E
 8rFw==
X-Gm-Message-State: AOAM533vcoJ2RoPlvPLELsq3FWfBFtSyHqkwn6bFtNgFk1dDQmMpqlAP
 kALtKfrNuKcs3DeK0z0sIgEeEQ==
X-Google-Smtp-Source: ABdhPJz6J5roxRVpi41gL6zeVD4OzrjgvjOG0MNPEhPP+HQNkQ/eKSYLNbmKQDvh4Lzaa/I+Gt7ptQ==
X-Received: by 2002:a05:6512:a85:b0:473:bb9e:fc51 with SMTP id
 m5-20020a0565120a8500b00473bb9efc51mr278231lfu.31.1651610621680; 
 Tue, 03 May 2022 13:43:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 5-20020a2eb945000000b0024f3d1dae81sm1462085ljs.9.2022.05.03.13.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 13:43:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dsi: fix address for second DSI PHY on SDM660
Date: Tue,  3 May 2022 23:43:40 +0300
Message-Id: <20220503204340.935532-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct a typo in the address of the second DSI PHY in the SDM660 device
config.

Fixes: 694dd304cc29 ("drm/msm/dsi: Add phy configuration for SDM630/636/660")
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 75557ac99adf..8199c53567f4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1062,7 +1062,7 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	},
 	.min_pll_rate = VCO_MIN_RATE,
 	.max_pll_rate = VCO_MAX_RATE,
-	.io_start = { 0xc994400, 0xc996000 },
+	.io_start = { 0xc994400, 0xc996400 },
 	.num_dsi_phy = 2,
 };
 
-- 
2.35.1

