Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1B29BC4F9
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 06:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7902C10E518;
	Tue,  5 Nov 2024 05:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZbTAsleG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AFE10E518
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 05:54:23 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2e2e2d09decso4436941a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 21:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730786063; x=1731390863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hu3iWX+PIdxCmyj98z3UhWO9EwBSIx2b0bruUc7U5YE=;
 b=ZbTAsleGQiyMaTR3DuT9gdHxBkYcLhGYU+AVhfUNt50z71w8zAEzOLJo3BX8VAew46
 SRXorC3/OvkgV7nby15U6Qdn1XQ1+6oZCg3h6+SDQMh2Mp71LAyiGVsqOi9bzTxMexFl
 JrnsAFMs9s60wBUgcA8JL9UQ4wQMNZdurj4XpkjJJNW0LQeewLh/LETAKZUBJxy0FKfv
 VnNpahhf1kcD7nhHfIQxOR26NHQPLen8noBI4LmlL69KVR9GMmoW9U+Gyt1kNhqOOu0B
 UiC2bmvLdauqd75aBig9BBFUUC09r2UYVIkXQYjJ+vZvK/RPGD76g/pB4oPKj5FSgvk6
 yQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730786063; x=1731390863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hu3iWX+PIdxCmyj98z3UhWO9EwBSIx2b0bruUc7U5YE=;
 b=kDtqzktYzKlo8ALL+gTepvGOqv5fea919PCp1OrUwMYHbWIWmUpRjYeMLsK4LMA6oI
 cCKLTeh4q9Mk7hmnH9hWwpv4R/l4yBDW8FE+q4KQWowbzFcGg0PB5ayyIbCzVVffSCQ4
 gaupVaVryi3PgM8NzBrzXrw6qUfP5DJflfbJJATZWoVd3cUU19PS+JgFO00wy1WYzxZw
 BHa8IR/SYRk7rAdA2L7hnYlRwhS85Zd5NM9iQZ7gedLmL3KYUdyH+0mAZdORlxK0xnn4
 ciZNwMrF3ZgXrbzeYg2dcdNFot1JfV2ZlISLqesJJHQytpSrdh3w7iILJ3YIL7ocdzxw
 jt8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq5ec3Rd9aMP8vKI9wEquMyWtJuHvjqoEbCbSVPjAnSJPRxWAdPvpxXBfbMo3I7yx+idTclsxmtzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxt5qWWx6wXGpf9Kw5ZFRxrbr//riFZvvuy0fzogO+I1pTczONi
 ffiJoutyorEUqJw+q+KVwyZ0Xj0hYNHJNKA/h0YAvo202NsBGhNT
X-Google-Smtp-Source: AGHT+IGfCrkf0dN1Ln9SRnU0x+KVoSzW11pkwrRaxrJSTLgEAs+ITuPRBxd3yW0Msiz23lQ8nisieQ==
X-Received: by 2002:a17:90b:4d0d:b0:2e9:3056:71dd with SMTP id
 98e67ed59e1d1-2e94bce054fmr22580242a91.7.1730786062957; 
 Mon, 04 Nov 2024 21:54:22 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa4570fsm10952198a91.30.2024.11.04.21.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 21:54:22 -0800 (PST)
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
Subject: [PATCH 6/7] dt-bindings: display: panel: Add YLM-LBV0400001X-V1 panel
Date: Tue,  5 Nov 2024 14:52:34 +0900
Message-ID: <20241105055239.1577275-7-kikuchan98@gmail.com>
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

The YLM-LBV0400001X-V1 panel is a display panel used in the Anbernic
RG40XX series (H and V), a handheld gaming device from Anbernic. It is
4.00 inches in size (diagonally) with a resolution of 640x480.

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 .../panel/anbernic,ylm-lbv0400001x-v1.yaml    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0400001x-v1.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0400001x-v1.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0400001x-v1.yaml
new file mode 100644
index 00000000000..68e1a705469
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,ylm-lbv0400001x-v1.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/anbernic,ylm-lbv0400001x-v1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Anbernic RG40XX H/V (YLM-LBV0400001X-V1) 4.00" 640x480 24-bit IPS LCD panel
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
+      - const: anbernic,ylm-lbv0400001x-v1
+      - items:
+          - enum:
+              - anbernic,rg40xx-panel
+          - const: anbernic,ylm-lbv0400001x-v1
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
+            compatible = "anbernic,ylm-lbv0400001x-v1";
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

