Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF9E3C9EE7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 14:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3734D6E83B;
	Thu, 15 Jul 2021 12:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5B66E83A;
 Thu, 15 Jul 2021 12:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlM1qsWI4lWPUqjnbumRSnZLrKRJ8gNxg8k+/U8hgd+Das/1mUHWyEUVJybAcqdSQEm5OzmRcpRaPETpR3+Yahf6lczHh7I9J/Kepam1yCdVMkPmQA84FjjZG15AAem0f1CEzWbmYOuEnZ7zMxd2lYewwYZL6pACR7aWU8dyDH49rJQKSPhcav1OmAUcY5IAI+KL44cQEggEfVG5zPvtYz5W+HAd0vcbY3yqno3yvC++gZ2TrUv1QPHqVWM+w7XwS5Z8i1C9reHywiFiFhXnmuv+sxqF89SdVORBfToTNpwZyWkUAoE32wdQog766ZSqJK3hFfCatYNjsTOh98IMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu1RpNo/kBY8FpPu4eGtoIb9ookQwtc2BmAcag5KnDI=;
 b=Q0BoWHjIQdOtDeAF7rIKIXEwFZKLl9fbjuFN/+NBXcJnE5jrJu+sFUxvfYTxSjEYJQDS7XUP9G5PmcC84qvjXnqYwh3Vh62zmWS/zB8vueRIY4auSBUR3u1gYCSQc2dg+ZbhYAJwW6xMJSUR1JVHYQlhmK7H/shhQL2P6jjznVbrnVyHZvlf4owakt5JStQfXJ5ZkywSggKAvJtgvT5nNGI2eMJzKRalV69q0c1LhezsY2OSPkeO6fHY99wL5Y+WGuOZN7p+scphtbF3Xxw+NkHkwd9lkS8IkzVE2KOlJgN2yM6HnUblGij/y/fKVvlVyq0jBlZKUz86dzYtShyjpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iu1RpNo/kBY8FpPu4eGtoIb9ookQwtc2BmAcag5KnDI=;
 b=UY4iIJ08f+jxVPXQm+RsoOENHPKwjhGcRuRfEy1T4xgYz3ShD4P/eykUrt1L0kTqMecCGBmCyJeeHgM6u6Y4NrEitR9MRKOnvklemfB15AlZGHY3mD55yQdrK49Z1ucW+YxRWigkO34qhiZFq+qc2DPfw/Etp9mJUBKS2VdQZBqhuWlFY8XkxBMEZChNJIPfMXXMGFhehiMZifnlMBiXK21QvKzBGLJ/o1PBv4ok93PV7pyhmnyQqL3RPeXvxVk4vuYH+EOLX7znG8AK2EOguMGAaFnRJliYjKOS4pqtI0efYW5EHl09EtoKJciPT0CxEZV8n5SKatilnOaYCKFDbg==
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5221.namprd12.prod.outlook.com (2603:10b6:208:30b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Thu, 15 Jul
 2021 12:45:14 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.024; Thu, 15 Jul 2021
 12:45:13 +0000
Date: Thu, 15 Jul 2021 09:45:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH 02/13] vfio: Introduce a vfio_uninit_group_dev() API call
Message-ID: <20210715124511.GB543781@nvidia.com>
References: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <2-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <YO+wMbZ2TWscTynr@unreal>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YO+wMbZ2TWscTynr@unreal>
X-ClientProxiedBy: YTXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::21) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YTXPR0101CA0044.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 12:45:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m40jn-002es5-MX; Thu, 15 Jul 2021 09:45:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7552a5aa-ca26-4398-79d5-08d9478e63c2
X-MS-TrafficTypeDiagnostic: BL1PR12MB5221:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5221352DE17E96637194E331C2129@BL1PR12MB5221.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulhaEOcx0J51E4alw28h4KRIORXLOYcpzvQ8ujm1QqqOCUjRir5YalKOcf770vDbgUThyVS5E3KKfZGOYkbOE1LS6SZCBA/63AOySqrqpQE5/J4/4NdzMNlro4PxZ9SW6R7KBNPMszigJs3qIs0jGSlg8MV96mJe7AsjYUflf7dprLuGZfxxcheeA/jkTVeLxhVfzXhXoJH0AfjIGxJU8VTY1B1qx+3PiakRAlLRuU91sr8MHlFv97px9XYmxTmJPwI7a7ySEg+hsTIfQzPR4YuJDy2//3r3jBR63UnFQm4uFHxTEAfLtnjA9q/Od61TkUOYeQ8uTnN1LM7/nbN8cPS9hFdYq2zFoouc3p6x8ltJzlPqdgqJcHAHwADdSComihSWc9bUpAB11QLJlBouzp3IaRrz1KsliaVR+evr8BYo+fzxI79UDM1B7b448KYu40RR1LD0u9kH9gd9cndKeBIbhLOKoH5bQ5aeoQ65GNuEb83A7joV4wAA3htBvsol1MhSCE5luN5oAcH6yrDAJi0saQCKRhv/+gV/023rJp4UFHUrEiqGK2H3Hq/usA6taCg3i1Obb1eXS4AzChQRO8GMdpNPhKTKi6anT5JLlE3FF7LmUIspt4OtAzxCudopomRuMz0f8IMV3RfMWZS7AhDaLQSO3byMHcd2YPgCuGVPnOAg6adCF0a9t0xFul8rG8MEINyvvhpS+GG6FI48wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(6862004)(316002)(6636002)(86362001)(33656002)(478600001)(1076003)(83380400001)(26005)(38100700002)(426003)(4326008)(2906002)(2616005)(186003)(7416002)(66476007)(66556008)(54906003)(8936002)(66946007)(9786002)(9746002)(7406005)(37006003)(107886003)(5660300002)(8676002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/28M2k2SFHcZYWtVdwOtdrx15nb7zNN8rrH1Pn3n9pRpvwR2ONzrOJBmGUAt?=
 =?us-ascii?Q?/Hf77coE/pKAu1RdSGlG+ZrQy7LsO64M1bFWZWWQ2fYfwpnai8O43zzKbjjZ?=
 =?us-ascii?Q?45MAfGqPN1cQ7IslhmDoozyT4epY2ekxKLCRZqHpjl49nNlaC9m77xG1NZZj?=
 =?us-ascii?Q?aNrIgGm1gE7VgsRt4unfBfSnjTc8Hk48MAh5v3JU0UcLvlUmokJbQ6ABqs/D?=
 =?us-ascii?Q?ZsPqpRJY9voV7GGaXEBrz1DcrgSugloLC5AhApu56OFsQlRtKf8xxcw+a7nN?=
 =?us-ascii?Q?WR75mdLHoBarhUtzy5pTNTXxRztAArFWcgb4H7vGwayGFte4CbjKZETI9bD7?=
 =?us-ascii?Q?jjMTXzaTsxSInMtrJ4IUaCgiVpwp7Bs1gJg2o2UAiWPB0cm0O1Jq0zHzt/aA?=
 =?us-ascii?Q?hLIyA95GYF8NPYEyOfpGWpnnSAC3psABOm+guEABI0GK+xZMJg0m9buVqGBY?=
 =?us-ascii?Q?ztc66YFnENLmf5GXAOdX/CtuCS6fwYEUvgX38fc5ODP52UCGnYp95kMKL0Ec?=
 =?us-ascii?Q?Ofzxjjj6swCZNGqZODaw67FPYCygMfyfiPlFj71MyVBuGRFOFixCShUpki8M?=
 =?us-ascii?Q?Ko4K63FkMMpR4SMjouMVjHKpbTKtJmAxZGX9ZiaRKTrpahVZC4aJOb8QQ2/c?=
 =?us-ascii?Q?go+UA32q4AfUWYmFs3gxo4lre1q4S9sRZCTWgEIV1NRUbjzPzKJPf2jj9lWi?=
 =?us-ascii?Q?K0tkYvQsmAbaDMsPwqOs8M5ze31a99pHvT5oYPk7J7r/S7W2f9bFQlwhEVuO?=
 =?us-ascii?Q?viqpHvTuBkqTSe4tkP16e8Ak7Lrlb/AjoNnjvBI9iVQrsSqwq0iXI3we39jr?=
 =?us-ascii?Q?CuNRk+p+btC8RTn/+WKNexiryYiDt5WGASCXZ5BSwxoWtai9wgkSoKa/7xwi?=
 =?us-ascii?Q?X+u+RGGxQUANoTuC5UpYjMrL3E5UQUjxIHK3frtip84boGTi/RVBXbodTiI4?=
 =?us-ascii?Q?uHV7V8twKcke4u2Tj207ivsqCoM3BsPQxiefUADADJrHyDvNLkb1EvyOuD4q?=
 =?us-ascii?Q?7RxLAolrAHTqin44eHeqarD4G+5qLDYStQpsG5NJAM1mZ+dLhi4Fm3VhVQwl?=
 =?us-ascii?Q?p3oHOFI9juWcJwrrq6i0IQQgeOWTAPoy3apu4k6qQT1T9TwQYhR8OjY2Fmv8?=
 =?us-ascii?Q?L+CmXvG0uxfiC6JbQa0InGpARm8eBDwQxGFexjwt3z35HVx9pPDzCTExTc4N?=
 =?us-ascii?Q?nMjh/veCfPbhwDJK2+ihVTdHibwgeKJyHi/7+1qGAt3xJ3tZNMWV9WTtagdo?=
 =?us-ascii?Q?hyPnD8AMLV5YuQoc4RKMBJGepstY6Q8gBDgWajAuCMaKBkhMnGuEw7z2LHm7?=
 =?us-ascii?Q?fqyQTE8Y1QD9jiwFDkHNeijp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7552a5aa-ca26-4398-79d5-08d9478e63c2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 12:45:13.7718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FN0S1BR6hrVhA1n/9l8F7p5GWWW4hFkD8ckp585s+sq1cp3i5l0dtowMSHkP8G80
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5221
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
 Diana Craciun <diana.craciun@oss.nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 "Raj, Ashok" <ashok.raj@intel.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 06:49:05AM +0300, Leon Romanovsky wrote:
> On Wed, Jul 14, 2021 at 09:20:31PM -0300, Jason Gunthorpe wrote:
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
> <...>
> 
> > @@ -674,6 +675,7 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
> >  
> >  	dprc_remove_devices(mc_dev, NULL, 0);
> >  	vfio_fsl_uninit_device(vdev);
> > +	vfio_uninit_group_dev(&vdev->vdev);
> 
> This is wrong place, the _uninit_ should be after vfio_fsl_mc_reflck_put().

Well, maybe, but it doesn't matter, the uninit doesn't effect the
reflck and the next fsl patch deletes the line below. I can switch it
if there is a v2

> >  	vfio_fsl_mc_reflck_put(vdev->reflck);

Jason
