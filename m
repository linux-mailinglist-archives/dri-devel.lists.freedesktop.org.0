Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD8D955E01
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 19:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F8F10E05A;
	Sun, 18 Aug 2024 17:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EZLe2fvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50BF10E05A
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 17:30:10 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-371afae614aso835184f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Aug 2024 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724002209; x=1724607009; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzVXqaruIBhv+u4Ahnh+PsR/HVOCMt8ptVRPRgst13E=;
 b=EZLe2fvljSrmsMiZwMGRyHLHbucFhy+HTY/0Nr0EX0fbj1CXjErdcldYqYv0hEUqSa
 lPwMF49y9huMa9sKBjVYqabqmO9EPVk/lE17yns1DjVIz/RdnwJhx4jvgSFWEbXMr9LE
 e5oPGmUDWkjTWAltk7UXpLaJv3e9PtcyCXE5L6zEg62rx6A0f+vH4PK3rbQZULPKfPA8
 dQzttjheBIkKAx6fEmFu0YYZvn6d2epCw9DiHvTNLfEDKgSNVgxPJrAbHRPb9LL+AC9j
 q40R+nHJ/EvnywDCbetd9gUu3LoGKxuaCYKpXxBshBwcV+/t4c1B6ye310jitNQi8x2e
 HiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724002209; x=1724607009;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzVXqaruIBhv+u4Ahnh+PsR/HVOCMt8ptVRPRgst13E=;
 b=w23pMCPuFWVXENTiOtRqFeZmR7sMZ4Hixc1ZtPvtEx+StaFgrJSH5ibsChSZt2sBbL
 zFECg35PNAaN01OjaHmmPxciGdXvTOCBJaLoSMfvYd59OOg0a6jGbZziNtwotAcnPnK8
 1kgkLAOJQonejDVVtmUn2eFaAKbtfxL4O5Eje2OZ7DdKaYhyhf7u8t3u8tpFIMfcJtSx
 H8FyyCi0xYo2iCJqh4YBJXiTIjmOhKfELKHLDQA/DFa4RFNX5i6M26KELnPeGZM68TFM
 DxWbUprVakUnEkyZFxCo/03/MS8erdwrfXz7cLh6DSNvBRLVTSBvUhRT3xErJlz586T2
 VMyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoqQANLWXnAXoJA0qH9FNHd2R7dQ7t5msg883HGR2sz83agL3W8AfkqKT3R2ecOzrjCT/gnoP0nSdeQzQ5I+qRIU/MXBChcNYcYZa5P11E
X-Gm-Message-State: AOJu0YyMgocWM4p0SR39JmODxnWG9Yj2KKOrxrJjwo9H+fmX0Elx3sU/
 WucsUoDk4EBl4TDCLWEq1xtk36mn68nFa/UqjmJc98PRV5owf6ppIsLfOhW6h/k=
X-Google-Smtp-Source: AGHT+IGy7uAdpT03IoTiHZdekgN7fKpPoq4+ZutDJaQOeuK+lQ2OB3OCj0nEBWkOrVAoBuCSlVRxXA==
X-Received: by 2002:adf:e907:0:b0:367:2945:4093 with SMTP id
 ffacd0b85a97d-371946a43damr4969916f8f.40.1724002208973; 
 Sun, 18 Aug 2024 10:30:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded19839sm138973805e9.6.2024.08.18.10.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:30:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: display: renesas,
 du: add top-level constraints
Date: Sun, 18 Aug 2024 19:30:03 +0200
Message-ID: <20240818173003.122025-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
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

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks, clock-names, interrupts, resets, reset-names, renesas,cmms
and renesas,vsps.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/renesas,du.yaml          | 26 ++++++++++++++++---
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 147842b6465a..9a2d1c08cb1f 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -46,12 +46,26 @@ properties:
     maxItems: 1
 
   # See compatible-specific constraints below.
-  clocks: true
-  clock-names: true
+  clocks:
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+
   interrupts:
+    minItems: 1
+    maxItems: 4
     description: Interrupt specifiers, one per DU channel
-  resets: true
-  reset-names: true
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
@@ -77,6 +91,8 @@ properties:
 
   renesas,cmms:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 4
     items:
       maxItems: 1
     description:
@@ -85,6 +101,8 @@ properties:
 
   renesas,vsps:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 4
     items:
       items:
         - description: phandle to VSP instance that serves the DU channel
-- 
2.43.0

