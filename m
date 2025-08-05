Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E010FB1AF34
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 09:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC98210E5E9;
	Tue,  5 Aug 2025 07:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WtPBgU2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9862310E07A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 05:40:17 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-76c18568e5eso933920b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Aug 2025 22:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754372417; x=1754977217; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
 b=WtPBgU2DGC26YSnfM8oclrmaw0RnK89u7wp/zNRnHpv7UkSgUJycRfES6fVcLbyGQE
 1YWvOLxZjI3r3qGClRxFIrvnN5Gm5mgAA39npXfmcVZa3cGiLLA2qKdORzyGLwIEiQEF
 9ToDTVIuRXn1HFNkUQJbKePRxd6IsN8M3+hsWu/i9fiA2M6uFYQ71T2FG/fNQAOaY/eD
 B3Ye39TfItXSiXgPRtTAzxHcnqtu3Y5qcqp0Ug5Frsdqsxd+pFj/aI/Kt+fRsajZbLRV
 zKNI/CbJQZwiY82/8tQ0FiHnIU+XgAhzGqlFQ7JFoT2ixo3BMgStRM2QpLHiMvlPRpDs
 xyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754372417; x=1754977217;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MU8Gw8tbO6qz4iZSksnsNZa290457GeKEn/IZPBnLlA=;
 b=wtynsiIkqCQdmjPg03w7ewHzFhMGcDWRHm3jq3G1CXxN1YxyEoFZX3aqN3/63DQHOd
 dIyyqOKFDBVsOy11ZiCSEMAR/uc90oZuM65BPLBPM4fUzDSg3QWw0Vwj8ygi2A1x9jtc
 SdkigL5+5kFAq/72BAU1zL0N8uhLdRTXb/0aJpMzGU+vxnXc448dnWdF46xyZfsA4fKX
 tTGlJigFtECJnHPNlwHdf5oicIFSo2t9leSE14VDYue0NFkic+5U1NmaUSIT02vemydK
 o9N0xfigKu85fjeuSVqpUxAezsk2JnL+evpPIL23krlFFBf5+vCUVMahUzvE/B6FAUt+
 4wEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbFAUz1PMD5Pn/J/4D7HNNrJCry/NVyJd2CyHP9Ay5O1ne2323dbzd+oO9nIsqZT7BXn/eQcpp2ko=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/A2huidF8hVgoyd49sPxzaGgvQUWyqhdJ7ZyxULFclZU99tce
 lobeA/6O8GY9rBCHmj+QHW4TOhEAajnSRyoN1uCQ3g1bRdHr3LFAV0AHLwrqSx0C
X-Gm-Gg: ASbGncsZ2LbrNknTS2Ut4TgsmKHOTq5FhJCk4ae90J3cBQ7qORYP7RKbuGyDeiEp02Q
 oyR8cvzmL/E91RReCACsjRC9256/2SIjwNCxaiVlttD3kPjv4+3BVhnvFxAFM6iuOOzPQlUV2ar
 FlCqkkdOSQPpj/2Kv9DX4/rUDLrqQh0wrRTp4wQuLPeCQbTv5Yn6wx80lse8wuWWVHQisZZVrgR
 NljBL7ewbG2/37OACHhdPJ6p/RkpLwpWcKf2xjatT1EoaZkK8pqfvNozcM3KP2skpBHk2iCnFUM
 MzWuT2XT3IhtYMSo/aKsOXQhZE7KGYbdQp+PTEWOMzwCeAVs/O9WGoIQ/tw6qJc3FDcbGN7XPtm
 SZKbKUizGAs85iMD4OEwSAhm3gy15gvnIDwqzEZJuTqNhvng+NX0=
X-Google-Smtp-Source: AGHT+IHJ2ev1hiIkqi0lPscUTwNlW4BdK3wS4xNZ6yu04JmyuXeO5mFIaRVVIoYvXA8EgyS74TWiCQ==
X-Received: by 2002:a05:6a00:23d5:b0:749:b41:2976 with SMTP id
 d2e1a72fcca58-76bec2f1c1amr15959786b3a.3.1754372416945; 
 Mon, 04 Aug 2025 22:40:16 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce89125sm11990006b3a.33.2025.08.04.22.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 22:40:16 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 05 Aug 2025 13:40:06 +0800
Subject: [PATCH v4 2/3] dt-bindings: display: Add Mayqueen Pixpaper e-ink panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250805-drm-v4-2-94eaec01598d@gmail.com>
References: <20250805-drm-v4-0-94eaec01598d@gmail.com>
In-Reply-To: <20250805-drm-v4-0-94eaec01598d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754372406; l=2161;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=P5/2XPz98ClkoAoXRMzbxKUyEvZuY8O/vm7ocp5NTgI=;
 b=bydnScpLvOmaxiT2z0GD7P/I1czPiTf65vXBRiX2YCmAZ026JcJNevRr5dNNqMRRWb/dkQLRE
 JY1RBhze6dlBboi1J1gLqya4L1GFxXDZ1TrokUHubQdKfyG28mB9Rfg
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Tue, 05 Aug 2025 07:11:30 +0000
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

