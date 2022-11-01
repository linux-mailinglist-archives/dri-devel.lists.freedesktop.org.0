Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76414614B18
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59510E3A5;
	Tue,  1 Nov 2022 12:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60A110E06D;
 Tue,  1 Nov 2022 12:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZqSGYzF/ZaGG2nx30vZlKMOCIexVQ/iHWNbGP/+f+aEi5+FURJ5tYX9RMmxwIhIy8s4VU18MCuJ00DEmBU+jdzrsxOSEBsaICEMuwAM+tHY0yFhBNec83ZeRG9eUZuTNNnIpAKyPbf38GgS51Z+3Nm0xVu9yKoWGZGWFJpqoHW+WML1cZ4XIB+thMQLUJDkb4kxNk0tELQX4HsrTL0CmIms8tmHehwKHHj7R/J9+lvh7txGgQirUUzEYkfYUXOJqngntCIZyn3O/B+H0SLjaZXQ9Mq5K8qOisgE8sQhtuLb6tJeV6MLrahODwGbo5WoZFUTuuquSF2TvpPqOW9IXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f2dri1+x2XJZ4FI56mGO2gjXBj7bT4eDOQlY877CYQ=;
 b=dStLXQ4a9LNSboLgxaITWGEy9ZpjfoTiM3mlL9oS/bVPJ4PttQbMRH8mFtdRL4i36xU0rzNH/rrBuXTjH2RoHwljCdiy1G/LVyZGzIpz7ZQjXGp0hd1E+JDvo1EnbV9ZewClWlAolP2ivrGKNb7NSjHvychf4hhgLQjZ7NgDL9SOmpu96JgqaLS5xnmQUuoaAmF3GlZk09FuJvwKclJNX2TolpGZxx+enQ+7auoKdyGn0Rc9smB33LmAQyho4iga7iXEiXTHtA+1RjbPImsc/zgxtfiFTJ/KhoNl4hE6as2cEiT6pMAADp7gXfPsxrhGSDPDSquNPqvgprLfg6WRaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f2dri1+x2XJZ4FI56mGO2gjXBj7bT4eDOQlY877CYQ=;
 b=tPENcrPaxejR8xiEEoAti/2YVHYxoqnQRA5Tu/anWONtwZ9571dWBFhFZdjmQEbeXM+gINPLInK7BnAhR2EBD43upRy3fNQFB3uqILAaRVpnC1vm/zkrCZVnbRixWRQEwFLWVo+8ZslthvMiuocakK/c107mLPxRE6FZPQXcVoZnRUvCM4PREznIfKWPktJYNSjnX9gykPRhMwt/48g1ROG19rHnGQ3hNhzSWeN717SDA3oGI96PWZxKtTlGe/bochPxUuceG/6CKWgPvvJ5d7FwqOgsFu5VWGEmUYWfLsVPOhwndOuaxU7Uptod6qMlsyEtb9lOykAhqhQIlWKP5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Tue, 1 Nov
 2022 12:49:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 12:49:23 +0000
Date: Tue, 1 Nov 2022 09:49:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 08/10] vfio-iommufd: Support iommufd for emulated VFIO
 devices
