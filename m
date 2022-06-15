Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DF854CA8D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 15:59:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D9E10F6AF;
	Wed, 15 Jun 2022 13:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A551D10F272
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 13:59:39 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id t25so19025203lfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s7APmfDxZ9CONW1VV/1LqJYroxXkuoozEYXQ/yDdg20=;
 b=hyUqcZekXRgexYiKGD2q8zWkKeqPJpYyK8qDciad4fo4gdkZHdrGE+QfWvb7Y+HUpy
 Z2885KQ6v3JJr/GlZnq0czEvvj3i2lsifzcBg8P3C3vfqu/7UZykhqTfPdvm83ib2613
 vChWIywetv8A7hbaN7FSop/gVtVhUF44skXbRM8CODxPOfPe0zueEHVd8IjbdHOjGOBJ
 nL9CNDN2cetMUrivD1pq7v/Kc0a4KLwFSJe5OxA3XYzJ6PEqOjxjsuMRo1pvIUsMmlBW
 zfqKo946LvQZTmNGrIFsix6LK1+OeXS2UgbiWYKU/jboeCcFlzb/R9EkNYgA8W431po/
 0mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s7APmfDxZ9CONW1VV/1LqJYroxXkuoozEYXQ/yDdg20=;
 b=owPPKNh/8aVC1QEvt5suZao+jmGsCP/QcaeZuK3Da3aoXd3AgSpL1hy/poLcrRajmP
 FPSvCnicSyeOki3/0RlUuhIOEJqBfZOTgxaIH2n0iZpsE6Uu3XJ4iAroetIa6h0DDm5z
 IS0aLprZ9zjX6TVetPGFsoAwSSt1VnB9hBXhi4O6SCvBE/RXthR18yC2X/zg5PQIruZ6
 zw8PsDjnuAQYerPXO1OzadEfHMHAhHJ1JAytDZI87aCkOVb+frv8RumH9GSsiP95K0eg
 oppCpw7Cvo1he4OgKYCxMPpJGoMsKw2UiMV+pWnveAexRD8xpAxsSAvkBVCoZ4GGL+4+
 oTOQ==
X-Gm-Message-State: AJIora+pXdEKx8QZh4OG+app635PBNsQm5z+4Mafvmb09yR5GcFXYjpL
 RNAcxQCVGiGu8Hthhw9v02SF9w==
X-Google-Smtp-Source: AGRyM1u1X5RspLOTnKenLe+Uy7DLhi2ZnRQC6OJVD8m35jxqQZmL/Z+mYrb0acxUvkmsApX9De9p8w==
X-Received: by 2002:a05:6512:b86:b0:47d:ba62:8c11 with SMTP id
 b6-20020a0565120b8600b0047dba628c11mr6083614lfv.328.1655301578016; 
 Wed, 15 Jun 2022 06:59:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8e97000000b0025530fa4edesm1694962ljk.49.2022.06.15.06.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 06:59:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 2/5] drm/msm/mdss: enable optional core clock for MDP5 MDSS
Date: Wed, 15 Jun 2022 16:59:32 +0300
Message-Id: <20220615135935.87381-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable (optional) core (MDP_CLK) clock that allows accessing HW_REV
registers during the platform init.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index b41848bfff91..f7b4628986b8 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -288,7 +288,7 @@ static int msm_mdss_reset(struct device *dev)
 /*
  * MDP5 MDSS uses at most three specified clocks.
  */
-#define MDP5_MDSS_NUM_CLOCKS 3
+#define MDP5_MDSS_NUM_CLOCKS 4
 static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks)
 {
 	struct clk_bulk_data *bulk;
@@ -305,6 +305,7 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 	bulk[num_clocks++].id = "iface";
 	bulk[num_clocks++].id = "bus";
 	bulk[num_clocks++].id = "vsync";
+	bulk[num_clocks++].id = "core"; /* for hw_rev access */
 
 	ret = devm_clk_bulk_get_optional(&pdev->dev, num_clocks, bulk);
 	if (ret)
-- 
2.35.1

