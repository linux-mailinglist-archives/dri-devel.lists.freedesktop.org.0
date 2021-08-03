Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DD43DF2F8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 18:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EEB06E898;
	Tue,  3 Aug 2021 16:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BA76E896;
 Tue,  3 Aug 2021 16:41:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCq2j8w5Gb3RjjlDXjIC6pB+n7wn7pghRaBIVhZZDyQ7nHijOMmxk1sQbdEUXDGc2GQivoAcJpiB0hAumTaBNOb7O3OM48DdJdUA1FoHdASVhgfyQKnsXEqyfaQIAbprlOMkY5/YBQiw/5UoZcxnLnPM3OT/ysur5xMmWzzVqN+zQFUhjesT0NObzjrAS9UE9/MsRDGFZkCh5zl2CrFsUZ/k0jd0uYgA6jLyM4Jr6Dst5F4XGe1MfEoIbqT0bOxedWQRBTDOpHRiO8uwfKxW3BnCZSecu7WlUQ4/j502fdM60JL0YZqamhLNHE15crqznUjulZVn6cbp/ROgDRS1Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkU5rSbVZ/dv0hPCzMoFaI76oTWfpXivNWHVwHqlpR4=;
 b=ZGHxsb7tG825elwZutMHJLoxnnOHSa+Jwkar81YQsa2dJoGASrO3GubfFhYtJi1DfX5ytqlt9rxoCkM5JnlBKFuM4FjOHTJhlVipc76fAeuS06DrV4nJDxRvO6rQtTNmSH5gBo7ujWHpRjGDDhYvQUEoZtadsx/ABVhaBgSyN0EI0wo2CrdVwpS2/4RnIT8GaxEQCWvUsSrmFeiMz909tIZvxYQOTzGRh38R4bSdPxxHHnNLyXG/ILmnF7wB1TP0mbK8DE7TVwBMfh83mjLBtTzv58wjWxfHnFDaMItIPP47vc1mqc1MJzHOehcmziJzqHswy2PXhf91EhWN66DAbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkU5rSbVZ/dv0hPCzMoFaI76oTWfpXivNWHVwHqlpR4=;
 b=NivdlZ1zAqSITwdAed7xMlBAID8Sy1dSuzV0KOPwmSdVp50CAWga8cwmmmS7xlg0abPpX5VdhUhQbcnel2xZBhn7R/lV/HrWw4m6OpWhPTNlHLv2T8q8vJQC6EQKYX96hp9oskJ/z65TA3enYPmQ9ZoYSR1A+7rl/Q5ZWi9HQlsDHlTwauN/aXXh3XjEnUAn4QAS/2dVoNlm/6lNEcgxdwdSBEnJADmIR8GXMH4tbs2zEKUYWfp3K0vYLMSCXvZpSidtoj8er0QxPtjNcvmmD6eM4XLtkv3DWn6AdOBbVABXlsNgRLSvYN35nySJ0J8LZw2o0UtKFt3OjCuSKvV5Qw==
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5349.namprd12.prod.outlook.com (2603:10b6:208:31f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Tue, 3 Aug
 2021 16:41:53 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 16:41:53 +0000
Date: Tue, 3 Aug 2021 13:41:52 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhi Wang <zhi.a.wang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v3 09/14] vfio/pci: Change vfio_pci_try_bus_reset() to
 use the dev_set
Message-ID: <20210803164152.GC1721383@nvidia.com>
References: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <9-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
 <20210803103406.5e1be269.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803103406.5e1be269.alex.williamson@redhat.com>
