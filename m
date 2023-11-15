Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ABE7EC732
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9282D10E058;
	Wed, 15 Nov 2023 15:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2084.outbound.protection.outlook.com [40.107.15.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E03810E078
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:29:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atVTlEqZJ/MKP2zj4h/WIS1A5z5fog4EzQyhOLIHRGum7VmR5vkNcqoH9XRStXs+VPN6FUnr7KZfZrgFEECOqFjfCVCVpZExGXop+kKpRbw0qKdyJcC8pPz7vc/zwNn0BWdtYI5mxGkWpjcy8W3OSkr9cfNGb0gzBf9qBmeo+EhQ2StnRL3lPDkKZ3YVfLVa8YxvV0GUJuQKaj61yA4DMuniDdH2qeyOdmqLy8oMuoBwW5obS1V3fVy4nvWR1KJA4Dyd7Vhjgmwzr2FEpTtqJueHdThG6311FWL5QKcuiyKcm++Oh4rnofb7ey/c2CDAGCeIlLULh24PiiqvSiyxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8Rt5yAU7/6upj6fUvNU9Dy5Iq5yS4hhLCvDxIwSmAg=;
 b=U/91KHVtJ1W0NTfs4uIklG4vAjxUF6SfdMcmJRUFsF0p68zuhkDmBk7Brj2FJNHFXVEnVx0CSZWCGg6ozRuOzeCxH1FqBLwIl+KuoT+v4r1Fl034nKhcGzaEKx/4CHSuzqcpCOjRFH8M8IYwe/ee1bIZmSVBZdyK+2es729Cy/b9X1Xb2ys+RwvZpyL2v0AR/ckqyJ+5JxzR9G0kfbyoIeMeoS7z2OQsDJ+0AihcTgg9ftvB1NP/u7D+nHvb6ragKIQfAYqP3gyO6od9veV8snRYZaCsHMhUBSwranl8lgav8hbvT9C9+fTVvu2hceCJD744MfIr5jZCipklUoyx7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8Rt5yAU7/6upj6fUvNU9Dy5Iq5yS4hhLCvDxIwSmAg=;
 b=hZHouSycTQTJSPRkGYsWbLR6WT6OcMxSw/5vwKbHeAz/Z20vvEflQc0quqS4BvT+68ZIkn/SYIbIN9mesdxRYFBJg31jayYQ+Z36O+x8SHF+n2Eb1We8r5J6gVvG0YG9oUW64eQHGHVdTxJeoPCx+41sYX65rzqHjf6LG+9Nj9o=
Received: from AM6PR10CA0057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::34)
 by AS1PR01MB9564.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.28; Wed, 15 Nov
 2023 15:29:09 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:209:80:cafe::db) by AM6PR10CA0057.outlook.office365.com
 (2603:10a6:209:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Wed, 15 Nov 2023 15:29:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.20 via Frontend Transport; Wed, 15 Nov 2023 15:29:08 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Wed, 15 Nov 2023 16:29:06 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: backlight: mp3309c: remove two required
 properties
Date: Wed, 15 Nov 2023 16:29:01 +0100
Message-Id: <20231115152902.851715-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115152902.851715-1-f.suligoi@asem.it>
References: <20231115152902.851715-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Nov 2023 15:29:06.0647 (UTC)
 FILETIME=[78B6C670:01DA17D8]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|AS1PR01MB9564:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dda63b24-e33b-4c8e-b5a6-08dbe5ef9c86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uAXtlLEObV4KZivQzzFfKIdZHXC341i/eL+GlX6Ii54sUqhPvAvedY67buIHvZsJYgBJdWlQYddPPR6aaCOsf6YF7CRZhUAw1HKz9CEO2bpOpO1QxqxLCUdek19pBWGqruKLQxkElfWqngb+NJrtHWJR9E3mKLuuuZB+nM3YBN+gan2w13Ji5MDItAAtYUPAv073Z43O4YYPvs7MUFN4n45UlQQnt1Jlho8Ybpojg4xGyIxU4CdxtyjsBao3F0wJjgMwtucZDrD8iiPvv9yNBoz74Z3v8UrC8HnnpU7SWxXHry1ewZh248smww91MkoCJLDsSVg/oIQOWp+WWp1zyO319UAM4DSp8q8vQFIje2x+YHp8/1yrtBwAFJ7ZFQEkVkd+zfLB5rBGLUVXrmGqjjgUg0MaAebu5Jt49nc708aNvw1Yqc8Sxvsc9WMdOZayNa9/PCKCrHSSw/ahWu626LIAZ6Hkbdxad12PWnlUAOA1A/dFpbSPqTy+W9/J3SYP8JawKWWskdoRa3jdvjLlr7Jsd6BYPZZ/k23OMgAKbj7eJcQ0uueb4UwqKznznOBIMQf/LuxQj2fNkMWJFfjaxKtgiwg3IH3pCBI129zwuTRHwzmUG7p40B4p18ntimmOurbHkvR4K/f+Bhb5qlAbOYfFToi7yicmOXRuZJ/RxBb7h3yaHMD8v0mod6oghcX3mP+dO0erpEA7JlzlNk7oQMcYIHZKAT9h1rGwgBjtHgE=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376002)(39850400004)(136003)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(46966006)(36840700001)(966005)(478600001)(8936002)(6666004)(4326008)(8676002)(41300700001)(1076003)(107886003)(316002)(70586007)(110136005)(26005)(5660300002)(2616005)(70206006)(336012)(40480700001)(2906002)(47076005)(356005)(81166007)(36860700001)(86362001)(83380400001)(82740400003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 15:29:08.8138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dda63b24-e33b-4c8e-b5a6-08dbe5ef9c86
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9564
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

The two properties:

- max-brightness
- default brightness

are not really required, so they can be removed from the "required"
section.
The "max-brightness" is no longer used in the current version
of the driver (it was used only in the first version).
The "default-brightness", if omitted in the DT, is managed by the
device driver, using a default value. This value depends on the dimming
mode used:

- for the "analog mode", via I2C commands, this value is fixed by
  hardware (=31)
- while in case of pwm mode the default used is the last value of the
  brightness-levels array.

Also the brightness-levels array is not required:

- in "analog mode", via I2C commands, the brightness-level array is
  fixed by hardware (0..31).;
- in pwm dimming mode, the driver uses a default array of 0..255 and
  the "default-brightness" is the last one, which is "255"

NOTE: there are no compatibility problems with the previous version,
      since the device driver has not yet been included in any kernel.
      Only this dt-binding yaml file is already included in the kernel
      repository.
      No developer may have used it.

Other changes:

- improve the backlight working mode description, in the "description"
  section
- update the example, removing the "max-brightness" and introducing the
  "brightess-levels" property

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 .../bindings/leds/backlight/mps,mp3309c.yaml           | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
index 4191e33626f5..527a37368ed7 100644
--- a/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/mps,mp3309c.yaml
@@ -14,8 +14,8 @@ description: |
   programmable switching frequency to optimize efficiency.
   It supports two different dimming modes:
 
-  - analog mode, via I2C commands (default)
-  - PWM controlled mode.
+  - analog mode, via I2C commands, as default mode (32 dimming levels)
+  - PWM controlled mode (optional)
 
   The datasheet is available at:
   https://www.monolithicpower.com/en/mp3309c.html
@@ -50,8 +50,6 @@ properties:
 required:
   - compatible
   - reg
-  - max-brightness
-  - default-brightness
 
 unevaluatedProperties: false
 
@@ -66,8 +64,8 @@ examples:
             compatible = "mps,mp3309c";
             reg = <0x17>;
             pwms = <&pwm1 0 3333333 0>; /* 300 Hz --> (1/f) * 1*10^9 */
-            max-brightness = <100>;
-            default-brightness = <80>;
+            brightness-levels = <0 4 8 16 32 64 128 255>;
+            default-brightness = <6>;
             mps,overvoltage-protection-microvolt = <24000000>;
         };
     };
-- 
2.34.1

