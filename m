Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2153FE17
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 13:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED4A10E064;
	Tue,  7 Jun 2022 11:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B6F410E064;
 Tue,  7 Jun 2022 11:57:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z5bkzeFfz7hku6BLNt1DVLefLYtPWrVlLBLOQj6Tl1AhBc+B2pG7FW0lrTunLQ22McFKjnDJUubMwJLA9seBqepovxJM/N0+JrGz+W/Z0MhmHozJrY9SiDoD5oz8PNka3D4vxlru23BvrMQeLEKqqE/jRua2MOp9AC3tg9D1UoEhI8D/VnBMMjVdpksQ1WKaL5KtD8zdJ8+8kraSeIqI2/O0s4YPlcNI+49WRLCxCSb+EOljpQ4B2YBOks/JV+T5iC/38Okbt8VlaaOLO7oc9GeLVFmmt/QzSJj/0VzdUt5kIjGg8OIA9opcp62bWTR8SuYQn/DGnqQIZPDrQSw/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ex6m5qwnMkAXTA9LrGpCxi+Okw3ZZAIb0c5X6u+40Dc=;
 b=SJVj0oOcZeQp7Eo5eoGOnC/2CKeUqrq/i/sglGbnlZCGFTFOtjNyxuRSUaeKUen59GXk5momKv+hmWLia4PFxCEw7+OGE269YmfQ4ISA4naenrdEVMM5hvoL+TM0K9x5z0V5psMairIsBwV/eFm11soMQwAD+VdgjYVSXXjvBqHVSJv7MvXhaPACdcUeQ4IRfLxOY6+tK3P0nGoaA2RHshvKrbz24WaCBYP8f4C4h3NQ1B41gcxjzlUHa2Fywp0h3eGoL2Ky88t6sYehKVEbaT1w9hTaPa3KhetOeExykVUBF+Wp5aFhFjnM4jMDK8Z9SnlcQ7HPbmvM1jw+a0a62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ex6m5qwnMkAXTA9LrGpCxi+Okw3ZZAIb0c5X6u+40Dc=;
 b=IVyqJfnT8PR9xoyVKwn6WvZvJlmWMnZc6kMM43xzNAKoVRdbNkB11Lz8t491SLWIT9lCQEXcUv5FbAXDo4JgJ9xq3EdLIEAEEWTnDb5+Dcctywpolop54WSxLeCtfP6IlNUZCJTLdL0jEXf9pWxRr50VEZr/ds8VSERUoB3r8J+1rHLB+hRYU9ItiDZaVhfD98rz55zLAo3QtdJx3l9p+ee8xyqQp4vfwTcbdtLGMop5LJhyzfnMMua2Co5ub1fbA8Bowh9n7m54LCXeFdgkF9WpC8dqUyJVfOaE2Ty31U6y1NHBNFRGDy51o3za9uAeX+3TymVD0pdf332ZPogj3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR12MB1182.namprd12.prod.outlook.com (2603:10b6:300:b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Tue, 7 Jun
 2022 11:57:04 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 11:57:04 +0000
Date: Tue, 7 Jun 2022 08:57:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] vfio: Replace the iommu notifier with a device list
Message-ID: <20220607115702.GF1343366@nvidia.com>
References: <0-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
 <2-v1-896844109f36+a-vfio_unmap_notif_jgg@nvidia.com>
 <20220607054437.GB8508@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607054437.GB8508@lst.de>
