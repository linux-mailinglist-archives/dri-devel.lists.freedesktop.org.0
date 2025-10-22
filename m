Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538A7BFBE8B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 14:47:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C4410E779;
	Wed, 22 Oct 2025 12:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="P+GII8mA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B2D10E779
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:46:41 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-782bfd0a977so5045442b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 05:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1761137201; x=1761742001; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A50ivLTFfIL5rLTOAdlo5avQWAkkIMfNPchxjnbv+ts=;
 b=P+GII8mASevjeciYWtyMapggM3N2L+Fz92JpHAGHhYR+tq2Ilpv9WonX9YfrPPX2iY
 0dLNTSxj8v9IvYSrQ5JIabZR5J0JTLTwOsMIE2tmXvCk/MDj9ElsB1hoqtKuqoFRLcpJ
 EFsycWegfSR5pe43pwNGityu3DC0G6tZiJN4VbbngogByO6SsiJrSikelVIP7qN8AlRf
 cY2CT5t282tRe2ul0WQk20G9g+5bqrwGlpLmrcRC2AsObJw33ADY93nwoOwQBQnup9TQ
 +FH6itwIa+/tb/fUGvsbM8EywrIjk1ANzdasaVG0ZT0f+DE5ZbGMhj0HBPO8GfWacbaC
 0aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761137201; x=1761742001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A50ivLTFfIL5rLTOAdlo5avQWAkkIMfNPchxjnbv+ts=;
 b=CFDxgz4IcUMokGVRQa3mAu564T6PAKrsr/SXHjt4t8scET8rCvFikTpqSRHgziIbIZ
 kBoPRZvTdOhDlUuSHreVtF8IckhZatrfGWKBhpdNINxuwHTu03BskeqlKvHEZDbBlgVm
 cQxyZ7PrrO73aZWOoZa8TynXoMcT1CEXG8JaiQaH7R5RMKAVOOEismyqRGHgLJxBfukW
 ZQLrDWO8smybVXt/HrzS9PXN5Ked6xXL9bl/YeLosv6aY3RTbMzuj2tmhcyp+BsWXqV7
 psrOejvzLMGkm0+OkNWJ467THqe5eg9z3qeU4HcA0Lg2nBcNw9JcTcFHglavC4ur3qOL
 zbxA==
X-Gm-Message-State: AOJu0Yyzy/VzOOa8vanJ15boPVxc2YRIz/e7JRTMYGt2mqXt6LmyrTtP
 2/lfSIj+gu2TLUwQPKJnDJ6Gn1wn4mtrZcgw3b6kst3x3TOGTZHyKrtNk6B7YBphHRk=
X-Gm-Gg: ASbGnct/KwI+qzyf/RbGqBVD1ALuqWbdQ/9IupziDJlLqNJn5PSUkm7VJ4f24OtwCib
 2p3LFk4IueQ1LSIVxOtIlPqkBBVvVPFNWNE8SksSIXeJuE4Hz+c6rr+/ObLX60I8oyYITKlqyv6
 xxEaYp/LNcFldnyM/VkeMfQc9PKQdhqqp/HZQFzD/UMkyus9m7IcbnszbQYYgUamEnGoBILgfH3
 5VlZEUt2ggnUiOMOqTnyoGwI2VNEbzmtpZW/Vk35srhiiloRYrGYQj64/lzoZTRoKGUg8ga0LEr
 vDH+Slk5x28MFCqTuBmg5i4LT/X3x5fy0G3yUUnDprSt52TYL9JiswW3YcM0+itmMvqrOho7HtH
 +hfVbuSeONGUKoaJSBiHvAFwVLIAkNXwaxqJBREaTCsQv+wL1WBi7l/yO5Cn/7u3IhB12Sif0rZ
 +I+oJfNtKUTHCEFED0UFsNBz22VnT+fq1zLi91S9/B3PQ/jvgyhomIa+b2Ew==
X-Google-Smtp-Source: AGHT+IFShKa0+/lbzXoLsCR0uN15Uq+d2ftAkvw2Ky3lzofYQm99g+jnMJV5beGBG+hMOWHlqbHTXg==
X-Received: by 2002:a05:6a00:2182:b0:77b:943e:7615 with SMTP id
 d2e1a72fcca58-7a220acb8f1mr23954246b3a.16.1761137201007; 
 Wed, 22 Oct 2025 05:46:41 -0700 (PDT)
Received: from dgp100339560-01.huaqin.com ([103.117.77.121])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a23010e25asm14363935b3a.56.2025.10.22.05.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 05:46:40 -0700 (PDT)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/2] dt-bindings: display: panel: Add Tianma TL121BVMS07-00
 panel
Date: Wed, 22 Oct 2025 20:46:27 +0800
Message-Id: <20251022124628.311544-2-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022124628.311544-1-yelangyan@huaqin.corp-partner.google.com>
References: <20251022124628.311544-1-yelangyan@huaqin.corp-partner.google.com>
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

