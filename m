Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF4697EF1E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 18:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BB6B10E284;
	Mon, 23 Sep 2024 16:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yrnm2nRK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5CE10E284
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 16:22:52 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7a9aa913442so477126285a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727108571; x=1727713371; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WK7eqKzfxTCXYjY4yBuvM5uGMWIrx3TALuq0TWoNpjA=;
 b=Yrnm2nRK3nfCwp0IHD/Lq0guEWVT39FxCgmx/62m/YpjWHO8N8KZs6hlDVWQfP/G6v
 nAYqrvl7ciS5Da6ArIoGBYF09WKK/ir1D6XGn3Q58tGWCEkdpdj1bKHBd3ZP9ddiAPxX
 VYzLG1ymgVYW91juxtVrPYPEqiWFXXOgwgOcrWFT5bBLXKtSmHuCdzruRBVrIbBNAvOr
 MtR6aMFSJOgj9QADsbzSmEKdP8h/2ykSmEyrjhXJ4pjDbbPQoJzNMfyRKacKh1oRWYI8
 9w6MKeCrHuz+Hu2wThfA8qtHL0pdsx5Q9/Pl2YrfWNuY2pMmWYdfD5ZZuHsDuk7kW8aT
 QbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727108571; x=1727713371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WK7eqKzfxTCXYjY4yBuvM5uGMWIrx3TALuq0TWoNpjA=;
 b=ftLUNXytvGbZ/DnYJ2Py4hbPxa2pYfPAQr+1d4AwN2+IINSEiORxFjEWbD5pzTdne4
 mgNU5fFQ+cn+7zPRmsx0MGJie3gBOxtZzQtNGUbHOpAQWL2iOwhZpjewprGHDTJP/RiJ
 1/VsMRvmUeWkq+Y4B+8sVj4Q0jLUbxSLdo4YlqqJS7gTuPxGuzR3C5zNllgqLeEoHUVt
 /ZWGkOZQtPr0XDzxq/3DgZ27Gcksf2CaYU3PxiScR03g23IIIzz3s+t6zGP+bmcy+uyK
 dMRrdB2IdeBQgOSzq0f2khm7+ByPjYcDzo/MYB9EJyQLw+w/5XXgwc2qlBFZVE+SDH4s
 UBAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVemfkndBHGAM8UDbxq/u0XVXztKuFsdBSjqYa/1vqOFECtc+bp4u7NAh/4pqS7shDNZzMWd2ULosg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdJpWwCERY6PnixfYeeMuNLJFehJiFppbmcfRTUUnj4pN6IDKb
 L6jaPUR/lDcjZjCTid9NWrjkhJssn+ytTm0HySsLhT4cd+bqJOXd
X-Google-Smtp-Source: AGHT+IHtGW8BGgq7f+idZ01ePUM9n4dRpEXgM/5sCn84zGPQtG+DUDSYbLOgEjG4fiqKSLk7e8vKlw==
X-Received: by 2002:a05:622a:3c6:b0:45b:1d3:d9a8 with SMTP id
 d75a77b69052e-45b20508707mr193558461cf.27.1727108571506; 
 Mon, 23 Sep 2024 09:22:51 -0700 (PDT)
Received: from VM-Arch.gst.l3harris.com ([208.127.73.102])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45b17867fb0sm48587901cf.1.2024.09.23.09.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 09:22:49 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: dmitry.baryshkov@linaro.org, Alex Lanzano <lanzano.alex@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 christophe.jaillet@wanadoo.fr,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Mon, 23 Sep 2024 12:21:34 -0400
Message-ID: <20240923162205.55658-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923162205.55658-1-lanzano.alex@gmail.com>
References: <20240923162205.55658-1-lanzano.alex@gmail.com>
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

Add device tree bindings for the monochrome Sharp Memory LCD

Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/sharp,ls010b7dh04.yaml   | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml

diff --git a/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
new file mode 100644
index 000000000000..8097f091c2a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sharp,ls010b7dh04.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Memory LCD panels
+
+maintainers:
+  - Alex Lanzano <lanzano.alex@gmail.com>
+
+description:
+  Sharp Memory LCDs are a series of monochrome displays that operate over
+  a SPI bus. The displays require a signal (VCOM) to be generated to prevent
+  DC bias build up resulting in pixels being unable to change. Three modes
+  can be used to provide the VCOM signal ("software", "external", "pwm").
+
+properties:
+  compatible:
+    enum:
+      - sharp,ls010b7dh04
+      - sharp,ls011b7dh03
+      - sharp,ls012b7dd01
+      - sharp,ls013b7dh03
+      - sharp,ls013b7dh05
+      - sharp,ls018b7dh02
+      - sharp,ls027b7dh01
+      - sharp,ls027b7dh01a
+      - sharp,ls032b7dd02
+      - sharp,ls044q7dh01
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 2000000
+
+  sharp,vcom-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      software - This mode relies on a software operation to send a
+      "maintain display" message to the display, toggling the vcom
+      bit on and off with each message
+
+      external - This mode relies on an external clock to generate
+      the signal on the EXTCOMM pin
+
+      pwm - This mode relies on a pwm device to generate the signal
+      on the EXTCOMM pin
+
+    enum: [software, external, pwm]
+
+  enable-gpios: true
+
+  pwms:
+    maxItems: 1
+    description: External VCOM signal
+
+required:
+  - compatible
+  - reg
+  - sharp,vcom-mode
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+  - if:
+      properties:
+        sharp,vcom-mode:
+          const: pwm
+    then:
+      required:
+        - pwms
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0 {
+            compatible = "sharp,ls013b7dh03";
+            reg = <0>;
+            spi-cs-high;
+            spi-max-frequency = <1000000>;
+            sharp,vcom-mode = "software";
+        };
+    };
+...
-- 
2.46.0

