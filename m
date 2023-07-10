Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA6474CA70
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708EE10E137;
	Mon, 10 Jul 2023 03:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::709])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE05C10E135
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwgMv+ZH+fXu/goOpmiTP6FF02I2XDteakznBqvcM5wHtnejkq3KaGe8UTm4rfT1PbeFk1VVn/QPsqQisf49zrfYgufwWfd6BCn9SJV3kEKOduSFM81itzUqRu0Ffz/Rz9LBvQyLGAPh3GUdJUkrZSSZM2cvrNA4V2xDcLHRVf7G6bfd48PLsWluxYum3C69kstLDqPlVswR7qGSn+xU2S2GruBtIqfbP5Kc+cNEVZKjCVop5WHObBe9Mwa2pulemXY7FaUbnouWRmqIe6wpbGf9PCbnSklhg4vg0yPLZDgPCRtQXcy3/HnepKDjJOIA4Ft/bR6RJs4Xd3NSS3dNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2No7Zo84xwCRFwHWRB/2QOflf612freUdHSozLBxa8=;
 b=NbtEviDzy5Zq7nHtQVj6h3CEyHndsiXeZveCcwf9VpAqsEGHLc3DPy0VemzRHRRpJlVPCKVXiHkUINzchQ4xPUmSeqWZISd6CiBqf3mn3SJeBqS0m2KYuds1Oz1iZ/9kfnPCea+FtQe9iJJaP7ycXgovHbgZ2/TgR3tHYLiMJEVNt/as3nsRoXd8Xdm2e/ul6PD704UkLfN3w9C23oX8ekZYcBtoYwSnugAAeAuTB3qv7Pph/u4AsZU1Z2nKQ604DBjMOH2t3oO7YLVNm60G5qco+WbZOBsxUU8nBlABBPjYxWExna84vm1VVY/ecxjg3Or+b8ePe3XeAJCW3OpseA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2No7Zo84xwCRFwHWRB/2QOflf612freUdHSozLBxa8=;
 b=btSXtlBwIQgplP2+7/9oGmyR7qf93TSs6jehfmYS2I7KDB4l/p7EISIhfa2C79z+K84yRVbrQ/NCHcaOQr2FsdZhKJCcuRhPRd9SBZJDMix+F4IFRYEMyfRK3LsTWyYu5q/cosD/tFLqDGyj//Q4n9A5WIUDOCaxdBUqsIHPF/8ssJxy3V69PVhLJkV/+gW7QMiPaLQs/yQV394SbHl2yzzTx1brkMTjKhB8uNB/tfkkngakdCoJeC/GcLIv9K6dDoflG59bRDVcKyQ7xd7cMPKrJPwyYmh17Od8SPzViNuXVFDhK4n2C2TSDukUcXcJCNuhOkjKLsaFITX8el6ZBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYSPR06MB6472.apcprd06.prod.outlook.com (2603:1096:400:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:31 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v2 10/19] drm: lcdif: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:46 +0800