Message-ID: <Y2EV0e1KcJMuEgH9@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <8-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB5276B6ACAE7E511770887BF38C369@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276B6ACAE7E511770887BF38C369@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: YT1PR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c93eee0-ded1-45d2-e35d-08dabc07806a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkUwkTuGnps27G+UAA735lgB5IsW6FK2smnNlo9kIvV3bF8U4BPTDHrqNCOMw+J4YBIR76JbdQS/lMN7q7yZf9EcPB8Q0jClCgeLVeNJFrcDGYjL39SGqgIrmWPp0Ff4Ld8IPYpbiGqqXUt3N3T4Z21crupO/piiGyMm9yABraUeiZFI6nwGlK06s5gLyP+kpDKY8C4snxn9IcfZMALXa8Baqnlzg9sOGWkeqQ2UIQehhY/U9YSfBJZ7htv9VKYe5AvWa/nUdtMNSUNGRb7/vVg/8gpqM2yHMI3An8HeCHfGUHW/dbLTZZNPpWdWcB4JS+0Fu8c33+yzyapA8fbCGPWa0Qzf494k+5hkWjTWxHZnC7eQKIeDpeCcvKA94T639ehDmDYlfTTkr6b4GdNDs591PeNrTeFhZRIJjURnjtQp5awfAbJs4uoCD+5d6bu25vWi1Rw4oT6BvZvTFXbUyTJASHdd3qYlqtWUwV0iyaQj5med+KKBvMvd7YFG+XtDFdgLcJ6nD+Oddf7OZWzy0RQKCY8ZKOFnGOi/vSbiHMyIsc08c6J1AsjFyftAyuyVnOje4pyKSjU316Tu7yIO7SgkHCpPJhEAzJaZPRkIW9bD2qZX4ZDAb16pgr07bn8s3FY16f+KLDhsOOqP9+jb3iyHEs5zryVw+fUhg6bmGT+YsGCGoJuJKdqCAF77Qpsow1kSJKzVjSHczTRCtvsvsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199015)(36756003)(38100700002)(5660300002)(2906002)(7406005)(7416002)(83380400001)(86362001)(6512007)(26005)(316002)(6916009)(54906003)(186003)(2616005)(478600001)(6486002)(41300700001)(66556008)(4326008)(66476007)(8936002)(8676002)(66946007)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RTMrAemkoV1g1yjzvlOSdPv/uR+3El+9TtqvZtxYx4gkVoGG4BiALWzgMdqS?=
 =?us-ascii?Q?9XKGdf5Pt56Bi+hW6HIfRZgWdsRND5lBn8ZGWXuxaxAt8f/l28mpc4yU1gA7?=
 =?us-ascii?Q?mlreLtCCNgWhcOvZ2Oe28VLMFrhc+n+NI4mTX6dF3+wMiCqUkvp2Enw2t5H+?=
 =?us-ascii?Q?sdOEu0EObpOwD9eRaKdvLPrVfOFhpdHUuMFJi75gVyWTyKPj5IVrlAth5W+D?=
 =?us-ascii?Q?pPrrDy9t518t57I1ZQGAtm0SA/64GkiBvYqfdMibAEY8aUGR5i/zMZlTZg/k?=
 =?us-ascii?Q?KuF6wP1K0YN4f2DT1M1ZkoMsh4Lp8f2bcO+FFBaLaWfFmTDJ/DRvIvoP4YWX?=
 =?us-ascii?Q?0HVSIbSAdSgimzx6mlZxa898ZkTGaBZpzlbsOMOq6Sz/ozAjqgcAJBHPwrJ5?=
 =?us-ascii?Q?DC/mAqrZztrab83NhPw5N6+Uyy8W/12GnrIncwFJU/W6OcHs9zzwRsoXQqaM?=
 =?us-ascii?Q?ROJcXJDyZ3umnSKdf4y6nYDJUNoT9xi8mSbDmnY1uAFndFCj/kyFCwGYthNJ?=
 =?us-ascii?Q?gI9X3a4FdDyXWzyEWDi+PI6hpEDpDmGqXx/zO+AxZn5ltaWEthoPl++lJq13?=
 =?us-ascii?Q?FrmNGjAaxsPR+qTLsyaq8zxPyRn0MnWF8ivV05laMC90Rp/B2zWhff3YbsIe?=
 =?us-ascii?Q?P5P8aBZKo46TcXDKar7bywA3VGIAyP4+o7L2pQ5ce3HqVleFy8XEwQL1v0lJ?=
 =?us-ascii?Q?YAHIpPOeQCbT1re7xhaUTB5XKeQOuaWHri1S1CGT7wVJZGuRAtR6E6twpU6B?=
 =?us-ascii?Q?y7XqHYYteVl5apVecwKEp1TMU2v8S6IxPo+R9yvalMCJhVY6OBgkue/XDdto?=
 =?us-ascii?Q?qhiyzO0NAJCD7DojZKdgRsundw0HdEm/kfaviJY8uGfnNdkh45EWILIiVSOD?=
 =?us-ascii?Q?5KemTcSIdHMSJyd6lLCCoCbmlchDYCSDytQxlLUG+D2++VRplvAwsZ9l1LdI?=
 =?us-ascii?Q?b8qtk5l4NJzfKHX6KZj5DEhQoC41Mo4Is8IhiP/56GsqlajtEfeUBIddHYCT?=
 =?us-ascii?Q?JqIg2Am6jp+e2VFziyvCK5QcrPiXXf8GaBTgnVUCxJKzKRelSRxbdSYToD0n?=
 =?us-ascii?Q?B2ZeX/7y2kdZpA+f4GZNUpuc0/wqUKDBe6JAmlUnvJb5iu0uHWvn+hpLM/jE?=
 =?us-ascii?Q?N7BtQBerGIrYcxZ1KzFODTRiQfE+7vcQ1bv7wHrJy6uoE88tTG88mrwlP5N5?=
 =?us-ascii?Q?4IehyIXQBXBLzM7bYYA5QeB7vInemOT4tUovxkhrJARYwEQzISyoJoSAP8mP?=
 =?us-ascii?Q?ZRz98MgSgl77vK5TzS181Ih5YwnzclrIozOX5Y3tvdEIoS5BHQqgGmplOv1T?=
 =?us-ascii?Q?XJ/SPBd5A0y3RJRGbujdu6fkLbiQODFPTA+hxjn0/oLQyJiSkuzSDCp98BQK?=
 =?us-ascii?Q?mlsjlNB6QLU5/NJiywkoDrCp2BVOpCEzQXhk1RbDiNtXZuwnabaptOZOnR/h?=
 =?us-ascii?Q?iA0MnnbYEAacfCjYQ9sTqJLA8iun5qzyJkWbRfrfaA35uxgU8WnORAmK9wwH?=
 =?us-ascii?Q?ITfbdFhadeCOv3U46snY9VYPpfJLmCJGxQisZ9d1jlIAe8LXvxuwvtxb5+zP?=
 =?us-ascii?Q?ievVKahhUafvF8LpFKJenstqn9rPa6Lza8qeucrZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c93eee0-ded1-45d2-e35d-08dabc07806a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 12:49:23.3815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8c1o1D1DQVcyp124/3rH7Z1JUCMMDoyfwAtY5CynFB9slCQxp1YzZ6bbqUdnl6b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Nicolin Chen <nicolinc@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 08:37:39AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Wednesday, October 26, 2022 2:51 AM
