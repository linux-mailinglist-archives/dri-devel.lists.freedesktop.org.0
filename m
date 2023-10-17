Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF67CB856
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 04:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D0D10E24C;
	Tue, 17 Oct 2023 02:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BE310E0C2;
 Tue, 17 Oct 2023 02:18:48 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-77433d61155so354119685a.2; 
 Mon, 16 Oct 2023 19:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697509127; x=1698113927; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
 b=LqPBrf0Pt8Ebht8442wBy8W/5KgUtbYonSd9YQIZL0RC3k6uFbCWQtvMQ7c3re2a60
 2jREen+GyD85EHqUfHaxztg7NkLouhEV9N62EG2MHGUzebxv/NrXIxbGfA+8CvzLX3tp
 oUplJM/VTGDd5LCuGg2XlWlvmPTQrmbi+SuueKLaB+5SbtH1YG8UeHBgOfkRqVlQEDRL
 NThGIfkHsStPpde7L3uHOwtCMCzT2CumOkL55fDUYuGizUf6CzH3DhrZPA7gmF1vU3nm
 cq+95yAtH/apKLSx1HbsZtd92KfLg5vd6x+1TQPhyOavVSNh4InVU1Tw14jHteXvcQGg
 oE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697509127; x=1698113927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3/FjPGL9FZLD3HPQhfLZqhNvGFa7zL77tDFLRHXNnA8=;
 b=OrCLGBUyWJLZo18t81ThkP2vPwXTbaOGWB+N4kI4yK54opSLgYV22k5TkwLit+6U2L
 o1tNT7RPXIFbmFrj+ivQZHnrqZZRt0+2Xksaj2oqtZtKSBjxc3zDrO9MWt7R5jA1dU3C
 5RK3G8q5vw9eBgaHWFZ+xk+Na1v9eJqlBhiAWO2CHLz/pYhEfQM8O8Cucrs38E5Pi+e1
 aJJEx8VRSlpCmDmqI+FAzUthXaRCjDXQbOEQj53H3sOyV/ORo/R8nV5QcrSdwp8hxuyE
 yyyuIUI2zzgcwtw6F9UrFz51dWXp2zgG7PUZix5bhp9Gqvhk/lEAFynMWWRg4uGM8PZn
 NY0A==
X-Gm-Message-State: AOJu0YyYvvRhh8WuxyJ95tL9eEg3YMI2gOasMf2yvpxUpjcLFPw4z8lN
 fRkgNto3FGtpMr0Hrh+h5Do=
X-Google-Smtp-Source: AGHT+IHQoraOOoyj6tVbREUcQPV1tqXJduJzETutZzJSrZEjrSXoOo3h9yuz+x1/zrCB3KO/r86qOg==
X-Received: by 2002:a05:620a:3728:b0:76d:4252:95d2 with SMTP id
 de40-20020a05620a372800b0076d425295d2mr1036496qkb.39.1697509127288; 
 Mon, 16 Oct 2023 19:18:47 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a05620a0f8500b007776c520488sm256505qkn.9.2023.10.16.19.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 19:18:46 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v4 1/6] dt-bindings: display/msm: dsi-controller-main: add
 SDM670 compatible
Date: Mon, 16 Oct 2023 22:18:08 -0400
Message-ID: <20231017021805.1083350-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
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
Cc: Richard Acayan <mailingradian@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The SDM670 has DSI ports. Add the compatible for the controller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index c6dbab65d5f7..887c7dcaf438 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
+              - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl
-- 
2.42.0

