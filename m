Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 052F74CA002
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 09:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B73F10EE79;
	Wed,  2 Mar 2022 08:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2102.outbound.protection.outlook.com [40.107.255.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38F410ED1E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 06:36:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emrQqYCjAl2KgCi0Ho26wFEqfPDrZikIHe87FwrAO6D5C2q+y8qGqY4iRVCrGTB5kjPR7kR/4+vot/+YNmqI2LPClPHh3ttPm6absPixTwdlW+1lQDYY8c/k4MQ+dobNgi+g7Wg3aJxhgmrm1tWKwH0TDeBBrQ8CiT7nLl960kA7EaH52M/gRUocXMO9IInPZQQUhpXFhiOjw8ad2BhpRAhZX9IZ4IX1kveObUQDNIdnI6A35Zqb3zb0rCfWf0xS+rzPVacaSv0p76Uvt09uzoi7NUOwRyxCoXnaEQ+2NEmrefYJWmUNH5hZNL5hxQ2zAiEFitZGbvlNvHyxm1Fx7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywHiMWYrwrhMHYWf+4KuP8kMK1uYxR0RQKVBCUUmUJk=;
 b=oJzWduZqBGmCnleMGzsx16sCYGvXqbmAAptCd8YpExymoaCUCJzJluEcdowNc4z6ouwh9dJpCDctqF4A0Nuz0/hEJ7VFcWua5k3ezMRnKaxDYgzOksUgXM+gmPNUB3LX141j8TCpUONgZgHqII/FItLZBJSGKQLwjLdiEdCAFxMAgHxtmGT1Czaka9XdXnRVBBc7FlO+4L1P43tXVKc40ZZdyq5jNDkpCqiPYKzU5sxJl55/PsdYmL1Xc+qbTx1ghZ1XYo8liOj7mEIRlLZLRJngztvmm5mX8/XFcl2Bavi9MGkSPrIDzR//W/RifOC26iIgSqN8/jpDjtvTcz+XEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywHiMWYrwrhMHYWf+4KuP8kMK1uYxR0RQKVBCUUmUJk=;
 b=N7BJtFcw5m61f7zzOp/n0Bd+OD6qK4KRKC6UPLj3jevy8j+BDODDclwhBi3ryu6wjmFc2cvFbYN3mRw3Ur9xQh3rh8ZWaYYOWT7Kq4p8nv8Hvnvz1rdVUB7IJu4IhMjLRd0swlwlRl066k2MGZmTdNVauQEa08GxXnhhQBiYuds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by SL2PR06MB3212.apcprd06.prod.outlook.com (2603:1096:100:3b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 2 Mar
 2022 06:36:26 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::30ce:609e:c8e8:8a06]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::30ce:609e:c8e8:8a06%4]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 06:36:26 +0000
From: Yihao Han <hanyihao@vivo.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Tang <kevin3.tang@gmail.com>, Yihao Han <hanyihao@vivo.com>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sprd: fix platform_get_irq.cocci warning
Date: Tue,  1 Mar 2022 22:35:31 -0800
Message-Id: <20220302063606.6564-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0200.apcprd02.prod.outlook.com
 (2603:1096:201:20::12) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 549d8102-7c40-4acc-25dc-08d9fc16f9e9
