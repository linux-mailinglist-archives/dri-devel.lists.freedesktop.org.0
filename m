Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 355F3542F1D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 13:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A3A10E8E6;
	Wed,  8 Jun 2022 11:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2715610E8E6;
 Wed,  8 Jun 2022 11:26:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2fcJWCRpL2wjGraksZ+6q/J7gZQauSPxQLILNKaffAa6PXjrS0cOotp+fxRysobkzJs5MCG8HoVAUf+hBgDDTbMIn6J8iibGDXXm9fWG8XQdtcqJfufszRXrryuWgJVAK60l8P8WZscBB++xqd8NUkmjkgCeBBfjQtnJgepn5y1AQVggBZ225r2OopSnebkszZ0jGUlJmBjxTjtxgA2okhSvO3Jz+yyY5yN0t5Bf8HH2gS4+p4h/H2JIq1NV4UWMLWhhj9L5N0bSn8TSCcSo029qbcPcK8kylhjNvk9eSm0rlv2u5KhZMCJA8EU2KW7ArHBurnkOaUXFvbYoo5Usg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3kebujFf2V3rB8oLOFfL6Y4qStaZh/dlVPZYl0rPimw=;
 b=SFdapiCZ3S5Q31W+hWxIW/QgdkseF3o7XC4GQ4Bdo6YIMHLnDFOHFYNKPKxwhRc3/b2cO4f7XvhLIFYtdMlmxn8b5QMckoQW8ALTm+IPFp/eo5+SVEeGNmVu3EVMoiWCuRiFPILJmjH2hP8qzYtIo5kGPppyxAe1jpD06HDj/fWFuKfzlSc7mkXqr4OV7zpmPwCY04LsOps6Kg02H3yY476gox4yzuLHB/txRvJIvWAFFmiCUFaFyEM4Vi8TW+k7KnPpIN47ynEO0MoWtE2iTqRDJFQ7Gs+NAwUH0znL4LIMAeNitOjeHk2iT4QuDLyz04huqonQHDdaG5QNbRdbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3kebujFf2V3rB8oLOFfL6Y4qStaZh/dlVPZYl0rPimw=;
 b=tn6PxMdCjdspY/jCd843t36RD96YZ4dzIzDuVHgDfKlqHhwJ5abr/MBm7MiS8EI3uV7hE0aeU9ze4PJXKNUz8JP8BlDwYA2splncOxO9SICaXZgFIT8JoZmMZL6zfIVj/67eVBoPJthy8xS87yRM2LAcCyFVszapbrKEJ/o5PUKyIU3OCCrorqpmG4QRzWNRfmTi+jwGTIOD3IIfbUxklmqFSrY7OM/QnjrYTXqpNcDxDn+21rnj0sLgPTmMcfu1szSEgirTxuehA3seAPRydDdFHzw5OxzukKQgLf55tqmxz6WQnFDw9oxDY5ZUiHQoEjgT0IM28qUQNePu3lB9ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN6PR1201MB0195.namprd12.prod.outlook.com (2603:10b6:405:53::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 8 Jun
 2022 11:26:42 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::2484:51da:d56f:f1a5%9]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 11:26:42 +0000
