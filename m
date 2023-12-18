Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9587C817A12
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:51:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BA110E3DA;
	Mon, 18 Dec 2023 18:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DBF10E27F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702925352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcLxXFd71FqRSBT1EG5Vxt0tr8/Qm7u7kD7fkPmPXog=;
 b=AakiLy6aOlv+4h+RD4yn85+NVm3oqVXJJk7ZDCErCgAD6aCXy0W15HT5qzhkTeny882kpC
 RVaP6qsLFEcFlCmi54+owWJkShvR9WESYBN3ZPrZbDZIdOKrIkjf/EaH+PCIziYLvJidYG
 BcZ9oRN1aUe+e/Kh3n039rJGHg4CInA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-GAuLMiJKPQGyKLbWjYklyA-1; Mon, 18 Dec 2023 08:28:30 -0500
X-MC-Unique: GAuLMiJKPQGyKLbWjYklyA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3366bf4adbcso336304f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 05:28:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702906109; x=1703510909;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xcLxXFd71FqRSBT1EG5Vxt0tr8/Qm7u7kD7fkPmPXog=;
 b=rhkltjPid0SzfIP6B3PjSutP1y1ZDlfU8Itpi68SbVgxR5kRqn34+wldzDa41AEnt0
 Ul6ydEx003j9YBDe7S0Q4wGqHj90S7OjdAcCNLwa83Y9tywy526W9rJAyp7dGilPo0cM
 Hi2QTRByZTYB9POVOdA4qiyDS8sMZM2UkD889RLDtPk/U2ym3ISjDDvkw0e5XCBumgao
 7Qhs+wGGd+g3K0/XETuBhb1wNFJj3R4rIaFnp/OAgf9YsZTer3ILE/Gy4aj6vztW6O9A
 Q2i4Xbbt7V8jKq3PQxU6B4qGzz0gSmAtn10D5U62/RtqdMcJwyUTrLm8b9EHCI+9Ze64
 5nPw==
X-Gm-Message-State: AOJu0YxnteVebMEknkvh7TYVNtuXw04G7R91ZhdJtIjN5CacD4Nv9bXW
 hjQYyQGERZ4JWpFeBxuvnSq+rRiEcpDm6QSDsPt7f10cUvf4DTZCXS2kRgtigz2X5iWafDNdwZN
 SWtQspPt+NvOB7RT41MbULd4vrFaL
X-Received: by 2002:adf:cf0e:0:b0:336:445a:ec51 with SMTP id
 o14-20020adfcf0e000000b00336445aec51mr4106272wrj.143.1702905687524; 
 Mon, 18 Dec 2023 05:21:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJY8+4hU5oDu6qSl59TsTm745DG8WzEVry6hZALawkyULyAWdi5nKE6mTJ+I9u3OMhtVhj6w==
X-Received: by 2002:adf:cf0e:0:b0:336:445a:ec51 with SMTP id
 o14-20020adfcf0e000000b00336445aec51mr4106218wrj.143.1702905686791; 
 Mon, 18 Dec 2023 05:21:26 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g17-20020a5d5551000000b003333521a1cesm2115952wrw.57.2023.12.18.05.21.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 05:21:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: Add SSD133x OLED controllers
Date: Mon, 18 Dec 2023 14:20:35 +0100
Message-ID: <20231218132045.2066576-2-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218132045.2066576-1-javierm@redhat.com>
References: <20231218132045.2066576-1-javierm@redhat.com>
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
 Javier Martinez Canillas <javierm@redhat.com>, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Device Tree binding schema for the OLED panels based on the
Solomon SSD133x family of controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Unconditionally set the width and height constraints (Conor Dooley).
- Fix indentation in the DTS examples (Krzysztof Kozlowski).

 .../bindings/display/solomon,ssd133x.yaml     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
new file mode 100644
index 000000000000..8feee9eef0fd
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
+properties:
+  compatible:
+    enum:
+      - solomon,ssd1331
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+  - properties:
+      width:
+        default: 96
+      height:
+        default: 64
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

