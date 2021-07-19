Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB0C3CD488
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 14:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEE06E125;
	Mon, 19 Jul 2021 12:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 577B46E141;
 Mon, 19 Jul 2021 12:17:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yb1tkqwzyWJvM6fV1SLDcsfzlBdD3J6RUTiSorGOB/4H0EzD5qjHAq0q486FOns8ygaJ6cmfHTeSJadWo2YR32zyFY/kiI4G/tjxXD4IVkyYdFsktTM3PTAPSDhmenN6ZgJFmSXE8p5820NxrVl8FKn4TmsQqqVUxASPAZoEMYMPPWnbEcQuCNvONojF+JVZ41y3y5QMgHW4wfyenwk8Ya5EpcGmu0Uez6ZDqRVW1CEintbXuv8fwzN9xwn/tdpifReIEBAHZmloiUvL1LUgeo9A3uqtlLYNyVq4IP8FalcF/nIMnblSsxbuFMjZ9Wzyr9Iv/tps7InQdE8f0ODNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Er6h1P4BRntWXmKNpRsCtmjD3qBOzKa8IZbD3A9EC7k=;
 b=iPGrkh8alL4QPhS8/lHRPIepmmvV51frMnifDh0vrbBoKow7SAcJzMV0Z56bZe26KO6Os4T7Mzb44hCnt8k6qgZkPG6lHNJMGj/ktmNDQEUmoLx66Br24cmf6v0s0V+F1t7fa4MDwBaiGfSanBHygLQxzHNgSCWT9LGO+C0OyuBcndnHFHZr//m4BCgxxiJWvaXHcKG34eBBWcmayII224pxLwrZxkpyCABIIqIIyJE2CKt5NWwylgRAbgrcSTUeRZ8K7FrIYq50/EQmkXl1uytojpZgw4fIEXh7j70Cjs1quhhnhTPBbWfKb7OGZQM2gv1/IQ1YiHqbCZSWueWhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Er6h1P4BRntWXmKNpRsCtmjD3qBOzKa8IZbD3A9EC7k=;
 b=gREkG0ediQCpYxT6Q4pJDiNNiX2uj2pjuqg1cg6NM9llJSYlhv2g0rnU+TYpPHzZInKeeSJI40vI9n5HDsGK2YbSExD27/gsQyaiD4l0hL6ygUQHiEGn11z4aspl2Gu1JNkuvn8SgCgNru7Zgv7UVtDLdAmzn21WX706VP/gUzZPln5hicSbAhUU34wcP0SgBjGT0CKJzXpu9s5Wq4onCTfJO2mu43xL/VCjwEjlzwNR2AtrlakOquBLOTG+R+IzQvggwSnX18szz4G3m7BgmCSSCgEJrqaItpG55hikK0/lROE/8OGvvszYX75XPBQS4udcBb7tetH/3i3FllS6ew==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 12:17:32 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 12:17:32 +0000
