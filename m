Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3994C443252
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC69C730C2;
	Tue,  2 Nov 2021 16:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C312730C2;
 Tue,  2 Nov 2021 16:06:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5EAQsyox9yNU+/nudMzwijqxNjuG59edF0xsV0Qs+G8/sCK2ipmaxVm1nB8086T99e17mVU3rogmVWoRxtLBK7iRHXLlQbyh4LfJvle63nl+EcIbsS9IBBgcpR+uVL8qCcJjyGKcavjU221L/8pEPJeufIoIKiLkYUUw8jAlTOzbccvc9p3w5gWfdXd8sTartTsOXVz0gkdlKhfc4H0SYN/gkTW3m3WAKvmSLnxWHYl63+iE2tce+4DPzaupAfArbYsR3lY+ESMxqHdD5YvU3BebgHOooTxvmO0W3DFh28l2wEKCj8tAyw6tdnriET59pCmw2iC2lfGKozi4KrEKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pgBO4Mk7FBWV+KuPZXQzYVs444QXwAxkB2OsR8ZHAo=;
 b=ejgXQcQTgb1To085n65XHDLrwi3InWILLpruxz3od18/KvMoAgcllmrzCgY8nLfJ0bek1RoF4sce0lM8jOyLscmkqjpuJ/KbRD+kj7pdUH7Eh5apEsJD/224azzPhjwwgS4i9r9x1jX+0Tb4VXzHaKmLEFOjwj+WWNZlrfoDXDlgnnC4YTLEBh/CJO7vDlOzDKekTMdR2aqzc8XwX7htWwVHoWWBq0ZQHAh8d5rFAhJPf7RPhYrYa+14ZC70mZmL8kIFR/JiTCJxZ/7Z7FInTZN5VhAI3H9/VfVi20qf2Ty1l90zLuXtNPU+A8iV6Ikc7dzr4gAEWjjOjal/p71QLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pgBO4Mk7FBWV+KuPZXQzYVs444QXwAxkB2OsR8ZHAo=;
 b=kfuTHc2/F6en1fp5sIsjrvzOGICufTdMNt0vs4KzYvR9suplzyj/AWH4rBsCaD3KlzPOLWKx4cxMbCxWj/VOgY7r1F1zdbJ6MaZLxkyIgzKAIbRX9DZyZyHfvNKHUZ01GlwATJI6sJEe+edq1vBUGPHDP/SUJePMprvO9DJxT+EJ6Pq15860W5V0jIU9s1LxHlyKOBSr/Eyq8JviiHGvN2GFtxOnzolExcvJmFBBFMpxVD8rJmSceeKNWc4RggBnGb0zWkrz0tjOqu/imB8xL2g+JfPLwXDRRLMPSEm0oFS4K8521R1pWRx/cJsOcU4t6Yfhak24WYVQfnonKTkdGQ==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5554.namprd12.prod.outlook.com (2603:10b6:208:1cd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 16:06:06 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:06:06 +0000
Date: Tue, 2 Nov 2021 13:06:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/29] drm/i915/gvt: merge struct kvmgt_guest_info into
 strut intel_vgpu