Message-Id: <20230710032355.72914-10-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYSPR06MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 6110ff7a-af6f-44b1-2950-08db80f52d38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: alOvc9yLlp3nVXOxDjgmdhUxjDfxlR2+5egLX3dckItF9tcVUzhPILcfqNFdpzul+8203rta7ajvlqHjJc2BXj36P9a1MgJRREhKDk0qFhXAYyiaVNAHe9g70x/kFqZSpZ0Gi3IPg5WUFdDEjZdyv98zyGEhC9X7kKCL4S3MMMomvgd6DKJA05VJdzKxqoMmW/t497ZPQM8/k1JwKaRimSgmwJFcIgj7xUZgQCjLFYnpqlTrRtH1pYXIKZ/pelTX4idYpYxSA12xjpWXIG/LMJib8FGlBKWDuBJbA4v9KXBTMN1JSct1iEQzv9CCwHlLMwnbi/bWGCHFZRzacBTqxUKbo6HneKwvvNgZRBFEhEDnYacyvMLuxVklqNke1V5P7sj5I4hBf9OL3bI8+RC/TXFU92kIV3fAL1CizYNzgxbgEqNddWOyfLIkwqwa7b5Z+c7R6nWBuKYq45Ym4PBv2y23pcuf+YQ3tlgxaQuVTQqJeAFFsqbWN6g+MmruqAXqFXahGSQDGvVUP9NaRVI5riUElXgsfBNuC0J9S1oQEisyqq53usrQ0HGi/kwf+RTCpAow+7gqVPd1gNhpQ7AbDpUzmNMxupFQi/yryqgXBsXgjaz0wnRv2WHtsxuyddDw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(186003)(6506007)(26005)(1076003)(2616005)(6512007)(83380400001)(4744005)(41300700001)(4326008)(2906002)(66556008)(316002)(7416002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(36756003)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aJB87qgIZ4/TyBNBx2ZyQd4eaENTmlbZyv6jQmvv/zRd8O7glt5kho2dIOpW?=
 =?us-ascii?Q?zxNFOe5FZgRr5zz1aM0uyyUeTymEPcTkCjcPtjARwqlDZDwODB9ogpo9Id2O?=
 =?us-ascii?Q?FDuf/cqUOvisCuC7lRlsB28ypzJlMRFUsDyqUiBfw3LzF6ajL0MIupuZKvlg?=
 =?us-ascii?Q?8q+qIsGsBzvW3I0tgmGJChFZoh7ZX5/AyOOI3kku2hnTEfm7GSXJVwev70Ww?=
 =?us-ascii?Q?MkmX7SZUHQkWfpdk7aKKi5EYxUdx/rX4HwfmZwjZDREWp4U5NIin0f7+fBWR?=
 =?us-ascii?Q?j+kHZuRljOgh5pnOxw9XrrIRjBev3ezrdGPTCQJjmkDxU8LPVojeVdFY3OCj?=
 =?us-ascii?Q?63M8L2pxHrdrDfzOpsl/gJfgDh7IVVecuXPleNd4Iq7U256FRtpE5EJLVsXM?=
 =?us-ascii?Q?N+L9HEZLPZtY85dVv0Sm06AErkORMmEgtP80+lCkdRAp23kPnEq7MpcDxMjn?=
 =?us-ascii?Q?ORyaHREAXr+fbh58KWQ9wrZIPeqrsg1hTh058kdGMXwCdt0DOVm7EXJIyveP?=
 =?us-ascii?Q?ZzgpeLtOYKVxz+EW4KRfv9E8Zi+VBDpsczlu7dmlMznyfIcQhJi0Az3y1h9R?=
 =?us-ascii?Q?9TKB+i3Kzg5m1CA2+rfTP/PTmmcwv85OeVGULTJQ1f7ed4cQMyuissUQqJZ5?=
 =?us-ascii?Q?r4p2cld1ze96kwXQb6a4ROmzgpRbBFXXqXWXRcnk6vAwbbyzCwJciGyxcF79?=
 =?us-ascii?Q?e8qAmOwFx22O/ju02ErM+cqUfYkMZun6nrlIwsQJZQu/Jnpysm/lJhnzj/D2?=
 =?us-ascii?Q?cJBXetJp7uLJ5nQJLtM829EJ6tSJlJA7WbnkjHxvvLewV/WjoVxxaocU++6M?=
 =?us-ascii?Q?KRDliSirOoKyUB6Ge60wlycCDqip6J3OCVbw4e9FGzGjMZeW2RqkFsN2xilr?=
 =?us-ascii?Q?NLnmOV38RDhlMkSwj3V2mOwUP2LVhCn+4Lv7w0sX9PwsbOx0AgkFvfgYmAIO?=
 =?us-ascii?Q?io892fAMhy4bVOJ/vezTNTeKZa0tRQ+cx06mg1hnkOHxlrA4LhrKBfWdIpaq?=
 =?us-ascii?Q?IgjRLHEN0kDp8cEuOWVltWmX0WPa2XBnvtsNKsA5hJi8nwXaCoOhQzl8wUaG?=
 =?us-ascii?Q?o8Un7RfQS2UlyVOHYwYj12nAniQ4jLzfbK5CXjeYTp6LH+1M/jCJaPyEXJyh?=
 =?us-ascii?Q?zrkWpbtHyhvaP0xG7mSzEGrcOXHtkn/NI/4gKF+0xoEcSqnfTKIA3vuR/Avt?=
 =?us-ascii?Q?+7sppD7s/LvUUhTwqpCPtm54tPpjm30NIyRxUDyETbDWXPEXbm27KnC5tcvq?=
 =?us-ascii?Q?z2QI+Tw9YDWKIqUjr5Hu6h3hfpoO/tzw3/EgQTe+Earz7uH3Kg0asp+kcowx?=
 =?us-ascii?Q?egC2uSkvImavynd7+YOTFJpTruRsz0gc9kc9ZVn8UKO+aqanJmNfudCfjz6m?=
 =?us-ascii?Q?oBqiTlwOYbG0hXBLTRZp32bZcG0cln07HNaFtIDW7gq8gVo6RYIDkv8d3nFz?=
 =?us-ascii?Q?qQSO2tpldVtRQKdyS2ynpk3r4JM1FmJszNwLR4YuIYhta1cIYFVwmGzdXR3n?=
 =?us-ascii?Q?RnzO8CdwHI7GBr5kmCq4pww9V0UOCFYzOfp9DPrSsfp8z9NFmCCZV7byFvJt?=
 =?us-ascii?Q?bLrlsaMrQVDj2ewpymO552vFVpr1zKdf+KWAcjgE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6110ff7a-af6f-44b1-2950-08db80f52d38
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:31.9191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FPSRk62lxOhiBsV7UxqGG9KIm2I5WJJrEesEfY4qXbeISUbhm2Fk2ZaFQ+NMl55rQjjjwkhydp0iuRXDTbd1fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6472
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index c9d8cbb21407..a7cdd0eec7a2 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -134,7 +134,6 @@ static int lcdif_load(struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(drm->dev);
 	struct lcdif_drm_private *lcdif;
-	struct resource *res;
 	int ret;
 
 	lcdif = devm_kzalloc(&pdev->dev, sizeof(*lcdif), GFP_KERNEL);
@@ -144,8 +143,7 @@ static int lcdif_load(struct drm_device *drm)
 	lcdif->drm = drm;
 	drm->dev_private = lcdif;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lcdif->base = devm_ioremap_resource(drm->dev, res);
+	lcdif->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lcdif->base))
 		return PTR_ERR(lcdif->base);
 
-- 
2.39.0

