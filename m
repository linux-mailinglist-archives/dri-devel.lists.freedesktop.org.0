Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AAF621B2C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 18:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866A610E4E7;
	Tue,  8 Nov 2022 17:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B055A10E4E0;
 Tue,  8 Nov 2022 17:51:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elx04t+rXbHvbm3Q9PkfhZ2VQaY7+kELOybfJVQFN44h/ZjHBbKTYiZOR9Twttkk04yyI4vRyRzKKl/TetMgdyXoyJjp8z28sLsUFvQtB+lL+FasIuFr85lBO7eY8Vm0gOK5tQC3BjcEnty3nKdTq3iExx5LmzXUiGKzk8U2vW6rRGJZf9+J0+mTKC3OX6N6tj9kueZbkwElQM7hlRKCJysZJ/0mSfDAweK42qNaASJQrTYmqqrUxPYQpNS0XqLZN4kHANJcoBixsvlJyrKqRqGcxNH9RKOGnP8QLcKibGUZxBbmYmyV6B9jgks6Ihybbuvt9QVQwYCFC5g2oUwrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eup9rFMzKQfKJTvb9VmNsZopT1xUXV1ZjlUHUQaZL/Q=;
 b=EbVppb9/X1Onq/auQjrZOU2I3yMS5hvHfXvlU+iRx4+Cm0RYXkM4b+27IvqkH8qe7vZn+SvAFj0rjAqXH7XdV2IToX4zZUsShbpeMQ26sOmrosBxRKkiDoYGHQQETIJ1g6FftvWr4H0ZkITxjbhsgZqcuSCWrbZpDL6fz3N5g6bDxYM9yhsuxoFjzaDZcHonbxXc2Xb9WQwDUvdLPmVYTD5vNzYiKoyOmw8SA8EK2XISZKaUGPb1YCQmw1AmTZ5UBI32ihQanwDcpS/Ieu7lBY5l/yOdASI66ekluUOdnABAheD3iiOd5Nr9b6ps90FgO9JS63a1XAOot96N/dTLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eup9rFMzKQfKJTvb9VmNsZopT1xUXV1ZjlUHUQaZL/Q=;
 b=IKPeiBjFxPZ/9kyC+1hooirDCmXjrLqjDKtryb23KiDmvmw4i2WCmhN+V9qFc219tuaIzp9+r745f7Y2wJ6sPaAtMok6XDpqjGFaWVnsB6xek4RbhwART9HRvKnXVCBMT4hX7kvuJz0yJqiYrKBlcZfGql7G6jkcltGIuZgy+gfQNUuYQOk7LgUY+mYpUhFl350T30Oa6nttQ2ZRZ9Nl1dgvmERN9eDdXUdlzCSLnwt8sassDOwEWQR5Pk8a1kFuW6zcug4Ib2gcBNokelzrEaBTSMDnGlKtp9A5ZfxuU9+8SkOYeYtzjR6xgA9hCTJtk+WGQD9U3ZyUQXtYCXF7Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6788.namprd12.prod.outlook.com (2603:10b6:510:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 17:51:51 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 17:51:51 +0000
Date: Tue, 8 Nov 2022 13:51:49 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v2 07/11] vfio-iommufd: Support iommufd for physical VFIO
 devices
Message-ID: <Y2qXNcqXtAVkmXGN@nvidia.com>
References: <0-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <7-v2-65016290f146+33e-vfio_iommufd_jgg@nvidia.com>
 <Y2ny84qOFQhtYVPF@Asurada-Nvidia>
 <78d1994d-f6ac-7d1e-7d00-4a98c309bc5b@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78d1994d-f6ac-7d1e-7d00-4a98c309bc5b@intel.com>
