Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF093D93D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 21:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7267F10E2A8;
	Fri, 26 Jul 2024 19:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GPI96Nb9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CB510E2A8
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 19:45:14 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7a1d984ed52so70872285a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 12:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722023113; x=1722627913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yXT+wFiyhjvpSkrlHSctlHVmY/Ns41WEic2qjTORCwY=;
 b=GPI96Nb9G4kDWaM0Ym6aGmG6yF5ptRzFqTBHEkDC7ax/TcnsJs2/J3BXSgnbpky4iF
 UPAtAQz51rj6uSQel2WdLHDsc/tMpTJc1OHNVY5c4b+/PtDqTYkxZ8OtZD4KlEu2rK5Y
 FDLf375FMfb4Z00bQTElk0fBF+i3pLQxoU01F7JEvklLotldTcaoObCt6TYoWU3uon0C
 5CwL7kVaLKrcCdaLeBDWWQ7NMoKJvwF6eqxpxev7rqO70ubqqoigOaZFvaHLh632eEQC
 94JTADsDQ1QHNdWQqMYeO9LfpBbg23o+JGmcunJPB2zzqD7DTG458PhW7lw+rLg97QOA
 SmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722023113; x=1722627913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yXT+wFiyhjvpSkrlHSctlHVmY/Ns41WEic2qjTORCwY=;
 b=m4kL7Q1VAcs0sCIg5hOvdOz47n/W3LcM0UQByb4LtIQP0OUx4C02xkK1EXzU57tkSd
 ogF+V/RDSUQZpegMdz0SUsUSr4rFhX9S3XzKBDgWAoD+bzGFaJWs1URVxKBmUu18KdP7
 qY13IggNoRBy0xOUGyNjVLx3rxHEMIEFhXwD4yszgko6M2T4gOkwB7tLddiAhQINIFmk
 Fl8w4VYnMppn2uT0rFpvz8Vu51B39JjicEjZYgrrNHgo4vCOX4nLyIwrRsZfqAlhxMKR
 UU3FYIa0nKjHio0VK9CdrQ9dh1KeLcex8DfXyr/9bNfFsjikkTEkquPz9Unmo4r6vuev
 hpNA==
X-Gm-Message-State: AOJu0Ywy96Md5UTAuJAaTpl2FeBPDfLGr6Sn6Z7lynY/C/AnDMjWoWNY
 8vVNb1ANDPzBNXrhDe/LF8Rep/lKi3xOCibEvsFotvoXFZG49hdPNEU1Mdmu
X-Google-Smtp-Source: AGHT+IHetmOgnr6iiqVdvKKSkNIgh09fAuvmH6sh7ueQCFYgfq+nzE4G03xYGVAiQKb4MhfrwejxJQ==
X-Received: by 2002:a05:6214:20aa:b0:6b7:980b:e0b6 with SMTP id
 6a1803df08f44-6bb55a2e971mr9010276d6.26.1722023112927; 
 Fri, 26 Jul 2024 12:45:12 -0700 (PDT)
Received: from localhost.localdomain (ool-1826d901.dyn.optonline.net.
 [24.38.217.1]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8f83c9sm19409986d6.38.2024.07.26.12.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 12:45:12 -0700 (PDT)
From: Alex Lanzano <lanzano.alex@gmail.com>
To: mehdi.djait@bootlin.com, christophe.jaillet@wanadoo.fr,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Date: Fri, 26 Jul 2024 15:44:25 -0400
Message-ID: <20240726194456.1336484-2-lanzano.alex@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726194456.1336484-1-lanzano.alex@gmail.com>
References: <20240725004734.644986-1-lanzano.alex@gmail.com>
 <20240726194456.1336484-1-lanzano.alex@gmail.com>
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

Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
---
 .../bindings/display/sharp,ls010b7dh04.yaml   | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml

diff --git a/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
new file mode 100644
index 000000000000..79bde7bf0d7d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sharp,ls010b7dh04.yaml
@@ -0,0 +1,94 @@
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
+  a SPI bus when the chip select is high. The displays require a signal (VCOM)
+  to be generated to prevent DC bias build up resulting in pixels being
+  unable to change. Three modes can be used to provide the VCOM signal
+  ("software", "external", "pwm").
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
+  spi-cs-high: true
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
+  enable-gpios: true
+
+  pwms:
+    maxItems: 1
+    description: External VCOM signal
+
+required:
+  - compatible
+  - reg
+  - spi-cs-high
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
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@0{
+            compatible = "sharp,ls013b7dh03";
+            reg = <0>;
+            spi-cs-high;
+            spi-max-frequency = <1000000>;
+            sharp,vcom-mode = "software";
+        };
+    };
+...
-- 
2.45.2

