Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CC8D4730
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 10:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D469A10F82E;
	Thu, 30 May 2024 08:35:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JpiGC82A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5936410E099
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 08:35:31 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1f480624d04so5933915ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1717058131; x=1717662931;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xwThRWWm7RGJSY39HVyy4ljf9OK8/1xd1SRHdwBmpo=;
 b=JpiGC82A0o2Q2QnDopcVhSOxV5FsRqodUkFZQOC76QVLROPalLJkmi9xetqJ9FfBT4
 uRiYV3NRVxTDYehG9i/iY/ZqLj/GuhBjWnF464QBUslxhRHv9KUqKFua1B2GG36q/uy+
 bFu2eXA8CCc2lX8OmRx4kEPtLNoMWFUpkhV8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717058131; x=1717662931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xwThRWWm7RGJSY39HVyy4ljf9OK8/1xd1SRHdwBmpo=;
 b=Ss+66ndHwk6ELiOIVMg+oF1lDGleseWKIWcnlyokHWMQQar96VxY1PRD1+n2Fhit6R
 Gq90RpORFyiBGyYxGD8VPS7HHo6jiii6opbLsvuozDAZJOTf4rton6Aywm8vakiu0jfm
 ghHbJXdFLKdYhrV+10CKt/n+hn2gGfXuoifFMulcl2oNTcp3IpiDaI7F+BhMGXoRvsnq
 BFLZYJw2m4C2C6r43TQAqqClXQcvjB9qSnsdINCfEnQiwdfgyFZSi61iKLB0Eo+qtXVR
 NiDXdQZ+FfK1Www5RPxMcBBiK1d9W7LBuNnW/8Nu1ivde1wYsCfxCpOX4JumqAUBb7QS
 k8Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkRpcwoNgv4Kn41xeNiea6ChrzZOP0VTRFEeVqCEmumRbRiXEJNi/DDDtfZSCeWdGZyzifkLqtEy+PjOV9hZKYlFXKuQd1ceUgm1I6XCJW
X-Gm-Message-State: AOJu0YzmqmwDaRDKwEznm8PHJgG7BWL4TMcTXL6CJlhm4kolzr+6tNNE
 HG9I/hdG65sQ7ydwYu3XMOtcTzGECPuaozCPxjqzw80PB8MbEMu0ws9mdW3lyw==
X-Google-Smtp-Source: AGHT+IEp028TMUUWRl/RXoMRYp1icLkfUsk+YnlWATTbz/4qqOD7Tx9V/9ogbJ57638g/PX+8PWjow==
X-Received: by 2002:a17:902:c409:b0:1f5:e796:f26a with SMTP id
 d9443c01a7336-1f6193f2c1cmr16752955ad.5.1717058130799; 
 Thu, 30 May 2024 01:35:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 01:35:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173 GPU
Date: Thu, 30 May 2024 16:35:02 +0800
Message-ID: <20240530083513.4135052-4-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
of the Series6XT GPUs, another sub-family of the Rogue family.

This was part of the very first few versions of the PowerVR submission,
but was later dropped. The compatible string has been updated to follow
the new naming scheme adopted for the AXE series.

In a previous iteration of the PowerVR binding submission [1], the
number of clocks required for the 6XT family was mentioned to be
always 3. This is also reflected here.

[1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c79c2a.camel@imgtec.com/

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 256e252f8087..48aa205b66b4 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -12,10 +12,17 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - ti,am62-gpu
-      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8173-gpu
+          # PowerVR 6XT GPU model/revision is fully discoverable
+          - const: img,powervr-6xt
+      - items:
+          - enum:
+              - ti,am62-gpu
+          # IMG AXE GPU model/revision is fully discoverable
+          - const: img,img-axe
 
   reg:
     maxItems: 1
@@ -56,6 +63,15 @@ allOf:
       properties:
         clocks:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: img,powervr-6xt
+    then:
+      properties:
+        clocks:
+          minItems: 3
 
 examples:
   - |
-- 
2.45.1.288.g0e0cd299f1-goog

