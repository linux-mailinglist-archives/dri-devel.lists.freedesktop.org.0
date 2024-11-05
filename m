Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6989BC4F1
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 06:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8112010E512;
	Tue,  5 Nov 2024 05:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="acADbzKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE86310E514
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 05:54:03 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7ea16c7759cso2632973a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 21:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730786043; x=1731390843; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aVpANjYVnSdNgI8t8ZHWxaEPt2RisjdkbcnHwj4iqRU=;
 b=acADbzKLSdKwXd+FJAhAe1JdIr+Zfwr20DGQ6ZRE+0DyB1ZEaJ/Rj40KrnnpY03cQE
 PdCy65ugp0lkkVFwGDTh5OPJIT0EeOHsF+Em5FGql6E6uKsCnFZ2G8K20Gq3ANCTWK7x
 JFBPlUegnpt5rvuM1nQRZSgCjXOcCG0JaiVlAkhZeDs13KhsS7f06v46QoTmyZ+I0sz0
 MHfH5EpWsS2BUAOBzcspSIAeQgkkFxzUPtCchq13WXb7Het2kU+2eg5ew4DFormFsbKH
 IN4FkWc63VJAy+Y8i6ooACSEaLyV3liePp6l2IrWCnnfNbDf98HikWqxJjIqCrTPneif
 j8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730786043; x=1731390843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aVpANjYVnSdNgI8t8ZHWxaEPt2RisjdkbcnHwj4iqRU=;
 b=p6ciDLw7cQmqTHMKBcPl0ByRHIdNlOVPsNWSi6TTBb8TeDkn3dbD3VW11Zo6fj9628
 I5nEfA8e/KHhgktBjifAZ5QX2JAA2gPt72XUh3uQ54nvhzuFjDGarn+KibWGgjClldmB
 cdJJ+eETurs+RZbVsClJzbdufjrMheDcN2sP33l3cHsvC0X8Jhrftp5UvfFgsEIs4myQ
 SQQ6tcegaEJJZHCEbj9E2KmKPCnL3laoWgRfOAav+v/ORe5UkC3pj1uI7u0Hn4KT6DYT
 csdWWlzW+3tk7kK/Zfv3SNF+EuaOv6whosqks4NiUnyr+5C9TsATTasDjwE/9DcTc/fd
 ktew==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2AUTdI5zI2uL5RPf8bVWz6loJozVjiQXc42bXu18N9afzL6AD6DRcfG1QD4Hq0aeib9S9nkjXeIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCcsyl6GJX4w6Z5q4R8J0c+JT7iTneVb7OWw+dVlG1GsQHYJUh
 EL9nEjtDwQeZWMvZ3UL2uekEW6kaVJd++3RGjkCsmMbzj04dXpo+
X-Google-Smtp-Source: AGHT+IGlkn1erL5hAYmFs9VsSoSvV0kmc2vM4CscfaA71QZ6w2n5YnE0MGNy6DaE1gWYMRXpRMFvvw==
X-Received: by 2002:a17:90b:5249:b0:2e2:cd2f:b919 with SMTP id
 98e67ed59e1d1-2e93c1e4763mr24635881a91.28.1730786043077; 
 Mon, 04 Nov 2024 21:54:03 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa4570fsm10952198a91.30.2024.11.04.21.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 21:54:02 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ryan Walklin <ryan@testtoast.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: display: panel: Rename rg35xx-plus-panel
 back to WL-355608-A8
Date: Tue,  5 Nov 2024 14:52:29 +0900
Message-ID: <20241105055239.1577275-2-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105055239.1577275-1-kikuchan98@gmail.com>
References: <20241105055239.1577275-1-kikuchan98@gmail.com>
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

A panel assembly is changed in the recent revision of Anbernic RG35XX
Plus, so the `anbernic,rg35xx-plus-panel` identifier is neither suitable
nor unique for the panel anymore.

Fortunately, the panel can be distinguished by a label printed on the
FPC cable, so use the label "WL-355608-A8" as an identifier instead.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 ...rg35xx-plus-panel.yaml => anbernic,wl-355608-a8.yaml} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/display/panel/{anbernic,rg35xx-plus-panel.yaml => anbernic,wl-355608-a8.yaml} (83%)

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-panel.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-a8.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-panel.yaml
rename to Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-a8.yaml
index 1d67492ebd3..5e8afbea690 100644
--- a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-plus-panel.yaml
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-a8.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/panel/anbernic,rg35xx-plus-panel.yaml#
+$id: http://devicetree.org/schemas/display/panel/anbernic,wl-355608-a8.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Anbernic RG35XX series (WL-355608-A8) 3.5" 640x480 24-bit IPS LCD panel
@@ -16,13 +16,14 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: anbernic,rg35xx-plus-panel
+      - const: anbernic,wl-355608-a8
       - items:
           - enum:
               - anbernic,rg35xx-2024-panel
               - anbernic,rg35xx-h-panel
               - anbernic,rg35xx-sp-panel
-          - const: anbernic,rg35xx-plus-panel
+              - anbernic,rg35xx-plus-panel
+          - const: anbernic,wl-355608-a8
 
   reg:
     maxItems: 1
@@ -47,7 +48,7 @@ examples:
         #size-cells = <0>;
 
         panel@0 {
-            compatible = "anbernic,rg35xx-plus-panel";
+            compatible = "anbernic,wl-355608-a8";
             reg = <0>;
 
             spi-3wire;
-- 
2.47.0

