Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC3C9BC4F5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 06:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB8B10E515;
	Tue,  5 Nov 2024 05:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hr6VyPUf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8130210E515
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 05:54:15 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-20c693b68f5so53775165ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 21:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730786055; x=1731390855; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0RSTrj12MA3LSstUjcR2m39zO9Sz//eaW6qPmLd2lLs=;
 b=hr6VyPUfC0609VC+cHPF05fkqgowHRVXc0MkjXcP/UVkKxljPWs7zSFWW1mIDnaYBa
 uk3aM2ULM3iQdQViDxMoDQ2xSSdC0UglIKSzDX1SZFJut2W8XiixL1o2oo1nCiu9DumW
 tNeaXvqr0NyzW/hkHyz5K0kpJQl+D0tTeT7PR4EvYgl/xIPgCR3EmqmNQ61A/6sLXLWg
 wgBolxw6CF/AVWjhaALoMyZw2vtvGJvHEXWJxuDM4U3g/Bnf/42PFVvZPS8DPomQEybI
 /O3/XX08lqv5hByIb7kcoi7qhcmuJ/FCIcSqLhMrxH0e0JbYxEPu0ODqfBhyRDnjMSpl
 uerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730786055; x=1731390855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RSTrj12MA3LSstUjcR2m39zO9Sz//eaW6qPmLd2lLs=;
 b=j0AA2CAyZARcjH0HBOHfBa8W8q0Z0ucoRkHjMUnbrOMPjmFQ+x1W3O4CnmRnCYbIOt
 gcu8/mJGmCU/0AdldfnCPSgX04dcnA7Bnkk7APCe2pb6QezOYEoVaa033yZ4XoaLDrde
 flmdBgTagIZmJR6e2ZMEbFIWsiI3ow9aJo0Z0UxCVZCPRH/P8mu1C41LxR6CNxZMtsKI
 bmOuNBkH5fvLsjLWX0lDgbrMk9v79s5TYje24egMnJT8mbZDixlbZ4gSCJW9x56zgaAV
 ZbbcWFCVznuKvnRl7BQDIXVlyKHs7j8wx+SteVQlmE6TyudFwXrlnAf7BA8C7pqh9WJK
 uk1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1FbVU4CTbnFqh7S2gwCwSpt2fGKEoYykducMRckhY0SFGZmf1d7Z2OnQioItX4cHmMKy/cNosFTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp9m5SGIvTuQH5z/C0oxz0An580M3v0bEf6v3IFsQ496wH1sxA
 vbDbBEl18u/Wikhuu3Li2oQvi1nAmFLqnBMYsXbqM7G6DYpT4yHS
X-Google-Smtp-Source: AGHT+IEE2+nq4RnyVrBeTE2rxTbFZpVouLNCIaYjjV2OesMo31jPbvWxV0chgkw6q6ii3tICw0cvgQ==
X-Received: by 2002:a17:90b:5242:b0:2e2:d879:7cfc with SMTP id
 98e67ed59e1d1-2e93c1a6337mr24526678a91.21.1730786054947; 
 Mon, 04 Nov 2024 21:54:14 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa4570fsm10952198a91.30.2024.11.04.21.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 21:54:14 -0800 (PST)
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
Subject: [PATCH 4/7] dt-bindings: display: panel: Add YLM-LBV0345001H-V2 panel
Date: Tue,  5 Nov 2024 14:52:32 +0900
Message-ID: <20241105055239.1577275-5-kikuchan98@gmail.com>
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

The YLM-LBV0345001H-V2 panel is a display panel used in the recent
revision of Anbernic RG35XX Plus, a handheld gaming device from Anbernic.
It is 3.45 inches in size (diagonally) with a resolution of 640x480.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../panel/anbernic,ylm-lbv0345001h-v2.yaml    | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0345001h-v2.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0345001h-v2.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0345001h-v2.yaml
new file mode 100644
index 00000000000..ae00096bf3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0345001h-v2.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anbernic,ylm-lbv0345001h-v2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anbernic RG35XX series (YLM-LBV0345001H-V2) 3.45" 640x480 24-bit IPS LCD panel
+
+maintainers:
+  - Hironori KIKUCHI <kikuchan98@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: anbernic,ylm-lbv0345001h-v2
+      - items:
+          - enum:
+              - anbernic,rg35xx-2024-panel
+              - anbernic,rg35xx-h-panel
+              - anbernic,rg35xx-sp-panel
+              - anbernic,rg35xx-plus-panel
+          - const: anbernic,ylm-lbv0345001h-v2
+
+  reg:
+    maxItems: 1
+
+  spi-3wire: true
+
+required:
+  - compatible
+  - reg
+  - port
+  - power-supply
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "anbernic,ylm-lbv0345001h-v2";
+            reg = <0>;
+
+            spi-3wire;
+            spi-max-frequency = <3125000>;
+
+            reset-gpios = <&pio 8 14 GPIO_ACTIVE_LOW>; // PI14
+
+            backlight = <&backlight>;
+            power-supply = <&reg_lcd>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&tcon_lcd0_out_lcd>;
+                };
+            };
+        };
+    };
-- 
2.47.0

