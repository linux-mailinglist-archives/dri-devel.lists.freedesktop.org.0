Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C5858F965
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 10:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB01DA6D18;
	Thu, 11 Aug 2022 08:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EC62BA5E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 08:43:43 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f20so24600472lfc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 01:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sw/Zp2U6EPehLEYuRca11olFeZe1Ryu4xJbSBBkA8EE=;
 b=Z7L1kd9gpgFv39ttyPuGJdp4umPli+M8iEdQNSo8KRiRPoahtfD6WTm1U9vKjhSsVK
 qc2WxASe2mkpxa5IBGr4mq2ADulOO6aNWf9KnHJUR2bN3rC3BVKSCEjWiaUKagseypv5
 w9ux08YHtCgnt5eILPDVEVtYcmw4jmQEO+k4LXA/Rf651KBbUp5pVcney7/APKVhkwle
 r/S451tVB5aeF/Y+Gnnu0rSgSTsDiPp+d8lbg+DnYkrKmtlTgaI37hhSc38MGil5vDIJ
 6Ix61masi8BnyycliRqe3DYVIEPZnX/BW5+qFk89KVFebNgFFEESD1OXO84FIGoC7MGe
 V6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sw/Zp2U6EPehLEYuRca11olFeZe1Ryu4xJbSBBkA8EE=;
 b=UzImLIItvTaOPLanFHsWl5w5VMgrFUJDbDe4B7UJlrrT87EqjIuJ8xKvGMKXq+gzFg
 WMER8YKllLWpCPWAjT4nbp4kmQkWH6Z/63ZpNCDBR0qtS2qSMZKlkJdqdBcBwM5TbaJL
 hVH6GnqEK58a4aX03Dl2sVE8uXQm20fBMrYQuLiA42R0bqvNiONZCOCku+Z+gyvLdfEm
 L4Mz6J93ihTTSy49N/BWTaWa4eHkkHhUw7Age1V1rx+XKNHU2gcPvhyP00MwP8v9FWbl
 83wx78WcjNGzGNO2oMy6r99KmRP3/W7QxnUtW+kQp86FC9riv3HfwFTORIG7lxNxvu3M
 rnIg==
X-Gm-Message-State: ACgBeo2mUbPNziFdH1ueafw8odo0LkwNTn0GX1aaAwMDG1ZWBakTrR7o
 NCLK/SGa7JNjDHjmz70nYNfy3A==
X-Google-Smtp-Source: AA6agR5gZ6FNRDo814IlIfXcQv5Zb2JwezxHt40B7pM6vK5TnwuV3MTU5Vk9+UkO1FZPkG6RxQRBJg==
X-Received: by 2002:a05:6512:230a:b0:48c:2e06:6c74 with SMTP id
 o10-20020a056512230a00b0048c2e066c74mr7557613lfu.358.1660207421452; 
 Thu, 11 Aug 2022 01:43:41 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056512360400b0048af379957asm631077lfs.72.2022.08.11.01.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 01:43:40 -0700 (PDT)
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
Subject: [PATCH 4/5] dt-bindings: display/msm: dpu-sc7280: add missing DPU
 opp-table
Date: Thu, 11 Aug 2022 11:43:30 +0300
Message-Id: <20220811084331.83715-5-krzysztof.kozlowski@linaro.org>
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

Fixes: 57fd4f34ddac ("dt-bindings: msm: add DT bindings for sc7280")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
index f427eec3d3a4..5a4bec99b98a 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
@@ -72,6 +72,7 @@ patternProperties:
   "^display-controller@[0-9a-f]+$":
     type: object
     description: Node containing the properties of DPU.
+    additionalProperties: false
 
     properties:
       compatible:
@@ -112,6 +113,7 @@ patternProperties:
         maxItems: 1
 
       operating-points-v2: true
+      opp-table: true
 
       ports:
         $ref: /schemas/graph.yaml#/properties/ports
-- 
2.34.1

