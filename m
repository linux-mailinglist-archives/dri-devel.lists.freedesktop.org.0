Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7EF7BEF37
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 01:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98BD10E2FC;
	Mon,  9 Oct 2023 23:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C5110E157;
 Mon,  9 Oct 2023 23:34:03 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-65d0da28fa8so30483746d6.0; 
 Mon, 09 Oct 2023 16:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696894443; x=1697499243; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
 b=fjdR+KO5ilRCcJwuOklIxb1jrygBrN5zyELZgrsmG21h/4H96i264r+fHWs2HZhIjy
 S/jlB3qxsUvORYRr/xT4Pp77UcA0BzP/FbP3sT7YIiP3Ogwz8zJ3ltHRVLVnafAfrkJp
 y8ev1VJzEUFpbbmOTvb68nHTLPpvM3pdvHukxotmXIh5vSMfq/clVjMURNU5fP6xbsiB
 VuCj0nbxhD6DB8wsLDP3c0MvwdVEebPiI7eS4nJlPKawKMypE52FN+y5sMZ5mUzaF6nt
 8mTrbH6//HpwbmzShs9pp9Vl4KJ6QLeA0rMb0zORuv6qheGSo0R07PQRVg6hJXzAQyzj
 9Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696894443; x=1697499243;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIKmGdB/3utN+fo5YOdVXRGf1bdkoiZsUcVvijZ0k1o=;
 b=O7OzxMqs2/5ww/yglRBRACWqQuWB+J5tB5Lrg1yA48w1AktvYGC0RhFSUxF+fQsWd7
 nVdYPx+E5wYeQWdqLCfg0waY0MZcbPh4CYpNRzLHJMas2vZpBBKowSJGC8jl+b9Q6Ztw
 V7xra5XSjEUzY9C8evEI/OXNRtzOwer2jl58RmBV+zGfCMuK/AtGXmZ7ojkflun04hX3
 PGFQPSN/hQONS7ptJQFoiPzzRDsDzSm3T4XYIADCXcx62Du8lKIRw0yXuJnQxrAjfkMR
 D4LWVE9qNtnyyFgSdOByu78xGWAWYJThbmcdh+Honxf3dHmeG5rDCWsmfC1Gk0Y8t1qW
 NRaA==
X-Gm-Message-State: AOJu0YwPSL8g0uTS05bavOzQecjWVVyRAbwwn8O89kUErac+NFqYs+N0
 19vKAfTVbr0/4B/lvB9pW1SFzwvO4O8=
X-Google-Smtp-Source: AGHT+IFX1KSpG727R4twyvT2uLP009BJLPc6asGHk6ULCbzHqgbGEdlfEzdid0hphdLUc+clgU05bw==
X-Received: by 2002:a0c:dd90:0:b0:63d:657:4cb9 with SMTP id
 v16-20020a0cdd90000000b0063d06574cb9mr17283505qvk.42.1696894443008; 
 Mon, 09 Oct 2023 16:34:03 -0700 (PDT)
Received: from localhost ([2607:fea8:529e:7800::1d3d])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a0cb303000000b006585c7f64a3sm4296617qve.14.2023.10.09.16.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 16:34:02 -0700 (PDT)
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
Subject: [PATCH v3 2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
Date: Mon,  9 Oct 2023 19:33:40 -0400
Message-ID: <20231009233337.485054-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009233337.485054-8-mailingradian@gmail.com>
References: <20231009233337.485054-8-mailingradian@gmail.com>
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

Acked-by: Rob Herring <robh@kernel.org>
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

