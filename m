Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D943FAAECE0
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A4910E8A9;
	Wed,  7 May 2025 20:22:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q/uKRJlT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7139910E8A6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:40 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-72b82c8230aso95669a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649360; x=1747254160; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RPj3FTwSrOy9EqQq/nrdWdKgDoZV00cUqzATiabesYI=;
 b=Q/uKRJlTpWfrJKCrxDRDEaul8QdvyH1CuKt0hMhIvjdusi2p6ThdvyVgD+XQ7lSjGg
 3QKsRg09kUrsBpzGbpVOj/ulVpSHVdlJt7bro5UNS+hkGK3jvdq5bCWxl6cG2v2RshjG
 h3hFnN5tdiOmrgiWnR9oDiiCI5DGWJASUu/LT/Hg9zMSvNBW96U02umt2onhCmcUXT3j
 vZp/19JhZ5melVtZFnk/uW7piTxlnBfbgAsgXxZFHGCxmHlJqPP/oNl/GIItsfEZU62g
 d+SHQi/ijH1VZcbMYnaKPaTmRmoY07cke7g3tOdzre80zg0lWMD/3aqcyJu/Gk/4RdcS
 QWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649360; x=1747254160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RPj3FTwSrOy9EqQq/nrdWdKgDoZV00cUqzATiabesYI=;
 b=ToCG04v1XOR2tVPSVHxkMEkskVZ9uczRO00eHT+XBWwV49GIjgLGujBQElrjqbooXC
 Yr8J3fSybsRlW9uGsEjyakugFUgwZOjkm4OxS5d/0Xxm8hdUrP6sehLVbdH31JTezsDA
 xKWiu+t9+B2BDe4693ieeL/hp6Ln/eWt0i/Fts3qpj27LFcsNXCwBvyokQkUTtt4y8Cv
 XFa8FOmlL4xlW6KowUYdqX85yCFcjGEabAyNCA6pG4eR2XfjsHOsOpWhnnH9ssW5ge9D
 fEaxaNtntYgkauAcQwVE54lOrUxrP/baU/wkqBLYT5V79jPWYNSIkyI+nn57eBfJxC5x
 Vq8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvLLVOtXAnq3Y4usiPU+bUh3W/G5ngoM+EkzLvbAVBBREG1uUUzLIbGt38bDuUi3exGW3iza+8Pa0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5PwLe2JRambrbCunhFJYIxPO1+1OpMkI/I7GhJE9moGS52vp5
 zzgtLPI0vMcV+e+WA61YRgFjfPOWwk+V4Iv24f3CLr+dstbO2MvnOuaVyw==
X-Gm-Gg: ASbGnct7Ikl7vCzQctUbuNLrK37XN56MQNT+njDeJPtwlCSKKmiX/siW5BtW5eMg9zB
 R63B/B/j6lwdbsfqcJ8AZt9Ra78mttnfy0o8unOI4ocNFL09QLbzYR0Jud/UT4RnscIwAP6VE0k
 IRkCNPV0Cp8sDtn6aYO7B+0YDk7MLIqnDeA2z87IyEL2IWihvuPn0prD1WuiEwqZZ1Cod4j03w1
 SlXVlnVy9RhfbTDM1xgt3OhQtd9/ckzAXE9twu7DuItBPqTL0ZhAuP3fjGjm9JLb1FnldeMLPP/
 YI5X78P6YAP08Q9eSvbpeHD5zz/kSaBSYaDgcQGdxTrIIqYzwqCHIS/N62DK
X-Google-Smtp-Source: AGHT+IEQwmN+1OPKx+ExT0H0gstwaIAT4meGGbZXVI6b4Kwtw9G6/+vEj9eQFHV8s+c0s/9Df/IAFQ==
X-Received: by 2002:a05:6830:6202:b0:72b:7cc8:422 with SMTP id
 46e09a7af769-73210b15634mr3494887a34.20.1746649359658; 
 Wed, 07 May 2025 13:22:39 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:39 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 16/24] dt-bindings: display: sun4i: Add compatible strings
 for H616 TCON TOP
Date: Wed,  7 May 2025 15:19:35 -0500
Message-ID: <20250507201943.330111-17-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add compatible string for allwinner,sun50i-h616-tcon-top with a
fallback string of allwinner,sun50i-h6-tcon-top.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 .../display/allwinner,sun8i-r40-tcon-top.yaml       | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
index 7d849c4095a3..80f1e49f5b7a 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-r40-tcon-top.yaml
@@ -39,10 +39,15 @@ properties:
     const: 1
 
   compatible:
-    enum:
-      - allwinner,sun8i-r40-tcon-top
-      - allwinner,sun20i-d1-tcon-top
-      - allwinner,sun50i-h6-tcon-top
+    oneOf:
+      - enum:
+          - allwinner,sun8i-r40-tcon-top
+          - allwinner,sun20i-d1-tcon-top
+          - allwinner,sun50i-h6-tcon-top
+      - items:
+          - enum:
+              - allwinner,sun50i-h616-tcon-top
+          - const: allwinner,sun50i-h6-tcon-top
 
   reg:
     maxItems: 1
-- 
2.43.0

