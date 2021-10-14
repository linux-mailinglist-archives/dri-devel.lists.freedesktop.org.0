Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D3F42DF1A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 18:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8817B6E194;
	Thu, 14 Oct 2021 16:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C59A6E194;
 Thu, 14 Oct 2021 16:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1mGgsNpnn14K8trujlHhUw1bgwGEfBD3bV793NQu56Fpq4XCKSca9XBc0VYazJ+nCxNEo9v+8ndvfNi7TvTXoLCB9t73984KF78Mn1G9rHKIyIFYN6wRlNkAshs+F3um2goYemGW/2MWgkY4UXPDWyMnONMGOoF4vr2omc2k+7F6a64yiMZxo+SnMmPEMjK86GVohNfsFWEe8SA3wZd85ElvDF9utHGmNlOTQlPZFQaZTD6nNkIap0Sk5PZyCvUSNnNsijjB/j2H4EdLeZmvFtKIIVdXQ8T8gO6wH5eWP51E3gjSeU37pVrx+dekixxylWXptDB4hy0p4Yv8jsbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJLeD1hbsiaKJPaIesdymL3FVDDH06thiwOygGVYJFU=;
 b=Y/fHQDI6WDZgSHK/B1lrlEk21kcbOGH37MdhOP6M+sG5ovVnl9EP3cf6UKrPz8E1mzoKNGeW56kqn4wvUXaJnICTq8U0CDH1i7xLtSruIktYDWLnQj3D77X+z5LjI+W5dC7nHI314RUQZOtJLIRncFAMYhczkbWoYof2O7tzJVWsUaYu2NQTfHUCPCmcZo+1UaAF4eBgMzMR1Yl4mbOo+fs53JTbgGTaB9Pqi9VFgbFpklGO4sJ/Gajwbsq1wR7nBTJp003FYqTe5VItzJJR8ntyz2WWMBo2P8IdU329l2ajoDe9SoloDyjHoWN05J+l7qWvZfCILotiGsWcMHL6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJLeD1hbsiaKJPaIesdymL3FVDDH06thiwOygGVYJFU=;
 b=RmBomT02tsb6GPgW9vHAhezCUXfnGfP6/5XsOsdeenfHLbhmwClkXIUMjJxdl3jWRO6zUHOU+cereHSwVMMR4OFbwrV5fk2neLWWl0YciNHGiFciC1DIFeSC4+9C5TzpObfphoeOa77g96kQYQWr4i+MBp2o3JKILZiIc8UIN8MsurizNoadsn50oFaMeEOwinLJkw/e2aS4jKuHx0pf4kSKVqz4HkaaDxcRZidROPifaX+PonTg01AxnOsENnV/qriABOJZzy45IrMLEAPmikUQIF1c/8+rYpOvG6nxYhemMtHugRq0y0IP4B6XFtsTZ0JRxSFjwBo/nyVeXj2E+g==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5205.namprd12.prod.outlook.com (2603:10b6:208:308::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 16:25:07 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%6]) with mapi id 15.20.4608.017; Thu, 14 Oct 2021
 16:25:07 +0000
Date: Thu, 14 Oct 2021 13:25:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Sierra <alex.sierra@amd.com>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@lst.de, jglisse@redhat.com,
 apopple@nvidia.com, willy@infradead.org
