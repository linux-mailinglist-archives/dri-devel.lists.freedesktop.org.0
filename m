Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585E8437CD6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 20:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887A789D2E;
	Fri, 22 Oct 2021 18:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12AE89D2E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 18:57:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfW8ck7QZFGITdddFJJYfwldin3Kxlo0d/zeMIM5o0Ij0ya+YJ1Zo91vYHYqI1O5CTSebtHjnwljYz4N3UcUlmdsMvaxOCzv5un1AeKLINIkLTIcxlzFJcSFpTQqqzJSrDNKeWoo/ff7BoLbrraU8p07i1Q8iEZuNJ5Gl3vyjFewyBRO8qSPV2ItNNW1uosO4cwKhkjQz3P9L4jVNXuy//UcT+RK5x4bzdtTyg+0O+WG6kMBZCZsR8khgbDzuKwMYwllNgWj3tzW2A+yo91Fio7GWhx0RVrau5keQjUIruPhOfze5ItFY2UMZVjXWOhLfHiUmGk1BTcl4n7yyqHPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td+wZTCv6/9B0nV4lWnf250InCwnfsij/iY/ZfbipmU=;
 b=KE+FBUTMEFLD8lgVUaQSbNmLBCo3Q7ppdP4VH2KgyGFCMN5PydBF3ljBtv4nc8Wd4qWWIvO5fYmoc4snBv9MrD0ciz2JBoHi0uwI7+/6Er0F3M3SxVB1IJg5dbMYMNjAFmXCNoBMVPXIFBX9Jxu57HTFk3prlDDE8itMvtzDUDXIbOmg0tok+DrEkESy8FjHT+UDrupkS2zWPTRUO4AvCf0I53VqADq2ynWjBMf2szv+x6WeRHHKvB0nuSkK5jFuHCO5CNGONaaBZ/OccbaifTXC1IV1MdE3yC9/I229rzdfqpU/DUIhh6+lMKdujPHjsfceqFXp+/jTaqpNyOkZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td+wZTCv6/9B0nV4lWnf250InCwnfsij/iY/ZfbipmU=;
 b=D1E0gJPRp5WqJJUmy9Iy15bZC7fwRaM6qszV363Y/zFWi6FLvYyXY7q6gmRl7LqZ3I8wWNAzD5W4jLCXK2Da9j00dstOZLOhaRr1r/a5dUiAEjE51jq0YAa3CWs7CUZW8c2V0OxqjmpEL2gkvnhnerBZOzLM7s5F1nZoYN8jcV/7X1SHAbxLovSZ0vJHMiGbmmbnW5c35v8rUkDIksnKQuTVHYSmCV3vsyDyfdOv/wMmmSwDTshaLJe4lyo7aBKhEOhn5dLhIhFs8AHqCK4Vh1gEbp+T02erAsDLGz4Kr2ZGyOBX5g+30HQLZxJoaQ27/azazBbv4WK05EhwUthg3Q==
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5207.namprd12.prod.outlook.com (2603:10b6:208:318::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Fri, 22 Oct
 2021 18:57:43 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 18:57:43 +0000
Date: Fri, 22 Oct 2021 15:57:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Message-ID: <20211022185742.GO2744544@nvidia.com>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
 <20211020193702.GJ2744544@nvidia.com>
 <YXFR85joqUODJyy/@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXFR85joqUODJyy/@phenom.ffwll.local>
X-ClientProxiedBy: MN2PR20CA0048.namprd20.prod.outlook.com
 (2603:10b6:208:235::17) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR20CA0048.namprd20.prod.outlook.com (2603:10b6:208:235::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Fri, 22 Oct 2021 18:57:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mdzja-000hsW-1w; Fri, 22 Oct 2021 15:57:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66121e6f-6515-408e-87e8-08d9958dd41e
X-MS-TrafficTypeDiagnostic: BL1PR12MB5207:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5207F93BC8E87A9A4C16F8A4C2809@BL1PR12MB5207.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tof4N7xA3XAGphUXteH4yQZoiv5h8v+2fH2ojqjzUMch21aMucbhPc+RLQksusDp2yT5V9GMMND31f/jGl59tlzGyWMlt+BtRfkNpUbwnmUOH7cLByJ8gdtwK0aEGPnxkDY+MoSgiRMsxFUxoyxbbFhxvyuc/eiAWBNt41p28PZBf/oZ8fACBjOOgKSEc/2HH7jsIp+/umVTnlg16T1uZOWxd9JFbxwFbWGqUCxdCDbgQO5wF17VLFAMRyqVPLas5uT/M2oCFcPnGXxg9oJnjCQ2edmFC1pMpqlCJun3dZbGpzh37Z+u5CNPKOnNLOCJWry+cQelttTfscGq8lW7zR4qc1OYUBj9M3mg6cXgY8hiSnzznhNgL6FJKcRo2hClc3ngUTadDpbXeWml8mbLjRRbDRGV8+zIoD/zIr6Ucd6F2o3/8DdPZLcbtaTTPyPibi9qdV4ivEIKhnZQQRFWqBUqVTFMoNK/oi6F/Br1H3bcFJ0rOgBCo2ePtMdsgB14TkALQqOIqOUN8RZP8QO9p0OJcysTtxZM1OjAajfXVGR6jnb2fnjL+velIZRCyCtq9RI5fXbtPWX/i279MJp+10tyvLtns+C+bl9UYbOFBNhqhxT4lFQTuhCmdJ4qlt6XRIJbwTFk78wNbD2f/WthNw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(26005)(9786002)(83380400001)(66574015)(9746002)(1076003)(4326008)(426003)(186003)(508600001)(2906002)(86362001)(66556008)(38100700002)(66476007)(66946007)(316002)(8936002)(5660300002)(8676002)(36756003)(2616005)(6916009)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjF4TmNzOFlpcW44N0pHeTFjTVhONW16YUFnb3BWNGd5WDFVNlMvelk0bDR2?=
 =?utf-8?B?bzN4ekJUNjdEc2QzV08xbyttRFZUR3pBMGkxeW9rYVV1dDdVZlQxYTk4aWVF?=
 =?utf-8?B?SnpHb2hNcjFFQXBNRWNjOHZ2a2Q5bkEyWFcrOEFPQ3NCVjhIY3M3Zm0vazNw?=
 =?utf-8?B?Q3ppb1ZaOEVvT0lkdEVaWkZuK1poM1BNYldJMEI0eEY5bXI4QVBROEg4NTQy?=
 =?utf-8?B?ZXBzTklZd0J4WFJtTTk0ODBqZG9SQk1SRmZLWjBwRHIrTDNCV1NHWlMyTUNM?=
 =?utf-8?B?MEZmS0Y3bDVkOHM5ay9PTjk1M29ZU2hOd2JMYXY1NnRvWlNMbUk2N2plVDFY?=
 =?utf-8?B?ZkJXVXZTcEZNNEJNcmtyWkdKTmRMaUJtanpzUTRNR1dGTDc2bk1sT1lING0w?=
 =?utf-8?B?N1VOYzljUDAzOEtzMk5TNjQwTG16eUtSQ0FHOVBxOTZMaXZiNm0zb2pINUxV?=
 =?utf-8?B?aGNiWmJxbUY4VDVockhVTVZoNGUzSy8rMmJ1WFR1Ym43SlpTL3l2RHpaWHdY?=
 =?utf-8?B?VnRnaUNvNEF6VXF4MWVET2VNcXhoNnJzdkVLMmNvcS9jWndBY1dzanFUNXc1?=
 =?utf-8?B?ZkcxSmlNNUpMTEw3VlVHZHgvMmZiQjRyMERXRGQyc09XcTBOeFptR2J5NVhI?=
 =?utf-8?B?ZER0dWR3SlVkSnh3c3h2aXRhN2RMcE82blhDeVk2cmJpNCsrOThhY1FSWG40?=
 =?utf-8?B?TmordXRiekhSam0ycE9lcG9pZTdWTkRiQ0JGdkZ6TitURDc4L0w1eVp6WkRt?=
 =?utf-8?B?QnRSenZxTzM5bG1NQWErWFZGZ0E2bTFuMS9Wajk4Ti9KRURFb2NoaDZJSUlR?=
 =?utf-8?B?M09pdEJBd0tkVzFSRVpTU3AzQThuY0ZiNGJHOWpyZklHNUsyOGMyT3pmNlVh?=
 =?utf-8?B?N1ZTWFQ5c1EwdWJoaXVaUWtCeWJxdzFNZTMxZ3ZYUkhLKzhYYTMxd1lnNUpX?=
 =?utf-8?B?cklpYU4zNnJydit2VmwwYWNkNGxkc2lDMVdwRC9lWVZLS2hWYUpXY0NwQ2lC?=
 =?utf-8?B?a0d0QnBjeEp0bzlsazZYSGlaVjZ5L3Y3ZGpBOUpNZ2pzNjV5QnZwV1ZUR1hi?=
 =?utf-8?B?bW5DM1kzd25QMjZqaHljL1BvSmJrcjJCVVNRODdCckRGVWdXNjNHZEt6bkUv?=
 =?utf-8?B?VmtzZFRkOHl1NzNMMnc3cGRsUTd4NDI2c242d2NGQm1MWTVXcnlCYjd4QUhp?=
 =?utf-8?B?TStLUTdSYlMrQ1VVT2Z3MExCMUlxTzNTanJFSHo4aU1Va2dOU0szcVpLYVUx?=
 =?utf-8?B?eTZnZ0lFUFdodksvNGJ6M3FrTlNqOTJZdkJBVVRnbjdPUmhBYkkvdmFaZmM3?=
 =?utf-8?B?QlFBcUFrZE5Xb0hoRFVLdFJXK3JwUEZXY3lWblpzL1ozL2E4cEhJV1NsM1Za?=
 =?utf-8?B?a1FaUk1xUkpZYzBnemFRUFBXZ3RsTXJhWm5qdnZ1NVdDWnBCamhndlZzZkR4?=
 =?utf-8?B?R3MzRkIwdmVCaklIYk8yaGxZNk9oRG5QVG80cVNuRmIraGRQYWlUb2dqV044?=
 =?utf-8?B?MytEdm9PRUtlNDVEY2RLcmdmNWRIS2I3QXhNOVlxQ2pJYVU5dTVteFlKdFZi?=
 =?utf-8?B?QUxqaHBnQW1rNmtsdmhZOHdWaWJ5VXBJRmR2RmlnUE53dzAxRnZibnhQQ09h?=
 =?utf-8?B?R0srUHVRSHBObXpmdnlBTEtPSWdtaTNZTnFScG1JUGR0Vk5LeUk2RGhhM2RT?=
 =?utf-8?B?NzU2QWw3eGtocTFtR3lZYjI4OTBRamJ0NnpLdk1ibmNNS2owancyWitsQnJ3?=
 =?utf-8?B?Mkw5dkxzbWE5SE5VKzYxajFvcjBOWnVHeEpKc3FmalZHK3g2UEJWUGJpU2dJ?=
 =?utf-8?B?WVNPYUpVYjdPVjdkZFRYazh3dkVlVjNFRVVEeVpBaFdoN0pRQysyNEFvUTRu?=
 =?utf-8?B?cjRSM1RSeTloNDN1dW5BclY4OUltWFBIVGdhSjM5RXR4Q2lRcG5SN3FCRWxy?=
 =?utf-8?Q?Ow70r8f1L7M=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66121e6f-6515-408e-87e8-08d9958dd41e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 18:57:43.3175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgg@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5207
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

On Thu, Oct 21, 2021 at 01:41:39PM +0200, Daniel Vetter wrote:
> On Wed, Oct 20, 2021 at 04:37:02PM -0300, Jason Gunthorpe wrote:
> > On Wed, Oct 20, 2021 at 08:41:24AM +0200, Christian König wrote:
> > 
> > > > I think the patch subject needs updating to reflect that we're disabling
> > > > PUD/PMDs completely.
> > > > With that fixed,
> > 
> > Everyone is OK with this?
> > 
> > drm/ttm: remove ttm_bo_vm_insert_huge()
> > 
> > The huge page functionality in TTM does not work safely because PUD and
> > PMD entries do not have a special bit.
> > 
> > get_user_pages_fast() considers any page that passed pmd_huge() as
> > usable:
> > 
> > 	if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> > 		     pmd_devmap(pmd))) {
> > 
> > And vmf_insert_pfn_pmd_prot() unconditionally sets
> > 
> > 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
> > 
> > eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
> > 
> > As such gup_huge_pmd() will try to deref a struct page:
> > 
> > 	head = try_grab_compound_head(pmd_page(orig), refs, flags);
> > 
> > and thus crash.
> > 
> > So, iomem cannot be installed using vmf_insert_pfn_pud/pmd_prot().
> > 
> > Thomas further notices that the drivers are not expecting the struct page
> > to be used by anything - in particular the refcount incr above will cause
> > them to malfunction. This means even the struct page memory cannot be
> > used.
> > 
> > Therefore everything about this is not able to fully work correctly
> > considering GUP_fast. Delete it entirely. It can return someday along with
> > a proper PMD/PUD_SPECIAL bit in the page table itself to gate GUP_fast.
> > 
> > Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
> > Reviewed-by: Christian König <christian.koenig@amd.com>
> > Reviewed-by: Thomas Hellström <thomas.helllstrom@linux.intel.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I think we also want cc: stable here.

Ok
 
> Do you plan to land this through some dedicated pull for -rc? I think that
> makes sense to highlight it, but I can also smash this into some
> drm-fixes.

I was hoping you'd take it? Do want a v3?

Thanksm
Jason
