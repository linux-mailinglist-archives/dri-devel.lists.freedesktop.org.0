Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEC442ACB1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 20:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00C06E581;
	Tue, 12 Oct 2021 18:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87EF6E581;
 Tue, 12 Oct 2021 18:56:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY//MgDmY6OiVbKVbYIMRvQA252stJExzHSMw1/sYgM/19uaKb1q+ZA0jeQcBKfYVX8DcSc53OhqTycYwfpXfeT1Gw+iQMNU5ICnOVK/CF2exhnC31Hm3NXqD18Aax+5vcvgm4GW9Q3/MD2zy4b4eWx3aw8b/KiQW8EUy5zRpx1rHx+YCVxhwncpiFV0GyTNQy66/3hGJeWRIx3IYl5jPwiCXV+w6+mzPX32bn8Nu2KxMh+2Gw9HJ9h+C95f2Q3a3DN/wRBan+GpeMLbwk0ccEeM+gkzoHZx3AHPlmrypwS80DHKeEVx6NLW2bRrn1+dp0m7eiLkQSABz9gFN8Hpmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2HA22fOAybBiVz1DMZQOcmt3zumvXYNnBFx206maKQ=;
 b=Mc7qsCgAxcqeVk4Ct2AjzGHIOp9tI8Dqm42jsJB0eZILkkGO3etlrL1nBabNqnB7m21/r7A7GI+7TH0gAOstowqxxKf3Hle7LCCLV4+LNDCnTxanhXQKxVY5QIj98NAvO92GyctV5pxMFnxRENXD8eF4QmY5oHBFVabCz34uSGnCN7BwN1kJTTtWfwLhbkvRqkLi7Rj0HjrC1lSwgNAaJilhuBsdIYqvuq/p2jSECuFXcf2aC6NcdJJLYCeXfH9p9GM1N9jyglusFVEsVFlO/O1d+pMrSQEVMm4DT3lgy/i05z2aVi2M0k2QlyWxQ3Yn3hp+QLWMc6Q0eQh7DvRy8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2HA22fOAybBiVz1DMZQOcmt3zumvXYNnBFx206maKQ=;
 b=VgdLQCT2LqZx0wuxNwFZ0YD3febyvKZgBCJ5CDrjbG6mNX5D62q5+pN2eQxxfdZpXxBe2ACg0n4aQESn03NH9Zx0Y4gKuUllFg7BJZHJGnWPlbF5gJ16G5DU4K2ToWEkoAkEPQIwabU4EeTzn2p7rjeZPv17AGwVqDV/jCKD8f1eiaTmlceORehAe9MfDq/kVqFkUC8AG/5P1MBH+IFZ0Drbib2kER8YVodm4tLxLhZ50SyU7HbyEkCLUV9/ZTm5FhDdylGIloJszSMxlxoArXcHrONuWLi8hsgfaUDpoUfU5guNRV4F0MPORFvzPjLzD0CfzSI9CXrXHqtSmY7Wqw==
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5030.namprd12.prod.outlook.com (2603:10b6:208:313::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Tue, 12 Oct
 2021 18:56:31 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%6]) with mapi id 15.20.4608.014; Tue, 12 Oct 2021
 18:56:30 +0000
Date: Tue, 12 Oct 2021 15:56:29 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Sierra <alex.sierra@amd.com>, Felix.Kuehling@amd.com,
 linux-mm@kvack.org, rcampbell@nvidia.com,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 hch@lst.de, jglisse@redhat.com, apopple@nvidia.com
Subject: Re: [PATCH v1 00/12] MEMORY_DEVICE_COHERENT for CPU-accessible
 coherent device memory
Message-ID: <20211012185629.GZ2744544@nvidia.com>
References: <20211012171247.2861-1-alex.sierra@amd.com>
 <20211012113957.53f05928dd60f3686331fede@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012113957.53f05928dd60f3686331fede@linux-foundation.org>