Subject: Re: [PATCH v1 1/2] ext4/xfs: add page refcount helper
Message-ID: <20211014162506.GU2744544@nvidia.com>
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-2-alex.sierra@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014153928.16805-2-alex.sierra@amd.com>
X-ClientProxiedBy: MN2PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:208:e8::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR20CA0022.namprd20.prod.outlook.com (2603:10b6:208:e8::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Thu, 14 Oct 2021 16:25:07 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mb3XW-00EyXB-AR; Thu, 14 Oct 2021 13:25:06 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77c38229-15fd-4275-c224-08d98f2f2f96
X-MS-TrafficTypeDiagnostic: BL1PR12MB5205:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5205E22E9485A7CC42EE68E7C2B89@BL1PR12MB5205.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: evhYeFSvxsL5MGiv2yxR+JYtbUuMYMHwLV0Lj9VOI9vW0Ji2RiZ84yCBw7DyABP04axDPQv4b4G6ThumMadJBkXoPivdLBWRkwDXPdH53enfp5COxM8B2vVxIXktK+EW1Q3OkmysZUSTLwpn14B2EDRq9zxwTMiZP/oKq4nHNKe5Hh4hQsJEUch7/J6NaqUHqUZziNm28wyYeKg3dGkhGwVyEeBjjJ+D2UfvDrkRKI+P2kv6BmPIw0+OGN38vKrI+HOlcFHNW9tm83Sy6CBMHI3/5NwB/0D+EJ74uEKqrPMIfRdo+orC9A8POkQe5xNMiLNZYPtGzDlcRk6iBiIUHFX8W+K4bbqHEWhdSB37PXFity8XN4sClklS5XUuEA39oxqLEq/Nj6VsDKjhvNe7F3Z4pi+hPJ3rU36EEqTY5uCc7cc0z8xmty0WKW3et2gRdGO0nyToBxrCihQQHbTkYpFjtMo0e0b/wQ+WDsuLKdxgSszwrrCnq8xJgN3ld8fqyraC2XLSZmLxs6THgVPvacEBfCgYx3daF6J81jNF7vSDe+CWJVI4ME07qP+s/wsnEze/8+OqMllhXokHVttiIqPrYcTrHxmvQVGnJEJkcuo4nLbP7dNggK3USbC363KZbXYiLoEA7F4GSdrHF6/yiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(6916009)(4744005)(9746002)(66946007)(186003)(66476007)(8676002)(9786002)(8936002)(36756003)(2906002)(66556008)(26005)(38100700002)(4326008)(426003)(1076003)(316002)(508600001)(33656002)(2616005)(7416002)(5660300002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mxBqb3KMnRnsZrkEh6dJagidpVJeFEAVHuIapxuWNmYZI1hyH+jtKFPegrIe?=
 =?us-ascii?Q?TLHK4QA0NV5kozF7YJCTt5DcbDysQpY7mlviHtqjiJk2DoOumAbWIpGfQ/wI?=
 =?us-ascii?Q?ybV/Le+u/eG01b3O/QY671bw1bCf/+mHTF1WU/B/fLnzk85mRW/r9JyZRJ7N?=
 =?us-ascii?Q?sTfmFk8yK+nDRd2Shn4dGukX4bmxhyyF8DQb1yjfRm7YGL6haNraafoVobFO?=
 =?us-ascii?Q?qSorZ8IMUuOt4ZLFJHmr01fKiY2NCN+LV5SyD8AgHmX9bIJ5nOR7S1aH8fbr?=
 =?us-ascii?Q?hNKpVxcnruTF23q0sIpCELu/00kfsJ6ge0sk4omiEJLwpHhGyKZ2qcwsNXXa?=
 =?us-ascii?Q?2s5BKrZb6M3plj7L1tOO1uq7KizXVBeLkbG/tNcQqKtXd1AiXxgcOQs9D1Py?=
 =?us-ascii?Q?w/Yt6eI/n75pJr7/2Sd7wle0NvqmZIw2Pwwwz6XQptH5krb/WhIhelLgst03?=
 =?us-ascii?Q?20bIq/TKrBxcwaCjKpYgJGiKidIhBXAExSWbcJ3lddZ8we7MVeKcA4eGNJok?=
 =?us-ascii?Q?JyVM6t0m46cZB/E9LUlx3khbDA+tKwGpw/FLTSGw5OZtHXT/RDZgKjk6rJO4?=
 =?us-ascii?Q?AtTRP98G0IQBbyegm2I3qxyiqVW/+QBalH42uP02h/1ywjWYLiU/glCUa6Pz?=
 =?us-ascii?Q?xHBnDogABk05K5/UsO6XpEQ2sD/r+l6D6CotZjmtj7wwdzCVlEVXvmLHG6us?=
 =?us-ascii?Q?NIU3sevaJjEKe1PN6Vkk9zR16wku79bnbLGlas44RcSiMKxVzKxor18gWqua?=
 =?us-ascii?Q?eFqyvMU2zpMhD1Fkosbl5pHwHRyYw3IKkmH5k15XoNDiJ+o8sHFKEarYXq0a?=
 =?us-ascii?Q?vN9CFh2T3Jl2/HxhODsTxt47gdvuoZhqJoPeDRKkcBMo+Ey6zaKboEEMSMr7?=
 =?us-ascii?Q?EkWTRnv9pXh075q03Iu6zPPHHlMlEJSFHUUESKumtB56jn9eODlHGcGaDP+u?=
 =?us-ascii?Q?y20fUSNSpERxY3aaYrF5r+1HQjbwXDkCJNwrJUHdv824Q7Wu5VEWN7//QBSY?=
 =?us-ascii?Q?f1vi9Xq3TfWYK5sanhXYVI9o2TPCgiIhpNUWFXrph3NIZIP3k/hW4obaoOST?=
 =?us-ascii?Q?gS/QCHmUhyTwYXLDLvpufHOKw0H1mTj297nJsi+ED+JJPhMYW9cfe8llwXVN?=
 =?us-ascii?Q?g5MagxzcQN0fKzp/iL5vFxjIGlk+Kfvn2eS7e7TPX6zf+Llz99UujhJYTmbR?=
 =?us-ascii?Q?cVih7JoXKm0PGp1IWYOXW7vYJVpU+0svvBzc8CPzlPz9CrsU8HJn6Qy2hHRq?=
 =?us-ascii?Q?2NeWxTDKxSN6o+S0PuXe58BA6Ai3PS/xrChD+QI2rrdxEmtekV7+PCIMVLNM?=
 =?us-ascii?Q?pSmVXIal5oMJei7H0PHA5uWqIXfI4OniVNSS7T+ugkM4hg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c38229-15fd-4275-c224-08d98f2f2f96
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 16:25:07.5773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtABwBXax3fvVGe6cod0pBj/pxXGSmiQJtAQPtGM/GEgVLYvaotca2aGvdL5+V+5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5205
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

On Thu, Oct 14, 2021 at 10:39:27AM -0500, Alex Sierra wrote:
> From: Ralph Campbell <rcampbell@nvidia.com>
> 
> There are several places where ZONE_DEVICE struct pages assume a reference
> count == 1 means the page is idle and free. Instead of open coding this,
> add a helper function to hide this detail.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Theodore Ts'o <tytso@mit.edu>
> Acked-by: Darrick J. Wong <djwong@kernel.org>
> ---
> v3:
> [AS]: rename dax_layout_is_idle_page func to dax_page_unused
> 
> v4:
> [AS]: This ref count functionality was missing on fuse/dax.c.
> ---
>  fs/dax.c            |  4 ++--
>  fs/ext4/inode.c     |  5 +----
>  fs/fuse/dax.c       |  4 +---
>  fs/xfs/xfs_file.c   |  4 +---
>  include/linux/dax.h | 10 ++++++++++
>  5 files changed, 15 insertions(+), 12 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
