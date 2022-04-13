Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E384FF848
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 16:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6446910EFB7;
	Wed, 13 Apr 2022 14:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A555810E4B6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 14:00:35 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 b17-20020a0568301df100b005ce0456a9efso1220335otj.9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 07:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M2Wl/nq/dpqitiEtaYG1649KE5qjpYJCnCT/UcTfasY=;
 b=vfVmyX/sanPVSF2RWGCMEyYAyrAi6zHt5tiVpnGr+unqDCFiyf9ziyUZN9wbK27U4/
 2NNGqKNOOoVu3VXP0y8sCODjQ53TpbUBdEmT2zBReBOwnaonawAwq79X2NJpn/m1poez
 65shQPfjPKsjMhB5554oF0Cg+giloNaxvAOMkabsTizqa+zIrzsoiTm/zr8R7MwcM2U1
 I/s2EvGV0J+cUL4OXFBfQNt7iVEp4HP/37B5EduiijfVcSO4gCnqnsiqmWhT0illFTGt
 fbZwf3pQv+5fZRj43Kz5cVdpjOV8xvPI+eWzTuL9dNRY2JdkkD+xFvaVYD7M38usjMuN
 drbQ==
X-Gm-Message-State: AOAM532bBB4iZNHQfxLhOWW1LUJyGo1gjS5YCV9WTIJYK9hdBluLF/R7
 5HeJKAnMRGfvR1NNoqB9Mg==
X-Google-Smtp-Source: ABdhPJwJmT21alPgGoRzX/oYfAlptyAhoCoH1dqMI6H16MGqg8MgrK3zMh3QLc1pK3xtMska4vwR+Q==
X-Received: by 2002:a05:6830:1f49:b0:5b2:5c16:3dd1 with SMTP id
 u9-20020a0568301f4900b005b25c163dd1mr14832949oth.207.1649858434660; 
 Wed, 13 Apr 2022 07:00:34 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 71-20020a9d084d000000b005e969b3f0b1sm653146oty.67.2022.04.13.07.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 07:00:34 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH] dt-bindings: display: panel-timing: Define a single type for
 properties
Date: Wed, 13 Apr 2022 09:00:15 -0500
Message-Id: <20220413140016.3131013-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's not good practice to define multiple types for the same property, so
factor out the type reference making the properties always an uint32-array
with a length of 1 or 3 items.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/display/panel/panel-timing.yaml  | 42 ++++++++-----------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
index 9bf592dc3033..7749de95ee40 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-timing.yaml
@@ -71,78 +71,72 @@ properties:
 
   hfront-porch:
     description: Horizontal front porch panel timing
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     oneOf:
-      - $ref: /schemas/types.yaml#/definitions/uint32
-        maxItems: 1
+      - maxItems: 1
         items:
           description: typical number of pixels
-      - $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 3
+      - minItems: 3
         maxItems: 3
         items:
           description: min, typ, max number of pixels
 
   hback-porch:
     description: Horizontal back porch timing
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     oneOf:
-      - $ref: /schemas/types.yaml#/definitions/uint32
-        maxItems: 1
+      - maxItems: 1
         items:
           description: typical number of pixels
-      - $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 3
+      - minItems: 3
         maxItems: 3
         items:
           description: min, typ, max number of pixels
 
   hsync-len:
     description: Horizontal sync length panel timing
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     oneOf:
-      - $ref: /schemas/types.yaml#/definitions/uint32
-        maxItems: 1
+      - maxItems: 1
         items:
           description: typical number of pixels
-      - $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 3
+      - minItems: 3
         maxItems: 3
         items:
           description: min, typ, max number of pixels
 
   vfront-porch:
     description: Vertical front porch panel timing
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     oneOf:
-      - $ref: /schemas/types.yaml#/definitions/uint32
-        maxItems: 1
+      - maxItems: 1
         items:
           description: typical number of lines
-      - $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 3
+      - minItems: 3
         maxItems: 3
         items:
           description: min, typ, max number of lines
 
   vback-porch:
     description: Vertical back porch panel timing
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     oneOf:
-      - $ref: /schemas/types.yaml#/definitions/uint32
-        maxItems: 1
+      - maxItems: 1
         items:
           description: typical number of lines
-      - $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 3
+      - minItems: 3
         maxItems: 3
         items:
           description: min, typ, max number of lines
 
   vsync-len:
     description: Vertical sync length panel timing
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     oneOf:
-      - $ref: /schemas/types.yaml#/definitions/uint32
-        maxItems: 1
+      - maxItems: 1
         items:
           description: typical number of lines
-      - $ref: /schemas/types.yaml#/definitions/uint32-array
-        minItems: 3
+      - minItems: 3
         maxItems: 3
         items:
           description: min, typ, max number of lines
-- 
2.32.0

