Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72896D911
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 14:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3CB10E890;
	Thu,  5 Sep 2024 12:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="beqnN5q6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A4210E890
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 12:45:28 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6c34dd6c1b4so3329846d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 05:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725540327; x=1726145127; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cPNkiN4FpNjoh42kLB4DXZ+z+KT8DuqJ8pFx6jwc9To=;
 b=beqnN5q6nX0xrJQ+P1HJJz9VtJR6obODaTanMFHnWZLCU15KExbBWIZjA+4yaDpqqb
 BDC71Nazl2Xd6kEEuOFnti2KI+XPnDN6VAnUirLKLYO7ZGMp6pVzk89X/kAIFss0aOfy
 7JKGnJWNrHOfdyTZ8zvXk5VCXD7lNDXqswxUdrpnlcRWac8Pf8x+k6Z8ByKvJDrEqprj
 6S5nLmy0UzGwIVy9qU+jfCBev+Tt4rtusT8ZZ1jr1bIZODASzNJ95Elf2ksGEM/DNsqo
 pOn6fC6MAyOP8odlNbZwVncsyxF6G4aJuFCmmIKPlnMFPnkZFuC8i0JjAhWXL3rECIrR
 qVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725540327; x=1726145127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cPNkiN4FpNjoh42kLB4DXZ+z+KT8DuqJ8pFx6jwc9To=;
 b=b9sxF1xuV/sM83LQACOeWTcU532JhvLIHSlajyyOymwo+fjQ3PcmXXiwYwbx0mEsvj
 nqaEd1WUKaluGrWTEo4R0TCXeGGu3QxxgyWF+9uxyQZqESzdLdY5S1b7uUrsHhqLf3Jo
 yjuoHbPmhRIZ1HeLMOK2YgCq+zf9oXUqZYVVgnCNVSbgp3Y6p8cgZmaEDbJT9jnDgP1/
 006KsHMdIuFlw6y9HclztsnwRp1MgmmgSmJdFoTxfElgf8N6oq4/Ino1AUsAzHm9DH5P
 x4DPglw3oHxbBb2nzJyEJB6yAhJYR13AeCV3OcYOujY/PBEBHwBLlpLOnPLs7yPPmnVJ
 yfrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe+LBrSmN0pmzeUEKRRXqzd0fMtRLF/pI2jwtJ5W0+f9pVtYRGgWFk6ON6/h9W4JTCa0eVd5TUZYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiAFt71lSwj/R+fSoNksBoJNax6/0YdvcMHDnSphPyVISw9nFJ
 pMSY9y0tmUKA8GBCVqKB6b8xN9WdejMvGyY3m8nPg/oMpRn/hrRB
X-Google-Smtp-Source: AGHT+IEQA78sKnpfuRxvphOLDPFKxwqXZrovyMeyXee1uehOaZt5laT2XubMglcD76YOy63hICNK9A==
X-Received: by 2002:a05:6214:3902:b0:6c3:7026:203 with SMTP id
 6a1803df08f44-6c370260427mr105065926d6.11.1725540327410; 
 Thu, 05 Sep 2024 05:45:27 -0700 (PDT)
Received: from localhost.localdomain (140.sub-174-193-1.myvzw.com.
 [174.193.1.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c52041a00csm7161116d6.114.2024.09.05.05.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 05:45:26 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>
Cc: christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Thu,  5 Sep 2024 08:43:59 -0400
Message-ID: <20240905124432.834831-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240905124432.834831-1-lanzano.alex@gmail.com>
References: <20240905124432.834831-1-lanzano.alex@gmail.com>
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

