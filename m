Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AA7A70851
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 18:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D436410E5CE;
	Tue, 25 Mar 2025 17:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="npsDH/cm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33D110E59A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 15:58:59 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id
 2adb3069b0e04-5499c5d9691so6389197e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742918338; x=1743523138; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VAn0k+129G/lYAogRR6VU4mS8jgZ5heo+yrP5mQ+4s4=;
 b=npsDH/cmIKy6X5wMVsyHghJem8sL5F0aZ4MN1+d0iI8SaLZPnPkGJgoMtOgpR2v0O4
 YWGyOai928aEKSyfRJ50Feza+6rLSet4nayUjy9BQBgOFfG0N5Ag7009ajQ7H/3z3rIS
 nearRqCasiMYBZG6zonYnhpdbJaY0SwxFEuyK1tENVLyVA1rmMF3qGX3EU/saEVpcLBG
 kwCRRagqGxXl1hRYOli7IV/EaJi7C5ZCfPcDZtkjHNWx041HxnuzyuOPOva2YqK0NgSn
 sl+ADNTG8wNE+zKdNG930L9x9B93OQcF6BKRAhs2DO/OoHW/1tmyc8SLnTTRYcMi9xFA
 C3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742918338; x=1743523138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VAn0k+129G/lYAogRR6VU4mS8jgZ5heo+yrP5mQ+4s4=;
 b=MZ/CZeHpgjWZo82aeWEzj6Ml5w6wayk6gXg+uOfEFBfBKQKLevM5PrWsc9hbbj1ZSH
 yI9bqp5AmxRjKSqmJWLAbjGvVBaOd+cNWFc76k+IrLOK3m6VmmURRUDRWVUkZc78YQQs
 myRgaKuHWMNP246FLiLTz9FF0BHDZbjZ9CBBzQ0EokZ7Hx5tkFhdOWm3ECrIdev/ESTk
 ccRiInR3pqVZO9adN+cB2H4tUWhFVbpTDe8bjSwONSRwYIhAKI1+T4fMP3lzNE9zwkRS
 +tBtLFD1BChHJgdzbz2xMpWDF+o4Tzh28zZOc+Lm7/GIgI54gHKizLoXIdL4auf1R8u9
 RHPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCOmAKcB67d0icysgoLOUzrnr9BaljoEFAcUEgJv5BEEs1mk9xnPKc2qQEGBmRBcfAvf8DG70+5A8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCl1KvK9GzX8aXUWzkC9sInR0UoF57JtDJyzpLO7JDGVvX4+hI
 m7bSFnbqL4Shuf0T1eodxF14o1eI1mE3K1Ye/QHyR4ejjKeDQjJI
X-Gm-Gg: ASbGncvDnucf9h1MI9E9zTsk+D6HbzcAJy3WeKGE0LvwNuJUI5MMaY1dccSzFCBPGVo
 9pG1l0Vi4NuHMXguwadYPRAcXVBmfCuX9uiHDqp9Fwknmlvp4VJx0Nw3QUw99auqQUcWZrxQw5O
 qQ3RFClaFlGyqvQ3j+aVqtlR0ujkmwNTUSYfn+QwMzXb+CSkJ165Qf7ayQVE9tTk7I07lTwGLQJ
 JtCrtHY2errYk+G7pnVSVP999XzWDCquhECOdZm64EB6baM2eD8t4jCs0c1Zy7XEIsGBbTSxtjR
 XXS9QWS3EaEQ8SoZAu2/UgCIKACqIkVvqoEN/WCCAoApY/ghJfbVwZRKTw==
X-Google-Smtp-Source: AGHT+IHbUVM9uZLUQY1MpYbYlpt+APtpb3ZkPfUBiPhkDsiHbQugIoIvF5XTmPwsJT7itPCp5BOgNg==
X-Received: by 2002:a05:6512:3d21:b0:542:28b4:23ad with SMTP id
 2adb3069b0e04-54ad6489f85mr5949777e87.16.1742918337786; 
 Tue, 25 Mar 2025 08:58:57 -0700 (PDT)
Received: from pilotmaintrash.lan ([178.34.180.83])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad646cedfsm1544573e87.2.2025.03.25.08.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 08:58:57 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Visionox G2647FB105
Date: Tue, 25 Mar 2025 18:57:48 +0300
Message-ID: <20250325155756.703907-2-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325155756.703907-1-sanyapilot496@gmail.com>
References: <20250325155756.703907-1-sanyapilot496@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Mar 2025 17:37:54 +0000
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

The Visionox G2647FB105 is a 6.47 inch 1080x2340 MIPI-DSI CMD mode
AMOLED panel used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Add a dt-binding for it.

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
---
 .../display/panel/visionox,g2647fb105.yaml    | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
new file mode 100644
index 000000000000..49dcd9b8f670
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/visionox,g2647fb105.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/visionox,g2647fb105.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Visionox G2647FB105 6.47" 1080x2340 MIPI-DSI Panel
+
+maintainers:
+  - Alexander Baransky <sanyapilot496@gmail.com>
+
+description:
+  The Visionox G2647FB105 is a 6.47 inch 1080x2340 MIPI-DSI CMD mode OLED panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: visionox,g2647fb105
+
+  reg:
+    maxItems: 1
+
+  vdd3p3-supply:
+    description: 3.3V source voltage rail
+
+  vddio-supply:
+    description: I/O source voltage rail
+
+  vsn-supply:
+    description: Negative source voltage rail
+
+  vsp-supply:
+    description: Positive source voltage rail
+
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vdd3p3-supply
+  - vddio-supply
+  - vsn-supply
+  - vsp-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "visionox,g2647fb105";
+            reg = <0>;
+
+            vdd3p3-supply = <&vreg_l7c_3p0>;
+            vddio-supply = <&vreg_l13a_1p8>;
+            vsn-supply = <&vreg_ibb>;
+            vsp-supply = <&vreg_lab>;
+
+            reset-gpios = <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.49.0

