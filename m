Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FCAA8F32
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 11:16:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618C10E39D;
	Mon,  5 May 2025 09:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gMDGGVfD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5763810E39D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 09:16:44 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-440668acbf3so5703465e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746436603; x=1747041403; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/4bgv6KVmjcRZE0LErys1nX4WVPjn1RSVgidnV/lpwo=;
 b=gMDGGVfDkKwIDa7NaO4BDHjs/WBxXY/IUh+qdd4MvQk3StnBu12mdCz41yGlm7B7dF
 SwD8LbZZnyGH1puIxU/UOB4h3Cxo4wgSgyrRdR2+ISgsXlCjoEN30A/qxr7LAvhFGw1e
 by9U8ZnOHAqpt5Fa4dsAq6zFOF8FvHpEsOZ9AsVyH9tl3QUs4MRFROjBJ+N8Lhxb0apT
 NM635YGIaw+K0hep4RR+oy8Z11XA+shIM+zcNHAj/H3mebv1c3OM/syiVjFzGq4Gl+wF
 zrKOkl1wJtU+cOIt2rE/lobYJnWrGY04FiYFr1/CVYRam6uHcIXcNj9PYWqjhAAyXGy4
 +4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746436603; x=1747041403;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/4bgv6KVmjcRZE0LErys1nX4WVPjn1RSVgidnV/lpwo=;
 b=kjWNc8giPM/uogahXin1d/6HiOJwKL4N+WCnHfzqfiigUz0UwsS2RmrXXr8Qwu5Ahw
 jMh4gCv0dcD3rh2AcLBADieuvbyKi43Nw+m9pGIoWDuYEra8n842+hhva3VgiVNq8lqj
 nLUiaOPyInLpfEA8Bhv4x9JpOWVk6nuS4K+48d9ThVWA/HrASnqRCpKp1gv2C6IbtOmw
 euRmJNVt+Wrq0dUFIBc5TEoIziX3nF43l9Y8JkTj0U3xZ6NGy7+q+cfjEVAXaYBeqDnv
 OivjREj9QqVbFAvRyPwgHgX/N7Pu6mO2a5YwoUJhC7k38IyPy43KiEBBBAM5vaPE8Lsj
 GJGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp4J4dtu3AQx5fesd42EmHluLJfFh2RbDgyD6t25K8S3xlg63xWXsSqmJac07t5HhKmCdHhK7O8T0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/djIFEGDOoVFC95QW7Ml4UHEpK+U0u/eIMa+bo4HzJlWVSSuH
 xnUdSW4IGfOf0eC2uMVFLJNK/XC9tvMmCbg6MfyLo6s9KaDHh+HjQBN/W7T7388=
X-Gm-Gg: ASbGncsuQ1F2fClysq9j/4gh3RBJWEMmtTCYm8a3Wi5oyfk58Z5YPu0+0Sap18NEMwf
 DQJzucz2L+47qsrAPcaSTAiuNiVz19IA0ZEcP9Nv7+gDtfk8clgeXDPM5Usp5wPHMuukz3348Pq
 ge8ynaWBTEQ6ayhJVGBdOb52GZ2ZVB67h+lZQMGG0TtxS7reqK/Y/kp8YHgOjTWyYWqNwnohHGA
 qp9hG55hkQ+G8nnX0S7cyotJwDgfm+pOOhQ7wWUwqz2mFAW7O51+rXwHW6Vyh6koX7dmQgx7jiw
 edmEhmqygUSIdk+aU07C/lwOjD6ghE+WC+456koxKj5Lw3UKW0//fv0D5Lg=
X-Google-Smtp-Source: AGHT+IEw5FuKNFm8/QHlYSWSxgEk5Utm8CEJLfZb4GNFY9PyR4vY5NLfmVDfUzrUr9GSrQrTJ8tj+w==
X-Received: by 2002:a05:600c:1d8c:b0:439:8294:2115 with SMTP id
 5b1f17b1804b1-441bbf4b11fmr38391925e9.8.1746436603220; 
 Mon, 05 May 2025 02:16:43 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2aece0asm171784775e9.14.2025.05.05.02.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 02:16:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 05 May 2025 11:16:28 +0200
Subject: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT37801
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-sm8750-display-panel-v1-1-e5b5398482cc@linaro.org>
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
In-Reply-To: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2288;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=myYAgwe4Uvo4pZ4TdmGjIMDrUx1GUpHdZvEtUczKmjk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoGIH2ScsJDcvIBEj9t1ReIUtNo3cMb2/ZJgKUC
 l+qaSluVbWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBiB9gAKCRDBN2bmhouD
 16vOD/0Xg7HRST6WJpe0HHIavieRlmZ4EFQDs1jrlhqFiVP3V0sQxpYAs3nWiECJuSAsUoW/SAd
 sxsLQukOfdeRmj1HbE21xDxkeBO02E84D1hhnuBh8afGj2ub5dB/mf1UPrEhvOdd5iZvHtCbTa/
 6Qck/pri8IxiPpCqcgRLeiA5TycsntYPy/A7QKW4Cz3dQjw/rU5A3yBPiE+mwV9+ffVbaoJRfw5
 Y7/lZVVmqnZlFDV77FPaeTLtG+MDZ/oIDgo6V75FIXSeNkWVQIhU1v77kZuK2Hps73A49PMS8lW
 Sng7/ctyy9WsBOEu13whSv/8y272P+euJyom6HhD7ulxipjizCnHtVSUJVAbSeZaJ9SPlrNl+G7
 DYZvN1eIYJOMaxYocM6pjsbMWWDnQag7dRKVpCPQhT3rpuLVy64QoGjto2I852IrFU93JPqA4M/
 Sg85L7Ry6SZZ5KGHa0aQINHcjmgXQ5OwR2P56fBFe54DWu2EfwkdWLD5UdSBRW25CzOw1ykj48B
 BFqPs17ex0WdsnUgfFEVoLk593yZ3hZE0eAM2JiPua168trVB0xpTZ0yK1PGdz0L/vp78KPKmZx
 3+W/wtlOEPzysK7T46NSPt1KlKW9ohW9mSktel4bH01leYTrFO8PfaVXAxEYezSYA3hQ1mrZrJQ
 4/pHUnqAQsle3vg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add bindings for the Novatek NT37801 or NT37810 AMOLED DSI panel.
Sources, like downstream DTS, schematics and hardware manuals, use two
model names (NT37801 and NT37810), so choose one and hope it is correct.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/panel/novatek,nt37801.yaml    | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..1b38c1d0af6825341e047af57584a93261e7af2c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37801.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37801 AMOLED DSI Panel
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description:
+  Naming is inconclusive and different sources claim this is either Novatek
+  NT37801 or NT37810 AMOLED DSI Panel.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: novatek,nt37801
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel
+
+  vci-supply: true
+  vdd-supply: true
+  vddio-supply: true
+  port: true
+  reset-gpios: true
+
+required:
+  - compatible
+  - reg
+  - vci-supply
+  - vdd-supply
+  - vddio-supply
+  - port
+  - reset-gpios
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
+            compatible = "novatek,nt37801";
+            reg = <0>;
+
+            vci-supply = <&vreg_l13b_3p0>;
+            vdd-supply = <&vreg_l11b_1p2>;
+            vddio-supply = <&vreg_l12b_1p8>;
+
+            reset-gpios = <&tlmm 98 GPIO_ACTIVE_LOW>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...

-- 
2.45.2

