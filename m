Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11ADA889C8
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 19:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2348B10E637;
	Mon, 14 Apr 2025 17:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MpFt3bqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921D010E637
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 17:27:12 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id
 38308e7fff4ca-3104ddb8051so27033181fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744651631; x=1745256431; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gp0Fu3ouz4uc6KpA7K7Yg17pL+gYDllzv0em80pWIw0=;
 b=MpFt3bqYh54FVug+fWE8bLfoJazRFd76lrgeseg+2RDwjL6YsvF/BbIMeCb3rXybV3
 b6pmLbvL8cCJ4yvRKk/VEgJZ+RGpRoLJgfd1dZyGplZERmiYvHAnb+OfYDoGXntHuMmM
 i86fmIWpsFFhVpPKkYZTmgFRNvf9H9UAKlTmgihLJ1s+pI5Czg+lIxwEBQKHVBug56kE
 n4pc0baLEW5oWIDXtKp7zox+BVqQHiRBf9hou5c3efDnolg0DY5cIaWsqVHn7LGvEwVz
 FHl3TgOuCS1KOxqO8ba+OxoYJePGrQefZc/8xjbqJbaEBJf9S3bVNcAOoWz07umoD9lm
 pssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744651631; x=1745256431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gp0Fu3ouz4uc6KpA7K7Yg17pL+gYDllzv0em80pWIw0=;
 b=qUpNr1ynKEMI76yy6LWV/wiYKuNYASCa/wEhTTaJKDS6H1cnVTunznIxs0Qz4c9pHD
 SBcEavmFDUyvSQ9xtunfez9X39LHauiYWIXHTxZd8vC+KMZaCSKb+Nv+7ud1Wyge9sTl
 ROiFV7R+sf7bm5lwBUz93TjLSGhDmWzBsdxdWc+lc4aoWKFo16jlUlmQOF8ZA6jR3XGD
 8PfayTR7odFDdTdGD3rDlqt/x1Ekecn6Wf7I7yEBVK54K8H7jLEqcfc5YBJ4I3a6Bdqo
 0hcFGHZhZijn6S8cXGiJcWX2mzxGUab0RZ3OwEDRSqZFZwx2Id1p9IO1ngY/A0esrG88
 gD5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBIf55Hog8JsnFkSCux5ebY6Dya4nzTfqHQeNQpyWlNM179MQ0/muSeDIj8rC6gznJcZ1VgOTCIJs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAYY47/vXJpEI3dAwRVqjDJ17fPLMew2DKw5b0AnWKUFpIUpZA
 J/Rzp70JvUkEoFcaakkTdsjTQ8zuyxWrZ41vObBSrdN9AmyocS6P
X-Gm-Gg: ASbGncuRSYne2vz72yEHSLJ0Imajs8Ew8AhM2pPhMbOkTARA8TrrA47h3A/aG5IVD3M
 YeUNiJJbate/YLIjqgJIgX/gxUFCqvgY3zbQg4SvWT0By9be2B4wylZSgdhFUDN1lnaNB70IpsA
 gJVWmroeWq7H0t5Zb51uwpZjUosq+wYVW2aWCLHwpl10wwBX53qI169EWcz7Z/9jnGBzE2lPfCQ
 IdFvB4oMaTMHG2Giz8hnsX4gRZTMBs+NJR5Y6tDvhW2ybEb73nEW8XVlszO7Y4RKN/SVpn+DSlR
 ccuuQg2ImSKjGhvlBYLWBo7mFOaezVzU0Unx+V8VCp20bKQEYYpDgA==
X-Google-Smtp-Source: AGHT+IGgjSXe5IWtLluH2GntJzwOjsy2WB5Lo1pm3+iVVmyosyR4TtTS+V3H0VrRqIoq/Kv9yfreOA==
X-Received: by 2002:a2e:a544:0:b0:30b:c91d:35cb with SMTP id
 38308e7fff4ca-310499b4aaemr33720081fa.4.1744651630766; 
 Mon, 14 Apr 2025 10:27:10 -0700 (PDT)
Received: from PilotMainTrash.lan ([178.34.180.83])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cc441sm17806061fa.35.2025.04.14.10.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 10:27:10 -0700 (PDT)
From: Alexander Baransky <sanyapilot496@gmail.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: Alexander Baransky <sanyapilot496@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Visionox G2647FB105
Date: Mon, 14 Apr 2025 20:26:31 +0300
Message-ID: <20250414172637.197792-2-sanyapilot496@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414172637.197792-1-sanyapilot496@gmail.com>
References: <20250414172637.197792-1-sanyapilot496@gmail.com>
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

Add a DT binding for the Visionox G2647FB105, a 6.47 inch 1080x2340
MIPI-DSI CMD mode AMOLED panel used in:
- Xiaomi Mi Note 10 / CC9 Pro (sm7150-xiaomi-tucana)
- Xiaomi Mi Note 10 Lite (sm7150-xiaomi-toco)

Xiaomi likes to use different panels in various revisions of the same
device. A factory panel even can be replaced with another model in a
service center.
So, the power configuration of this panel is similar to
some Samsung AMOLED panels, e.g. samsung,ams639rq08, which can be found on
other sm7150 Xiaomi devices. Even though Samsung panels weren't used
in sm7150-xiaomi-tucana and toco, the described voltage rails exist
(confirmed by schematics of the device).

Signed-off-by: Alexander Baransky <sanyapilot496@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

