Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD309BD316
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 18:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9941410E0C4;
	Tue,  5 Nov 2024 17:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UTcVMDYJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579E210E0C4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 17:11:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T2//nXte4ASpwDmpZqhD+kNWpevdR4hrBWRazb3X/xKi/5FCNBaqn0tCiV27DWqubEH9hAzDDzu+Kiz8dOwOUMwZPMkxjAOpu2/gODeirFim+YYK5IO0fezt6rTIwx76+mhrJNkYr6vrwwD5Hibg4PL51SLYM2lkYA0ayqX9e8jxZjov2jm8b2cPnA25y4DtMtk8Sl8Xq1SeLrOGT4cF+t6nu7DQeGGho0F1I8DBtgZ/Ev8vHvSJLW725S6dJQWUxIbi1X6V3q9CWFLvB1lkzu/qq3fLoTApLewwyBnqAtHjb7zgv8hYwbvt6mtI7JTZzmioISir1mrILtc/KtEb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Mq4jiqJQ8ULJs0oi/mqNOp1q5Lxh6ffycIF3LfFD6o=;
 b=W1gHUa8v5CyrRsOD4ImZTrbBSGIhxMF6x13/WeUEnDgp1pzMitosdqjFMAPkLlMCB1liWHBNatnoERASwJiWiTLERqMRkXnGe9QzW3/9kulcVyd+RVJfxQQlGCe42snHWLc8RY8x4xKzM5cH5tPRha8ScOIzo4oqWDRbPqSJoOsncBxAG+atkvOkyPRH040K6KkLZjyknhsOq62iaalZO22WQJbtyieWXGpEkwCPamZ7mkow9r/U3FQR8pJaM+D/u7+A8tJmiekPylcp9oSWP7QWRn27b9ozUc/cAUUm3/FFuy8vynnYUFrkHl4HvX6m81/+nCrkMeBrfZi+a3PPRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Mq4jiqJQ8ULJs0oi/mqNOp1q5Lxh6ffycIF3LfFD6o=;
 b=UTcVMDYJ9bBQX8SVkvFfS1GKYfLRkIn/rKeprMt5avM/lO6fGMzov4lNOkgMrqWm8fzMuo1bSG8+uWFUKIWL55LyUsZhNodIwwl1bj63i9OHRmzraVwJHOSDL0NalYf3/IomntVbxrAcLNChkcJXuy5Xbmzkimv8ZUz4oKypqNmCNHPx5OA6b4OKvE75k/GFif9k0E8dxkhiwZY8fQH4Fkuj/RxVUwGcjNLQuPyLX4MDgYNWknr8azVmKt/a0m0L/M3LTtvsKsZKytTPxktFyGd0Iap/SN2xrtc+5ykxigDp2omIi7s+7JsXwa4152kwkXY4SrVVm+QkDbSiVEXoCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 17:11:02 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 17:11:02 +0000
Date: Tue, 5 Nov 2024 13:11:00 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap
 behavior
Message-ID: <20241105171100.GM458827@nvidia.com>
References: <2-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
 <cf17dc41-f72a-4d90-a78d-2d90fa0ac243@arm.com>
 <20241104200951.GE10193@nvidia.com>
 <20241105165942.GB12923@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105165942.GB12923@willie-the-truck>
