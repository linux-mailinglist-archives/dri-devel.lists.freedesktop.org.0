Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2A1C2C680
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 15:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33C210E053;
	Mon,  3 Nov 2025 14:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IRK/glo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013023.outbound.protection.outlook.com
 [40.93.201.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA2210E053;
 Mon,  3 Nov 2025 14:28:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJZ8peV8tj+7euJeVLKV+ZMiwTIGQSHK5cMiUVWi8+q3eyz+21mv+ATtmBL505mum1XD1hxdDMkRiGSfBPV3E27JnMy/aIbmxTyOwxfH6t1ngCddVOdkXrN7T+OnZ9UZbDSwTNPAk4g8Ml+CZCzlyDvi9HYVWQe342vOXLarPnq6BBYpk8sfOXk05+YpvysFF0pXMmGtI8/F44c2n/mwD+z9fxULlsW8caig4F8XxQGSe1VJMIhi06DUIoFncTc1/S2qfGGR47hOqS3luBSyHaZwhzH2RZbnZBj1rGwbB47GFwbrcuP8YM721erQdQwmjOiAOa8O8y4zHXeA8+LPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZD3mXLytW2gxhRwi7fDnTwKHnriSmWiHNjVgeRf4So=;
 b=qdXrtKRi7M2+FGQxxGM75aNwYi8bBBAIwVWXzlDBMHV/v4YVkfuTYOUBWOpB5ltcNMJJBnCHc/lWg1ld1O2YY85ae8Yu6jdQEGoWq4OyK6Tn1dpfUr/d2DHyPGZfAS7z2QDvNi+c6fSqrBC0uwWN4+KnmdwcAfAM40UsJVjSNGv1knvPTyc+oEvCBtuhedKvwmsgHA8cE2e1wQLHCXtmWe8hAWqsUxPMQeF+di8C9B/il39atECT+YRYCzPRpN9SOJmgkk3ZSUVlzaopOhqkZEF6P7melewreAj5jAf41+sSSXZBh+0amhH5DY/Le542SzTtN9Mvs39iKKCWYUWBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZD3mXLytW2gxhRwi7fDnTwKHnriSmWiHNjVgeRf4So=;
 b=IRK/glo29FyX1BByaY//5YUzoHU8L4lCYO57mwAY68+r4orA/YrT0FhKRAeqDbruiwchg0rBh855Avf/JDx+kN8Uu80qHNVW4Wsxeigj10qihH3q4dEfLvjze77el8CsopLaVJzw+hryM3kMCAReRA2Knk6gGJk8RxQ3XXmJfz+vo8ocjon1OpTx5S/LkipkuVdfc9M+byBfFENvBIoIUSQ5xzFcZCQvLcd2ZFsP7Q7nspmVP9Eg0ybOCkyX8035f0LsVSmE/MkczgJxYrZgCQvdzQg54DmwM1077Budx5JAQX/M2flslMK3Y4MQNStJt7jbnni3ID3/nHSHLeIjrw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB8160.namprd12.prod.outlook.com (2603:10b6:a03:4af::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 14:27:58 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 14:27:57 +0000
Date: Mon, 3 Nov 2025 10:27:56 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Pranjal Shrivastava <praan@google.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 09/22] vfio/platform: Provide a get_region_info op
Message-ID: <20251103142756.GR1235738@nvidia.com>
References: <9-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <0815321f-00d5-402c-b84d-99bc862b4575@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0815321f-00d5-402c-b84d-99bc862b4575@redhat.com>
X-ClientProxiedBy: BLAPR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:208:329::6) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: 338a6ced-678a-4c1d-df7f-08de1ae52f05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WCdp6GiuUtxBruj0qOv89UAE5nK2KrvtfkpGPvuQu36+sq4FmIe2pZyAqQbe?=
 =?us-ascii?Q?+tOoW8NZ3GVAsFiQqnEFUi+7Rc5Ni/QQIUZm7lDh0HWhhPnG56Yu+qn867PC?=
 =?us-ascii?Q?qOVzc5Izze0YPBS/iZZv+2ZUaeOhC46Oij0xeE8RjLrEq3nYRKTwyMcjGUxc?=
 =?us-ascii?Q?UtdetfVH1Iymlg/i06ldqoUNQ2rs8PCYvuOsOG4NtLVB/BuE3Es/CQrt0vUj?=
 =?us-ascii?Q?Qba9quVS1PMM3nx+hshxD2OiScsqs+COhdx/7JUEIDKFApzRd8yfWMwQd93n?=
 =?us-ascii?Q?Cj14H8s9MpMDJ7zMHInmqtx/yadtJuEhcslRD3NpaXNyMYn3SK4LSVoGxC82?=
 =?us-ascii?Q?Fp2w47dS7KdBt/oqpNWIifo8RFPq4sHnwsCH0yD/Ev59Tiu0WDY+OlTAOSHm?=
 =?us-ascii?Q?RUdnUsbb5Uq5pyjiAVX95ZZzFzjw/NxKNQ6dMscsp7UfC3dMLvdhZ1MrVCKO?=
 =?us-ascii?Q?87pSX6BjMBbspODBxNvdIWy9PD0RVlex04aZPZKhjfgRoZv6oEDTLcEr149e?=
 =?us-ascii?Q?LQWpB4hRFRkoWoEgoBihGEkYrGYOBuS8egE+pe7zMNnEOkQqAHhU3QW26i1L?=
 =?us-ascii?Q?8VgJi+loGBxag5P8UHka7TUqztCaJwH9c9ryq8c0oCK/ayGe3cpdFsHMc+J0?=
 =?us-ascii?Q?r7N7bslldH52I0tt7xV4so/xUrqpvsVALiqomqVNho1hyRQsYA2y+cH4RtEu?=
 =?us-ascii?Q?aIB3WFxpG+GNjkZwZXtiaspNX73sKRhbFxbDCzMibz/3Q2esd/O1Zp3orQYb?=
 =?us-ascii?Q?baPmJt6t1AtvzGUdCAuG0GtU0Rjl3K5W/CvxvpWBhg5helK1Bp6xEl3g1GIS?=
 =?us-ascii?Q?3WEU8mBfqfXQHjurtDgOdBTXJF6P6n/EF2sH0+JpOiF3UBZ+ap1fvQCKIFX9?=
 =?us-ascii?Q?iinYQdMZcQwERbU/0OTuIQ133sOoXGHOuUBJLEu77YDbrcz9Yd7PSFuKZeIW?=
 =?us-ascii?Q?erEqNWCehGxZQWiG93WAxebexQ92frxMLIbXZxezX8LH/4rVyVDXEmQTaRVX?=
 =?us-ascii?Q?ZX/dxvnaSX4afJmICIdHxZUkBwk1+cnXFxnNSyV3N8La2dlvVw7XSITsGOJC?=
 =?us-ascii?Q?WtV6HI4K+gzwSE15AE7YaQkABCVYfZsukJP83+TTzIB+n0lIYpAIIRlrxaqr?=
 =?us-ascii?Q?qF0vd6WWYgsDLE+7oBG9atPjwcX2JbOLQf0Zr1xTnb4Z4vmZXM7PDOxI5VEz?=
 =?us-ascii?Q?7HpFGO30YeCLHzLUUzcrKxRaBDfZ2HaGhKrRA80DtuGHhw8ncwkFO7OxPWPS?=
 =?us-ascii?Q?iIVkuGgwzsEYZpvqtLYLOet+iSMcU+4ugCEg4NyvFTeC0C+Qvxn5LyyJceRm?=
 =?us-ascii?Q?aEMCHISGIilcfx+YkV9eiZnn7ItcWPWqa5LitS4jfuivSw5tmr5Gn1T10Hm0?=
 =?us-ascii?Q?NbvdEM7xtAejWEZaBqtUC2An98HQaWONFWBSHfZ8VseWIDUSbJdOvbfyHH7h?=
 =?us-ascii?Q?ThLCBxJ/060znEf3T8I98wrBZPjfCKi3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xulFN4rbuz+DtOFoh5M3joBWO8SzRaEM8eIC5bF5tEdVrkh4K1Cs0mHV2lGm?=
 =?us-ascii?Q?5CJl8sECJVaT3oOm7A7lKUqiwqR+RTgqTzPU4SNeuE7IvsI1ItRzuORPExS2?=
 =?us-ascii?Q?mbbqLN9ithl6/WDBSagjGHXHlF18tVQOUzcL1rlhbF1HikLporV2Ik5vy+Tt?=
 =?us-ascii?Q?kzBPCWwwLonqdg7yyiSj4f/ViJRV1A2l7VH104gasPj+toeXvUyC/4nU4BI7?=
 =?us-ascii?Q?vyfw6wV8VrVmBn12eip97fVau0lTiPwLRcMYPsDXj/KwuDa3aSXckdmx0XlN?=
 =?us-ascii?Q?B2W1fBdDvE2/2s8vAN5Iwx1rDKmRfFQwpAqw0w8Wlaq5+ZiQmJ4so0TXPlCY?=
 =?us-ascii?Q?dfKpqOa8d1yPNJjjqhuNFSKkFSmAIQNXx9K/GQqT7taYKnpuzqVpXnvva9E+?=
 =?us-ascii?Q?vN7bS9+KPIHbDn7rlMgxA4P7fhuK9sDzNSyA7clY3XkmMJ+rxSIxEDESKc0L?=
 =?us-ascii?Q?Kx0LQMCupZrYad6JX4oqrlr61c71TlZxQcnd/mpDOKo9ovwvWZHP56ugSUly?=
 =?us-ascii?Q?GhSaaSrFFjtr07dlL/QUAWtYFJAD0K78bpbc5DsppujQeNKVujoiE1Ss6Dqm?=
 =?us-ascii?Q?pmZ0DJZ3IovAiVWU1DyWxag7eUtWwerDkfr6byrgOq5RNz+xFG3I0fiWWGoV?=
 =?us-ascii?Q?rCXXUJnO6f/6f2mgMJNeP08FWcfWrs5+RQEpGtm9IR5MsSOja90AaZ67cVd3?=
 =?us-ascii?Q?M8xEqiVCV4+Rmnaoa/4ZREo5vLsO1LSRUh64uNAUF56Wn27OUQR4Rr0RzPxd?=
 =?us-ascii?Q?ETK/jYMWgLAFStc2UPoKdeGuLpA4EHAF4pGgsEjlhdCxpjDWccpusYRRN0+l?=
 =?us-ascii?Q?uj5vCu9d4uH0k88ZSKxtI3IvFqxtEoyyxj121uBPurW2B0P2/Znd8ydLH/ky?=
 =?us-ascii?Q?UxR2mVS/NSP1qc7bBkyEDP5yXjjoc0umpjnjj+9zjV/6hGOUSJiWdeWdZRND?=
 =?us-ascii?Q?E0j4b5CBy0vGTCXanyZlpDLt7hVrFqa+CQzEb9+1ZQutC1inQELYZeyP2tRO?=
 =?us-ascii?Q?qpgfg/230taHZI0KaAnNdP/R+AdDLe5nTKnVgaopmFHO6OLEcGisro2vv8ha?=
 =?us-ascii?Q?hYDVcrQvlFZpWCSCUWaIwQNFyR9H+oJ2dadoDC+HEbr7ZOPagbpvbxuNMtC7?=
 =?us-ascii?Q?lPPGFlw773d7KEwnVFdCUnEz8JkiVBJ/r8XWNCbyTRM8HTNlmKDI9/MKVjrE?=
 =?us-ascii?Q?gJO5UUERT97VO6Xuq7nbvsspARLdhdxwJlNw90jztujcYjXV1d6Tiv2QTbye?=
 =?us-ascii?Q?tGCYe4Mv/The6GVqqjjOZ8fzIM9zmUuTrz7luOEgio6n0Ybn1bnNP6iL8ubh?=
 =?us-ascii?Q?HeNlo4+Eh8BVlWTZYM4MCNS6KUDaEFti0e8IXHw2e/9qo7pLVj64MBCN4QtI?=
 =?us-ascii?Q?jsnY+gLcQxSVOnFh9hH/3Nf4VK0AyrT2Lzzqeu5xgZcR64WG85N7BlrTLjG/?=
 =?us-ascii?Q?XCp9H9y5vZ3UGU8n5fIuiO5ePk0WVT55+gVo1T21WwPt3e0QvvYZP4j7YmsJ?=
 =?us-ascii?Q?kfiN2WPj6kB0B4MESa1hkF0hEVkM2nPgmoFiUM5hgf98gOa3+5V4fsydwbDP?=
 =?us-ascii?Q?f43nzPswKoaKMznXwwU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338a6ced-678a-4c1d-df7f-08de1ae52f05
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 14:27:57.4255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzMW1OZEPI3Y4JPpL5j/HamJRzuebpcPkGodvnMsRiDG+Gp99clY9CFtDBZN1YiC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8160
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