Date: Wed, 8 Jun 2022 08:26:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v2 2/2] vfio: Replace the iommu notifier with a device list
Message-ID: <20220608112641.GM1343366@nvidia.com>
References: <0-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
 <2-v2-80aa110d03ce+24b-vfio_unmap_notif_jgg@nvidia.com>
 <BN9PR11MB527600F9745D1AE27150CF938CA49@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527600F9745D1AE27150CF938CA49@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: MN2PR15CA0023.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::36) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a469ccdb-db85-4d57-91d5-08da4941c30d
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0195:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB019516D597B128A2A359EC7FC2A49@BN6PR1201MB0195.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8t1tK6tD1H9PL4wWZAFqc1J5n00XwW2NQiy5Vy+5jlo4kV4rr3lEDkNF0db0zy/EwMr1wnIIZRSWx8qWhG5SRYlmKVs2oIkpu5hPnYkdvqNhz/3523Pcl0y6PbbNbaEXvc1FC/qSzkB8njiST9U0y4DQz+uEpfUHvkeBdUkl8iUj/kTJUvr8o4LHTUkNmdfwcQxDol9svi2w/W770hJ5bZJsGrMkPk9O9OiKymVFJg1I012FNpxIf6rV2Kt2sRg7hCChyMgBr4O61gzysXkMEWol0QPuQYuU3WQ0bZv9x20jh5cBK5vT0mNXmPpeLtRm+gyq0rJvyS2/AMNfOESCMtZUfmPIL3CeCsNVskNSnq27aOrREimIlZjphqq/KRiDGvFhvS/dzT59lk4vvdnxUuwGKCcMv2rVxtAOB/Nq+eixw7qRgbCfqKaGVNvuV5XwDtODpMg45wdq9rW0HnmcJOWNj7zsIllAmC6bwyW4JpLIzk/cgFmy+vbT8fXCb53C/uE9F48z8A5+1CRZJT8176jIHgtcAb+jbda6t/AEG+R0Hg+KP21Fmue1j6uAU+HgGq0IVUtt2hI0AE8NvmcT0knABlEr+kABEruiQqSOs0jKxx7alS+gGTlFWbh7GA4BoV8Wo0vclQWtdsrEwqYVbQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(316002)(26005)(8676002)(6506007)(38100700002)(5660300002)(7416002)(7406005)(86362001)(186003)(33656002)(8936002)(6512007)(66946007)(66556008)(66476007)(1076003)(508600001)(2906002)(83380400001)(4326008)(2616005)(54906003)(36756003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8++tOrYoBmpzyOs9trn/o76IJPmf9GqUBd3Dr8EArVBVzPOt7Jh2Sq3Otsx5?=
 =?us-ascii?Q?mOFE5d1wqmOf9AEYw2cA14hVIloqpMSbeEPl/9soFzYkmcvay5IiRya9D9PY?=
 =?us-ascii?Q?F3l9CSGI8q6DaEe463WQa8DtvDWGvs4xKIitPIrefNHngyNbkO7r7yZ6AR+U?=
 =?us-ascii?Q?TeHtWjkHmu9fa8l4bhaOhwiE7OKvFWKgnxtfgWrXqPt3yVo5klMtUlxLrZob?=
 =?us-ascii?Q?CMeLuiIAS1K+vwfPs8E/TCYdn4UXX/7KIl72g1jJ1IbTT77S3TuYYm53ZEC3?=
 =?us-ascii?Q?6D6mZCCIt6/13hvvdYDkrKH4MFU5pWwSE0vi9rmzaNR+S4ypv/hnZ9mhUnoM?=
 =?us-ascii?Q?jlW5Ywd0pVLBVwlSgl2APCNTgiNoumyAziFrNiYiWFTxe5rAbO5AHr7uo+e0?=
 =?us-ascii?Q?fD4yN2bfl9rTr7K9u4yCwZXNFpPRwUQTeglmRA4BA128dd+WP6kh7zXQy2Xi?=
 =?us-ascii?Q?Da08Tbc+bhzZun5dfDM0S3OnI3JAKQ8BNUr0N/QZSsdVS2YpIef7toLU0vzP?=
 =?us-ascii?Q?XuVcklDGfVhpQA8mL5XkPDQfcZOlkQtJvuxT/Wltnipx+bsSDX8FrUyHm2kR?=
 =?us-ascii?Q?D0TItVDkRKDMgyX8RvRe2slnuEkl5PdsUKUyolaAdRSVQCDyk8P2N3pCzIMq?=
 =?us-ascii?Q?FEl4Uns1JrzCHQbSQMQ9zMYu2BCeW2WEJj3PLEKgPeVbPSM2C/Qzlwpm8MWy?=
 =?us-ascii?Q?xiBa2OxVvgT0Uy1lVdVRTw9/obnX6SogKk+MmTb3R5xlwlG4BH9MTQHK18Qt?=
 =?us-ascii?Q?YWk312ukFSe/P+ewDzAKBTCC4yCb6hnS2MINY1jcnsDUZIi7X/cPXVm8v2SF?=
 =?us-ascii?Q?wR6FVTLwm0LOpMPKG4h8wNu+Ov5znYDdZwIZrsPrxgnCFV8B6B8X6OPbujtL?=
 =?us-ascii?Q?IjCJFv0u52fB8QRxC5TLO/glWosZJhUjLZmRHkoxm+G86FgmfmUv1otqMivk?=
 =?us-ascii?Q?xZdJ2v3n9rO3oPottgu0GSD3FWUsBVT/NGL0PNTto0yWOtqdwB2mUYe44p5m?=
 =?us-ascii?Q?JAQfkvIc85D+NCFlX/63mnA4wj7LLZORdgVP1DXwpEfWbX3w4iGbyMF/PDfI?=
 =?us-ascii?Q?CKYtiFpQMWW75J4Joc16vgFBzx8WLUZRWEYsmrInGNIrJb3PVcGaA3ztK5Q9?=
 =?us-ascii?Q?TWAUbiBxLNU10UA7v1HfcObgYpGmsVR+eIbRWJdFMVp1riw22jfkIM8AzEpx?=
 =?us-ascii?Q?oYbSP0EExg/hAkOllIOC36a4SvFMPq38fuko4oXeMSl1om0AQdTmtrvbEQGr?=
 =?us-ascii?Q?zJxRa7PABCT5c1Q2guL5my4PW4j780p1HJt4n7s0Vsbz9byoyImj7CqEZAoT?=
 =?us-ascii?Q?l+pmZN3AnNH8AV7SPCbAETYlZ8ky8/oxRyRJH2vJEgox3UPyLx9KIv46kGQF?=
 =?us-ascii?Q?MlvWjklRyHH7HaGhxSLOWDtNQi/rYhPpCqN0SlwHIv7wi4wxd0ONXy1ZzIDW?=
 =?us-ascii?Q?uQhHm20X4ACUTRZ7Eld13JhTOfIzq2oX8yteCvouaycXwD5pzn1i/Ut6/8rH?=
 =?us-ascii?Q?wzO8dxbetkZJr+mdkyfThwdmQXSrcAx8axDHXGf6X4q1geimOQSE8xeJ9e3d?=
 =?us-ascii?Q?KFdBZnRh2CIgtLsCWSeGpWtCbAChyoypJ0S1syhxf0jlKKfG7O30gFXGcblQ?=
 =?us-ascii?Q?YWmzavwmk+7bvher3l8wiS6cZGn4J/dJUb2p9s5ZBdPI92IYLhpZr214VjoG?=
 =?us-ascii?Q?cUmlaffz+y7uZxHEkNphdoe42AsEWMjdmhwzI1sHUSbok9lqVL0ugjPQYmex?=
 =?us-ascii?Q?2T/eZQd4og=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a469ccdb-db85-4d57-91d5-08da4941c30d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2022 11:26:42.2212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alF/Q7OCv2/++iCoscCtzFgGubWyncFf53axSm16WDJEdfhndocUnmVUKNFrl22h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0195
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
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason Herne <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 03:47:12AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe
> > Sent: Wednesday, June 8, 2022 7:02 AM
> > 
> > Instead of bouncing the function call to the driver op through a blocking
> > notifier just have the iommu layer call it directly.
> > 
> > Register each device that is being attached to the iommu with the lower
> > driver which then threads them on a linked list and calls the appropriate
> > driver op at the right time.
> > 
> > Currently the only use is if dma_unmap() is defined.
> > 
> > Also, fully lock all the debugging tests on the pinning path that a
> > dma_unmap is registered.
> >
> ... 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > diff --git a/drivers/vfio/vfio_iommu_type1.c
> > b/drivers/vfio/vfio_iommu_type1.c
> > index c13b9290e35759..4ddb1f1abd238b 100644
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -67,7 +67,8 @@ struct vfio_iommu {
> >  	struct list_head	iova_list;
> >  	struct mutex		lock;
> >  	struct rb_root		dma_list;
> > -	struct blocking_notifier_head notifier;
> > +	struct list_head	device_list;
> > +	struct mutex		device_list_lock;
> 
> emulated_device_list or unmap_device_list, to be more accurate?

I don't think it is worth getting too specific here, the fact it only
has dma_unmap devices is a bit of a shortcut to save some work.

> btw a few lines downward there is already a emulated_iommu_groups.
> the two sounds a bit overlapping given mdev's iommu group is faked
> and singleton. Wonder whether it's cleaner to just reuse the existing field...

The locking is more complicated on this since we still have check
every device in the group if it is opened or not while launching the
callback and prevent it from opening/closing while the callback is
running.

Since I plan to delete the dirty tracking which will drop the
emulated_iommu_groups too I would leave it like this.

Jason
