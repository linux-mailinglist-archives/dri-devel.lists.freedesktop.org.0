Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 088367FDD83
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 17:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33FE10E63C;
	Wed, 29 Nov 2023 16:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2044.outbound.protection.outlook.com [40.107.241.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616B310E63C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 16:45:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2drbbJzOZaj3PJ/vFvvYVd0xIqcNbN4apl/1gN7n3kaDXLPhSPqFqkoCD02VgoMQXfgfk4CFzPGAmcJVqo7pUNwC50POU0v2EUj0xji8B/8T84Cbl1QutVOhcNCE3vx7DWDzNvHNJUGrjBLpxGpID6/40toq78uaVpi1D/Tj35EjBTu18+12TgVgfphUOSAOcXvuxDvihSWeYbu91P1kPe3Vwal1Ltc3a1NSIz5nH7Q5uWP87oL+OK8Xx76pTeRt/muAwQvPXgdNNqtXhEUDwO/sS7SM7/BWZtoQbixpwlsHzOzHQNEiV7KI3gwCLBDGfq+nd1bz79DtarZEIkKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YmLrSXgTAY2ITY2nCiIcc4kvwsLALJ+OU3ok6sin4o=;
 b=UPjNVLHaLYvEwDR2VLqTXngk282B5PtCfUqnrzQbpu3q414yL4io8peWTb9KFec07saxJmmFDqVVhjFZyL72LWs7QB9Pg8pfL5tf1fGZk0NUst7EF5ctXAQahz4QJeTHbVb/MaIy0LQ7ecnKAnYhNGcIh0mveFDs9OUPG7aBqoQ38u9ft8g+NXky3P0aNz0IB4BNUyAXRwhiMlNHAxMoQNbRtxjBQdyp0L7sr6m8jlOvWhRqV5CsYOwMGIyxdAxc1Eh9gENOLlSxUMjzcues1f5gC4C9KGNAs0+wNsKpC7LZlPOPbG224OJuefvZdXVDAvH02ZbzwmXv7EBh0fCFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YmLrSXgTAY2ITY2nCiIcc4kvwsLALJ+OU3ok6sin4o=;
 b=lUhdcPoXBEo6LXY77SyYSRZOWExDQamltgauWECigC4USmMjOS9lqi+RJdVU1H1hIIprQddooEpE/6Xzz+8QLjGmkPhEfQA1QzomuuwUyQP0nhoIvqftlK+ZMHLoytnJqzzDCLyr7LadXIG8hXmzQwDEkc0vwJ0cALdvncuG0X0=
Received: from DUZPR01CA0145.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::12) by GV1PR01MB10526.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:15d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 16:45:16 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::c3) by DUZPR01CA0145.outlook.office365.com
 (2603:10a6:10:4bd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Wed, 29 Nov 2023 16:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.19 via Frontend Transport; Wed, 29 Nov 2023 16:45:16 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Wed, 29 Nov 2023 17:45:15 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] backlight: mp3309c: fix uninitialized local variable
Date: Wed, 29 Nov 2023 17:45:14 +0100
Message-Id: <20231129164514.2772719-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 29 Nov 2023 16:45:15.0521 (UTC)
 FILETIME=[6DC21F10:01DA22E3]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|GV1PR01MB10526:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7e9c848d-93a9-4ced-0d73-08dbf0fa90ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZBYRWvd35eob057nVM0SKKON2CcbaP5xsldNRQs3Tl3XCjpux6Ad0kwkmU2QPXrXHg9k+kWrhHdlQ2xRkN+SZS9vbgp4L1tBvxoJa+CsQH01x3H1QL79aN9uDN+I5NXsFpbxa9kP/M3mDBlNPSy+NyeAw9R7D7dItG+/gLzB4RMxDrJFIQcZS+bdnHax0IQgArLAcn+YxuW6HtZ0lPJLSDKw+e1hjAW03ZyT8pZJYpVQUnilFJe3qMe7OaXgG57AXAZK0cSpeJ04S1faxYMhi/03e3LYQ38fOPPRfwQT3zjnlsQIa6f1sjRLDVTfpGW46ru08ndB5Z73+jLLDDtAIPaMUotfew20rvoCMNETUOf6KDi/J1DDt1EjaPOIUDRtTBPfWTBVjbtyFQyOU0Sq8WvBnWclb/IVAdgfeKBkloAyrlRZC9omu/6K5Bpf7Sn0rgpibJ1kkhtmRksOHgOPnxQEt+I/S5N9G8sIBjcAMcttVwlmbbJld+ox50NRfxNBeoEQwUPq0sfkd3fbY+NkGMhGhCX97ZPOGI/S2UBzRCyOnk69+0syOapxQDBcNTX2kSfZvqG8ittVR5B+HOQNA9Nrhuru031GiviEfL+32YDaukl6geE/DMW3kO06MWXLjHI6L7OGK1RJu2UfRrx4AWG0Y1dX/lSqkGEpv9jphVkW5VMF3jFjT75o5N1s7PExmw/5DIxcPihm5DEz6VbKnKtK4thZRkIsVVofon3mOK3EzOJQ30QBjdI+A539D5zhvzmFOKgdd0fHHHYVq1zlSA==
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39850400004)(136003)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799012)(64100799003)(82310400011)(451199024)(36840700001)(46966006)(47076005)(356005)(41300700001)(2616005)(86362001)(107886003)(1076003)(8676002)(40480700001)(8936002)(5660300002)(4326008)(2906002)(26005)(110136005)(81166007)(478600001)(316002)(70206006)(70586007)(966005)(336012)(36860700001)(82740400003)(83380400001)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:45:16.2253 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9c848d-93a9-4ced-0d73-08dbf0fa90ba
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR01MB10526
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
Cc: linux-fbdev@vger.kernel.org, Flavio Suligoi <f.suligoi@asem.it>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the function "pm3309c_parse_dt_node", when the dimming analog control
mode (by I2C messages) is enabled, the local variable "prop_levels" is
tested without any initialization, as indicated by the following smatch
warning:

drivers/video/backlight/mp3309c.c:279 pm3309c_parse_dt_node() error: uninitialized symbol 'prop_levels'.

To avoid any problem in case of undefined behavior, we need to initialize
it to "NULL".

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/af0a1870-693b-442f-9b11-0503cfcd944a@moroto.mountain/
Fixes: 2e914516a58c ("backlight: mp3309c: Add support for MPS MP3309C")
Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---

v2:
 - remove redundant initialization of "prop_pwms" variable
 - remove "thanks to Dan Carpenter for the report"
 - add "Reported-by: Dan Carpenter <dan.carpenter@linaro.org>" tag
 - add "Closes:" tag

 drivers/video/backlight/mp3309c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 3fe4469ef43f..34d71259fac1 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -203,7 +203,8 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 				 struct mp3309c_platform_data *pdata)
 {
 	struct device_node *node = chip->dev->of_node;
-	struct property *prop_pwms, *prop_levels;
+	struct property *prop_pwms;
+	struct property *prop_levels = NULL;
 	int length = 0;
 	int ret, i;
 	unsigned int num_levels, tmp_value;
-- 
2.34.1

