Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9FEC37CAE
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 21:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1AE10E0D6;
	Wed,  5 Nov 2025 20:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HOYv1YQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A640D10E0D6;
 Wed,  5 Nov 2025 20:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSqF7lJDS1QoEN5y5aXRgcz7mYxm4/E0GOnxRY+EUIaWXXbRIJkWzH5E6kKWMpzSjp0f34pSeyJTVUsyqaDiDrn8XPRDyxRq40P8QwC8P7EemALvXJU3k0iL35keaSUeYtp6eTMG8j4GjyNRHq96VicklroWl9gWZ8R6s14XxIXVTxIhHd4Xn7HX94A4ulHM0OLYpqgdNl92jEYkJSGk+o3hx0WqZO9c1NS71XgBy5dycxsgmxYTJqyQMeN3jxCIUShD+SdU/bIEASkdezxt0tdXY8UvXSSf+Au77pqI06KamV7dRb6RYHQkid507XWSYBYNNPMK8dIUi10wrTK60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/PLHvelvA9WN+eNiDREeeVTIbNzJ4uUXOk+U9j+voA=;
 b=j+IVzoMrJJHmDe+oE3Nq6xiYO8UQe5rzxqUT9I/wtRZbxbEkUekpTEXxFiqxvngVPMCPK6uC5jXScSJy8HygLQkRg7OcjhgkgottOee2P18V7v4ar3H/N4vt8t1ISYr4vLKvxTILeAa8rtEaRG/wS0HP3kwMY7EXKCvPZmJ/raLw1CpcnlT/f++luju3ojMhqLzZqFFUHBfdNhMrjfUzqq4GA1w+dSBjA81/4UauxIbElkWdRj3D8nGno8aWv3X+wVOectHlAy3y7A1VxhCYEyRt+6xg8+e49uPRvtjtfWsjqCMOETiJliHu0qwbuvmIAscgGLxA3z4WG1m4VShHlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/PLHvelvA9WN+eNiDREeeVTIbNzJ4uUXOk+U9j+voA=;
 b=HOYv1YQTnDhQaadOVPD+Snxhogs35RfTrBoqucs5lkJSlyodFXbZttGtRnwOcl2+/WCCFya0wyHDLdoGCTj0XIioK25ky62eADAIpasmJnbLya1FgIL6t5QmGnjB4G83KEUBPVy+HABYCnlsn4LZzMOX8yitrZVmQXeuV1DENzPXjwKPsA8j28aAgvNW0Gd+AOpftq+WShfItNgj6kkB7NGTQ/SRjERtRAAHO/Za1Ipq8zKkRJlVWS5c6rNqmbd8zcro3S19MgwpWHjxKhCxYDl2tzBkKe8SoBDvIcuMg4Nzlo+xmH7vqhE3Ead5f2hw6OJy0eA4C+Rtjz9d6o/nmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 5 Nov
 2025 20:56:02 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 20:56:02 +0000
Date: Wed, 5 Nov 2025 16:56:00 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Pranjal Shrivastava <praan@google.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
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
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 14/22] vfio: Require drivers to implement get_region_info
Message-ID: <20251105205600.GX1537560@nvidia.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <14-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <aQhcOYVbY-LqOjW5@google.com>
 <20251105134829.333243dd.alex@shazbot.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105134829.333243dd.alex@shazbot.org>
