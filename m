Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACA174AE79
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24C410E555;
	Fri,  7 Jul 2023 10:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2123.outbound.protection.outlook.com [40.107.255.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906B610E51A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:20:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bc5oUgqcqAZ83+kPq9UOp6pz7/+5OELBswLvEkEScDDrZK0i3c9N4IULuzXw92nyXDg+5r6EaKH5UurK4J/A4lndJYh6GE0UM7IuXoZbS+y9TGUvkoTvh4QOUWM8+VqLVFxuCRWdRmpRduhKRdke8DDbe7Xc1eSRyrngmJMX1nDL10VfAuj/YPTAbTYcC5gX2NMvLL0LSlvWEJPhdQERkx0dTmNVpaj8I/EPhi27CQEifXISq3QTsCvlaBIZJQAP/BA85ajOoJ9kFOWNa51Iz3MomY8d2VqmVF2iq33i51QZQ5bOHKjOuTp5zMcHwLjiLwrBr2kgrJsyzYXUfAAi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJZBSlaW2G6WCkDU5NYrFjf3UyvJxq8V/QCqrMhiABE=;
 b=FgkBYUJtUskvaqGrInCkKefcYJIVHiqLNHnp1TvHh5Fu+RhSc42f0ELCxqRYQiaooyc3k6L8HDx1an8ssMpQn7sUp2UwljtJ1t5Rpgz+c3VACrQPJFaRy9GJOi+4VetaRkCWd0DqRnul6JGZ/6RT6Hc2lFDhasa7oqGEbq7838suq4a4iUNd/VRm/bqRQSDyTroXihIXfMDs5XMSbtxAQ0SPB7iyemyv3ru/kHFw+j0BZ1A7bi/4bYnHO/sWVTngxbqdgQGSM2Gg4Zq8TzAp7+sAszb90RfjLLDZA+IQ0tdMdFqmKh2qDxGeqgbXWnwELUmaPCuSJKw9mqZhjL3Jxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJZBSlaW2G6WCkDU5NYrFjf3UyvJxq8V/QCqrMhiABE=;
 b=jUtq8vDeGbrJBc3IpdQ5nx2hVpxevX3FWolJL4eQj2Mpot9z61ji5X1uMz133M/5rNeibbNy6vU7i6+W+KZsr4rJTuKuvcVX9+32z/0sl7cXcu17o1cOjcogOlw8vuIdDGqdyQt/+oAVrLwYfQ7vuBqXRLXbHW3sU4qaahuOnlPXGyenNiyUGu77mm7bcTRfRfSTwtHhrHNJK8ZJf3mVevX6yZ3Jwa9SqPUnGQf0bxPnhnjlsBTdIcR6Bb2zBpqJCijHglCVC2JW/wc8umObVaKVUIQNdFYw3JZfi2VucpaK3EwcbrvUpVgMJcZSShy50ukcNFVhpWk+dc8Hr2fZJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB3954.apcprd06.prod.outlook.com (2603:1096:820:2d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:20:55 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:20:54 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 05/18] drm/tegra: hdmi: Convert to
 devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:21 +0800
Message-Id: <20230707072034.48977-5-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707072034.48977-1-frank.li@vivo.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB3954:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a10efd5-36aa-452e-f731-08db7ebab334
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N6uSwssmNLrorKpE5Y5NK5ssX5pynBB5UBiviA9SxfvGHGFEYF4uKmYxCSFYIhsBr42nxrQ4599kvMlxzEz6JRjzVvW6hklUzyG/wADr5yNiCxQd/lC1bm7/qH6bq4kn1//tqp6dZErFp7PcQdq97bRVJrQpAE8Tub4gJaE8Hg93P7JdSzqLC0leBEPmUnK8WX+Er6hai0Pjjp7hiwfSegb7cgqiHnIzdD+hjEhcbeFWbYA0YaxL9PRYHIbLjBvbJSMO8SvbhK/gtOIzHKPKlG3amumOpYIrJyQOHp/pnfSfYd9uLOIJUeKwO15/ZLyc3TsouOiH3V4WaMUAACayKROB6Gsr0L3bMoArsVpjCfc3rD+K25GkLsup5tD8v38RyuwAWpXp0kuObBV/ABRc5fsFrtC2zpHqHpUQtQpM0PPsScZQqyy6QTy+dWAhHLnyfJsrouoK/3bhPyPhNshXouRpBwgKCMKnxNLUgeLqo9C2qSCBJtdrtVMOG8ZACRRf58F4EoG0aFwz8b0KOfmMyVBT7tbKGdu6tSToJG93HiHJLZrZQPcdDAN/JMRx3Nd5yCW9n6yBLCaDar8+oi6u31xGerd8ytTG1X2EA82SuyVV+0DXIvBqlkanYDCIUu8u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(4326008)(478600001)(316002)(38100700002)(38350700002)(36756003)(83380400001)(110136005)(66946007)(66476007)(66556008)(2616005)(6666004)(8676002)(8936002)(6506007)(186003)(86362001)(4744005)(26005)(1076003)(5660300002)(6486002)(52116002)(2906002)(41300700001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?InnSHRoKe9PLJvoJzLb6mHYKk98o/sAT3SqW4h9iPd9OqR9l+lqVXfaD6joG?=
 =?us-ascii?Q?l6dfQMRAFigKtCZG5AWtLxDTWiUdouX1VG2ztQHhOW/pPweN5WqMUhIo9CCr?=
 =?us-ascii?Q?2ElWQPPlOgj+6kGbCqNQkuHskTl+oA4rUhCo1koj5NUFJtopo+UpxOdajP66?=
 =?us-ascii?Q?Zj5CdQ7LtHrTuEFHd1NylWKaghu81GgR7rQbg4BgMl4fokX12rxxumpmh7tN?=
 =?us-ascii?Q?WQtrPEuNKnSLWAFa2hJV1UVZKgf6K2ezeEs/UMTs9/zJCGCklKWKIaH14/Wi?=
 =?us-ascii?Q?jwGL4nv7mimVulgbwazbeInmmwTMUTwYikIJfMjMAAluZt8qzHNwvR7dvTLW?=
 =?us-ascii?Q?La8E8Ru5DcQwGHYHdedt+f6rUCOky4CTOj1OTAkjLCVhinpe/ZQ1d76d8KMD?=
 =?us-ascii?Q?qfznygpuVzyxg7/MzQ9RSI2Rzr9GcA7A/tVdLc60dnwW7LNytMkhD549kZV1?=
 =?us-ascii?Q?iwsFWk1rQ7x9sk+LQeBybwMEzT/SEdXrxMMKkeTd1KuVzkc0iK3WcG9q+PGP?=
 =?us-ascii?Q?83rYzlEkE4xPXKCI6cUSPd7GUjFx3TPs7LAyYUJaZwJwU0CIJUvKxrG3J1OD?=
 =?us-ascii?Q?DUNT0gNr9tbQtnvLp2uyUny6SYS0YRjTSzrywDXGpkXCxUbcW1j3F56Ds12j?=
 =?us-ascii?Q?fKAiK0AnwOFZFEUr1SQT/v/5n351XKRKpq+u3a+NaOQCT1H1dnbKq6aUFB/6?=
 =?us-ascii?Q?cVvSjknMYrB6ha/QYKAtfuc3g2qRkUNO1pB+1NIHFHlkd+2mUlS5gJySBwPh?=
 =?us-ascii?Q?MSnPDe/hRYUWhOgYWNQznX7I8MyZYr1A+NXTI3twi2sYdTrrotSNG8/a5RB9?=
 =?us-ascii?Q?mFSAvGcGJAzbgg9r54AX7h7W8LW/Zced4moGWrSrXmzOpIS6cvJ87/d3if/D?=
 =?us-ascii?Q?Vm+ifcCKvBTzWLWiKlM1u/Snv7EKYkZ6MCInsN9wRUpJ3gyfQAA/7gtamfL3?=
 =?us-ascii?Q?oC4rsgnQLQ4KSEBFJBLwrlth/9Ub1luOba3bKEIehBlPBiEod+m1vl52bnG5?=
 =?us-ascii?Q?5FFlH8dpRWoGo8GbxpIo3v9P13NvxGqxYJWVHV/CGub7eKVGIxeZJyuqDTmq?=
 =?us-ascii?Q?eXNUwThjNGpy8NJLvIvZwJMQemD9g8pKWkBTTBWAl/ldAyiEeVMlYX5pnAkN?=
 =?us-ascii?Q?jBDQDvccJZbzlNzHeyp09GfGdoDwhV5wm723VUnEuS/QGKUOGlYFUrhQMcvm?=
 =?us-ascii?Q?dpFXgKGjr/jwWQ7B4S7y/TKLZ/xLveOmp2z91Bd7EPHdk9Hlc2AiWhTDDa24?=
 =?us-ascii?Q?YlYb+t5Jdy+IoL8jXotgTLnNk2inOB1RKDq9S2Jff0u9ydpsDqQQZWxNu4Ek?=
 =?us-ascii?Q?4vdoY8Tau5Ke7u3C179GIBYI5hgs7qEbfGA3znmaxiPnDf1fGo+EvdwUby00?=
 =?us-ascii?Q?l72nojHLBAkYd04/dcsj0ktjYv+NDHyjJn0ujs6cppt4+8Gq9SMEpFB23W2Z?=
 =?us-ascii?Q?ugT8Zmz8vdqULND0onYZqGcQLEd8jMTkkxI2v9Udj+4m+btG4+GDQWIa0gB4?=
 =?us-ascii?Q?tYiMCrvCH6yVr33qTfLtJ+38ef3HJvqUnRFkIjmUaNduBhEmmLbvVHz31e9U?=
 =?us-ascii?Q?UCPfmsU3Dol8vBdudvgqjxDrkTNQV+mIpmkOpsm5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a10efd5-36aa-452e-f731-08db7ebab334
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:20:54.0794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EP1aBnP2rmWLK3ckrNo+qnUFKt2XOoSkmwJuav39k/CWgIaPCwri6IR0oia4ky+gfwNZAouEjz17M7d8S2sA9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3954
X-Mailman-Approved-At: Fri, 07 Jul 2023 10:06:28 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6eac54ae1205..f3a44ca87151 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1769,7 +1769,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
 	struct tegra_hdmi *hdmi;
-	struct resource *regs;
 	int err;
 
 	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
@@ -1831,8 +1830,7 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi->regs = devm_ioremap_resource(&pdev->dev, regs);
+	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
 
-- 
2.39.0

