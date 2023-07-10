Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE2374D74E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 15:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A709E10E298;
	Mon, 10 Jul 2023 13:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2104.outbound.protection.outlook.com [40.107.215.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B41510E12C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 13:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqVnUls3ywsy+qXHsZnAW82u59H7KCldHaN3Vrqd4XyGjB0Ty9pw2iSicVMNsrAoObqrOh6RbCdARcgjZYhjmt+ky0TIQUzmdnvS4BC8i3xCRT/X0k8IVdUULpvOyoK00aPKzkQIdjPLt52mlRilXadk7gS0FtvKBjpoC6S1N04jwnlUxPsOhssY+gEmfTa+wL4G1yA8nz5biRJKOM68UsrUBgscLJSoHpHE9F2jizxW3p78Go5bEK9IUsXpsDT5zKaPvhGmI0JMy7iaU3VSXCBkYUoNeG4By9X/mHh/anWi+GIuGbhuiQY6E2ILjgSUnRoPHX65zbtAoXiMaSbk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uLvBxlgOCiMfG4qdNtV1IihRj/C0F45jnM1mERrGXg=;
 b=Umm7w5KBoZBV5ucmkRNz2SnrqGixsOoAZW87BSO32VcDa+4XQwUsRl/USAOtj0WaVC6g+KAUGJD+s4NfP03RAJPm5mt9+JYb2c26lPQWA01h22VvwR0AvEtAM3eKrS+Ol9ic055wkel1vo18BnqxS5HmcJA3hwXNGxtTL7rWzKE5X4eaNCQXIEJ8c110uEhVpIVaPgXHDm27Es/M2Ju7lCwtu7i0WhLsbazyXDWaNFjpM/yFEr7y56arkWB386hweIwBzi5KyP2PVaGeBKA7/Y0a1R27vf1orlow856j6fPhg3vX4Tr6hVuPl/n+Xfee/YeSeyTo/KFa35LBfT5OHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uLvBxlgOCiMfG4qdNtV1IihRj/C0F45jnM1mERrGXg=;
 b=c75HHhkn7MivlFBNy7fg2hkCaPXCZkAhh2eO+Q02qa2hS02bTHuQ14Al1IN2/Tez6eA7KgAgq0U5aHO5dPfFyNpOvjIl64wpHneLc/dQBe2L885U8jATWguHsoXmgShyLY+zodfnoV4W9xcr+IEp5xjd959o0/5gd7ltX33qJz4l2XZN6V73hNq1xxv7eK99Q0LVK6RY3XhVEFUbJ4IqDqL56IvhcI4fgBrDJnA3XCyRNxyKsBtj7Q/Iu2+MuMRAODEpwX6uy2np8NTCtXO8uVShr516GJrbZ+GqsCmupCLw36H8zeGaZ2T9n9enT/mpSsQ0TQCuZgXvR8/G75UBxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5131.apcprd06.prod.outlook.com (2603:1096:4:1ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 13:20:13 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 13:20:13 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Helge Deller <deller@gmx.de>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: [PATCH v2 2/4] fbdev: imxfb: Convert to devm_kmalloc_array()
Date: Mon, 10 Jul 2023 21:19:59 +0800
Message-Id: <20230710132001.50764-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710132001.50764-1-frank.li@vivo.com>
References: <20230710132001.50764-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0005.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::17)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 276f9f91-5ddb-4655-a604-08db814864f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SSFd6f+wfaTpX6YRr732cjKEzpmJoyHk6xCxA+71gViXA9WGqPaPpqt3UB/96fPoJHwsvw+x3Vl+gNL2DdCgS/h1qVscgOHV5Et2fGcrdTESOANefHZdOx8Htpy3VuVx1DLfNsCV4k0+wGt/Mkg6CfGbqxkUT6BoznWs8IyQvJhefX0167ging3uSAzTdTRQW9TvgIHIEwE7nl0yXBj4AvFNqXMlGR4lbkG/TM4ld7+w827Ml6l28KHTKPlBrjmNKlLxngoYbpmj47Pgu2fOrcOMDsmWIV1fXysxTZUfGfOKX8dAdqWG07liNXp+XZNKrzw1qgWkh7IE+HA8M04LpiqaIQyoHM7yBnmu9kVr+hnCL4T6Xa8EC6V1NBv9/xXKZDUQw7e2HsCPLa7YHit7jKIJamhDyJ3h5z/3gRCcdP2rr+JZX6V3x83HlVCeZmFOazj0mRCJwo7AeVb9LID1w0PS2On5g/PvZsr+K+6FwgzyeW/gX9J4Nt4onysAY4fWIQm3fM7nq+2W4RHSUY7g8WWusDfqX6gLzG2JQFogFI29kU5x4lPSJrF8jOs3PHPPENE54UzgaoqgXOeI0SlS7yghiApNLF+vAunxC57qLxkcscUWQeGxPKQuxJkThsi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(38350700002)(86362001)(38100700002)(66899021)(36756003)(6666004)(6486002)(52116002)(110136005)(26005)(6506007)(186003)(6512007)(1076003)(2616005)(7416002)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y2KBrwTh3t4RAWiKGKbDwmNpawuXRltKBB3PlMN46FNKozk9wyJl/nTQCKkc?=
 =?us-ascii?Q?pJJXuuLHNBpBs5FThdka+4ICuhPN6p9Fh4mpfQEiSXmjF2OJurRsZnHEtPhX?=
 =?us-ascii?Q?KjvugB20CmBr4iqtfFJk8sZSzmnoA4IpnFpyLqZPxDCfCezmmSZiMXjCksF7?=
 =?us-ascii?Q?xVry9tqjMaayKPTqlRkyg1JA2g4YGaUvhk4KNWq9XIaE4zNnANB7JubmJ9qK?=
 =?us-ascii?Q?I3Hnl7Z09iAEWHqcu5vZFkm77v4Ejwsz+N3QOKLpzjfMQh1E+cOIVijo9BF6?=
 =?us-ascii?Q?i7RKdjAwYRaQGVMcCydbaxCycNhnfXCvE5sIlYJhjiHTcIM1LfNpN72xuoo8?=
 =?us-ascii?Q?13xmHyBy+AQ2Ds6Nkp3+T5CSiCjOdcEpYQ6Z+uE1azEZngGL5Z9SXpl7yr5I?=
 =?us-ascii?Q?n7TUo+tkJUonBSbIosgASFgN6qjVup5D8K0nJcUKMd2uIuFggwzR8ewjVpYg?=
 =?us-ascii?Q?RoSYcDhGzkJ1XaW8R0eDv0S1k4H7qDRb94ZRD+1nrIDDtnFQQQPzrVdzBwLw?=
 =?us-ascii?Q?yxAGzul7vg/6NnocYu8LZC5p4LiGHOmCp4lAwRrWhJp592COqnlBowzUuRix?=
 =?us-ascii?Q?RYYIoKMWRk1rgOWRW0Dw5dgKeoqhk33oDLUFLgmMkdgvbhCmwyU2lTZXdX1G?=
 =?us-ascii?Q?KcM6CifLS2aha9k9l5HWgEhq7BwUKvBv5bIIJXTbSw30M9Gt1Hk2DYr+xZuK?=
 =?us-ascii?Q?GIHpRKut2dzJZ765g1xbSZIw/joFMnZSXng+Qle+ar8F6Bh9GT5b318cgdYC?=
 =?us-ascii?Q?V5ydTgvcuYd5apRGtbG0tb/pjm6W9HnUE1frkL0wBw8x9tiWVB4TWU9jUAwn?=
 =?us-ascii?Q?2fImjAsaGlkfUff9ojBzimv1GLFnol87rtnFObY0aGVbJFifIK9ZDU4y0MMP?=
 =?us-ascii?Q?x+BpirdwFkimBJWQynT4KWfijFxVve0AMcvcOtx0SfSvdVXrgt3qlkEhrSzw?=
 =?us-ascii?Q?lqQa9k7ugFMvju8+2+UEArpxXoG7J4hVONnFrpdkp7DyoTxp2Tr1GoVeibaK?=
 =?us-ascii?Q?gndnhPDW8uMS9EXmMgBTF+AW5sPAai2SFrEBY61Sjw9kKDlbMHrQgtJdmcWF?=
 =?us-ascii?Q?04CuTAJpZW5ShAhSneJUcIltoKMQ91c0bzOnGy+fQ4eheCNM8KK5QyKcwwri?=
 =?us-ascii?Q?FZvrl8CMID5Men2H5+dBwmXTPW27HEj9mtndXg1ZGA1NEwkIsy0fG9wR5dxF?=
 =?us-ascii?Q?mkFpkgnpMpquNsIHzlfZZGDuf3XV7qfqOHUXcDdzU1vlfJ/kmN3h2fn8kEOZ?=
 =?us-ascii?Q?bPUiLeOEl0+rVav8fcHmTlOQkdMeAMLfSBgYX9e9l7Ra0nOnyHkrEFijFEt9?=
 =?us-ascii?Q?OFA9Zc3xI1Hm4uSgGbdbdcSofDVxHVGG8BCYCASrvaLFC3XYab54VD6fACf4?=
 =?us-ascii?Q?R5HYJlcbbYnteiRgMhq/4WKexRnZlWbsJOaJIM0VXsP5yc6sxFjrYYRcVed0?=
 =?us-ascii?Q?D4/MJUs2HMTkreSrlzo7erV6yhIvmcuKEcGzCXmjvnVpbwWRl0Xq949khI+e?=
 =?us-ascii?Q?zr98FifhCYEAczNd+lhlUah7BAogiqVZxPV7nH1cRESu18TjS1WILFcaAsdV?=
 =?us-ascii?Q?SEP4nfsVHWoZuR/9H3sIWm/8BOBrgnJmb8zny71J?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276f9f91-5ddb-4655-a604-08db814864f7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 13:20:13.6796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DxiIoVvxQ745r9sa42n0GICWlS2MLeoD3MdvwXRgwc7dRvD4Nk4a1Im0XZJKxbw/biyS7a6uumvBAnwVJduZjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5131
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
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need for manual kfree in the error path and the remove function.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/video/fbdev/imxfb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 385c4715c7b7..7020b5f6434d 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -673,7 +673,8 @@ static int imxfb_init_fbinfo(struct platform_device *pdev)
 
 	pr_debug("%s\n",__func__);
 
-	info->pseudo_palette = kmalloc_array(16, sizeof(u32), GFP_KERNEL);
+	info->pseudo_palette = devm_kmalloc_array(&pdev->dev, 16,
+						  sizeof(u32), GFP_KERNEL);
 	if (!info->pseudo_palette)
 		return -ENOMEM;
 
@@ -1044,7 +1045,6 @@ static int imxfb_probe(struct platform_device *pdev)
 failed_ioremap:
 failed_getclock:
 failed_of_parse:
-	kfree(info->pseudo_palette);
 failed_init:
 	framebuffer_release(info);
 	return ret;
@@ -1061,7 +1061,6 @@ static void imxfb_remove(struct platform_device *pdev)
 	fb_dealloc_cmap(&info->cmap);
 	dma_free_wc(&pdev->dev, fbi->map_size, info->screen_buffer,
 		    fbi->map_dma);
-	kfree(info->pseudo_palette);
 	framebuffer_release(info);
 }
 
-- 
2.39.0

