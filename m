Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 420157AE268
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 01:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5199810E33B;
	Mon, 25 Sep 2023 23:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFE410E335;
 Mon, 25 Sep 2023 23:37:09 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-59c0a7d54bdso90997037b3.1; 
 Mon, 25 Sep 2023 16:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695685028; x=1696289828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pO+UQ2PR4pSsRWkZZJzU+DVCcFUEkJviRU5QoEIQKsg=;
 b=cB5TSIPsV3Vfv2zAXOdled7/dyRQuVI9ryOrO1H1VuqPpKqWt1Pu5WkHyQtK4Ef7Vx
 TonfZbqFvrVNue35WbOdm5Ls2DJNUNkB4bvC4rUYHhz010H0DxvE0/xcyWLY9XjiKO51
 kN4hILFuuqzvQ/DDO+QctVnswp0YPBkXZ1U4NJbYmF9HP8CqLS/AiHOpvfpL25qLM81U
 Ie2/yNxGzzqU1QPyukjwNumfbT2D1Sjqihlf+kBqbnAoGF4Cl8TieUd6bDZKL9/UnChX
 Yh0ZoExNIFX8I1bHX2OnOhs3SZbHUgSpZikjYU/GDQyf9DRiaAr+VxcoVc2PQjMH33lH
 Is7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695685028; x=1696289828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pO+UQ2PR4pSsRWkZZJzU+DVCcFUEkJviRU5QoEIQKsg=;
 b=Vnptd7wPO7/LKEGay9/Pcnz+M2DtqF0j7fqkFW9JLyeFZuKMqlsexm0OHCWEwLqW0h
 GNf3NhE8tx+H70BcaHIg0R2veX5LIUHa1nZrVF9N3DXhT58qhrKkoXYWcwhFiD/rTu1k
 ZGnrVHzmZ2t1ml5gJEH3RbSyfDUKhxTRA2LLYlt8DQeQtgulc8vfgTpxeUWqu7Fywbh7
 NjVY4HZXZ8oYwlUeUcCgeCI01pHO9EylONzN6FFU3Ft5KzFk74f3MC693601ICuEhLUk
 18cCs7kZNbzMKOI3SqRGue/VKuRcdMwm5GiW57FTRuWjBQi2y8K6IysAlzsLjrkve8Pe
 aWfQ==
X-Gm-Message-State: AOJu0YzUNTFNlNbbMSKJB8rGJYMW1hV1btjQlJ/DDvNCXRYPYVo+khSL
 S5lHGB2Tew2nHtTPIfJsnGQ=
X-Google-Smtp-Source: AGHT+IGdfB9/Itdlndou96XYj1kYBSq6VKY4Er4/bmLpKTKHRCPY7CzLkDERgE067vfHt+163GGV8A==
X-Received: by 2002:a05:690c:f02:b0:5a0:5c65:1d3d with SMTP id
 dc2-20020a05690c0f0200b005a05c651d3dmr4097214ywb.19.1695685028220; 
 Mon, 25 Sep 2023 16:37:08 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 eh15-20020a05690c298f00b005773afca47bsm914236ywb.27.2023.09.25.16.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 16:37:07 -0700 (PDT)
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
Subject: [PATCH 1/6] dt-bindings: display/msm: dsi-controller-main: add SDM670
 compatible
Date: Mon, 25 Sep 2023 19:26:28 -0400
Message-ID: <20230925232625.846666-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925232625.846666-9-mailingradian@gmail.com>
References: <20230925232625.846666-9-mailingradian@gmail.com>
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

