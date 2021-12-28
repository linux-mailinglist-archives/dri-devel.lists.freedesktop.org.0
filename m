Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B579848062B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 05:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C896110E162;
	Tue, 28 Dec 2021 04:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884010E164
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 04:58:35 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id t23so28332241oiw.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 20:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=98szpQBZjtZvNYlpyX/l6mXnydiaf9Cz3PXEMmMi7WI=;
 b=RkAse5a++wcvwXouZbSPgrz1WAGLQRgomwBlTuBF+n11/dsDnSAFBiJ5IZO71tXwWQ
 oG3FDo764vE2UDNwyhMV8XKQTjJ2EVfvXYrhWV84Nz2dPQRNRJGhvSbzCQ6Kvi9wletK
 IyNqaEnQOApQTc2sh/uEynNLXrOozmRDI3YVa8JTHsf6CQfPaoW2BqoLiBD6q7HpYBym
 GGI4CQXhGZAhFOrBfxmUFmGYOMxRPQbYcKDIqFbWJ6LsKOZRGv7c4YGCan52dlHN0SIX
 HnKaSdR0XXsFutjqissD5fp8Rsn/LZoyqDuI87U5H+YAlIFzeZaPKnRGVzD1+U4SDi1I
 OfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=98szpQBZjtZvNYlpyX/l6mXnydiaf9Cz3PXEMmMi7WI=;
 b=Gl+toYkACWvZmyyNDik9vnvVYryPII9s0DpBCHokZSEslXzE/FU2MRufHE8BvQMWAW
 jxOWZfjtilIooyQcVM3OXQpZsJk+NZ3LnSPbiD6jEjHboP92m9060RDAXckRTZclqgFX
 9qHOx4z31/Sk3H2C0NElfRT9FJouXfP+gcyneLN+72D0IAqgUTt9K8vzuugWZ7FyCljn
 soS7o+1MTAJfvoWShcN2SkweV4WtY2bz1FYBDcO81ku3SViKqdA7iBga54Fk5VmK0vlp
 DIte5/59tqgWjTmtG40e1TEnCs/WUgHZ1Kb2ntGxTcuxO1RfuwXkyIN1wrYbQWf/oiYK
 Ug2g==
X-Gm-Message-State: AOAM5335JorKhy2tPzeBjvhFVx+DofopwQUXwfHnvuWFb5cXX77+it8l
 W4JAGBZ/EpY3/DN5lng0lwtBYg==
X-Google-Smtp-Source: ABdhPJw0LCJVxHQQ9QCWqtmjXSIikXnypZw3Qfu/0FsEFSTp1ESZgDOl8PKo+a6h8HMAc8zWhQBM9g==
X-Received: by 2002:a05:6808:aa7:: with SMTP id
 r7mr15681459oij.120.1640667514163; 
 Mon, 27 Dec 2021 20:58:34 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id n18sm3004786ooj.30.2021.12.27.20.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 20:58:33 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/dp: Add DisplayPort controller for SM8350
Date: Mon, 27 Dec 2021 20:59:34 -0800
Message-Id: <20211228045934.1524865-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Qualcomm SM8350 platform comes with a single DisplayPort controller,
add support for this in the DisplayPort driver.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c                       | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 5457612ab136..cd05cfd76536 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,sc7280-edp
       - qcom,sc8180x-dp
       - qcom,sc8180x-edp
+      - qcom,sm8350-dp
 
   reg:
     items:
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 8d9c19dbf33e..fd0fd03f8fed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -143,10 +143,18 @@ static const struct msm_dp_config sc7280_dp_cfg = {
 	.num_descs = 2,
 };
 
+static const struct msm_dp_config sm8350_dp_cfg = {
+	.descs = (const struct msm_dp_desc[]) {
+		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
+	},
+	.num_descs = 1,
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_cfg },
 	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_cfg },
+	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_cfg },
 	{}
 };
 
-- 
2.33.1

