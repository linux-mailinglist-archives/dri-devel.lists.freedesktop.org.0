Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297858F95E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA26AA6C64;
	Thu, 11 Aug 2022 08:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6692399D96
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 08:43:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o2so17315669lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 01:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=vOeegMXGcCHbbRD+atxt5zrggNZkNZB4nunNOkeVqiA=;
 b=G3XsN5ytlY9pQlvu3e2ZT6OBZKT9GMTPjcowDtYXCLVMAJG2LmM8fG9V4rVAFhNYgS
 1/uLtBNmFP8gdXpCaLwyTvX9c2ctEaPJangChcwC3nFToWT8oM1+fISfXijLKCv8aBSX
 Q6Ql2RqcX5pGHqVfjpc6XTcfemJyeyiCPHeuDi8DRPeQegAuggG5SvoaRx9A7pgFfrjN
 o+poyuRdlQwqrP50Qn0GgIFz0o/NsiYHxQ/fgsvViigxXLXIMpZVcSYuAhiZMaV63rHC
 /TV3IzySh5yRqgB1ZtTGeN/aJlDY1JGpxpFxlFTs+94ihNGIiqZJ13qYWLyZlvJQGJl4
 dRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=vOeegMXGcCHbbRD+atxt5zrggNZkNZB4nunNOkeVqiA=;
 b=xIAHq2a3mxFOqbmoS449TrSqQ1D44vK1iaO874mHLeDeZMEe8ab9QT/fS2TVfZf0uE
 DDjGOwctR1PI9X8jPTpXbxCc7yGmjzGrnZaqNhVGXRlvunBvf/IO21vl/Ui24ABB/je3
 emlU/vwWSv8VwT3MQATpWKbhOHhJ9RjLpfzqGcL/axdJXTRd++Hk3G8SbIm+7XeAVR37
 qvijsm2eeqDegjPCemCLBqMAnalbiWu7CLWCME78R5quAvFiqC/NadPFcEz2h9vhBeGi
 rjb7yNItb0xJb3byIQSLQzwaz3SmRSZ6GiOeC7KwqEumb+v3w0WkTzGURuiBBwk+avO/
 ofbA==
X-Gm-Message-State: ACgBeo2GP+Q4VE/BftM/Z7MiVWmw9Rkx55aCDVHwUHxGTnlmY4ioC2QL
 JDUchXbyTYqkarGRqWImr5V7WA==
X-Google-Smtp-Source: AA6agR4cHk+mdaF84yKH3YO0DKq65UeXVHmrFM+5SpJMbXMEbodqBabRm+SzkYsLQUjuPw005WU8Iw==
X-Received: by 2002:ac2:4f03:0:b0:481:5092:ec8f with SMTP id
 k3-20020ac24f03000000b004815092ec8fmr11230018lfr.35.1660207418739; 
 Thu, 11 Aug 2022 01:43:38 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056512360400b0048af379957asm631077lfs.72.2022.08.11.01.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:43:38 -0700 (PDT)
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
Subject: [PATCH 2/5] dt-bindings: display/msm: dpu-qcm2290: add missing DPU
 opp-table
Date: Thu, 11 Aug 2022 11:43:28 +0300
Message-Id: <20220811084331.83715-3-krzysztof.kozlowski@linaro.org>
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

Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
index 734d14de966d..47759c871429 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
@@ -74,6 +74,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -113,6 +114,7 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table: true
 
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1

