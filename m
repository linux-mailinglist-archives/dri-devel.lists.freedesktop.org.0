Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779189C4D2B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 04:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9DA410E1D1;
	Tue, 12 Nov 2024 03:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LyYIlVtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DE010E215
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 03:19:04 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a9e8522445dso913099466b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 19:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731381542; x=1731986342; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oIZCtXt4TQ04xJLqf1FpdE0pILm6/tx+QziF3KaXRzU=;
 b=LyYIlVtbKYrTaE3Cr3ah34M6UykF4xMEJl69T4yuEOxQ1T8xTh0inTuynipTu3aLPI
 iSzPdnlbkVbYmavRHc2nhSPJ6bayF0UQfZyhzccdiVmtYQ8srhhnPAPSB2V82wDHA8K1
 Re5Sn0qLcnUcDkRVoUBMmh2YBVe00lMocW0E5IEmolh+Ik7vsx53rob+yhWq9bz2JQrW
 AIMNhtQDrxvQZTKby8zcnG4O1/nmAmXVR8FWrQF4fAtgLevOALTfJ73x0sd6MHNhhCs7
 VT+bt+vWvBIvSZQ05axXBjGMEFWIawJLyFsrvZ+s/z1giUo08s1OTwrJWPP6uzN/rB1i
 eHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731381542; x=1731986342;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oIZCtXt4TQ04xJLqf1FpdE0pILm6/tx+QziF3KaXRzU=;
 b=dGYqbtKhtSgKB9JKqpG3UQLDwhFu0+qiU3FOayZtmpvkKTK4PsELGe0PFwdhI+uOeT
 QzvJ34bW/G+ZbJx2J8Nfoq9WAtioe4IeU4HH6RNC9K/zJ60wObuts8SeDi2iZghu6mAq
 d0cWGWJoeKskQvqvCm2wz/v/z1SyWlnsRCL7LJQdnmuidkndc/BWtjQKOj6nspi5Jgrh
 sMN9YzEtRBDXAQ9E/KRhjnSQh55IQyPTAAoHwb08KVBE0vSCJCmCwBtdPtavrrewBW8P
 /lMKowjqvAydWsznJK/wN+Jl5nHU57P1j3UkjpjmOvxNH8iyFxwXO8HxwOgPfYkisq0A
 kXbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx+uC/sGlGkjUWlSjLDsMlzx6hGETZ094iMPEBC9Q55pe6b6kAU7OE+KcIYNEdkeLDzVZEnqSzSvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyB0P4L6n66UAXlXUS9ChEvNH5lNx/Bid3TTaQU4ukSZ5/SBCS
 wJOVx/KsR6fUE+DJEJVQkovPJ5SKa8532hX49sD25yA5Uw7bpva3V/nW1lonm1Q=
X-Google-Smtp-Source: AGHT+IEepq4U46vHQx+388cSqSZ7dYjmvbGbqe2P+IAhGO5esI0/fqqyiUwogKBqBM8siJyJaJSuXg==
X-Received: by 2002:a17:907:9603:b0:a9e:b5d0:de6 with SMTP id
 a640c23a62f3a-a9ef0016d4emr1401236266b.50.1731381542331; 
 Mon, 11 Nov 2024 19:19:02 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc50ddsm672156866b.103.2024.11.11.19.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2024 19:19:01 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Nov 2024 05:18:55 +0200
Subject: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: fix the example
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-fd-dp-fux-warning-v1-1-705b527f5a63@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB7JMmcC/x3MQQqAIBBA0avErBtIi7SuEi1Ex5qNiVIJ0d2Tl
 m/x/wOZElOGuXkg0cWZj1Ah2gbsbsJGyK4aZCcHIYRE79BF9GfB26TAYUOr1TjYqfdKK6hdTOS
 5/M9lfd8PUvtvj2MAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yQRCixh2ZkF3/J3DRO9bftX9zO4bUPMZm6ldnWS/5LY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7rRSeWfMV+iGi9bLjNSC2e4onl1X41i5xv1KrWD5p1Ji
 qcE3mR3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiKz+y/y+4/vVyRY/8VvWN
 bx9djg+d82vZS9W/R4/aFlZpPlyQVSKi/C4xL5Nn5QXl5qo1TGyXVvxurOmxsmF4eiLqcArXO5Y
 oVu13TkV50bWqfJE3/ov7X3sofZd/39b/J6qLmtecmLP8WYNlLcPBnF479/DpjSGsc6M45+Vmes
 n77916/onZ0knhB+Zf3H+Cwd+8V5LNJm+en7x9p+qxmdUap/l/C2i4pwYEG3Z4nNVitJznuP/nz
 kavU//b6v42sFjYLLqa6ryXIe5dz/p/iznlV24NN1PS+zjvRLi9gX5VAyvr+T6O+eyTBeuKmrb/
 Z/pRbjy/+9mS1CfTJC/rSIRsPekfmBwU4SGq73RQ7qU/AA==
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

