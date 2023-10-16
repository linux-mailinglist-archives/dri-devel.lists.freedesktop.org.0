Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4AF7CACEA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 17:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D7010E211;
	Mon, 16 Oct 2023 15:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5CF10E211
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 15:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DH2DaGjajM3ugKSw7t2yJ4v5cI3qNki6R09L0BQr2KhGzwHp5w6i2FmNJrYvGd7SYQ6iieSCDFqziDMMzTBU46flp+Hxmv+KJmeZjeABrXdbtRFMAqNK0XO1UbfI8Toto9SRmKzPBo1za2S/gD3FRojkZoUc1n4RjL+JJcq7Eq/BBjrYw41yad9QJPSTctekVjQplGKyn55ge4bWANAJcO/TS+f/00GMY8ckYht8Wvjjj/5tA+cPL9TJka9lGThkO+dKJdgvE0jpLuu134W1WEFu328e7oSFUnoZDtEjFd2eD6QUsJXXN83WPT+WNaz7QXq7M/gavkJNojrI+P242A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Sf04cX8xj6HqeOX4705suelc72pKv+ouylBGyQLNTY=;
 b=OZoM7RfrXdRCMGiLn415YDBMKY5HOPOtObY9JogpMXdyZRbEAZvDQLKbaqbQIMmPQfssbKWv0Pmo6YurYfl8VLSGa4ezixDgSTMHNQqrUPmPlMzRfRYXF32Nf1T56oRj942WfPsA3nTJcucYOvE9sE8aiq7/V7zo8SvtVdKWthaYvK6lRyDpFewe+QTH+QhrIRfIUAo2tnFlUF0/mXEOwqbSch+N4JABvQ+OaJkarRA33E7GHU+ER868EEgaP2J3u/H1kxpx0kIAgllP9NyyARG2PEgUEZq3tPb/74AuQifsh2pGBC16ytwnl5zyR8cO4nq+kynWeAhvn3Bk6q+6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Sf04cX8xj6HqeOX4705suelc72pKv+ouylBGyQLNTY=;
 b=PNiu14tTNHQeOV3x3hPWIWpdnRP97/zO2JRA1jsHbTZOK9e1GOjl0h5KDngw6N2bkYGRi+E7/6HFAvOoiPQkeUAc0dFwOgmRda5N765A88azCZ0NhpHWDFg08UEPbpVOx4IFRM6le3lAPFbONkZ8G52iM4v8i92USxSk2h/xRgQ=
Received: from AM8P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::29)
 by PAXPR01MB9027.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:2b3::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.16; Mon, 16 Oct
 2023 15:05:57 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:219:cafe::2a) by AM8P190CA0024.outlook.office365.com
 (2603:10a6:20b:219::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 15:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Mon, 16 Oct 2023 15:05:56 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Mon, 16 Oct 2023 17:05:56 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1] dt-bindings: backlight: add brightness-levels related
 common properties
Date: Mon, 16 Oct 2023 17:05:54 +0200
Message-Id: <20231016150554.27144-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Oct 2023 15:05:56.0419 (UTC)
 FILETIME=[43AE5130:01DA0042]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|PAXPR01MB9027:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 17a726e0-08e7-45a1-a5fc-08dbce596683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QVBbpgsw0FK4LH9clR2SCgGSYV4gCF9xIqVNiLZS8Fm1MfRPSh9SnKIYF/YTMc6oHv7nzVaUyU73yQlFQlroOaZ2R+GgBtIRs8ZUrps7TTlUQI+HAvclpdfGc5bERnd2SJ19IRuqf6IB+YnXP0XMv46rshXOVchbxD1KNevkvvYSrUW1p5nxE94kR/sjajcWq1RNifO8CDAdmf1d3A7Qf6l+1BBZzLtfQ273YBlTl+8M/JN5dTs9kHLELsgc7mNfhugorqN4qQhYvFwmlAEq8j5jU3zBQGvgtkQ9CjAG6D4sLmauVTA1U/Oh/XQrUAb3MwbH5Eb4VwNYp3+bIbdulD3XC5bwfgOaSiSoKM7mpPp8Pr3LRAuPr3qO5Bxw75DZj9FV/F+15OhuuxLmOC1WZ97ZhLdqRZyotDSQQg2NoJFB/dlx9tZwK+aEgrI0lCQnjkSO6x8n0EMy3qhVxXRcsIGVGzfFSgmZu2APte62IlbqdNKt9BiFKNWHE6L3UfGeR9IwYXMv/DooU8W1Yf7+U1kKZLfVpCmA6RUj6SgKGe73VkvuYqzlGOHUpsKOh1u1efgnFLkhVqKnZi//a4XYxjsLapQ3cC3B0OEBHo47ES8aTSUJrheBA0bTDzk+BbSz1q89tieYNXOTEmjBingBf0Yc0vyZdzXf3W4cKRrVyhV7zA2JhOzmt+S3Lboqg9YXxi0JVvxOkWn2epUrnw0G7MqxKmEdEl4OPiBJivir52yER4fio+e9bdEKVMJ6Qkf/
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(396003)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(36840700001)(46966006)(36860700001)(47076005)(40480700001)(356005)(81166007)(82740400003)(478600001)(2906002)(70586007)(316002)(70206006)(4326008)(41300700001)(5660300002)(8936002)(110136005)(8676002)(107886003)(83380400001)(336012)(1076003)(26005)(2616005)(36756003)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:05:56.9434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a726e0-08e7-45a1-a5fc-08dbce596683
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB9027
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
Cc: devicetree@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>,
 linux-leds@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Both files pwm-backlight.yaml and led-backlight.yaml contain properties
