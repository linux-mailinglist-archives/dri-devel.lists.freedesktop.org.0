Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 883355500D7
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 01:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78BF10F9C1;
	Fri, 17 Jun 2022 23:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC3010F87B
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 23:33:34 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id v8so6198053ljj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 16:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/fpEFi8S0hW+duJvXqSCWOTTPVMo6WlgdDXXr3M0Q4c=;
 b=ocSpZOvZt/RXZx2+XJFTIGyp5WIUmU2X7i0IZMXDMKytdbB2uqXyaMJfP/kT7YS0O4
 6zA/I4Y4KLB8OsxtK48D1R/HD6v1zm3PWwuHzrehJgBpwKIX1aYiBOVtFkU4Z14qvyHA
 sGxZr0LunlpWM1UuLD/xU8E/cBblwCStj7bGZEljz9SIqetdxmyj/U82I56Lv0RMdDpR
 DKOPugWMbVIV6QxPg+VyYgeJsgAHYGZjEGWT/t6hPgSiEAObQL6DRIv9uG6n5OMxsVQy
 Lv0hZBqifLaK4vXZ7/hXAx0xTcb60Vjxw2M0vNoqsa+obklkN64G70oXJbThaA5cCI4k
 DF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/fpEFi8S0hW+duJvXqSCWOTTPVMo6WlgdDXXr3M0Q4c=;
 b=mK6mGNYTOjiUuyki0zeFkRog+vsUcuitXENbHkZMtc7U88xG2K2ahzgE91Yt3QpONd
 AjJpFvyvmKGCzUVGSWJzyLrg+DavILQMIZTmiv4xGTzzNMDlQYPLU9qMEz8qidc81u3j
 NNDC5yD4iLnmTjMXYMyTXal4JtzEjZqrVkrhGFl8Jh+yRm9J1spzaSHpSWGsa5vECkvQ
 806kI8PEfxc51+BRdneX7TBQwpeWkGEwEFSU2XoYw9lc3PQqt11G6nd/TeykEUynIzuZ
 IiPxOVb6xlH7kLPpQkVytzwEZLvYEq2rbBbxBboXlDmlB2A/4IqleRPZrNVAPnM9m+IR
 /p0w==
X-Gm-Message-State: AJIora+2xNc952FSqc10e0VpcVZnkjCUU76q7brlhT7J0pc/4zHEK2Q2
 9K8/dE9qNjLbFvXrrd3PUxgafw==
X-Google-Smtp-Source: AGRyM1vrq8RQmepLu5AgSzgAH/v5DfiHHZruU6mx6PheCkH1H5Qs7pqQt5U2K+3RsuJWhc1j7slEuA==
X-Received: by 2002:a2e:9d88:0:b0:25a:5b70:f14 with SMTP id
 c8-20020a2e9d88000000b0025a5b700f14mr808143ljj.132.1655508812805; 
 Fri, 17 Jun 2022 16:33:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:33:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 2/4] drm/msm/mdp4: convert to drm_crtc_handle_vblank()
Date: Sat, 18 Jun 2022 02:33:26 +0300
Message-Id: <20220617233328.1143665-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
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

Stop using deprecated drm_handle_vblank(), use drm_crtc_handle_vblank()
instead.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
index 4d49f3ba6a96..ddcdd5e87853 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_irq.c
@@ -69,8 +69,7 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 	struct mdp_kms *mdp_kms = to_mdp_kms(kms);
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(mdp_kms);
 	struct drm_device *dev = mdp4_kms->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	unsigned int id;
+	struct drm_crtc *crtc;
 	uint32_t status, enable;
 
 	enable = mdp4_read(mdp4_kms, REG_MDP4_INTR_ENABLE);
@@ -81,9 +80,9 @@ irqreturn_t mdp4_irq(struct msm_kms *kms)
 
 	mdp_dispatch_irqs(mdp_kms, status);
 
-	for (id = 0; id < priv->num_crtcs; id++)
-		if (status & mdp4_crtc_vblank(priv->crtcs[id]))
-			drm_handle_vblank(dev, id);
+	drm_for_each_crtc(crtc, dev)
+		if (status & mdp4_crtc_vblank(crtc))
+			drm_crtc_handle_vblank(crtc);
 
 	return IRQ_HANDLED;
 }
-- 
2.35.1