On Mon, Nov 03, 2025 at 02:59:29PM +0100, Eric Auger wrote:
> Hi Jason,
> 
> On 10/24/25 1:09 AM, Jason Gunthorpe wrote:
> > Move it out of vfio_platform_ioctl() and re-indent it. Add it to all
> > platform drivers.
> >
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/vfio/platform/vfio_amba.c             |  1 +
> >  drivers/vfio/platform/vfio_platform.c         |  1 +
> >  drivers/vfio/platform/vfio_platform_common.c  | 50 +++++++++++--------
> >  drivers/vfio/platform/vfio_platform_private.h |  2 +
> >  4 files changed, 32 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
> > index 9f5c527baa8a36..d600deaf23b6d7 100644
> > --- a/drivers/vfio/platform/vfio_amba.c
> > +++ b/drivers/vfio/platform/vfio_amba.c
> > @@ -115,6 +115,7 @@ static const struct vfio_device_ops vfio_amba_ops = {
> >  	.open_device	= vfio_platform_open_device,
> >  	.close_device	= vfio_platform_close_device,
> >  	.ioctl		= vfio_platform_ioctl,
> > +	.get_region_info = vfio_platform_ioctl_get_region_info,

> Any rationale behind why using _ioctl naming in some drivers and not in
> some others?

No, I was making changes sort of in line to the code that was already
there.. The _ioctl_ came from PCI where I had labeled all the sub
functions that broke out of the ioctl function with _ioctl_ to make it
clear they were part of those system calls.

I guess these can have _ioctl_ added in:

drivers/gpu/drm/i915/gvt/kvmgt.c:       .get_region_info_caps = intel_vgpu_get_region_info,
drivers/s390/cio/vfio_ccw_ops.c:        .get_region_info_caps = vfio_ccw_mdev_get_region_info,
drivers/vfio/fsl-mc/vfio_fsl_mc.c:      .get_region_info_caps = vfio_fsl_mc_get_region_info,
drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c: .get_region_info_caps = hisi_acc_vfio_get_region,
samples/vfio-mdev/mbochs.c:     .get_region_info_caps = mbochs_get_region_info,

drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c: .get_region_info_caps = vfio_pci_ioctl_get_region_info,
drivers/vfio/pci/mlx5/main.c:   .get_region_info_caps = vfio_pci_ioctl_get_region_info,
drivers/vfio/pci/nvgrace-gpu/main.c:    .get_region_info_caps = nvgrace_gpu_ioctl_get_region_info,
drivers/vfio/pci/nvgrace-gpu/main.c:    .get_region_info_caps = vfio_pci_ioctl_get_region_info,
drivers/vfio/pci/pds/vfio_dev.c:        .get_region_info_caps = vfio_pci_ioctl_get_region_info,
drivers/vfio/cdx/main.c:        .get_region_info_caps = vfio_cdx_ioctl_get_region_info,
drivers/vfio/pci/qat/main.c:    .get_region_info_caps = vfio_pci_ioctl_get_region_info,
drivers/vfio/pci/vfio_pci.c:    .get_region_info_caps = vfio_pci_ioctl_get_region_info,
drivers/vfio/pci/virtio/main.c: .get_region_info_caps = vfio_pci_ioctl_get_region_info,
drivers/vfio/pci/virtio/main.c: .get_region_info_caps = virtiovf_pci_ioctl_get_region_info,
drivers/vfio/pci/virtio/main.c: .get_region_info_caps = vfio_pci_ioctl_get_region_info,
drivers/vfio/platform/vfio_amba.c:      .get_region_info_caps = vfio_platform_ioctl_get_region_info,
drivers/vfio/platform/vfio_platform.c:  .get_region_info_caps = vfio_platform_ioctl_get_region_info,
samples/vfio-mdev/mdpy.c:       .get_region_info_caps = mdpy_ioctl_get_region_info,
samples/vfio-mdev/mtty.c:       .get_region_info_caps = mtty_ioctl_get_region_info,

Thanks,
Jason