> > 
> > Emulated VFIO devices are calling vfio_register_emulated_iommu_dev() and
> > consist of all the mdev drivers.
> > 
> > Like the physical drivers, support for iommufd is provided by the driver
> > supplying the correct correct standard ops. Provide ops from the core that
> > duplicate what vfio_register_emulated_iommu_dev() does.
> > 
> > Emulated drivers are where it is more likely to see variation in the
> > iommfd support ops. For instance IDXD will probably need to setup both a
> > iommfd_device context linked to a PASID and an iommufd_access context to
> > support all their mdev operations.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/kvmgt.c  |   3 +
> >  drivers/s390/cio/vfio_ccw_ops.c   |   3 +
> >  drivers/s390/crypto/vfio_ap_ops.c |   3 +
> >  drivers/vfio/container.c          | 108 ++++++-----------------------
> >  drivers/vfio/iommufd.c            |  57 ++++++++++++++++
> >  drivers/vfio/vfio.h               |  10 ++-
> >  drivers/vfio/vfio_main.c          | 110 +++++++++++++++++++++++++++++-
> >  include/linux/vfio.h              |  14 ++++
> >  8 files changed, 217 insertions(+), 91 deletions(-)
> 
> mtty, mdpy and mbochs?

They don't call rw or pin_pages, so they don't need to do
anything:


	/*
	 * If the driver doesn't provide this op then it means the device does
	 * not do DMA at all. So nothing to do.
	 */
	if (!vdev->ops->bind_iommufd)
		return 0;

> > +int vfio_container_pin_pages(struct vfio_container *container,
> > +			     struct iommu_group *iommu_group, dma_addr_t
> > iova,
> > +			     int npage, int prot, struct page **pages)
> >  {
> > -	struct vfio_container *container;
> > -	struct vfio_group *group = device->group;
> > -	struct vfio_iommu_driver *driver;
> > -	int ret;
> > -
> > -	if (!pages || !npage || !vfio_assert_device_open(device))
> > -		return -EINVAL;
> > +	/* group->container cannot change while a vfio device is open */
> > +	struct vfio_iommu_driver *driver = container->iommu_driver;
> > 
> >  	if (npage > VFIO_PIN_PAGES_MAX_ENTRIES)
> >  		return -E2BIG;
> > 
> >  	/* group->container cannot change while a vfio device is open */
> > -	container = group->container;
> >  	driver = container->iommu_driver;
> 
> duplicated comment and assignment.
> 
> Actually, I'm not sure whether the comment should be put within this
> container helper and other two. There is no group reference in these
> helpers then it sounds like the comment makes more sense to be in the
> caller side?

Yeah, that is better

> > +void vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int
> > npage)
> > +{
> > +	if (WARN_ON(!vfio_assert_device_open(device)))
> > +		return;
> > +
> > +	if (device->group->container) {
> > +		vfio_container_unpin_pages(device->group->container, iova,
> > +					   npage);
> > +	} else if (device->iommufd_access) {
> 
> be consistent with other two helpers i.e. if-if instead of if-else

Done

> > +		if (WARN_ON(iova > ULONG_MAX))
> > +			return;
> 
> Is there a reason why this is a WARN_ON only in unpin but not in pin?

This is how it has always been. I suppose someone once thought it
would be OK for the driver to do racy stuff during pin - but clearly
that is not the case. Lets fix it while we are here.

> > +int vfio_dma_rw(struct vfio_device *device, dma_addr_t iova, void *data,
> > +		size_t len, bool write)
> > +{
> > +	if (!data || len <= 0 || !vfio_assert_device_open(device))
> > +		return -EINVAL;
> > +
> > +	if (device->group->container)
> > +		return vfio_container_dma_rw(device->group->container,
> > iova,
> > +					     data, len, write);
> > +
> > +	if (device->iommufd_access) {
> > +		unsigned int flags = 0;
> > +
> > +		if (iova > ULONG_MAX)
> > +			return -EINVAL;
> > +
> > +		/* VFIO historically tries to auto-detect a kthread */
> > +		if (!current->mm)
> > +			flags |= IOMMUFD_ACCESS_RW_KTHREAD;
> 
> Can you elaborate why this cannot be put in iommufd as the default
> policy similar to what vfio container does?

Snooping in kernel structs to try to guess the calling execution
context is bad design. The caller should know its own context and it
should declare positively what it is. Someday this should be lifted
out of VFIO as well and into the drivers.

Jason