X-MS-TrafficTypeDiagnostic: SL2PR06MB3212:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB321205C349D984AF7672DCA7A2039@SL2PR06MB3212.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EwBDHuOmx9obkB5hKXZvIFILKYurlUuih3mnZai67T8v70E+OYVnzk+/7ClhkAfdMal8hK9wehiDpGhyz76gsWfcNYSd+QEnIvsygoctEEfuxcGgXsnJBg3BF/LWOi44xjXdRqTC8PVaGSAKi/asv2EYmHs0dg6fgIT5EpTdifTxWAIFmwxdSq14yed3ra60pbCkl+7rRQoEa/9bQn1XtE0RhICozx3yHzysYBGEPGybQmlRacoP9G4MH48L2Uvz1mTP5pnL1wDUAbW/sfoiBqm7/AMt7pR5HT1+vE/IebWIbqTyVbhZ052gS++X8kulXlL4KXQF9vjGm3vX1o4kxNrZZx02mV2Ed8XbDLfEIa+wg4haV0kSHLeUepP5JBSGGFnb1rGg7Q+mlGThiw7YW2asiJAMlsqjiDt1YvqRWWlTZ4pqQKu7DfeYVxTOX7CurAUzEMCfCkGEX/gZVbLA5ucQCp6ao9OcbsieTSgrLbn7g8oljB6zmlHaAYVsNFtNFys9S1ClTsFnwcnEG1xSxfCX2jEJKym5k+1VrPkbZ1iPrAc3w0RUkfHhXDcz9V4MzF7GLb9UQVROLFCwQAvIT91qomTIaYvrpYxv2oBC02xDQz3oWDoKeeCyhvNq6i0vPTzekNGaIDQiVBM1DpXYhRpWwu5yOL3taA4ilZASkxw88Z2tjWF20awIUb2LPSr1QH9RHeEzPUtugwtn308HQsJjDEr8adfTzQCEMUrNQGw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(6512007)(110136005)(5660300002)(38100700002)(38350700002)(6506007)(36756003)(6486002)(508600001)(107886003)(6666004)(1076003)(8676002)(4326008)(26005)(921005)(2906002)(316002)(52116002)(86362001)(7416002)(66946007)(8936002)(4744005)(66556008)(2616005)(66476007)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kH9/ACqJdkE1NFNjtJSkUkptnHOAheO7ErXQVk2dD3NAsWk9ALkYD+r6mk2m?=
 =?us-ascii?Q?KMRhDe8sc3pAD9wky5yV9eHAmboobPL3prg5lugX0bB4rYPjSvtAUb1Woedu?=
 =?us-ascii?Q?zSLd8pDYM0HbBXGQRmFfra1uh/iMp+FKPu9JcIcIf+xm858+qnPnb3QqK78d?=
 =?us-ascii?Q?Ozf5OSolm04+WWzbw9rIiy+D0F9Yb61yWspMo6DUb3/JVqlPOVzHXs3vFLRs?=
 =?us-ascii?Q?YSoYIsc5tRs7OUfDuzi8i0ijO94bhQsJWaaQ76oV5LHU+3hAyi7BRrBc3Dv6?=
 =?us-ascii?Q?xvZdytKJFuun58APCCE+HwSs8GOD2CFnG+fOmA/B+V9/YbfZBz+jwCV7/Opr?=
 =?us-ascii?Q?aQm8poV/QbNGhIlvh+SzFe6OEwtqtUxC1ssASqkZgFqdrfBvw3ncmGscfjQI?=
 =?us-ascii?Q?ps75V7TUU3pRkToomv7bZGtiq9K7Avb0CW+AWZbRRxTGKmaCetI5nHiMmIRJ?=
 =?us-ascii?Q?Mljw02pVROM5zEfo5yeK/wXbpGPMStQ4fpkJ2CvfazsEvG1vBsjFoix4vw/e?=
 =?us-ascii?Q?cHDc0CfQzYNpGIcIiGaYylx44euMAHKP7Zz9t5Js5tNzht2q3qMnZSXSB//T?=
 =?us-ascii?Q?1hsL9k+vDiCmY1PjpwmFqeuyziRZRnKl2+0k0H5mr5xM5Zt5UFBh0VBAMPVF?=
 =?us-ascii?Q?zy92+cggo5Gn/pvfl8b9MyThThEvEJKb4UgkCuojnoKikMq6ucsrcO0ML2+1?=
 =?us-ascii?Q?hlbKcl6mKlENL9By1BsieMT9fx1qm1AIbeOdqZG5lVGAGdobsSigm6W9ebR5?=
 =?us-ascii?Q?uFiKpUe8wW01ZRvbxN5yF6t0WfeG85VLHXVl1uRBoDbZPwpHNAqsDSGLrpBb?=
 =?us-ascii?Q?pOJ5wd5w0CE7CAQwmeEyAMsk15OAQeMrmcsdFBlqzizlccm2xIdsHW63KfLM?=
 =?us-ascii?Q?y4EN/si+E03h52eOWQmr0ElAGuYHV8zeB1BGqiYQ+bDZyKpluZJm9XoGHakD?=
 =?us-ascii?Q?/AQctEq7OZkOiG6m7jBsvf0dqZvpl+xzA6tXmvwhVnyL+eF6atBLBOd98NDw?=
 =?us-ascii?Q?mpz2LeKpa7VxAKuy6XcFzC53zPLZldXJXUB3M750SP2JJ6WKpguGPwLxt1vg?=
 =?us-ascii?Q?yG3MZbRZ/SqO/TyrOFSa6WueOiJJ/TOVNba9j73VX4DEc3zuLA1OrPZemquF?=
 =?us-ascii?Q?CypaWZAuch18ZK+uda/CgbvsO5YzIFMK2DtO9u5foPnpvJVWaoqnJI4fnNGE?=
 =?us-ascii?Q?qGfA0RKq09lTyPgcv2gudZ4AfEEZ1ObY0gtu2jwkUNg8W31GuH0xqs1jut+D?=
 =?us-ascii?Q?V2JX74qUpgoBIvHi0gPz8omnHjRBFIrAnIdJOKnyAsBfHIzmSUa3FXdn01wp?=
 =?us-ascii?Q?2EY583NTIsoCesMuSpESW5cLuaQD8AR+FCP5pBXFvKvih7XhZTO8tUiAZgOX?=
 =?us-ascii?Q?W365uKYWRuzt3rMrxJS5gRdb0Df/DFReezrO2hialQLq8H5AyTmfH0EXUZyH?=
 =?us-ascii?Q?QWa1J28Z3cqd51eyvSWuua4obVLH5T6+QI+kuWyWqIlsCzOxGhqgbbeccqIG?=
 =?us-ascii?Q?3SgirIzJ6CBnNCiXs3GmevyyjsvUvMUiCHiLcWyaGP08jko9JL5VOeBtadO8?=
 =?us-ascii?Q?/nJlDFTd7IyVZ5VI+yVCbN1Kv9rax5j04ckcIdhpywL4i5h4KwlRM3O6ls0g?=
 =?us-ascii?Q?EDFmLDiSo2dcKiZctQTJb7w=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549d8102-7c40-4acc-25dc-08d9fc16f9e9
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 06:36:26.3640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUZdjpFEXi/ooR/wLZ1LYxJbgZHmMYR9Nkbgr/fR9uGIvOofXl29UgZJymDQt1DWBztDLK2Oi3Ybz1DrqJJvoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3212
X-Mailman-Approved-At: Wed, 02 Mar 2022 08:54:41 +0000
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
Cc: kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove dev_err() messages after platform_get_irq*() failures.
platform_get_irq() already prints an error.

Generated by: scripts/coccinelle/api/platform_get_irq.cocci

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 06a3414ee43a..328ca56695cd 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -797,10 +797,8 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
 	}
 
 	ctx->irq = platform_get_irq(pdev, 0);
-	if (ctx->irq < 0) {
-		dev_err(dev, "failed to get dpu irq\n");
+	if (ctx->irq < 0)
 		return ctx->irq;
-	}
 
 	/* disable and clear interrupts before register dpu IRQ. */
 	writel(0x00, ctx->base + REG_DPU_INT_EN);
-- 
2.17.1

