Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBCCB0BF50
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 10:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E47C10E4A0;
	Mon, 21 Jul 2025 08:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yk+nWQL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB1E10E248
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 03:01:16 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-235ef62066eso45182125ad.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 20:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753066876; x=1753671676; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
 b=Yk+nWQL1XgHksFrursBCglaoI/T89TyOCovPhxpGmsg9PI1FUP7YZcc3mewExyyVRG
 fHvRqfp/ouWOacQ/tIILVSjINnxHP4TDRR4VMX9paaCuc0WwCuxL/J4pbSGXL0qC/+5K
 PhoT0LyrcHwAjuA5zMFVTruYxSfw0h6FNNeDXjQFA7PBAocuhqZVLzeHmvLxEzlaJ3AM
 yL49L3IpqlGYQFlLcVA9PoecFgSz6Ye/DAT86o9YIvD+sJiqVR/9RJYSC19fLdJyW/L0
 a4hjRoIbXHX/EzelIbmqGPEonX780UO/3oapm42lp2glsQF1Wc3AEXzJOUIxlO3W0nE+
 QtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753066876; x=1753671676;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
 b=qkOC4SQnjccJNYhFMZYuvJu6ikiGfDUBGqSlpAh2zfiNSC9ovntVoFou6JTeQG8s/G
 mM+TRBWo4WneMSx8aJxMiSg+qYPMj0ePSd5ZI/OJnLogDf/2p5brLrleYQOjPZcf5XFt
 K1Wgxzu9Q2ov2F4cRHwWinwNsLRHY95mPLr7+3/EKDB8TY154vfKKdJHIvmID8OuG1Gf
 +3j11XSXagvw6byZfoCSCLPlcQUpRUPdjlVKLRLnFY5wbsXA3A3MaLJBTaEWb/UJt2BI
 BhS0QafI8zN0nJBulFz4uiRlpeH/CuF/n+xZJlF65nVsdkOHBFIaGg504lSD6wpuW3a+
 GDDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGugfeW/uqF9vsjaWv5jlJxphddlHy6thJYS2jz7D76e2wPQzdmRjn5LATF1CcvIuHdDYvBlv/pF8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+RtCUhA1ps6b/AyJ+2NSOurMxW7bGTS6h4C2bIh90sOiWauwc
 poJOib7nF4LXKKAdi1KZM7k5bCSJrUO3EUW8n50JicPQIQjFijy9wLr7
X-Gm-Gg: ASbGncuPKIaW62l/fFCHqPH/rtl1IIx4lJrFSlPO6xNbDqzrPcExezAdUn9tA/8SStc
 9WuijrCQ0sVm1Ky3jWBlWpVgQIr4mGG7vweQOxLN+0MDy8RVbkGCVzzk7NMs/P//Ski0Yj9gwFi
 nNvbM62Ms5tsA7kXH9+FGkmZXCM7nqXUwlUJHM684cWYz8BCX8OU9Dyg7qBLgvE2Iz4YF5LAL8p
 YxRk9VdHnCMOufcE/h1en8eDPs7oMiT09msBwMQgzcNCGc3+MGAGKTX2NYDdN2DDl5fG/O5+8Yf
 vfCxYzCyl8HlwYpJg4k7CGOsoyC5KuVPQPCcvfxQqjg1Y9SJpq4ZRmTppQudL9GDz2C41DkuQO3
 WxN5v6BZUw37yicPo2x1/2GEr99Z6wUJ52VIwr/Ffgwl7dVcAuWU=
X-Google-Smtp-Source: AGHT+IFP/N6z1VIii8Bp2Fa16eo13Y1LJqN122XUWAoeHZN2w85YjM8rCk1T3sf8CFfVOtmk8beZ4Q==
X-Received: by 2002:a17:903:2f0d:b0:235:e9fe:83c0 with SMTP id
 d9443c01a7336-23e30338918mr211612585ad.27.1753066875644; 
 Sun, 20 Jul 2025 20:01:15 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6cfdbdsm48264795ad.150.2025.07.20.20.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 20:01:15 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Mon, 21 Jul 2025 11:00:48 +0800
Subject: [PATCH v3 2/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-drm-v3-2-e16c3cee7263@gmail.com>
References: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
In-Reply-To: <20250721-drm-v3-0-e16c3cee7263@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753066865; l=2161;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=P5/2XPz98ClkoAoXRMzbxKUyEvZuY8O/vm7ocp5NTgI=;
 b=ouZIEOXAZDz+gDkQdTxx/tKs6+3niY3xZuVKtci609CE7URJ59icO+k/+UP37nLGjQUkfRRj1
 RSqSRsyHgAdBsQBzcDc/NUw9oVrR5L4niFLA7WwZdoiuW/B65NuXf8P
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Mon, 21 Jul 2025 08:45:46 +0000
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

The binding is for the Mayqueen Pixpaper e-ink display panel,
controlled via an SPI interface.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/display/mayqueen,pixpaper.yaml        | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cd27f8ba5ae1d94660818525b5fa71db98c8acb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mayqueen,pixpaper.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mayqueen Pixpaper e-ink display panel
+
+maintainers:
+  - LiangCheng Wang <zaq14760@gmail.com>
+
+description:
+  The Pixpaper is an e-ink display panel controlled via an SPI interface.
+  The panel has a resolution of 122x250 pixels and requires GPIO pins for
+  reset, busy, and data/command control.
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: mayqueen,pixpaper
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 1000000
+    default: 1000000
+
+  reset-gpios:
+    maxItems: 1
+
+  busy-gpios:
+    maxItems: 1
+
+  dc-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - busy-gpios
+  - dc-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        display@0 {
+            compatible = "mayqueen,pixpaper";
+            reg = <0>;
+            spi-max-frequency = <1000000>;
+            reset-gpios = <&gpio1 17 GPIO_ACTIVE_HIGH>;
+            busy-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+            dc-gpios = <&gpio1 19 GPIO_ACTIVE_HIGH>;
+        };
+    };

-- 
2.34.1

