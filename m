Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE26858D8DA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 14:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E007D3FF1;
	Tue,  9 Aug 2022 12:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6AB95B14
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 12:43:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOZCGCbtcw+E6ecqBGQ8p5+6CeQ2qMFJX/adoIfJ1xFsqLLQQufvxRJsmkqK6vc9xofRiPy56bD5Cb0SIhgfCtaVaiDu3BZ/VtZTREMCHHdMy44XbSYNOuySQ81gyONrlTCZCbFzCgcEt5PNwmkLplbaV9ISP6iUcIMAxfUi2Imev1ihFnL2VJvTifIGV1zjJAkmOOs2hzDK800aqal+9gMamHYrm0z5/n7wdI1nThmt90rwFIm5ck/QW+WzjKpTtPM6xU0fJONoY8saHlJGB6PEdaUrf4+JLq/j7HzFsDbet9NOMGUi7xw2U9bfHQXcsGJ0OAMfymYF2DJZ49Q4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dUrwIPK/KeGMHlwj0OHqXM3YgXOcCRaBy9NT/Hlro4=;
 b=N2A+POmN5V6CsOQHlnkYN+S4U6wFWU3kMvgAsCVN++ibsLLYnlz27reRIkX+pwJvHxH12TRnPvSMutfgP7wZAT+nF3byOSncuiL3PN51znEJC79r1b2RXOMJU43DBAOWnFKX/cIOl+zFu0gocLlhXb7QxojeInfqx6Q0YxpT+6zrrDnctKUB4JBIvowJs60vPoFRNf5GOU1bgpM8z4Is7IBzznJDXX0hJioc7mgJ8csd/WahH4FSPNDCfbFsDj/3M5t1BXfbI7jWExBWb+rSE3g8AFNBwWOPOwX4G/QXa4JLWvy90VNpXplMq6Za/Vgo83LOtqqtR3qswL+rCG/CqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dUrwIPK/KeGMHlwj0OHqXM3YgXOcCRaBy9NT/Hlro4=;
 b=MftrVn8H1pnJAf0lfa92O3f4bleznpVGBBMhRsS9OKXLMOlizQRl3Rq/ExUWagD4lNBF1IhRgNEV8R3IgYSn/I1PQ8dQBphs4udUkpvX6WhpZ4hZEOiOyY+mB6AKHVXnoIZzWLrdEzg+w5r/wl3ByCDssHwgcLCm4bU2wwpYiliGu8SSGB+oJt4xdkA7pOt9nKpurU+5IPjWMlpGdeRy6je2WHdmK0hoHxDvbLxd+k5JP83Dz7RubDp3kgJFfkuwZsHRTttPhynHvn6mPnMyC5NEBhB7zkiRbHrIkBOnazkq6yJfch9OT9n8gfd8D3ardVJqAVgbq4xr9ibIiyua4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN8PR12MB3347.namprd12.prod.outlook.com (2603:10b6:408:43::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 12:43:42 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372%7]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 12:43:42 +0000
Date: Tue, 9 Aug 2022 09:43:41 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: New subsystem for acceleration devices
Message-ID: <YvJWfS5h2SeWGAEM@nvidia.com>
References: <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
 <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
 <YvFL8/g+xbrhLzEr@nvidia.com>
 <CAFCwf12MFVmBOEMw37Cdh4O3n13LosR4yDi007eH9BhF3kRC4w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf12MFVmBOEMw37Cdh4O3n13LosR4yDi007eH9BhF3kRC4w@mail.gmail.com>
