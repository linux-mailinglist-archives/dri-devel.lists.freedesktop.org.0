Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A57FBDBB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B61F410E084;
	Tue, 28 Nov 2023 15:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2051.outbound.protection.outlook.com [40.107.15.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA0710E084
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 15:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fze19wQYzF7GsT9271LKi4sJf+RISHnS18yqbCXSkgeADf1Ozi7XJM7nu87CwjAYji7gZjwfB+ubhY7G2yQgnhKjrXLPhy/bQ4WHojdMDSDy+1rclE409a81tqZ0Kb8/ybl7zQW0xK7BBoy8frqYKlF6NXzRpPxW7NwWgutPRKUXnFg0lUVxpYMsVSiSLP3ggyLwtU87udiIjW5eht/En3IFXOY4iYuBezNlt1hde8kbQDCHksM3rO9/5F5Zw6VOcbzRBWi3X68HOWLNAV4GUeA0L8HKANOTAi73+XqyXatsqAvH9knqfFDjZgYCfGDpkOltdEdbabvfwVkRvHHAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dz8cfwkXAHlLPZfWBcvBq68MWVCGFC8bGFZXLYKP8fM=;
 b=bD5R5OhTH2kCbaSZCFvhPZOBqdI1dMg5rTLCY8JfNQoowtPrnjrElb6J8VA2nE9GwbJgUscnQ+/6G2C4Sd9+SJTdgSqK4RQDiwYNHOgg1w0yDLf0tIfRD6renE2AR6aFpN1fvE92AXr3KqeHvotT+0X87a4+gQz+mQrgGVgiHPUoRMzW8cF+Pl9x7i5ND19blxzCOtg/Cvei8G2ytjHSLFTbEXRFmgMErXkqcawv5Yafh/q+yLPueHNm/M8gpqUJXN6KC24JAMKUtCrAiRTqup/CtOq0NmE1OM0aL1E5Vjugedx7JWnMbrEwUHsxOqHpAqpq+/ckJja0aQlq06j4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 151.1.184.193) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=asem.it; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=asem.it; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz8cfwkXAHlLPZfWBcvBq68MWVCGFC8bGFZXLYKP8fM=;
 b=NQoEOQx6HWdwhTN78CP1h3XP/x54iXS2BWtkeuQHQLoQOjXizxRe42VNaF+OIl1K3Nxnl/ZbMFe+RfbFT+YyY0fKQuX/1EMnD5DEo45z+fw0li5wS9tAjHwkRyQ+G8D869EhHJ8EmozrW7oAdODroZUvQDWBbWklxelJxM835Fo=
Received: from AM0PR10CA0123.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::40)
 by AM9PR01MB7442.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2c3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 15:09:33 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:208:e6:cafe::7f) by AM0PR10CA0123.outlook.office365.com
 (2603:10a6:208:e6::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Tue, 28 Nov 2023 15:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=asem.it;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 asem.it discourages use of 151.1.184.193 as permitted sender)
Received: from asas054.asem.intra (151.1.184.193) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 15:09:32 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with
 Microsoft SMTPSVC(10.0.14393.4169); Tue, 28 Nov 2023 16:08:40 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] backlight: mp3309c: fix uninitialized local variable
Date: Tue, 28 Nov 2023 16:08:39 +0100
Message-Id: <20231128150839.2605003-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 28 Nov 2023 15:08:40.0474 (UTC)
 FILETIME=[C53A5FA0:01DA220C]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|AM9PR01MB7442:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4918b6e5-9e5b-4efc-1d90-08dbf02406e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xcGW0o52FtryzWSKZOzyALURkiG4yOEof6gRMO/s4HIsEgOoDoM3Up2+UjyN4lTxwuo/qIxpfxJsR/eDlPjR9u5nA2CJUhcgHG0wqwl/n+Ut/gs13vPP+83ePoHLsTRkWFhYWfwa+hJ5nwCYDPMCnXW8ugUJGTS6OgxL7r5WfiEfctLQW4WFAXbpI3ZIhgDrJvrbYnTGl2zKlvKyiBrFgO4VUbsmAq4aaW21WcfuSk8wxXbhO7Tl7oWRarIhZ76jFRx4RiiGh5e5GI5g6BhlbPj79TeUSUiAAgFPENWDw2BHOslwvRnLYFfhDyDDueLsr7haMlgZmrMtgCz2jlm1wCCw+u54ce4SeFDa3w5C4c11y4EOCCDdkHD3HpcLdsrg48ryvDLnvJ8GxpkYEYvuNeFT+GRsEiSJXrbee1RCymPX6r3u77p4AG1JjBxuaVVaJA2ivJdVpm/weqSXWNjH50nIYLpRx6Nt6u3YZ3Q7fTLijN1jpjtf2rbslkPz55xUPbq3dtx6cxEhtSpuZzj6vAwiaUI9GlBGSGYP24PHluSJbZ/9ABfLn+tnSbr4POVMdf0f3STzDgZPsao0ZxGAsnsaXhZBwnPwmSssHY8e0q/4mzjKrA0qV+u3XZM7MyJkZcdieXCSOQG8TxMBp4PRqo4b5fYNBfsAP2h+7wmvlDJefMN8HyoP5yQnQiZSC4joKoburoTSZH9dlPCYlPEKcTEfUlUvCNCsAxmYKOiWuBJLE+f/jeiK1SsLFXLEGdt4cRJAbUhUP3VDODhiHCnIyIuXXlvkuJZtBd4VYNi2OZA=
X-Forefront-Antispam-Report: CIP:151.1.184.193; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:asas054.asem.intra; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39850400004)(396003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799012)(36840700001)(46966006)(110136005)(70206006)(70586007)(316002)(8936002)(8676002)(4326008)(478600001)(36756003)(86362001)(5660300002)(41300700001)(36860700001)(356005)(47076005)(81166007)(2616005)(26005)(1076003)(107886003)(2906002)(83380400001)(336012)(82740400003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 15:09:32.7287 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4918b6e5-9e5b-4efc-1d90-08dbf02406e5
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2; Ip=[151.1.184.193];
 Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR01MB7442
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
warning (thanks to Dan Carpenter for the report):

drivers/video/backlight/mp3309c.c:279 pm3309c_parse_dt_node() error: uninitialized symbol 'prop_levels'.

To avoid any problem in case of undefined behavior, we need to initialize
it to "NULL".
For consistency, I also initialize the other similar variable
"prop_pwms" in the same way.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 drivers/video/backlight/mp3309c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
index 3fe4469ef43f..733cad1dd15c 100644
--- a/drivers/video/backlight/mp3309c.c
+++ b/drivers/video/backlight/mp3309c.c
@@ -203,7 +203,8 @@ static int pm3309c_parse_dt_node(struct mp3309c_chip *chip,
 				 struct mp3309c_platform_data *pdata)
 {
 	struct device_node *node = chip->dev->of_node;
-	struct property *prop_pwms, *prop_levels;
+	struct property *prop_pwms = NULL;
+	struct property *prop_levels = NULL;
 	int length = 0;
 	int ret, i;
 	unsigned int num_levels, tmp_value;
-- 
2.34.1

