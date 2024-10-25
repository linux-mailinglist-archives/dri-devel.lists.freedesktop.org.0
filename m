Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA729B005F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 12:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4B410E02C;
	Fri, 25 Oct 2024 10:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jEW0b83b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC4310E030
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:43:24 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2e2e050b1c3so2063551a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 03:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729853004; x=1730457804;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KxrytHmxkB3KbKiG8V4DcHZ1mCc5pLP/FlD1m68qCP4=;
 b=jEW0b83bJzoVRv6Mde0BXZscVho/+0/RXKvgcvoXrsmcdaX5syUPOybeaiOK/UYdQF
 kCcJZmZx04yll3YPP5xWABNGo548uH2T6th384gZ+Z49wL6bBKDq0PRcLeYNhopmMNB3
 puWAcwY5MCg/wOEA2NdFVIZYMz+JnHXeSB0bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729853004; x=1730457804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KxrytHmxkB3KbKiG8V4DcHZ1mCc5pLP/FlD1m68qCP4=;
 b=Zs3kY0oPQk2H0SvkbSEpd2ELtwGQij0tEjkkLDxGHY5BLwrQPzBiDtj0ue5PZnMbh2
 O4aJ4tBSP3xweAsXnOXJT+NxTrhqc77PcGXCOAI+jbQPxV9nDyRC6f/1l02YdJhfKatc
 uyLjMHNTGvwDb1+WPQzuAHbq2BJMk880+aPaHEECQsZC0yekHN3vdJ/Zp/Fhxl154UtH
 V96IrUzF2sxUQJqsUEnsFEu6ZsavavbPorg0vKi8+nkPeXxr04qsRQr0XSu0RQpZCC+f
 Uez69cA5DGeKtqgYGcDI2JH12Mzla/lQ2QTzJZCMbMoehqNr2iSdEV/b79pZG4HSrrVy
 Tk3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAsLVkJ+37Ic7KpLl32y8J2kLNEJJHJXmgYgLFz4x1DFaK7w73TBbRpXL3FbK5Rhhvv99At0aM22k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdbAsPfUL7GYCSdT87yxgehCc1xw0d54xRDB25OlUulBtiwzbE
 4q2uIeZiCTiiVVSxg+Op9on3n5gDFWJ5OLeS1Zau6v2RUBTLP6jZmAseu1GVlw==
X-Google-Smtp-Source: AGHT+IEc8DWXdGFrPxI2fzHPjMeSAyvo7Jul73y4KLbJM19gxhJsddXsu1xMH6CPalfcWwhWNeu3pg==
X-Received: by 2002:a17:90a:4bc6:b0:2e1:8a41:aaba with SMTP id
 98e67ed59e1d1-2e77e88ddfemr7745822a91.19.1729853003888; 
 Fri, 25 Oct 2024 03:43:23 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e36a26aasm1093307a91.27.2024.10.25.03.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 03:43:23 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jitao shi <jitao.shi@mediatek.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: display: mediatek: dp: Add #sound-dai-cells
 property
Date: Fri, 25 Oct 2024 18:42:45 +0800
Message-ID: <20241025104310.1210946-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
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

The MediaTek DP hardware supports audio, and the "#sound-dai-cells"
property is required to describe DAI links and audio routing.

Add "#sound-dai-cells" property to the binding and filter out non-DP
compatibles, as MediaTek eDP doesn't support audio.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../bindings/display/mediatek/mediatek,dp.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 2aef1eb32e11..c05c2b409780 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -42,6 +42,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  "#sound-dai-cells":
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
@@ -87,6 +90,19 @@ required:
 
 additionalProperties: false
 
+allOf:
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
+        "#sound-dai-cells": false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.47.0.163.g1226f6d8fa-goog

