Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AACE41944E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 14:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2331689D60;
	Mon, 27 Sep 2021 12:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A43F89D60;
 Mon, 27 Sep 2021 12:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sw/EJf6u79Y3NZkFEko7XC0cejMqOhV1rUtXOLLXQnvsXvJtZNdjaTOOtooCOOlH6p4OAFEQrdVA/WsaCD/q05foh0kLth4y1EXQsF1s506YHV8SuI5N+evhBVtXhjJ/GG6lK6gH99B64NXdwf6KwTM41xH8n0wpymah6BG7WH6xgXAavPVw+JY0nuLcQfTHSHCbBBaFzwEK2duA2rMLy0sYZO4YBPRGrnld79lrqr5aXlHjr3TwlVVcIhVZTMQDczF7LHrO3rjakAO0clNqSKcufP+EuUJsE9c1VnmihyMyAFe0ZPRsy61L2xI+VHlHyxAObbOXX8qBJ4h+H9TvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VPuYeARoLAGaWd4B+MYD+Kvz4eTB/ENysfGucY3TCD4=;
 b=T91cYUKB9KqRWYib6TxzWcpb772d4X2/Glyt3MYG/aSiD55Zq47Z3DQuRnpIcMcWRvIA3uCNc4FQ45B2aFxWQoxZNYhGO87D+xq6AFP4Fha54nQql7chF4+vtj+7h+GusKGyIXkL9HvxUkMozwGynOnzCS+ywecpCtcJMQ6WOAxQbTVKzu/ZOfzthZdH1lOSG5IymbAK1ztClibk6+RVn5pWPOyx5t2+7AbMxRvzxN9aebdRmLHOtnQBT71FzaeHzO8aIYe39wwHtvzfIhH0dr/LuGGRRgTOOkxtI0y4FGREWCoEIFFdba5kX3Zuvn9ttj3vZR8NxtTnUjYNXKG6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPuYeARoLAGaWd4B+MYD+Kvz4eTB/ENysfGucY3TCD4=;
 b=BkClbsX0vEsW3fkr3jKCcR8QtDTrEgp3aRlX0S3q63HusQQ6nM2KpERgH7DTseKW5plR0weVhA2LwK2JoxMVK2wm0hp8GikPvVFVelm5wPb+cvX9sEI3PoTnxaVUgUo6OgyAvdJJZNevcxwNDoQE/g7U8f7aCeqX42yqOsTbgtm4reKkxEy6ejsgqtC/xG+yvjXhiQosaCpC9kWXCO2ZlwYrFn9DViLJ2OlioEGWItcddnRyRS95uqu5kV9zXVNh92YZkpJ5lb89e8UDW7LKG32ZWS+68K4JP0LtJAK0CtpQtKQ2dl8y9KJW2AltP5RLiJcYaN3b9qcHlBaUhV3q0w==
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5361.namprd12.prod.outlook.com (2603:10b6:208:31f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Mon, 27 Sep
 2021 12:32:55 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 12:32:55 +0000
Date: Mon, 27 Sep 2021 09:32:53 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 7/9] vfio/ccw: Remove private->mdev
Message-ID: <20210927123253.GY964074@nvidia.com>
References: <7-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <f887a563e688057d6759e6de65d480326f502331.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f887a563e688057d6759e6de65d480326f502331.camel@linux.ibm.com>
X-ClientProxiedBy: MN2PR11CA0003.namprd11.prod.outlook.com
 (2603:10b6:208:23b::8) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR11CA0003.namprd11.prod.outlook.com (2603:10b6:208:23b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 12:32:55 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mUpoU-006JoX-0b; Mon, 27 Sep 2021 09:32:54 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b6b6dde-8c8a-4eef-b973-08d981b2ee35
X-MS-TrafficTypeDiagnostic: BL1PR12MB5361:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53614B30E68D92FBF33E4CE5C2A79@BL1PR12MB5361.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KGy/ruVUqPkAAZpRe/xrxVhchw6SNIgpS2N/GImST8+2+mG0OY5HxFSwiZ9C8U4bDj7P8Di6Vz6UW0e454NMujv/L6bRyKC8TO0t35b02ttzaVVL5vi1cIrKzt1jk/10KdowjqoPpfkq1ee2YjBOTUOvB8dCO1SwXGyUtG0texd2S+Rsn0Ab2NPyPHbhlG28MygIGS/tj4GAq3bcOgkuvow/97K35JrbMtHE3jNowFUyPimfJndtLjGU6ZP0AzRdQaCePraOQZvk7886emgPvubXbOitBypWasu4FpJWQP8UCU65f9A/dxQlLsB5s3PuduZ6pYP1O3uMhJlCPr0gG2qDGBKDxlvsD0GENjDLblh14r3aMgHPWAUCs0MbRSvvkUPhfewTPzVeN8mjWj+3kPNm7WWLYmEjvk0TBB7F4ObHrGlPa/HakMCq+mEQBYo0vbP+onvOVRPRkazyThevRcq7PIwbNYy/3MlTzBmzELVDHon5nFFFcVjaWWh4o3f/HnpvPbg3dEXUEfviPJv5WumgwQDQiUp86KToYAnmsrGjweOI+1Mh42ugd+vRhxJGcWx/KswLERK2T9xyHdEmO8UiW/Src42cebIWeXjvi498T6v2cyJdisIwmRqekPT/aQ5hTJWh28TGCcxZz9eSgDL/9E/2Vvowjxilhe8PShlzmdXVl0ixLGvtnalTwtv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(186003)(36756003)(316002)(66946007)(38100700002)(508600001)(6916009)(1076003)(86362001)(54906003)(26005)(83380400001)(7416002)(4326008)(426003)(8936002)(8676002)(66556008)(66476007)(9746002)(9786002)(2616005)(2906002)(33656002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xQBg7oaA/nsKBs7gEs9o5HnJTNwGmm/BinACDNN6SRiL/soxyzD6fnuTyDlj?=
 =?us-ascii?Q?9dS+7mfH8oc8ySu2a61x7H5/1/eMBmzGn7ZQpjWMiv5KZJKeEbp5YslF3lRO?=
 =?us-ascii?Q?DYJB3Z/TGMTXL5CbmVb73a/+szVKQZuOi9a2uTLMNx8LQeeXdgHDkBSGylhr?=
 =?us-ascii?Q?BHzG1cRTmR7A6qd6e9eYdyocBhSUW6j52WbTE3IJJixd48ZqMKBQAtPwuBFt?=
 =?us-ascii?Q?uigGuMCAq0jpaM0tTmjeEUtVbUDPRcr/zehKeFqxGraToqfEysIaLMQ+Dr4W?=
 =?us-ascii?Q?7j/ZnSjZC8r0OjaMCo25Ao200FBf79mpUMuPzFLXaTWP1Zg0rKNZ0jXe/CMD?=
 =?us-ascii?Q?YX2nJybakCjNXfRkaSVMrl4cyorU7vQYnOQOwC+lqBffhdphd187VjUVzqNm?=
 =?us-ascii?Q?bgEoOFI/5imb9rwXDI/G4bVYY52xyAFr1QvJ2xSm+tv2UHMS/mzRd6Xs1tiA?=
 =?us-ascii?Q?W2DNl6rVN2BAVxLrFAOQ/hAZfehVflZovFDaV1vyEM6buETcglCTXfG2pLWA?=
 =?us-ascii?Q?VLY2bE0akElQkZSDbwiz2Xmv3O6M336E9tTTPcRvOvgdwALcNPm71Bbno3a+?=
 =?us-ascii?Q?KbCvY7eUzrvB7cZsNlTKw5qmBbxxGeM0wCyrlSn8tktkAUy6R0I6CmP8Lx0G?=
 =?us-ascii?Q?1VvEE1QSsRvKlqP/pH61l7y9Jo3qDdO4lsR0C/lRPqcPYDXDpuBxFv9nmTqB?=
 =?us-ascii?Q?vEsEagVKMNguf69292xaOp7TrzxCQhZUZhSKnkVP6gFWSUUhatusV6w+UQEw?=
 =?us-ascii?Q?nDbLzjjgWAIwRl085hBVUrAWjppR5lHkdraJMdL8optzZnu97v5q3xYsiuam?=
 =?us-ascii?Q?LiIVyTQvBPkfqchfpmI29+BMvwiQe0MQjaB84HbIZhugfKBaJCyH1W/f6njR?=
 =?us-ascii?Q?vKip9Z/wxRubwGG5Mft6pFgtQUHVb3ZzWsBrQxn6+vtVysmTvC855WcrPLFF?=
 =?us-ascii?Q?MZzHwNbuJbDd5o9oez93Wy50kQdRG2pe61TaLIKNqalPwRQctKDJQGRmndeY?=
 =?us-ascii?Q?O84X92Vwhtfbi8WY2wjmTdqkkR7VIR+aezfsoXACNpRltfRUvnJlu26aw71/?=
 =?us-ascii?Q?60x4DqsolAkCvr8HenFhkvkroOvYSFSIYbhlQMOoPap44CbhBPIDkGBmbeaO?=
 =?us-ascii?Q?ku3iXOl9AkmJ+YGMWcx+ZMgHihvSzmMt4RzTQ5ov2/w27Ogqhx854NnfYxOA?=
 =?us-ascii?Q?YPPFnuW29fgJaBXGCvrlrClUdtlErO9KUbxH0ODLtioOBks8wxMggreFpYEU?=
 =?us-ascii?Q?Hwx+ov0hJuovAg5lw/D3zLxvleQ+I3f8vo0MRkjAxOoIcrxAQJQHR+uwo/0R?=
 =?us-ascii?Q?ne0DyyCSWcgmVwp18eepiiaG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6b6dde-8c8a-4eef-b973-08d981b2ee35
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 12:32:55.3521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEeJX/HROIopexUY6vjR/7c6DnFMfI3fGNwjxjVO6pw5IG1+KnwHnKXmm05A78dJ
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

On Fri, Sep 24, 2021 at 04:45:02PM -0400, Eric Farman wrote:
> On Thu, 2021-09-09 at 16:38 -0300, Jason Gunthorpe wrote:
> > Having a mdev pointer floating about in addition to a struct
> > vfio_device
> > is confusing. It is only used for three things:
> > 
> > - Getting the mdev 'struct device *' - this is the same as
> >      private->vdev.dev
> > 
> > - Printing the uuid of the mdev in logging. The uuid is also the
> > dev_name
> >   of the mdev so this is the same string as
> >      dev_name(private->vdev.dev)
> > 
> > - A weird attempt to fence the vfio_ccw_sch_io_todo() work. This work
> > is
> >   only queued during states IDLE/PROCESSING/PENDING and flushed when
> >   entering CLOSED. Thus the work already cannot run when the mdev is
> > NULL.
> >   Remove it.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >  drivers/s390/cio/vfio_ccw_drv.c     |  6 ++--
> >  drivers/s390/cio/vfio_ccw_fsm.c     | 48 +++++++++++++------------
> >  drivers/s390/cio/vfio_ccw_ops.c     | 16 ++++------
> >  drivers/s390/cio/vfio_ccw_private.h |  2 --
> >  include/linux/mdev.h                |  4 ---
> >  5 files changed, 30 insertions(+), 46 deletions(-)
> 
> I like this patch. Unfortunately it depends on the removal of a hunk in
> patch 4, which sets the FSM state to different values based on whether
> private->mdev is NULL or not, so can't go on its own. Need to spend
> more time thinking about that patch.

The FSM patch is important, really what is happening is the FSM logic
takes on the roles that was being split all over the place with other
logic, like this mdev stuff. To make that work we need a FSM that
makes sense..

Jason