X-ClientProxiedBy: MN2PR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:208:23d::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 784a0f29-8ad3-45c6-c3f9-08da487cd684
X-MS-TrafficTypeDiagnostic: MWHPR12MB1182:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB118278472E4CCA4146781467C2A59@MWHPR12MB1182.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WLZDnnu0sAcUiIrdVv4uMUkO2fI1Dc0eXrcGcyruBM6C4rckIrgxsVyXdpN60rLc7VnX8acOf7AM/2NFCk+GebalW9ys18HL/OFxQJ1GkmcbzLVH3GppT4gBgQuUXsUztPyUWyRr+XQ3k40xP+Opsd4dL2SgFWZ6AYU0a0OgJlAIsxNg0Lrrs77k9ewz4ei0BZFOse7PJCk//d/7C5Uio3mJxRfeSks9xqSE2g7IKcNsOWUJCx/HxO+HAJpxJdqsw93y0BT01ZST8Kthid+Qt+jGAQZeEuyWnCOpfG1r9x69kdxeKnGHxswztDwIgYu6MUOhHzS+qtQKkz7QMtm5Kndp7Qe5lr8DUBnIpYM8VRDTiPaasIS3nu81KrVnsWSnqULV8jk2pdTCk+bhcqP2QYunfOB963wX1XqAS8B8JzyvzBIqp6RIljDct2WpW+WEPyFNhhhb6Qqv1tDHI3O+85jchINUFEsZy6abE0B59gx5fj8iGaTM0ZUvaRrUzWm5Cpr8whD7tsLLyh/PTdb0bakoUmeTskvwW4ETn5XPjW2ciV5TyYMWupKPl5qCVn9991y0nXUfFoOZ0uG+1+XKSsfhV+XdFDCSC3wKXiNjmowOAWEzUsUgFDGVD1x2lnFcij0xzr1iEEBiAd0RkrdGVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(5660300002)(36756003)(316002)(8676002)(2906002)(8936002)(7416002)(6506007)(4326008)(2616005)(66946007)(66556008)(66476007)(83380400001)(186003)(54906003)(38100700002)(6512007)(26005)(6916009)(86362001)(6486002)(508600001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SmnLqpJWFVk93G5c/OMO9jtx+NymIaJf0JUmXrM6xE1A/U33+F1dEq3vUDS6?=
 =?us-ascii?Q?fpPg8GAAtuAFphEIJ/fw+PlMrNQgoDtI9nhED/6Evo/XwmtbfCjDtlzvSEHF?=
 =?us-ascii?Q?qImJmWCxMLsTfdWZNJQkJyEih+aCJfW+uA5uCNXyIx//Au3YB/nTcTkt4suR?=
 =?us-ascii?Q?/Ui/O7rfBV4rujK6PInED3HVrgrwLgiFYf1H/3TIZM87mXcVCl9HkD7eL2Xz?=
 =?us-ascii?Q?pp3eEue1TfX1Oq1Uq475k5qmczOdmrv3rnd44ef/kDdu9k03JP86vBALvywj?=
 =?us-ascii?Q?o1JWWDsgN+g/9f4JlydUSqYVbsCDIwLgeXY7HFLZnMUFXI+k/qAM4zPmQspC?=
 =?us-ascii?Q?1w4tfmKelkjSeuaO1M53C3iMzciDXo9viGCJugn1Wl4i2pSTe/WgvwPmbXL+?=
 =?us-ascii?Q?SPUpz1pZnwtqnENLbClsOaP18x/bRjeYiCePACNQRPf1zp36Ud3RIzSkHYBe?=
 =?us-ascii?Q?WiLM3NeHUm8l7FbpUXrq3fxlza6/GKYoIeW+MGHvE3YudkK5I3tQGa3isDFS?=
 =?us-ascii?Q?hGFktZc97ZpoFSQb296ETT1vKrfhyChAsSwa4bs8eXABg2J6TK9OH14bTzk4?=
 =?us-ascii?Q?TIfaWBvJ31unXyj4tAuQHmfV0GmZhQSD12MvN/MHf0xkdXdxVm49G4Yrv3LM?=
 =?us-ascii?Q?lBgPVDiuXeNdxtV2IDoz4nmRI/wbX9ttcbJoo0PfgXkjSbBK8aLP97VCmm3x?=
 =?us-ascii?Q?xNt0IBCVJJS6661JlhlP3fOCcXFylhRWABYM8bUIaTN3PSkO00v2C1lLrv7F?=
 =?us-ascii?Q?DYMSwMUvobGsBGFzGYbmATXPQousOXkPoxqWyz6ylEV48P9W+eb/Rvzsj/63?=
 =?us-ascii?Q?WiTF8G/5vhxtVaPORl7Hu1lQJ7bO1mdtTS1RG6EPlQzW6Yp8WRRjCWFnVhEe?=
 =?us-ascii?Q?TTQ8lo143iFblpJjH6QV6Kkpa5BJZKvzXqdiM1a4kuLfvTOOeMmLoeouHvKI?=
 =?us-ascii?Q?DwMbIxKNQxTe1MzsQjmYfDOure9x66u1RMa4fRdT76otnfPxWT80laFc4ARJ?=
 =?us-ascii?Q?HOAh70optvzraAbBgpVXyfUWB4mu0ZALvMYpcIenyiKqi+tf0rmG9dlSPDC6?=
 =?us-ascii?Q?3j8M47+SyFRikq9NfuiuXnrSonPx80UQyZLX5niski2hg7K81Dov7uCsPsoP?=
 =?us-ascii?Q?JC2iC9zBSLaqtcFaCrVfUBa5X1GEA5ktfS0EfJtcMJpp0r5hutHjqtnB4C2t?=
 =?us-ascii?Q?JUVqGw7/jQGYsvsUCX3CHYaFbdzpjGp4B49XO4GMA+3fJf83nLaI00eyLowc?=
 =?us-ascii?Q?+y8yOWbcwr12pxh0OF8m3peFZTGjLd8IaId8m5Jy9u+v+CC9SGqxVbmc1fCY?=
 =?us-ascii?Q?D/595ICEdN+gHFyq+hPVmyGWB6zYZMm9+Srx1TigXZfGg88ksRZm6zhLwoBS?=
 =?us-ascii?Q?DRkpB3+Cv5o4EGG9vbGa1t2XSVLMFOUTlTJ/wVN7pnmanZNegnYYv/1pv5rS?=
 =?us-ascii?Q?LS4IwwjOy8iIe0vbLcelBuDPN/P3etrCL9nRMPFd8rbwBB+K0GrUh3OiW5UF?=
 =?us-ascii?Q?njQqgT0/+7wuF+OUqjU9ARxhzoelu26YSau2qoW5f5PDUEXFx5kvP1Rvnym2?=
 =?us-ascii?Q?QoJpQhMWHDF0FoT1+OGm2EKKyxPWAz6YhXdmS71xenBSRL5G/szBbgUMxff4?=
 =?us-ascii?Q?qiNnU1u14ZVbIdTzcbbNg+ekUAM8rUjcn+h1x52mkJJLF3+Ot5e4vyv68Np7?=
 =?us-ascii?Q?hFWOjWBEu2Nb4xNn0/Vf7Ni+vMjGPMzkyxGKqp6fV1AC2chg5XDGRwroohmD?=
 =?us-ascii?Q?BkQcDQIowg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 784a0f29-8ad3-45c6-c3f9-08da487cd684
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 11:57:04.0703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30zKiZMto7nL9sKpURc/8dI42Vk6JK0LfizLVynMuMhO9EvQOBvT5tHWd8JYjJFV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1182
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 07:44:37AM +0200, Christoph Hellwig wrote:
> On Mon, Jun 06, 2022 at 09:34:36PM -0300, Jason Gunthorpe wrote:
> > +			if (!list_empty(&iommu->device_list)) {
> > +				mutex_lock(&iommu->device_list_lock);
> > +				mutex_unlock(&iommu->lock);
> > +
> > +				list_for_each_entry(device,
> > +						    &iommu->device_list,
> > +						    iommu_entry)
> > +					device->ops->dma_unmap(
> > +						device, dma->iova, dma->size);
> > +
> > +				mutex_unlock(&iommu->device_list_lock);
> > +				mutex_lock(&iommu->lock);
> > +			}
> 
> I wonder if factoring this into a little helper instead of the
> very deep indentation might be a bit better for readability.
> 
> > +static void vfio_iommu_type1_register_device(void *iommu_data,
> > +					     struct vfio_device *vdev)
> >  {
> >  	struct vfio_iommu *iommu = iommu_data;
> >  
> > +	if (!vdev->ops->dma_unmap)
> > +		return;
> >  
> > +	mutex_lock(&iommu->lock);
> > +	mutex_lock(&iommu->device_list_lock);
> > +	list_add(&vdev->iommu_entry, &iommu->device_list);
> > +	mutex_unlock(&iommu->device_list_lock);
> > +	mutex_unlock(&iommu->lock);
> 
> Why do we need both iommu->lock and the device_list_lock everywhere?

Not everwhere, all the readers are using only one of the locks.  The
list empty calls that were previously unlocked are done under the
iommu->lock and only the list iteration was done under the
device_list.

> Maybe explain the locking scheme somewhere so that people don't have
> to guess, because it seems to me that just using iommu->lock would
> be enough right now.

The expectation is that the dma_umap callback will re-enter the type1
driver via vfio_unpin_pages calls and this will recurse back onto the
iommu->lock - so it must be dropped before invoking the callback.

I'll add a note

Jason
