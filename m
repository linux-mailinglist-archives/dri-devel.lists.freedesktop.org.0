Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7945B614B48
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 13:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A850410E3C7;
	Tue,  1 Nov 2022 12:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8872C10E39F;
 Tue,  1 Nov 2022 12:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7FqoG6f21Baxa2xLuqzqhlcyafR8240jGWv5v4+mfJxPFfg3fUeR8el5nIIUJCExketwMYQO00xpv9IYg4/8rHnxcn9YOMOexgPcqALZXo6HpjnEPqIIf1thOy7Ords+UngSI4UBWtpZYdtzF8BqfbDKJmE729CH0im7rQSKcJ5IeyfHrWb5G/cb711PcF6cezGnBDzKds16kQir/PEL5URw76mXTVsQ/3fyMe7Hbx4V2N2prDzBCqXJTa3w7doabNXeYIjqp+N+kXfxfSvRg/a1uCDSnVk+CyEn2iWIitUgIRTzfr/4XxUV8iA0T+0gRIur6S468wPK9FWHBR9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRLJJOmCJeZ5WgtLAuBELzviALX3tZdO6+YfqXfl9u8=;
 b=WECr2qxvvPRqvMfTIlEbyfepxphyP53E6xpSGc8fWxLxmG8IfuZ12wSPrEIJ9A3k5YTUgTLxFsRWaS80skT4z2lIH3Gb/4omra6Yo1hQ6U3LA9KWHO7KkhSfddgBh1H9nQ3kqLcmkOsIWRUg8kExhJSSxyGwYQMUGVwLbTnmT7rECxHsIpwv1xuiB5LnuHzc2bExvv7qNgllNrPcQiSoM2uhEZqUAcOmOFshD/CVEzKPNwGzkE4PF1YzhcZ37S5rbgEM79VSlEfmphHrlXOFwnlgi0ljgs0ih6EPWNnYQY78OCbsj7TGDgRVCBUyy2YrqUJYeJ1jZeZSqxGMk8SUUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRLJJOmCJeZ5WgtLAuBELzviALX3tZdO6+YfqXfl9u8=;
 b=c6PuIxN5c6W3x+YPKxS+86HL7ju0dDh18e1NKqZk+umqoGkNDXoUm2xw3KoSNkKc8bNgVHRL8sDNyOXaCIWMNxHUim2XpHPjGi22+0ddwLc4/P5TIbBph5PrQLm+1vfBckSBHt/jbkauCnCJgXIzgDfxiu8E/jNB1j0N+veDO5zt/94QFbkn2dKNPEmFu241uP5t1jZCl/fUKIZOxF6frxx7lh7jxgaBgNl04H46gDbVbppLhHG7pGGflH/MMZkZ/1nFQDMx1ebf/jiLnW9OE3RnhYm9n70EvFqR4VK0U5795+vDNQIdtZ2/+QmS+0ExKJ9iEbXjCk9lZcOAn4ez9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5897.namprd12.prod.outlook.com (2603:10b6:208:395::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 12:56:11 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5769.015; Tue, 1 Nov 2022
 12:56:11 +0000
Date: Tue, 1 Nov 2022 09:56:09 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH 09/10] vfio: Make vfio_container optionally compiled
Message-ID: <Y2EXae8k+XHolr1E@nvidia.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <9-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB527657F83EA743B2DA888A9D8C369@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB527657F83EA743B2DA888A9D8C369@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: CH2PR18CA0034.namprd18.prod.outlook.com
 (2603:10b6:610:55::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d10d6e3-c6e8-426d-6948-08dabc08735c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xorXQ6PDUnOCjl6xN1qwlD3lvnNRaBHpcCJOSQHfJBkdp6HhSZ2OYjHD+0t8cJqhuyEN/Z5TdiLcdZRVBhGw6z3HLkZop5vxrr2we48Dt4AIMrau3D566Dw6THpvSImmYbz4KcuWAe8HBYvTIzQCBGR0KGCEYR1hgYFUlJJa6pDg2wZDdhucez0ZeSP8bmxvYHgZBeFAjuHdwI8j46keE07Kv8UaK2JDcCdQmoWNA9rlvsx2BQAj3L3+mDtnErMVUg07mfhVirjL3qfeMNl0W3saH+rCwVYqNI8ZEKV1rSoGfOQ4w0WrY2HhLFHoeVLfwnjx9P071uTMtlTofM0Io0AWrk1fuqnLw2pIptWsBbPFGZ0XaP+rLT3vJqhq3DyF1VXjW1rT3fNnMHYTVCTvW3bnvs8Z/A3/6LC5eiB77rZRIm0tQiVY9nXCxi5pFt7pvQ/CpjIIGjWpdiEKyL6u50N1awNMS/tCBkr1XSv0HEpee3DPWxs5YausmYmFuXq/3hOCe13DuoROIVE6UVh+XszFfSaHYTeYrEWlsN9tzIWVlDyZ+xXgYAGbajIJWwwpO70L83E2DpmvjbMvRQQU0MI8FJPW73SQivSA7DqcN1s7CCFU7t0fa99kX7BQ74TWZUJb0W/cED86yQQj65Nfvqk4EMaw94poE6Pqhw10zWVhS5o34kBEG+5HORRTXc5pNgPmQoMJFP77qdu7lPy05tQD9M5yjf6GB5WeEz4k2GG6vp9NlXNW6bhnpU+dfQLD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199015)(4744005)(36756003)(54906003)(4326008)(8676002)(66476007)(6916009)(66946007)(41300700001)(316002)(66556008)(6512007)(38100700002)(26005)(86362001)(186003)(2616005)(2906002)(7406005)(478600001)(6486002)(6506007)(7416002)(5660300002)(8936002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?brnkyZaw3J2bl/EggWDHGkhFJ/D9aaTb5lFGRUcFKbonL6nkGPrqQ1YoALRp?=
 =?us-ascii?Q?wSqvWWCEjm8E1MqGNdqcX8FEVxeYg3GJ1FRP3wyL2V+ZfWs2j5om9HD8OJrH?=
 =?us-ascii?Q?MslJKWrFFQLQMXbo4/FaDKRMnwX4kIq0adWcE3i79LqV0sqiKr9bzT7s4CNM?=
 =?us-ascii?Q?z9qaH5xL0Hna+NSZCS5RHnN35QX2zAjD7oh+g33XnP8SkcI2I5bIYLgL4Sjv?=
 =?us-ascii?Q?cCBKKQegDs/GskNSP5WWVGTwPAOT7pxiFHnXFSPUDkAX6DWSYADvRWfeMK/2?=
 =?us-ascii?Q?AKpxCDWaFbgdHXVPn9euhFDjFVs7vipSjhdewceb4yfP2s+HlbQ4DJHYEluf?=
 =?us-ascii?Q?kU81q0mYA5q8j8SOES7ZOVPXGQXb5AlfEWaRekb/GgwPRjhX4x10j7FkQTEI?=
 =?us-ascii?Q?SrlKmkItRcTT3HfpwqGQ0ldXo5G5mVLBCTj6BNuRG1rSUO58lbVny9sMuqni?=
 =?us-ascii?Q?WTx60EY8NeO4K2po+RrL+FN6R1wyj5r6bG+TXsG7wWpwsvTJanS/zBMWAkaG?=
 =?us-ascii?Q?ghAElsqd0RQHdTLJ3kWyuJ7QEO61d3DNJbmggjtztf5BByutJpyjqWqiWc0W?=
 =?us-ascii?Q?rz0JvV+F9z4Zy0dvAP8csXkpyV58P+QaMKfhvzlATA45Jk7WhG8tDAimzea5?=
 =?us-ascii?Q?Ez/tLHxX9myGOT0htbRD9qeErUosmfNE5agKRe0gxLdCzuTHIMp8rjvwmU75?=
 =?us-ascii?Q?/aFBdSMxzAtJo9iXZNF5s1qTHx3LDEEY0xWApkDCAT2/O4/n3TYiUcAIfPah?=
 =?us-ascii?Q?yzpNpsfPoTEfvpY19NO77NtuR6F4XefDuVt9fI/89a/kcDJupSeaPkIZsq32?=
 =?us-ascii?Q?KUn0RUskfyA4PTuhz/cUQv4Ae/S0t9NSK8aCD/voax1Z83SGOcE9fgBzwcN/?=
 =?us-ascii?Q?zKF2nmR7iytx6MvbIkTOyofcQGeOWW5EZnrEV1X46glEgDLJ+Nb2S9ciO8mz?=
 =?us-ascii?Q?c6wxz18HqC+lITUGb01zp81sxfLjgDRrg8h1BPIcY8kwWn9NXMZ/RxLCWfod?=
 =?us-ascii?Q?Ji77cY5RBGkwJzTLI+bllcnxckLYLAUPByHsRiBUvVCUJFKGlz178l6T9E4u?=
 =?us-ascii?Q?Pbu42Eu4UBTksuQyUx5pC00OePL3UPVU41EU8FFBAvYqzmqPNknzoZ82TsKf?=
 =?us-ascii?Q?lGboMko9gvUnY+ajFFfDDYlrkNId19xPUrPPP89InT0fVnrRFKkySkDvXWvM?=
 =?us-ascii?Q?vlIk2eFAa4DwFGkjNSDIFghjv5TZfuOme+7im/vvaXrqvS8UHEOarEDnKCjc?=
 =?us-ascii?Q?D89qFL44FPxI5w+VVcc1YX+n7nf6bvH3VG4bqmFXRqIqc0OOQ2NCqhNE/T5+?=
 =?us-ascii?Q?Sbn5K9+AvsyesbT8buCE+h5bBauRXnd031TQMAQQzfoXTntfLEllzqY2lA5N?=
 =?us-ascii?Q?szFOn9zloiRPLg2+UbPJEFs/F9fQq9C8ZpjC5HZPFhl9D36bz+pKoZOJP8Gp?=
 =?us-ascii?Q?oQACIOm4vmhAO8X+Mwj+O+9FkLFkkardavOSk8EIwvYQqoD1xSHgLLLJcmYs?=
 =?us-ascii?Q?xKfzcwqIXukDQgBIZkzHCQjIrsGaSk69i0f9/H/CA621gw7/0uP1I738n17v?=
 =?us-ascii?Q?Sa8DPoPnUpnQnpc4JrZozfAoZHmS1heP9YtZMfcF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d10d6e3-c6e8-426d-6948-08dabc08735c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 12:56:10.9886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYiJi77R5AFF01u7wOOQTMHMdsNo3OPHBsXMmTxYZhGTCj9kk4DJJme+QPmo/5Zu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5897
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

On Tue, Nov 01, 2022 at 08:41:56AM +0000, Tian, Kevin wrote:
> > From: Jason Gunthorpe <jgg@nvidia.com>
> > Sent: Wednesday, October 26, 2022 2:51 AM
> > 
> >  if VFIO
> > +config VFIO_CONTAINER
> > +	bool "Support for the VFIO container /dev/vfio/vfio"
> > +	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM ||
> > ARM64)
> > +	default y
> > +	help
> > +	  The VFIO container is the classic interface to VFIO for establishing
> > +	  mappings. If N is selected here then IOMMUFD must be used the
> 
> establishing IOMMU mappings.
> 
> s/used the manage/used to manage/

Done

> > +if VFIO_CONTAINER
> >  config VFIO_IOMMU_TYPE1
> >  	tristate
> > -	default n
> > +	default MMU && (X86 || S390 || ARM || ARM64)
> 
> there are already same conditions for selecting TYPE1 from
> VFIO_CONTAINER. what does duplicating conditions here
> bring to us?

Yah, we can leave this out - this is just the more normal way to
approach this kconfig trick, AFAICT

Thanks,
Jason