X-ClientProxiedBy: BL0PR02CA0089.namprd02.prod.outlook.com
 (2603:10b6:208:51::30) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0089.namprd02.prod.outlook.com (2603:10b6:208:51::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Tue, 3 Aug 2021 16:41:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mAxUG-00C94H-AV; Tue, 03 Aug 2021 13:41:52 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02d44c25-229e-4cd5-6e73-08d9569d9966
X-MS-TrafficTypeDiagnostic: BL1PR12MB5349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5349B664260C2A65374267C3C2F09@BL1PR12MB5349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6dngdH3+9XpkJvbX4NB1dN6JPtbp8o2USGf800PbIrB8b7mBVF8YuuQJHcEIs4O2+LmGxVQUTCVc981Sn65g4lBHTGZE3B7+Vs9KxAmW3zcVTYMwfzB5d496q0xJg/CZixJIVcqvuxoLHJgYhbnCYclBjSZTMw4wGccbquEJ79nymn9O9XgV4SLW/WOXwSQXCrSHfSpYSMyc7g6s5zT6Frmkk46u3VfV5t9lRmnjOv7PhZjVvya5cGtpbWHsJf+o0u+O8wNSuTH5QFlLVFB39Tn3lJTKFmS+TwHskDiOoAAzRqDlQeumwQKMtb6T1SOjrGu/4T1gypN+m1iDSL34efmXdgdSJMaPOm37pghHbnmC6hzH+8w+W02NQAOvFeeUMXaTsz1tROqhyJD9FBFj41ONEU6OBuLSSRirvoL9fFDfTRQleYQEOt7fXC3bWh+/DDdEmYeCClw3SYI9KLHZKIF3k3QFwF4T9iQucYjlMFDF13dCZaCR++G5q9piEAY6kMkkZowe5+pwlfJrpEU1d4RpGENiEjwLVWf2oKGaCbX6Wb1InH7HKvnbGIVxJWkQaDOfxAonXHgr+vNfAwMF1PkR8BgmuXiiHMRya4tVtP2dG65tRRJ7KywrQaF1PaTpUDaiIkxISYiymaBvoPFOqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(7406005)(54906003)(4326008)(478600001)(9786002)(9746002)(1076003)(8936002)(6916009)(8676002)(38100700002)(36756003)(7416002)(26005)(2906002)(316002)(66556008)(33656002)(83380400001)(66946007)(66476007)(86362001)(2616005)(5660300002)(186003)(426003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cyiis+kw7TO9mlzc6VP/M71SiQI1g+8lvTJYocTwiU4Uf3nYl58EjhTNAwt5?=
 =?us-ascii?Q?5ghsno2ATy1hBNg1FjK5bbJQCknV3120zZo3hdzoei5GqFNPy69Nn0bLmP97?=
 =?us-ascii?Q?vrc2Ugl6B2Jq7YvcpX0knrXa9nuMBfwiarmVx1z6FLtd4IbGhZ7dl4XnnjsY?=
 =?us-ascii?Q?Hdqry/hf4LkbZNXUBioE9b9+gi3QZSqxAE8B83qK/oAfWhfz6saFEGQHUl0V?=
 =?us-ascii?Q?kH8XSjISAvMaYZkfUsXRhKxq7uMjGynbNYy9cLIkA8yrWueZWrh/6q28zVLU?=
 =?us-ascii?Q?PIJ3Z8Z8YFw7iz9kv8Jjg9gM4i1TcxbDHmngRTg33dBMbvrNOxlPzGCLDnBw?=
 =?us-ascii?Q?cYOebvFpr9kXEFn5Y8C9X4YpePclKOOH0YpGZY7Quma3PHWOe23wote7W5jM?=
 =?us-ascii?Q?QUn9hX1EzsraXluVP+8vaFJStzwHFyubPWy5kQjeOtcT9Q8dWiDiB9YJF9Mf?=
 =?us-ascii?Q?uFjv4ebrv28LZ3ppwjK70H0H492INsM7TeNPEAV8GvdUNrujkg2vtLFYfFiO?=
 =?us-ascii?Q?KNl2NKzI2Xcz0v7zvSXrWiN2Vsot8PRliomUh9bYiHogCBjHMb0u9J7dt7pj?=
 =?us-ascii?Q?6quJbgcPUMWd22aJ6sT3FS8xpA5y55qDu8eafEv0mF4yAZ2pTZbnfhvi0qk3?=
 =?us-ascii?Q?IuoYo+JElDcoyDxGXw04hlH1Lz8A+0Yfyw9lP+9m2+4WdbW2Q2rNfbrXJALL?=
 =?us-ascii?Q?vRf5AWUHKUjoCgEXdmFLNbtQ4LNiXYo3ajNVCEtMBbphVvmQ5uOSYvvNFOvL?=
 =?us-ascii?Q?7bUuzuqQMROmczbpwDzktzz9w+9wluz3wNjeMokWW6fgPkSjVbPPvZ8I9dlg?=
 =?us-ascii?Q?fOehfyJXKZi4xWx49MWhvx/h3B/aWCOGZOzwPLRyyMNoV3MFxfxFP/Hv5qJQ?=
 =?us-ascii?Q?9WkZBYbRYvDVgf4NwVlwkYJPmCUIyE6sWTxMQqbjO005D9wNnHnHgHFmbjJ3?=
 =?us-ascii?Q?l5rlXJsFIENhLpOEDPqKDLVKHbmx1DzpoQlQDBJ+gs1ksgJN+sf9m2wUBTQb?=
 =?us-ascii?Q?v0BSjoUYqXxXTSSTEGTY412dV4YYxHGyWkTV5c/3KOprh12+++LXPn1z0fwN?=
 =?us-ascii?Q?dgoY25/BHb0NGOjEQovJi+2RMpsx9pGD62Xknwb+YpLZrH4SFZve7fGjcFiq?=
 =?us-ascii?Q?4t2GGZOcndyeFNblgwOwN3EdEz8/x7bzvXjbdEbYRnzEcFRadO8S/lkK8Jb7?=
 =?us-ascii?Q?iOoWOZO1JZOV03Rwmt4jtHr/RaBgI+m6GL/6XaMzw3QipPm4Q6CEn/4JgZWV?=
 =?us-ascii?Q?M1LD1o7vlMh1rmLk64ScSF/RTqMxSHdXvEYHTPPmL77rQIAWVYju98wUioY0?=
 =?us-ascii?Q?XLbrWpJe9OLQ/Q11dztpjEhM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d44c25-229e-4cd5-6e73-08d9569d9966
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 16:41:53.6203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seYqP/A9aYYnjC7BdBBLb34uBy00erCleBTn0QV99gE3LW6LLuRA+kWH3KWD2Ug4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5349
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

On Tue, Aug 03, 2021 at 10:34:06AM -0600, Alex Williamson wrote:
> On Wed, 28 Jul 2021 21:49:18 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > Keep track of all the vfio_devices that have been added to the device set
> > and use this list in vfio_pci_try_bus_reset() instead of trying to work
> > backwards from the pci_device.
> > 
> > The dev_set->lock directly prevents devices from joining/leaving the set,
> > which further implies the pci_device cannot change drivers or that the
> > vfio_device be freed, eliminating the need for get/put's.
> > 
> > Completeness of the device set can be directly measured by checking if
> > every PCI device in the reset group is also in the device set - which
> > proves that VFIO drivers are attached to everything.
> > 
> > This restructuring corrects a call to pci_dev_driver() without holding the
> > device_lock() and removes a hard wiring to &vfio_pci_driver.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> >  drivers/vfio/pci/vfio_pci.c | 148 +++++++++++++++---------------------
> >  1 file changed, 62 insertions(+), 86 deletions(-)
> > 
> > diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
> > index 5d6db93d6c680f..a1ae9a83a38621 100644
> > +++ b/drivers/vfio/pci/vfio_pci.c
> > @@ -404,6 +404,9 @@ static void vfio_pci_disable(struct vfio_pci_device *vdev)
> >  	struct vfio_pci_ioeventfd *ioeventfd, *ioeventfd_tmp;
> >  	int i, bar;
> >  
> > +	/* For needs_reset */
> > +	lockdep_assert_held(&vdev->vdev.dev_set->lock);
> > +
> >  	/* Stop the device from further DMA */
> >  	pci_clear_master(pdev);
> >  
> > @@ -2145,7 +2148,7 @@ static struct pci_driver vfio_pci_driver = {
> >  	.err_handler		= &vfio_err_handlers,
> >  };
> >  
> > -static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
> > +static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
> >  {
> >  	struct vfio_devices *devs = data;
> >  	struct vfio_device *device;
> > @@ -2165,8 +2168,11 @@ static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
> >  
> >  	vdev = container_of(device, struct vfio_pci_device, vdev);
> >  
> > -	/* Fault if the device is not unused */
> > -	if (device->open_count) {
> > +	/*
> > +	 * Locking multiple devices is prone to deadlock, runaway and
> > +	 * unwind if we hit contention.
> > +	 */
> > +	if (!vfio_pci_zap_and_vma_lock(vdev, true)) {
> >  		vfio_device_put(device);
> >  		return -EBUSY;
> >  	}
> > @@ -2175,112 +2181,82 @@ static int vfio_pci_get_unused_devs(struct pci_dev *pdev, void *data)
> >  	return 0;
> >  }
> >  
> > -static int vfio_pci_try_zap_and_vma_lock_cb(struct pci_dev *pdev, void *data)
> > +static int vfio_pci_is_device_in_set(struct pci_dev *pdev, void *data)
> >  {
> > -	struct vfio_devices *devs = data;
> > -	struct vfio_device *device;
> > -	struct vfio_pci_device *vdev;
> > +	struct vfio_device_set *dev_set = data;
> > +	struct vfio_device *cur;
> >  
> > -	if (devs->cur_index == devs->max_index)
> > -		return -ENOSPC;
> > +	lockdep_assert_held(&dev_set->lock);
> >  
> > -	device = vfio_device_get_from_dev(&pdev->dev);
> > -	if (!device)
> > -		return -EINVAL;
> > -
> > -	if (pci_dev_driver(pdev) != &vfio_pci_driver) {
> > -		vfio_device_put(device);
> > -		return -EBUSY;
> > -	}
> > -
> > -	vdev = container_of(device, struct vfio_pci_device, vdev);
> > +	list_for_each_entry(cur, &dev_set->device_list, dev_set_list)
> > +		if (cur->dev == &pdev->dev)
> > +			return 0;
> > +	return -EBUSY;
> > +}
> >  
> > -	/*
> > -	 * Locking multiple devices is prone to deadlock, runaway and
> > -	 * unwind if we hit contention.
> > -	 */
> > -	if (!vfio_pci_zap_and_vma_lock(vdev, true)) {
> > -		vfio_device_put(device);
> > -		return -EBUSY;
> > +/*
> > + * vfio-core considers a group to be viable and will create a vfio_device even
> > + * if some devices are bound to drivers like pci-stub or pcieport.  Here we
> > + * require all PCI devices to be inside our dev_set since that ensures they stay
> > + * put and that every driver controlling the device can co-ordinate with the
> > + * device reset.
> > + */
> > +static struct pci_dev *vfio_pci_find_reset_target(struct vfio_pci_device *vdev)
> > +{
> > +	struct vfio_device_set *dev_set = vdev->vdev.dev_set;
> > +	struct vfio_pci_device *cur;
> > +	bool needs_reset = false;
> > +
> > +	/* No VFIO device has an open device FD */
> > +	list_for_each_entry(cur, &dev_set->device_list, vdev.dev_set_list) {
> > +		if (cur->vdev.open_count)
> > +			return NULL;
> > +		needs_reset |= cur->needs_reset;
> >  	}
> > +	if (!needs_reset)
> > +		return NULL;
> >  
> > -	devs->devices[devs->cur_index++] = vdev;
> > -	return 0;
> > +	/* All PCI devices in the group to be reset need to be in our dev_set */
> > +	if (vfio_pci_for_each_slot_or_bus(
> > +		    vdev->pdev, vfio_pci_is_device_in_set, dev_set,
> > +		    !pci_probe_reset_slot(vdev->pdev->slot)))
> > +		return NULL;
> > +	return cur->pdev;
> 
> 
> I don't understand the "reset target" aspect of this, cur->pdev is
> simply the last entry in the dev_set->devices_list...

Oh, hum, this got messed up someplace along the way, the original code
was just:

        /* Does at least one need a reset? */
        for (i = 0; i < devs.cur_index; i++) {
                tmp = devs.devices[i];
                if (tmp->needs_reset) {
                        ret = pci_reset_bus(vdev->pdev);
                        break;

So should this, I'll fix it up, thanks

> I think the vfio_pci_find_reset_target() function needs to be re-worked
> to just tell us true/false that it's ok to reset the provided device,
> not to anoint an arbitrary target device.  Thanks,

Yes, though this logic is confusing, why do we need to check if any
device needs a reset at this point? If we are being asked to reset
vdev shouldn't vdev needs_reset?

Or is the function more of a 'synchronize pending reset' kind of
thing?

Jason
