Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22045AB4280
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 20:23:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0C410E476;
	Mon, 12 May 2025 18:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hNkwCcyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EAF10E47D
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 18:23:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a0b9e2d640so4425249f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 May 2025 11:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747074227; x=1747679027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57DFAN0/ZRwoK0xUxYv+cuKjAK5uS9oM6kLns/redbs=;
 b=hNkwCcyjwmR9n6M3NBWg6YuGrsW7PoK17hscw6sQd/sn4FUuK4Nr2SsFlNBvrVvuoB
 Pn+U1XCTOVAIRlFFj6ZBI7zsRyf6b0wiQau9dt8r1HjNZNV9xJjpxjVCwvmEi/V561a8
 cW36FWSmLnr172ROvIUVJ5SlhkuPaahnN40OceZ/NCG6vlEt8C8b6iPHYMXsiZSCSdfO
 iwG7lQzh5o7gKWNQb/qBMmYLxLoJCgvJr5S2sEwCItl2Om4JU4vh39uXO/vYKkdn9gem
 AUQMmhGjlxj/IS/IYYu6sPjEhFVWGV4tkC6fK3W7MCQVIPtbqmX3VjNtXwmr+161gp8W
 SEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747074227; x=1747679027;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=57DFAN0/ZRwoK0xUxYv+cuKjAK5uS9oM6kLns/redbs=;
 b=PX4hFhIF3WT53XWjka3YZ/YWSivhskXmBaVZXW/vGJuGkB6jFZceM29HTvQCo0AOi/
 c0XFAC6pLFBsYe9OpApM0+sOfXt4ceFLoeOOP17rY7Uj6X25jSi+9RPNiVu/d1cStK1g
 X5WNizluhVhGeVBcWEkzsQh22WK5JCCdFfuXAM7fiev5b/I2+qEwfR2cT1EaDwG1CqnQ
 dn0RmCqw/2R8bSMrtBt3aZkSi/Msrn7FO1/yDYUQqTXCG+LIPrKH+H2E7yW3/L7FU7OY
 mzep47VjFXYDZXQnBEQiVUVodie4/9P7iLGA4iAkDQYTzJvzBo65XMC0kSylGE87bGQg
 uBfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYoVdeREjMPat1OB5TFqsX1fUCPYIAzoMtbUfxoxahmK1+FVrqmzWPhk8CsoRQeNXlGokZKfZRaJ8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuioLFiuCFzj+9Jf66Py4yyNh1l7Q3JMStV6WvDn5pqyNh09F3
 yiab9NLZUOotZ/3Yb4P6MQL0/no7ruvgqj4bf+Qb625IOMZJAqyx
X-Gm-Gg: ASbGncv9VuzHXDtTKLmivo/TF00IPgyW2JkdNJm9QFoQcQCPVpNtDUVgtYqXMqPUgpQ
 DuGSAPHQDdMGhgm7KLQjUe5WpOJNP3f21e21THV6XVUWvos5CRpFNhmsaoDUsJJVBda+Pf6nwkM
 Edcz8wpQDsnUZKrgxMX6hbNc+ZD2Q58RLjEaRtgOpLjDC3aBtjA6IwEy4x6pv3CvLeqLBiRl0fe
 JygCHZFt15/m2T09CNWqVV3ZaUC/d+PDrxLc3VpiW45k9sDT6jF2JgIwnhGBIEr1l7T40Dw9HT/
 AeB1tnf8ORA3hnYsdBEZk2HzcQHEalspCxKypAwHgOJGHS/hsSijn58AhoRgIcEX+1ljdydZGvz
 s
X-Google-Smtp-Source: AGHT+IG5V6qZw0WkMmFNDpW44kpQxtFWHfAJXl+GUo/2Pm1y6e3rk0hroLNfDvmtitv7uSFMo7W5hw==
X-Received: by 2002:a05:6000:2ae:b0:3a0:82d1:f3c2 with SMTP id
 ffacd0b85a97d-3a1f643a5bfmr10605831f8f.10.1747074227529; 
 Mon, 12 May 2025 11:23:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 11:23:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 01/12] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:23:19 +0100
Message-ID: <20250512182330.238259-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The DU block on the RZ/V2H(P) SoC is identical to the one found on the
RZ/G2L SoC. However, it only supports the DSI interface, whereas the
RZ/G2L supports both DSI and DPI interfaces.

Due to this difference, a SoC-specific compatible string
'renesas,r9a09g057-du' is added for the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Added reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- Collected reviewed tag from Krzysztof

v1->v2:
- Kept the sort order for schema validation
- Added  `port@1: false` for RZ/V2H(P) SoC
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 95e3d5e74b87..1e32d14b6edb 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
               - renesas,r9a07g054-du    # RZ/V2L
@@ -101,7 +102,12 @@ allOf:
 
           required:
             - port@0
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g044-du
+    then:
       properties:
         ports:
           properties:
@@ -113,6 +119,21 @@ allOf:
           required:
             - port@0
             - port@1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-du
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1: false
+
+          required:
+            - port@0
 
 examples:
   # RZ/G2L DU
-- 
2.49.0

