Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE63676D9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 03:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E4656EA1A;
	Thu, 22 Apr 2021 01:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD3E36E9B2;
 Thu, 22 Apr 2021 01:31:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6tZbmwbTpxrtHtZEVVGmt8tEAJjZjPUToHEvqH8zoVFCrMylsta846SfGwUz/h0zoXABbtEYxz5bkf4lsNx5zujeVQDOBq5NVPox0OeHUicF3Tqyy7WPQshaUr56vSZe54KXPtQ0w71lh1jmYwE0RhzmR9b7eEov0SLoLqGEZKthbryoxh6sZ13ug92PC/msXxFuvr0L0SNlKXzHTR/mfx1xuaJdhov+OZgp0mPeOqr78ZAe5B0heaS9xkzXX8o9BV3I7SF/o5ZVo4iQ9i17effCQ/BACx/wvZK4Z+WQgDjssMEq3C2g2FGwI4HFeil8Xspvnx7celxVLpSa+I4vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN2Yd6c53oyb+YR1k7QtiRCenmta+Oh7ACloZoJ7IWE=;
 b=UDHh7nWkx6MMozIwOHyzkpvdFta4hP5JmIhAIvui9RjEhIV4bfQyT87yRPuHLbZzUklfpTqujasIqWzics8uyQGByMLAz3v/HMBbPs/gOKFTIwOZYgci/xJMSBGS94ck1WUpv1mtuGdzRwB/wN/95Dt5J9JhiQcf5f5Z2CDhCfIL54TqgAZ/WLRoq+Yx2HKfbEF7yE3nPsETlGJq5CyRf5DnfxyUxpqaWbtzr0Fc0DIR0D+zOu62PQ8BiiF4eJSmKyFvuFqFcOpgp+qplBlAyM4ccy2Nj8dzNmPOuK+vENaC1kVALWD9oNNHC+38D30FS2JE5qESn178TCggPis4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN2Yd6c53oyb+YR1k7QtiRCenmta+Oh7ACloZoJ7IWE=;
 b=MVXRybiV09+6nNDjaaTMITFDJLV3ff1pW8j0GCEuYm/K1dAlQVGdePXnOe0CmbZvbl/Rt6vXCB/XKaEroc4WXD5xbLyTPvKJymnaJ4ffuQXfDE13n4DWg+dCRj9o+58dgw6Jo1GN/HUBTO9qXJ72kBaEHYn/EuGnzOv30OXVqA8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 01:31:19 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 22 Apr 2021
 01:31:19 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/10] drm/ttm: Don't count pages in SG BOs against
 pages_limit
