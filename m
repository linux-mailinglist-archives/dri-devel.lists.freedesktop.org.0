Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E789E6E39DB
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 17:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F2110E256;
	Sun, 16 Apr 2023 15:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6BF10E256
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 15:39:34 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-504ecfdf6b6so4064050a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 08:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681659572; x=1684251572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E17WEg49le+klxTuomeJeEdwGWIDnQJMq0IOIIIQHco=;
 b=cbOSxVQUuH0TmnR/wMG+aV/jT6kR96WA9eXEZYRhn2HhZyOSjc6k3/sqt1vQSEloZC
 7FOZ9LQ2duwBDfuxwKi04MFdcN1s/MvtWfR3caktknX3Dq6oZixGL0uj7bsCSLNsemtd
 1ZyfF1I0Sl2N+Ha1jwr8kgA1Kvuyl3fJMOL3dgmMXcQ3QUk6s092DruBX5VdeMva/DAE
 iH80fhj7RSgmijPC+N7V8dVqbeVgZ+MLHMlBq/YwL5wRlalG5QQtdYvmpEAFdH2BV/t7
 sTEmugUwUomTp8fgB3MWK5LnKcnaeFXBQK+18pfeWo+xgSehkdJinVX2UxX4tBFnQDoM
 Pedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681659572; x=1684251572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E17WEg49le+klxTuomeJeEdwGWIDnQJMq0IOIIIQHco=;
 b=UypG2KKLU0Tr2uBvOlU1zegTKg7+PsW/Chms6DwXTqjNwsmjOqxBYtolFpcIxWjZWu
 zCV+35sW1glyqZIgWAzd+CvQJW4ri28sxjVZKpSLXv55ThayPOqvXgiBRTFEefY87m65
 zhvtRb2eYSykEq2C2ScKrBzGUNc+suZSWHmPrdX7J8w1uFT/qBbvqOhsRyCAonmYI28P
 6Qc95plK2azqZ8df64xxN6genG9WXasBoaHAsuvni+IopUIdPGR5j6TggQDW+o2yW7HC
 ZQZaT3bvTQfoOuJ+nrGGq0GxFn70VH5YdB0OKyGQdpQTL23gYiEMvPBlxt2LTEmpX77J
 afYw==
X-Gm-Message-State: AAQBX9etCYao5PfEX8nHBd1M1sf+QjZjBUWM72mgS1QQixd9umvBB3EO
 b0dIOP0LJyMLPKIrvFuAslMp/A==
X-Google-Smtp-Source: AKy350by7taFTgtiCyZogWFSQ3eKjCKTK54ZrMsi+pF+mkBrWI+iCsXIEt06LT1BLpFiZrbrzYjGrQ==
X-Received: by 2002:aa7:cd4f:0:b0:506:9ece:60cb with SMTP id
 v15-20020aa7cd4f000000b005069ece60cbmr2188353edw.38.1681659572188; 
 Sun, 16 Apr 2023 08:39:32 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ba4d:301c:484d:5c9])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a170906530300b0093a0e5977e2sm5217259ejo.225.2023.04.16.08.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 08:39:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: panel: add common definition of ports
Date: Sun, 16 Apr 2023 17:39:29 +0200
Message-Id: <20230416153929.356330-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Few panel bindings for dual-link connections just type "ports: true",
which does not enforce any type.  Add common definition of ports, so the
type will be fixed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/display/panel/panel-common.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index 5b38dc89cb21..ad62d34e6fa3 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -70,6 +70,16 @@ properties:
   port:
     $ref: /schemas/graph.yaml#/properties/port
 
+  # For dual-link connections
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    patternProperties:
+      "^port@[0-9a-f]+$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+
+    required:
+      - port@0
+
   ddc-i2c-bus:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
@@ -154,6 +164,12 @@ dependencies:
   width-mm: [ height-mm ]
   height-mm: [ width-mm ]
 
+allOf:
+  - not:
+      required:
+        - port
+        - ports
+
 additionalProperties: true
 
 ...
-- 
2.34.1

