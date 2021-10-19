Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B5B433E52
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 20:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41216EB56;
	Tue, 19 Oct 2021 18:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A4D6E88D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 18:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f315IRdCL2x67D+xwulSoTXaEU9b7JfGK4lgsAYM+KSXD0IMa2ZKyfmUZh5XXanQudPgBZSff7lNGcYFeh0rYgyywmRqxT6az3N3N34AbyeN+yjyf11UhuuH9KLWpIs6AOu7mQCmnL1VwOn7NRlNgVQWhongIy8pX9rXgqWvb3ZePs6LLxHqEjhn2zJ3+eq6RR8ipIP5gdGaopTAgGkZ0BGoTAsK6X5WroXvcO7d+zVIo5CzfbxyulhpuWM21wO9vkNMqL7GYOgnntCRPYIzica6acwzbufa53R2+1Iqer7aMORPMVNBOo1ZYJ1Bk1hTfvRobcCyd24N8d4WSUeYzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLCVef2qnVU4gvpJowVO5bnVWCth5kKWevHs/UHblL0=;
 b=AocTTtxb3ySAcn6ndsc1NKAF3jca/OVlDcMrTfKERMLJFV8ePpR47w3ZftfdLQyF829RH0yIk4WN5y1yOOyFd43Nm65/JSsY5J61zPhYX5sJv3hB7I/5/p0wGBA0opziKV3Pr7DuEH5A9+XfjYvjLVWQokTdgK9GJkrunBHBfP4F5S+kk8It5DIuz10kBDqLIm6AwM38MQ0kjKiK8EYmJlpOhUwNj1w8+jFKO/PpUmuhYxSrJCsmxrU/2njAgTT75+TDqZeb3X3f3OA0tT2c0OSPMFh1aEPKmGwk0XSJyJBHLETsjjATeIrOgfvzeYDluRjTPTb1+8Mbqaje3Ir16A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLCVef2qnVU4gvpJowVO5bnVWCth5kKWevHs/UHblL0=;
 b=WVSe/cotMBMEqepvGQ4j9Cvw9DsYUxna8kQNm9ZNYk+TBuFKity3Ys+mH6wnPudXiWk7HEI4FYVXb66womcTEsqLD7yuIr/pV6yXxG2RRaG0gmabCDD2PzE4figpHMgkbwVlV8FTHkeplGKycSsMoE2XXE2vkHnFSXmogj2shFkvzIJSPFyM+3RneHt1JXo3qiib617OnVeOo3fkqqWg71j7LnWf/z+LNmiDxJfZscoce51mt9ZFROMZ9O/zwgfMSAo+gAsiYv08A26qV/Dw3AEqe8rpU361r44GmjOwHSQ9e8UCF2X58EAfq/FZlDc2KbzZdnU/31/O1mFQ5v0O1w==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5361.namprd12.prod.outlook.com (2603:10b6:208:31f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 18:21:37 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4628.015; Tue, 19 Oct 2021
 18:21:36 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH] drm/ttm: Do not put non-struct page memory into PUD/PMDs