X-ClientProxiedBy: BN9PR03CA0708.namprd03.prod.outlook.com
 (2603:10b6:408:ef::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 40473b67-46d8-4fc4-41ef-08dcfdbcd31a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wIMXUyhsYrAvJuUFV2ra/c2b1DJmQ4Ahz7KNzjVFW9nutoNVqw1yKo5HzTnn?=
 =?us-ascii?Q?rQcq7aEu/rsmkWszL3OwB1x82B9+HBO5EOMAVCUtqy+OVGixIsBe4fmgZoXu?=
 =?us-ascii?Q?1UU5c4vNwFhvlyfUH9WEKAhMCcpSUCwpovr7U+DOJtmk8aQoj497eMmKun0Q?=
 =?us-ascii?Q?uEOLSJ2a0bicoRMNzFKE4IFI4V08aeln/RGRq4ho5syozNcrlZph4OuoCvZi?=
 =?us-ascii?Q?a2lha6cmRWprP3NkZBnNf7S+5Dk4g9VMcB8MaPJNVbxFYv/bDoh5neBUFX6l?=
 =?us-ascii?Q?aYP4t7sw784HsoJjKpXZxG6MG+NMlmlb1oOEo7uw2pfafzReTApdJqO+Mqsg?=
 =?us-ascii?Q?QIgwbR33G2eGGFJemJYuZITTf2nFUk3waUuv8WYiB/B7LGkiPJfXjl6LQBcL?=
 =?us-ascii?Q?0fse5pk6D2vbYUrrY8aSQDdj3DCvReQ+yDyYnx8/Bz1JgQ1cWCQwMlbao3ka?=
 =?us-ascii?Q?wMQTd+gZuqbpxdANgvnB2PGU30bOUOZc5r0xrnpZz0Vx0osqIbs10MNaQWAg?=
 =?us-ascii?Q?JMyy9kjePgxTdh7kypNiksY0ZeaZ2knS3NOoeMyXMdw6/dzzBn7ZIbKwZRMt?=
 =?us-ascii?Q?H7kKbvafF2V6zI9F60hXgokSFfajJP8x6bhBOmvld65PybXQffIN8s+pgpQ7?=
 =?us-ascii?Q?S5zebxA2+rCEtOMabN5BCi8QxIUY8GIibEw7DN7fPSU6sVH/TIUX9m7lsFN3?=
 =?us-ascii?Q?mvMv31A8GaCJM1n1cZ6nVwRN6ol1vVLJJeIwVpTxBetopwSmat+EWTwn3bt/?=
 =?us-ascii?Q?FN8HSiVwVrw6tbvKvUoHaOkwzZNIS1SICvtkRxbakbmQrZJCYP7Od5wpo0Ec?=
 =?us-ascii?Q?CVFDPenk9RqHjpCDV902QaDlKlFvJaxyfaXvrFVoG+Tc+zzwQr7TsaV7NM0K?=
 =?us-ascii?Q?Dw09GZNlL4IPD1VjOoDLyMVoyFe/uKs42gT/Ylfcole8vjQRoOWOsNo/7WWh?=
 =?us-ascii?Q?SyCrf4jtSCoNxW4yg9Gm5Cx9/YZoYwya55FYG2NHaTgd8ToxFcObXmOqO0Ql?=
 =?us-ascii?Q?mDaDibaZjTUts7hR1pl/H1CiIOWLK7NneG5BbiYFXEBZNzUEtHRJcOMZ5G0U?=
 =?us-ascii?Q?x4Haqc18gfa5uwQbVHqApsMrLibYsJocSpK69by8IRjJbmE5ZEeTdPgJ+E1u?=
 =?us-ascii?Q?zWB4WUHirGlnhmEZpV3j2QQeDJBooJnm5lJdMoH0fwWWZ8qwlEFUWWxN6lLY?=
 =?us-ascii?Q?ieMFb2AsKQrVxnNHKNaIfDXWMfELvBDapSBFYkE9vMXFSkVwSODP2F6EdHub?=
 =?us-ascii?Q?QM5+ALLU86V31E/JDoxIOfSnnbnVte9iVSJaisv60yD3KQEVmkOIF0zFz7bY?=
 =?us-ascii?Q?YR51aHk9HG/+s3dd/uOuHqsh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vnp9ZlpTQZehntBMK6yFYFZ2TzsoJ+KnZyMiUDEPnWv2C578dcETDsL+P6mO?=
 =?us-ascii?Q?4AL00pfvjooaPggFrumfcVC9/ABkn1k36X2iK5Z3f2qrhM9nUs00zhKVmgCN?=
 =?us-ascii?Q?4sHnDAwXjKqmscmqfr+PhEu0CoFVZrPeVkonDoT0npNfbTGIH0mOb/aAdc2z?=
 =?us-ascii?Q?LWXbGzPD7oz4Rj1SClrjr6GCj/D/f73PRkl3ANRNgsShJK9brKlfbHhAfWi4?=
 =?us-ascii?Q?XoTCS1CA09yzEg0KiEv/NtcMzYuM3miXe5X5bma4eD0KO3vc5Cv2tEesTKUz?=
 =?us-ascii?Q?CudD6Wny4GNyeSn61mC80dIyCb7JtnrY4+LggWJ+akOGdlu0oLdjoEYoJ+qd?=
 =?us-ascii?Q?RoEA79/bXRVKxs7wHe1plWz+5U0iVNoynrfr0CoF1PASDLxKipj17Fa+sC8y?=
 =?us-ascii?Q?A5pCQxQq4kFB4mniI8c3gRv9PNnBVb7TyUUziGYlPXmLiD2rHMhSRKkMubqJ?=
 =?us-ascii?Q?GWKqGZvlzUULZKiNuwp29XJHBzj5+E/tt2+utX/SfKd2ZeDnj3zecX4i/j/h?=
 =?us-ascii?Q?aNDNkhKd7G0bVCzvPyANNNnCw3rK0uD0MjPcbPbLy6YAS+nMZPXexBBloAQW?=
 =?us-ascii?Q?KyKkcgjEK/+YG3cOcNRSr7joOXxCxfWM52n1bSU0xVvTSVe8ifH/+YlTVszb?=
 =?us-ascii?Q?rFpq+k8ebLiuUCo7a4IUPYq3E+w/ci3Wwub3oWPbQkKCcDco1P/JKmZ5D8Zu?=
 =?us-ascii?Q?j18NVgw86IjzeigT65zk0nG4WnNFx9ByMqjSp350QUGdplnplyRijvnpi7X4?=
 =?us-ascii?Q?tMGf9C2sdY2RVcXG4CDccV9iZ4SXC9M2mESSvQljExFacL0joPrk9UuDZAKl?=
 =?us-ascii?Q?J/UCp6T16GNF4t/iXQsDddh/9SzsEiRfSDGM/DZGkOjwraTRq5IeW/nINgbA?=
 =?us-ascii?Q?iUg78MTecc4mChkMzXodFhX2VVUOhRVloRoPV9pMuHgCa9XOEzYBFNW+1omg?=
 =?us-ascii?Q?/f86Ab7Y3LW/V01RBEkWm4YB9j0bgLsBfZmQPUmEDRsVVq/gw9xjLmldzy/V?=
 =?us-ascii?Q?TZuDwjZmhQIDbCdJSIAs6cr+KQo3/lt9ASXuzvr7mE9n6sa0skICa2xsorVF?=
 =?us-ascii?Q?sxq8ZSuI2zcIk7GxDAI2ETmSXvI4mexHjC0Ss5Z81nDOkuJ7NavwoWsRiY17?=
 =?us-ascii?Q?LEVDsz983QFwnSLCVQzzUJl+Qa+MJrzP0hxjHgveTWLntlGtUdbQV2jqoAKe?=
 =?us-ascii?Q?KHkt2RjWF9aqR7CvFGqGW79fKUACLgeG8n0RlisRx80UcTmTc0+YAGBhX6Cb?=
 =?us-ascii?Q?a8n4YULVTbkb93YN0e+V2gUHYFBY4ofeOW0XyvnaeSpvboA4TTgcliSMwoWU?=
 =?us-ascii?Q?ZT9/wmDiVEMQlYK8rqGL5SAlYjBvFZLDBMxBtABieooW/+HKxihs3MAo6fqT?=
 =?us-ascii?Q?jgIWJMAhizSgghZw6t9U+oM/noOJReZu8x/Kc4uI/GePqkABEj137x1dbdqN?=
 =?us-ascii?Q?Xv1iSCCAdOdoYROUmrYPUSQa66XaQ6UT6udDIn0IvoDjDAR3aptZGIjrpCOT?=
 =?us-ascii?Q?H/06VnharYziNHle9jWXXkVKvUe6q2jRSXHIJW4SGvPx7jjFnaijdhT4bdwF?=
 =?us-ascii?Q?enWRerb1P+wwEg87N+qWuxF9jaBZ1uznZUoB2ZwX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40473b67-46d8-4fc4-41ef-08dcfdbcd31a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 17:11:01.8692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /KBIZMtIN3gqeIHzQavvo77AhrIEi4b4FMaorLvwWhTpsNLjgDDCW9J2+0qbEWnr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132
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

On Tue, Nov 05, 2024 at 04:59:43PM +0000, Will Deacon wrote:
> >  	/* Full unmap */
> >  	iova = 0;
> >  	for_each_set_bit(i, &cfg.pgsize_bitmap, BITS_PER_LONG) {
> 
> Yup, and you can do the same for the other selftest in io-pgtable-arm.c

Ugh, yes, I ran it and thought the log it printed was the success log,
it did actually fail too.

This seems like the right output:

arm-v7s io-pgtable: self test ok
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 32
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 36
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 40
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 42
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 44
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 48
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 32
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 36
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 40
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 42
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 44
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 48
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 32
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 36
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 40
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 42
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 44
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 48
arm-lpae io-pgtable: selftest: completed with 18 PASS 0 FAIL

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 9c9ecfdf87be90..abaf323843e3c0 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1283,19 +1283,6 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
                        iova += SZ_1G;
                }
 
-               /* Partial unmap */
-               size = 1UL << __ffs(cfg->pgsize_bitmap);
-               if (ops->unmap_pages(ops, SZ_1G + size, size, 1, NULL) != size)
-                       return __FAIL(ops, i);
-
-               /* Remap of partial unmap */
-               if (ops->map_pages(ops, SZ_1G + size, size, size, 1,
-                                  IOMMU_READ, GFP_KERNEL, &mapped))
-                       return __FAIL(ops, i);
-
-               if (ops->iova_to_phys(ops, SZ_1G + size + 42) != (size + 42))
-                       return __FAIL(ops, i);
-
                /* Full unmap */
                iova = 0;
                for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
