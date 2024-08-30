Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D725965C08
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1595E10EA3E;
	Fri, 30 Aug 2024 08:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Ctq+hjd4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F86910EA3E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:45:58 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7142e4dddbfso1259186b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 01:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725007558; x=1725612358;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BNhoisuk/jUSOFe52sR46QCIHvi7hEsksA7LiMmuHN0=;
 b=Ctq+hjd4fzpzqmIxTpGVLHZqbEBXyo0qh3Z0sSqVZ0uCJRFI1wHVymZIG0kjK83lYH
 hE4RIGY5wFOJMiJT6m3+gl5nTvy0+TiPbvQiIzfPwAKpqnEht36iUKK2WIgTsrKcKxjS
 cxhTCXWxGudrdskm+86Y68SRZqjthBMU5KOJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725007558; x=1725612358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNhoisuk/jUSOFe52sR46QCIHvi7hEsksA7LiMmuHN0=;
 b=WXNXEGvEkx7rO/6GxznJmysiQcwv31aiVBmyS+JWglPYvbSTW0JEGRrigFa6ZFwUw1
 PqI1Qo+KiflaHgWQe3FTxwm9d6wDaigVWMPG80OHZgtc2BYPOVwRn0s4GN7VQ3oLN8ju
 rEY0AS0RI0aseUXIH5dZHi8Enh2Ng+/uOJheTKD2HmE2/bt0gWE2cL1uc0p7DbpEq4w4
 Tq50bSkRvf/SzT2FdLEpJmCIbIKuCktapbfGgs2AGbSwZudi/mjqj/fq+lJalRcCgf3S
 Y8h/hN5zhIKNrCTxTPO1DTn9XvWpwQE/9HYNCWjbq9dFvaUwBGAP+/tdUfatG0CE7iau
 /gpw==
X-Gm-Message-State: AOJu0YzYEObj/B6ZjHR+5cBk3RgougNvWCRalVOf9gNaL7km5YQWQNns
 IofNjUIBiCOqCMNNjXqx5Bhwn1sfkJXXDuWZlyDVuH83aZmkMgxXGBCM6r4jLw==
X-Google-Smtp-Source: AGHT+IHJFS1jtvkTZ22k5pD+Kn9bReufF91Us6y0WLt5aVVQ6EqMEnI6zYAJ2oR7UwfAiAfac5+tAg==
X-Received: by 2002:a05:6a21:2d07:b0:1c4:a1f4:3490 with SMTP id
 adf61e73a8af0-1cce10a7fd4mr4563290637.39.1725007557633; 
 Fri, 30 Aug 2024 01:45:57 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com.
 [34.142.196.117]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2d8445d5bb0sm5784248a91.1.2024.08.30.01.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 01:45:57 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Rohit Agarwal <rohiagar@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: display: mediatek: dpi: Add power domains
Date: Fri, 30 Aug 2024 08:45:42 +0000
Message-ID: <20240830084544.2898512-2-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240830084544.2898512-1-rohiagar@chromium.org>
References: <20240830084544.2898512-1-rohiagar@chromium.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
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
2.46.0.469.g59c65b2a67-goog

