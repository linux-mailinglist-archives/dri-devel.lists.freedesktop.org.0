Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CeAGNf3m2mp+QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:46:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12DF172521
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 07:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D6810E247;
	Mon, 23 Feb 2026 06:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T3tRJmS9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5407410E245
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:46:41 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id
 2adb3069b0e04-59dd4bec4ecso4048202e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Feb 2026 22:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771829200; x=1772434000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baeC+X5Nfr5uKMH7xDmpR34MeVXwZFkQ6W3X0tbDjB8=;
 b=T3tRJmS9DEARhN67aCijMfORZfILjOKKrvkTKwXv9GVnrlHmoH4fU/q9jg4ACtucWG
 +7hUwsNuYPK72azjwb5d6dT9HZ0Fg+M01242MxhDpRmP0h1cIdQZ1bEf/GFrODgdnUri
 EqdZFIYmVY7IsIM7/s2TemPla5k8xp882OMkrCJZ0hBVfj9BV9mIIbPfwXS6+Ftxe3s2
 w2VyPTR0BJ73arSXEJ1GQP3aAsJ3NkPpioVQ2GdBauIZP7OzzSlp7pu5FYNXFR/zhLq7
 OanT2waPVST9sZ7b7uQqB8iI6eh+QZrWAqBKmPMgGNMS3DnXZ4LkYsI13Kcnpq240+dN
 RN4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771829200; x=1772434000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=baeC+X5Nfr5uKMH7xDmpR34MeVXwZFkQ6W3X0tbDjB8=;
 b=N7zGB6gXWJd88Agos3IV5UHt7ioHr9Wby0MfXz3XfR9BPpE/8gETkHjOe0TDAuUvs/
 n9oV+QSWoudEoeoxt0U7Lj/5AFuluYT5oA1KF+vQMNhmt6R9s5yJJ26rJhvG8sIN9NQ2
 rsqzJNjYjyEYfR6sbFuTxR926FbbfFWExCNYdw0OKa8MvsXQWLkJL7mgIe4JJOnWkiY0
 AQsLoVrceB4Ju7js6FkPqmg29E4E4WkVhsUEBpC2B8/r96EHHyb5FCco3YW+c7sUz18A
 fF/MUtxiPzaGAVuyQwYijgYO28joSXG62zkWSuWOSEUO0cs+LxdnNGI5Q3b6BK3U+tFu
 1OkQ==
X-Gm-Message-State: AOJu0Yw4movtVHs9Dxln1D9I9n37Er5pCLvx+RIN3Em9RHAPISfmHJye
 93JB8l5Herz7gW4KaRpVHB5Tb0xPHDOwSRwJyk8YuOiMLlQ3KX8EBSLL
X-Gm-Gg: AZuq6aLFdaml5kjGmrZr7FTgdxvNX2zEc2S59k3JaEVU23cW3qBv9p6P0OToPxaCrfC
 RqO7ZOGhWkdTp/5Uwkjsbbj+LGUWy/5M4DF/MTnzRFFEFJbCY70cG7AXQ2lIxXczu+d0YLRYATi
 /upBdHzQZSoYBw+sjTf8EflYpxcPh/umPiZD635jgZbdvXGLH+C3k+Ji7SeJ8HfM+w+1b+esF0N
 bWhFmArAIQWe7iXLSkOnjZUwThvNmbUIRpotKDS9nzMI8bcbHziOImS2oZ+fpNGfXUBj+qXEIFS
 r1aqYuWVLgFQH2KaX5b+56TpMQVKtjWFOnr//1lLAb9fzqwNf6bVHYvp/JSCmVslucr5fLQNx9W
 B/GECOgXPBqfy0n1IM1Fb1UTvhH3lnCZcC6yFGep7vlWJZdZSqH4U5251lsQZKsddRbb1jRzj6/
 EVyVza/wgorU8j
X-Received: by 2002:a05:6512:a83:b0:59e:62d0:2ad3 with SMTP id
 2adb3069b0e04-5a0ed9baa65mr2203028e87.43.1771829199434; 
 Sun, 22 Feb 2026 22:46:39 -0800 (PST)
Received: from xeon ([188.163.112.76]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb0b89asm1386201e87.2.2026.02.22.22.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Feb 2026 22:46:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: display: panel: document Atrix 4G and
 Droid X2 DSI panel
Date: Mon, 23 Feb 2026 08:46:29 +0200
Message-ID: <20260223064630.12720-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223064630.12720-1-clamor95@gmail.com>
References: <20260223064630.12720-1-clamor95@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: D12DF172521
X-Rspamd-Action: no action

Atrix 4G and Droid X2 are based on a board called by Motorola "Mot" and
use the same 540x960 DSI video mode panel. Exact panel vendor and model
are unknown hence generic compatible based on board name "Mot" is used.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/motorola,mot-panel.yaml     | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml b/Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml
new file mode 100644
index 000000000000..99fa1b3ed426
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/motorola,mot-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atrix 4G and Droid X2 DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. Exact
+  panel vendor and model are unknown hence generic compatible based on the
+  board name "Mot" is used.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: motorola,mot-panel
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator for main power supply.
+
+  vddio-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  backlight: true
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
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
+            compatible = "motorola,mot-panel";
+            reg = <0>;
+
+            reset-gpios = <&gpio 35 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_5v0_panel>;
+            vddio-supply = <&vdd_1v8_vio>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.51.0

