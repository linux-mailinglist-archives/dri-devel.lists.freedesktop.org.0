Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOL1KHxDqWlV3gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:49:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD5E20DB51
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:49:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7280710EB9F;
	Thu,  5 Mar 2026 08:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fr+je9f5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB85B10EB9F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 08:48:56 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2ae46b9c70dso18398245ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2026 00:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772700536; x=1773305336; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ux1peg+z6f5tqJpG2qb5n2Jl0YeB1bva8nLP/vG8Vjk=;
 b=Fr+je9f55pFCUKlUhS1SUUEq+NdtZvdzOegptoevVoEZiPcH5sFg6eSolhUhXiWkq1
 +VC+FGWm1MafjzhQMTlnK92gy7oRTtXQeW4lV2rlESfjjPDTcGwL3eCc6g1riZXFPGIu
 plfAE5UkIR8OjBS2qdsXAKhn8XDGdbXI/OONg2t7vUCAPtXGAx/hYc17Xn1Z+UDK3zAW
 hugpyVc3Zu8jsCBB4u0KFDJeOOQu3urEB4IMLtG6+3E/Sp+AdgysdMxpr0+hKeaSXeiB
 iFMVQ3dt90ME3t0y8u/RgdPlkEcHIxKw+k7Vx/JHen2PJ0FJTTFynqTbsXc5HOFaL5+N
 zZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772700536; x=1773305336;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ux1peg+z6f5tqJpG2qb5n2Jl0YeB1bva8nLP/vG8Vjk=;
 b=nZs1Ze5M063qmOyzmpA6yWEttaMLJ+ZgxKo6q5wA+X97N/wO1okrNsC6/OGTZGE+BL
 j/1CAkNs3PI42GXz8cSmpeFRd0cnYTq1Pc8UepLp8FWZTV/zrXXnTL0M7uNxA6c8fWxS
 PWDCzRtTj7y+dLbiscO8EtsrrVfwsgHBpCd+B3n8k5l59iAzxweQirYvNRt12ST9hLpC
 8hpl4IQ7gJej8ssKsp4RlEj2h7BsTbt/2FLyIuymA/Fwz4ANpQUhdbg3dD3d/VKr+0Ry
 bVbvsAC/J2imD2cJP7QEmYFQhRq4F9WS2dZNBzh8Y65ImsMDQYjvGUdvSwLqG/gX7f/P
 dwcQ==
X-Gm-Message-State: AOJu0YzV7ZRB7QWiiMEaeQNkv6ozFaMjCZ8xGSUn/hEIZ05wJxLeQzvt
 bYyQFBtx3vmmrZ1X7yjychl8PGjHl4uObpUyJTxKRGxUsf4g84jqUioc
X-Gm-Gg: ATEYQzzMbCrLnR2PgcK0LJPWBuBD24W7O3n6KfoniFBC8OfTBwwNUx5AgxP5h6iv/yh
 oeuIkEu2b9vbd6cQYmmZFic9PU5lrwI2GbbqZ+FgD1M7C2PJcehgfszfhNoZvYtElmoS6GieOPC
 WeMrSHuXEDHrS6a9n7aFgUrZ5ErsAti+roKsJpR8zkaD7tap6hb52AeYJ7wuaBo32WtOCu7KEN4
 /gA/oJ/GRX605Qdz7VghfLtqpLShxNQTTGxLJi/gRr/xpP6lkWHlOli0bFTn6xlN2QMmtCosQHZ
 ETLmhIwNqLwhywxymTGBGPf/sG8CZ6wotpx65wPjAiKa5a9bLDW3ubDxa1+v5rZTv7q7jQaPlQA
 hie9MXrLM7j/f27ssttjaU8vZ4ZCWR0/bBOGPhRNkNnJMyay1SQclCvaVVINRR1YK/Wudzjf28/
 anC8eOp7t/s/MVuWwatQ==
X-Received: by 2002:a17:902:d54f:b0:2ae:46b9:c643 with SMTP id
 d9443c01a7336-2ae75b51d60mr17109585ad.7.1772700536198; 
 Thu, 05 Mar 2026 00:48:56 -0800 (PST)
Received: from nuvole ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c9f79sm233490715ad.33.2026.03.05.00.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 00:48:55 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Himax HX83121A
Date: Thu,  5 Mar 2026 16:48:09 +0800
Message-ID: <20260305084810.370024-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305084810.370024-1-mitltlatltl@gmail.com>
References: <20260305084810.370024-1-mitltlatltl@gmail.com>
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
X-Rspamd-Queue-Id: 1CD5E20DB51
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,0.0.0.1:email]
X-Rspamd-Action: no action

HX83121A is a driver IC used to drive MIPI-DSI panels. It is found
in HUAWEI Matebook E Go series (Gaokun2/3) with BOE or CSOT panels.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../display/panel/himax,hx83121a.yaml         | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml
new file mode 100644
index 000000000..b6bcace29
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/himax,hx83121a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Himax HX83121A based DSI display Panels
+
+maintainers:
+  - Pengyu Luo <mitltlatltl@gmail.com>
+
+description: |
+  The Himax HX83121A is a generic DSI Panel IC used to drive dsi
+  panels. Support video mode panels from China Star Optoelectronics
+  Technology (CSOT) and BOE Technology.
+
+allOf:
+  - $ref: panel-common-dual.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - boe,ppc357db1-4
+          - csot,ppc357db1-4
+      - const: himax,hx83121a
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: phandle of gpio for reset line
+
+  avdd-supply:
+    description: analog positive supply for IC
+
+  avee-supply:
+    description: analog negative supply for IC
+
+  vddi-supply:
+    description: power supply for IC
+
+  backlight: true
+  ports: true
+
+required:
+  - compatible
+  - reg
+  - vddi-supply
+  - reset-gpios
+  - ports
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
+            compatible = "csot,ppc357db1-4", "himax,hx83121a";
+            reg = <0>;
+
+            vddi-supply = <&vreg_l2b>;
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    panel_in_0: endpoint {
+                        remote-endpoint = <&dsi0_out>;
+                    };
+                };
+
+                port@1{
+                    reg = <1>;
+                    panel_in_1: endpoint {
+                        remote-endpoint = <&dsi1_out>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.53.0

