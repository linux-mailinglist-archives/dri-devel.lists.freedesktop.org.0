Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E337BFAF8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 14:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5EF10E33B;
	Tue, 10 Oct 2023 12:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2052.outbound.protection.outlook.com [40.107.105.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CD910E1EC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 12:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7AdxVrOw5H0LoozBtijGrvQro2hGqcDhVzC0LMVVwe9w4xXWmcNq41IFxGZtiq6u8kvGht2CE5FqQKaRiqVKbYtOUs9WcJE9gRBKeJzxiM0sSHB1qQUcFhLjg1wYvkrFXkjikoUHjovyuo9mpTny9KSEwwmhTVKUGm843EFKaFEA4HSY/RqCvQtGCXuPCTNoI6oTsNoo+xPDZXyEDc7ZOgTG8UTaIiH41Tf9Ht0e8I4BbXWcYvUMr/QhoYOYq+7gXD61iyaq2oGeh7K8S+0k35dCih7ToFXFClt6ZW84C4K1Bz3prHOcKjHXrqbFaSlbU2L1ZMEQ9FFDduGxaRFvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiP9OYAokihYsk6mwFuxzU5u73vQxiEPThzkg+/dh7o=;
 b=ZbFdBNypP05IdLrgtQgiV1UDEZs8AFQiP18n8ZIXq9OFiKVMr3WE3B3aJ9HoTYENTifLWtyT7XuOav3uKnQhs5L4b335XnLfrY3oOs8gFMl682xromUGv7o9od8Jpl7ZgtlyEk7vjvUCygx0KW/WnymRpDW7SflP+IM3StdrN16kCT1JLLndIYuW81dC8eyYMOysUirIxTsyG1oLNrjiK6161fPC9dfft+W6sSyk0O7ma2AaiMiJJEVOqiCk079Daf4I5qXPOAQFub8+D1J+ZWNxi8/Mkg+2MUDEsyvYD1BX1cPshx4sxpraLGlvnJbCvlZ2zSIXWIaPccoyoaRABA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiP9OYAokihYsk6mwFuxzU5u73vQxiEPThzkg+/dh7o=;
 b=hiVt8qbY3uAMsnd1+mpvF9kIr9603jC44fEHGx4dR8muO/T9mppjtHkUzsRGRX3YDyWfgJmNNFNQNeFQ7Jgw2Lg0GmofDMElywe5+/SwJ+/Wg9fFjdRn0DSMOdeZRAFqM5+W6EBOTcbH3rInpQK0KbjBLr+ll50AU1NjC8v22OE=
Received: from DB8PR06CA0037.eurprd06.prod.outlook.com (2603:10a6:10:120::11)
 by AM8PR01MB7555.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:244::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 12:16:27 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::48) by DB8PR06CA0037.outlook.office365.com
 (2603:10a6:10:120::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Tue, 10 Oct 2023 12:16:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 12:16:26 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Tue, 10 Oct 2023 14:16:26 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: backlight: Add MPS MP3309C
Date: Tue, 10 Oct 2023 14:16:21 +0200
Message-Id: <20231010121621.3009154-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Oct 2023 12:16:26.0024 (UTC)
 FILETIME=[972CB280:01D9FB73]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|AM8PR01MB7555:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2d1fef50-8da3-4be1-ab90-08dbc98aba0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIruUgypPWbpbqsQxA7inlFTJDmipDMP0T80OPGzAxbeAPCZKepT5bagkSuWyt26LhdFOP1ALCRoNDlDfl8iWXKfr4f9wT1Vk8ietJxIAGbWZSL/pdjH0ToeOWaHZAZ90jlmimcGs8SNKSkPEtJbyl2ExQTE40G62siPYb5B/JwOcCxr9prYIkbtMhOyOaLvfTLTVi/eFH3Zkl/GZPZnDRKG9rNufAQ0oKaEXtGVo8C9oi0HRaVrDaHFsR3boKgo1b3okBS+wQsGyPWmLX+2bngqnesIvvsTViw5VmGdAI7hw2qWTSk3kxHJvqQuf2dRwITxxFqY6qNaTTbHVtLsRLUJHk+GeJcCVJq1dbZ9fqAK8sjF3a0aDir+ewrMNAGh/dzD+Xs+DhWxPUbYf1jakedz8n1NhgzYee5sATojeWoRA3Lyz2G1i5W99NVuaGgeP4txqn/k2GKrrUTI4FlfDwTBanxFmwBS2x08nu2PeBbsH2GusGyr6lMRtGUxEtcM9qU3v94lCk7MaMVp/C4Qc23jNfGxmf54HUx0vTN/gGzfkakN2Fpr5rSSuRc7YhghxWGrohaNOEN48SS/yBig6f0xkNSsLWc33rCtx5jRTR+UKCvp8HBDxBnwTjmi8gy6xJnXA4xuSobxzLUg13n0gFcIuLGmw+O4Y4p6pHyC9gglPhy/OPmjyxFZHPFOYuzEyUtD/SrKFgdQakpFXnKqWe/DSds6OBs9qaMowG1Qbeg=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(39840400004)(230922051799003)(186009)(1800799009)(82310400011)(451199024)(64100799003)(36840700001)(46966006)(40480700001)(70206006)(336012)(83380400001)(107886003)(2616005)(1076003)(70586007)(26005)(47076005)(36860700001)(316002)(110136005)(8676002)(4326008)(41300700001)(8936002)(2906002)(478600001)(5660300002)(966005)(6666004)(36756003)(81166007)(86362001)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 12:16:26.6000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1fef50-8da3-4be1-ab90-08dbc98aba0e
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR01MB7555
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Flavio Suligoi <f.suligoi@asem.it>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
programmable switching frequency to optimize efficiency.
The brightness can be controlled either by I2C commands (called "analog"
mode) or by a PWM input signal (PWM mode).
This driver supports both modes.

For device driver details, please refer to:
- drivers/video/backlight/mp3309c_bl.c

The datasheet is available at:
- https://www.monolithicpower.com/en/mp3309c.html

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---

v4:
 - remove not more used allOf keyword
 - add brightness-levels and default-brightness properties
 - remove max-brightness and default-brightness from required properties
 - update example, adding brightness-levels and default-brightness properties
v3:
 - add default value for mps,overvoltage-protection-microvolt property
 - fix the example, changing from "mps,mp3309c-backlight" to "mps,mp3309c" in
   compatible property
v2:
 - remove useless properties (dimming-mode, pinctrl-names, pinctrl-0,
   switch-on-delay-ms, switch-off-delay-ms, reset-gpios, reset-on-delay-ms,
   reset-on-length-ms)
 - add common.yaml#
 - remove already included properties (default-brightness, max-brightness)
 - substitute three boolean properties, used for the overvoltage-protection
   values, with a single enum property
 - remove some conditional definitions
 - remove the 2nd example
v1:
 - first version

 .../bindings/leds/backlight/mps,mp3309c.yaml  | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
new file mode 100644
index 000000000000..e2f9ae2b3fb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/mps,mp3309c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MPS MP3309C backlight
+
+maintainers:
+  - Flavio Suligoi <f.suligoi@asem.it>
+
+description: |
+  The Monolithic Power (MPS) MP3309C is a WLED step-up converter, featuring a
+  programmable switching frequency to optimize efficiency.
+  It supports two different dimming modes:
+
+  - analog mode, via I2C commands, as default mode (32 dimming levels)
+  - PWM controlled mode (optional)
+
+  The datasheet is available at:
+  https://www.monolithicpower.com/en/mp3309c.html
+
+properties:
+  compatible:
+    const: mps,mp3309c
+
+  reg:
+    maxItems: 1
+
+  pwms:
+    description: if present, the backlight is controlled in PWM mode.
+    maxItems: 1
+
+  enable-gpios:
+    description: GPIO used to enable the backlight in "analog-i2c" dimming mode.
+    maxItems: 1
+
+  brightness-levels:
+    description:
+      Array of distinct brightness levels, in PWM dimming mode.
+      Typically these are in the range from 0 to 255, but any range starting
+      at 0 will do.
+      The 0 value means a 0% duty cycle (darkest/off), while the last value in
+      the array represents a 100% duty cycle (brightest).
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  default-brightness:
+    description:
+      The default brightness (index into the levels array).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  mps,overvoltage-protection-microvolt:
+    description: Overvoltage protection (13.5V, 24V or 35.5V).
+    enum: [ 13500000, 24000000, 35500000 ]
+    default: 35500000
+
+  mps,no-sync-mode:
+    description: disable synchronous rectification mode
+    type: boolean
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        /* Backlight with PWM control */
+        backlight_pwm: backlight@17 {
+            compatible = "mps,mp3309c";
+            reg = <0x17>;
+            pwms = <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9 */
+            brightness-levels = <0 1 2 3 4 5 6 7 8 9 10>;
+            default-brightness = <8>;
+            mps,overvoltage-protection-microvolt = <24000000>;
+        };
+    };
-- 
2.34.1

