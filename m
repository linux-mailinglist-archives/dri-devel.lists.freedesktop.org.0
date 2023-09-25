Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2537AE689
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D469110E365;
	Tue, 26 Sep 2023 07:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2080.outbound.protection.outlook.com [40.107.8.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D8910E177
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 12:26:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiaA/NAboDa91uCsu/dkFjd2k7e743RMA65XCujLN1uysCMlEVKtK1vzL0m6WAaYQaOyuYrv/t+0pqBOY5Rkyf+L5JDG+5f2RlyAknYp7ncijKtO5ypVsm1kVrxKYPZseXWwQFUt3ZNdaNIKa8SPBHd7NNKuuZSqC6uR7FK4iCffJGqJCZSuhrcLP3zsJtQCTjbDQwlWYVCC3ZBoBMZUvSL6DFrteuFkL/O8X5R/v3E09vW/TPEsSrD0I1I0hgmoQYkUrO7Ha3bZ+SaiwJ1VKJII7BZEV4m38wA94DcZoCa+nXbwPjy8mIjnQ4C6vKDRBRSE4H4nltyCkXlgn2YaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uyd0o4JvcjRjUAoyozcpPdzoVoil7+iWwK4OY683CF8=;
 b=e8Gv3oLMTjl3NjzFjtSHR0Qi1uoA5R0UJVtMbxjzLil8XUXBogOEsrX1Qt68D9z/ODHzyhp906/ciWZM6IUBmmiCGsVfFaX1VGxmBta9rra4C/jG3pazXknLg7MsctW2fXhqi0e3y865P9294nnONZVLsHL6Mi6WiOjSK6RZq1bRM7BEoeJuzfKHE2N7H8KVciwWE7r7Hu7dBUMNoBXOgbfLfJP6DhWQvAhoLu1HRrY3B79AF1MPNYGrAW0AWW0fElC+PgFrRP546qcyNwsw8vLmdkuWKJT2Fcb//YjrD+UiF2yYUbqBq0q4D9iuYD8QrUv9JvhfbuGy9gZGoc923g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uyd0o4JvcjRjUAoyozcpPdzoVoil7+iWwK4OY683CF8=;
 b=KOXHQdASZIIIQ2PrczIowdeXlxIlkYXJfOaExtaH5oWJBO28icn2r44ZKZpsUGBCISLAQeWOxrizkJAB9IRLqiKi8Lvkra0GdHyH5OMk7NNDzdp54f5cN0baStHNQDWA47SP+QG8mrxC2HyKjXQLS2eubONtRzTfY73cr3gcTXg=
Received: from AM0PR03CA0095.eurprd03.prod.outlook.com (2603:10a6:208:69::36)
 by AS8PR01MB7509.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:28b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.18; Mon, 25 Sep
 2023 12:26:47 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:208:69:cafe::4) by AM0PR03CA0095.outlook.office365.com
 (2603:10a6:208:69::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 12:26:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Mon, 25 Sep 2023 12:26:47 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Mon, 25 Sep 2023 14:26:46 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 1/2] dt-bindings: backlight: Add MPS MP3309C
Date: Mon, 25 Sep 2023 14:26:08 +0200
Message-Id: <20230925122609.78849-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Sep 2023 12:26:46.0637 (UTC)
 FILETIME=[8CE479D0:01D9EFAB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9F:EE_|AS8PR01MB7509:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b02d0817-1e07-405c-142f-08dbbdc2afbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZGcj/fICEdFiCFzpd8IEVqtiYnXjUCiW0v/Z+0YSjd2co4ONgZzjV6izTyNFANBqaxD0RyrZeSSawPaBmwlkj0NPgOjS3wrVMLbsHWz5Nr2RNxz8chxUZ82t/aiA6TuYcYdOZ4dgguKjPC6XL0zioP4QqZCsGIrsknBbQJ+8TjeJKJcVGoeVoPo6Z47f5we2cX3AOz4XrKL5w118BPD3cefZTRY9U0NNwyFQDIVTqIE/dLlolNy55vAv4y/RAus7M2NS8iZqcV2v6JY5JSyy6ZI+Cd9aBr+MUErzS7EPp97rBmGirKHq6TaILOS0SiUTJWBeRM66b5hzY8ObDeXSgPp7zUKXffz2qXX/XXZC15zW78JNxl37GEOf/jnjq3rMzLK3WqHX+u6j7HowovyTrshN1QwTK1oWNxC2OXCgnP8IVsz8B2ZiaSH4zQDqkrcYUnYcvDh8Z99lGieb1i+3U5c0zPDHGImZ5oe87H5w9HXgBGs75Uz5vuFAOAIJYNDz1FenhzIkIc5zRq1LnxeoZ5oGNw25QT9hkedgC/vWRZejt5a83lxs72LdZ6z699rMMhaHCrdWDyo6US4iu+h44soBI/g6itz40PlEK06HHjVfZfwvlzBfuiyJGt2vywRJyzgbvAeg68H740nRF0cx9GuOSqP90SIVr4yff0274Ej7Hv3YHBM59JEFZ67c/74we2HbpKwdYpE/Kv+Xr4jqHozCpOJJjpRuImnMtq7BlXQ=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(136003)(376002)(396003)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(46966006)(36840700001)(2906002)(86362001)(107886003)(2616005)(1076003)(26005)(336012)(36756003)(6666004)(36860700001)(82740400003)(47076005)(81166007)(966005)(478600001)(356005)(40480700001)(5660300002)(70586007)(70206006)(110136005)(54906003)(8936002)(316002)(8676002)(4326008)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 12:26:47.1829 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02d0817-1e07-405c-142f-08dbbdc2afbd
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7509
X-Mailman-Approved-At: Tue, 26 Sep 2023 07:15:08 +0000
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
Reviewed-by: Rob Herring <robh@kernel.org>
---

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

 .../bindings/leds/backlight/mps,mp3309c.yaml  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
new file mode 100644
index 000000000000..4191e33626f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
@@ -0,0 +1,73 @@
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
+  - analog mode, via I2C commands (default)
+  - PWM controlled mode.
+
+  The datasheet is available at:
+  https://www.monolithicpower.com/en/mp3309c.html
+
+allOf:
+  - $ref: common.yaml#
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
+  - max-brightness
+  - default-brightness
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
+            max-brightness = <100>;
+            default-brightness = <80>;
+            mps,overvoltage-protection-microvolt = <24000000>;
+        };
+    };
-- 
2.34.1