X-ClientProxiedBy: MN2PR11CA0016.namprd11.prod.outlook.com
 (2603:10b6:208:23b::21) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR11CA0016.namprd11.prod.outlook.com (2603:10b6:208:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20 via Frontend
 Transport; Tue, 12 Oct 2021 18:56:30 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1maMwv-00EIxU-FE; Tue, 12 Oct 2021 15:56:29 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d818ce8e-e5a7-4c3a-c500-08d98db200cd
X-MS-TrafficTypeDiagnostic: BL1PR12MB5030:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB50304A5DD96E396BBB371754C2B69@BL1PR12MB5030.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0pD/Vw1Z/uVBIgO+BKRt6ffzbT5c8pzj61s9cfCpeRsZC89nujZXFAgGsvAgkgH8R8HQUQQPTUPNzrRFWA/kYUnNBecdOZ7xe0qL6U6Pb8aC/HQ4mCMNSZFHz7enqSyaPC/JXqlId1ucGSzLv93Kpv+XQg2AAUKHc5bliPiHNj+rV4Mho7PWYNy+UgPi5n4qFu+gqTxLp3MNu1No9/LZJp/nb2lIHLgnzeHW02YHxIwIDYMeECbr1nfz3l4jDq4oJyD2mIGlJ5jRMB4IuB+zjSEWWcwV6MUS9ItNfZO54cLtlwOwCRz8rq3aulFR/1wKNG0N4xyjCbsXBzXeGaruTxJDrPISZVSm4kkyNiGxaJpehyKGItGpXfZotp4IW5S4OTcNbOCQ75/Xc/08NYqaVbiGx35qm/pkrdzMfuyKuVqp98+VsUml7368nxst/1k98QG/c0tA1ObSqDe7BlMHIcLzEumz3ctdnEJRDy+ReX4pFwv67u79lwLL8f9orYsMXqA8qeZsUhaRXO+SLOgRsvaVr3qm3yBIqM0zhBfWW+X5hYAGiJ7uQTT9vmlaqQ7afWPPDGLRuD7sItZ6DKekpZ2w3q7FKwU9yVKuMvu3pmrVNZF1UqZ38T4lErEdDD+oozjoRidahEWNJuiDcCunaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(2616005)(2906002)(66574015)(1076003)(66946007)(107886003)(86362001)(8936002)(83380400001)(4326008)(66476007)(66556008)(38100700002)(316002)(9786002)(7416002)(426003)(26005)(33656002)(9746002)(36756003)(186003)(6916009)(5660300002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZwX9ciqG4i6oWSUACRd0NbclweFKv5fU5VMl8DT63Tf6JAdWHUm+MSAs9JH?=
 =?us-ascii?Q?MwUkzYSmKFZ9F3n41pdHpZjosN7BvIgtWwxuUQLWDsDmaDQr9IOSfimpAb1j?=
 =?us-ascii?Q?EJGICuTBlwAv3cu1i9I8gd/NNTHVSSeXMv3Q2QYXRhhkugc8B81tPpVcMIw3?=
 =?us-ascii?Q?Ncmb9xiRRjrz2aLitljbVBvVUxQVSFQ0RCIrAmgsbBFY+YvprNICyOJJgVZl?=
 =?us-ascii?Q?TuwJJ1CX2tqCg5OYULsZqah3sLWrZjgbGlPYi7j4CL7XIjzAyjiSqYiahpHK?=
 =?us-ascii?Q?P5JmxGtL2dO3GGq419O8XAaSapH3mCXkom2HEoWOCQfTmcx24njwlFthXRo3?=
 =?us-ascii?Q?hVVsIuITEm97JnhH1QMCHZe7urUyyyKaFP8QPgx0GQJ/E43bCxuEeEqfdyd7?=
 =?us-ascii?Q?pX+YnS2KTrZTOlVGrGMIKRyi6WYE98aqQUjSDX6NRmTC+aNnXlg10fdea91P?=
 =?us-ascii?Q?vKp0aFFv2KmLvLyZgaid5ElwIEgFV7uROtnxgUVdGnKuuoyQHitB8CXYf5TG?=
 =?us-ascii?Q?di+H8OXI6veE1Xg3AQJrT9Jtz4i4+/jbu43l6i7wv9pHwO9ZsHXdqyXGZLNx?=
 =?us-ascii?Q?HblyPzygHGi9i1pPfLBpxWjoisFZ+sHkWdrqd25t2epFkBJ5tgH5LFVwI0J6?=
 =?us-ascii?Q?EUJwrsqFYM5qI8aF6MXD1DKuOaicOTyG9ctideJgP4OSmPiktTvgH4Pt0o+D?=
 =?us-ascii?Q?osD8G5kVVL4adtM9FyTYjEDYhL+f7f7db0AWw99KhvY5yAtvMlaMzWG5J8Sw?=
 =?us-ascii?Q?ZZcGdW2hXUB5cX9iLLsV72arH1+GFJhONtkld62lYTwZqNaiJp3UwjQs8gbV?=
 =?us-ascii?Q?eGjBN0+IpbOjIQkok0Bcwf7+/swjOm/qz86jX8g1UywNQiA1e5bOinjJ1ikB?=
 =?us-ascii?Q?DtCkyA5b3bDJhrd0Ho5UqilSs+JuCBAr8K36LS7fES8vGdhNZjuFrzNEapZs?=
 =?us-ascii?Q?ObxsWrC3Jcu2pybzIdmd4CuXqgSVQs1AQhGr3x/ulXRoDjuZQrNvgHh4G6Eh?=
 =?us-ascii?Q?WZm27DprxL+LNY1CGmYTIKME6EYlIDVLT3ZyYLgAAz1AlL6UksJdlVJx3BW/?=
 =?us-ascii?Q?EkFMZ50WODDj8rzM5qiW26tNIvkPiJAXmpqrcA4EPdiBZa2cnr2yGkPHiXfB?=
 =?us-ascii?Q?Kr7npPFTC/HaFK+YA1NSeUnl01+ZaD4zTRnUDP6dyIVFfAObOg/+uzf+Tey8?=
 =?us-ascii?Q?jy0KtRwyK7j/UiThGD+fxrAfKBKnqrCVEh057O+WlWACo4O1zup9WBfvDsZi?=
 =?us-ascii?Q?BCyw1jdQyly6WRkiqOA3W+xuy4ry6QNsRBhm2B0+71oWVRk2IJtymq1i14z3?=
 =?us-ascii?Q?xnh/71GOZZWlmAulQ6w7WpM+dCREuAw6OTspt69NIzBUNg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d818ce8e-e5a7-4c3a-c500-08d98db200cd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 18:56:30.8797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOG43RYjvGhpxW5PCLUX8/dB5tj/DK0RKj+npKZR5dAUxe+kUIr9pKzbEHzi78ra
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5030
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

On Tue, Oct 12, 2021 at 11:39:57AM -0700, Andrew Morton wrote:
> On Tue, 12 Oct 2021 12:12:35 -0500 Alex Sierra <alex.sierra@amd.com> wrote:
> 
> > This patch series introduces MEMORY_DEVICE_COHERENT, a type of memory
> > owned by a device that can be mapped into CPU page tables like
> > MEMORY_DEVICE_GENERIC and can also be migrated like MEMORY_DEVICE_PRIVATE.
> > With MEMORY_DEVICE_COHERENT, we isolate the new memory type from other
> > subsystems as far as possible, though there are some small changes to
> > other subsystems such as filesystem DAX, to handle the new memory type
> > appropriately.
> > 
> > We use ZONE_DEVICE for this instead of NUMA so that the amdgpu
> > allocator can manage it without conflicting with core mm for non-unified
> > memory use cases.
> > 
> > How it works: The system BIOS advertises the GPU device memory (aka VRAM)
> > as SPM (special purpose memory) in the UEFI system address map.
> > The amdgpu driver registers the memory with devmap as
> > MEMORY_DEVICE_COHERENT using devm_memremap_pages.
> > 
> > The initial user for this hardware page migration capability will be
> > the Frontier supercomputer project.
> 
> To what other uses will this infrastructure be put?
> 
> Because I must ask: if this feature is for one single computer which
> presumably has a custom kernel, why add it to mainline Linux?

Well, it certainly isn't just "one single computer". Overall I know of
about, hmm, ~10 *datacenters* worth of installations that are using
similar technology underpinnings.

"Frontier" is the code name for a specific installation but as the
technology is proven out there will be many copies made of that same
approach.

The previous program "Summit" was done with NVIDIA GPUs and PowerPC
CPUs and also included a very similar capability. I think this is a
good sign that this coherently attached accelerator will continue to
be a theme in computing going foward. IIRC this was done using out of
tree kernel patches and NUMA localities.

Specifically with CXL now being standardized and on a path to ubiquity
I think we will see an explosion in deployments of coherently attached
accelerator memory. This is the high end trickling down to wider
usage.

I strongly think many CXL accelerators are going to want to manage
their on-accelerator memory in this way as it makes universal sense to
want to carefully manage memory access locality to optimize for
performance.

Jason
