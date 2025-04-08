Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4C2A8164F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 22:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5508310E73A;
	Tue,  8 Apr 2025 20:09:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h8ECdzG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E4D10E736
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 20:09:30 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so5112299f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Apr 2025 13:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744142969; x=1744747769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6PvSlX3UVeGDNwealKGP8bVLmlKmSx6HR6buSyxTi2M=;
 b=h8ECdzG8LFNle5/POIT5c1RSlyC+mk0Wx5DzRU37BABwJxW7dPopAX4BPCvlC7EMxo
 qxK1ADvahi4v1aiggA+SCVWblRehN0/WQQBPuNpTNG+URqyPMYoQ+lt7xnd94KEa5JTW
 g7+HP9cULqmK5+YKxThm+zNIWaMb2vTnBZqb5LzYQYmwU78tRMXACb9v8Om56KKsDF7D
 j5D4lKyTPOlNDDe8c1PgPcB+0DrjyUdgMckbczb+UBmMnWTqX3xp7J2lAojEVBGQAVR9
 rT3EbxKJAT4rBicCpiTT8azQIL3J+j67EHHPLiBewPXtxizIKOWQCIkmgty5ZTpV+lQO
 fxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744142969; x=1744747769;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6PvSlX3UVeGDNwealKGP8bVLmlKmSx6HR6buSyxTi2M=;
 b=uBBbFWdRsAI0zyy5ZdLrCil07oY2rmV2gpj/ZVSJIeIlFh0ZK5SfHdJDXiDwt5NwBK
 vqZMGY6g5+3O2H2eCOFIbkt7ulHH0egQ3LVJ+x0If25HPsdXl1UtUdW0g+drwehiCq5j
 Af0wDTGXUbA9tZQhQDPj1S5dHMH295zJVfn5oFveLZ8m+Tfx10xPCTpjc2YRAXmW6eXG
 bfcwiRKtmwhAOCJQNji/OARST32MqiZo3e3Pa8hESORq5f4Jn9Wblm8cLrQ7LOE8Lshm
 I9+YC59Dd+yQbgjI3CzS1U1kWW+KHNyyFWAgYxJdV+lWKGmXIp303d6XpzN5y5imPRdo
 E7TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIJo+miGaXoDY5ZUMnobAy7D/QYkmj59YKSFMgwJwpk91RwwFkpXap0fcBvop1Eir2QaEy/uoGWDE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRkEP1rhl8HwyKNf9eqv2tCs5X3M/UkRHkJQyE1Zu1cwhU3WBw
 C6+NqeVcDddLOBnOUSmb1836LJF0NrxsVnMPDWX79AMFNSYiDF+D
X-Gm-Gg: ASbGncsvSUlymeT/QJpi7bUSP/zpIoJ9FlQA81CX+gq71Ud32x4qGIwAgBJJ8Bp/9/X
 vwOHyXy1suL1QRO7FgMdNHTZYa1WmnSFaoLH6UoZQsKeoClp2hr8xMd/lZ8EIacOSqxTMowkk2O
 /f2MNDu9MHaWQ0QbmXdiAJwAK9OgkPxZP25sn/Qy8S1ihrDt0E3pwu2G5NUWvmeQN4rFr3n/1Ub
 KdoFOrAmrHTVUOr3YrfYClMk5Pn9VszD/96+9Cjcpei0QacX2fqMCps4M0GxPf4+xdDso+SO7pi
 au8ROH4AEeRLAUdFw5lJzeDgqwfwi5rtR+HKbuJn/HahMGC4u2Zjki4A90klGQ8VLdBr
X-Google-Smtp-Source: AGHT+IFUUqfy45SBK3izzH4KdLTpO1CBgEpKMhKxmbcxZfiJSnVmIdlzxBNsI+YFBYjxx7ohKRucIA==
X-Received: by 2002:adf:b641:0:b0:39c:1257:cd40 with SMTP id
 ffacd0b85a97d-39d87cdb14cmr239355f8f.58.1744142969024; 
 Tue, 08 Apr 2025 13:09:29 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 13:09:27 -0700 (PDT)
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 03/15] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/V2H(P) SoC
Date: Tue,  8 Apr 2025 21:09:00 +0100
Message-ID: <20250408200916.93793-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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