X-ClientProxiedBy: BL1PR13CA0446.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::31) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f756b98-ebdb-4400-94b0-08de1cadba92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X70hVLET7k8jdi6Lxme/3L2xkLKrnTyJAer5p29mY5cRXwQ4nQyQb5bWwUHa?=
 =?us-ascii?Q?15f6k52ulR53mYA6XJoHwRUvUxjZRLoQ7ZXnexVvRWK7OqHyjEQmmt4OuGPM?=
 =?us-ascii?Q?YXWoDcxsP2fcShbQsGzNjX+zTdA8js9zWDjN11AwwAh+QWA92i0dvXnfcWoR?=
 =?us-ascii?Q?OOdm1OUxjENrahuS+w88Jk20aUr8N0TjB4eCy95/eJQyDbDH+wEWTUQu6R+O?=
 =?us-ascii?Q?TaygR4SytRr6feTDjFrni3jt+H4CAEGa0XZhPBKxjleko8T3cHRjDFyYG39F?=
 =?us-ascii?Q?cy6JGzmortNt8G+8XvIDeCX4ZQXLHyIIW0ml/G6ZUimq7aypOpG4hp7fJGsW?=
 =?us-ascii?Q?O6hC+LoJC6qAoszEmu8tBbVvdG490hKDuDUCYwNML/7EQmWa6jeqnNUOnmkD?=
 =?us-ascii?Q?uBvulpZygQfl0FPs66eNNq15rPBYD+FzitQAAuV7/qnIdUQtqg2Gtd1yMSOJ?=
 =?us-ascii?Q?P+ZnvtIeCwPC4hGzMtU1eg32nhbgvu3oHpMPnFXXI0IQNQKcPyB0kfs/2Zsa?=
 =?us-ascii?Q?tev9YtrCdOT3Z/fVOpif0/abUi5S6ZOM/w/JzNclv6Q4RbY8dVZqt8p/K4Yx?=
 =?us-ascii?Q?25uiVFDJ+0+2xi06wXeEz1F/JU4zjsQ79V5lNUrmd1RijcoS/+8ZVBFsIFa9?=
 =?us-ascii?Q?2ij0owJlcoupLpp9k9Qw0N7LuO+IGvtXMhmyiy80WvrxMAai1WNh2xjTV09p?=
 =?us-ascii?Q?kYW13Ny1xBvW2WYhT2hrSIMyTFfmqGxoJGR2gCkmtTcgrq9ZK/k17T/55epQ?=
 =?us-ascii?Q?Am/USEnKRVCNLa9smKmwQ9AEGH+31vpWFRL7rMrNODdrovLhhv/1hgwFHSQJ?=
 =?us-ascii?Q?W777fDWpxMDrS5i5FVbyBes3YARRfEVDbU757q5ypFZoqzFtjsT97K6PbzRj?=
 =?us-ascii?Q?xunrdjkZHtagXszA2iPM3OS+M6kDETXFJmEcYu2B7tn2Fn/psHGx54J+JzvL?=
 =?us-ascii?Q?qMJudB4yUmRuQsZKP24w6GZEmVDueNyt5v0/QU9DZ9S1VAnLlcXt+DNBKvHP?=
 =?us-ascii?Q?/7ZXHIcODbe1MjLNg9CUiMYXc7yEzxY+bznYmlnq79oZAFw1Geje+ZBxaGHV?=
 =?us-ascii?Q?MeSmFcDP52YlYmuQC/mqTJSwlTHrGjW8zn2YdyqOqFoJcsc8ZhUBZPurwKHB?=
 =?us-ascii?Q?37oj5wp30F3pRqDM8H5VGlDKhFK2JHWB/+rZQ/bNFfZ+lVia/DmNNDZlxRGH?=
 =?us-ascii?Q?6jwVbM/pyNRRfj6ODOyts1OVc7TH/kzrX7mWWXwTv6C5h+FxRgEEUWzeeT4T?=
 =?us-ascii?Q?nes0LhVtFybhYavdcFaX6gN96rHzD2nGmT5bmCKSrzWIBf8/nXPsXWH4phMu?=
 =?us-ascii?Q?zEGXxzauE0McikewDBFvi3tZfjxTp84D/0yRMKXDyIZU2EkuGOlgCnoGN9B4?=
 =?us-ascii?Q?segeHjz1c+FDEGD2TLW2VVqzjqBe/OeZB51Qojc96GGL5hVnKQDCDnNgkgEa?=
 =?us-ascii?Q?h56FMXtv6O9MEnm8bXjsgTGBQqdlGqeP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4hoc3i0v1v3jxA9plzPHiPWtjAwqH17X+15STc+GleCjdB/i8p9sOBvzVoTR?=
 =?us-ascii?Q?/BkWiQEs80LzdwCFNyAoQXL02x4I4w4Z1xxbZcwT6owOgUzNjBFxYZeB9Fqy?=
 =?us-ascii?Q?+vg69gXj3A/f/zhMFL1lxU+KWrltCSy2iAVYMdlLyZJBoBJPyPkyYjIO9w1H?=
 =?us-ascii?Q?t5kGcAFR+SH6JZb7ewAQb8jXdJ06QuusdM5VVEuC2iL8l8sXU4aTRiU+uFtW?=
 =?us-ascii?Q?JDz3DNVX6LBYxM2LcSwbS69sohavb3E4z2v+PnqIBAtC2Kj3s+wo2pNP8uYh?=
 =?us-ascii?Q?9cWaePMApJ9x/0SvAm3Qmstv+WJ/EAeW+LwGMWyWeUEvlZwWbWHZ64DXYecw?=
 =?us-ascii?Q?xvjZh7q8k4mq7fziHpIpQ4T6MTW4tMlrua6lpLjoeYe9bc1DJ74Tg9Z7zPRa?=
 =?us-ascii?Q?GtsdsyicCQk6FvNqOLoHThfQvJPO03Gbmzy56lBLwdycZ/NxQ7TLWJ+P+mFi?=
 =?us-ascii?Q?D9/QBQLoglXEIelZmi+66dQfzfdR/Frl34ObTekl4uh5T4iQipKR566MYm8W?=
 =?us-ascii?Q?IokXuxDkNPXAGY3z2OdPTvCrXIYqhwJ9OdWOvPqNj2gwMdjZO3LodNMO6Q2I?=
 =?us-ascii?Q?u3DUEP90hFNs6F4VIlw07hblbXG+rUbDTL0CMCO4iRk78z0UDJNz5c+eiwvy?=
 =?us-ascii?Q?ewZ8CgZ5rSVDxyGby4AFX28K2licsBnhJJbpFnRe2y8BBByTvKYSTvmPn8pA?=
 =?us-ascii?Q?2qik7uCc7EXDFLWEW+oNXvdOJ96H08ixeOGMwteBp+2d+7NhHi698tR9q9Vg?=
 =?us-ascii?Q?vtGYCY/Temn5++y+CAWuq5CXKUcghexjci0+L2ULEXDcui05y4VUZf9ZoPS0?=
 =?us-ascii?Q?TzYT5kEvPj5UlG1L1fmWhAp04gV+BJ6R+7W9p4a19/EI4JMhTjzSvBcatMg/?=
 =?us-ascii?Q?048lyJ1srOh7wFbmvkNMYL8uxmUN/JuBYWxxYje0vrHcIR3CEPE8wtU3a2j0?=
 =?us-ascii?Q?s7fkLwhUAcOeWbd78Y+MrHJFpwkVlPMsBQacYq+aKsTlksqtJyDyFjsY9WJs?=
 =?us-ascii?Q?YGqncWJI93KIxxNnO5NpB5s0gvTxxkZ5e++73cCne+B2NmgCU9SQKpYqVoA9?=
 =?us-ascii?Q?+mrMU3O320AumkmU+Nd9RlPSls0Z8DIE18weqVXIcrpwsh0NOpK00dJ8b2op?=
 =?us-ascii?Q?DZChEBsGuNsNZriVV4c1wvmVd2UEhu3a17xn5flInLq12Hb8lnYYJjxc13Jz?=
 =?us-ascii?Q?MMn8znaFhJC8v0MKe+oh3Jm6MpNtLsDWmibfL0wuUZtVTtAJ/7F6zARwCjGA?=
 =?us-ascii?Q?K2248LfC1sSRLeH7zlzbt5fpaHD2hJSGQbRy8zaMci9FFJY3jrtPZvS2mU+I?=
 =?us-ascii?Q?HksFYHDxegfNkyJRJpNCdR3lI8IsBfXahBprwUdRDz9YaLu6dgUmHj0GaqNB?=
 =?us-ascii?Q?axay/Mj1iIIQLhAJ7OyBuWV0b+MQ/WQj3erVej++0RR1EIajz4ghO/gIekRg?=
 =?us-ascii?Q?vlOqVBk5RSFmVHL63tqHOijeNZs5ENgRQncW1xqqnrzE/cZ9mexpvcOT508v?=
 =?us-ascii?Q?RI7hl6KUIe/4tQbQsbEF7IfafipOVc0z/6+k8oVOFbanzFq7quzY5Lflonsg?=
 =?us-ascii?Q?H82yreXd3e0lIYFfsQg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f756b98-ebdb-4400-94b0-08de1cadba92
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 20:56:02.0989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VyflITYtGitMmXnfQJZf8s0XVQF4zPSBCIZ7m9l6sNPD/HVbIT9rY9qJQeL/ftzT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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

