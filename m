Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C28681FF18
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 12:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8551010E2A2;
	Fri, 29 Dec 2023 11:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB3410E280
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703848838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSLqHCf+PCh+kG7eprKkh+p3h0FyLiC3U9qCESwxHTc=;
 b=G+VdCuqBbWbunb3heryrgt93b/ohZ1Ns4+ZKRNGlRaWGW7U6MC2BXxTvXidFM7c0RGTixB
 0sF14D9tCtyLPPtE+AN2ktyQeml6lVbiV3o+teox82aNfzhU7T/rrIP2CQ1w7823LF4ID+
 9FMgwrUbOZmiKS7TzyBSltu7bB1HqNc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-oGtgmuDgO3u-JYhZrSZkLw-1; Fri, 29 Dec 2023 06:20:37 -0500
X-MC-Unique: oGtgmuDgO3u-JYhZrSZkLw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40d44d9dae3so65457555e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 03:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703848836; x=1704453636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lSLqHCf+PCh+kG7eprKkh+p3h0FyLiC3U9qCESwxHTc=;
 b=Jmp5rTxxAqkayR9R7XMTRRCvlnuDt4+ZUkwN1OIlbiCmbWu/168C2iv9+Bpnku0QEz
 5U8fEGa4DRJAAp1SFte6hHzgXuLOq486tkXWp7pe8UoNj42xrKIQ5iPS9pJTuv3WlQGk
 pIoW/vFwUtK4d6B6sTEZfs2osrL2U9gIT+1durGFiq8S9bwQX+PF2J1YDfKmMHs7KKbP
 86jvqtc7l1rj9FIFN8mBuH8++LD9sxu7ywAoNo1XvJjduT7n5VJFWh7Tt23IuYaORlI2
 I7HdP1FMAF3FTQcuEw3OFBAE1W2kq6D0bHa8pL8accg9sYu6ppaaI5PoSlCDyli71oqa
 N7cQ==
X-Gm-Message-State: AOJu0Yxg1nyNa94dBBBnvsmmbh9dVHe8iL1UHWY3Gjmxuan6a4i1hqqC
 HPrFqvOK3bRRN8eW9iK2YPXEYzaVkjcJwL8MDizJB/9BTm2JdSPUe9jG3AeJIU6bVWBVltdzAD6
 Rqi9GPI0Euu7gX2VoAnZhCY0eWJasRjOBuO2O
X-Received: by 2002:a05:600c:4e47:b0:40d:593f:63e5 with SMTP id
 e7-20020a05600c4e4700b0040d593f63e5mr2848665wmq.7.1703848836378; 
 Fri, 29 Dec 2023 03:20:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlj10bIoIUF+UYUDAzKVV9YvfEYypdYrT/ygYKwqV9SMlOAWZ+phnhDZMNxMdCsmflXT0Tng==
X-Received: by 2002:a05:600c:4e47:b0:40d:593f:63e5 with SMTP id
 e7-20020a05600c4e4700b0040d593f63e5mr2848655wmq.7.1703848836196; 
 Fri, 29 Dec 2023 03:20:36 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q11-20020a05600c46cb00b0040d2d33312csm30532067wmo.2.2023.12.29.03.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 03:20:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] dt-bindings: display: Add SSD133x OLED controllers
Date: Fri, 29 Dec 2023 12:20:20 +0100
Message-ID: <20231229112026.2797483-4-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229112026.2797483-1-javierm@redhat.com>
References: <20231229112026.2797483-1-javierm@redhat.com>
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
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Device Tree binding schema for the OLED panels based on the
Solomon SSD133x family of controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v5:
- Drop I2C example in DT binding schema due that bus not being supported.

Changes in v3:
- Move solomon,ssd-common.yaml ref before the properties section and
  width/height constraints after the other properties (Conor Dooley).

Changes in v2:
- Unconditionally set the width and height constraints (Conor Dooley).
- Fix indentation in the DTS examples (Krzysztof Kozlowski).

 .../bindings/display/solomon,ssd133x.yaml     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
new file mode 100644
index 000000000000..b7780038a34b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
@@ -0,0 +1,45 @@
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