Date: Mon, 19 Jul 2021 09:17:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 02/13] vfio: Introduce a vfio_uninit_group_dev() API call
Message-ID: <20210719121730.GP543781@nvidia.com>
References: <2-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <8735sabj0l.fsf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735sabj0l.fsf@redhat.com>
X-ClientProxiedBy: BL1PR13CA0090.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0090.namprd13.prod.outlook.com (2603:10b6:208:2b8::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.11 via Frontend
 Transport; Mon, 19 Jul 2021 12:17:31 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5SDC-004Oww-Po; Mon, 19 Jul 2021 09:17:30 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1826334-edac-42c9-cc23-08d94aaf2ee8
X-MS-TrafficTypeDiagnostic: BL1PR12MB5192:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5192FA9FB1996E6EFBC1D113C2E19@BL1PR12MB5192.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vfbphvBZgEDojfh2ZkX8FHGy6XIIK7qN+q7RzAIoUGTtspXwl94qaHLgq8QaefAwDVf+lISsioD01zB70a2xPLQezeiIsaLLsUlbRQnt8YvRgh7GGMsb+Y8lU+YAvj7mOTgsLFI4xSVU4Zfv/CzDnpZpu1Gp7xSPoeFwdAPmZ0hkSVuV+KZ5p0osEln7c53kBkNmUgfmcQe70t6juWhRCxzah/FPxq+C8s5SToZbSenkenDzMzh/JHMrurGuEg25EklUmpVbEVYQzHP+yDOunT9uNPoYxaCn508xyPDtLqJhSV7SLDZN7mNTTPZzhgp8T/+4AArZYHDsKVZMq8+JZPYBz2bViqsOwy7QD4BMtJ4D9QeLlgNNogC7eMzT4aYaMYIJXTJ5+wsNDqn9eS3KNWFYcG31FVP+QM/j8FL6BQYV1ZOIhJGxM9pgCD1tTrsqXVoFO03BBFu/5+7Xrs0knNu/opmaCVnUpukk5krbZu6OQeXGSw/Q1HmeY0IWDivln24XsR1Bg7eA/tDEcQPb6MUbS6jv3IjKptDHSbq6/GoF30SnHG6eMNilvVDVKCXcNeWnCVztt7YyG+sICywNjPHmn/nyLfvrXHYMhGvD5lnKCIgPlhIMbVbvr4FeAmdCtkio7E2E7DpWsxJT6lQfX6zipKvFOBmtCB5N8kpvtTJsPD0QIB0GUndy6Sp5NjoIUDPWlUQUAll/9unUeFI+0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(8936002)(1076003)(36756003)(8676002)(5660300002)(107886003)(2616005)(66946007)(66476007)(66556008)(6916009)(38100700002)(426003)(83380400001)(26005)(4326008)(86362001)(7416002)(478600001)(7406005)(186003)(2906002)(316002)(33656002)(9786002)(9746002)(54906003)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ms0XHKCDVxPO8H+Ic4dR39XdggPfVQ/017drGafk33L3jQb1cIF8M27XKFOa?=
 =?us-ascii?Q?19I3NZL5fBC47vsX+0zNCXE4EF18Zcj10pu1GCkV/14DgKno2pO/PhJnsQVC?=
 =?us-ascii?Q?vNRKWanTKh4sN4WvvjMMbHKXwtCLgVNfdnftqEbKujzLrgrzjU3NRC0hccZa?=
 =?us-ascii?Q?7GXSc7QIRyEc1PKSJZYh2xoU5CN6R1okCtjlyufG7euq3anqLJYUKRZZuIA7?=
 =?us-ascii?Q?6I3JiJ9pCnhqUM/rLduV4CkjX+QYcEkjii7tQQABggG1jGTnjwWeqIdZt59S?=
 =?us-ascii?Q?bErA8iF6/1NXzZpsVV7oGFJdtuzY7NV//i0nXPRB34h330wiuommWJdpFo+l?=
 =?us-ascii?Q?n263PrN6vaGKs43nfSiYZvQhFTsAhZ5nqgQNeJ/RCZUKDaatETDkQvAVa+wr?=
 =?us-ascii?Q?q8tr6tA0lXHtrXrqw5py2bGReCIhSNQ/6tuIuSPLHGZzvnghV5o3HMRnVYMi?=
 =?us-ascii?Q?DdUkieq00K2ubB4ZcKWVtZDgRWbI5XTaKfNMf9kltlvPxGg/TZzvr6az2tjz?=
 =?us-ascii?Q?SxmC8++VRzyUUMyWBCp5xuG2YAdmH/RHBZ7ZFrf4iq7oWTVYGrry2gn2JBlW?=
 =?us-ascii?Q?BUrBDS94i9YEracIMvv3RZwxw4oj5CFV3DJ6Yu1WQfwgyoM8oG9Ej0p6cdga?=
 =?us-ascii?Q?lNlC+gfiolMYOJaiYVR/4Uu2wKKX1NL4MaHnofdpf0vWrjCjeMvtNzevPMLG?=
 =?us-ascii?Q?oWFb+AxjA5o1SF2R9SNtZSkv+YdGzv2HAstcjD6koGCblNz6+jbqYG95Mpt1?=
 =?us-ascii?Q?rMlRV4bEADeu8T6WTrDaHfSnfjkj3xMwg2XLmbPMoQWYe5ZcZ0wcmDoeC+tt?=
 =?us-ascii?Q?XMrKMJmDsPWI0zjlmBbbckKqZDlmekDyB6uN3qRGvakTFWONoO2zfE5wpxaY?=
 =?us-ascii?Q?lyogP7cFI9Bk5DgjJNW80K2F3h2vbGIX7yhTTalyQRL1AXoPtn5vz11HvT65?=
 =?us-ascii?Q?KfCV0PzhNxnfkBiZ6SUiz3CAz1SadrpUEkzyP/CgttVAhXOZitPTsdGDf+eO?=
 =?us-ascii?Q?VekwEr7K/ZX474McMbGgbTK+HAtVL7/CnY//WdcUgMtp4XAxEjF4YvCEsRXg?=
 =?us-ascii?Q?p/VGZ9D3thd675NxJk4GdllfOzNh7QN8JmFXj5twmPIEeaPXQy97otOug32D?=
 =?us-ascii?Q?ByALN/0NfNOMU/yIz7VOAL4BS2+Rf4Nk5A5K9Bv7MRll6dAC1l8mzc0nN9it?=
 =?us-ascii?Q?6DzwbkPKOhF3fE6xpsXqQfb5Nh7dy1ZDCwkCMgrDNvF4N6L6fyPjbjyw4F/S?=
 =?us-ascii?Q?qf+JuOC3b5zX6XXd2YcZAzoM0Pde1SR1DCjyu1pvkpc/UIEv2l5rNQJjBeRP?=
 =?us-ascii?Q?T3AMMOA/UUIuwSvTVOh7PmAB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1826334-edac-42c9-cc23-08d94aaf2ee8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 12:17:31.9642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmIlKk61YhN4HKQgvc5WLZmHlIRWY0GmZ1jNcrEJckSypuh5l0ovqvW4v6sBtLgB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 19, 2021 at 02:11:38PM +0200, Cornelia Huck wrote:
> On Wed, Jul 14 2021, Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > From: Max Gurtovoy <mgurtovoy@nvidia.com>
> >
> > This pairs with vfio_init_group_dev() and allows undoing any state that is
> > stored in the vfio_device unrelated to registration. Add appropriately
> > placed calls to all the drivers.
> >
> > The following patch will use this to add pre-registration state for the
> > device set.
> >
> > Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >  Documentation/driver-api/vfio.rst            |  4 ++-
> >  drivers/vfio/fsl-mc/vfio_fsl_mc.c            |  6 +++--
> >  drivers/vfio/mdev/vfio_mdev.c                | 13 +++++++---
> >  drivers/vfio/pci/vfio_pci.c                  |  6 +++--
> >  drivers/vfio/platform/vfio_platform_common.c |  7 +++--
> >  drivers/vfio/vfio.c                          |  5 ++++
> >  include/linux/vfio.h                         |  1 +
> >  samples/vfio-mdev/mbochs.c                   |  2 ++
> >  samples/vfio-mdev/mdpy.c                     | 25 ++++++++++--------
> >  samples/vfio-mdev/mtty.c                     | 27 ++++++++++++--------
> >  10 files changed, 64 insertions(+), 32 deletions(-)
> 
> (...)
> 
> > diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> > index e81b875b4d87b4..cf264d0bf11053 100644
> > +++ b/samples/vfio-mdev/mbochs.c
> > @@ -558,6 +558,7 @@ static int mbochs_probe(struct mdev_device *mdev)
> >  	return 0;
> >  
> >  err_mem:
> > +	vfio_uninit_group_dev(&mdev_state->vdev);
> >  	kfree(mdev_state->vconfig);
> >  	kfree(mdev_state);
> >  	return ret;

Doesn't this leak pages? Sigh.

> > @@ -571,6 +572,7 @@ static void mbochs_remove(struct mdev_device *mdev)
> >  	vfio_unregister_group_dev(&mdev_state->vdev);
> >  	kfree(mdev_state->pages);
> >  	kfree(mdev_state->vconfig);
> > +	vfio_uninit_group_dev(&mdev_state->vdev);
> 
> Does the location of the uninit vs the kfree matter? Even if not, it
> might be good to keep it consistent.

It does not, but I will reorder it anyhow

Jason
