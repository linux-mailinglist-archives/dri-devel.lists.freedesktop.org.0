Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F1BBE2813
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 11:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A69610E9A6;
	Thu, 16 Oct 2025 09:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="qr4Z782i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACA110E9A8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 09:50:55 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b5f2c1a7e48so345848a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1760608255; x=1761213055; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C8lwo5+QtTg4leMDK6YabJ0+AataBKUrh7WnXyXZEVc=;
 b=qr4Z782i3Hc8xLOpJYQG74yt+aYQ9U7Pdh9dXdvaD2VAISq8DeSZQCjTMkLv2knJD9
 Yct2y8Wlvfwl9Sl80u0Ut26wa1Mb7sW22fL9Kh1djJ8nbfAkFLMquI4ar/bKskQfcmob
 ZFXAFfM4/l2KoLJRKHHf/QFQJ3Un6Wpjt9hti2ZtM99OPV6yjhs/u8GmDdjAWc/PHY1k
 /gxlM1HDqCfoNpbvGpWBxWb1paHYYqL44LqGsx6Eb7qAT4xW373DuNaIAxYXl+r3JVN5
 s0+PlxK2dnFN8njZVT6s8PlFI70Z6Md1djcYeY9h7CHEMY/0EBV1r0Fa3EKq54DWCAdv
 pzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760608255; x=1761213055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C8lwo5+QtTg4leMDK6YabJ0+AataBKUrh7WnXyXZEVc=;
 b=UEpazuwjVzGEKJ+Ht4Q5rb4fbut9C9IludN3w7rNj6AhyOHgjL/jupqiKL9ItW66Mc
 Fj7jPivb3Bw/qH7lhp66bFO+H2gF+RDPMndy1hC3nz/vFvYbmUgO36sHKSQb3yrfyf1M
 uQnBtKUbJ06pDXLVBY81kVL1P6Yq8/WiIDDOqhLL4IphyF5OLebSKeGs/cpbvwnSs3r2
 aW3/Y7l0qE4IX2Nh8CS8XHlsjZ4uSu5wbG3VWqdQrYX7p1ec/IgkVwK9vjZJRSnVmm9O
 d68ciMzmQrgPxmQ5kAF5jq1/hBuoqlKHagJ9R0bI9vh3W2CUZqNYZh17+skP7nuPsrnQ
 q8ig==
X-Gm-Message-State: AOJu0Ywul2ZdTcDn/hvmG3oo8TNQJIsOwprUr0sl1sMAceXHTURMH4F7
 OitCBDXH3ngzJaKmRwXuHNVHIHe8uhj56MnLEgQbo605l+1VTSRfOu7NS19J4Our3tM=
X-Gm-Gg: ASbGncsc2m5Gd5EHcLDO5pRW1eMyzjYwvwp7CHEIu0KCu90AMJYiFXQef79bDt4jQs1
 W/+84SB4jHg5tK+AwlBg6m6K/S7DReF5wV2+4Ev5hwGKou6Joa6/EXWBeI6jnzmyEB/QLG0DNxm
 jDZsfYr6wE1TbPreGZg3B/1e5jxr0pF9cQiS7ZjWHa4KXDO5ziww/xdZBHieJVKAFjzvTavz3Bk
 DkBDDfM6Et0pQ1+9/X08VRBTojrDyF37I9dLJn84pdgAXpIZX6bNo+PqSmwcditl5zFb2hfFUGB
 jVjrKa1ekpmHSKFRog4RQy7ZqjtfjW3+vdKy/2lCHlfud69KJQfo0yGVd3GTCTsateSzUUPt7VP
 WCdxVHVoSegDl48vLxHp71sRzsG8va2gsCDTvlpe1IgVAVtWoQ2AQmRg2xdHaaJZ0g9vA/3u8Ee
 Incgz0nokmsNFa3daIsW2f4DdHppNMIUbLKFCPntPBa1kzeiE=
X-Google-Smtp-Source: AGHT+IE9vLrAwDLQcz+0U3II8DUCaJP2gPK7bJaQpcbKO5SQlykPmukNz62SIYwsb4GaeEmergo5nA==
X-Received: by 2002:a17:903:120c:b0:26c:4085:e3f5 with SMTP id
 d9443c01a7336-29027391377mr374826855ad.50.1760608255266; 
 Thu, 16 Oct 2025 02:50:55 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33bb6519421sm1272402a91.1.2025.10.16.02.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 02:50:54 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v3 1/2] dt-bindings: display: panel: Add Tianma TL121BVMS07-00
 panel
Date: Thu, 16 Oct 2025 17:50:42 +0800
Message-Id: <20251016095043.1694736-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016095043.1694736-1-yelangyan@huaqin.corp-partner.google.com>
References: <20251016095043.1694736-1-yelangyan@huaqin.corp-partner.google.com>
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
---
 .../display/panel/ilitek,il79900a.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
new file mode 100644
index 000000000000..4e3c5afd4584
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,il79900a.yaml
@@ -0,0 +1,66 @@
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
+          - tianma,il79900a
+      - const: ilitek,il79900a
+
+  reg: true
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
+            compatible = "tianma,il79900a", "ilitek,il79900a";
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

