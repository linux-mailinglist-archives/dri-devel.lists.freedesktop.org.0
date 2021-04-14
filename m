Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3235ED94
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BDE6E8E1;
	Wed, 14 Apr 2021 06:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7797E6E8DA;
 Wed, 14 Apr 2021 06:48:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1RvIhRi1FSIsDsro/TTRykaJ9+tIYSqNLXp/F7UfUleslHbREfyxpBsGS3ON+WBrRdxN69D5EVzJIeKLhZnRFpUmY2WEz1IPwpECVNAXnwZ6Uqw04sn8Iyo54gb7YveCusaCkx4RJjqf/i2LDHwnZ/CcGKnEVZabnLT7cTD6XQJN9Vz8vLVmofhDxLiwoY21Z3sEhYBU/sEZdaHx1CdT27cC9YVYZf/AG8/JXAgUpCSh2fSmVi1mJjsBWrBVkLo7Wx4gyAHZf5Fx6NVL2LUBYo4XEmQHqOB+2fycB7xU1q32LPa4h0IMnoti4eFxdJgB1z+Ih/y0DO/pXBqOO6Irg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN2Yd6c53oyb+YR1k7QtiRCenmta+Oh7ACloZoJ7IWE=;
 b=oDzDpsOmyU47rUqhBhD1H+z/F5Jx2+WaBPEAqw6wznKNOagd6UXq5/iWN9TiEq6Wof2Gt04BxnG+uBJI5v7C1PNk5Hgzc8VufkmIBUgVh84iRs0DC12+i8VmLkSVxIgnnfUBxUPLjxiK3PdEfyB05RW/iSGgvYmKo1lyQ7Tv+fncqPIMvwK89G/wBDWvJcjVQmKOIckoEJzxEUDCO6/KNzoGwPN1WCmVMotAAnrTABBV5q5S1/fwXUItqekqV7WXePB4NP1+tygdzLDOVCikSVhaUJNGwdgbZIGNjsWUwYdaBz4NWRytJOo2OGLtQv6xRqyJ892Mg2aFHfnMlaUcUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN2Yd6c53oyb+YR1k7QtiRCenmta+Oh7ACloZoJ7IWE=;
 b=qU9+XYCgWDhd4rVb/dRnA9sV2P7duhKcTZUHKlsLOf9qJQ9qrX1uhW2BOq3tJ65L09+ldOphsaj9n5xCdQj5UJLiMsK2q5qUWXr0wdW+R2VVg/UMvbM7lEb1CLBSDS6+xft983uV02zR4ED3XKij2tG2QArr16e8jAbRbV/KZZ8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:48:22 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:48:22 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against pages_limit
