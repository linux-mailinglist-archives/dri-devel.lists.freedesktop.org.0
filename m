Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95537966C16
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BC110EAF4;
	Fri, 30 Aug 2024 22:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SBt2gSx2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FBB410E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:28:39 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-39d30f0f831so6920785ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725031718; x=1725636518; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LqHvmoCIARVNpToj+eYuwj+OmsqaSf4MJ85C1291WbE=;
 b=SBt2gSx2x8U7IP103NOryiJDUJh5MHvptgrLxtBtWQHw7tQfZquIujiORqUAkCY+Fb
 Qs9YZcohx1Vn5L2/ffBIxRDIfEP33rNB6Vd7V2uQIrbfTAauuSYMPnXF7aklyJw71VOB
 /cbdgmiYML4t+yJfJKOol2+XSm253QnAOKZ/Tok8lHI/uoJDgRJOYVSKrT/dUjNwjWMh
 aJnEmNOBu17PQl5zKJ/zq3K3XKVobaz6w6TzL36jgACjjgcwCwXheDOoFWo0Q521roaO
 SO6WP0PDwuvZU0EW2gJCnpqve9s9Io/bRa5mqK4D2wK0sFMsTfDU9snwstEPffFzFulC
 dcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031718; x=1725636518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LqHvmoCIARVNpToj+eYuwj+OmsqaSf4MJ85C1291WbE=;
 b=ANdJpuvO3kvuk8cD1K+XLEBY+9XRnZl3xqxfQqHg/VNRC2ZSRsX03a5/rC0WatnYQI
 x8ifu3Hkaws0MbxTMaeLkPgZ1Sj/HUHuMxgZejp1QT9vjvGRJ0DKfQM0A34EK/ajQBPr
 4Hy98chOzd+XxBSReJSxd73oa5/fkViOEjeYpts/JNrHxI98fTzUcPlKZI2djB55z/e6
 rCM3Aq6NUtvJOfnP4a+eK/lw+BZ83oG9EL76pQOAAdofH4+SgAo6DtyrXUKkNJ88lJVn
 VuWq+17epuWqZS/MjuD9NLNiMwQfFwoh+T9Kq8QVr16vABGJvZyJYsMjvCtOpvRrbORe
 /Uxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEjxkHqnQEBEx1aYnnZCDl/4xq3lQVmhh9xd/rJPR7l1/mdJsnA3EyEPJgtbGQK76YFyukOFdbe0k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6yPrF5f21v6wF/eMS95ilmjSgvupIhhvDvVci+5bXddZbKF0z
 8KEla+zfaWx5KTqLt56BgHr6mgw6/ZchT7cHPCJeT1NWl/AD2UYh
X-Google-Smtp-Source: AGHT+IEVzWuJALU6+1aSVs6qiSwfELdZVdFHqAGu2Xy58PmOhzNnpMgp8wbA0kkenx3QfFsUSRnUGg==
X-Received: by 2002:a05:6e02:1d04:b0:39d:286c:5b72 with SMTP id
 e9e14a558f8ab-39f378acb8emr64917755ab.28.1725031718371; 
 Fri, 30 Aug 2024 08:28:38 -0700 (PDT)
Received: from localhost.localdomain (174-20-195-90.mpls.qwest.net.
 [174.20.195.90]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f3b05940asm8853415ab.77.2024.08.30.08.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:28:37 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: shimrrashai@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, aarnoud@me.com, airlied@gmail.com,
 algea.cao@rock-chips.com, andrzej.hajda@intel.com, andy.yan@rock-chips.com,
 conor+dt@kernel.org, cristian.ciocaltea@collabora.com, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, krzk+dt@kernel.org, ldearquer@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 markyao0591@gmail.com, mripard@kernel.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, robh@kernel.org, s.hauer@pengutronix.de,
 tzimmermann@suse.de
Subject: [PATCH v5? 3/6] dt-bindings: display: bridge: Add schema for Synopsys
 DW HDMI QP TX IP
Date: Fri, 30 Aug 2024 10:28:24 -0500
Message-ID: <20240830152825.9053-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830152132.8894-1-shimrrashai@gmail.com>
References: <20240830152132.8894-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Aug 2024 22:08:56 +0000
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

diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml
new file mode 100644
index 000000000..141899ba2
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/synopsys,dw-hdmi-qp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for Synopsys DesignWare HDMI QP TX Controller IP
+
+maintainers:
+  - Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
+  - Shimrra Shai <shimrrashai@gmail.com>
+
+description: |
+  The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX Controller IP core
+  supports the following features, among others:
+
+  * Fixed Rate Link (FRL)
+  * Display Stream Compression (DSC)
+  * 4K@120Hz and 8K@60Hz video modes
+  * Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
+  * Fast Vactive (FVA)
+  * SCDC I2C DDC access
+  * Multi-stream audio
+  * Enhanced Audio Return Channel (EARC)
+
+  Note this is not a full dt-binding specification, but is meant to be
+  referenced by platform-specific bindings for this IP core.
+
+properties:
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 6
+    items:
+      - description: Peripheral/APB bus clock
+      - description: EARC RX biphase clock
+      - description: Reference clock
+      - description: Audio interface clock
+    additionalItems: true
+
+  clock-names:
+    minItems: 4
+    maxItems: 6
+    items:
+      - const: pclk
+      - const: earc
+      - const: ref
+      - const: aud
+    additionalItems: true
+
+  interrupts:
+    minItems: 4
+    maxItems: 5
+    items:
+      - description: AVP Unit interrupt
+      - description: CEC interrupt
+      - description: eARC RX interrupt
+      - description: Main Unit interrupt
+    additionalItems: true
+
+  interrupt-names:
+    minItems: 4
+    maxItems: 5
+    items:
+      - const: avp
+      - const: cec
+      - const: earc
+      - const: main
+    additionalItems: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for RGB/YUV input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video port for HDMI/eDP output.
+
+    required:
+      - port@0
+      - port@1
+
+additionalProperties: true
