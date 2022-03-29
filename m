Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2AB4EAA41
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 11:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0AD10E485;
	Tue, 29 Mar 2022 09:14:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2129.outbound.protection.outlook.com [40.107.117.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2226610E485
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 09:14:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMt7LhBbsuvTUFj6rhv6/OH/aTvMUaMFKNS/Et9VpNla7Ogt182iK3wPkX/K69IWiFPdlVp404IcQAG57eNUjWf6FXMoTQJWbUrVHtecYa/TFHIrnBqUzMmGWv1fbNHFVxVtDeUvHu/7sYJFVNWr7bzKpEJTlh14U3+xHAops3r+Tko6Hm8QJGOEHdbo29LGRnyaFXWpHXgFJrpB9uOOl4YRJggthp1oqAagFxUkxSg41PTgEB0u2DQ9Dal82QFlvCp8SBiLEevF0w165t54NHPUCPx86n18FPFwL0Wv0ag8n+/XtozhpS5kE7kjmBzVNk25k3v6O1z+Ilr6x+cTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9qJr6LBAYeL9XxDnwMviKxgPa80VYlDabQ3MTbAi/w=;
 b=R5bfJlSkaHS3bALlDljtyKeJQB5lsf33W6vjM29sRrg35p2rhxSqBBJ9EdvNXGnrfTH2h3JcK1eLDRjJkusMhVRJd7rUFFS/Pc1YAHHui9GukCq8Pp6SooAt6ahW0nf31VSS16W6a05chYZM3EKEJSKBTgyU0cqZOUhKli6WtpSnbEAsc2wdid0CCHcy4EDfC4WRVPL8GVgwCXjvdhrUTYZu+hniUFErprzahCwA4Vh4iLcjhRHAKWQC0iY523nmSleeNcQnizETbxnrhEQVaFY4XS7dFZx0ullnCcdTVF5K4XAvGFAkii9Gr89ilD6fZQ84JWXePSpm0q2xe/egSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9qJr6LBAYeL9XxDnwMviKxgPa80VYlDabQ3MTbAi/w=;
 b=nhjGeExpTwcwvyEEwv2PD248/c9vNchHATeL36VFHqKFR4wtLkbjAr7tb9Ix9xaBKQhMNaXAfayeIu903WTp3BdO0Nn2FDwK7VK9915iaxPA82DDq6en68e83kst4hEqBsGUGRhrrhovRjI+REO2LbO0g7x0yfuLt5IDmr5+oVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by KL1PR0601MB3875.apcprd06.prod.outlook.com (2603:1096:820:21::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Tue, 29 Mar
 2022 09:14:50 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d%5]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 09:14:50 +0000
From: Qing Wang <wangqing@vivo.com>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: use if else instead
Date: Tue, 29 Mar 2022 02:14:32 -0700
Message-Id: <1648545274-14481-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK0PR01CA0066.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::30) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d7a2ed9-91a8-44fd-b7f9-08da116493d8
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3875:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3875ABF0F6BA626A1903B631BD1E9@KL1PR0601MB3875.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OR2CNc4ZO5NYKRFxzaqU2djaXjKKCjtbuC3RD7uMBepG0EnHbu2VXUMKMD+Y/f2F+frCOlmOC8KcFol59jcoUr7JuEYQulJLzNpDL+/qU+fhRO7pbeWEANPdgh7GH5vqTXnIyOev1U8EMpwtjwdiJ1wSn/d5eDNuBkeFInAdMmFH2U+lWuJFaM71/gCma6GzslSqhaboiZ/Hg0nnjs4skpM1C11vra7q+qjweclvcgcC5Dvg0mQmRYCNRWJfYyN6LA36dxsvg1teoBfgXS0UGd08Ic6CplpBwvuXsbLF055UyRiFhyKe46l3j0N8qbyo+ZCLy0Q72dPUFPQ5IWi6tCxXJSvUNY1PJrXZBU4aULw1oHRgENGQZfKjzjb9ySBrmOkMWlnND25YmGsyzF6qZTXjNA3IHMUKYAOqZMqbHNBRmZc6wIeoQKaulrMmPZgpyDfFE+vPzcEeT4CWcRFVcYvoaquCr0u9W7FzdCNHmQHC7wy//WcDidIm+pCg5lR75xoPYVU8kHarY3+Kq5Z4UXenAs5wTbCVrAND2zjYH/Qu/kIFyipHwWaN7hJprNg42kFIO5X6VCmyWGnct6xfcEWPkjD6O/70vFs3ljh4BBua/EDB8k5V6ivY4YrEBE0WxB4lfLFqK9I9Y9wiYQIBRR9KksYsKjVCz8LHAB0OZdjjNmSA0pZG6r3wgFbw2Sy9p/CiufFZPFiMOoWb6tP7zA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(66946007)(6666004)(6486002)(83380400001)(508600001)(38350700002)(38100700002)(8676002)(66556008)(66476007)(4326008)(86362001)(6512007)(36756003)(2616005)(52116002)(107886003)(2906002)(6506007)(316002)(4744005)(186003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Txi3YtUjb0AdXfUiZvzBA0LtjhWPyBzW0LXrxPbvlacpgl7Rz7WrfkUQffWj?=
 =?us-ascii?Q?CaRZ3SQ0Gj44oHDkqzfAlarIDKtFVfiJ3og/ysHlJjjR/L2xpoFdv/Dnt1g1?=
 =?us-ascii?Q?KlhQ/yhthyVX/5HGwliBYeY+EbBEqZL8cMKZC4LUlbBtnaPJG8bvDfO+fKPQ?=
 =?us-ascii?Q?4Iv+FGsBAobd6oM9JxmSNY9sPKaDudn+DHjhd7vo+dpM14WPocrbQ7hYBIET?=
 =?us-ascii?Q?ykqJmcp5Cei5O0/0dPjinoOQIIce526MNWkQTPurfnQx6EDaE5425g2XxmqS?=
 =?us-ascii?Q?zmVxmq2GJ3mKqyYSbCXxRzElIUkPE/5CsZq+VOjafvEM/Yypx1R/61pdsy8r?=
 =?us-ascii?Q?d3rH1F0q7/qmIeMSoJyD/m1+5sni7tivznh3bSlBGArRp32WR5WSgmKvJeb9?=
 =?us-ascii?Q?7tmL5nt+lEnL5E3FZqVQsSBrC0h9HRgyAtr53GzTP4Byr3eipQW/myql50Fj?=
 =?us-ascii?Q?6Kg4Rfx9wzy7kyGOCtVFpWFcsRRD4bU9GAM+SdC+zs83/wHvmN+3Gp2+oi4m?=
 =?us-ascii?Q?s+SQYtBfazlIp/t0SRiaTEy5m0gXFzGRhD7YOQcetN5DdqVeqv1EhrGDbPvq?=
 =?us-ascii?Q?MsuCWrURdTLuBBUk72AZhNpRm/NL3ZHsdjrvdMkXRpBr9D71Seq+pcW6pgGD?=
 =?us-ascii?Q?jj/KfHYrvuG/eRwmNTGIO4OK5kznZOPOc625cniw1e8irFmAER/k9m4krXud?=
 =?us-ascii?Q?6llon1EA1QY0BWpk9r132/fYKzwtXS0TZXYS5WI/cUpbabZ71BCUjW5uvxXs?=
 =?us-ascii?Q?pW+58Wd1bIgJ0mnf9FXtrZ0UTKtb0NIKFeKYbqv06jzIbGgH+2MCYsS4mSJm?=
 =?us-ascii?Q?dLodR9nwm0nh/fS9Y07pQDVLvz3uC84iF+SyI1DowJO2USo1wfg6aMCYMuJE?=
 =?us-ascii?Q?B2hSxLY/kvSep/fua+WZqGUP9U+puBt1wbMTGC9lSoXQgDrWZYSLHd249YNP?=
 =?us-ascii?Q?TIwN4URuvl3w2L32HilHcoLBhiJEN1Sew9pC2qUd441ZC51OaFPSnL6ooFqx?=
 =?us-ascii?Q?QReOFRDSzBM9IBxBPHpzf/EKcDFcU1WW7LBFK2tY9itPQgrCejAJJsn7JwQk?=
 =?us-ascii?Q?d1XUzQhruU3rAy4rMv5fq5DJ0Kk+j42C3XqQeETUKyl+TcHHsGdCF+crTlzK?=
 =?us-ascii?Q?jTwp0ETteFwNSMLUSR558FpEpFgg3ixOBx5WNFE444PJ5uJNqVN395FLvYkh?=
 =?us-ascii?Q?zdzM0C3MpeWNsc268j094wHRYJUJevkKViMkyOkY4pusAhFJ6xIxGdyYQgrQ?=
 =?us-ascii?Q?e7kDdJ5u80ilWIYzy0O8r23fttEePLAtMSjsS5jwTBb4XpUuxvuZzdNoGRU3?=
 =?us-ascii?Q?4lGj0Qu0LkPQfD6leNe000tx2abQ2LpbasN8OZcfoFycOI4AHyCPdAb9CyZX?=
 =?us-ascii?Q?MDb/fbJYYG2FIB3fghA3Faw+OEaM1nSr/KghR4QMPP1VXHxaWjy6ufRXuyGF?=
 =?us-ascii?Q?CS8o1tEwnd535C4rlZ3Sz9BoTc7WbE57auCSBe5uKsklTV4Xpb0cXZ8IQ0wJ?=
 =?us-ascii?Q?GLkOflW6TYJUk5330maIFYTXnyF3d4XbaILSUmBloksFvI7n6BYDwUn8Nv3S?=
 =?us-ascii?Q?DXe7Un+ZRJs3EWPA+7yV5HlawTzXomTguZqW5jZVbjop9hvW5j/EZuHNfdUe?=
 =?us-ascii?Q?QEeRo0Z8SEZ9iDSozGypL/dMUZMiUHM/TEx7ZEiP1m8UwzAikME56SCB9/GN?=
 =?us-ascii?Q?omb12yEcpwSlrdpuQjkpb3Q3vPXrjCupjnPabVRPJ4Faaovp/casL7R9l3XI?=
 =?us-ascii?Q?5CpCdjw0pQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7a2ed9-91a8-44fd-b7f9-08da116493d8
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 09:14:50.3545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5dQByppMut8i/M2N+ZxeVpluNNWPEtmi1R1usSAfqqS/c+bLmOr930Pe6jde5JW0SfeDGrL/gKJHFgZ4RAGQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3875
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

use if and else instead of consequent if(A) and if (!A)

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/video/fbdev/pxafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 drivers/video/fbdev/pxafb.c

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index f1551e0..8ad91c2
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2256,10 +2256,10 @@ static int pxafb_probe(struct platform_device *dev)
 			goto failed;
 		for (i = 0; i < inf->num_modes; i++)
 			inf->modes[i] = pdata->modes[i];
+	} else {
+		inf = of_pxafb_of_mach_info(&dev->dev);
 	}
 
-	if (!pdata)
-		inf = of_pxafb_of_mach_info(&dev->dev);
 	if (IS_ERR_OR_NULL(inf))
 		goto failed;
 
-- 
2.7.4

