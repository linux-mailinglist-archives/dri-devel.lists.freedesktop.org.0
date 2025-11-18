Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A5C6B818
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 20:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3316310E2D6;
	Tue, 18 Nov 2025 19:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A4S04qHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012026.outbound.protection.outlook.com
 [40.107.200.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E9110E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 19:58:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMBYwdwjKJEp0RvEZBrV9Qxuk4pqxxmgACmicTmtAou19CgCdMhNdwkC4gsPEnZICOy2bWZLf8U4hibv/x68jX1vE9BDWxa+WSyLk6B49cUzcwV/JChmIhwCyOeBNFd89HM9Spbh8XPcRkELhB5EKOIbDC5sg+6Vl6IGl8LYX5sR9b/lwvxZAUUwhili/kUp/CXXyEEbwz5GWWs62ROrJKuY7MTGIDQmJskrJyytwvQxx2GyBjlnnWFrFaxHkfMpDEewoe5KGEySyZ7Invnk8juUkwQdusoObh5tNkA3mZjZbnVjI59EjV+nByNNsJb73n92VqOsbtZG2Neoh9ll7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CT108Gw3qLpIQdrxKXVSBfyCXJ7xtoHnPnJYFfspKDg=;
 b=yRZ2MBl8SBxaKBtJcStw7cizrk86romEklhhgF9JuEF43IL25Gje8uBrAf9UkHl6B+c7V3+tLY/32Ql6dvaQ3EjxYUYUYGSEVWLares+dNn4Vapj9jK9h6h9qP7fqfLM0uBYpwII0vbJ9K2+5gxQHIQg7jW6lBD5kxM8EtmlpFMI/ie5UkfNsjUcEfKzwpL2C0Z3wDll3MCf23qd4WFMYncTsrzOL1VZ6Rikgy/A2ifbDATx+pdiazLWwAJlhpbu/4r3Gc6erufzcrJ1XkWZngdwcCypJz30c3LXQzcqP3J1ZPU6jw5UzCNvDEQmPgXg8dKSBIM3AI8mg6okpmUYvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CT108Gw3qLpIQdrxKXVSBfyCXJ7xtoHnPnJYFfspKDg=;
 b=A4S04qHuLIPkvW7b7OFziAJ21wycPjsMGsy5GuGf5ufgvkUstBFigmcZXlBzGj1qEPlsOKADtS+VzHUS61MibCa1hkIY3TY0LvKPlPxPopuRGhDK/wNq4JvAyMa26r1UUevTshJTvRHVmoqKbl551ZKEFBYZX7MJG8upyCz7baXiFDRY9d4DE9ZItIdrP40bYjP7yMVPhSqddZXbhh/yN8lqMY9bONyYefxOA9X0ZikihQZj37YGISaU9R5nWV7OBBYuNKFlWmbxLd70dHL50TmjlYOEt43J+HGKcOjOygskqanlWf4OyKv0FMvcUiQDThKWJpLW3wiokjOgdRfJHg==
Received: from SJ0PR13CA0165.namprd13.prod.outlook.com (2603:10b6:a03:2c7::20)
 by CY8PR12MB7338.namprd12.prod.outlook.com (2603:10b6:930:52::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 19:58:09 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::80) by SJ0PR13CA0165.outlook.office365.com
 (2603:10b6:a03:2c7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 19:58:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 19:58:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 11:57:47 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 18 Nov 2025 11:57:47 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 11:57:46 -0800
Date: Tue, 18 Nov 2025 11:57:44 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Alex Williamson <alex@shazbot.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
 <iommu@lists.linux.dev>, Joerg Roedel <joro@8bytes.org>, Kevin Tian
 <kevin.tian@intel.com>, <kvm@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kselftest@vger.kernel.org>,
 <linux-media@vger.kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Shuah
 Khan" <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon
 <will@kernel.org>, Krishnakant Jaju <kjaju@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Matt Ochs <mochs@nvidia.com>, <patches@lists.linux.dev>,
 Simona Vetter <simona.vetter@ffwll.ch>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH 8/9] iommufd: Accept a DMABUF through IOMMU_IOAS_MAP_FILE
Message-ID: <aRzPuJB36jTZf4Cg@Asurada-Nvidia>
References: <0-v1-af84a3ab44f5+f68-iommufd_buf_jgg@nvidia.com>
 <8-v1-af84a3ab44f5+f68-iommufd_buf_jgg@nvidia.com>
 <aRZyNaLxrwSKKMXG@Asurada-Nvidia>
 <20251118194401.GB120075@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251118194401.GB120075@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|CY8PR12MB7338:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e244a8-a934-46be-85d3-08de26dccc16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WyYF3khiUiKAMhTRHeHBQrJ/OYoyy3aqJH4VV1/IA6ubf1Y1wrL54bJg2R3F?=
 =?us-ascii?Q?adxarI36IlJAY50JAiUIQi+e5JWB/2sJvzuleLMDk0P6dvSe9iJDOXMWOG0d?=
 =?us-ascii?Q?WmT1hjJD+M+NQj4OyfTLPGwI3slD50R7FRofb4+7iHPMastFgdBV60EtK45a?=
 =?us-ascii?Q?qG13n+9GGxQIE0gOgvXc59MMPW8gCm2jp7Y63q0DvHvlXTDG0U+nQRXMqpdM?=
 =?us-ascii?Q?j7HAY6cEqvv0u7i/iUVBy627KV39jPO/0Tme+LgQCXkQgFqJUr+lVkgbfnHM?=
 =?us-ascii?Q?szDpVw9Zy4Gk7Yv2zsHuwZPGv6vQwAK+oI5hEnLD/8HPTe0H10ZuHu0Vd/f0?=
 =?us-ascii?Q?lW6mNhGd/7+r9Ft8STC61nPLMtUG5TahbaFjjBTqv8WqU44/5dQ50ynZCz2e?=
 =?us-ascii?Q?/zxtZT5TBTiO+TB6mss+zznRc0B8DWFMWdNwnkJCPJb2QsOBJkexaZ+X+xRB?=
 =?us-ascii?Q?tOqwChFAzYJpeP3D5rAOwdovW4DaJXtRr484fbbAUTIom3OKwWBX0W/QD9Ii?=
 =?us-ascii?Q?3xM7Nh1L5rmPa3jgNyF9qQXZmx3jZWI9yt7Nu1Z8Nxr1ntsfl7IoSpaFCMh9?=
 =?us-ascii?Q?JfS5AIOruWMgz4HesnhThWQUBy5wzut1eeG+5K9tR7SlgGFjShaU0fmCGUM8?=
 =?us-ascii?Q?LEmQ6cKzF7Umtud8RkoQHEzL9CavG5/k+dwo7IvuHqJc4XjSmg561Hfrdkjx?=
 =?us-ascii?Q?cJdv8DMbxaPXZHEsEJxBcJZp59GCeXPXHHIBsUIKt8uUFy1K5SLeNriQHs/s?=
 =?us-ascii?Q?mE3V+fL7/AnG4/iyxeCctCLOL1aoxJ58XzH2/gaDwRQ3ZMOURgZssyZ8LLaG?=
 =?us-ascii?Q?QPO8y4w3Y9AaqBf/jdlctnkdkAUXbfRjax/uxgsBTzp8cP+ZCOiSdIonfxqz?=
 =?us-ascii?Q?nBTRD7NzDUMqIG9+lkyEV2xHTl3A4W5bjSWg1Si2iu7loQOj3NSShrWJ1CMj?=
 =?us-ascii?Q?HYcImnRektJ/FqbPXHbutaFyaLs4BDjZP8zFAO3GZ69U3bVH4xuhC29TpuhX?=
 =?us-ascii?Q?fCRCAkEFPvQJRgXphiqa8vK92fMIj4W53UXCLN67BjxPW3KNx92NbxEJN2VP?=
 =?us-ascii?Q?8wFq1EKUom3NIOE+e5hd9+Z/yajaO8tAtozZW7+wCpAanQQL/kfxyG1QxBw9?=
 =?us-ascii?Q?nD8vKO5123KHzAr0vY6Q4G4C5mtZZIwsaVfYoVvx3YGWgLb12uNKpL1sAE9x?=
 =?us-ascii?Q?RIvGnsNlE/lXVZ8L0UZFoimoim0U9vhA2g/MyltAb5rNFi0bkignmUYIjwq3?=
 =?us-ascii?Q?077AW8lVZwZv52/6+Do8l3Avb7MjuBS9LwXTEsJWxt3OV4wK90AmK3vJn3L/?=
 =?us-ascii?Q?3O+9ASshE8AV8NntNrMqgXpYif/i324oPfqtQs6CcL3aUik0MjtnbioG7Oy5?=
 =?us-ascii?Q?bpSq9ECxxce7wWK+p/pD5peClrR2QQjP1w6hslQXd474lGFzrRzwEG/X+Rg/?=
 =?us-ascii?Q?4TBWlAdUIr1/JiJGrMMtXZghgBQTBTECZ6LUkq5iMMSNQuDeBLhJ9qCpC+HE?=
 =?us-ascii?Q?JjZHaxh3FcwIswiE0xgfRAEG1tktpk/GWuTViaIHj03LTM91jaPqWlqesH8u?=
 =?us-ascii?Q?VPtTdUJrtOUnCTl5uVg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:58:09.1002 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e244a8-a934-46be-85d3-08de26dccc16
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7338
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

On Tue, Nov 18, 2025 at 03:44:01PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 13, 2025 at 04:05:09PM -0800, Nicolin Chen wrote:
> > > -struct iopt_pages *iopt_alloc_file_pages(struct file *file, unsigned long start,
> > > +struct iopt_pages *iopt_alloc_file_pages(struct file *file,
> > > +					 unsigned long start_byte,
> > > +					 unsigned long start,
> > >  					 unsigned long length, bool writable);
> > 
> > Passing in start_byte looks like a cleanup to me, aligning with
> > what iopt_map_common() has.
> 
> > Since we are doing this cleanup, maybe we could follow the same
> > sequence: xxx, start, length, start_byte, writable?
> 
> ??
> 
> static int iopt_map_common(struct iommufd_ctx *ictx, struct io_pagetable *iopt,
> 			   struct iopt_pages *pages, unsigned long *iova,
> 			   unsigned long length, unsigned long start_byte,
> 			   int iommu_prot, unsigned int flags)
> 
> Not the same arguments, we don't pass start and start_byte there?

I found that iopt_map_common() has a "start_byte" following the
"length". So, wondering if it'd be cleaner to do the same.

But, yes, they are slightly different. Let's keep it as-is then.

Thanks
Nicolin
