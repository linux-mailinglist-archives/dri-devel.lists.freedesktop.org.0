Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7E57D10FA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 15:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0F310E5BF;
	Fri, 20 Oct 2023 13:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C5210E5B5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Oct 2023 13:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngEr+APnzMvcWgDgAl2CzeE2O0xkmvP7oCpPKHSg7usml8jaCLDNEY6pfVBQLRpJIqYsP0E+Fd9cGP8B40uaANLegcoqdVFD7IY8I+n7WoQNVAPPLXc7b9fDaSVUh8q1p6XoYrNYwUBE3Z9tAB4DeZP4Wq3i013TbdAFsRkd2hD0EWpQCjdSCSlRuktvU9OaZ4x8fqCoKndtpnoSe7E91H+IgugUUbFnHDTpWUyAApvmFO5A0bjHyksOfBDmSNFF+Q05ngFBzxhuNkv/FijgOS25Z/lHBd40pYDqSllvnusZc+trBuFLHAHPa/xAr1TAHPTBKlUSM9L0+cPu7D666Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNA+Hw6QwGM3O5n7svgM4gdZNh5Lp6FAvnOV5X3vxak=;
 b=L5C8RJvWXGqsJt9UNqqb/932w/bvyi4GACeO+lxx2LDhkJU5eJxnr3jWLTFkEVgPIFV4XzRXvN0Kp9MQa//81E23ytfypcNi5gZU5dnmJ2aToWdCxrNZTv550Z5XbcnDTO00lJvrTvSi8HYf9E+cdfU8YHtvVFAiY1nIMuqAi82ob2zGcB0LpJYaYqOHOXXAQxL2UPbXUIiqxNPJCT97myxZgSiCDs45KYmGlUQRKydpr0QUw5fiQpHiW4sl9uWXP3pnA0meLICetnlHYd3nWRRMGTTH51XKt69ABOD8eN44koWY/B/SOBz1n7BGNuNVAvD8uxWDeZ/DtmXSEqqR3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNA+Hw6QwGM3O5n7svgM4gdZNh5Lp6FAvnOV5X3vxak=;
 b=IGTcRPZ06KooiZ+2KZNqSk0mUs3lAcl6BEuYCV+tg3zWIxgX0FM8MMeQAkaxsO1fE74naOn7iGszryFR2xLQrXGIj6XOVfBiakwI9gaKcdBYvURYVTDFZ2HiEQTGx8WC4RR+r2rQuBasn+0TBu1a/T4KUMefJD5hD8UJNR313yg=
Received: from DB9PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:10:1db::18)
 by GV1PR01MB8770.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Fri, 20 Oct
 2023 13:55:04 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::6d) by DB9PR06CA0013.outlook.office365.com
 (2603:10a6:10:1db::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26 via Frontend
 Transport; Fri, 20 Oct 2023 13:55:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.24 via Frontend Transport; Fri, 20 Oct 2023 13:55:04 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Fri, 20 Oct 2023 15:55:02 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Date: Fri, 20 Oct 2023 15:54:33 +0200
Message-Id: <20231020135434.2598578-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020135434.2598578-1-f.suligoi@asem.it>
References: <20231020135434.2598578-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 20 Oct 2023 13:55:02.0828 (UTC)
 FILETIME=[05FED6C0:01DA035D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|GV1PR01MB8770:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f2ec5164-14a9-4056-7b60-08dbd174294c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZeY3AuF5YZHnl4GBBEl9IdyaHNnw3wDCF3QIDiaanCwXaMYhVUMvujnaeOnX3xueVSnUcYk5YkJEQHqFvNIyd90bk3+xlackSLTSfw5FxssRd+iYqJvosOvpXX2mckbNY8A5ap5e1kdhM481/PqYdkH31V5IyGMGu8a/6s36mov5NwCfN3SEK+BiWuXtVgne7M3GNyFZn/100U/AXWMXjKPaLbx0HpKKlyhh9VHU62FaE7TSg7nsbSIYNdBJfqS94qYAlge0YEYh7XLpi3kPs/vNZsRXNi33gqua8dOz6gXlSrPkZJB0brwaPCsGX6nHlyhXEdC5bNsbaiG+BqRzuYN2Jo8QWCZRon9QFl4NqlxofUA3X2fFccOPTN0/gvXn2y/bpzKgZTilpY/3yM1d+Gy+oqcVZUsmdzr4qAMJgk+/mzSaZ2bUXeiwA0obd5Suitf47Crwd7ipvrY5n05TwwzPb2DiY2Gx6Vgnfko36Xv3X6BopsOujWRSbyVokAXAepri4cswrwztAFQ+nU6/XIHa2vK4U74savExkrv58HN2lWqIwgpNY/0sbgQweJjjvvWCahXHIfRXOt68M8ItVgEMax+Sxb3G6Ab9xR98DI6QsFJY/pyLYfQnuNyFuAfMZjB5aQAMmtkY+qCI2dgfILbRTy3VFC0gODZupFruWR9eNZ5Yc/Qcq8Lhe+FJNryHYaO1hCn+g6XCr2snahNaesC9Ry5aOprlfpP7vKyzmU4=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39850400004)(230922051799003)(1800799009)(186009)(64100799003)(82310400011)(451199024)(46966006)(36840700001)(2906002)(110136005)(86362001)(81166007)(36860700001)(1076003)(6666004)(82740400003)(478600001)(70586007)(316002)(966005)(356005)(83380400001)(70206006)(336012)(26005)(47076005)(8936002)(107886003)(8676002)(2616005)(36756003)(41300700001)(4326008)(40480700001)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 13:55:04.1096 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ec5164-14a9-4056-7b60-08dbd174294c
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB8770
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