in common with each other, regarding the brightness levels:

- brightness-levels
- default-brightness-level

These properties can then be moved to backlight/common.yaml.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 .../bindings/leds/backlight/common.yaml       | 17 ++++++++++++++++
 .../leds/backlight/led-backlight.yaml         | 19 ++++--------------
 .../leds/backlight/pwm-backlight.yaml         | 20 ++++---------------
 3 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/common.yaml b/Documentation/devicetree/bindings/leds/backlight/common.yaml
index 3b60afbab68b..e0983e44934c 100644
--- a/Documentation/devicetree/bindings/leds/backlight/common.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/common.yaml
@@ -33,4 +33,21 @@ properties:
       due to restrictions in a specific system, such as mounting conditions.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  brightness-levels:
+    description:
+      Array of distinct brightness levels. The levels must be in the range
+      accepted by the underlying LED device. Typically these are in the range
+      from 0 to 255, but any range starting at 0 will do, as long as they are
+      accepted by the LED.
+      The 0 value means a 0% of brightness (darkest/off), while the last value
+      in the array represents a full 100% brightness (brightest).
+      If this array is not provided, the driver default mapping is used.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  default-brightness-level:
+    description:
+      The default brightness level (index into the array defined by the
+      "brightness-levels" property).
+    $ref: /schemas/types.yaml#/definitions/uint32
+
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
index d7b78198abc2..f5554da6bc6c 100644
--- a/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
@@ -16,6 +16,9 @@ description:
   can also be used to describe a backlight device controlled by the output of
   a LED driver.
 
+allOf:
+  - $ref: common.yaml#
+
 properties:
   compatible:
     const: led-backlight
@@ -26,25 +29,11 @@ properties:
     items:
       maxItems: 1
 
-  brightness-levels:
-    description:
-      Array of distinct brightness levels. The levels must be in the range
-      accepted by the underlying LED devices. This is used to translate a
-      backlight brightness level into a LED brightness level. If it is not
-      provided, the identity mapping is used.
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
-  default-brightness-level:
-    description:
-      The default brightness level (index into the array defined by the
-      "brightness-levels" property).
-    $ref: /schemas/types.yaml#/definitions/uint32
-
 required:
   - compatible
   - leds
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
index 535690288990..b71f6454a4ac 100644
--- a/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
@@ -11,6 +11,9 @@ maintainers:
   - Daniel Thompson <daniel.thompson@linaro.org>
   - Jingoo Han <jingoohan1@gmail.com>
 
+allOf:
+  - $ref: common.yaml#
+
 properties:
   compatible:
     const: pwm-backlight
@@ -39,21 +42,6 @@ properties:
       Delay in ms between disabling the backlight using GPIO and setting PWM
       value to 0.
 
-  brightness-levels:
-    description:
-      Array of distinct brightness levels. Typically these are in the range
-      from 0 to 255, but any range starting at 0 will do. The actual brightness
-      level (PWM duty cycle) will be interpolated from these values. 0 means a
-      0% duty cycle (darkest/off), while the last value in the array represents
-      a 100% duty cycle (brightest).
-    $ref: /schemas/types.yaml#/definitions/uint32-array
-
-  default-brightness-level:
-    description:
-      The default brightness level (index into the array defined by the
-      "brightness-levels" property).
-    $ref: /schemas/types.yaml#/definitions/uint32
-
   num-interpolated-steps:
     description:
       Number of interpolated steps between each value of brightness-levels
@@ -69,7 +57,7 @@ required:
   - compatible
   - pwms
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

