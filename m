Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482FA7A41F9
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57210E1CE;
	Mon, 18 Sep 2023 07:16:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2087.outbound.protection.outlook.com [40.107.8.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2AF10E636
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 14:05:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgjdaTxi6jrkhwBaaPqJWVW7qBpqU2yjOrGuLOUAPaJvNZX+CsrejNwB+54HSN5L3b1QQVX/gwtiKonXJcco7UHYsdce+O8U+OqAFpC717h7nX+zUsaNyqSB+4pvg/evLxUccs02tutPiQMNwxVpt61mxN5A/zzCyb8yduibjpWE4GQngeJL89gszppsGjigqNHbxUCd/5PU0YDTp8xwd9yn6Dsn94wnsCZe5UhneqP8khAz0/dViUG1rBlsxWDozKWl8nu+KypDSKWkzAB87F3DHclehiMv2fw4Ou2hsLeYzyOHoI3aOBgBztaUBQrZTqBG0WnDO9C6YNfBPZdHow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py9fIa4DYNUu9u5VEoQ5z5bqAm59jnw+4sHK1LITt0E=;
 b=cFAR+wvXvPq1XqJdQksdi6/fyAVVx0B4YZC/j/S960nirYis60Jzxe1svtVpERk4G1f1Nva52rlqGK2o3vf3NFZb4aGNcAzIuQwVWdRiOALu6ws0r6IiCC/c5c1YYsLPkzdl6eXVTCuzM5a5yx2OjAnsvQwmKnCUS9th1lVCDkIvp9kg5ubBHH+tkOxDh9E0mbEY+6Aq3mVvZIiS8eb49n9NjQnml+fAsEbm+iDKf/0eN/jSYdYMMHw8PUHMmWrTawXalSj2qoSiOLuORfVAw6HSdbbuW5caEK66qQ6GujWMaW9iHK8g5gldgo28nEhhFgaefC3LMO0QKyYCaqvxVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py9fIa4DYNUu9u5VEoQ5z5bqAm59jnw+4sHK1LITt0E=;
 b=l/e2Gk1z8sTHGQKPVWPf4QpyiYZ5eu8k7zlLv0ML2nT5SZTpQie0Gtr+JWOU9gJu0Df9bhKHvhkDiKeqMChVnjpoccFhw9MrCo8YYdqL2a5D+POOLZf0CeIy2c1L4A/CrZiL5dItjK+aaXDOvY2KH6CxcX51VI8ec7H+YQUmU0g=
Received: from AS4P192CA0013.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::18)
 by PAXPR01MB10214.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.7; Fri, 15 Sep
 2023 14:05:21 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5da:cafe::3c) by AS4P192CA0013.outlook.office365.com
 (2603:10a6:20b:5da::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 14:05:21 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20 via Frontend Transport; Fri, 15 Sep 2023 14:05:21 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Fri, 15 Sep 2023 16:05:20 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: backlight: Add MPS MP3309C
Date: Fri, 15 Sep 2023 16:05:15 +0200
Message-Id: <20230915140516.1294925-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Sep 2023 14:05:20.0279 (UTC)
 FILETIME=[A9912270:01D9E7DD]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9A:EE_|PAXPR01MB10214:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 07ec6cfd-840e-4089-a521-08dbb5f4ccaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ON9sSTySW5VR0ay9y3zw5WZxWiA+mPDus0yvYEk8PCfhH0s4N1VT2R5GEZRBkgjLS7x6TxuLNFU25y/C2YDiA6yPP+ECFd92/i1v+UTa7+PXw87p13hzT+G0CYZgu5Ev7FE/wAQ61HfugmRt/qjr4+FJ/G4Onr3uttqtr65l5IJgLGUV0OuH0cFsDlctZfObg6P89iquXxxZyqpLNzhN2HAVqPkoicHFhzNzujxJPG3sTAH8/XSmQI9pQeLCzsGVuIm1lKgg7iM9ietQ0YZxPS65/3s6Pc/Q0T5Bo1PYBoLsPDF46rfTYQffjpBbgf8mLXt9qYqwICeH9JOIvORfn9Z1COH1xT5u46OK8ry8ihOX16Nd7MQLpZbpTQGx47Dom6XEKNJ9uARYt+wNMAVwUJdALpW+7qZqdaYWvSuZNlfGoGzp5BluPdvuImRFMVU48x9o9mrbnEijlMadp7V+yHsuD1qNM3wSDpGK/fYTzWZOXlExZT4xGsChIP5D+TRkRQwSUObFllHfWKsrld9duets6vmcHStqd4+qUbj68UR3A6tZXDfQ4TKCu7VIRxTwvW/2ZOiN4LWh/mLa05f2yYpD2X6dvGflXa8GF9K2FPgCD83AXe9wi/Dda9DC7kamZWudrCOHqluCkVRPsFk5xVwIz50b1BBRS7qaesFoqvT4m0e+l6WYpyMjHDMZkMxhw6zMa+PnyOLENuQveDnSlWbXIdToeFux3jWM0DCYftc=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(136003)(39850400004)(396003)(346002)(376002)(1800799009)(451199024)(82310400011)(186009)(36840700001)(46966006)(40480700001)(316002)(70586007)(70206006)(36756003)(478600001)(81166007)(47076005)(26005)(336012)(41300700001)(110136005)(356005)(2906002)(6666004)(82740400003)(36860700001)(86362001)(5660300002)(966005)(1076003)(8936002)(107886003)(8676002)(4326008)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 14:05:21.2034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ec6cfd-840e-4089-a521-08dbb5f4ccaa
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10214
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
index 000000000000..99ccdba2c08f
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
+    description: Overvoltage protection (13.5V, 24V or 35.5V). If missing, the
+      hardware default of 35.5V is used.
+    enum: [ 13500000, 24000000, 35500000 ]
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
+            compatible = "mps,mp3309c-backlight";
+            reg = <0x17>;
+            pwms = <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9 */
+            max-brightness = <100>;
+            default-brightness = <80>;
+            overvoltage-protection-microvolt = <24000000>;
+        };
+    };
-- 
2.34.1