X-ClientProxiedBy: MN2PR22CA0007.namprd22.prod.outlook.com
 (2603:10b6:208:238::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 812d566f-1430-4e67-e69c-08dac1b1ea33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 58wqHKSzYR1XwmhcdL2p8C16ZgeDX3w3RpilNRt9uEIfJ1DLqmAKy7FcdaJlTjJpWgq+PfSbif8hXhn41f6kt1J8iu6nZA2oR9Dx0pW+oLqjj44xB5JItQ+oU/7HptpDG1RGAOdIwUylAt0cT1hmhAere/fs82F0ofFpN9YioKsCAYUGzcdvUv/N7jACsW+KvEDVijW/x5YC6l9SYjPAJMQ9bVRSm/kqk5PgVvt8lzglGTCIH4DmidzBBt1TAwYmK44R86NiPyagu4jbml2cQDQCXEGwplYHdPBH0teEezASTRd8Kj2Woem48i+CBXoNb+RqBd+YzbLj8Vaek9GA4K2FzerUfVQQlhjvT1TjQxOoEz7vWQplNz+Ij+UE24R2oYEjXcER5YzXvGuTB2rSgXlRaWkF3EhoukBschrJxFXXm7RkqHsFPyMvl3PeJ2FKZC28QW6wHNq0Rk+OiGGrMEtYl2Inb2mJQ52+6ZrIJ+jARvnuhuEMeL08G0EJMd+2KDQaiA/SMd2WmmzVgX7P88tnPEfB/U+Z9MuDueYojkh0K9lLtYA3spe+m16+VsyyvQxeylUboaPqDr5xwC0b/s6AunqEnR19f8Q6+kxXTMLdlYphkoEGbU7uzIlHs5+ham9W8lBxxQG5jCFliCq1KaVMt0+NQjERyMDR6daDzRC4lXvql3N5Zvb4MHQYxKW8OqlrbU0fb5Cfnw1whHjVJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199015)(38100700002)(83380400001)(186003)(6512007)(26005)(5660300002)(2616005)(53546011)(8676002)(6506007)(7416002)(7406005)(2906002)(54906003)(6916009)(8936002)(6486002)(66946007)(478600001)(316002)(4326008)(41300700001)(66476007)(36756003)(66556008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Au6d6FCruT4ciygenZlTHEV+7fyoU/gXSFvhoXHm7AOsPR34TstMkzJVtoNt?=
 =?us-ascii?Q?7BLyvNlCfJs79HR38AE8AJ5M3RT8TgpG+jeIK6xSTrQweILcOQTSGU/PexE9?=
 =?us-ascii?Q?ojkj50ni4dJJkb2NUGcrvZmb7wC23Uq3LtFsHMOUNuE4XfI3Npc+XH1zFvyS?=
 =?us-ascii?Q?wTMtblKh33cgU91gQPg3BgqAAuw11MerWUTZOEWZZmC9bFKXbNuR/Hks2sm0?=
 =?us-ascii?Q?l3/+wk4ndiQPOWm5AvrxizPeXzNay9KflPjZArjaVIARQU9kdnargjujPcdq?=
 =?us-ascii?Q?hppAv6EY1zzF1FBrfXKGJqqpPoSDcTTy2UFwp3+f6PfHMUsAheCFrufXY9lG?=
 =?us-ascii?Q?tcXBXXYHKyRs4xS2pm28GKViceyesefNr62nMmlMT8L0KIAFiL+Q58jNhb6g?=
 =?us-ascii?Q?zmqhme2ASou1VMBpbZpxxnlnkhPD5fUVme7XFA8mi3Loc4/8W25HEDmbOvcs?=
 =?us-ascii?Q?jREVLQXec8I4+WaDrjfGoX2o6+sJXa8enJtH0ms5SJG8mkzqxxIzvzOvCQjw?=
 =?us-ascii?Q?YyITSUnA5Js8YyAZhawuXL4XAC3p+sZTav99iSp0I7N1DiagcsxarSFb/ycI?=
 =?us-ascii?Q?j+oEV0GIlC6n+isuwxJmlVwp/Yexj4QnSqrC7dagYyF/HO50wsz+hFe1/Kqy?=
 =?us-ascii?Q?wIDTg4+jVhRAe8oYvL2CcXlfNWJ3u2yiLsYjf6oYNRco/lU3pcYpemxRZ6Z/?=
 =?us-ascii?Q?XZJWkzvL/CV1FwH4eysPOmpTHDSRn86uIp25lmX3WdwhZNurh1V1xI72HBYj?=
 =?us-ascii?Q?ysRPYS522dyTmZ87yzRn9S+oF9zTLS5w9oeC8LZ/DiZCO1PjQMlS835X7FAa?=
 =?us-ascii?Q?NSCxlVrerZyakAqMzgrFzpLBxmv2T9WJCDCciWtCBoinTaf/sTx9SJRvllZE?=
 =?us-ascii?Q?ur57in3h+a3/BwUNyXOrYde5GQrDc3nXIdPfkviMpVYZDfUsdHGdC34ry6t/?=
 =?us-ascii?Q?/MiMNgtOhgBMeUnVJ6dJFswMOUYpdkYH8WA8uBBKEyZzTVbggwODoWfGYOpM?=
 =?us-ascii?Q?6nZl5csJTsGpqN/fT5U2KeJYKZWuKWI7CjLUR6MlcRtjiZbEe69EgL70HhDq?=
 =?us-ascii?Q?RlNGoYP7g5B4x1+FjK5nCXA5Y22ZWCyrrLDUAEhBWHXIJB3OwpFgU64KK97j?=
 =?us-ascii?Q?7KFFCkOUir8ldUv5ryG8zWNmnEOd1wcHHBSoHcIS4lf0hjj+F5SEEZKZIZ1X?=
 =?us-ascii?Q?bVpNSNzxzhBdIc3OZH65ELyQvDYqzUSN6cFG/r2+yfSQuoFhOKA3ZSVaECBv?=
 =?us-ascii?Q?kH06KBBmwYrfQptFUvTjrqCz7ZFhqTKUs/CMVZxDBcysw49L9hlnRbZ6izry?=
 =?us-ascii?Q?Zh+n95MfGA0L358UcSweH3NkcfBMlgmRYmtI5iKzStZV1V1pjjlJhJ/R/6N1?=
 =?us-ascii?Q?sro1PHelswXGeMT9qjTjamUy9ik6uR+udBJkJSYvIqGvLFpo7f9PB6Akc4Pc?=
 =?us-ascii?Q?pUQsNuVndqo9H3u785D9S3xUKbLfQep15IHIevcrmC3F6rwlAyLYmCcdSH+U?=
 =?us-ascii?Q?b+TToA4n5/6hzJFcieub0z6xbJUilO7ZF1byJCFPFWwsJafsmXQvFTXUE9d1?=
 =?us-ascii?Q?W8Nm8ieLDmFruhtPMac=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 812d566f-1430-4e67-e69c-08dac1b1ea33
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 17:51:51.1488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56I7kIBay8Elgs+yjXTb9ms586bnf20/CtBz5ETeLmG1jne4sNcieHL5M12ndthv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6788
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
Cc: kvm@vger.kernel.org, Kevin Tian <kevin.tian@intel.com>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 iommu@lists.linux.dev, Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 08, 2022 at 03:41:25PM +0800, Yi Liu wrote:
> On 2022/11/8 14:10, Nicolin Chen wrote:
> > On Mon, Nov 07, 2022 at 08:52:51PM -0400, Jason Gunthorpe wrote:
> > 
> > > @@ -795,6 +800,10 @@ static int vfio_device_first_open(struct vfio_device *device)
> > >   		ret = vfio_group_use_container(device->group);
> > >   		if (ret)
> > >   			goto err_module_put;
> > > +	} else if (device->group->iommufd) {
> > > +		ret = vfio_iommufd_bind(device, device->group->iommufd);
> > 
> > Here we check device->group->iommufd...
> > 
> > > +		if (ret)
> > > +			goto err_module_put;
> > >   	}
> > >   	device->kvm = device->group->kvm;
> > > @@ -812,6 +821,7 @@ static int vfio_device_first_open(struct vfio_device *device)
> > >   	device->kvm = NULL;
> > >   	if (device->group->container)
> > >   		vfio_group_unuse_container(device->group);
> > > +	vfio_iommufd_unbind(device);
> > 
> > ...yet, missing here, which could result in kernel oops.
> > 
> > Should probably add something similar:
> > +	if (device->group->iommufd)
> > +		vfio_iommufd_unbind(device);
> > 
> > Or should check !vdev->iommufd_device inside the ->unbind.
> 
> this check was in prior version, but removed in this version. any
> special reason? Jason?

Oooh, this makes more sense - Kevin pointed out the check was wrong:

> > +void vfio_iommufd_unbind(struct vfio_device *vdev)
> > +{
> > +	lockdep_assert_held(&vdev->dev_set->lock);
> > +
> > +	if (!vdev->iommufd_device)
> > +		return;

> there is no iommufd_device in the emulated path...

And he is right, so I dropped it. But really the check was just
misspelled, it was supposed to be "device->group->iommufd" because the
caller assumed it.

Still, I think the right way to fix it is to lift the check as we
don't touch group->iommufd in iommufd.c

Thanks,
Jason
