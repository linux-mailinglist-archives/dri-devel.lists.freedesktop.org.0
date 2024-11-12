Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE769C4D3C
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 04:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB40E10E064;
	Tue, 12 Nov 2024 03:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V+7B3tRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5828610E064
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 03:21:33 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso913332666b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 19:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731381692; x=1731986492; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9/4lgmqUbG+fBtyzU0tlasfvaV6025E/7AVaJgntc6M=;
 b=V+7B3tRRdmIaXqRiZ6Ft8q/bwRGd4yjnEWl0WheBa1+eMbihiNu0BVtBlgK59aUGz9
 rlUPwKGvQr0u+GNj9QzSmGQZXBLBRIIxiyzUAfqEog99kmqcK4TqpOvTwMR8tP4ext8g
 cUz0Dzg4zr8rZr+rOt03uMPQq7wEa7Au0ArQhiD4OZqFkssGCV7tYSR6idzh/qtT6lk9
 IcOUK9p9tOAaiIbu49gZTEryTN9/jJsdIM9sXrXGgigpaP0X+I2gyPsPRLLGBWNRexR1
 LEJmREoL89S4HWSZcIFlLg1X1/cgRd6lsnbLlR3OjLlF+nZZGgGz7Z9WJ1ZbGM3cO/6B
 F5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731381692; x=1731986492;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9/4lgmqUbG+fBtyzU0tlasfvaV6025E/7AVaJgntc6M=;
 b=GDNlM2QVAw6hLTXWxA1PEBOJ5prljSpCojl6tses/+l4MhQr48Ne00PRIstyoipgsB
 79uvf0qJXFxQCEr4UGTk5zObMchEOGAghvJqf9PlLFXfIAFTmLUMqkYosnEv0wopVAPj
 k5hSnBtRwGiYx17owm3P2MPEbC/6INJg5I1lQXcoty35CZt2lW9/D0sT7SPwDmWtThJI
 TeoiG3OSRAvL339geIU1h3UdprKuSe4L5bDHvmE5UnDtWkN1q4QTBYAjqL+bvu8SyARM
 Vwtn8e2CuLnQC3jniEDiJOkcNux/zgPvpY1LBQawcvacuFFpZEoswdfksAVPMHhwS3rk
 nPcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmJGwh4wJDcvrqyHc4248l1dyYuJ1V40OhMh10FAZ0OrAuL1kUKJ+sO2BS9kivq/nC7KgfaUf4Uqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxYVO7rIi9o9kxgHxpg+F3T/JOhhh3EuPTF5VdD3ujzfHDWxs8
 irblcXCLrmZ60xlNA2Vsjvq+VR6dEk9r5gR55y3mv/RW0uLDVOi/H+jWvSQiJr0=
X-Google-Smtp-Source: AGHT+IFC0e3EFVw7w8j+15I5R+gq/awEWgkvdg0ap04O+5vLKB+g5jLRDqgG7bbsp2JIg3q1dy0cRA==
X-Received: by 2002:a17:907:724d:b0:a90:df6f:f086 with SMTP id
 a640c23a62f3a-a9eefeaf116mr1440613966b.11.1731381691668; 
 Mon, 11 Nov 2024 19:21:31 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0def87bsm667363866b.143.2024.11.11.19.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 19:21:30 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Nov 2024 05:21:24 +0200
Subject: [PATCH v2] dt-bindings: display/msm: qcom,sa8775p-mdss: fix the
 example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-fd-dp-fux-warning-v2-1-8cc4960094bd@linaro.org>
X-B4-Tracking: v=1; b=H4sIALPJMmcC/32NQQ6CMBBFr0Jm7RhaKEVW3sOwqKWFSUxLpooYw
 t2tHMDle8l/f4PkmFyCrtiA3UKJYsggTwXYyYTRIQ2ZQZayFkJI9AMOM/rXim/DgcKIttVNbS+
 V162GvJvZeVqP5q3PPFF6Rv4cF4v42X+1RaBAXaq7ktor01TXBwXD8Rx5hH7f9y8p8yghswAAA
 A==
X-Change-ID: 20241112-fd-dp-fux-warning-c8764c93f787
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Mahadevan <quic_mahap@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OhdT2VxfIrc5AObnYGG1UHJduwWMT7S9TkIllvnLPyE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnMsm4gC24uu1TSHwCoYjEFrrSSfkzWQ5JZLTPb
 PEJxhc2VfeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZzLJuAAKCRCLPIo+Aiko
 1ZOaB/oCWEbwWC85vZbqnSWXl4j2u4TirBvYrnxYg6SRZaZ14lWkHCZ5zLT4GKzjH5k0ITebYbR
 Q9RLOyb+j22Qv2CU0jGFDwMCidRy5OiqCiBiuY/zrP8CHo49XtMxgdV2jCuLSm1cADgkqtoK/Gs
 Dgd6amgyYfjL7UXDLc4qA0XyN9nAdGEtZ09kJ7n9tyfnzsdYvc717aRx/5uzdmiNT9brClRxeTf
 KuMUJNl3E9N5p8/T3klYIvZz65LuBimzSfCFcizVnahv9fY8aDHwtGIXE+yD7Pny58W1+M3ChKk
 BPzQZdiNluzwHs6xbBlTqoZFSSM+xbYrUzvZMgIGgeX1qO5a
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add p1 region to the list of DP registers in the SA8775p example. This
fixes the following warning:

Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.example.dtb: displayport-controller@af54000: reg: [[183844864, 260], [183845376, 192], [183848960, 1904], [183853056, 156]] is too short

Fixes: 409685915f00 ("dt-bindings: display/msm: Document MDSS on SA8775P")
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/dri-devel/CAL_JsqJ0zoyaZAgZtyJ8xMsPY+YzrbF-YG1vPN6tFoFXQaW09w@mail.gmail.com/c
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20241112-fd-dp-fux-warning-v1-1-705b527f5a63@linaro.org
---
 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 58f8a01f29c7aaa9dc943c232363075686c06a7c..4536bb2f971f3b7173b8807f90c9af3e460bb01c 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -168,7 +168,8 @@ examples:
             reg = <0xaf54000 0x104>,
                   <0xaf54200 0x0c0>,
                   <0xaf55000 0x770>,
-                  <0xaf56000 0x09c>;
+                  <0xaf56000 0x09c>,
+                  <0xaf57000 0x09c>;
 
             interrupt-parent = <&mdss0>;
             interrupts = <12>;

---
base-commit: ff2ce06d5e28be5ee399a2ff894d6a551c70a318
change-id: 20241112-fd-dp-fux-warning-c8764c93f787

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

