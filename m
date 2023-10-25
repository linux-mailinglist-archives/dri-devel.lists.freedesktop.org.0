Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C057D7136
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 17:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD72F10E5CF;
	Wed, 25 Oct 2023 15:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::627])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670BC10E6AF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Oct 2023 15:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nOdM2tcoHOyZtrbSP/Pj9WMkL/m3R71CBNTp2iYP2ilBZWT8baHPaexceKWwoU2TU12GA8+wGhohBSVB6SkUzoxp/tHLcYemoQID42CtOvla1KWWi5ylXxohM2Lft5eTtfH44W/HevZUy+dHwflp8ed3cMhYD+vQwsd5V8OzPJfxSkip97TyEUDlz/1xZ9x7l/ql8jQ5mNbsfSllxf6GceLCoFhW8ARCvJnP61SMuSHsReFx0Qi6srQrFeRA1MuriD1ivtjULpYeMMdTJ+1Y43n9CSKyT/hAOLPayVURRAHQdT6iRGesb5QPcaYpcFOrbIF4IE08FGaLyaa+JS645w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGUZwAaFuAPJBm2px7vb6P5m+iiV8jGnPBLUM1awQI0=;
 b=RX6Psmfs8QpMAfqLY+FCLhjGm/GnI8C/t6ZQa6tTsqjJEOZb/ivvjo8IwkfjGqiyg3nHALZ9sgBMpGoaIRO6AUt/FXvNiBlTck+3RQv1/y9tllFTZPqPQR3kbONX7jYI5D9vmHfZuxfvuTBcuKUXU35RTxXsYytVm+wCW7Hp5beig+e4HXrcpWEcfTHgm+2Ng7xYijJ3cRXqbWZsgqjTKtms0y7VQHZNI7FlcKnfSjhrWxdc8U1alb4Ew3Y84Yuq+E1wjxgqbFE6v18OYna8fNTwZDsCbxUEA6LkB3hkcT8GNI/gLLgDRvs24EC4qX9Mq4paE1sNJL8aQ1aMNIaGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGUZwAaFuAPJBm2px7vb6P5m+iiV8jGnPBLUM1awQI0=;
 b=camlQTDK7ObVisiROZvgFN36kb0nsYu0cyfHd0f8M7eUvZduXrqi6G9Lap/Z0cYi5DXsJOu8lNTjA9mFFs+l8XM0vSb4rdwBijALwNErqS+ahzs2qNC1WFCicZETMpnrUBqN+uZbpGu2boixaS5LHIdUTjAj4cwPubW56brwViQ=
Received: from AM0PR06CA0093.eurprd06.prod.outlook.com (2603:10a6:208:fa::34)
 by AM7PR01MB6851.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1b3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 15:51:05 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:208:fa:cafe::76) by AM0PR06CA0093.outlook.office365.com
 (2603:10a6:208:fa::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Wed, 25 Oct 2023 15:51:05 +0000
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
Subject: [PATCH v2 0/1] dt-bindings: backlight: mp3309c: remove two required
 properties
Date: Wed, 25 Oct 2023 17:50:56 +0200
Message-Id: <20231025155057.886823-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 25 Oct 2023 15:51:04.0513 (UTC)
 FILETIME=[0F8C6B10:01DA075B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A78D:EE_|AM7PR01MB6851:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5bd0a7a0-d7c8-46a9-892c-08dbd572326a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/cMpoTg6PH5Am5Af5m78cIoiFZ0LOEXLxo28tT7dJgfuQ99L9Zbyoh+znGb2bTbJETbCIlgaV5NReCazyjROqxQEhL+95RWeqESljasJIS78Hzu6QIiYRpiw59oIbsIfbH+gklQWAtN00s1sBN5byHeAHSQJZcx0CChyKnqxfRKRt3i/z22yRPhFXoYIA+EFu8dq/u4TGlEjTlhiV8IxVfjdBCNeqzvods+z1vQ6i3Dxn37PgSrA0Y9NyNH01I/95qRLFNBQAglKzMQR06iHboIXsekMSq0Rk70+PKmGBOOMFQj9zi67Rn1Jw42xjGoMo52bUGGtfGsitpqUrJE7eY1WekJd9SDIx8ZSQKRihiHuK0gFvNdVfs+sSGjJkim9gu31MD6a5tSvXNCmlqkcEpZTqB1nunDiMGReXJLrYiSUYnc1LUROiqyrACQd6sV5dbDy3yMvC+kPOKPX2inTIhiqk5/o+gjWysZw+AYQXpXtBOV+E2E0UFSSbRC/tssERK5GVzFbsOKjZ83BI8p1V6X5/PvPyoOTeRQUXzXcNDb2PGBMDoo2JG3+4gyb3FHEnYr2/OxJSX4LyPFZa5+nu3/UrV3YG+oqPVWivbz6o/2SlZ3Tg5IZQRjt6Q1+1U30XGHdwLaF6er97OwrXc1Tt+ly+917imEzYOpMmD+eJ2B9uwgEG0lKg4eogRvO+h1U8kQi/+TgSCaIbPOeGPA0xJhwt21mSm5+ZkEbSZ8Z8OUSW/u347NCRkgVSoGZRIR
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(396003)(39840400004)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(36840700001)(46966006)(1076003)(26005)(107886003)(336012)(40480700001)(36756003)(86362001)(81166007)(356005)(83380400001)(2906002)(5660300002)(2616005)(478600001)(6666004)(47076005)(8936002)(8676002)(4326008)(36860700001)(316002)(41300700001)(110136005)(70586007)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 15:51:05.0950 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bd0a7a0-d7c8-46a9-892c-08dbd572326a
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB6851
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

This patch remove the following two not-required properties from the
"required" section:

- max-brightness
- default brightness

These properties are not really required, so they can be removed from the
"required" section.
The "max-brightness" is no longer used in the current version
of the driver (it was used only in the first version).
The "default-brightness", if omitted in the DT, is managed by the
device driver, using a default value. This value depends on the dimming
mode used:

- for the "analog mode", via I2C commands, this value is fixed by
  hardware (=31);
- while in case of pwm mode the default used is the last value of the
  brightness-levels array.

Also the brightness-levels array is not required:

- in "analog mode", via I2C commands, the brightness-level array is
  fixed by hardware (0..31);
- in pwm dimming mode, the driver uses a default array of 0..255 and
  the "default-brightness" is the last one, which is "255".

NOTE: there are no compatibility problems with the previous version,
      since the device driver has not yet been included in any kernel.
      Only this dt-binding yaml file is already included in the
      "for-backlight-next" branch of the "backlight" kernel repository.
      No developer may have used it.

Other changes:

- improve the backlight working mode descripion in the "description"
  section
- update the example, removing the "max-brightness" and introducing the
  "brightess-levels" property

NOTE: the "brightess-levels" property is present in the last version of the
      common.yaml file, so it is not decalared here.
      For this last version of common.yaml file, see my patch:
      
[1/1] dt-bindings: backlight: add brightness-levels related common
 properties
commit: d5272d39995f4150062a67e6f2cef556edece740

Flavio Suligoi (1):
  dt-bindings: backlight: mp3309c: remove two required properties

 .../bindings/leds/backlight/mps,mp3309c.yaml           | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.34.1

