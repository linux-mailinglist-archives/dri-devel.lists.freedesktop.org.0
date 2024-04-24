Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF718B0E46
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 17:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A755113C10;
	Wed, 24 Apr 2024 15:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uc1120O/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E802113C10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 15:29:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCDCC61BCD;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E011C113CE;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713972570;
 bh=DiqvgTZBUY3PtNH3TfiCz4FuSNpD0GxOhifVBZkfCjM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=uc1120O/6j0Xn8sL2lbfJOmtbl56+d8qwLFlslw9Q5Tjr2pa+OWYpecv3tS0eHks2
 fM4VqDkwPF+N7orPmP5L3O5uLvvnPNcSzF2sCMjKiVN27yhC/brwENGTJqZzSiivEZ
 wcZhINN+ZPi6ZD8ok+zXp0cqC/NxAGAYvhYWHGMZZ/wMhw87oEAi/ziBBP7D5xtjgm
 cIeAQjdJqWTH9KzBOWu3Vqk9or4+LTD8MRgFWrFTfaO14dLMdvetPBGtSUBOuURwLj
 czG0U+W7s/VpW7Z+/IXOIwPwxDIdDLAoqYfH+D57j/Oa4uYLyVByfKDFpvUVTQIPj5
 K8WvSWggFdZQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 15F60C07E8E;
 Wed, 24 Apr 2024 15:29:30 +0000 (UTC)
From: Xilin Wu via B4 Relay <devnull+wuxilin123.gmail.com@kernel.org>
Date: Wed, 24 Apr 2024 23:29:06 +0800
Subject: [PATCH 01/10] dt-bindings: pwm: Add SI-EN SN3112 PWM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-ayn-odin2-initial-v1-1-e0aa05c991fd@gmail.com>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
In-Reply-To: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, 
 Molly Sophia <mollysophia379@gmail.com>, Junhao Xie <bigfoot@classfun.cn>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713972563; l=1687;
 i=wuxilin123@gmail.com; s=20240424; h=from:subject:message-id;
 bh=Sd6Ecnq5OawH+103xxOmJ3nKkBaj9Y2Zw5nnRbO/UF4=;
 b=eUTowkOmB04wln4zX+/5k93CvZLX7lo0igr5S4Ch5podI8Hk35rew+sRl3bcVm14W1QrSqnT3
 o1etBHkXd58C3DNUlIk2LarC5FzddpwfLuaYg8S82Fg6RCYkzg1QMsN
X-Developer-Key: i=wuxilin123@gmail.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-Endpoint-Received: by B4 Relay for wuxilin123@gmail.com/20240424 with
 auth_id=157
X-Original-From: Xilin Wu <wuxilin123@gmail.com>
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
Reply-To: wuxilin123@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Junhao Xie <bigfoot@classfun.cn>

Add a new driver for the SI-EN SN3112 12-channel 8-bit PWM LED controller.

Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
---
 .../devicetree/bindings/pwm/si-en,sn3112-pwm.yaml  | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/si-en,sn3112-pwm.yaml b/Documentation/devicetree/bindings/pwm/si-en,sn3112-pwm.yaml
new file mode 100644
index 000000000000..2ab229ac40ce
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/si-en,sn3112-pwm.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/si-en,sn3112-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SI-EN SN3112 12-channel 8-bit PWM LED controller
+
+maintainers:
+  - Junhao Xie <bigfoot@classfun.cn>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: si-en,sn3112-pwm
+
+  reg:
+    const: 0x54
+    description: I2C slave address
+
+  sdb-gpios:
+    maxItems: 1
+    description: GPIO pin to hardware shutdown the device.
+
+  vdd-supply:
+    description: Chip vdd supply
+
+  "#pwm-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pwm@54 {
+        compatible = "si-en,sn3112-pwm";
+        reg = <0x54>;
+        sdb-gpios = <&pio 1 1 GPIO_ACTIVE_LOW>; /* PA1 */
+        vdd-supply = <&reg_dcdc1>;
+        #pwm-cells = <1>;
+      };
+    };

-- 
2.44.0


