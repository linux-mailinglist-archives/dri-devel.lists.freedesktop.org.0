Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3D58F967
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E49A6C9D;
	Thu, 11 Aug 2022 08:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4382BA5E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 08:43:44 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a9so24610578lfm.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 01:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ooM7y6v9J6zgXgg6OqlmVWX6M0IPHPI6lI2ab0c9pDA=;
 b=d4tvCxgrvq0CXKar5cnmPvhPR5M9QrNQCbiuAr0vViRXBOQvDWi5Hgfk45hiB7Sh3+
 YDNN5v4Qw/iogPERl3ywwvSQaR/jBFtNNKUujqIGW/q7jBrvLhSYK1xa83prb9SC5khx
 UQNcQWM5cAXyS3nX93hC2PSqhNma4LrF9szVkjQKzYwGvM3OrBaJIDrWTzV9LpghS3E6
 b1B9M7lyGXZBd5sljALlvj0Pq+XgKZMqqkHpUQ0gQMbcLmYKyovpg5fc7knns2nOTnoq
 d4IDsNbw7M8rOnGMSOHtHh+ozfYAoKLcZ3L3zRaAPNh2JKb8g5cYsgIxkP+S29uyZId8
 OmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ooM7y6v9J6zgXgg6OqlmVWX6M0IPHPI6lI2ab0c9pDA=;
 b=onAq8tcGfnJYxW4+3FBHwTAgpQVfNf1rcytD78EtLHVNCMGCDJnrVIw52wN8aeqzQb
 Os+oGaMdTcDNRpYDmPtbFoTTr/FPncMt2wENoyRzA4uQb5wjg4Nklq5VLzeFAM2BuJ+t
 Xb6ldg+YX1v5/4E8IA4czsMsZBCjOQKrZqC03aD9Oy41XqCLYNlS77xAqzzjKVI2nR0M
 DmhLGm0lip4IcoVSY4Vv4D1C24BSysQN7zjg8NYKorbBqrNdNgqdsdyYepOp6+Li/Q00
 MYV077QofK/KeAN2BNNvGRpgzEcSkrlXbOaOozec8SujVfMT0yZ0Z2Yzt4CLQd1BBGs3
 OQHg==
X-Gm-Message-State: ACgBeo0a26HwmeI1WCHXI3UI77ggZ6FOAGe5C4OeYuQtkAdBGygwR0iC
 XziMcy0m0M8yUOikge2PH+uG2Q==
X-Google-Smtp-Source: AA6agR5mO3DiFZ3t4Lgk1NnmeQ8cSRVtzF9qwzrrk5oLi5kRvefXVkYodaLJf5t1o/M2ohExFwDVIA==
X-Received: by 2002:a05:6512:108f:b0:48b:a169:d291 with SMTP id
 j15-20020a056512108f00b0048ba169d291mr8339394lfg.198.1660207422686; 
 Thu, 11 Aug 2022 01:43:42 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056512360400b0048af379957asm631077lfs.72.2022.08.11.01.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:43:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] dt-bindings: display/msm: dpu-sdm845: add missing DPU
 opp-table
Date: Thu, 11 Aug 2022 11:43:31 +0300
Message-Id: <20220811084331.83715-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
References: <20220811084331.83715-1-krzysztof.kozlowski@linaro.org>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
opp-table, so reference it which allows restricting DPU schema to fixed
list of properties.

Fixes: 3d7a0dd8f39b ("dt-bindings: msm: disp: add yaml schemas for DPU bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 2bb8896beffc..aa99201dae3f 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -65,6 +65,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -102,6 +103,8 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table: true
+
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
         description: |
-- 
2.34.1

