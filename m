Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 628A881C7BA
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 11:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840F010E7B2;
	Fri, 22 Dec 2023 10:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAE010E785
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 10:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703239321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4FSS8B/TyNttrAPDKVxxrfugLFfEOoGgW3LT/2ICJc=;
 b=gJ4myPeCAAXW/6uyDpep28eweA1uhXFGvfPCKvaoVY77Lm1MxW/7JMQeu3ECc5l75FN7Le
 iw4trFdLYtu73kcW6+wze8cz8+jA68oyunfaZgzY0CyE+D7u0a2XepLTCnD/3qrkryUSna
 oTFOr880Kbqx1G6AxObPDj3Db95hy70=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-JH_MaVD-O-GogpoMqgv2Hg-1; Fri, 22 Dec 2023 05:02:00 -0500
X-MC-Unique: JH_MaVD-O-GogpoMqgv2Hg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3367e2bd8b0so1096619f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 02:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703239319; x=1703844119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L4FSS8B/TyNttrAPDKVxxrfugLFfEOoGgW3LT/2ICJc=;
 b=ApjxcG8yJyn3p9ALM8kPVOx6NBfpZUp3iB4PX+yUFcB90kGR2oy2FD6I8tcl0EwyqW
 c8ZbU5hE5PdNA73+kRVxPcaNIa0IP5OI7D4HgAXM9dq/HsTZ5msy2Pqx2pfX3madqvKb
 im01/UlwTBcl5SYpIG3RCwxH7C8sjUzEn5oPLo/tMEatT5OY+EZyY89244BD1nr35Sc9
 oQdEQQw1HCtqsfnAIieY+GB/oc2/Fvk0NrUf8G5vGDD8fNwGGqBSIcTyeF/LR9qo5c22
 sOa1oc98bpoijG4VJ0+UOiz6vk3WII7aO3aeHxoNYFjKw7sxV7ggmoxqIzO4SKgGQnfQ
 tB5Q==
X-Gm-Message-State: AOJu0YyxzvMnoA0wK72ZhgtfSVmnpU426gFr11hnIXu4NXNIh1TuKAcq
 qJw1V9XIXjb6C+gEfgAlOavyND42c1C5mzrKhA9HSVas5ny/C7Q97Fivm4/YpLvr9rrLt2tT8Kl
 NcIpbeWEWj8k2H5zMUKAHld2oezBtLB9nAEEr
X-Received: by 2002:a5d:4351:0:b0:336:7357:a9f9 with SMTP id
 u17-20020a5d4351000000b003367357a9f9mr609042wrr.83.1703239318512; 
 Fri, 22 Dec 2023 02:01:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGsZNdU6Ak/y/62OAv0NofaXq3Tb9KBXRWL0RjpFZICnql7RgbmU8gyoAOcGlYZ24PvkGjvFQ==
X-Received: by 2002:a5d:4351:0:b0:336:7357:a9f9 with SMTP id
 u17-20020a5d4351000000b003367357a9f9mr609036wrr.83.1703239318274; 
 Fri, 22 Dec 2023 02:01:58 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t16-20020adfe450000000b0033666ec47b7sm3883026wrm.99.2023.12.22.02.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 02:01:57 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] dt-bindings: display: Add SSD133x OLED controllers
Date: Fri, 22 Dec 2023 11:01:40 +0100
Message-ID: <20231222100149.2641687-4-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231222100149.2641687-1-javierm@redhat.com>
References: <20231222100149.2641687-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Conor Dooley <conor+dt@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Device Tree binding schema for the OLED panels based on the
Solomon SSD133x family of controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

(no changes since v3)

Changes in v3:
- Move solomon,ssd-common.yaml ref before the properties section and
  width/height constraints after the other properties (Conor Dooley).

Changes in v2:
- Unconditionally set the width and height constraints (Conor Dooley).
- Fix indentation in the DTS examples (Krzysztof Kozlowski).

 .../bindings/display/solomon,ssd133x.yaml     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
new file mode 100644
index 000000000000..e93879b3da5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd133x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD133x OLED Display Controllers
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1331
+
+  solomon,width:
+    default: 96
+
+  solomon,height:
+    default: 64
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        oled@3c {
+            compatible = "solomon,ssd1331";
+            reg = <0x3c>;
+            reset-gpios = <&gpio2 7>;
+        };
+
+    };
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        oled@0 {
+            compatible = "solomon,ssd1331";
+            reg = <0x0>;
+            reset-gpios = <&gpio2 7>;
+            dc-gpios = <&gpio2 8>;
+            spi-max-frequency = <10000000>;
+        };
+    };
-- 
2.43.0

