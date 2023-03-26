Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777656C964A
	for <lists+dri-devel@lfdr.de>; Sun, 26 Mar 2023 17:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AF310E1E2;
	Sun, 26 Mar 2023 15:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AA210E1DE
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 15:54:31 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id ew6so26149307edb.7
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Mar 2023 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679846071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=35gnd9Aoe6xXafnL7UjQDr8l7FiduXH+e+bO3yaocVQ=;
 b=cvQf/CMin7njufwpp/za+I8Rz68YWTJ0WXpvpJSwzMc0Ae/C7X3H6xcgseB6KgZISn
 XtnHRWABl8Y/QVYTbfS8MjyfpXKZbwl1htuDRc8yL+wa74KTDuwjJyrUAD/R+/heMcJf
 XuVH0nbjkc686q7IgCRJLc25Wt7FzouTHZ/bBRFl53ZcFI/Kb8ydh1EGxdaOJsG2z4I5
 MyiTX0evsN+zBKWEGVwn+uspghSWyf3ajUrkD3KlQTiUlyuCKEvP+riuohmENzDSZ27/
 CsnMLkBpuGrLv8sbsyYmAwroTRjJAF6ie3OxEYnMgo7bLG0l/jd+RaHEYdFzCCkac4iN
 yUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679846071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=35gnd9Aoe6xXafnL7UjQDr8l7FiduXH+e+bO3yaocVQ=;
 b=QUdOkZn/KdHG+y3vw8iPgiggsTWWcfxsh5jiycI5h69o+gqeD8d5vJwEotT9z0WTqP
 kzLTrLRtbl9QFN/h+xtnNvCeN74YMyaEvukysJ1lhkgTzLrw36g21tKXD1rqOI6BXa0b
 LbNqZMYPwLumRQzOFL7qauY0Jghw2nf7j5ymNurJmUVs+tl6GPPy3GnF6j/C2WVPGaOf
 PubyWssI0cLHuY0mEskny66ITmherd76ohQUaLdWTX6HG5GuvRx4LSJf04hs+JsM2cDe
 PsbsUnGhPfSrfAEJzafHvMepxgjkMQnrsN6iVsR7BljtWS1ixxlcDaU+1zIobBvlgkdm
 z/fQ==
X-Gm-Message-State: AAQBX9dWHlr0xq/i3miQssKVRdDQGC4qmfxVtrLfS2bXcsJyCd9Z2sEh
 UQzhHTfBj+6uEz/xxh5VyAgr+w==
X-Google-Smtp-Source: AKy350YeMSofZ0QLOlunDhezkNrl7kEmCVRPmLyxkHTFWj/WDls9x8pkSZccXelwW71dBv6N1tZ6PQ==
X-Received: by 2002:aa7:cc05:0:b0:4fb:8f07:edbd with SMTP id
 q5-20020aa7cc05000000b004fb8f07edbdmr10358380edt.10.1679846071248; 
 Sun, 26 Mar 2023 08:54:31 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:eca3:3b8f:823b:2669])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a50d6c6000000b004af62273b66sm13506742edj.18.2023.03.26.08.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 08:54:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Srba <Michael.Srba@seznam.cz>,
 Harigovindan P <harigovi@codeaurora.org>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: display: panel-simple-dsi: allow vddio
 variant
Date: Sun, 26 Mar 2023 17:54:22 +0200
Message-Id: <20230326155425.91181-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
References: <20230326155425.91181-1-krzysztof.kozlowski@linaro.org>
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

Few panels like Samsung s6e3fc2x01 and sofef00 use vddio-supply instead
of power-supply (in DTS and Linux driver), so allow it to fix:

  sdm845-oneplus-enchilada.dtb: panel@0: 'power-supply' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../display/panel/panel-simple-dsi.yaml       | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 2c00813f5d20..90c04cff8281 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -19,9 +19,6 @@ description: |
 
   If the panel is more advanced a dedicated binding file is required.
 
-allOf:
-  - $ref: panel-common.yaml#
-
 properties:
 
   compatible:
@@ -67,12 +64,31 @@ properties:
   reset-gpios: true
   port: true
   power-supply: true
+  vddio-supply: true
+
+allOf:
+  - $ref: panel-common.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - samsung,s6e3fc2x01
+            - samsung,sofef00
+    then:
+      properties:
+        power-supply: false
+      required:
+        - vddio-supply
+    else:
+      properties:
+        vddio-supply: false
+      required:
+        - power-supply
 
 additionalProperties: false
 
 required:
   - compatible
-  - power-supply
   - reg
 
 examples:
-- 
2.34.1

