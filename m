Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E17F680B770
	for <lists+dri-devel@lfdr.de>; Sun, 10 Dec 2023 00:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3532210E301;
	Sat,  9 Dec 2023 23:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6633310E2FB
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Dec 2023 23:21:36 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c9fdf53abcso31926211fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Dec 2023 15:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702164094; x=1702768894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSK6mZ8dw5NPtYdF0SRIR2pFCQDMWgaic2V9yiXRbes=;
 b=zQ7Wipwi8rB3XFQwvQx6xglSapDliJ+Wc6s9kcvMx1hM0ph0JHuQDKpq/fAObfsiX8
 th4QPE0Hq+E/Nb0WBKsdxTKcDtUHpWurmjlifOVmFoU7DEc4xBSnIxc8JUNgeWuYGzHu
 F+0PAq9gHz83xZAAYFAX0g8yBH82W83ZoJesXVIfNPwk3bFTA9KFPh5RObKJ0XB4OlEj
 QcYZfI7DrEWY/BIMudqvjdX2+GHReBOI5Hed2NqZwdw/M3fRAUKhPXkqXXcq5o0XqSGK
 araT3f5hgKUIXf8AOZ+FOD5GyUXgureY9BqK4gqXt23ExZdGYdIiFf+APb+GTAcEUY6/
 h/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702164094; x=1702768894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSK6mZ8dw5NPtYdF0SRIR2pFCQDMWgaic2V9yiXRbes=;
 b=mhWbteGBRZrzrO8NIb7Z6PgR4yfRowhmEffAE9+gim6sngZwzdNsW+itk0ViFQyN8r
 H5gXDlMv3+nuAG9h8LhgiyuXtdSXkHhv2DT3FFnl0w5GVmtcmR+Ym7c2A6Nzi8q+s2lR
 NFt64V2n7Xb5hA6sOiJUVyghI3LupyV4LSI8AiGryP75t+7G1QJNQadZnhcDswWt6U29
 mc5nQmKnrxRWniAD+wB6qrlHFT3W4I4ooIFs3llLr5bILLFZ7iWq519zFTMKbvxRzhoG
 yslCrU7LFyxf8bmWxseP6YSS+qK19SfNfIu0HMqiuLWfdK+X2rOT+aUkR/8XZAqDruz4
 HfEA==
X-Gm-Message-State: AOJu0YwifLJDmWyLCffSxLwk09j0fpThfw09Pe3pzMckYOa1+ZdAN9li
 siI+kPaR50LiG6wmWIW4fReNQA==
X-Google-Smtp-Source: AGHT+IHK9i9sHU8g1FvPL/utpZnsqHoTDu8AChT8E7u7PcV5QQR/EZHTCnQCJ8UunO4csc4HctZMWA==
X-Received: by 2002:a2e:9ec5:0:b0:2ca:2116:469a with SMTP id
 h5-20020a2e9ec5000000b002ca2116469amr1440559ljk.10.1702164094510; 
 Sat, 09 Dec 2023 15:21:34 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a2ebe12000000b002c9f59f1748sm685258ljq.7.2023.12.09.15.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Dec 2023 15:21:33 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 1/9] dt-bindings: display: msm: dp: declare compatible string
 for sm8150
Date: Sun, 10 Dec 2023 02:21:24 +0300
Message-Id: <20231209232132.3580045-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible string for the DisplayPort controller found on the
Qualcomm SM8150 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index dbe398f84ffb..f850bd9b8263 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,sm8350-dp
       - items:
           - enum:
+              - qcom,sm8150-dp
               - qcom,sm8250-dp
               - qcom,sm8450-dp
               - qcom,sm8550-dp
-- 
2.39.2

