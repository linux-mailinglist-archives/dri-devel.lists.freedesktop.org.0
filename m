Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A9D35ED7F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979636E8C4;
	Wed, 14 Apr 2021 06:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2084.outbound.protection.outlook.com [40.107.100.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2E76E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:46:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7YP8sccZiYAycQ+FCqBNdYqQexD/B8nUzEcbwdoGjOn+g9HqaXGhh5dHmhTYOGvJOkGVuuUjyNOFdMnWS6IOSZMW5UtcadO4raLDWekoXFp+Ssaj0harqG0DnTt8Zkj354Y32tAzeBWhTiNLyn60cXmHfiwe1QG3KqAy7PfylsWQyisSlSgZV8vzb5McmKUK2/WCY3wny49YRTxyjamtyva88mBvoygHt1FZvoN1orIVeXxg8pbWFK3Jll+Ah8VHvimvsnDRu48BzJYVdQwdPgluq+NmtnwsRfaw8bqau5FGAQJaw1JBSEoQk1tDFBBKc/YhmvTesIMOjS3xmfxSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN2Yd6c53oyb+YR1k7QtiRCenmta+Oh7ACloZoJ7IWE=;
 b=LXHFW7hRrpB/tuSUqPmtvHHAV6qyhJ0OllEXbOEUhtaV63okbmEVRolkhbXxVmJSe+FcipZwMX1Tm/9j9HkUdZ3yXvi/2Zca0dmsxd/CrM48WxCnlSACJTR+3dp5Yjw4cuQDYDWde5JgbjMTrLnOx/uPBbg6Q5vXTU7G5LH+czpBFsAd4sET95t/2tP9xKUa8w1iFORtuxhgnm9rYCKmjNEQkJDxXkpN53D4p68nUcq6/NFJB92Z25gK1J6bJIVnbwzy40R8KPaEVeSo0o4psd9hB23Y1DrBTYAt3Yg8mFDDGCj0DHr8JjGIVjgdADzZiidojITlf3xzU0Cpm0Nyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN2Yd6c53oyb+YR1k7QtiRCenmta+Oh7ACloZoJ7IWE=;
 b=p5Ztl68bdo8tPsPW1UF31bfiR0em/DYvl+ZGfCn3fKON0Td1zDrsVX8/8fKAczAaQI7xXLXSapItdSk6nktEnzfxLATn0P+YJQB5Yq0F5ORYewa6zOjiOpLCFxo9BxDI8dkahneQYIARJM2USNgf5H7iRtN6+C/lpbEDNd58AKE=
Authentication-Results: lists-freedesktop.org; dkim=none (message not signed)
 header.d=none; lists-freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4689.namprd12.prod.outlook.com (2603:10b6:208:8f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 06:46:52 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:46:52 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists-freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against pages_limit
Date: Wed, 14 Apr 2021 02:46:20 -0400
Message-Id: <20210414064621.29273-9-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064621.29273-1-Felix.Kuehling@amd.com>
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 06:46:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 318bf6ac-fab8-4ded-3c96-08d8ff1115c3
X-MS-TrafficTypeDiagnostic: BL0PR12MB4689:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB46890291EB6CA95E5BB292E9924E9@BL0PR12MB4689.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YSL3QiG0KIvzILR88B7CAbNem3VDpFdXItl3dG9yXx4X1D7RsAJFMTlQ+/bM0ytWOHfxRp6+oA917KY5SowcUnbnRP4K2UaIBisSylldTVHU/jBEEVr/2qIr7jLvnMHgt5ZoWN5LP4o9/d89GlbppW7pmNahgPmkad7FW7Alh73LXHPnjGaeYwYjPK3IbqZ2D/mb/GlmJockbn4Wozo0dkwgBgONHufCn7wErBDFnpB+dA5fTFaG38OmhsJHEYcjECd0oxOdcLA2Kt9CLxgj9+JCCLyqb5pxSIqgIVVpJhyBg9G3b0C/zFjFBZ/nrfHCodlx6lN9tE0pQbUuyDiTxs1tSBsX2jEe6YnONZbSUCHFODVUkpfCB36JjKO7yG9730CX6vFEsneIiqJXxilwkjiluedIYr3ipT8H/KzhxFA6Y0Dk746G+nfiMlJuNtDdIjcOexBQsKG1+IXm3CpWXxarjgLOLiJWoyb25i+0KnzZ1JpSmJDpojfvCMUD+HPX60I+rMj5WgKNWqCPIn8bnxJTRepCW+ces67P2/QrMGsBGemzFKmB95IV4H6QwIkCzFFzQxnN5k572hUUJYQiD5ZL9VwwVAoEuqkssp0V3F5DlBuzBjqBi/wJfrFIXjqVqQ94Ohrzv12J8PZaN9KyFofGnFzuQa+afrn7SZMPTIs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(6486002)(86362001)(2906002)(2616005)(38100700002)(83380400001)(5660300002)(478600001)(7696005)(1076003)(956004)(316002)(26005)(52116002)(66556008)(6666004)(16526019)(8936002)(66476007)(186003)(66946007)(38350700002)(8676002)(4326008)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?3nOaXm+OTMa/ew5zzRiDyMGE8HNz724i+lX1h1+/1Y1dpkCViY+SxMY2B3tx?=
 =?us-ascii?Q?kujvPF6vrrygt7q6uhKtwAxOX4TwHXUEHRPfdvApA6QGjA+7dZ8+RJL9pBl0?=
 =?us-ascii?Q?+B8rifZOm5+tImvGgeyk4uOTgdrhKIgWs7CRjdxayyIrJVjCvNBuimcEqKjv?=
 =?us-ascii?Q?pbmeCHtw+ngfxRplR06n+ERKR6JAizDb6aifb81jlcag9VFIXluJn9tlYMq/?=
 =?us-ascii?Q?YlJU3mgj+IRQn8cGa6x9MYT9/5OVAozYxrl3tFqHrnIT7UMTdD3T/DjNOmKU?=
 =?us-ascii?Q?BPq2j8aPBwWsNMB0hweKE8AQWCQ4jWyy9SpOrI28nEvNUXoMs+/zsWEu8q5Q?=
 =?us-ascii?Q?p7i2C0d/6bz43tiwiHjwWL9r4O0/gyrhL31DdMyaDRCbIJ1jYcgZhAWnGbb2?=
 =?us-ascii?Q?dwcirthyHMdfA/PRESYevIdF5n1IjuvbrnUbCYnYHE1kEm+VA+MLJYK1hygO?=
 =?us-ascii?Q?ItA10pAMRYxaOrOQDVXHQbW4eOJOT47R4DkhMbtTPPM0syYsED+JPEBVK0yo?=
 =?us-ascii?Q?EFSdtHOcqlW0bmgE1Rhu4fbUvG2Q0b+7jMWVkCw5VTq9uc37IdgGEIh11Vl+?=
 =?us-ascii?Q?2Rez4geu4OHyb38gAhDpYOFTeuxmjHHKWHC15O48m9WmTXRiy5UBQ5bFPqAi?=
 =?us-ascii?Q?z49Sgzj9zgARrglMkuOifsYhcn2LMr3k9Uj6iLs0VqIDFZMNiCH8OR9t5Tmy?=
 =?us-ascii?Q?7RroPChw2kP2RAQ82rkCnFZoTYXRc/7zgirewPTfqo220KAKMzG4UUZr08Y1?=
 =?us-ascii?Q?pvta0nBjU5TQCUlB5n/5uC3/PUG7Z1pdDPMHbznZHhXxjfRRD+pFJZtdsREY?=
 =?us-ascii?Q?euqbejBv6aJfj/75+1PjvOtpApItJSBxEa1B4+C4FKbfz5RB9zrrPUjwkh4H?=
 =?us-ascii?Q?HxETipHA9k8km9U1C05nBKL0DIOHjvUs+cEv0q6tzQWN2uTy/aqgJPn+J0Ns?=
 =?us-ascii?Q?bZE9Fn+PkXDZDX4S9GGYrqFvIHIwcEjw3uv6E0frLNvG+CsEAcHCyYHTSYDi?=
 =?us-ascii?Q?KGWxjIbgTynWJw2dCkfy8dXMWdWl1M2y2PLRXvBmvBcLWux3ylWP8GVWP0LH?=
 =?us-ascii?Q?8CQ5zGcFsYATmfAKTUesQ5FTRSFRz4kbpIz8mTbCeYLssoKK9XfGYyEp3dV0?=
 =?us-ascii?Q?lyx9i/Sc6Dz16v0Jq+1uJbfjmX3xnXMbhgDMATnKi1r0IDpVFA6tVmio6L4o?=
 =?us-ascii?Q?gp11/QAnHPjPNiJqOWwM6bDP5MXlOaYidibvxxhNYyaI5aCia0ClxQ0c4ddu?=
 =?us-ascii?Q?ZHKKzKjWOhLY2B7qDfp6XJesiFmOSSYneRKV2LaiRbU0HLHNvHVBOKvROar1?=
 =?us-ascii?Q?/CN2RkxNmY5SiHeI8vzGAHB/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 318bf6ac-fab8-4ded-3c96-08d8ff1115c3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:46:51.9002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8U9lzIj6kUcsWlJtB+g4hAw/kqCsyqZkC9KJb1+hw3TV8GFRzcHEyvvTh4//thf4XKpSi3e4r14rjTe/DTXjSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4689
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pages in SG BOs were not allocated by TTM. So don't count them against
TTM's pages limit.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 5d8820725b75..e8b8c3257392 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -317,9 +317,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm_tt_is_populated(ttm))
 		return 0;
 
-	atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
-	if (bdev->pool.use_dma32)
-		atomic_long_add(ttm->num_pages, &ttm_dma32_pages_allocated);
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
+		if (bdev->pool.use_dma32)
+			atomic_long_add(ttm->num_pages,
+					&ttm_dma32_pages_allocated);
+	}
 
 	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
 	       atomic_long_read(&ttm_dma32_pages_allocated) >
@@ -350,9 +353,12 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	return 0;
 
 error:
-	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-	if (bdev->pool.use_dma32)
-		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
+		if (bdev->pool.use_dma32)
+			atomic_long_sub(ttm->num_pages,
+					&ttm_dma32_pages_allocated);
+	}
 	return ret;
 }
 EXPORT_SYMBOL(ttm_tt_populate);
@@ -382,9 +388,12 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 	else
 		ttm_pool_free(&bdev->pool, ttm);
 
-	atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-	if (bdev->pool.use_dma32)
-		atomic_long_sub(ttm->num_pages, &ttm_dma32_pages_allocated);
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
+		if (bdev->pool.use_dma32)
+			atomic_long_sub(ttm->num_pages,
+					&ttm_dma32_pages_allocated);
+	}
 
 	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
 }
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