Date: Tue, 19 Oct 2021 15:21:35 -0300
Message-Id: <0-v1-69e7da97f81f+21c-ttm_pmd_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0013.prod.exchangelabs.com (2603:10b6:208:71::26)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR01CA0013.prod.exchangelabs.com (2603:10b6:208:71::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Tue, 19 Oct 2021 18:21:36 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mctjz-00H4U9-VL; Tue, 19 Oct 2021 15:21:35 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78ee825d-ceee-48e5-8117-08d9932d499a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5361:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5361DA720512DE0039813C5DC2BD9@BL1PR12MB5361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:294;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PkZO05ekfQa2c5VKq3LE0Ys8XE4f/u0JSSSZfusHxm58tQixzSKLomf6u9pv+jnL/J0hN9zpTAZK165iLoPS6RZsCC+3CC7J9ZGc0N440HyE66DPJ+6SAMI5J1F65sm1FJt2Rn73xylASQFrLKAG8wmvKeKB93T90MVV2B7E1ayJCSdgv3EfI2PzGbl4QmvqI+Tl/O1m0Umr8YftCMATqRTPCH1mJku6jjbF1pmhn8Yr/s2rTFEHK7ylOSV1gJhDHXgxnazFNLvwbzPEPzffgB9b7WSlu0ok82UJZARSaR3hxOjQcX9OQartBasIh/On2lnfqomufStlR91ud5OwYhHRqL7COZteyRCKwTZKx6aDKp2+evLcRoIn6TfMcZwkL7KXbWtgnKKXiiDv+oN6QY42DSV3nXomPxoGKW8Z70dcLHZjwXFHk4CVuGMtAqJIDpsu/N6Or/UBTUhKdiC+uPDVfN0CR+v/twlDwSyxBVCKDrtFzPkMx8rkJ/Zq7X96sMhbyMtFFMcxVgFvQTjISDqVv352TkF5ECaMnfTlxZpMLpuZCMIT/BcKQEAIq25nXcGABgl0jZkXJKPmBvJhPcG5CBfqWBy7fSQowlqm/W0eGWo+B+4kLB92QNn0sziOT9CfpMt8/tWOVXDL6CuVxwOPFXXF6RnP1o4icZLsyXzpyZOUy+OC/eJUsNJsH01U
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(508600001)(83380400001)(66476007)(66556008)(54906003)(2616005)(9746002)(9786002)(2906002)(36756003)(8936002)(110136005)(426003)(316002)(26005)(186003)(5660300002)(86362001)(66946007)(8676002)(4326008)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?itCZMrM7aV9DOzFwhXxL5MzJoQNigbTJZPGGil1nFc8ycMX+INqiVCgrQ93P?=
 =?us-ascii?Q?hm4omCaAcErsqfFZ4UG7mrSQuabB2OyJd4Q/6gEymkEAyZKL4CkpBLgRfTzr?=
 =?us-ascii?Q?khaGhbAKiefdRpig5cfVf5SI7jXQrF32w6tkM3eOFGlSkO8pZ96zPvVyEVBJ?=
 =?us-ascii?Q?FRlT+/Sli9Q08VqeCKyp6XlGlkEg9uOQNSO16gGKWRvTQUIvJ+B7YKxt3nUd?=
 =?us-ascii?Q?scmtzh1d+pD61XLBMysNFxPqIpx3ouDuL9MmjRNnyn5GSoDTBbrEeoNhc2pb?=
 =?us-ascii?Q?HPanbncv2RUMJe4R2byblGldULDKbYhPrah+pWwDSUt6zDOdUBP6e2ROt+VO?=
 =?us-ascii?Q?YJ9R6w6AhaHiqFoRzKqSAbiIx6A3Ga4RZSDbEwmZP7QHPeOKHB8mftH0jpIl?=
 =?us-ascii?Q?49Po7ecrqiH7WSbFta2NQhmF2elHusQS4mIfzd7ZE3y45xyXIqqnCUg2i90w?=
 =?us-ascii?Q?5Eoqan/uP37n5OnS0mTZpzmKd2WLzLStQk+U8JajeT7TmMAki5XLwmPzlUab?=
 =?us-ascii?Q?iGtQ1Bt7mDi0BZyOTV8x60cONJfp4MYE1gb2FXnRZ9tBcXYQ73zCBh0wy2Ht?=
 =?us-ascii?Q?Y/ueWM6em9a41cgTug/7BEb0TrnNX6nqH6MTkmu9SGwpRN51lCW5ZGtaWSRJ?=
 =?us-ascii?Q?6EvWrpIoh0iI8meXhG23v1gshhsBkTxAaR0D5adewo9Ji7QcRKx0sGPn5Y09?=
 =?us-ascii?Q?n4W9rqiY87jf3guQbSggE5dabGGAC7AzNwCdygU/qXeoBOSTIxa3JLPugImN?=
 =?us-ascii?Q?9b28orm87fs1j+mTW3z67CLcrm3sa/mjuMT30i3oMtnsnEdBapr8Dr+XJD2Q?=
 =?us-ascii?Q?aJYk1MBhSVB5da5A7nwaurEcywWnjp5pyW5qrUrIel5p5U/xjSm5C+DbS4gz?=
 =?us-ascii?Q?qh6OMAUWPwuFWJTFRSlZDnDpeCAs29ZzvegCy3+83/m/1bxNx0hz2/Nr3Hrd?=
 =?us-ascii?Q?Oie9TnrC9CaKt7LGohj86PKOAGS+zhtQ30C5Sh9rdkapFDQJZfIXBePd30pB?=
 =?us-ascii?Q?LILSnHiLmv6q5M042hOZKIlRdSbs7ZE+ldMwbKMw9xVLXLyARsMQpRP5zmS+?=
 =?us-ascii?Q?+zlBD5ZmDdDrwIuRQk9nRseEF0WSEj5pNHxsePGVeX9QUEXjy5jFCSeVFEHB?=
 =?us-ascii?Q?sS/T0+86RNtfVgIbUj77Y9iZzydQM6wzdiU9rQ/xla2UkT+oSRbZ0h/7a61g?=
 =?us-ascii?Q?DvryFDFJXdr6MKSevwjwrGXB9NRoYssjjbsbBHPImEZf5naapiPeh3p6ClKS?=
 =?us-ascii?Q?gcBiLaCYNfIVTiKVja2to2R3S6mxtcmx2h8GsgCKKCTDnYY7KDyADR47kRnR?=
 =?us-ascii?Q?2sSrjd9Z3jSjQs0vbeiHs2tK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ee825d-ceee-48e5-8117-08d9932d499a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 18:21:36.8126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5361
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PUD and PMD entries do not have a special bit.

get_user_pages_fast() considers any page that passed pmd_huge() as
usable:

		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
			     pmd_devmap(pmd))) {

And vmf_insert_pfn_pmd_prot() unconditionally sets

	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));

eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.

As such gup_huge_pmd() will try to deref a struct page:

	head = try_grab_compound_head(pmd_page(orig), refs, flags);

and thus crash.

Prevent this by never using IO memory with vmf_insert_pfn_pud/pmd_prot().

Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

AFAICT only the vmwgfx driver makes use of this, and I can't tell which path
it is taking.

This function will also try to install a PUD - does vmwgfx have a case where
it has obtained a 1GB high order page - or is that dead code now?

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index f56be5bc0861ec..91d02c345fbba8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -203,10 +203,13 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
 	if (page_offset + fault_page_size > bo->resource->num_pages)
 		goto out_fallback;
 
+	/*
+	 * vmf_insert_pfn_pud/pmd_prot() can only be called with struct page
+	 * backed memory
+	 */
 	if (bo->resource->bus.is_iomem)
-		pfn = ttm_bo_io_mem_pfn(bo, page_offset);
-	else
-		pfn = page_to_pfn(ttm->pages[page_offset]);
+		goto out_fallback;
+	pfn = page_to_pfn(ttm->pages[page_offset]);
 
 	/* pfn must be fault_page_size aligned. */
 	if ((pfn & (fault_page_size - 1)) != 0)

base-commit: 519d81956ee277b4419c723adfb154603c2565ba
-- 
2.33.0

