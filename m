Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E89B496A441
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 18:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E88010E5EA;
	Tue,  3 Sep 2024 16:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="adaokEvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 049E910E5E8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 16:27:41 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-205909afad3so16485105ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 09:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725380860; x=1725985660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ViZ2Qk+Vtw2VzGYfDD4Bo4v3B7DoDiJQtKRYgmWotpA=;
 b=adaokEvB0ElKAJJGnyXorm+ZISzSWEJKAW2u3Bg+fWhTy6+tUWKfUM053qlN6Bg6yg
 5Oq3tysdCwlxZJjFhHtLaS0x6YWrZnx77/XsGaHsqWy6SBNYELp+VWNjgEbllMWohAoE
 eYl2tROzg2Ivw9VUXdQQHW6FLEZC1QZkMn9D/wprMBC+H4o8XW9okUMBtexx6TL6WfFg
 xB2vdbsCnxJh/qoqMaU/ro5WAKH7d8AQciXwDd4PBsJsmTB3cJQ+J4ft+VsDhiDTnLWo
 I8wZ1MNluMtIn6xsmcb1cvvXO+JSKHOvNiSQjL1yaLMkEQuHEmBGxhulkGwVXeCybzch
 xjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725380860; x=1725985660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ViZ2Qk+Vtw2VzGYfDD4Bo4v3B7DoDiJQtKRYgmWotpA=;
 b=aLzeUIOlRoJbeJBfv8MiQ01nMG42WikEmuKvppqpmnCDcLc0WSP8ToQT8f13VRlHCD
 JbHVIxqii2VkOYK7W1GB1hQmPe+E5l8UJek3bzCt78r8N7VMssR3WMbS79hUVWvOsYxe
 nQonIKrDwAEbQLWNo+ELElau4/yR3eV9hzH2yNz4wxq44HyB974CAU/a1e5cIIUTLWq+
 5wApSttkGWZr6pF/kV4eFDfnJ9r9rcgKyf7ParlVgOWMqWky3+i0hky7NXdJAau5LbY4
 sbTtNVjMbzAkQuIH+MQbSpP8yPCQNtIstQcbZNRZIrE3SuHHG3Ku6I1TkVHdNXT4k/bj
 +Jtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULb1xjlRlXsUbc8nNAyUqwry1cWnp6iLKSeDNooNFEWmNWXcZUiuVaaYUZBPWXYIj/q0M3DQd9aSM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaJtWFEv4iR8uGKyVyupMyqmMYDalTTD1TRaJAXmba6Jyc9Ypi
 Dcy+Da0OVr23wZ57EF957Z2MgYnV/ul6TU6iPXq3sDkKvrLE24xM
X-Google-Smtp-Source: AGHT+IFWoAsi71mQ5SIl33bBxgwV2NfZspH9Nu1mtON226BSC45BsRnCT2jmiAIN44wzjafp79E0Zw==
X-Received: by 2002:a17:902:d48a:b0:205:968b:31ab with SMTP id
 d9443c01a7336-205968b34cbmr33233955ad.58.1725380860399; 
 Tue, 03 Sep 2024 09:27:40 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ec5f:2356:2bac:7d11])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-206aea37cc2sm466115ad.160.2024.09.03.09.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 09:27:39 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: mripard@kernel.org
Cc: marex@denx.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: lcdif: Document the dmas/dma-names properties
Date: Tue,  3 Sep 2024 13:27:29 -0300
Message-Id: <20240903162729.1151134-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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

From: Fabio Estevam <festevam@denx.de>

i.MX28 has an RX DMA channel associated with the LCDIF controller.

Document the 'dmas' and 'dma-names' properties to fix the following
dt-schema warnings:

lcdif@80030000: 'dma-names', 'dmas' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../bindings/display/fsl,lcdif.yaml           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 0681fc49aa1b..dd462abd61f8 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -50,6 +50,14 @@ properties:
       - const: disp_axi
     minItems: 1
 
+  dmas:
+    items:
+      - description: DMA specifier for the RX DMA channel.
+
+  dma-names:
+    items:
+      - const: rx
+
   interrupts:
     items:
       - description: LCDIF DMA interrupt
@@ -156,6 +164,17 @@ allOf:
         interrupts:
           maxItems: 1
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - fsl,imx28-lcdif
+    then:
+      properties:
+        dmas: false
+        dma-names: false
 examples:
   - |
     #include <dt-bindings/clock/imx6sx-clock.h>
-- 
2.34.1

