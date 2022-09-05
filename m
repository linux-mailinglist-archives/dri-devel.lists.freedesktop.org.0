Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 677335AD780
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3763910E454;
	Mon,  5 Sep 2022 16:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8AA10E451
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:33:09 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id qh18so18077643ejb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=f5DwtJDoisx1vYAodm+93SFt8NZfEbF1NT6PIDTV9Oo=;
 b=TCSozw31wwW8nYR10JQsH0smjE0+iQ5+sn1v9GoPEFiqzHBH6mV1VFiByfJlSvFnul
 rFqydVMnKv1odQ+feq4o27dh+W705PgqzDPxXiJYD4sP0vkIzB/neF90/lYM2JsEs6oK
 UuWIO1UFbX/5e09U68+uv5bozOn1wxMdi5UG5wwsjIVKY7oN4zSs6bE14xRYYRNBny8d
 iHvXYdaJ9VeZLdLhMATTAd3ABbmS1rTim2Ru7Ul8IEhEj3eInImwIOlKZG6/MAPUX8oT
 jtATu5Aq5aFzELkTb3OOwyfEiWbZqp3++90JU5+2iG5qxodD0M08m4DGvabj7EUhYq00
 gPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=f5DwtJDoisx1vYAodm+93SFt8NZfEbF1NT6PIDTV9Oo=;
 b=OgRqJJBGgXr21im2CS+B+toyUx635nmpn6JZUxx4Pln+ESW//o0aEmuePOL62Xyeon
 I/qbWzLvXDQ40Us+nDqIlMk7ViwYIjnhAThV/RXzuoyDSaDWVlb9fYUApZ+7dekDDz0k
 x0pGe720fhe9nenXVkTtpQi8kkKnnaJk5hSSiRXxZ82YvsP+wQQS0+SKlkw5qc6+FhdX
 OJ+VWmhnAiyCFYxgDY3TlulaS2hK9dGsQWVEmtWm89E5whO8vRDX+9ib9PlAdxIOXoCX
 2zrnpsuugIM2L7Js8KqqbWaNDVSMAsWj6u5YrWdmZ++euNCPL31M/aQAwM9D/eOwEG1u
 J+Tg==
X-Gm-Message-State: ACgBeo0fpeJffvkJ84I6XLdnKCsr7AhMTl3Rv/p1jcmrAGwG9Zg6msDq
 SjLXcUIhT+ZiK/ml5/Gkh14=
X-Google-Smtp-Source: AA6agR6dax21NvyJRvB7GnjhDUGZA1kjZbVNthvB8vSgspGmVWvTvRSAlv6zzfsIrWX0d6q89/wJfA==
X-Received: by 2002:a17:906:9bcd:b0:73d:df4f:2e92 with SMTP id
 de13-20020a1709069bcd00b0073ddf4f2e92mr31955422ejc.576.1662395588280; 
 Mon, 05 Sep 2022 09:33:08 -0700 (PDT)
Received: from localhost
 (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a056402231500b00445f2dc2901sm6688063eda.21.2022.09.05.09.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:33:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/6] dt-bindings: reserved-memory: Support framebuffer
 reserved memory
Date: Mon,  5 Sep 2022 18:32:56 +0200
Message-Id: <20220905163300.391692-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Document the "framebuffer" compatible string for reserved memory nodes
to annotate reserved memory regions used for framebuffer carveouts.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/reserved-memory/framebuffer.yaml | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
new file mode 100644
index 000000000000..80574854025d
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
@@ -0,0 +1,46 @@
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
+  - $ref: "reserved-memory.yaml"
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
+      chosen {
+        framebuffer {
+          compatible = "simple-framebuffer";
+          memory-region = <&fb>;
+        };
+      };
+
+      reserved-memory {
+          #address-cells = <1>;
+          #size-cells = <1>;
+          ranges;
+
+          fb: framebuffer@80000000 {
+              compatible = "framebuffer";
+              reg = <0x80000000 0x007e9000>;
+          };
+      };
+
+...
-- 
2.37.2