On Wed, Nov 05, 2025 at 01:48:29PM -0700, Alex Williamson wrote:
> On Mon, 3 Nov 2025 07:39:37 +0000
> Pranjal Shrivastava <praan@google.com> wrote:
> 
> > On Thu, Oct 23, 2025 at 08:09:28PM -0300, Jason Gunthorpe wrote:
> > > Remove the fallback through the ioctl callback, no drivers use this now.
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > > ---
> > >  drivers/vfio/vfio_main.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > > index a390163ce706c4..f056e82ba35075 100644
> > > --- a/drivers/vfio/vfio_main.c
> > > +++ b/drivers/vfio/vfio_main.c
> > > @@ -1297,13 +1297,13 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
> > >  		break;
> > >  
> > >  	case VFIO_DEVICE_GET_REGION_INFO:
> > > -		if (!device->ops->get_region_info)
> > > -			goto ioctl_fallback;
> > > -		ret = device->ops->get_region_info(device, uptr);
> > > +		if (unlikely(!device->ops->get_region_info))
> > > +			ret = -EINVAL;  
> 
> Nit, typically I would have expected a success oriented flow, ie.
> 
> 		if (likely(device->ops->get_region_info))
> 			ret = device->ops->get_region_info(device, uptr);
> 		else
> 			ret = -EINVAL;
> 
> But it goes away in the next patch, so *shrug*.

Yeah, still I can edit it..

> > Nit: Let's also add a warn/err log here highliting that the device
> > doesn't populate the get_region_info op?
> 
> Are devices required to implement regions?  If so, it'd be more
> appropriate to fail the device registration in __vfio_register_dev()
> for the missing op than wait for an ioctl.  However, here in the device
> agnostic layer of vfio, I think the answer leans more towards no, we
> could theoretically have a device with no regions.  We also want to be
> careful not to introduce a WARN_ON that's user trigger'able.  Thanks,

Yeah, I had the same thought, so lets leave this. If we do want a warn
it should be in registration.

A device without regions does not seem useful, but also it doesn't
malfunction if someone does want to do that.

Thanks,
Jason
