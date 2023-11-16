Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E99027EDEEC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C899E10E5C0;
	Thu, 16 Nov 2023 10:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2059.outbound.protection.outlook.com [40.107.104.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E3310E5BE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:53:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ensroeWe8OgikfbRvbYQYg5kqhtHgEBMizdPeCWDplwBzFJHyOconX4VADQX/iyUzxf7s+KGHA4/OTqyTnyb/bob9Y7DdUWJ9IhmeyBY6Grd/dcLd3GshnnKYY09B4MbupeN/wf4q7x5HfHHZhjdI9JiGFfN1+WfzN+4mGnfq3dqsFRzZ4qO+gqoUD0FMbcAEigI6m7OOdvqEOnqhCyno7uhHJ2Y9t8W7v6VQMTAj3zjkY8g3Di9SNx57BHjMGLvNDLqiRHmaGVlAW3mv1Mwtwn3xI8NozSPpOKOpkkxuqT3PVFeLTd+easdXwpn6XL63yLObJsnfz5TOIV4JQEutQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXGX5/3lV8ls++zZ8s81a873PdqAXsZCi8zrTLpHNn8=;
 b=UyYr4P/tFAxoRbp9CPUYO8K6JzTL+VSg7lEI04fUXBqGEdnUzBCPMpCeT4qXfi95OqzlSqqxMWsH88m8aqntTzGEgJR+D1Qh5PJE/VVf9f8ihMDTvlITa7yfvSIVP1lUCioiSss02YE7o0Twzo94M3HyC6nzDvPF5UBZ6uP+U5KXypuylc8ziMecJNOtbL2Ji3yPA+E4hYRM/FojaGztQ9M8jdYAYsQA1cCK1XF0UJN9IASzoTewsRHRNYd2KWAa5JAn7EnRgSV09TGjd+lc/feWqwzDA3LTibpsN93o+GiTRqP/Ci8MxeCnOuFjZAhPWuHIZlZdqSn1QSKMCMaTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXGX5/3lV8ls++zZ8s81a873PdqAXsZCi8zrTLpHNn8=;
 b=UytH6+ZlMF3FwS2/ib7d5186NeA3iqiaSbzZln+4s3DMJSoYkbiTH8OgXikAG6iTrUV7fOJMWQwrGI912QtvVknWYF0B8OKYnPDlGPBmstiXM4V2b8nW/1QEYQeTC3qLCuQ31QnmwfHJa9Pl8oHgN7zZuNoO3Ef0fQNz+BbkFEA=
Received: from AM6P191CA0082.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::23)
 by AM7PR01MB6771.eurprd01.prod.exchangelabs.com (2603:10a6:20b:1a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Thu, 16 Nov
 2023 10:53:29 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:209:8a:cafe::3b) by AM6P191CA0082.outlook.office365.com
 (2603:10a6:209:8a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 10:53:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.19 via Frontend Transport; Thu, 16 Nov 2023 10:53:28 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Thu, 16 Nov 2023 11:53:27 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 1/2] dt-bindings: backlight: mp3309c: remove two required
 properties
Date: Thu, 16 Nov 2023 11:53:18 +0100
Message-Id: <20231116105319.957600-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231116105319.957600-1-f.suligoi@asem.it>
References: <20231116105319.957600-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Nov 2023 10:53:27.0512 (UTC)
 FILETIME=[2108CD80:01DA187B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019C:EE_|AM7PR01MB6771:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 68edec59-ea35-4a3b-ad42-08dbe6924467
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /4L61OzdSGeTjKnYGg9tQ3JPGao2LfG4i4eEW7m8BK9oolrNQsmE6c+PEgK4AZPVzIUGkT9naktt2Z++J2+tJ/RevNHdwhhjPogecsVMzRe/MNDniQvXI5EvA+maU/f2XnQZIc1aX/DZVBixzi5NsvGb3Lt/hP1d85W/7/BrlllYZwnqFfpZ/5gJ6y648WeS/BL4f9ZrXLN9+74BGvfaQkVLuCmADsMQ/MFe6McaGVp4vbQyus/SVMBRmIq3V3SdJAgtPju7VoCh6feNnTBUkL1rrxoiWzXkYIWeN4POSoe4CAISCmjUTjpjYttEshdDwFb8EM1yvptgtGB8FVNYiiEtgX0GtevWSMjCZFMviwULNbrhDstqnwUpZ+ClXbn7PJavlgj0SQRZZPNyt4fX7lo3Kj2o16oH1Kg9EFVw+aZrtoYZwl4M7yGWT1x1w/ut/THTI5d2gRaVSS3KXqufjQLIB1sa06wP8+Un9LVl2WLwZMg60mT2xMCqOne0s8albx2d4b8mMH2VyPZXmFhxWYrm1uGKdFcX5U0Xjvt21mhcMr7CjsV59OAgh5Jx8clMv/ExXKQjP/KR+OyIcHmhtPxGt51XKawBKuV4xqN1zj83mT58/Z1KXuTgCV7ZUWcH8+3BAbsNC6RFzjjYgLQ2qzUSdieaUsali+5DQJnJa5YBPd04aIdn/mhGJM9faHYHPZU9+GilQnfXThwMTf1kYWPSXzxALM3ADVdbTjLP8qw=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(396003)(39840400004)(346002)(376002)(136003)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799009)(46966006)(36840700001)(70206006)(70586007)(54906003)(110136005)(316002)(83380400001)(2616005)(478600001)(6666004)(966005)(36756003)(1076003)(107886003)(26005)(336012)(81166007)(356005)(2906002)(41300700001)(47076005)(5660300002)(86362001)(40480700001)(36860700001)(8676002)(4326008)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 10:53:28.9378 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68edec59-ea35-4a3b-ad42-08dbe6924467
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6771
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
 Conor Dooley <conor.dooley@microchip.com>, Flavio Suligoi <f.suligoi@asem.it>,
 linux-leds@vger.kernel.org
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
      Only this dt-binding yaml file is already included in the current
      v6.7.0-rc1 kernel version.
      No developer may have used it.

Other changes:

- improve the backlight working mode description, in the "description"
  section
- update the example, removing the "max-brightness" and introducing the
  "brightess-levels" property

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---

v7:
 - add missed patch history
 - add missed "Acked-by" added in one of the previous version
v6:
 - check and resend for updated kernel 6.7.0-rc1 (nothing changed compared
   to the previous versions)
 - add this patch to the same patchset of the MP3309C device driver
   Note: the patch related to this file was previously a separate patch and
          sent in two versions (v1 and v2).
          It has now been included in this patchset, starting with the
          version v6.
v5...v3:
 - non-existing versions (the last was v2, the next is v6)
v2:
 - add more explanations in commit message, about the the non-existence of
   compatibility issues with the previous versions of the yaml file
v1:
 - first version

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

