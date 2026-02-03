Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BY3EaKugWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:15:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5E0D617D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 09:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3EF10E578;
	Tue,  3 Feb 2026 08:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=reznichenko.net header.i=@reznichenko.net header.b="HaeWY+E1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF4310E53D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 05:41:29 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-823210d1d8eso2671171b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 21:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=reznichenko.net; s=google; t=1770097289; x=1770702089;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yEfiSIftUOQSLeWOpxZiWd1+I6rz5yVYKhg8cViyxSc=;
 b=HaeWY+E16N0DlCILXKqrlG95z/tBWXVcQJE2Vkb2lUbM3wV3nBRwoCOd+XNZUmN974
 A2HsOLukYAFXd31i/9ac2QdbY0Qr4YcWWlF18oaSxj6u179yq+fkBIQsDWgf23TQb5fm
 ZRoMGB5URbgZC1li1PpXnCkX7yHZJgF0wjO+sHdfqJlcTovcYLA6OtS8ojuO3mFirnsv
 vnb0BDXlTcD4YbjIhs24CaQ7aMyXW1n62+gFH3YkFpT9FL1MUHxqJ/4GTIsdGcy5lbO4
 CCbfVifu0JXUoNOn1LpmluBw1+fa42tlgb85R28BwW9FsR1jBYHohlKkxn4Trw1VGIFm
 6ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770097289; x=1770702089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yEfiSIftUOQSLeWOpxZiWd1+I6rz5yVYKhg8cViyxSc=;
 b=iR+PH7ChcB+bOfULchyCpuTpMn8dchkOLdbiy/9a5zz2h+livyNb+haDj3F9BpAUVL
 QCoIOoDnTD8A0GCntnLMAq+6ntdj5O+6pG2iTnuJI+XeUJnoWJWhJ7+V5ZYUQEB7E2Ys
 PoSJ2bybmZLVTzVPmZkdehbSi3c6v23q15zL491HP4BlYH349iu4J7rjk69meI3RjmjW
 /9aE1rd9A4IqnF2i7r4HdVg6WN4hoY3YJ3rLZ/EaNTyBZOqlkcKNcsYeRxqSaytUdT0Y
 leruq0DVofaz7xoljzbTZssvjtkxYeg+r0MZRY0sV7rxqNptKksV4bi8s9iRLhm3iYa8
 0KVw==
X-Gm-Message-State: AOJu0Yz6/KOTQ/CQmUUEuJQB9ngqwYLlmLUdr+KE6GqYY/EINdF/qswl
 153/hKeXRNs0+yHJ17oeN0nOwzB4FhnIk8QcHh61qoqbfUoWwmGCpYHl8LMD/gN78/c=
X-Gm-Gg: AZuq6aKQ+3wh7U1xOhtCmPotYMZ027fEPL1NCyyAbTOfLkTawkHWlRNEdejXDALABLC
 rz/8yr91YzpSRv11ZaGKqhZ9mZVvpQqe4FybVve749BBuUh/8lJd3HX9lo/I6ABihIJBGDGSMbs
 CikgTuL1CELq1UbUsA+/M0ahHYlUOfgrWzZR8o4+yopBdP/URXq0WgCKTtNglrru97Y+5tS2jDA
 RTB3ZXFbYPmcUnHPYuaTATh1yryG5Q+BppG2rXeMKOtEb18S8q3tWf3MiDBJfuH6TIizZFqAEKX
 KSA7soWa9fCfIKGIVxRKMOmodJbfZNtNnY8xeE11/2bqbziXfvNwS0+z8vwrBuqgv/8SFD4A4N+
 C0/q2QFZMQvHLyYXmMd3Cp4oZbODT4puC3o+8EgeJx9tlyL6joYWEfu53eU6YNt4IXC2LFDgNsP
 V1V8DuQGSiSY4JO3EeGA==
X-Received: by 2002:a05:6a20:7345:b0:38e:92e1:e8d with SMTP id
 adf61e73a8af0-392e005a2b6mr12969136637.30.1770097289159; 
 Mon, 02 Feb 2026 21:41:29 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:361d:bbce:3ed0:c3b6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6427da845csm16051669a12.12.2026.02.02.21.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 21:41:28 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: display: panel: Add Ilitek ILI9488 panel
 controller
Date: Mon,  2 Feb 2026 21:41:19 -0800
Message-ID: <20260203054121.335441-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203054121.335441-1-igor@reznichenko.net>
References: <20260203054121.335441-1-igor@reznichenko.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:15:23 +0000
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
X-Spamd-Result: default: False [2.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[reznichenko.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mani@kernel.org,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DMARC_NA(0.00)[reznichenko.net];
	FORGED_SENDER(0.00)[igor@reznichenko.net,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,reznichenko.net:email,reznichenko.net:dkim,reznichenko.net:mid,0.0.0.0:email]
X-Rspamd-Queue-Id: 9D5E0D617D
X-Rspamd-Action: no action

Add binding for the Ilitek ILI9488 panel controller which is found on
the FocusLCDs E35GH-I-MW800-CB MIPI DSI panel. Add "focuslcds" to
vendor-prefixes.yaml as it's a brandname and a website for
Focus Display Solutions, Inc.

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

