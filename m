Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A895D9A4B4B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 07:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6D110E071;
	Sat, 19 Oct 2024 05:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="C7K5tq8e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451A110E071
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 05:30:09 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-20cf3e36a76so29008485ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 22:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1729315809; x=1729920609;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cJNuS83mrwWL8W8iH3SFWUNmmnjimhgt4bHtgaT67XI=;
 b=C7K5tq8eRuXUmeqM1EcQptn/ZQ3CM6U1Fl+LacGUD8qLwD4Y5PZpEUiCw3mJhpLdpU
 5kXDZ9FC8+olnOBXduJyCkf+HhmzW8WSuqZ9tm0KQDPD/y6r4t6gX80Gx0FK+4uvpD1Z
 rmkf1isnzudTmtC3x5inzblBMEsjdBPr1f8W0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729315809; x=1729920609;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cJNuS83mrwWL8W8iH3SFWUNmmnjimhgt4bHtgaT67XI=;
 b=KilnEl4TiZxbmy9sdFegDGBpiKXUo+pYr0HzhJXKHCSMM6kXtU/Tydx0WboEssarOy
 Gyq5HmzY/e43GXKEJlWiGLuRaux6OhP4yRo0YhmdwTXU8U6qvBaTL90W4p0igUwJH1Hg
 faLLlPZ7SVFqUN40xJ3n6rnIAYEK1fgjYUy5ItGgLfB0e98us9XexL0EcYfhuWWY+8yo
 nGBVE2Pv1X46Lrcb5MgkroUgmB7kQfQDAQIrciWQATYEZSA4zxlQbaMPU3YFb6gQuH0S
 u6Rb99UZoGFAAR5mHLWJGxfV7JKW7oV48uia+CJBN+dFu9UGWBmJQHSSYw2osoeEpQmI
 Hhhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjgZjmKzPDbLhv4ZFPsUWtLEYJAyqpUKSNjTbRxRAXgR1i6OpvYanZrWwjf0u/HAyN70f0PsYgilc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP0gCUz6OpBFk13QDZJ0yOmgomClWQIZR8HspeLJ6thLOTphr6
 l1Skn0h6Zk8qkSmX1MEA26A2Oqc8ZxAgO6aAGfCgVH0Cew+bb2ih+5TpAFMV9A==
X-Google-Smtp-Source: AGHT+IH7n9UXYo5nlALMpZiRBbTQ8pp4m9cx7aacSoU54soAc/R6mjW8EzAU5xHiakUlodnb2D1f8Q==
X-Received: by 2002:a05:6a21:458a:b0:1d7:118a:327b with SMTP id
 adf61e73a8af0-1d92c4a1d2emr6720501637.9.1729315808788; 
 Fri, 18 Oct 2024 22:30:08 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com
 ([2401:fa00:1:10:baba:fa50:ff3b:337])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71ea333bea3sm2370438b3a.57.2024.10.18.22.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 22:30:08 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>, CK Hu <ck.hu@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: display: mediatek: dpi: Update device list with
 power-domains
Date: Sat, 19 Oct 2024 13:26:56 +0800
Message-ID: <20241019052935.553886-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
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

There are two kinds of MediaTek DPI devices in the tree: the ones with a
power domain and those without (or missing). The former are the majority
and are more common in newer DTs. Only three older DTs fall into the
latter category: MT2701, MT7623 and MT8192.

However, the current binding only allows particular DPI devices to have
power domains, which results in spurious binding check errors against
existing and new DTs.

Instead of diligently maintaining the allowed list, let's do it the
other way around - create an exception list for devices that are fine
not specifying a power domain. This list is expected to be fixed, and it
encourages new MTK DPI devices to describe their power domain whenever
possible; if not, those should be listed with proper rationale.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../bindings/display/mediatek/mediatek,dpi.yaml   | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 3a82aec9021c..c464642bbfb6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -81,14 +81,13 @@ required:
 
 allOf:
   - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - mediatek,mt6795-dpi
-                - mediatek,mt8173-dpi
-                - mediatek,mt8186-dpi
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2701-dpi
+              - mediatek,mt7623-dpi
+              - mediatek,mt8192-dpi
     then:
       properties:
         power-domains: false
-- 
2.47.0.rc1.288.g06298d1525-goog

