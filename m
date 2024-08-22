Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0695ADE6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D01F310E76F;
	Thu, 22 Aug 2024 06:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bRPevxC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0464D10E76F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 06:47:05 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7bb75419123so312037a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 23:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1724309224; x=1724914024;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6VhPMtectai4hGqbUSp0dB+6VO3NOuS573R5ytgFYI=;
 b=bRPevxC18IaaCrMC41ZADyTfolPuYo+kKrnID5j84NMxavn9qtjoWz5zTQvC7ZWVA+
 oJMrhJW7qsSd3VJw1X1sRgNd+lCOehhnvAKtjGXWmQp+4yfcafND/VbN6KJyJWdDfOrT
 Nm9VaowEHDG5wTKOvsk5AL0o2y3fLRv6klFDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724309224; x=1724914024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a6VhPMtectai4hGqbUSp0dB+6VO3NOuS573R5ytgFYI=;
 b=SNZ9uZ43354JJoFPdhmWChKFt66KQZo9ZoMUITKluPlczZ87UlQ2TREKvy4WLaC1lt
 jCj9UNCtaBf7vKsMhKBrhDFsesTGl3G+UyrO0OTQNEJDtLFR9qGf1cHgXkZwi7HwKhZ/
 xAPdd2n8faz8RZwUHKcg7pBhBapCYp9AJxZOCWg9IRd8O37qyIc9p+m/FeJqwj4oNRGG
 iE0zY9bwUsTBtXCWKuTEnqX0mvYWDcXTh8qNvOzXglokURJF9heqAnrbH9tKFnCjt3WP
 8WB5av8T1+amv5yABBBfLprGGWcYWNaee++KAXmbyh/Fb1qdppZjVH/dRvm/uaBECFuX
 rJ+A==
X-Gm-Message-State: AOJu0YzB1rCxBGWpPJVdtYajuzv2Y6mEkhwhprjTVQ7UfwBhFG9Mj5pA
 SWHN6+rrY1v6Oe2ZM7Xp4AoMQKHjgtXVhlXVhK54AE/R1ZsCIqjNf/2VKU1/Pw==
X-Google-Smtp-Source: AGHT+IFOTThZc7Acbudhp76jsdVEtyD08nopL5PxkAb/g8HYG8h8pM7szn8X6lzKGkKTXkFY44I14Q==
X-Received: by 2002:a05:6a20:6f8a:b0:1c6:a656:84c9 with SMTP id
 adf61e73a8af0-1caeb1d6a60mr1116121637.16.1724309224283; 
 Wed, 21 Aug 2024 23:47:04 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com.
 [34.143.174.185]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2d6136fc523sm856946a91.9.2024.08.21.23.47.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 23:47:04 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v3 1/3] dt-bindings: display: mediatek: dpi: Add power domains
Date: Thu, 22 Aug 2024 06:46:48 +0000
Message-ID: <20240822064650.1473930-2-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240822064650.1473930-1-rohiagar@chromium.org>
References: <20240822064650.1473930-1-rohiagar@chromium.org>
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

Add power domain binding to the mediatek DPI controller
for MT8186.
Also, add power domain binding for other SoCs like
MT6795 and MT8173 that already had power domain property.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 .../bindings/display/mediatek/mediatek,dpi.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5ca7679d5427..3a82aec9021c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -62,6 +62,9 @@ properties:
       - const: default
       - const: sleep
 
+  power-domains:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -76,6 +79,20 @@ required:
   - clock-names
   - port
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt6795-dpi
+                - mediatek,mt8173-dpi
+                - mediatek,mt8186-dpi
+    then:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.46.0.295.g3b9ea8a38a-goog

