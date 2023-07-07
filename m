Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3FD74AE71
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA5B10E549;
	Fri,  7 Jul 2023 10:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2136.outbound.protection.outlook.com [40.107.215.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5744010E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW4O0qdBrudZB0VWABEvJ1rvdicigp143R1RuDCTTJcdTvegGaxDttQC1HtZHqczwQaYMf+eTVip2QFk9lmPyyOiF8P8n56vJQnDegU2APAF+Q+EebuUhUC1Vnopocd+232+gO8Vv9E3VnPUYLKaobXuKhvKduT7KMxPwQJaLYx6avoK5h95tUqp2YP0wL9MkFMsR/VmCYKsZrfLpJrpSmyx1JIqTRDYnV18iaZADDNW2WmcNOQX8FHj++Uv8S7y8o7mtId10rkjDdOPHEEVmUBDuo7khEaSUsjjqvf6CF783w2Q94DF87TPdUETtdWjpLPdSW9qvGrTUTx3GxXMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ1vFl317+eY3frrFY+OfM+saV0SG1asyXCxsk6CahM=;
 b=Dm6udbTrG0+6qSj/6Rgize0kYHmVsT0htORkpS+MoDpQqM9JmpH9dUBfUNgjoso5/FwYV+Um/yLvP7C6wmkLPduV2K+8DCjcc4mRZMS7NVwIeOv7s/vXG0vz9UjgKDFB0aIH6rIWsFF8mKtswahlgXE7HXQr9DUFlnpN9mSsRlU0UiqQsUPShv4+4nrNvtqms/POjgOSjQeI3g+L7tw7MjYzDbH23Vwl3EgoTCPANWTLYOewY/aKhbhTLJbIo5SQUu2KMNomsWlFxUPP4vXGMu+rvANucZtoACOeQudRp5dDtS6HHmPmZhx/IypnnwnotEXq5gtNyIPIVE0UJYzT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ1vFl317+eY3frrFY+OfM+saV0SG1asyXCxsk6CahM=;
 b=USjDjBVbNkO+6jp2wObQT7RTREjlI2oRv1ZeHPlqG27B5+ue4tNKMxa3Af9yN4IAXO6d4PAoawV+CEq8Ri+gREh6ybTNGY/taGClHN8tAjsjnfh+4YeOJw/f6LFI0sjytZNBcTEOiqlTCXknsJBUP8oaUDvK9HvnWTIymXMSGKKd0QTbX/1n0wuSDBxt8yo6i8iMR/n5CsEaoz6BNd6OVdYjJ1CE+dEcu7UMTIxRNwihmRonNEpj3cxK2BTZCslwgnTtEmoJK9+O25vGiedKd4ZSemwQ3LBX9lZ0PN5J4hT1EpPsRKr/uPi/4E/sY9GQvQmlaXFFovL/OaCCE18fAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by JH0PR06MB6704.apcprd06.prod.outlook.com (2603:1096:990:37::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:20:47 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:20:47 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 02/18] gpu: ipu-v3: pre: Convert to
 devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:18 +0800
Message-Id: <20230707072034.48977-2-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|JH0PR06MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: dada64f4-1371-4c9f-a56d-08db7ebaaf44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /naE5KPQWoPrc21t+5tVuSCAqj12xR6KT17WJPoVy1YHQv5ecIirxZtdyyRdkZrQiPFnofWOY4pHHXYlcmywp+rBIHPGR8LezoQ0HBBVxA9/DpzrHbvWFWitX8Zui+pHBBv4GwH2urlqwXDjVNZe/+jGbq86u0dBsR4lFhFsYgQb/pmnE66nf0H4p5Jl8xG2+0vaDNSIfXLqW8RJuf+5v/5+dMiNeyrUsv/yzuggiRDpuXRNSClbSNhfjIM8K4gARVDeC5Lvr5TBNFK1tPdoqQMftxzk1yTXNf+EkY6rM4UalUL/G76auenv6ZHMOzWFohww++jaopln8lfhGFeuZNZrNvZ28CL/cHf6fE1mTdPajJJupTyofHVweOGFM4WbW6YsdSBjQjL16BF4qn3HgTvM6nzO2fatEhKbPSk+cI+cJ9xEiC59Ug5CMiYzsrq+RAxgwWrALrkFOxlJ4PnO2eJTf40G0Xkz/S1gzcktbu/2o0qYrUZQRcOXCTUiTuAY4LL/ji9fmUIGyOxqqmXCMp+tL9ONIYY173DCCxjrq5R3A+ZX6wk3XdoDdlXGVt8lwHrDVZVrcxB0AiYt1Q3lfViY8B3rKLEi1N8pg32SRXnwT+JMlc9LnGbLTnKLY5T+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199021)(8936002)(8676002)(41300700001)(4744005)(2906002)(316002)(478600001)(6666004)(110136005)(6512007)(52116002)(6486002)(66946007)(66556008)(4326008)(66476007)(38350700002)(38100700002)(5660300002)(2616005)(83380400001)(186003)(86362001)(36756003)(6506007)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0WC8alMZqZVaiuOKQWINetOvL7tzppzosIJod4/iXMWzt8Yiwmr2aFzwjsQg?=
 =?us-ascii?Q?E95QcwJGSBXkuLYIqpHBRslQFoI6KCY7HKyU2WuC57KWz99pTPcexCSllEn7?=
 =?us-ascii?Q?XSHIC2zWa3laG7LRsICjeY2JcFSuoohmqxGDpZS7l0UMXu8W88mp/SHyr24H?=
 =?us-ascii?Q?8rbDqDAkfTcRPWS6KfiY2G/o6xVl+y75bykicVmYcEGsLrqHuQseUMv6078F?=
 =?us-ascii?Q?f9H++bU993zr9ZtniTYSulFcTo4PPuPaf6bbwPNb2C692AhX0NsmyW6rN2ei?=
 =?us-ascii?Q?u1n8DBZAZnLksbv+aX3C1jEDHmJHaC0B80xz4NUrYAOOvDg16xQsOtUNRodL?=
 =?us-ascii?Q?bgngK3zNMLZHmb+SiNDAhFJEfWX6DRyxC7qzI9OS3vFyOmaRYp9YjNm5C48I?=
 =?us-ascii?Q?AMv4f9eEEJmUpwt/uNleVdGcXdsEutQg1xq6ApLZjeKiLWwIXvLpG1zOiOK1?=
 =?us-ascii?Q?JHrCm8M9nS6uFINQrorFAr7iMEMOCo03CvjyE6vrHYget61mYvuJoF6UfjxI?=
 =?us-ascii?Q?IntX9VyWEHlCo2mu7vdHb7VvTQxstEg/iskuXedlS5cUzbSSRY+Y0hYVIROA?=
 =?us-ascii?Q?hPiKLG/dvcvupHpL7QD5iBXDmCe2bBkAP0Xk/0L8Bron9SmSjL1M87jIefB4?=
 =?us-ascii?Q?HffFAgrggKAxwYJGMlWYhWAOrY+go13B3TQH1rX8qsydnIMFnfxZrELH5qnK?=
 =?us-ascii?Q?5TJLDyg67IqtKyXGkYJNRBprY5NEUr2WkRmaVslrdE0TDp217gFX/MxTA1kT?=
 =?us-ascii?Q?ebh+kHbwUlpudTEsfaKO5iurDCQJDx/snTI5umy6HJBKKyB3+b1pEYgo2tBr?=
 =?us-ascii?Q?r+DPCDQoUecFwyP/dEHVuhWWN0O2/2+VgpzyEbTJxD4WQQw+phhwccwLrmNr?=
 =?us-ascii?Q?i/qiqmtVV+vQ+CjNuyfLLzDDAkCn38rID6Srm+D8qxQYjCdrNTobC1hwwMRk?=
 =?us-ascii?Q?i8W2rAVW9AcTfqQssz1AUMCB2oQ9lGsG3t/WgPkku+RmSjcsLviPRk8Zuvab?=
 =?us-ascii?Q?gGQ+iSUYWaupP/ECIoGODU/tBSHGvrXeSuxA2qK31uLqFQZY/GgeWpH2aeN4?=
 =?us-ascii?Q?DQQk2TKCI2kLdMh8XNbmijfg+lkUamFGjq0wSbKOav4SDGH1ylgSIxpd1oLV?=
 =?us-ascii?Q?1b2EhAvAG9YYJAtelBwjpNpqKMzVCY7IpD54RzclINT3QAWTx5NQunlrFZBI?=
 =?us-ascii?Q?7PYXjqTh4z8Nvb+TfD58HS1LyYLVTQbqzPzeklLwCqZ5oHFi9ykvn4QxImEx?=
 =?us-ascii?Q?rh8BP6/5KBE/JTjVbt2cTcTpKe2W92VxxF5UxdwIJmvA2Uiw5+UUdaLNaAn8?=
 =?us-ascii?Q?+4xNNdYuyQSHzi1fnvji1E1aNdSEMLZyv0kI3pvivIXky6bqYd4pLjZMMY4m?=
 =?us-ascii?Q?CO+2GtjkJmkkk5GVDDo1rFMn5UfXe60sYDw/Ja4JafdDx4dNADbqS2i/dvVZ?=
 =?us-ascii?Q?WVsNLVM3NtETjtjWQo1ov4FIbp+JwiAAFvQko/2whG+TIATrdlG4ANUb7913?=
 =?us-ascii?Q?e0R+TfyhaQzcGqo/4RaGthDIWs801WQMvq1eEmKeo4Jia45I0VjPUVVcJ4TN?=
 =?us-ascii?Q?ndn3EESYxzhz7AF9gE/mIkw2v1Inm/QX7Z8WF0Vc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dada64f4-1371-4c9f-a56d-08db7ebaaf44
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:20:47.4576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IX0OpebiIjHEF46mYCy6rJtsI6FVHMwaNEaHQQMZPYOT90qaThXtAGtcUv+QKBSWvh/7CHzCw6SQ9ltOGKh3YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6704
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/ipu-v3/ipu-pre.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-pre.c b/drivers/gpu/ipu-v3/ipu-pre.c
index ad82c9e0252f..aef984a43190 100644
--- a/drivers/gpu/ipu-v3/ipu-pre.c
+++ b/drivers/gpu/ipu-v3/ipu-pre.c
@@ -271,15 +271,13 @@ u32 ipu_pre_get_baddr(struct ipu_pre *pre)
 static int ipu_pre_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct ipu_pre *pre;
 
 	pre = devm_kzalloc(dev, sizeof(*pre), GFP_KERNEL);
 	if (!pre)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pre->regs = devm_ioremap_resource(&pdev->dev, res);
+	pre->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pre->regs))
 		return PTR_ERR(pre->regs);
 
-- 
2.39.0

