Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 524DBBBED88
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 19:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9A810E352;
	Mon,  6 Oct 2025 17:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m/4UrNwT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AAC10E0FE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 17:49:12 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-46e4ad36541so57774145e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759772950; x=1760377750; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=duPio0RPtDjdOCnFYeiJ23Ow5gw9QiPbk3qi6TQ0F40=;
 b=m/4UrNwTas79AitCJ3gm+gQU+FjbVks54Rm0GPIKSbj/oX1WrLYROqx1fH/WFzFaE1
 yuqbhVyNiEaIgZiLItXGvxtOQa8V00YQ6oykI720dk0cjceIWAkH4ri6KeAst1S7PAJz
 P4e2esc+YkRSrw5aA2ZcbD+dLJPKGa3QlK1lUIUQ1m/y10CZ2SkYt/c0LNNTRXzRHDJI
 CToPXq9FekYrdyo7sl1sN8QV/FXlIA8v9XMJ73xitxiWo9eK6TWMyDNoenWyJ5FrWlud
 1D7EF7cNyyKmmY6RacFbfncSFq37NJO2aOYLFBm6ocs4Seu34jYz9i48wAGO0Pp78X9a
 nbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759772950; x=1760377750;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duPio0RPtDjdOCnFYeiJ23Ow5gw9QiPbk3qi6TQ0F40=;
 b=QbhspZegYELoEygb2nz2AnGWQcuwpJSr+2vs/4xXGfK8TF5/EHfMJbkLi9qkEpQLqb
 lcAJJ1jy7RQnupxB1k3F5iF5UAyNpQGyHHFSfHiWVW03fVyCesE5JrHz8Fssxjaj9zTW
 oa/Yqjg/KD+oaoQIuc1aNGTN4i+Vs/bx2np4JVPiQ6Ex15jFlJJ0EKB0CYUbD2fQFRlJ
 e5vHZSAE4miPrJZiMvX3fAy9MO+DKnE2vQ5Gp5s3EeiPBKJ7AQEKC7ZfLB/4ODW6dGGl
 t/GqccO15+0I8JCW9MkyQnRzHwv8VELGkvP2oqHPbhuiqphI/Hf8weIpv/U8CvOmjXH+
 0yTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPkNZb0tLjjejPw+C5wMTe1FtV5VN0hfbzK5R3bRn3RIg3LkCFTkgvPIRd3egCmYHwkudQPDCFEKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNeQOcg2pvSoo1Grl+MLTt5oRa9EE9HxqewTw7GYzQt47jxyCv
 +BxB+eeTseg5Npt/G4QncemqY6HTbiQsbIP9wvFM2JtgSwV/4piYZbFZ
X-Gm-Gg: ASbGnctYjrCJlraOiUqTvqsNWREjk/c0BaDrwzoDgXEmgSqefzht+hqykfCxlUPAqgH
 zie5r555FuhLY7b+uEzoXShwD320ULdWdPEl5Jt0FXpn2H8/0UApRkcI8ueQoEDp5xT0FmMo+5p
 vAMSSboGduKzR/j9LWJcd397s/DFhBhZ+S3P0TELUUAwb8npzL5WtGGqbRlB5dBfydvW0oxrlSJ
 rv52uu4wSxr5cLMBPZDOEpnhPN9M+8IfBJ0Naiq9CShUlvlH7xJzKcWFo2C054fr3HUcmp0aGYU
 8zCLZem5QvYZpFKDaa1ACAcav7ogiwz+pBl1t6/Qyt9HE77P+nm98r0zpi9rwhsGbSo8yIb0zcb
 XTS8RvVjKz2ObIY/gm1dkkjJ+Xs9aEjiChENkNTJJYqsXS2dY/m4Yb3s4OHIF0CbJTVNLWxDDjc
 CkKaVnHBL+h7wz85k6hifGWYtVjwKTsn/Ylg==
X-Google-Smtp-Source: AGHT+IHkSj9MNsUJw9ZpyQogvi/IDNzd+bwC8lC7GyQvo3xrlRnEdWW+dT6LIGRmyJoozLw5MWRCWw==
X-Received: by 2002:a05:600c:a14:b0:46e:3403:63df with SMTP id
 5b1f17b1804b1-46e711043a5mr98333235e9.8.1759772950265; 
 Mon, 06 Oct 2025 10:49:10 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723431f5sm165583805e9.2.2025.10.06.10.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 10:49:09 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 06 Oct 2025 19:48:53 +0200
Subject: [PATCH v3 1/3] dt-bindings: display: sitronix,st7920: Add DT
 schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251006-st7920-v3-1-4f89d656fa03@gmail.com>
References: <20251006-st7920-v3-0-4f89d656fa03@gmail.com>
In-Reply-To: <20251006-st7920-v3-0-4f89d656fa03@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

Add binding for Sitronix ST7920 display.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 .../bindings/display/sitronix,st7920.yaml          | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7920.yaml b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b4c16825f254f1b8345a2532271042350e3a5e26
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7920.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7920.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7920 LCD Display Controllers
+
+maintainers:
+  - Iker Pedrosa <ikerpedrosam@gmail.com>
+
+description:
+  The Sitronix ST7920 is a controller for monochrome dot-matrix graphical LCDs,
+  most commonly used for 128x64 pixel displays.
+
+properties:
+  compatible:
+    const: sitronix,st7920
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 600000
+
+required:
+  - compatible
+  - reg
+  - spi-max-frequency
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
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
+        display@0 {
+            compatible = "sitronix,st7920";
+            reg = <0>;
+            spi-max-frequency = <600000>;
+            spi-cs-high;
+        };
+    };

-- 
2.51.0