X-ClientProxiedBy: MN2PR19CA0009.namprd19.prod.outlook.com
 (2603:10b6:208:178::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 444d8bd2-6a25-46ae-1123-08da7a04ca5a
X-MS-TrafficTypeDiagnostic: BN8PR12MB3347:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: urDp7oZlKAbisy/o1mV9UjnG93j3e3t7UsvNbHDRkYCQK1fftV71G32z4o6PG5XgsiCPPoibjEiakUzNSxDHL3ESuZSzGuVgJJUTLT6SWxo3TlCHH+loAPWPt3mTCMXrmyChk3zAvhTSt1obos/mUxPhAo73fxZyhuAmq3RFjkzFY30Ujk/bWUhXf6T9wamemPIlpYiDVPs8EWdB36a+X+neYxoww7pAt23ol3boX5y++Ar8fZF1jfSYRmJ6o3rg42hVebvwugRsCtDXFADurU8XzGzkdGtiDOdcD+GZvSCaQlpTeEd2kksxegrddUKZPWmP3fo4QKG+xR/ryVZamz0kKofMDW62KZLhkt9uXPFuslFCPrB5KrUwv6pAOpRZwKGapTdfdZ+9dzHhGRBcbJqlLFMO6ROhv/RzNTZIiJU+XTOhJye/tyzTf0BOTlnWdI954oR9gV/TuklKYZkh4OYnKn2+ujHXUXU76IVIbSu9UpUobwo+IJBl3ngt+H5t5geyWR2YNm90DD3+TbCB6zu5/f2nAnmeejAROdykiH6NQv/usmHi6sa/xl+v5jpEL3nxoGjfIKmtH1VwMYNC0nyGQpk8fzYaAglGcOs5otMStjBoRpwMtwQedSpMoHx4EOwT4kRXLhEtKQjxIWrH1vl8/yEwNIAcjLkrB8Dj/gW1dFaxIg9djpvLK7sIjq8ibEdKX0JCuPiUnKMRJ/iUKmKt/ETU1gfAS9FCzCEgZP05RsUGt/l849WOiKxo1sMT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(38100700002)(316002)(36756003)(83380400001)(54906003)(186003)(6916009)(8676002)(4326008)(6486002)(5660300002)(2906002)(86362001)(6506007)(2616005)(66946007)(8936002)(6512007)(66476007)(26005)(66556008)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oEh995q5vhrlT2p4ivEiHSEw/Edbnu1mReJmBQ530pGn/4ysqSHjAOWXIyXL?=
 =?us-ascii?Q?7bumGLv0bD8inBwZe7juAWFMobt9biaJas3L9e41ZRK61igIOa4vCne55+z8?=
 =?us-ascii?Q?c42DTNFAtQdn9TmbleBFdEVOO3qHHmW3BzUW+2HCkA/5GTt5DLYOj9FrW0h0?=
 =?us-ascii?Q?tfxrKBdAnUoKU7AcebFDgz6QU9NJzIzNaXB1Y+LpFBLfC9gCZAxIW1YqKLJA?=
 =?us-ascii?Q?BgC2UejW2o1TZkR6px1jpQI6OJVgs6ID9GX+5Xj43NrA71u26xlHaZH4mVcc?=
 =?us-ascii?Q?NCMMe0VKLfax/mCl/e1Xmx72KuqGIBoczLl4URM3GIKYoxxaP85cVufuO57G?=
 =?us-ascii?Q?ovRp1L15C4elyT93WCWe7llsFeF9SWOlBSEVsbsApv1n2IBOiJU4oGgFrUIy?=
 =?us-ascii?Q?hbm3yj5ssPTUGvnzr8ZA8Oi/5LhJUQJXgPimEb2Em/ZxyZpKIqXAL21k9fW3?=
 =?us-ascii?Q?udwOAvQez+sxc5ZBp65vcinj9PtQiLmxA2jGFyVusFc/Z3RxinMaLNHMTqnr?=
 =?us-ascii?Q?Dhkgo3APPY247KEv2TuRQLky7M7SXLrEtiUgv6HzDmltXUi/o9/6aMr383iz?=
 =?us-ascii?Q?tEPXKG8ry47XUv6PsWdBdCMTzAwpEmNtpi7pMgqvOoVyB9UFR4gXcDq6Qpcm?=
 =?us-ascii?Q?AdNzZaPywm+V5OZPxGuqyjFMvf9HIPt+7YQKwtpPCN0DXe7D7gRN8/Pl+WFC?=
 =?us-ascii?Q?/YXAkl4RW0mSwsmunaWldnwaSuFnGSB88hybVx0Eq02iCIQCDawpcmcp2bmO?=
 =?us-ascii?Q?v7JCmVpu0r8pSPEFNs9AbPLvUaEBWvQwgx1BMHr6pSwrxE7Zvc7E+Sh2wQ51?=
 =?us-ascii?Q?5imf4WDCx/6bAI7u8Xti1MCaEDDNn2bTl0rsu04MEHehGEjwa3Ho1y/epZTU?=
 =?us-ascii?Q?FVbdMjOqzF0t4FT7bUmXbRoK/KMeaLbn0laG8vJ0dwvQEY7vN/c38vJGyXas?=
 =?us-ascii?Q?Nx4RJNAzuegjXdfhOUna0noYoCJdH3wL+plfySWu/WsrUauETS5lvpRgDh3k?=
 =?us-ascii?Q?h3kbu8/6F7d310gbL52QJAoVgMXU5FPMXlPE0HATIusRrl0xq6ZbAF7nvkfv?=
 =?us-ascii?Q?pjoDQHLjVGIAZ8cIbpanU2mjmKeQRX8zfeYsulG7VtXO4pL1a7IGUB0Mu0wJ?=
 =?us-ascii?Q?eDx+0IYmwbjotljgMZkawc/HGuN7kqodJIP08JcR2T4YrFEzs6AJFOwyP3IO?=
 =?us-ascii?Q?KFvCA8XmVQtSl7Vf/U4Jea/02/p5aPY0fnnwPWZ5vD9j08X3QUrVydBsdRgv?=
 =?us-ascii?Q?dPMBZ+Wtk+0mn3/AZ5z1/ek/O4qXt4k74VxtJCxFt9mzo64xKSm8pIFosGBV?=
 =?us-ascii?Q?IldEm9AubkimtyiGfKH86TzMihfcuUbnNs4t2pHXJS8UXOAu6p0u5hLkC/Ly?=
 =?us-ascii?Q?VqtiarcRuTge91QHuaCaLKffof2vznLwNQp3t+NcMunYESr+0rFIYBnP1fpQ?=
 =?us-ascii?Q?JriVnNQ0gRqYxb2Pkmln9JrAiKDrQDJgD25S8Ikjb0OSti9lNwIa51Ey3R91?=
 =?us-ascii?Q?0YbsdU5hwk1WxWFtKidqXYg+br5tD95Jr5rMMpufxjed2auojuFZNPZsWUr1?=
 =?us-ascii?Q?0HiZmRZ01GM8fjXC8g55kyIdLTv22AkdlMRijxfV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 444d8bd2-6a25-46ae-1123-08da7a04ca5a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 12:43:42.0641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+OR7/zsjcVClj2niiY+UXvk4hSZ3NFFJ3cZEs55uA1LffWAuHzBweVNEVODrVrE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3347
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiho Chu <jiho.chu@samsung.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 08, 2022 at 11:26:11PM +0300, Oded Gabbay wrote:

> So if you want a common uAPI and a common userspace library to use it,
> you need to expose the same device character files for every device,
> regardless of the driver. e.g. you need all devices to be called
> /dev/accelX and not /dev/habanaX or /dev/nvidiaX

So, this is an interesting idea. One of the things we did in RDMA that
turned our very well is to have the user side of the kernel/user API
in a single git repo for all the drivers, including the lowest layer
of the driver-specific APIs.

It gives a reasonable target for a DRM-like test of "you must have a
userspace". Ie send your userspace and userspace documentation/tests
before your kernel side can be merged.

Even if it is just a git repo collecting and curating driver-specific
libraries under the "accel" banner it could be quite a useful
activity.

But, probably this boils down to things that look like:

  device = habana_open_device()
  habana_mooo(device)

  device = nvidia_open_device()
  nvidia_baaa(device)

> That's what I mean by abstracting all this kernel API from the
> drivers. Not because it is an API that is hard to use, but because the
> drivers should *not* use it at all.
> 
> I think drm did that pretty well. Their code defines objects for
> driver, device and minors, with resource manager that will take care
> of releasing the objects automatically (it is based on devres.c).

We have lots of examples of subsystems doing this - the main thing
unique about accel is that that there is really no shared uAPI between
the drivers, and not 'abstraction' provided by the kernel. Maybe that
is the point..

> So actually I do want an ioctl but as you said, not for the main
> device char, but to an accompanied control device char.

There is a general problem across all these "thick" devices in the
kernel to support their RAS & configuration requirements and IMHO we
don't have a good answer at all.

We've been talking on and off here about having some kind of
subsystem/methodology specifically for this area - how to monitor,
configure, service, etc a very complicated off-CPU device. I think
there would be a lot of interest in this and maybe it shouldn't be
coupled to this accel idea.

Eg we already have some established mechinisms - I would expect any
accel device to be able to introspect and upgrade its flash FW using
the 'devlink flash' common API.

> an application only has access to the information ioctl through this
> device char (so it can't submit anything, allocate memory, etc.) and
> can only retrieve metrics which do not leak information about the
> compute application.

This is often being done over a netlink socket as the "second char"

Jason
