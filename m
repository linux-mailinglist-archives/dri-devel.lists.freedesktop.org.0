Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AZRMkkwf2k8lQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:51:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1573FC59FB
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 11:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028C010E02E;
	Sun,  1 Feb 2026 10:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=reznichenko.net header.i=@reznichenko.net header.b="A8I8lSMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA30D10E1A6
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 03:41:05 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-34c708702dfso1472258a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 19:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=reznichenko.net; s=google; t=1769830865; x=1770435665;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G785GoMTBphgxxOD0Z2Ym57qa0BDh5wFTX3RHKNv7Hc=;
 b=A8I8lSMbS3TtnMo/IFZmd+mgWg6AbE+U9MxGfey2DOMHFpTKJmS10atnQu34WF40co
 HG8a9XRnpXD8g8KyJddf3dmxsuBg+2+icseGzhXl3CI5hghCtpsyGPaidslQ3xRlPIOr
 gnb4KF5SZBys7SrF0yRGsNMNcYmeMV6txxPiPX/T9blQ7Q+5+YXCT5Kgik77meCqCaNl
 OXu01mf1qGe4u+pDvAbR1tvXKJ50GeFtFZbK0EgVyUYoWDVSyKxjTz6DnH/jh1kVBWtl
 TzMjDWePxsEAt954hWllx0tRBAuqKMfO2o6b0Q9w5LMW23EyTvTKxGId+koXvin/mX1Q
 7bww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769830865; x=1770435665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G785GoMTBphgxxOD0Z2Ym57qa0BDh5wFTX3RHKNv7Hc=;
 b=l9eoXhh2HKle2Hr3XhV0LhATTAVQgDtoi78oVFfeXk37R+8aQy8BFZ9LKjOKr5ccJR
 XcGpy9KObGeqhLdeiGLnWt605mkD+ZEvJj5ZduyMxeJtetYP3qfTwIUF1biXreJav1BN
 XveEG9OF08zGEaAaRqVBe9fiiN529IWOi7NW6KNiBsIa0c7Nkes3pSSPlDTInS/A+I7H
 zF79o3IgfS97wOvsGWMxu6pWvjgjFjAUpXH5fhlm+fC8LaaJdwUvuKzq80dhShj38RAB
 rSSZKELNZkeibynU/OUYPS/eJLNyhHaSbMljx4GevaETFsBDa1twtT803BEhh9Jf1ryB
 io9g==
X-Gm-Message-State: AOJu0YznBzLiIkt6eNjWyBCxRS8bLK4BclnE7rE7JlGqNTxrgh8oftjg
 BGxYi6+x4A4s5migLjr2Sv6EWoZzyTkxnlZD1dA2HcitE6QpaA8SRixe6rSpKS8tNSE=
X-Gm-Gg: AZuq6aK35wolqxN2UXrrroYwlVbVx3pjIqT+eYQ5VQLOw8PnCdXXbXpx2Fysp+3NC1U
 ACby/zeCqRvpztgBjP3EOM5iAGfKDmE38emQLlZTPyeBu2ThjNd3t4vmnynZDQONXhvelJA16HT
 hBKRanU0WX/slE5wuh8in6RN4Kb9GWrS4BL8cRGABbW+8jlOZEVp6miOtYIwOyQG5ARMxGI8TBA
 69le2F94ePgiJ0UkUXR2E3g+1zLr6Mg/HTnC9wj/ZDSwNG/c076wGxUzo3w+7cFv0e85AlUi3WC
 V1Tlsukv9FOLzBcZetE/oyjQDyymfRu1mJQBvSA6DzDRfLNgBraW/WmcNVBBEQ/eRBNsKTrMlUJ
 ho5MqMDv/K/a6AtKYkRFgE0KxVvFnRQAWvDyVtWjhcudpTXf2UAH1g5WeYo3JBfKbpCFsUFaCW4
 nwu/bbRYcbhof8RJlXTg5hctGSU+M=
X-Received: by 2002:a17:90b:4c0b:b0:340:c261:f9f3 with SMTP id
 98e67ed59e1d1-3543b33aad3mr4875068a91.14.1769830865399; 
 Fri, 30 Jan 2026 19:41:05 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:f8d:9478:bfbf:7332])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3540f3cc71bsm8986062a91.11.2026.01.30.19.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 19:41:04 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Manivannan Sadhasivam <mani@kernel.org>, "Kael D'Alcamo" <dev@kael-k.io>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Ilitek ILI9488 panel
 controller
Date: Fri, 30 Jan 2026 19:41:00 -0800
Message-ID: <20260131034101.307486-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131034101.307486-1-igor@reznichenko.net>
References: <20260131034101.307486-1-igor@reznichenko.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 01 Feb 2026 10:51:49 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[31];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[reznichenko.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[reznichenko.net];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mani@kernel.org,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[igor@reznichenko.net,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,sntech.de,bp.renesas.com,kael-k.io,rock-chips.com];
	DKIM_TRACE(0.00)[reznichenko.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[igor@reznichenko.net,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,devicetree.org:url,reznichenko.net:email,reznichenko.net:dkim,reznichenko.net:mid]
X-Rspamd-Queue-Id: 1573FC59FB
X-Rspamd-Action: no action

Add binding for the Ilitek ILI9488 panel controller which is found on
the FocusLCDs E35GH-I-MW800-CB MIPI DSI panel.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../display/panel/ilitek,ili9488.yaml         | 63 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
new file mode 100644
index 000000000000..ea7449273022
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9488.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ilitek,ili9488.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ilitek ILI9488 based MIPI-DSI panels
+
+maintainers:
+  - Igor Reznichenko <igor@reznichenko.net>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - focuslcds,e35gh-i-mw800cb
+      - const: ilitek,ili9488
+
+  reg:
+    maxItems: 1
+
+  vci-supply: true
+  iovcc-supply: true
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - iovcc-supply
+  - reset-gpios
+  - backlight
+  - port
+
+unevaluatedProperties: false
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
+            compatible = "focuslcds,e35gh-i-mw800cb", "ilitek,ili9488";
+            reg = <0>;
+            vci-supply = <&reg_vci_panel>;
+            iovcc-supply = <&reg_iovcc_panel>;
+            reset-gpios = <&gpio3 6 GPIO_ACTIVE_LOW>;
+            backlight = <&pwm_bl>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..aa3a8fd67155 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -584,6 +584,8 @@ patternProperties:
     description: Flipkart Inc.
   "^focaltech,.*":
     description: FocalTech Systems Co.,Ltd
+  "^focuslcds,.*":
+    description: Focus Display Solutions, Inc.
   "^forlinx,.*":
     description: Baoding Forlinx Embedded Technology Co., Ltd.
   "^foursemi,.*":
-- 
2.43.0

