Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6988C606D2
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 15:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AF210E2A3;
	Sat, 15 Nov 2025 14:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="d9ndfBFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 722C110E2A3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 14:14:20 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b73301e6ab5so387803666b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 06:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763216059; x=1763820859; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JphR/yfHrqeoxGCFuZ74qbjmgj/bPrWp2+gxF4BO3oE=;
 b=d9ndfBFIIQjU/CE3oweoygqayyPmW7QCk5yAPM3hiBPNRxnOBZ5HFsbe+3pE3kIpZx
 0MshiCChcYvYQtdQpW7leZQYYarpZACCkM3YNW2Wk7d27p39saU+b7xf9B0GhHzP8chw
 h+I1P9WSXJM+nUtpCfoqkHoYSEFXV3eW6dnVeGBM7nDwpYxHma4cQb1qFsLMWNbtSodm
 uEI6keifMPI1mYvAYLibdOjcZwASwedvceDDaCLCb5tL3DwYbTvB3JcqTf8lFShIis2m
 D/FP3vyIGbyOBg+kG9FXgEpcJ9tSA6DnG/BdJ4dBGjmkcTBKkx/xnXiZ/n4/ezw/DMIJ
 rNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763216059; x=1763820859;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JphR/yfHrqeoxGCFuZ74qbjmgj/bPrWp2+gxF4BO3oE=;
 b=md288vUr3mNyjyvK41+smGzjVFmfd+Kchv/xraR3Y9sya7uUnf4O+aTyYPiHE31i5c
 44ZuQwRfFeFfv4rokBPhRc/Kw3fJM9NdXtQRvPm9rvBBwoYGRdehEa1BOFebKq1KqHNy
 qdWK9EXLQTS1u9Ngq3cVEl+WcVHvsmJBJh0HUPvOwm+FDgInqYU8sCM3dFOTbRJS1ypq
 BzbbuAyhr3hCHrId4uHZocCgihUtAHe3qTsd+KKoo8l5m5emCjFM64cgWzEzkezmrqAv
 UYw88cRL6rUIiVS80dNq6Ilrq6Ht6Fj0SNTn3AkKC7fO+Z6JdpjGarEHCzp0T7yfg82r
 k84Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOuq7R2hpeMpBte202Zl8JotKHk0ggeRlD0sSQjBJuqxLZUFet4PSyYTxKt9Pdde5C1NzlrI/St4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycKuZ6XVvx4KDO1qTI0u60lW1yGsUdLXvIa4HdGbyMgYhOf6jv
 VMQS7yHc7xSZ6Weiw5VhHM40FJ+c1fnaT26Zz1JgHwS2shJwXXk8ju53
X-Gm-Gg: ASbGnctLiT4l39WFsiQVz2PjrRTix1++rnRXDPnECRR2QP6QcjJsbp4HNQ0cMvDyi3l
 a7nZhy9nPCgizl6VxmzSaHjxHjSRBuFBmFncRWl54Cv2wQ1A7WhqgugXbzK+xq+qCv2RyLcXA33
 rQtDLWhcZI793iX1aiGPfdi7T2biItnpx8FQNeycmpt0UvnssDIMdi34E8Rm2D3NHyRrvQPcwhh
 gMRFEHFj3ogit1p7sZt/sWym2BVbxpDGj2fxE/oAuqC6MJ/GiTu78GQxiXeHE3JCADmyU5Plahx
 BCssKvQTPmjU0SAj2zbGynB5NIKNjagTrsvQzSoVPeeg9LmRlFaW+tLmm+Bze6DAaIxepEBeAvJ
 HvmFImOAikLOFKDSH5k7uwAOpBFvj/QmFSu4KawFGTobz5E+3dfnsP61Xkr1sJEdV5OIoySCqnP
 F69JOJ2xzmhM7kSPOA8vBJONICKBsjBR0uzStOqzMwyaQuZA==
X-Google-Smtp-Source: AGHT+IF/NKVfiJ7TrqEh+PcUiDYYnExZ1hICJ4keAyez444tuP7vZ12VBd4zl4CNGFC7PXxBkD/1Pw==
X-Received: by 2002:a17:906:7304:b0:b72:a899:168d with SMTP id
 a640c23a62f3a-b73677edba0mr706079866b.13.1763216058665; 
 Sat, 15 Nov 2025 06:14:18 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net.
 [178.79.73.218]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 06:14:18 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 4/7] dt-bindings: display: allwinner: Add DE33 planes
Date: Sat, 15 Nov 2025 15:13:44 +0100
Message-ID: <20251115141347.13087-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115141347.13087-1-jernej.skrabec@gmail.com>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
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

Allwinner Display Engine 3.3 contains planes, which are shared resources
between all mixers present in SoC. They can be assigned to specific
mixer by using registers which reside in display clocks MMIO.

Add a binding for them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../allwinner,sun50i-h616-de33-planes.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
new file mode 100644
index 000000000000..801e5068a6b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/allwinner,sun50i-h616-de33-planes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner H616 Display Engine 3.3 planes
+
+maintainers:
+  - Jernej Skrabec <jernej.skrabec@gmail.com>
+
+description: |
+  Display Engine 3.3 planes are independent of mixers, contrary to
+  previous generations of Display Engine. Planes can be assigned to
+  mixers independently and even dynamically during runtime.
+
+properties:
+  compatible:
+    enum:
+      - allwinner,sun50i-h616-de33-planes
+
+  reg:
+    maxItems: 1
+
+  allwinner,plane-mapping:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of Display Engine clock node
+
+required:
+  - compatible
+  - reg
+  - allwinner,plane-mapping
+
+additionalProperties: false
+
+examples:
+  - |
+    planes: planes@100000 {
+        compatible = "allwinner,sun50i-h616-de33-planes";
+        reg = <0x100000 0x180000>;
+        allwinner,plane-mapping = <&display_clocks>;
+    };
+
+...
-- 
2.51.2

