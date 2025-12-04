Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A3CA272B
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 07:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED56310E1BA;
	Thu,  4 Dec 2025 06:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D3UHXWUY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3525310E1B9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 06:06:54 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-647a3bca834so695809a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 22:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764828413; x=1765433213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
 b=D3UHXWUYuOFmZ7QRHAG/Yv9NIH73zskEQ3NNzYclbHkr/rPvUJFhhT3/xVUuLYW1+i
 uE0mWxyz0YS82rQ0Qx2CHgoTYFsvxo0wdLah/+1rT16KeUGxMK8syor3yyocyjYHFBoR
 d0Qo+IN5ir6RVzCuiU9/cvdx5uJPxUzqmkgom/jNsjOGS0LwcgcRd+Vg8G0viQEfRPR3
 dOlfv1YHMnqyfOSl4gUGX9JBtyevpaHMLV0j2TQchb8EljLCOt3ngKA08QdgoLaFIB8W
 aCJP4lh54PRUAwj5gMUmT1tb41h9lIdmNDm+aztSBsyyG+3ve220w9OG7gy8PZ04VSgq
 G1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764828413; x=1765433213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MmVeYmdQG39CjbFRBoggArBt69tBLOMtXANeqHPySaA=;
 b=PopB4hchFOZ1V4zk0suHs1dLCWtCg5UlvStsC7cL9Q8reK3i5LhA5lnZQAB8xbCMzO
 8H8fNjt4GkoxsNYVFL3sv7mUmgMCfnoxRs2ZrlwSNC1j+FkaTgnXHlcwOnIJeTvD+bPH
 Fyhjc+QLMJPF+YunP6IFYSbJd69O+YcTi+SqtzXzIXt+2icANB32qgyO4v//0NseE3gz
 w4RbhPv9oV/K5c8nUun7pOgnwWn86j6ztM5dCQJJ4F5J2RqlwprHon5/9kf/9XUHU3mX
 /8VGcGCcoO/rQxtrm+uBwuV45NgdYzTRNBOZWP9d1hxFkjrSJdFSRCW9u7u6zyOUq+/s
 9kRA==
X-Gm-Message-State: AOJu0Yzduk2XnlOSX3HgT3bYpaF5ULkcRMjoNwnY+wYUE5o2l0VVXBdc
 8GSA+NeLuTImZdiYq1Jikg0mRCpm9q+ylajXFooKlIf7ZvWRuVac/25t
X-Gm-Gg: ASbGncuQJu4B2ka/RmDGBiqwwiibttnj5kk3Vo7Mgfutclsn2PJgqLYi9SSfv+F8H++
 9dJ2r/kMxhI4mt3vDlibifx49KRgJDjzz+Mh4Iby4+qWx49N2onDzkY4lfAwOb4FPRqt7DWYwmL
 OnWbTWUpCbedNlYSvZzLqCe0kRou/FRdDsNFVwKALXYhgQ/b+kgCRV9vuYwYQpDpjyX+Bp1qmx6
 cVEL2RWrRUC6bPsj4cgSp6Bd0izAwM8ESm4Zw2+5nPQ9UOhIv+AQQi1A2QNZopQVaYqdEuTfcVV
 qHb7dV2XuajYXFb+Bmv4HaVq0ncfbqDeI1TaUsWR5sTlFZoTp01r57o3PasvyAqcUZricixDMKq
 96wPYyYojOz1wnKrQ798S7Q3DTBoqn8ARUjTAzwSWYzcw8IueL1L4+Zq+DZd8rJwEnl6O7p0J9/
 U=
X-Google-Smtp-Source: AGHT+IG2uSp5m1pwmGBSyOtq4zqTrB1e5ASqxEmOOTHWvBiYa6jbXWwGQOIFNWn9z4op7aDbh7fbwA==
X-Received: by 2002:a05:6402:234a:b0:646:6de:a09f with SMTP id
 4fb4d7f45d1cf-6479c4475e9mr4164767a12.2.1764828412441; 
 Wed, 03 Dec 2025 22:06:52 -0800 (PST)
Received: from xeon ([188.163.112.74]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ef7798sm460296a12.15.2025.12.03.22.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 22:06:52 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Douglas Anderson <dianders@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v3 1/7 RESEND] dt-bindings: display: panel: properly document
 LG LD070WX3 panel
Date: Thu,  4 Dec 2025 08:06:17 +0200
Message-ID: <20251204060627.4727-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204060627.4727-1-clamor95@gmail.com>
References: <20251204060627.4727-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

LG LD070WX3-SL01 was mistakenly documented as a simple DSI panel, which it
clearly is not. Address this by adding the proper schema for this panel.

There is only one user of this panel binding in the mainline Linux kernel,
which is the Nvidia tablet Tegra Note 7. Its panel is broken anyway since
it cannot initialize properly if the bootloader does not leave a
pre-initialized panel. It also cannot suspend or re-initialize properly,
since no DSI configuration is set and it has a loose regulator which
relies on an always-on property rather than being hooked to the panel
where it belongs.

Tegra Note 7 device tree is adjusted as a part of this series.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../display/panel/lg,ld070wx3-sl01.yaml       | 60 +++++++++++++++++++
 .../display/panel/panel-simple-dsi.yaml       |  2 -
 2 files changed, 60 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
new file mode 100644
index 000000000000..0f0b9079f199
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/lg,ld070wx3-sl01.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG Corporation 7" WXGA TFT LCD panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: lg,ld070wx3-sl01
+
+  reg:
+    maxItems: 1
+
+  vdd-supply: true
+  vcc-supply: true
+
+  backlight: true
+  port: true
+
+required:
+  - compatible
+  - vdd-supply
+  - vcc-supply
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
+            compatible = "lg,ld070wx3-sl01";
+            reg = <0>;
+
+            vdd-supply = <&vdd_3v3_lcd>;
+            vcc-supply = <&vcc_1v8_lcd>;
+
+            backlight = <&backlight>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 9b92a05791cc..f9f1e76a810c 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -42,8 +42,6 @@ properties:
       - kingdisplay,kd097d04
         # LG ACX467AKM-7 4.95" 1080×1920 LCD Panel
       - lg,acx467akm-7
-        # LG Corporation 7" WXGA TFT LCD panel
-      - lg,ld070wx3-sl01
         # LG Corporation 5" HD TFT LCD panel
       - lg,lh500wx1-sd03
         # Lincoln LCD197 5" 1080x1920 LCD panel
-- 
2.48.1

