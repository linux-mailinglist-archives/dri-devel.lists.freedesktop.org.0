Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33B77C9323
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 09:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4833810E0B4;
	Sat, 14 Oct 2023 07:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C79D10E081
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 07:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697267738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raAB53+V1qu2bUUCCKF3EKq6VfIA1dHSrOv8hUuGyAo=;
 b=ShDji2tJ7fgXPMECzfmmEAm72MhRFdfg5CljSjcGttm8hdh25AhNTyBid0BtScMhD3jwIK
 2dCaBgiQUaHso7pqloCIpNG43maxxavmwCR1wVftGKnP1JQYgNhtRpgEFs3htowh0UEreg
 CdoYUBB5t995yCbcdU1VpNuJAqa1Kg0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-OxakGGHOMYOyeXCYz7GmHQ-1; Sat, 14 Oct 2023 03:15:35 -0400
X-MC-Unique: OxakGGHOMYOyeXCYz7GmHQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2c50d4a1a33so7254461fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 00:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697267734; x=1697872534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=raAB53+V1qu2bUUCCKF3EKq6VfIA1dHSrOv8hUuGyAo=;
 b=pU/tdIklzsunJBnhkhJdvt2Wf5RvXnRlbSFsuWrrwKCMuXon2aTB9K+f+MbT/Yecc0
 yO2+fqDc4g5OQEK8jT8vKRTc9q6s+m7BpsuIT32a667CYwkejiZvR5vtMJFVpHbvRNGT
 qiOwQdEnyPl0wOwzbbVfB0/vzoqG5QVFPppcUZWASmyyobKbqf5OTC8hiT4ccxCHs4vD
 j/46lDHqLgtG680Meb8Xc3Acin8X78XPGornA8yZvcFLxyK3Oel9fckHAzCrMaSlwWwW
 n3u5Y+iJWZ0p6UNY1Eip2FqToAnHQJLxN2TaRTfRTT4SbCe4P6xoWCiOkpULeXl3CIWJ
 Xprg==
X-Gm-Message-State: AOJu0YzV0IpmjG++CDeSDKF+FXgqIpmdyCJ7kLZwzQMLvelSdpFf7fNj
 37DA7tj8+/GEUZz0dd++tDJJcpylAF4fKmJlxzom9cSuiPqHsUljwvyOzBCWrd9c7889/FiIVD5
 oPq+jDi5u1Yk/9H9Px6JIVUmOBrZb
X-Received: by 2002:a2e:a99a:0:b0:2c5:521:cec3 with SMTP id
 x26-20020a2ea99a000000b002c50521cec3mr4148485ljq.23.1697267734381; 
 Sat, 14 Oct 2023 00:15:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGwjo1TWnsUDMoqQYTjitJuF6l8VXN+YN8uVve4vYyQKLFuyh4vtPwp12m6D7ie0yr7j0T0Q==
X-Received: by 2002:a2e:a99a:0:b0:2c5:521:cec3 with SMTP id
 x26-20020a2ea99a000000b002c50521cec3mr4148465ljq.23.1697267734152; 
 Sat, 14 Oct 2023 00:15:34 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b0040646a708dasm1144730wmq.15.2023.10.14.00.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 00:15:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/6] dt-bindings: display: Add SSD132x OLED controllers
Date: Sat, 14 Oct 2023 09:15:08 +0200
Message-ID: <20231014071520.1342189-7-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231014071520.1342189-1-javierm@redhat.com>
References: <20231014071520.1342189-1-javierm@redhat.com>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a Device Tree binding schema for the OLED panels based on the Solomon
SSD132x family of controllers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v3)

Changes in v3:
- Add Rob Herring's Reviewed-by tag to patch #6.

Changes in v2:
- Remove unnecessary 'oneOf' in the SSD132x DT binding schema (Conor Dooley).
- Remove unused DT nodes labels in the binding schema examples (Conor Dooley).
- Split out common Solomon properties into a separate schema (Rob Herring).

 .../bindings/display/solomon,ssd132x.yaml     | 89 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd132x.yaml

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
new file mode 100644
index 000000000000..0aa41bd9ddca
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/solomon,ssd132x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Solomon SSD132x OLED Display Controllers
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+properties:
+  compatible:
+    - enum:
+        - solomon,ssd1322
+        - solomon,ssd1325
+        - solomon,ssd1327
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1322
+    then:
+      properties:
+        width:
+          default: 480
+        height:
+          default: 128
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1325
+    then:
+      properties:
+        width:
+          default: 128
+        height:
+          default: 80
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: solomon,ssd1327
+    then:
+      properties:
+        width:
+          default: 128
+        height:
+          default: 128
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            oled@3c {
+                    compatible = "solomon,ssd1327";
+                    reg = <0x3c>;
+                    reset-gpios = <&gpio2 7>;
+            };
+
+    };
+  - |
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            oled@0 {
+                    compatible = "solomon,ssd1327";
+                    reg = <0x0>;
+                    reset-gpios = <&gpio2 7>;
+                    dc-gpios = <&gpio2 8>;
+                    spi-max-frequency = <10000000>;
+            };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c63649e9ba58..4b518429458b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6766,7 +6766,7 @@ M:	Javier Martinez Canillas <javierm@redhat.com>
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
-F:	Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
+F:	Documentation/devicetree/bindings/display/solomon,ssd13*.yaml
 F:	drivers/gpu/drm/solomon/ssd130x*
 
 DRM DRIVER FOR ST-ERICSSON MCDE
-- 
2.41.0

