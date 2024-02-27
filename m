Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448788687E1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 04:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0F910F2B3;
	Tue, 27 Feb 2024 03:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dbFvYQ/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0E010F2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 03:46:00 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-7bf7e37dc60so218721439f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 19:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709005558; x=1709610358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucD/+p4K6+j2ZE6i/N6HFdJPDZilTnGBi4Fcog1oUsI=;
 b=dbFvYQ/r1zuZv7sOrkn5Fe4o0e7CdlcmMqMQ8/9pRPy1buyuD78BOM6tZN86XX8/dA
 Ic50o870z1GcFNy0yRGd7qMdpItpr5wgP9lm9zUgabxVpA2Xsjual2OzDj5FrtALVMEU
 qWktCehcuQd9y9jTLJupDaTt30bzLFq90Sih675SnJJ7iSVrwSqeg3GGur6uQn/r2hxP
 u3VdQpFYoFHTVQevchU7it7g6YEYfszdXIKGsRzhUH/suOTL1xNDIfdhm63kBdB9SfP7
 tWkeH97EYxubkdt0hifQ1ngez6US5LqWWls4QvVN2Cul1pxMcI2FsKgWpReEGl8RFxUV
 YM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709005558; x=1709610358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucD/+p4K6+j2ZE6i/N6HFdJPDZilTnGBi4Fcog1oUsI=;
 b=kgAN3GwkxNYwsI+fPOQ5B9rvezrV5z/3X2SZ97+wZmlQJv3pLg8tkwYP99FAU3ddMq
 gsF+b8Haaat/TXZ5xloIi/RGlDWd8258HeFVtz8meLRklM1AiwGc+l+ZlBcI3Ia02M9C
 CkZ/rw5wwnVrkeB33K3z4Pjsl01k7KWewXGh32zEgakPAQsu7rvinK9IHHBCPuSYCks8
 k1leAc0e7NFMTvrByOEEJEhdJz7rPk1yrONWQPoDUhhjPRRh8G64K6/DB7/l4qJ8dHl3
 Mi9rRGycgkTlxjZLU1fxvE07gxuPtV6mu0Pn/mdo1nHkUsVj3IsRb4xx9tGTQam4pBrR
 PbLA==
X-Gm-Message-State: AOJu0YxznccLxZHbhYTZfu8dx+PL12Z7Bp5zV1T8bjpbhqmEaeu0+L2N
 cL8t9bTCCohsp9E1M8DvFNyz9uSMPtCnulNSCRuTa3/ywNCDJHORQkJf6S2TYCWySICp
X-Google-Smtp-Source: AGHT+IEEX+eGY8wwb+gRh5Rwva/dPaMluotD4yi0XNwRuMV8qyLsDXz+GtY5HhmQ4McOBOW+ph9nRg==
X-Received: by 2002:a92:c8c4:0:b0:365:16cd:66 with SMTP id
 c4-20020a92c8c4000000b0036516cd0066mr9677139ilq.31.1709005558600; 
 Mon, 26 Feb 2024 19:45:58 -0800 (PST)
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:1712:c48b:aaa0:cd8b])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a92ad04000000b00362b4d251a5sm1891566ilh.25.2024.02.26.19.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 19:45:58 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Cc: aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: gpu: powervr-rogue: Add PowerVR support for
 some Renesas GPUs
Date: Mon, 26 Feb 2024 21:45:31 -0600
Message-ID: <20240227034539.193573-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227034539.193573-1-aford173@gmail.com>
References: <20240227034539.193573-1-aford173@gmail.com>
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

Update the binding to add support for various Renesas SoC's with PowerVR
Rogue GX6250 and GX6650 GPUs.  These devices only need one clock, so update
the table to indicate such like what was done for the ti,am62-gpu.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087..7c75104df09f 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -14,6 +14,11 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r8a774a1-gpu
+          - renesas,r8a774e1-gpu
+          - renesas,r8a77951-gpu
+          - renesas,r8a77960-gpu
+          - renesas,r8a77961-gpu
           - ti,am62-gpu
       - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
 
@@ -51,7 +56,13 @@ allOf:
       properties:
         compatible:
           contains:
-            const: ti,am62-gpu
+            enum:
+              - ti,am62-gpu
+              - renesas,r8a774a1-gpu
+              - renesas,r8a774e1-gpu
+              - renesas,r8a77951-gpu
+              - renesas,r8a77960-gpu
+              - renesas,r8a77961-gpu
     then:
       properties:
         clocks:
-- 
2.43.0