Message-ID: <20211102160605.GQ2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-12-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-12-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0369.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::14) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0369.namprd13.prod.outlook.com (2603:10b6:208:2c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.5 via Frontend
 Transport; Tue, 2 Nov 2021 16:06:06 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwIX-005AKU-F6; Tue, 02 Nov 2021 13:06:05 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68eb9477-601f-43c3-99ef-08d99e1aad3b
X-MS-TrafficTypeDiagnostic: BL0PR12MB5554:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5554D4B2A3EE6A040D33F105C28B9@BL0PR12MB5554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SU5unFIfSuUxXA4jR/WjaBh5TJRxjUMRmvWD7jZpquxi7jffs9tA4e8P212lkoNIFGRr4xj/3WIEpmTQgDSg2uIyWYirZCfePHPiyr1vaqOF7ryS0vm2jeBnmPt7VwV9Jj9Dqya5/ccmiE4Ye/8xsavmMTr02un1+UQHBHE8nmSIeuKRQhU6Z7xALaIYZdyb1jlbvC+gBYbFEwS2ss6rVYBhlxBcgH4HhRppsYf//Gyd0JJ9Fq/xhFfb8gfhjPgvzMhX30Leb3eFjdQCdp1/2P/pcm7g+rLaK/1YiD8nD7A+dD468xY9ybnGnVpNtRCPW2wWojNXkhtNmwxJ1w9okr7t2rd7AxfWOWg+FVm/BRPTMXVlk4jJArEirZJGZFlfsIQETGiy7rsqrZDE8kfQ/zC3E7IRydfiZMjCHRTYdMYUA2kHa+MEd+sIUJ3bJmk4I+8uWrPojcCc4qA9+1dO/CmoxqDuxDluo+4zHUdO1p1v4dzMFELfIBd/qTJbSDMJnqRncJhG+fgLWIdTWxhKdG2+qU+vX9ANrLHbijhzasCEHomZpQG5ng1600r6siHM6goqlPcAhasdnnYXPQChVhW4Ftaw4g5b1wUExhFO5Doe0sw8fdgAYbTIIfXkoLDChJGzRY6cb6A5hD1PML3vyg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(33656002)(426003)(8676002)(8936002)(86362001)(66556008)(9786002)(66476007)(508600001)(2616005)(38100700002)(26005)(54906003)(83380400001)(2906002)(1076003)(9746002)(6916009)(4326008)(4744005)(7416002)(316002)(186003)(5660300002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?49H5KzACDXrLLI6X7Bin1hSpbd330nwgEX1b6/4jzrA8iBD1bzsaQFaPnMmY?=
 =?us-ascii?Q?qUTYm9WrgW3cP8YnrIAlzaoPOJYnf4e+N8paZMc7tezzPnStS4RcqPZH2q3T?=
 =?us-ascii?Q?rEOjYzuyBRccE9TV6DlwqHCrEYFeCiD/jiSC1nQqUa6pvPVGT+rcHVtJVSv/?=
 =?us-ascii?Q?fG+tt3dHDjBamnd6RrFjA5xMOev25Tak7n0X4q+sZ5if8kl5UbZDfxDF0Bd3?=
 =?us-ascii?Q?ypZl7+dVeowwE+XsyVUpsU3SjrsAqLfDVObx+V7JRqbz1detZxlaWhPvR0+U?=
 =?us-ascii?Q?iDd/pQ+rNzT8jpTvdKmXE0XjONCvVKs3BRHo5g/2YvzQ6t8N4BQFwk0S4SiU?=
 =?us-ascii?Q?F2glYFVCIT2nWtJOBtdPWCOrVX0VwTQX8VrFKUfRj+/SnPMQ/5H4Yxw8/TaZ?=
 =?us-ascii?Q?bpie9t3DxtcZwUm0JhcjdDLDmArhU/vFCBGrvZI1uOREbuweBzvO7C7XYPwp?=
 =?us-ascii?Q?3/3OFuCx8YJppOpe3stlAkREV/J7HlhO/HoOW9/WBKByu4X2jgPnAaddPwHp?=
 =?us-ascii?Q?AOVtQzoEOFNAidn9ChplWo+OlaHpb9CY3WptePYTVnpwQ3TlYChN7gLLIAGu?=
 =?us-ascii?Q?3VTQqWAxxGvqHe9wn6QRWWz8Avy6qxnMz8tFNPHLrp0ivLtorIc6pTRvaKBl?=
 =?us-ascii?Q?/B7GvFqv56plCqIEPYYkO19OBDyjU6Xsa49DoLhIW81QSGkbX+VifdvzLDZx?=
 =?us-ascii?Q?gWKQ9pHOgw3IWLJaTZOOXtIz7e0GOm5TN9GfYF+HLEIO9c5jSlrq2+jXRCkY?=
 =?us-ascii?Q?kENlolOfgJEHAbxfbyVYr6fttH9Vtj4WgZR04wyMvmD35WAuP0WZcuoGabtn?=
 =?us-ascii?Q?kfwv/X0y3k8yJY7PEWCIFSVNyoCmOBhY2wlzvna1Tj+UFsA2MZ5wb1j8xC9x?=
 =?us-ascii?Q?yF98WOXIJsAv7FyLLJ/o3HTgbHH6+9q6ivp+EA+wSgpkFh/5Fcg72psKYzxq?=
 =?us-ascii?Q?kZG9QQx3mPzaRdZvuoTszgMkQdAqEl2gqh1CrwnJQYgxeIgkRFUaMXlDIpCF?=
 =?us-ascii?Q?zmaZYiCIFWS1aCUC+auvIyMt00nVshmuyUUKjTovFPF+PwiHaQoZ59Y4WM9l?=
 =?us-ascii?Q?o3Hux85iqXtPFEjOULdfsYDyRlPHcAKGiCVHUiGKWE65CgD/gkgS8ARV2o1B?=
 =?us-ascii?Q?a2mWZOT6bLRa42eS5QZbdDigvE2fXygNpXe3NrnSzD3IhkVwQUJ+CduF4Df2?=
 =?us-ascii?Q?TOWvmYZm9eYdp/I4HwtD3LD0abys3E4RDFyjQgsR7Zr/OkGFYG5aU9i8Yowr?=
 =?us-ascii?Q?8zeMRUPWlCDr8xxxrb6P+SWNy08o7GzygO5XaE8bO5fW294IwXf/AYTT0ZNF?=
 =?us-ascii?Q?5nUrFLYlAnC8aA5bdEkIZIonvklH4sUO3iGSB0ySMoQciUUCC/s8QZTAQkHL?=
 =?us-ascii?Q?JLdkqGy8X4TNk9YCrOV9aSunOLIxvgzFANm/7s9rOyx/5GbtBrkTCNoMqrmL?=
 =?us-ascii?Q?fsJ0sDqhbY1GuF6HdHzvHMCNJzMDRs6WKgkCyeb9OhZE2XUfcuotFIhahHmh?=
 =?us-ascii?Q?iKhewfcaGAo4D2ztcu04Sy7IF5Gq65Q3kWxwNxzrzhtxYJS/pJqkWZ4AJwc4?=
 =?us-ascii?Q?iTxgNoCyI+AyyF7rjmk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68eb9477-601f-43c3-99ef-08d99e1aad3b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:06:06.4200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /P8kb4GCBfz0aUcavgPcaYhzeGvrtCFQb7ihUF4vGEb97Mcrcm669FUe79LNgv3J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5554
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 08:05:43AM +0100, Christoph Hellwig wrote:
> Consolidate the per-VGPU structures into a single one.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h   |   8 +++
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 117 ++++++++++++-------------------
>  2 files changed, 52 insertions(+), 73 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
