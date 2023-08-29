Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3178D39B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 09:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C0110E109;
	Wed, 30 Aug 2023 07:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2051.outbound.protection.outlook.com [40.107.249.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A007A10E1DA
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 10:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOWTiSOH6+2Bbq6cwWnwn1wXt8ZEZsIh5567Isqzxh82ErlHiNG9uMsragF9dtEPGX1AGbKzDySrD4HcRPeLiXv1b6Or8kKFUCtbGZHSWGDmUEo29OtR6luy6qaSD6BZhYYdQDJ+qQgGeLHfvPRBlj0SPxfKhfAeLDJDPSCbMdkJIqR7quwVFN6LgCmKQQfVbhhohBdK3WI3fNuXCSYivqi1CFXOnk8aK6tj1/IHl1936rf0Cpan1KsunVRZwJyeHZ0yugEEusn8ZoImLrAxHcOyRMhQ2D+Uhcz9xlVhsb3Rw37uA2tqWBfvK5VKP8em/qWpRK1UtiEwSAqmVedWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8i6Z5ofY7+TKGE17qRje3A8VDEN4jiI1FoaTxvBWr9k=;
 b=XXFKc3gL0+6bDeaBXzTNskD43JR7KI2FXZCgqj5octZfxiqfGUae8akVLKtNE08JhmuQ+jbIgdEsTul15GQqd+/ZCih1fgPTMn2sdZLNfuahSsuwPiY1npGzRhpMXnnLJTzKxfVT2AVebyj2sytCL12k33QgqJtdckI9e4suluXlvw7dEFjw0G5lsrO+PxR7GEx4GY8eNU8JXz15RPn4TWkS8XGjrU22HDixkpPvA9NR0KwoB8rOY89pnPTkku/vTI7bJA7d770rq7qWH14VPBWomr8Cga/LkU3ijh849X88T1Y7eq9Sd2IDkMC1Gy0MRV8hXBc/36Z1icdiFyAL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8i6Z5ofY7+TKGE17qRje3A8VDEN4jiI1FoaTxvBWr9k=;
 b=AaNF0P08tbdR1xBzHZhchHbDR2J1M8hru8F/a8DFEVpn0mYxll/eqMOJoAHRKOZFiLAN3FylFp3xn4z2HqgCC+2tlFgiYTUEG7S+cr03AUFKAIUa6zIvCXn3t+cK2+pCDcLYlMOMGb3TFrO6veR/oZGVl3QI7fTsIQ+jak1B0Ik=
Received: from AS4P189CA0028.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::18)
 by DBAPR01MB7157.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:198::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 10:15:59 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:5db:cafe::8c) by AS4P189CA0028.outlook.office365.com
 (2603:10a6:20b:5db::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36 via Frontend
 Transport; Tue, 29 Aug 2023 10:15:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.17 via Frontend Transport; Tue, 29 Aug 2023 10:15:58 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Tue, 29 Aug 2023 12:15:57 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 1/2] dt-bindings: backlight: Add MPS MP3309C
Date: Tue, 29 Aug 2023 12:15:45 +0200
Message-Id: <20230829101546.483189-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Aug 2023 10:15:57.0724 (UTC)
 FILETIME=[CD6C25C0:01D9DA61]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DD:EE_|DBAPR01MB7157:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 694358e6-e6a6-49d2-70d1-08dba878f062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ShrhYDFBSTcn0oCMETeIye/7co5O2I38TnXnLXmsGBdBAtOMXMa51qqksqnVMrUfMsapAOdXIV/uUvnsJynIaHA6rCY6NwJHssZSPkAjKmelVSLbIpzJnXXhTVCf/k2llHHWCPBrsjW7QXOvqwKjg61wC4gYOmTQ8hI/hG8Le0FZhxZr+OoUtTgcye3lz7uv2J0qQ88vNRsD/mu0KMteS6wL0bdbProFBHfiJpuAhrqGOGqNX/yH5z8QiL4WgpwVC+nUSVcJf4sMVRp1dSxjdPEUQFZJ2vYFspYw/WE7BD7eKPbNhYyjIZ/7CIl3XXFWGmpZ3Oe+BQDuPw8JesWWonz4Kb+fWoJNL/50nwIayD9XT1GS5jbEoip1G9EzjAxouRVbzdHKv9rxoKbrTPpCMcM091g7Uer8hSsfMemGrcmLoifnhz4V/iCvJZbZjQUkyEa52KURZS8UDEtmhYsoOgUXqunyGwthjb2S6XR3SFNELeQ3Q1x6BAJQ869XUAgOMoaEq3u5OP+F70tkW6wUFbfQPW/l54T2BXrWcGd8B4tAqd3osSq2kvv3btMLTdI2tRGR34KIDSYCoanPkibyo7ToCYgGYMjgpjhVGC5Y8eP+MRzf9dGftTgSa8PtqtFUbSUA07t+xkvaC1HjL/J1L8ZV4/ClClBuzwvG7eNrXiRtJXcyOi/zJs+isWPaQhEu/NvTgG/zVVS2dyllFwiFTzMeXCxMJcP8JJFxxXc+iYM=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(39840400004)(346002)(396003)(376002)(136003)(82310400011)(1800799009)(451199024)(186009)(46966006)(36840700001)(316002)(41300700001)(4326008)(336012)(2906002)(83380400001)(86362001)(47076005)(2616005)(107886003)(36756003)(26005)(5660300002)(1076003)(8676002)(40480700001)(36860700001)(8936002)(6666004)(81166007)(356005)(966005)(110136005)(70206006)(70586007)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 10:15:58.4176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 694358e6-e6a6-49d2-70d1-08dba878f062
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB7157
X-Mailman-Approved-At: Wed, 30 Aug 2023 07:32:27 +0000
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
 .../bindings/leds/backlight/mps,mp3309c.yaml  | 202 ++++++++++++++++++
 1 file changed, 202 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
