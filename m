Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 414ED7AE26F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 01:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F3C10E33A;
	Mon, 25 Sep 2023 23:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE4310E338;
 Mon, 25 Sep 2023 23:37:11 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-d894b8b9b7cso2107442276.1; 
 Mon, 25 Sep 2023 16:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695685030; x=1696289830; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOE0MqTdfK+5W0JIocej+dK+oLW8KHrRynMU3bSabA4=;
 b=ONt1yHwuy8HCic+NqZyfFi3Q7m3NSXVUIWVINj9+17YSZrRDCioxqEm53A+54AiOfj
 2ik3MqIMMo6UuoAz6eIRLFTrp9AsBMSdtnbONAqDeHI3ZQtOMa4ibAwCBZ7pQf8QyW2t
 e9evRX1oEuwn0qAA4w4IGer85elwAmf1kIPD0oUwS5d1n4BBQqsKPnz9GRh/A9Twh2rq
 OwDCHUu+L3k7PqVIIGT0wboQ95IbADJC/ZPhpCGLMk5guUeZTi46fvAgB18QnLZW/T00
 C0hR0bvKoVie+3m1nP3ts/u7Jd39EWg2NY928KQUWI7QZlBcV1Z6pivqnoP7j+sf1RyO
 4+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695685030; x=1696289830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOE0MqTdfK+5W0JIocej+dK+oLW8KHrRynMU3bSabA4=;
 b=YcVym8Cxhb/9/NkCM5sA5cFr0zOllHgNToBTPBg6VmAuCl8t+Z6MPC54uyKnIb0TPC
 IWCxVdTW2CjR0Sz91yGHcDHcpb3MMQCxlZgAQFSnC+KLMiB123sulP1hBUvD32vaZxPQ
 LF9Aw4iA5aUGU2pStbrvva7a5aKsrgGKcpIR/aHFLbRFFlA2mlwoigyWlkkFroocc2EA
 wEyFHDVuOlsTPaVdCNn4FqH8GrNgmgZYceZII+xi3aqUjssLwrO/YVBs/ehJ4HjXEBYM
 HmhtkoTXBGZNI0YKuPPAnnvrN/hGs55qUR9CeIp+9PLeuCCcNXtoHoMrPLv8PrQ2Qn6E
 vrBQ==
X-Gm-Message-State: AOJu0YynGdnOS5cs3FS78P8EalqDTFNCU3DYo0LWRQx9urlOEdlwjwVS
 LP0PFUr/6MpjJgO8qWKgTfg=
X-Google-Smtp-Source: AGHT+IGGzBj4FuKKpIGhZfLGCb0ql+2q5qeKNbIDXNAptDgJjdL7AxM4cOTP1bJxUp4T5DDlu8KkAA==
X-Received: by 2002:a25:ae05:0:b0:d78:6ef:9178 with SMTP id
 a5-20020a25ae05000000b00d7806ef9178mr757342ybj.17.1695685030214; 
 Mon, 25 Sep 2023 16:37:10 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::efbe])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a259a08000000b00d7b8a1074d4sm2337096ybn.57.2023.09.25.16.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Sep 2023 16:37:09 -0700 (PDT)
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
Subject: [PATCH 2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
Date: Mon, 25 Sep 2023 19:26:29 -0400
Message-ID: <20230925232625.846666-11-mailingradian@gmail.com>
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

The SDM670 display controller has the same requirements as the SDM845
display controller, despite having distinct properties as described in
the catalog. Add the compatible for SDM670 to the SDM845 controller.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index b917064bdf33..dc11fd421a27 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sdm845-dpu
+    enum:
+      - qcom,sdm670-dpu
+      - qcom,sdm845-dpu
 
   reg:
     items:
-- 
2.42.0

