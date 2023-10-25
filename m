Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BADD7D7138
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B6110E6AF;
	Wed, 25 Oct 2023 15:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6691E10E5CF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=np79aioTZorxujSoRkK3QdzJc7TphBUg2IZmJsVQBsDOsKNZB9H1n8mYOqsurY1KJ+a3ypkDO+FwXlRIS3zMHzNxylqNAbcdf7Wj557naVcjwstqiMU0Dwyu8mVPE0q5muMWKGUT53UMaIgtCuvB7gNVvlK8rpaTWFiwWDTd5t4Kk6TCxqijNZEwVc03U38XZJVfJzNMjtBSAp9QQGx7x0rvkVyj3kuAJ0YOrQtKL2vqjDlX7fl764kgJNCWdntoNv6NwblXbAmI5V7WtmAneHDZ42XjB0SLjWYPXgRBJtVbeeMzUmOJpcwlJGsiKhSYBGGwdieySFqUCMjOB8VfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSp4jKkSMfpcjolSYpdKkatFmnOUaRkI76ONWOefzII=;
 b=iKRHrQ7S7eInGJ8X/yQKJqszHIr+pMN3xcD9uKKcXw7fMS17sSOxeJUXi61Y8SfdxS57YVO77AHUC3hC5qBX6ATmcxbi+hT1LAZFwObg5rKVtRUn7nEWmQQKhe6NP0y6IbYfcuI1lZbc4NIq/NkAE1iIuZxD4IBGzd7Ox5VHpvnv9Pa0g4ySTc7w87u1yfOSY7XRPyrKUD+MYtqAA7/ik6vO2vHwzFAHv+eiwEvLjE3D7eAulLzPpJmoHCEmzcUBrpGrWu3YZ9ohJ+EYzemJRZMqXLlSTiF/+s0WvHbKVFiGPxo6bQ1i7XO1MVEasEB1hQN7UHWqMl6GH5d1uuP9SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSp4jKkSMfpcjolSYpdKkatFmnOUaRkI76ONWOefzII=;
 b=Ukg4he58bSqakZEmB6NAZSEKWRE85AjCmMVQKiCwNlyvAkEVhuY20kc6IwaA8kz7TCF3IO2l1fT3H7xaoNNGwfO7huC0b+/r1GIraGR269U3QYf++/FHrqDq78U6lFT26s4E66iCJDL/XmSudnPULg8hRkojO5WUqssN1MBMhf0=
Received: from AM0PR06CA0091.eurprd06.prod.outlook.com (2603:10a6:208:fa::32)
 by AS8PR01MB7894.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:359::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 15:51:06 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:208:fa:cafe::ac) by AM0PR06CA0091.outlook.office365.com
 (2603:10a6:208:fa::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Wed, 25 Oct 2023 15:51:06 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 15:51:05 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Wed, 25 Oct 2023 17:51:04 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Date: Wed, 25 Oct 2023 17:50:57 +0200
Message-Id: <20231025155057.886823-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025155057.886823-1-f.suligoi@asem.it>
References: <20231025155057.886823-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Oct 2023 15:51:04.0528 (UTC)
 FILETIME=[0F8EB500:01DA075B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|AS8PR01MB7894:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 17a1cd8f-901d-41a5-6f91-08dbd57232f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2i1U2udSDvkOotPnqzpQAvoHiOmUSXqKxlRP/ol7n5T8ySj4lqhaue9x6/1bxKpnQQlUea/vE1gQDSUVZ9BQ0041wtxg6RrZ8maUamxSPbdqVA1j/i7qEv4AUnRM2G5mYsjycCoNjXWQaYpA6V4pXXLxP9m4hhHsHe8H+dVfy7DWfQwMxpvp27AAgM1x1pmvbv+IT+EBvwIOGfmr525IFmoV4VFC+C6sKdGkn0DHMhKRpb0NCWeM+ScAKwTyvQpUbh8ZzvvReIPmqpscVk1Kson0/uDrSj2QySbV2P60MZCvx8LRj7VPSFgs10s0PfjzvGs3iDCTx/bQhh5pxAYiyVsei6sX2DxDDQUo7ehKxg9EqaUu4Q/Zk3IUWZhpAw0GpbF4e3JGGZzzv2Ob8+AeamuvfxYjBAMCNO4tuzDUZDkFyDLTJmL1Ei/cF7YiD5GUYh+JYC8MTOJIZHUOhxJnCC4zygIStlvQ/umSQ8NIiURl2EORlS6qZrkm7+pgPrU3V5XTjfxey/BcDtu4NeyVlJDDNn+gF6vecBMlUHTu96kHdd2YWLB4yC6u4YGYo3mc6miCXq5GJxokmJByh+LjWS74OEoPezdeVo5WNvxSEN81MfpSJ/zIe0UFKaAgt+CXte5tFcdQhgxOngO2IYa1tfc5xmwvKb3hKhDxS05vSbkD7LgeM+BkS31hn95VMAWt+FuEF9bgImgIVyTJRqZjOBQA9EjYKTd6YfHgua9XD7w=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39850400004)(376002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(82310400011)(46966006)(36840700001)(8676002)(40480700001)(4326008)(8936002)(86362001)(6666004)(26005)(70206006)(70586007)(316002)(107886003)(1076003)(356005)(36756003)(110136005)(966005)(478600001)(47076005)(36860700001)(81166007)(336012)(82740400003)(83380400001)(2616005)(5660300002)(2906002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 15:51:05.9856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a1cd8f-901d-41a5-6f91-08dbd57232f2
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7894
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
      Only this dt-binding yaml file is already included in the
      "for-backlight-next" branch of the "backlight" kernel repository.
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

