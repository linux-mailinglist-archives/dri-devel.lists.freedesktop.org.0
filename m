Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 642D67219D6
	for <lists+dri-devel@lfdr.de>; Sun,  4 Jun 2023 22:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176F910E16F;
	Sun,  4 Jun 2023 20:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9427110E0EC
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:39 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so492844e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910937; x=1688502937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5VOufof82LdFXq5Avw+IGoCuTtc/4cJuL5op7JwlHY8=;
 b=t8Dx2MZXa/kjTK+yqDR4tf1xmW0Qharjw0NxKnhxIrwXQA+bnilsKzreaHsQc2QTdR
 QljmL79jlfIbU6BxoE+u9npAWEFyD8KnQu/rXSvY960bw6fKAgR6B4y//lgMdoiLy/WQ
 pVBGL78T+zYCsph0ldJbRcr19G7PUi0RobfWfDHKLhIeAu572Bq56ncUS9RlBVmqyi+K
 rmQbK6+VJvT5E7Dhejm4ji9LK2NKmXQaGIzFlWOrPRN+YHNhL+8d1r5BXkfSlgmkMn96
 4uJv2YYxD5kbpb+7sKX8i+/L7liBVBA3hF+JaVEWFJQ71H63UfOoy+r8WhWsgLdgtbS+
 ZArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910937; x=1688502937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5VOufof82LdFXq5Avw+IGoCuTtc/4cJuL5op7JwlHY8=;
 b=R5YAUeful1n53+mGTIfDiti7j/2iaCXfQaYiqop7Ns8B1IyZ7QtP135+ADfee5vdU+
 UALTpMa1ZGa5MkNnhf3dTOxFXWgxzw3QopmA2Np9VLneQovO/50FXb0rhUKTAN9keQQs
 um7I7ezlvdZfrsD8m7TG6/wbiojauEtLkwnGdE5GlHvhcHBx5Zz9dVXGIRUIfDwMxkxM
 ciVW8xpTgqloiY2AJ8280IXEjphPN6Rcy4EkiILPtZDuchZ9RoeWgp/WpGercDSCNB1/
 6MdW/VMeFHkABWL4heVykufVSqQWifc6eVJ6dUi8g7KSIdnv6lvVOdMZ3tuOuLmyVIfv
 e73Q==
X-Gm-Message-State: AC+VfDxSOLj/q/qQFecrI9HgXNsHKIMxL+oj6Ak3KRdEI+qOHJGkwXKr
 qJS3XgtRPIExeDnqrDq/RndaPw==
X-Google-Smtp-Source: ACHHUZ7i9Uj6sOeBI/gBAvlxi9Gin02DqWHZSVj1w7Sb4VXH8Fk/OdOxGDZdsXhrBuVX0jJggUBbbg==
X-Received: by 2002:a19:f005:0:b0:4f6:20b1:ef95 with SMTP id
 p5-20020a19f005000000b004f620b1ef95mr1331005lfc.37.1685910937475; 
 Sun, 04 Jun 2023 13:35:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 03/22] drm/msm: enumerate DSI interfaces
Date: Sun,  4 Jun 2023 23:35:13 +0300
Message-Id: <20230604203532.1094249-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
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

Follow the DP example and define MSM_DSI_CONTROLLER_n enumeration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..ad4fad2bcdc8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -65,6 +65,12 @@ enum msm_dp_controller {
 	MSM_DP_CONTROLLER_COUNT,
 };
 
+enum msm_dsi_controller {
+	MSM_DSI_CONTROLLER_0,
+	MSM_DSI_CONTROLLER_1,
+	MSM_DSI_CONTROLLER_COUNT,
+};
+
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
@@ -117,7 +123,7 @@ struct msm_drm_private {
 	struct hdmi *hdmi;
 
 	/* DSI is shared by mdp4 and mdp5 */
-	struct msm_dsi *dsi[2];
+	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
 
 	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
 
-- 
2.39.2

