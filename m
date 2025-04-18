Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3334A93DAD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 20:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A02E10E3C5;
	Fri, 18 Apr 2025 18:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JFsyLDxL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE8910E261
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 18:47:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso1327722f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 11:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745002030; x=1745606830; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JA4Gzqui520XvKDgLFTWbJLAfJxRvucBmm1a9C+IgC8=;
 b=JFsyLDxLwlPz1gdMUWe4GAOIz5GdJb76U1aoyn/z0Xt9kGSFa4I5NDZ2URfyXihBzA
 kjfcWWMv4TapZOfFKRLuuOjKOTTwhQtdIw5NATImvcSzI5/36JyUBmpGOMlvAWuYPT2Q
 nEDDXB2PiL64WfQXOJd1FzFJKVWoHuCc6bC27I4Wrgu1PlNOFsa16VVUOosq44uZqQyx
 RXF45hloQE78b9nntfBcEL6DWmd0LnpSbAkCZTFJWbZTQPIEjPxcycD9im8RK83fPeZv
 v9PhfRkLjUAaSzU81OHOjPl4YzhgQJ+L0YfcgNwi7MzioJ913wmialqLYMJTC0sEwu0x
 MDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745002030; x=1745606830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JA4Gzqui520XvKDgLFTWbJLAfJxRvucBmm1a9C+IgC8=;
 b=bi8ptMR0rOxrFwYOzZnqaQo5pRN0vMjh5x6CimVfBIBdM6eYB3i2g8yTorwOucgkwZ
 ap/CWJUkA3giswblSUCxVNKs9REW0g2syBgetCBbXtgiT32mW5by+CMp4YI2NZ498tOR
 rxxKx2DQb1td0eCtj0okElFmGpXgo9bwlZ6V/oRmWaP8mKaMEvbL7rmpj46LrrXso2AS
 n8SLj7/e6QqUBkhiQDNpljYEEeG8fQMqoi44eJ/JlbNJ1JQ4JUjmACkqjeJf4tKEfau8
 moUebQdmhbIxn8IMDzBXJj50XwdvnGS6YSzrhuvi7QGUVv6KgTZULr4aCslQFQU00Ivs
 kw7Q==
X-Gm-Message-State: AOJu0Yz9CKjKka/4Fzz7B/mnPUWOhGnw54+TGemUl6dW8K9p6nlNIbSl
 kNNtPohq0D3BE+dZDo1ud+uhNt7BW4VzpILhd80xsY6kMEaNQziN
X-Gm-Gg: ASbGnct9dukB4I36J4z27FUOZ2W5UfYOHtL+wrTAQDto+T/9BZyCKsCcxqANureD/b7
 iVp3IDoi/j2NfAF/SX54NU5g904fXjNpoaZF4n8F+gKDT/hro3t9gbY8OjKRecc1gzKm3oEhW4G
 94E/2gPVTJcfAo7C0RK3XsKpEZEst/PTEsvv6Mhsgdck9Hul5QKBEGbzJ9XLy+zceQRdsNMqZ/G
 ObOaK2LFYvpIyaTXrqHFBqN5iAHIAWmnqD6ZSYNFtgwfhg09VCGDPouWV3SHK2dcQtLwPVe8mWO
 m+0FBI55YvE1f9Cw3QPkRLNyzNqn2F+FHD5XvHC9nidBO2sotfUaXC+azNNciXnkhg==
X-Google-Smtp-Source: AGHT+IG79+Xzgm+XZga2TyIMFd6/uqPiEpAEqn9ilP5gPzSy9wE1lxpvKq79sxI9ZGAXxADMR+n3TQ==
X-Received: by 2002:a05:6000:178d:b0:39c:c64e:cf58 with SMTP id
 ffacd0b85a97d-39efbaf20ccmr2872071f8f.55.1745002030471; 
 Fri, 18 Apr 2025 11:47:10 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Apr 2025 11:47:09 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/15] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Fri, 18 Apr 2025 19:46:46 +0100
Message-ID: <20250418184658.456398-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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

