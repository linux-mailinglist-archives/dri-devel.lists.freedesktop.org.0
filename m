Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DCC9BC889
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 10:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBF210E535;
	Tue,  5 Nov 2024 09:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ju2sf+Tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AEA10E2D0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 09:02:31 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7f3f1849849so171967a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2024 01:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1730797351; x=1731402151;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=djQbbob5DRcgyzgtrmCeJK9wCGVRn3M70o+CkFeCAc0=;
 b=Ju2sf+TpUzUx0lCtSGBuBbecOYrjoXxIoskZG3il02u6RNtg/FnPs6wecGOT3oZxtt
 PdStsQSiChXjixwy0KZw4rGuQL3mPjL2dqagh600L5iJQAd9V3wWenT0NndZyA2zEMXe
 LSlmaE2mjpGMjCUlZbRY7pjvGRuuzf2vHdrow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730797351; x=1731402151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=djQbbob5DRcgyzgtrmCeJK9wCGVRn3M70o+CkFeCAc0=;
 b=JaawtsHeFg6SBKocC6vepZPqqqo0/9V6N4qb9WvAiZMzvIFTx3MPMimVqH4UeTiNAu
 vP5KqDzaDU5+XZJfx4oKBnuc7xEkqKRuhRQDT/J6AhP5rEHIGZr98uQX5cZwQG8qrGI+
 KLcTGxeXTYkbLbapgLnl2gOlOEBYpDAIAsnaGWrqhuZv+aCnV1VHFrbbyp3x/XjL+5j9
 MIfoZW/01g2YTP21arW8EVSHEjMWMpoO4lHJMlKH4CZnQ2D/4pCU0DDtJRbE17O2DbYJ
 qh0ZWcYS4b04odKYsgGCj7ooqE1ti4EdVjMF5zoDG0v3+VW5imE3QDcJJF+P/jjTAQPr
 /jmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8JLF+Lx1iJ6R/+L46aJNfnBwxbmxZvHQSfgVcI8IR7VZ2dcGJz11sDUjULZi06qRr+AnHTPk3zh8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvqZE2gGqKwpQWw3GFJv9R1jI0IoTB3TORot4vXF5QbGSslqVP
 VBocBJJ2YLk5oiCKjdKZ9YUJympnfIWn4u3NIBrHYOzjOVffeI+pOsgiVS+Urg==
X-Google-Smtp-Source: AGHT+IH1k+zMqS05NS5QvavH+ykcILKALPqruVdecenHRtfW6dG9qXj72cxb37tXkc0AOy3qeQYb5g==
X-Received: by 2002:a17:90a:bc87:b0:2d3:da6d:8330 with SMTP id
 98e67ed59e1d1-2e92ce32e36mr25501301a91.4.1730797350795; 
 Tue, 05 Nov 2024 01:02:30 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:20ee:3712:ce0b:1ed7])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2110570ad54sm72591315ad.111.2024.11.05.01.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 01:02:30 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2] dt-bindings: display: mediatek: dp: Reference common DAI
 properties
Date: Tue,  5 Nov 2024 17:00:28 +0800
Message-ID: <20241105090207.3892242-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
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

The MediaTek DP hardware supports audio and exposes a DAI, so the
'#sound-dai-cells' property is needed for describing the DAI links.

Reference the dai-common.yaml schema to allow '#sound-dai-cells' to be
used, and filter out non-DP compatibles as MediaTek eDP in the same
binding doesn't support audio.

This fixes dtbs_check error:
  '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- reference to dai-common.yaml since the hardware exposes DAI
  and update to `unevaluatedProperties: false`
- update commit message

 .../display/mediatek/mediatek,dp.yaml         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 2aef1eb32e11..75ce92f4a5fd 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -42,6 +42,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
@@ -85,7 +88,21 @@ required:
   - ports
   - max-linkrate-mhz
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt8188-dp-tx
+                - mediatek,mt8195-dp-tx
+    then:
+      properties:
+        '#sound-dai-cells': false
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.0.277.g8800431eea-goog