new file mode 100644
index 000000000000..a58904f2a271
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
@@ -0,0 +1,202 @@
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
+  It supports both analog (via I2C commands) and PWM dimming mode.
+
+  The datasheet is available at:
+  https://www.monolithicpower.com/en/mp3309c.html
+
+properties:
+  compatible:
+    const: mps,mp3309c-backlight
+
+  reg:
+    maxItems: 1
+
+  mps,dimming-mode:
+    description: The dimming mode (PWM or analog by I2C commands).
+    $ref: '/schemas/types.yaml#/definitions/string'
+    enum:
+      - pwm
+      - analog-i2c
+
+  pinctrl-names:
+    items:
+      - const: default
+
+  pinctrl-0: true
+
+  pwms:
+    description: PWM channel used for controlling the backlight in "pwm" dimming
+      mode.
+    maxItems: 1
+
+  default-brightness:
+    minimum: 0
+
+  max-brightness:
+    minimum: 1
+
+  enable-gpios:
+    description: GPIO used to enable the backlight in "analog-i2c" dimming mode.
+    maxItems: 1
+
+  mps,switch-on-delay-ms:
+    description: delay (in ms) before switch on the backlight, to wait for image
+      stabilization.
+    default: 10
+
+  mps,switch-off-delay-ms:
+    description: delay (in ms) after the switch off command to the backlight.
+    default: 0
+
+  mps,overvoltage-protection-13v:
+    description: overvoltage protection set to 13.5V.
+    type: boolean
+  mps,overvoltage-protection-24v:
+    description: overvoltage protection set to 24V.
+    type: boolean
+  mps,overvoltage-protection-35v:
+    description: overvoltage protection set to 35.5V.
+    type: boolean
+
+  mps,reset-gpios:
+    description: optional GPIO to reset an external device (LCD panel, FPGA,
+      etc.) when the backlight is switched on.
+    maxItems: 1
+
+  mps,reset-on-delay-ms:
+    description: delay (in s) before generating the reset-gpios.
+    default: 10
+
+  mps,reset-on-length-ms:
+    description: pulse length (in ms) for reset-gpios.
+    default: 10
+
+oneOf:
+  - required:
+      - mps,overvoltage-protection-13v
+  - required:
+      - mps,overvoltage-protection-24v
+  - required:
+      - mps,overvoltage-protection-35.5v
+
+allOf:
+  - $ref: common.yaml#
+  - if:
+      properties:
+        mps,dimming-mode:
+          contains:
+            enum:
+              - pwm
+    then:
+      required:
+        - pwms
+      not:
+        required:
+          - enable-gpios
+
+  - if:
+      properties:
+        mps,dimming-mode:
+          contains:
+            enum:
+              - analog-i2c
+    then:
+      required:
+        - enable-gpios
+      not:
+        required:
+          - pwms
+
+required:
+  - compatible
+  - reg
+  - mps,dimming-mode
+  - max-brightness
+  - default-brightness
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-frequency = <100000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i2c3>;
+        status = "okay";
+
+        /* Backlight with PWM control */
+        backlight_pwm: backlight@17 {
+            compatible = "mps,mp3309c-backlight";
+            reg = <0x17>;
+            mps,dimming-mode = "pwm";
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_fpga_reset>;
+            pwms = <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9 */
+            max-brightness = <100>;
+            default-brightness = <80>;
+            mps,switch-on-delay-ms = <800>;
+            mps,switch-off-delay-ms = <10>;
+            mps,overvoltage-protection-24v;
+
+            /*
+             * Enable an FPGA reset pulse when MIPI data are stable,
+             * before switch on the backlight
+             */
+            mps,reset-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
+            mps,reset-on-delay-ms = <100>;
+            mps,reset-on-length-ms = <10>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    /* Backlight with analog control via I2C bus */
+    i2c3 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock-frequency = <100000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_i2c3>;
+        status = "okay";
+
+        backlight_analog_i2c: backlight@18 {
+            compatible = "mps,mp3309c-backlight";
+            reg = <0x17>;
+            mps,dimming-mode = "analog-i2c";
+            pinctrl-names = "default";
+            pinctrl-0 = <&pinctrl_reg_pwm_backlight_fixed>,
+                        <&pinctrl_fpga_reset>;
+            enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+            max-brightness = <100>;
+            default-brightness = <80>;
+            mps,switch-on-delay-ms = <800>;
+            mps,switch-off-delay-ms = <10>;
+            mps,overvoltage-protection-24v;
+
+            /*
+            * Enable an FPGA reset pulse when MIPI data are stable,
+            * before switch on the backlight
+            */
+            mps,reset-gpios = <&gpio4 20 GPIO_ACTIVE_HIGH>;
+            mps,reset-on-delay-ms = <100>;
+            mps,reset-on-length-ms = <10>;
+        };
+    };
-- 
2.34.1