Date: Wed, 21 Apr 2021 21:30:57 -0400
Message-Id: <20210422013058.6305-10-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422013058.6305-1-Felix.Kuehling@amd.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.21 via Frontend Transport; Thu, 22 Apr 2021 01:31:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4431fdc8-ad74-4329-b599-08d9052e5415
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB44384DB1FF809827600FC17F92469@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NRB9rdImk3OoQiH0MLYOEUqY7TZ7GLaHYDSlCBS5VsumnR3B5InrzasK6Dr/j/8T8lUZNHfy3hgeLUlcm4DjAG1PkO5GmOamfzDizpcIsa8Ateb7MxuLpD3aW+3XsFeMAD2xeaIg2SXoI+G1QY2NQJweFaOHNjALsgskNn7UvWYMNfC9uyhrKGPxfl/xCC32nLUYSp7yckTBehAKNWvQEu7w4MuR0gHZ9bRc1cc9iXI5m4iIDJ/FZs1aU0aHwSzsRwQki0AReQeipvpwg/XFGkPxj0YSqgx2EtDZ4fx4UafcpS72iZT2foA3NwKCJirwsh4fStKathsFaLzkV7MXYw5aA02t2HSmbS6vhUM00xPBh5Lu0R22ZfagQ4Kdd6nHpeJV9SqqP7s/btgHkZzjhAkX+H+Aae9hTKUXkoCi0eSVhNWOKPtt3hhE9P/S9DQNoHpUF3vfNXuUztnhj6obqjTfT8LRTDVxZRbs0isajVL97zx7dZ96aLTLqeD702eO3ZNBtuVbeBIpN0MfZUeSD5z30i3Mf2DmVOdqflKFGn03+vavb/7P4uBzPXBrsQPck0Rf3d3paujvOIHBufaaAJ5o69P9rb1y/IGtYQmRFTyAUEv4TSRbYCEd1dHzh9Q0kTkr1V5JJLQWgW4tfZKakEtxbSl9DH7kYKQC165y2N8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8676002)(16526019)(450100002)(186003)(66556008)(36756003)(66946007)(8936002)(52116002)(956004)(2906002)(26005)(2616005)(478600001)(6486002)(38350700002)(38100700002)(83380400001)(86362001)(316002)(7696005)(5660300002)(6666004)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?flEpaH/6b1HJ9cy2vlM7rrTB+akhCrORn3QfkkwnOUcS90w8Wd5KYNvuBnoR?=
 =?us-ascii?Q?HKNCLjgGTvC7IoKHt2ldESYugNxhNbR2qlMUeW0I4esFxQv526BYi1UAE1t1?=
 =?us-ascii?Q?XQSvnXRE3KMjY90kjj/wDJjc135A4shJB5FF3C2xxQEqn6aqQZ6a3eKMlizb?=
 =?us-ascii?Q?hEC7b1Roa2JJLmGXL7KxQPVrPtqWn99MDOhtl91J5GymyELHsVML61UqPf5j?=
 =?us-ascii?Q?plkAndw/k2AngpUEGltbQrqwQ8atRTOTk3fVouP5K76c+HWmZMmoPStjS6mD?=
 =?us-ascii?Q?galaSbMsAlyPvCxSKa8iX3R3U+/o8AgjdCc/2EAUd7/U6IHkOu0MHsVLL9Q4?=
 =?us-ascii?Q?G6X16E0QqRpq1bZk/EUvsNV3zu00kHv8WVTx7fUZJox5pplul+aGTPly42my?=
 =?us-ascii?Q?SCN6srekz4waTCBWX09iP7QBXPaHQi/FpMglQN5XZgGIGizaFXTjDsEZrPnQ?=
 =?us-ascii?Q?tyb7I2pon7Q2Ex1yDDZ91jlnv/uQXjuW2+jfsxoFpw6VGDPTpMKrXhaGDjIw?=
 =?us-ascii?Q?mcWFr/EAdUFh83kgcE2NcEsUJsHQCLWyHI1L8QXfRjyxEQR9viMGBI2OENF7?=
 =?us-ascii?Q?3zRYO1CBWB5XJx7eiRK0uW6iBeBGT6C5YxNLriEalLz71UtgtlNeEoN6MZFi?=
 =?us-ascii?Q?PQwggB/yvrF1d7rB7ZM1CUGYfCSIkb/9XiHvRQZYmfZigbrEb/tUBcVDuf0n?=
 =?us-ascii?Q?C/AD4/npn6z+X3OmhR59VNDDTNVzBe9OD0yW0mEjZ+kT8FY1bSYktWZOpZWN?=
 =?us-ascii?Q?HCgfbYDMftEraKJSOfUd9tp3XtL5GFHy6E9R2mGdr/rg7z6DzbVrpnEDGh2y?=
 =?us-ascii?Q?FdfqwlyWXobGbsnvMCvVoCz0iXngB00NSOXXtTsWhVpCQsB9JWcAil4LwRNS?=
 =?us-ascii?Q?vcM991lBnUEL7JLVun6kthswwBB2EfZl6yGaz4tU5J4j+wcNDODkFCj+oKng?=
 =?us-ascii?Q?QZeQDmC05sa032U0nUYjdGcp019Uvxvu/22fnjxkfkvl4eE+qDVohBWiEUKg?=
 =?us-ascii?Q?rFjXRzOEtFiSxI2o5wT6A2E7dF5fVUlsrC/HgzdL+TUfPMmRchAEhga6vEDT?=
 =?us-ascii?Q?DnxVjsub/1DA75d1TS7qQIywe6VOzL9bsr+NoBllpHuFtiCpBMRS8BThO1g0?=
 =?us-ascii?Q?95Np/nzBbYHw1xjJz+IfBiKQ2zPulS2eLKAML0KiVPMhXHG4cSjPbHCNQptB?=
 =?us-ascii?Q?EZl5RMG0IZsQVAzA/hnBydAXi7+uag2+5K78+yiV/UQqBarDy92yT8EFmzbR?=
 =?us-ascii?Q?nXKhcQOcUlt3JHKXuGW+02//nMVuvl6VqdWLgKqkw5DBiIhTTpIxTotawZGu?=
 =?us-ascii?Q?Xlysq/OBtvzrEo+JL69orMjF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4431fdc8-ad74-4329-b599-08d9052e5415
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 01:31:18.8562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRP0AkD6NwsysZng9xsBURwF0Y1dPkRorBc4XXIUK+I09IOQFyuMf6fkXZklJFXZuczXJPOmGta1U131u5wefA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
