Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA90B5F7844
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404CD10E105;
	Fri,  7 Oct 2022 12:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24ACB10E0F8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:49:59 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ot12so11148077ejb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 05:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U/DGi9HQh/INO76ufx6qo153czghX5f9wyf4yTlgdnU=;
 b=aDPiK9wgDuCz4iykhw/dpIIa1iCJJIzfjVwFJPE05jLGwbOb5Y9Jbi7xRrJ0kFvAM+
 98DH35bLCCPbb1e+/VgtbQ8LI7kSQMlcv5xVOekSPdapMDYrkz7wPGujvri5ib/ySiXj
 VsfZykt2TboOSqvJMQ2/MqZmVM0cn13QoXKGy9U31p0sxTavg5vPRwdD89hf1tSNCw8a
 sHrNaSx61u8KPf03hPcVluNJo6QoWfp7ZxUE9x554yCb7XpN/Ds9+elOSdJTv02BPxv1
 b2ZBrpI+RSF2egeWZF/DF/Kha7O049hgBhmEWkVkXhhhjqt021cLCOU33PhU5vwAyZHH
 XcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U/DGi9HQh/INO76ufx6qo153czghX5f9wyf4yTlgdnU=;
 b=M+bp83xBd4rgQHyYJpAygxX/T5H7T8WlD+BhbPDT3A7afreDtMWDnhKpPFBIWpGVXB
 af2r1WVbFfrNIRc6WEQ7wwJMsYHzLWi6yWFdlT2YNoGOc0kDWvQHltsyXwIN6zlrLZNi
 hEgAUIWSTk3xhb9tks+QyP8rksRUA1Byfs1uhyl5Pa5+YVikXQgYmYM2mXBzFr06E7hB
 tc2LmAxHj3C5LMFvIDARl44c3PTrHEzzhguKtC6bH0dzrxm+Fq+8a+D8eEASEwEjBl+M
 xsUzVp1emKD/ReQNhPSiLIqeniRfjYLLNBMbXoY8kWjlpTVaJ89wYHM0yjcmLX+A2bf2
 phfQ==
X-Gm-Message-State: ACrzQf3Eho+Hyrh7/JGbJmJu1WaVIyFrX28HlJEnJg2hAC4ulCoVIoyO
 Cn7miwuXRavqXqWmoBvIfsU=
X-Google-Smtp-Source: AMsMyM4pPVMkGNTzw9EHjcedFTuvHCXHVwUn1M83nCd/82dP2yu3uWlCgG662VxDuaHMUllmScMb0Q==
X-Received: by 2002:a17:907:9603:b0:742:9ed3:3af2 with SMTP id
 gb3-20020a170907960300b007429ed33af2mr3886671ejc.510.1665146997436; 
 Fri, 07 Oct 2022 05:49:57 -0700 (PDT)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05640243c900b004573052bf5esm1424166edc.49.2022.10.07.05.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 05:49:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 3/7] dt-bindings: reserved-memory: Support framebuffer
 reserved memory
Date: Fri,  7 Oct 2022 14:49:42 +0200
Message-Id: <20221007124946.406808-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Document the "framebuffer" compatible string for reserved memory nodes
to annotate reserved memory regions used for framebuffer carveouts.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- use four spaces for indentation in example (as recommended elsewhere)
- add explicit root node
- drop unneeded quotes

 .../bindings/reserved-memory/framebuffer.yaml | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
new file mode 100644
index 000000000000..05b6648b3458
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: /reserved-memory framebuffer node bindings
+
+maintainers:
+  - devicetree-spec@vger.kernel.org
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: framebuffer
+    description: >
+      This indicates a region of memory meant to be used as a framebuffer for
+      a set of display devices. It can be used by an operating system to keep
+      the framebuffer from being overwritten and use it as the backing memory
+      for a display device (such as simple-framebuffer).
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    / {
+        compatible = "foo";
+        model = "foo";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        chosen {
+            framebuffer {
+                compatible = "simple-framebuffer";
+                memory-region = <&fb>;
+            };
+        };
+
+        reserved-memory {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            ranges;
+
+            fb: framebuffer@80000000 {
+                compatible = "framebuffer";
+                reg = <0x80000000 0x007e9000>;
+            };
+        };
+    };
+...
-- 
2.37.3

