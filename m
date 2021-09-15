Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F15F240CE4A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 22:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6463D6EA55;
	Wed, 15 Sep 2021 20:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608F76EA54
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 20:39:44 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id b14so3668799qtb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 13:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9OuUx3KXVHJzGt1nkLMrzoX0tQkzHA3ws4rQqxVIlAU=;
 b=Gplj4vlsNLaGWWlUfnYJZw6WjTg0vIpqnB0tUu5lVhgJX6jnBQ6efnvb1U/rmq7Ibn
 UeqnfcOTnqUZk42vDAJmgbqJI4idzeq+C7JC429NNojeDfNLXYPUEVoGQSaLuQci7ZDN
 TozBYn6EDnNElG7Ie+I/6c3XnemtP1uguZJ63397Lmia4hi/syUd7yy0JSKRzwpz2zPW
 /7jZwq2Hsl9MmeLZheJSR7NHUZ/0KyPDjjswdqHuxmcS7x+0RPYoQTlqC3pdJAS4VVeX
 aquHQHpkrsi72qj6LMohkeEFzZNwr7ko9IdKT17J8TMsoniVLMXUATMIb3q+is8/BmXC
 Kevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9OuUx3KXVHJzGt1nkLMrzoX0tQkzHA3ws4rQqxVIlAU=;
 b=F6c9LHVSN18F5hkqI1FSJn7/0Y0AzvUaAtRDaTB4uqy4WOoIwIxjoUvppNmYiEM8fS
 dCcHLeMOm8OK9GijcbfLLQxz+ZfV/frAZO8JoyFAz8m1/pCs8JeX/0Q3Jgn/4k4xS3kG
 +UC3sDSiH9Qt5OlOUEbkwZTpexNG+E36W8Kho9moOPhWPw++eqvzesZikBkKowSNSt/L
 EegHhc/vdsJzNJboPY6Fqx+u015Fv2Wf7VsbbzEa05l80uAkNGJUIsCypdJiBIbSwSdD
 Gao8jFu/1sppS5vxzOc+mbizHqv0ApplpwK6ZnXN4rvBZqvgtBi8qihwk7CH5EaL+oro
 McpQ==
X-Gm-Message-State: AOAM531LS+7tn1xgs8xtFceCb8MgXYdLhezo+6HUCBgrP6hRiPpPCgu2
 w3RZryMo6E2EjC+gPc4sbz51cqqcC93N5g==
X-Google-Smtp-Source: ABdhPJwv8VMJ4KHRU0dxak2AD3U+O/PeXgwnCOo3RcWxIVJqB9SSvTLPKmheRvTC6ByxBh3Brhm6ig==
X-Received: by 2002:ac8:70b:: with SMTP id g11mr1789777qth.387.1631738383390; 
 Wed, 15 Sep 2021 13:39:43 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id j18sm843374qke.75.2021.09.15.13.39.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Sep 2021 13:39:42 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org, Sean Paul <seanpaul@chromium.org>,
 Rob Herring <robh@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 12/13] dt-bindings: msm/dp: Add bindings for HDCP registers
Date: Wed, 15 Sep 2021 16:38:31 -0400
Message-Id: <20210915203834.1439-13-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210915203834.1439-1-sean@poorly.run>
References: <20210915203834.1439-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch adds the bindings for the MSM DisplayPort HDCP registers
which are required to write the HDCP key into the display controller as
well as the registers to enable HDCP authentication/key
exchange/encryption.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1

Changes in v2:
-Drop register range names (Stephen)
-Fix yaml errors (Rob)
---
 .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 64d8d9e5e47a..80a55e9ff532 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,7 +19,7 @@ properties:
       - qcom,sc7180-dp
 
   reg:
-    maxItems: 1
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -99,8 +99,9 @@ examples:
     #include <dt-bindings/power/qcom-rpmpd.h>
 
     displayport-controller@ae90000 {
-        compatible = "qcom,sc7180-dp";
-        reg = <0xae90000 0x1400>;
+        reg = <0 0x0ae90000 0 0x1400>,
+              <0 0x0aed1000 0 0x174>,
+              <0 0x0aee1000 0 0x2c>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

