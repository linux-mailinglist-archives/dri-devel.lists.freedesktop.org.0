Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394FFB0585D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873FD10E58F;
	Tue, 15 Jul 2025 11:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J/uHonJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D2710E593
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752577502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UXL9y7xBlAhc4AXFCXGCZMpy7EHZFtBhXWeACly5wqo=;
 b=J/uHonJTcF/domtNIQQUk0NKVmYSbbEthqAmXezwBxvEt7MVTTD4klYFnd4vhUbTuq9YBo
 /sPw/gkKC6OwkphySDL491LD5OjqSJy424ArqQwdgHzKxuBSmbRSuKnZNw8b6oeyC7UOqB
 HD+7/sq+x+Pou+U2sGZf2Y6rxwBFT8M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-F7NZOj2kMKmuqLu_0YMP_Q-1; Tue, 15 Jul 2025 07:05:00 -0400
X-MC-Unique: F7NZOj2kMKmuqLu_0YMP_Q-1
X-Mimecast-MFC-AGG-ID: F7NZOj2kMKmuqLu_0YMP_Q_1752577499
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4538f375e86so44527775e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 04:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752577499; x=1753182299;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UXL9y7xBlAhc4AXFCXGCZMpy7EHZFtBhXWeACly5wqo=;
 b=OGCCqjynulaoY2fJ7XUMqkay1N3HHQoAaYsU603YqCefNtqMcNh4GLA8k4zfRdZ8jw
 oAcOBsDvZZUBtNR+YrH5McXUQ3nBaQow+knpeQO82q+nJ45V15GwtLQY24TgVezi7qmb
 aTf2pY3hPRC6lKy+jM3zkEHBpx/r5veZGvf6hXGqKbZovMgs+c65FOFDeHgbqIH3+4qQ
 S8PtCEuMbg/HdjoLOQxbFxrEmGmas6rVHCHst8X8Iyv3k2lt8YiAKYILvFOorbRHaYFP
 5h0qN9b7uIyc2DYaJq8emCWvP67QJcBSDf+RHxbeSnjjT5feqos7P3oIU2VT3rrxgnNz
 I9AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFrj9K8cKfOB2QjPjzwe88bPiy2NfT7NA0EeMFVc79nNLQCCszT3srCRPm3jaP6R7+0xHUV1hEfA8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAuB/pKCRhkIIDwVVqSWuIQz7bCzxJDgUut370amOHaGgEGW9N
 fRn35ZROs5qb6wKcfQ0+lEjc902A2ubQo5n1xyLVp7e2F3jNJZWvcGRJX5sIg1gFD3R73AHsPPL
 MB5j6upmEmWAlSbZmGSuto69EwPCVFL9V+DuoVj3wzsiBCnsGbRskVDjoOLGAzcZwdvl04Q==
X-Gm-Gg: ASbGncuHjooeFT1chb4SGl0Ff7B4PA/HElvLkCXxxe27r36JOIvbdrAwqRcTeZVCjqx
 3ikh7wnnvZRKNkgo1yRyeWvz+ejnT6ksizRCWoqGGqzKwcHyF6tmYdGz7zhxE9vajNB3FVwXudV
 AmoAdH+PI1obiJQMtR6o6cJLhWxyhQ3Oo3375psiZhdP2I8MaulOa/SscZqvuGUjiX2OQjfExYW
 jomkAqeDdfSamAqDGmseCeHgd6iDKhqrLFRzuYbc1Jg6h+IdE3897jVQX9Yt2ZC8VJblmAx10DJ
 GB96JVIjIOiKYrBCyjgQoefAPQkGKXpf
X-Received: by 2002:a05:600c:3481:b0:456:1752:2b39 with SMTP id
 5b1f17b1804b1-45627727ef0mr18693665e9.33.1752577499333; 
 Tue, 15 Jul 2025 04:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX6q3lHTErOrCKqaTuVDGblbpeMy+KjGYJg/6IvgcpsrwPUGu+4zqypinlqXvEhZwLlzkaZg==
X-Received: by 2002:a05:600c:3481:b0:456:1752:2b39 with SMTP id
 5b1f17b1804b1-45627727ef0mr18693195e9.33.1752577498799; 
 Tue, 15 Jul 2025 04:04:58 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560f22cd29sm87905185e9.34.2025.07.15.04.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 04:04:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 "Rob Herring (Arm)" <robh@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/5] dt-bindings: display: Add Sitronix ST7567 LCD
 Controller
Date: Tue, 15 Jul 2025 13:03:53 +0200
Message-ID: <20250715110411.448343-5-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250715110411.448343-1-javierm@redhat.com>
References: <20250715110411.448343-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7WkFY6F388wZdCPVpG_Si32chy1P4O9Xmc2slJmUXeY_1752577499
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Sitronix ST7567 is a monochrome Dot Matrix LCD Controller.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

(no changes since v1)

 .../bindings/display/sitronix,st7567.yaml     | 63 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7567.yaml

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7567.yaml b/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
new file mode 100644
index 000000000000..e8a5b8ad18fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7567.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7567.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7567 Display Controller
+
+maintainers:
+  - Javier Martinez Canillas <javierm@redhat.com>
+
+description:
+  Sitronix ST7567 is a driver and controller for monochrome
+  dot matrix LCD panels.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    const: sitronix,st7567
+
+  reg:
+    maxItems: 1
+
+  width-mm: true
+  height-mm: true
+  panel-timing: true
+
+required:
+  - compatible
+  - reg
+  - width-mm
+  - height-mm
+  - panel-timing
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        display@3f {
+            compatible = "sitronix,st7567";
+            reg = <0x3f>;
+            width-mm = <37>;
+            height-mm = <27>;
+
+            panel-timing {
+                hactive = <128>;
+                vactive = <64>;
+                hback-porch = <0>;
+                vback-porch = <0>;
+                clock-frequency = <0>;
+                hfront-porch = <0>;
+                hsync-len = <0>;
+                vfront-porch = <0>;
+                vsync-len = <0>;
+            };
+          };
+     };
diff --git a/MAINTAINERS b/MAINTAINERS
index ee2ef9d9db2a..d97e091b1742 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7835,6 +7835,7 @@ F:	drivers/gpu/drm/sitronix/st7586.c
 DRM DRIVER FOR SITRONIX ST7571 PANELS
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/display/sitronix,st7567.yaml
 F:	Documentation/devicetree/bindings/display/sitronix,st7571.yaml
 F:	drivers/gpu/drm/sitronix/st7571-i2c.c
 
-- 
2.49.0

