Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2CA67A401
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 21:36:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B2B10E009;
	Tue, 24 Jan 2023 20:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779AD10E063
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 20:36:03 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id qx13so42204420ejb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 12:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HwFJKNSrUsLZF3pRcPrp9cxahQadgD7Il3ZvZ++NO24=;
 b=JGeYk1gZ7GM328h1VDCLBAJX4XuMLdrvCQ8Xai8Wui+Vs3NEsImHs0GaVYlf/TY3Ks
 Lvr0fMZ+Yk+UNWlc+FKMnesDSs4qscikSqjN+rQFr4tf8dSVv55W5Kni5oPqL/+8XU80
 SiiFesSnYBjdZ3JZlmlJxLxPrZNqVmwYqFFU7dCCXXNbpZ3j28pp0u9Qn92pgrAxlcNo
 wtMZtZBgRgo1c+qrd8uvHLNF2LpH0q58Ig4F0aeJvXfVAE0LarnX/Ziw1FFHO0gVm5kI
 3tSiJTlEjFoq0pRXYWfXOPqa4XkTEdf+d8lAjEGblJAcT02EsSr6JiXKcwpAU1htLxPc
 Rh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HwFJKNSrUsLZF3pRcPrp9cxahQadgD7Il3ZvZ++NO24=;
 b=TXXU2C/LPflg5gZ7djbmP4FSDVzLveB7RXZstAdAi07/a1HQkRvaBMdhWko2qJ4nSD
 yD3Th9BrrV/OKPHwnD+zNqnVskflayaoEkCyZMFhxauhrXlQroKItZDZd2cufpIaZNCO
 VMEFi++PRhtIbxeQ2z5eBSjE91jcOWfApeUGccgQ3SJgJHnYcbpNcvfU6AIgd+2pr3N4
 Q7Pm9PDcLOg/BtSK9JnCciEAu3BpZWz17QQYKh2Yz+CMZwB4+xh3+fuqut67MnuNMUEs
 kI71+OdTN5hjLrhd7stCmZtgaDopUehwpOQoZjlgJWjxU6p+Spf9PQksM5Z6T120cGc9
 fehg==
X-Gm-Message-State: AFqh2koQu6WBJd3sE3kX9irGBCn1L0aafFWfrUIUfIwjMeNHTgc3Cq6e
 YrIRv4tmRiRYLY2EC0YLXkIVaA==
X-Google-Smtp-Source: AMrXdXteP4LEALyM4F9F14V8cNbRWseI3yC7j7m0Zi38vdh9alw7GqXpHVWalztCignMGYQ9ufvPag==
X-Received: by 2002:a17:906:b34c:b0:7c0:b770:df94 with SMTP id
 cd12-20020a170906b34c00b007c0b770df94mr28169627ejb.63.1674592561881; 
 Tue, 24 Jan 2023 12:36:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 j5-20020a170906050500b00780982d77d1sm1344255eja.154.2023.01.24.12.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 12:36:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dsi: properly handle the case of empty OPP table in
 dsi_mgr_bridge_mode_valid
Date: Tue, 24 Jan 2023 22:36:00 +0200
Message-Id: <20230124203600.3488766-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It was left unnoticed during the review that even if there is no OPP
table in device tree, one will be created by a call to the function
devm_pm_opp_set_clkname(). This leads to dsi_mgr_bridge_mode_valid()
rejecting all modes if DT contains no OPP table for the DSI host.

Rework dsi_mgr_bridge_mode_valid() to handle this case by actually
checking that the table is populated with frequency entries before
returning an error.

Fixes: 8328041b8c82 ("drm/msm/dsi: implement opp table based check for dsi_mgr_bridge_mode_valid()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index b20fddb534a7..1bbac72dad35 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -456,18 +456,19 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 
 	byte_clk_rate = dsi_byte_clk_get_rate(host, IS_BONDED_DSI(), mode);
 
-	/*
-	 * fail all errors except -ENODEV as that could mean that opp
-	 * table is not yet implemented
-	 */
 	opp = dev_pm_opp_find_freq_ceil(&pdev->dev, &byte_clk_rate);
-	if (IS_ERR(opp)) {
-		if (PTR_ERR(opp) == -ERANGE)
+	if (!IS_ERR(opp)) {
+		dev_pm_opp_put(opp);
+	} else if (PTR_ERR(opp) == -ERANGE) {
+		/*
+		 * An empty table is created by devm_pm_opp_set_clkname() even
+		 * if there is none. Thus find_freq_ceil will still return
+		 * -ERANGE in such case.
+		 */
+		if (dev_pm_opp_get_opp_count(&pdev->dev) != 0)
 			return MODE_CLOCK_RANGE;
-		else if (PTR_ERR(opp) != -ENODEV)
-			return MODE_ERROR;
 	} else {
-		dev_pm_opp_put(opp);
+			return MODE_ERROR;
 	}
 
 	return msm_dsi_host_check_dsc(host, mode);
-- 
2.39.0

