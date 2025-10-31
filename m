Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B4EC2456F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0457E10EAE8;
	Fri, 31 Oct 2025 10:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="mOC6eoI+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A671A10EAE8
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:04:59 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7a2852819a8so2013794b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761905099; x=1762509899; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GEMeTinKcUP58E4lvnW9PGrRCCfS2qn6jCMWx5eJs2c=;
 b=mOC6eoI+OqC7V4XZMe++1dONI00GaPgYJsOR3i1m04ABFIxPRCjNwV9JihU5tk7kgs
 d8gZRANc2FEyQxxIHxNSLFIb2VIsSPMpcBZZjGLHBk51ImE067xxaCXQ1qIJfNgmsZn6
 AlVLMoZtgFEnxyvcCljfMCp6hZHush+gvj5qVf81eP++3tVJCf355S4NNbqvFzBUtq5/
 ko/CtL2upOkjVtRKyk0dIexKvVMpURg0J/A/jdHyodko73NaaXfSLHgkgKn+h8enbGhq
 vNqztv3vPBTVex21FiDVuT3jf9QMUl4A1CqYqnmAiqBOaFhuUvnqR76uduisj0W62JQO
 9qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761905099; x=1762509899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GEMeTinKcUP58E4lvnW9PGrRCCfS2qn6jCMWx5eJs2c=;
 b=DFR+91Ma1oOX/Y6qmRnbci482rSV01rV4feKhdIp6DFKZWsZaHrZx3POzYe0pzYiEf
 EkQzoQUG/0b+yYkKm7EfCx9Z48TB2ru4yXC3hz2hBPOfy5yT+YlaqpCG1Baf3W33HyRT
 H/6QDFf9mBCVanuoGjZQVRf0t/iefaQ9tKiGTfUeqWi3Z8iWTYqpYI1Z+WzTQSp/ajS4
 r6kFkO7dwYnoSPMWdtVP/wE3mkux4DYYY6MK04Vai7P+NXug3ozWchRKP0K8056EDDQk
 4gjUnwNVZP7RfU5NSBJUX/Io/T75vu4pcw6WFF2fH8T4Be8dU2U2UOhVtH+0a2nhlJ3M
 sA7A==
X-Gm-Message-State: AOJu0YyeWTVFs3dbwWKM7gWeEW8zFqdMKDm1G70J+qsnitdsDvs2/x2b
 XUY0WDDlr6P/luNnYQ+SsmkCbKWQreGLroR1iBdI4mkQSby/qZ5T4uVp9oL7SANO8+o=
X-Gm-Gg: ASbGncsAEAR8R729JBDUKnSC3eUxU2uwtc87CYxAPT2rypow3t3Q24G1Fa+pyAwQpN8
 qdslHTLmkTecNISbD9DceIpa0655CWYsVEiRbyxZO95y3fkeZV9MIpysHVasNssk45RYwBjuhCu
 Pk1joRAwE+nmaGLqLi6yyC52wc3S8uar9JYcKPhp3t0bu2Eg3imreIme0pRxjU4ESNQRG2mlc6Y
 LcsxcgG3FBov4owEYi9AU86HWNBSeX5VTxzAO98NifTQvYFoZ3P9HokdhsbU9/4VwwKdWKf5EUg
 FEhqKbMbF6Hz4o6c2ZJPQqUmeQwTjW9WDQe2M1VwSaK0BlH9oeu5iAGfFEo5/bBMqmgt3OG56BW
 AbZwj9TBTpxM3meuFYWQPHozJz09XfXEaYh0mAirmNJxrRQh38SIjiYGinsBFynliOTTjnX5uQY
 Jhuy7hQXQeXrYHRTsuZgama8mIyPPUTc07ZGIAibZt8ETo+mROLxofphA4mA==
X-Google-Smtp-Source: AGHT+IG6rUfkolNN1CRK86/13whfqnSQY7wkh3zlIQBrSCO05TTNTykamCuKrPtjYsc8MEhWLvUtqA==
X-Received: by 2002:a05:6a00:1886:b0:781:1b5a:959b with SMTP id
 d2e1a72fcca58-7a779eeccadmr3551694b3a.30.1761905099181; 
 Fri, 31 Oct 2025 03:04:59 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7d8982117sm1644352b3a.15.2025.10.31.03.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:04:58 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: display: panel: Add Tianma TL121BVMS07-00
 panel
Date: Fri, 31 Oct 2025 18:04:46 +0800
Message-Id: <20251031100447.253164-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251031100447.253164-1-yelangyan@huaqin.corp-partner.google.com>
References: <20251031100447.253164-1-yelangyan@huaqin.corp-partner.google.com>
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

Add device tree bindings for the Tianma TL121BVMS07-00 12.1-inch
MIPI-DSI TFT LCD panel. The panel is based on the Ilitek IL79900A
controller.

Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../display/panel/ilitek,il79900a.yaml        | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
new file mode 100644
index 000000000000..02f7fb1f16dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,il79900a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek IL79900a based MIPI-DSI panels
+
+maintainers:
+  - Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - tianma,tl121bvms07-00
+      - const: ilitek,il79900a
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel used by the panel
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for the enable pin
+
+  avdd-supply:
+    description: Positive analog voltage supply (AVDD)
+
+  avee-supply:
+    description: Negative analog voltage supply (AVEE)
+
+  pp1800-supply:
+    description: 1.8V logic voltage supply
+
+  backlight: true
+
+required:
+  - compatible
+  - reg
+  - enable-gpios
+  - avdd-supply
+  - avee-supply
+  - pp1800-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "tianma,tl121bvms07-00", "ilitek,il79900a";
+            reg = <0>;
+            enable-gpios = <&pio 25 0>;
+            avdd-supply = <&reg_avdd>;
+            avee-supply = <&reg_avee>;
+            pp1800-supply = <&reg_pp1800>;
+            backlight = <&backlight>;
+        };
+    };
+
+...
-- 
2.34.1

