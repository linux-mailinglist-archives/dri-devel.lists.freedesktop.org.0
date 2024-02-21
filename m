Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D6B85E267
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E93A10E7D9;
	Wed, 21 Feb 2024 16:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="z23WdDfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com
 [209.85.219.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8819510E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:02:46 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id
 3f1490d57ef6-dc6ceade361so1568534276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708531365; x=1709136165;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=QGg5dBp+TAqi4Vih9jNxwVmFa4RIBnviXwiga7aX/Pg=;
 b=z23WdDfh21PtUnV/VmthmhLiFr/R0HgP/8mDibqg9XlJMlYRQwEUXBw53Swsz1gIII
 gEYG7u3EqlCh2neN1Bx2sKKu/SzyeJo1RbGZrytJuZkj69Bx3Ekc3LYp0ejO03+10pqx
 zrWPSIgHZ9avn6tR1zjos/9I/b6IqB5SecnCI6RuPO4g39fprqs5P0FFt/pqc21/K5eD
 rUXpZAHc6L7O8gIndWkQNzut/aoWnzu/EBnNANxUJhsJafRYazAvrLafqv4oA0Eyep/o
 iw+/jKBq+t8clsrZlKn9aqe+nN3Xdme6M5sXq6UT3gQQi039wXwDDX2bonFX1XPzto1g
 f0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708531365; x=1709136165;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=QGg5dBp+TAqi4Vih9jNxwVmFa4RIBnviXwiga7aX/Pg=;
 b=EgNxOO/x6FMQzG2kfSlZeBW80pmzG7LDzPOmiCpVaJOJFSLXyLdIEoHKUfyGDqOjZI
 rKYJfNGo1QLvmA1NJyEwDezY9N5vweSR9ferWwX0u57wH2Tcv4zy/Riz5+CVTPij1Yxd
 wfGZ8rVz3bBrY6qtXYISSho6MtSP4hKcVeNdfiNNtqybF+f9urumSxzAV0nqiQxZ/nZd
 PvD+hfyyZYZJLKRpilyYUrCcwSUZJSfQq7kP8OoCz9oIU/RHS/ugBtZ5ZBSScqrjsJ/7
 QGeDpBGhGV+QDeTI52btWt9nQ+ow+YRVpmDcKfKkcGGTa04cXJABvSTc7/E6FSbfYNSl
 nfmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsyYRJVQU/mQVDROsVeeewzL/7UvKAP5zQDxI7JB2z4cpqEhsF/lnieI5MIFDoWMdA7rSlIPnsaaz7VilFvHLTw7mOIuzN698gAHgBIAqq
X-Gm-Message-State: AOJu0YwVgXEQXQwizcMevt3CygJnPpVmV8lNHJFSfoRvGc+91qPtuSnZ
 oc1+OoOoLbiUy00m2KSIZQfsoLuNuvYlIOOqvtMmc91iv+VQjzUu3LreX4ar5JtQWJ8dTi/rkk9
 NF8TBXbUlDw==
X-Google-Smtp-Source: AGHT+IERn86P5KS/OR61g38fGAjjdWCXiWCh3x4Ja6a6T5iRxgeFp3D1CzEXxLwcRg/zQIfOar9r4nDwwSo3xA==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:1209:b0:dc6:9e4a:f950 with SMTP
 id s9-20020a056902120900b00dc69e4af950mr4645277ybu.3.1708531365611; Wed, 21
 Feb 2024 08:02:45 -0800 (PST)
Date: Wed, 21 Feb 2024 16:02:13 +0000
In-Reply-To: <20240221160215.484151-1-panikiel@google.com>
Mime-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221160215.484151-8-panikiel@google.com>
Subject: [PATCH v2 7/9] media: dt-bindings: Add Chameleon v3 framebuffer
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
 "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

The Chameleon v3 uses the framebuffer IP core to take the video signal
from different sources and directly write frames into memory.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 .../bindings/media/google,chv3-fb.yaml        | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/google,chv3-fb.=
yaml

diff --git a/Documentation/devicetree/bindings/media/google,chv3-fb.yaml b/=
Documentation/devicetree/bindings/media/google,chv3-fb.yaml
new file mode 100644
index 000000000000..7961c0ab66ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/google,chv3-fb.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/google,chv3-fb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chameleon v3 video framebuffer
+
+maintainers:
+  - Pawe=C5=82 Anikiel <panikiel@google.com>
+
+properties:
+  compatible:
+    const: google,chv3-fb
+
+  reg:
+    items:
+      - description: core registers
+      - description: irq registers
+
+  interrupts:
+    maxItems: 1
+
+  google,legacy-format:
+    type: boolean
+    description: The incoming video stream is in 32-bit padded mode.
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Connection to the video receiver - optional. If this isn't present,
+      the video interface still works on its own, but EDID control is
+      unavailable and DV timing information only reports the active
+      video width/height.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video@c0060500 {
+        compatible =3D "google,chv3-fb";
+        reg =3D <0xc0060500 0x100>,
+              <0xc0060f20 0x10>;
+        interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+        google,legacy-format;
+    };
+
+  - |
+    video@c0060600 {
+        compatible =3D "google,chv3-fb";
+        reg =3D <0xc0060600 0x100>,
+              <0xc0060f30 0x10>;
+        interrupts =3D <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+
+        port {
+            fb_mst0_0: endpoint {
+                remote-endpoint =3D <&dprx_mst_0>;
+            };
+        };
+    };
--=20
2.44.0.rc0.258.g7320e95886-goog