Date: Wed, 14 Apr 2021 02:48:03 -0400
Message-Id: <20210414064804.29356-9-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064804.29356-1-Felix.Kuehling@amd.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 06:48:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49dc1e52-f6c3-4708-aec4-08d8ff114b41
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB412557DB81C4B6A136B5D4BE924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4W0aRDGcefFotVlrGoN+AYvP3gvCOMrqJH2lJkpHvww03MYLINFeJ6JHd8Rmi4s7/hEjzhYM7MIHO/GYgws8bXI+GbMIxe7ZSGIa6Jm6Dra27bIl/V4ny2uOCN1rQpM4TV/Mk8Fw3tvQG0+m1KhaoGMSREjBPrlR11ma7NwX7N2C/088ofT55Qh5bYeH+zVL7ZApmlq7dWS/KApM0PnJEiNEG5RIMG3eNwe4ZEZTo59vJQOT8pOvfJQehc7aJlNJnCoRQypJZJG/eCunnsm2MrIiQ4zYnesgam9NBhWr3sLRWa54BBie7zI0FST5s2U4FbV2cdEkyjnanmDuyO05iNabWqxNJabvqqptT1R8qVleCMHo9KyJnMj89hPmT8SlEB4cRukpfoxSe9HKsxerWffzfkMys5SbM1atHg8fzfPZM/wQl5DhiBsNa8f4RRyiDoXNJg2wPxzwGV6zQvT9P5wttVGSPnQRis2RPAbanYqXgGJIke7m7cP6/Dwhw+EeT0ru1eLe6hKSILa6LybPAZ+q8Ow1d3zBK+eyTYBkRHZy4E7dHT5kjwIB64UmU7JxqUMSeRdgIycB333Xg/f6W99X9PCy9aQe8XnLk9MbwrfjHGe5H7UlHdu9VzM3Odlp9SnvgMTNevNXHQNPo9DjPjhWiBDo3QEm0AZjXC6C1Lc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FUg9EAuIl+2wdQckIE6azMSzbtBwTAvAp/PEPPgz6dBQgvolAiiVZ0Jj1lpS?=
 =?us-ascii?Q?xIluwt63ziSczLTof2r7aEYXiBdvboebafDxj8KwGtjGnIzyGYvayB0zM5Dd?=
 =?us-ascii?Q?BxbFgTUdPobQO7HAKrd8gvk9BqGlkxp6NcTo+FWvCshLmgZWapTzHRmh7XTp?=
 =?us-ascii?Q?O65hVxv7FD7/54BttgsxcPtlOAN4Plu30eH8rqEk1zQEbNU6JWBsi5XSBIX2?=
 =?us-ascii?Q?Ialc3DPa67tk2R7X5pVmipe/D2MOH4XBXmVhd0STUBm8LIAKsNl7lZPCL9ab?=
 =?us-ascii?Q?H9EFp60oLb4vxvBgzxWzrlwYen+H/ps37XTaBn92UH7l07UeiqlNNiBkZ0GB?=
 =?us-ascii?Q?5y2BW23LYJxAZovdXXo+Ni5jRWxgv8zBWmDFIrrBi5EVLqcG4HkAFUpKmTXs?=
 =?us-ascii?Q?ITlM7uwCXTYMHlUgb0Nl+78sKLfpF1c0ivny7QpzhwuJeeCCx0ieXIjpq8I1?=
 =?us-ascii?Q?9FG1mX/lHGj8Ldk5TlhS9oIPu5ajCho1bDqR36wH/5xJVgw+3HnnrTDjsqSj?=
 =?us-ascii?Q?fmQXveLU1OIgzDJXKL58QEXyhWp/GDRWBbQ096DsKg75V8Y94K6WzxGKokPn?=
 =?us-ascii?Q?YoE8WVsoNoNriqXRTCMcbzELed25d6kleqODfzTo741SGo9F6vLlVIY/aCqq?=
 =?us-ascii?Q?gFs2SNua+WAKtocEsz1er+cYeFSXptRtrhKxxYD2qXdELUTQygqRXXDz43/6?=
 =?us-ascii?Q?eTCEv9AzkiurAsjwIM3vkFsGrDhphFVK7V1GEl2hvDEHkzf6+Ghko5p3djEU?=
 =?us-ascii?Q?XvWFPSruFqX/BgAMcZbWLx+qSWTQjtOlPC/e1eSFCly31Qyz+NuY1SYtHaiw?=
 =?us-ascii?Q?8k82bqxzfxCGNHd2biLI6Dzzf3xC9oZ0IExGQCZmFw9msFcqV/9tNszTc6Ja?=
 =?us-ascii?Q?Ewq2Ia8/Pho/g6/IujXI7w/RBHSqBbF5ULhPbHVN3uuC3uJfT9rbKLnafpHu?=
 =?us-ascii?Q?GlRZ5IyvRKd5nsuTciZDl6+s4yFjcW1/3Dp+fjNPNPDokLV8zR8eCD8LoafE?=
 =?us-ascii?Q?JvPI9OsDjcn0jyUziyVnDdnxjrgfU1CGk9yOCZ4shNucdOYqONImHQY0RsiP?=
 =?us-ascii?Q?jVrNsjEf27/PyNkt7lD+8oL2/EKx/ataMRPpV+x1ZcL+WDiSsI3wVqFF/2fp?=
 =?us-ascii?Q?8yRtr8tEr0IBy4AsWah4gH16ltnSqETBcwT/PRfkFHJw1gd4NXPtxQFYCFsP?=
 =?us-ascii?Q?DavgHZa9Dt1lI8ciOvSHZ2RODaCbHqW+mxcxlZvpuxu4eicAcoYZn/Bb2JKQ?=
 =?us-ascii?Q?vNVWy8yCFeMO/DgXoHj7zKAeldPumzhzpXZDNpoa4nTqTpdRd3ufQQy2ueWB?=
 =?us-ascii?Q?bQ/uUwxuN1UTme7bt8Qxg+6f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49dc1e52-f6c3-4708-aec4-08d8ff114b41
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:21.6680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLzqpZruHABrUbDKls/OzxrVlWCuDgJrOajk1e2hSI/c3/g8Ge7xNN7UbuQ3/lyxUTQZQ0LlK1JlSexP8ND5bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
