Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80DDC0EBB5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06CE10E4D6;
	Mon, 27 Oct 2025 15:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="clh4dMgr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A431410E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:59:43 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so3424017f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 07:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577182; x=1762181982; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qz/PnsLNKphGj4wu5t6w0DkX4PTYLFQZn42Nmg+SPjs=;
 b=clh4dMgrCrN29AS6w/B8ENiHJ58tt4mgvHbXcsi6Vp1lxIkak1qtNfKCfg1Gjvx0QZ
 tuO96pCw8Y9LJgyyDRQSZtSNK0TziL+VJnuukiDEVDvA5ma4e+FExptxaNo15ERbm068
 HB8X1oZb2DLBYKixbbEYBU4ZUl78v7phzfSE8XDnq2VNRRyZJISLU7g+tWPXQ2t8HTuR
 ZJS9Yq9sJ3SnseO1LTu15Jl6M1F4BksV3QIDtYgkg1ctkugDHTpwA8RY3/IsHywn9Ro2
 o8WmPXXrpSykBDVbA09IsjvULF7jtAPdW2pWXFIjxQ+Zs0ny0ZwmRNDYEuNtLm6egqOv
 kFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577182; x=1762181982;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qz/PnsLNKphGj4wu5t6w0DkX4PTYLFQZn42Nmg+SPjs=;
 b=iIt8QxUS1ucbq31Xr0pV3S5hYhMIUe0oRlPIxL7h6rxq4Og4wfV3Xu2dt9N+bAks7Z
 4fuNpXo282PRydszegYOi58NC4/+cg6+UliohfmU7pHyJu8yhY7jYgAVhEKP/xB9o+Va
 p1P91XXwXfrnkKQU8e0nAXA4qXmabjYLJp2k+yEyBs+w2aYxGUJFnlBFYkTcA4TdR0oK
 /u2rbZrc5EUeW2n5CgvC1CkS0YK+f4GtIFY+AR1PWPVztUyjwpOVtUUwRTtJCfuKymvA
 X8LHqQdWtnDUjKoiXvIRsw8+ekvb1dWwAtSW+ClqJzk+z/8Vq1CcAkqdH7HRaXV8t8ax
 zPlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMZrMeUUEiJCk/FOXqVgr5d8ZHmFuHlQC+wSRKG+lbP/hEF+VqJVGxzzVjV56BELVlD9qCZQK2oYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyaLQzpUO6DAPH32xLCQA+AF+G5L0/NjcThE52OuKVtVLrzJmy
 uRN0w2Sx+Ko7XTvObCZbztkZsS9ZpkNiz6hKhKQhz83vrk/D0NobCSIr1xD9ON9Ngxk=
X-Gm-Gg: ASbGnctlBtn1QxTVa0coF8sOZJp5CFlFBP6x7JdYyZ25jwAJdD4buOanpP30ie0QqQN
 8ftO/ac/IdgurUqy7wMD2RLANphxJQ8CsojRAJogjtgBvruik5AejA7WlCoiRjEjeMgsjBf5Iev
 SknHvvfoxlS7S5UJQPl3njQO7TN/Hp/nyycjws2kPmVMm1SpaZr2I/BtmqR+UZ6YSbVZqa60dE/
 jqFuY9i9nBAH5pN2mfM+1OlSrJWaE4s8Gdk/npcqymkVgpoqlQouuOjbvGPXwfjm9GawSG0mHrr
 LSr975Fx63VIkDlK//tD8mpLq6TXlCfBnnc6MlQbT7O53OK0h5vSvX7EH1Sk23fqOgruDlBL8vW
 W82gsY+vys6dx4YyQQFZ0xG5YyUNEERQIl+tMMFM+RdrjTUzflOwF5aKpT0ZBuJqy6LTVOT1XDf
 134ZHRy90JoqnGQ2e0Ae0=
X-Google-Smtp-Source: AGHT+IHZ1yK3U3yLoTg48R/GGPo48EabRX1eTv4WbvErGehFypuSM3j72H7Y4kWByXl9POqbwjJEhA==
X-Received: by 2002:a05:6000:2913:b0:427:526:1684 with SMTP id
 ffacd0b85a97d-429a7e52f6bmr21760f8f.25.1761577182057; 
 Mon, 27 Oct 2025 07:59:42 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:59:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:20 +0200
Subject: [PATCH v3 3/7] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-3-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=MdFy/rEtddPgNfs1nNoPDNK3EzZtOK6/402QnuCksD4=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo/4jPJrs6Mwp34I2Ad0O3U77kUDk5w/G3R8kzf
 3wInFUrPCeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaP+IzwAKCRAbX0TJAJUV
 VkAtD/9nAvhuxwMJ3BBEh2tiRZWzt90TFdkB5yBTJWcG6+7Q0LBRD/olmatidL6r/FQunDmcTWM
 sCbv+VJT5Voj6Bta7FooqGBd7sBQTY9cNaZOTJboyf8bfXClhizkT6WrBVJybhtbLLVmi0yvUcV
 B9EBoZ3fxJHUUH/P88q4jkk/4reIEhxN8uqCN5f+iA3c9dU1JYzx6pJXJouGJTaMUYBs+5685w1
 Tdzwcw7dHa7t8QGEfYxlzDKHt5gRTGYfQyvVd9dBsa6ytuMWj5DfE5B6KpP4JDZN7X6GJGlOQAJ
 veD6SaN8w+waDj6ubGo6iV+zrgkCOwkkwVrS/S0rc9cN73+33ftalWvYIpZhmrjqh6EKKrU8SNM
 /7u7w1E2+j16HzlLCtuw+zP+/nDGPnzMJhiyJvOcC+2bmRoLrH22+tZnsNfSUz/LedVG1/fRpsV
 M/eagK1ys58BZrCCvwPJyIE8etDROmJ9+HGSScm1BueZlIK5IotiwN+4jBNUgfxDYtLFUZfPakf
 Rpl9TnNAEE0qjCofLK7gzk3DerpjtMzhdt8TV5m2QbhAzh1BYxr0cek7eRpIXb2tby00u3IKgXx
 2lDq0Sp2y2TQnrXi3QH1ITp0PgHKNqvOaH+jlYEMkmyBaDXCSZT8fa+NxenrkFd1NCS54C/7Bw1
 NOYUMCsivtUcn5g==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Document the DisplayPort controller found in the Qualcomm Glymur SoC.
There are 4 controllers and their new core revision is different when
compared to all previous platforms, therefore being incompatible.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044a0ff1e78ad47b867e232b21df509..26f5043748c166aa44be4e62445a63106edf9578 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -195,6 +196,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,glymur-dp
                 - qcom,sa8775p-dp
                 - qcom,x1e80100-dp
       then:
@@ -239,6 +241,7 @@ allOf:
             enum:
               # these platforms support 2 streams MST on some interfaces,
               # others are SST only
+              - qcom,glymur-dp
               - qcom,sc8280xp-dp
               - qcom,x1e80100-dp
     then:

-- 
2.48.1

