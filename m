Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1763D94C8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 19:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEC56E892;
	Wed, 28 Jul 2021 17:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DD76E892;
 Wed, 28 Jul 2021 17:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjhEqcbnEyciHis/Dsdw1EP2wkCxVc01ww1UW2CrCODACqSZ1/uVAzPPpYWlIlM9zaKyNrc/juj29WLsg0h5X0X3m5ljB//DRuAKOLCLguH91wnJsIBjY5SyF6gsRwcRKOMt3pMxPsiMB3FV9VaxGA2KJkVLXRxqj7IWtauOl2iIdQaL4aa9SJhpgRtl4vh12tel3wqvqtuWAL2WcphhuskPI4xJPQL7u/rnnFk0ikRsIOLhPU8E/m1WUg/MsxkXxqATix2N2vcu0+wruPy2jH0I5HTiPjG7/0D0BMMQUXs9MSd5V6QKoiMjDqAiWimcLBExjBiG7ehuPjX4u1Jauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMal+7H9ey+3mfKZw+6Bwba4tDSBFskpF+luGm4OM8U=;
 b=QGnEzaR6RaigCaJaq9rAIRQiL42/Z9Wl0CvE0beTAUIR7mkPOlacQZ8xxoPvI8sAx4EW4+h038Kqpg4AgNTaXMGR6UBy6kYmN3Afyj5wrTG7i5RxkIBjN6V6Qf0ruHZLpGU+L8cnHNkWnDbsaF8TrNHmFfHX6k5zJamDo8m64yr2J/O3r7TNqTuRaKRC5xfI8CXClrjIerdZ5f20jNQRjnMPJK8KQA0QL5YVEshd/T3tgdnzQWFP/NAy3jUoU9OUFuHnPhbPfQCUNXqnLAuhUrUoB9h9oQLXN5ulXzafHyxoYZej7MmCDrp1rrIamvA251HYYjkOgLEdZlsnjk1k5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMal+7H9ey+3mfKZw+6Bwba4tDSBFskpF+luGm4OM8U=;
 b=huJwV1jz0pZuWv+x5d50puxuRtjv5gnOuRnpQUbZSSYoPcLaRShypaNzYJga2BtiI4qaKkrA4CGups/JKacKmxLHlX9x5OKV9Ibqzui9DmEwiBr2QYQwQAmXg6YkiXVVg590wvzpGXgzHkxuUz7OXTNmLFKjxU1eXOxUp44pHvPyT/1spDNQiiGfH/E99hq6E6CxM8c6hpWKk/lvLjceMO+Jb+jjUHGfCAnOVACZzFFYtsrwo596UN2bpNw73K97CP3NGrXft0NJu/giJtWfaoXA6L/W2dWlPpp9zAir3O80Y07RjpXMQUDD/0C+aPBbkyR+qo03iP55C2F4glCrDg==
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 17:59:27 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Wed, 28 Jul 2021
 17:59:27 +0000
Date: Wed, 28 Jul 2021 14:59:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: refactor the i915 GVT support
Message-ID: <20210728175925.GU1721383@nvidia.com>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
 <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Wed, 28 Jul 2021 17:59:26 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8nq1-009jXm-9J; Wed, 28 Jul 2021 14:59:25 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13bec3df-9234-4460-e348-08d951f170a2
X-MS-TrafficTypeDiagnostic: BL1PR12MB5333:
X-Microsoft-Antispam-PRVS: <BL1PR12MB533353DAF3FE946577E87D33C2EA9@BL1PR12MB5333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIBEkgJb+kY/XegEApMx9rqsXWsBwF85uwOLTPkzqpMoB0fIZ4H9Xomh002K7AX69qFakyHjq5EoKcT36oAEW7Fsj7Qnx2ZyN5onOSuGAPCpqK54gc2VUQ2Xr+2nTu5XYK4cxFI38nVlupylDL0vXr18PR9Ls8WysLLIHwgHE6vExL/O1D99FGRzBBrla742Sa3m0zD5xZtAnLdJbfDGv+Ektt0GBVMBfS5HZ5wzCCXYGZQebR+k7ez5OlokexcNOGcpjJ16nb5w0/Qfl8Up8UfQd9rTPq76lN31Bwhp9M2JcAO7pvPcAcyJ7h8jsAUTEj+zVG05zCcIhIEB8vMapHEr2xGb1dZUXJ64G3T4ZuNF3JqQN4E6AduwaJkSw+Kx1Wbe+evHn0tuuK3HxMrQBpq74Fncs5nepXaAe1bqeG47XJW5RvDpmAsR1+zuRVBRMDOM9mi1AHIWZAoZQ0LRMUV99NrYA/X+A+iXstMdK1mB2YtPLgIAXVi38V+ue6HjG6qRISaovDe/0QGw3LMOGC5lgyYWUtrw4edOEBO1y6xAD4NjHlSF5r30pu1KghROijaKZOGQ/YEiobdE514wiGrp8WOgUeRzT9Mfm/wYsaEvXjn9MFQ4PT6iH+2W0yuPROttZSDJPipPsnwo3nJw6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(83380400001)(426003)(86362001)(38100700002)(26005)(5660300002)(6916009)(316002)(2906002)(186003)(9786002)(1076003)(36756003)(8676002)(4326008)(66476007)(66946007)(54906003)(66556008)(33656002)(9746002)(8936002)(2616005)(7416002)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?om0m31dIh0ZCt2lLZeio190dbGfs+sUWVxPIs3e/W7ri0c+Mfh2FnU5v6Jar?=
 =?us-ascii?Q?8La3xxmBq59Jkl0v4YU6gykOGMhUs8jlYfP9KI6RJokHzSifVRj49o2PV26K?=
 =?us-ascii?Q?174QaCI4JucE2BCHL3/uU5Cm+bOWXGE+Sgmi9pshT+xBeQYFvMZa/zDVSKKC?=
 =?us-ascii?Q?Rkk8bAA3r7U2hCaP67hLpfeYkAmFVSyycL1LgeD2kRZmvhFu67hXTBMgjDNf?=
 =?us-ascii?Q?bD+0iyL+zAaMOnz9O4xdEVHi/PPQG5X//xAEVt3+Lt7QR1wtvv+5667iRx/A?=
 =?us-ascii?Q?f02eh9W2ijIXVN+tntfqtvBqDwthVJc1CcE4wY4T/GkaHs2yWzjqHLbfRK8i?=
 =?us-ascii?Q?XPlOa8XS1+cDYE9e1eIj++IY8Ku4RYALLbhBceiNRlwuzL6+LPqa3v7ssb0v?=
 =?us-ascii?Q?/qXvJ+Pyv+ZR4HB2lE8Wh9avz/n6TbTcmmw9px4pfMgdF+rYEqpUpdNUq1B/?=
 =?us-ascii?Q?K1LqSHUkdoXVXfbRRjzKh3PHl2ZSY3lGtsFTNvJ9rmAsgsvcUzjn9FIYgIN+?=
 =?us-ascii?Q?isNwsXe184bC/XzocyHvqrCP2VhA2T+k1+ETVZpafdUtzTOibw0qdzKKe0WO?=
 =?us-ascii?Q?ybMldNnRepb1pg8hfhSjEmIw6IqgZt5jTkAwYNysPNzGgo4FHJiohJgDUNxk?=
 =?us-ascii?Q?NIqw7SzYCQWoNh9NLZUNofTUdp9yJnhuZR+f9jyscmmAEz1IhvzWYfokJfTs?=
 =?us-ascii?Q?urI+yt1Tq2t3k5G8YSeDMAXOJmnriV6yuhWfkYY2mDHJ57ZvbnmOMVZRqYa2?=
 =?us-ascii?Q?uzScFKhVRVDnqSa2mCzASyECJukb4+MfCvK7Up1Oftndu5oyL+wOcX7o0m3V?=
 =?us-ascii?Q?NqaEEms9HZr1lDNeAHso5TtW70G8of8DFaho3UrjwxTVbNWROpZ2Yi3wu6CD?=
 =?us-ascii?Q?1HQitF7m3NjmSA1aDm+JSXZYn47L/G+BLikJa0i9WB/6mJjcihzJ8w4jlq2T?=
 =?us-ascii?Q?b7EAhOe6uE6vw17YwDx5aah6WtJ8cmpOZr/N0/BouYHlhL9Nyr1+D7GNwtHN?=
 =?us-ascii?Q?n1cjQLo6ZlYUmWkmKDB0YnwetXCjpdwiZBsGqMWY8wJQp/tFVoRUEA7sDbwX?=
 =?us-ascii?Q?N/zKSqji3M/GMBimsiBac/q95hALhsLD+sI9n7PYpFPul/4/R5Ht/gxRTfMJ?=
 =?us-ascii?Q?YMFvJn4lz7sGOdY6RCUXOvURt+f0wd+18UR6LfXGPZihtYv2O1bq9uBTKAvn?=
 =?us-ascii?Q?HVxkobMNDSiznhPsVUaZmD3mtpIKKFe63EmwI+SilV/bUHb2JLS9oO/fg5a6?=
 =?us-ascii?Q?KoDCxLqILPuPN+r5yTTXatkoScN1oagcknx8tBgQSWsRAtshKaHNQNVlcCxo?=
 =?us-ascii?Q?9bbog3xABVo9M4NFHKiJtgpT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13bec3df-9234-4460-e348-08d951f170a2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 17:59:27.0019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHOuypwxk4L8X0mMsK6IemBkkJ20locTm1/t6GPzK53ebFE647LcFys+a3fvOZkd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5333
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 01:38:58PM +0000, Wang, Zhi A wrote:

> I guess those APIs you were talking about are KVM-only. For other
> hypervisors, e.g. Xen, ARCN cannot use the APIs you mentioned. Not
> sure if you have already noticed that VFIO is KVM-only right now.

There is very little hard connection between VFIO and KVM, so no, I
don't think that is completely true.

In an event, an in-tree version of other hypervisor support for GVT
needs to go through enabling VFIO support so that the existing API
multiplexers we have can be used properly, not adding a shim layer
trying to recreate VFIO inside a GPU driver.

> GVT-g is designed for many hypervisors not only KVM. In the design,
> we implemented an abstraction layer for different hypervisors. You
> can check the link in the previous email which has an example of how
> the MPT module "xengt" supports GVT-g running under Xen.  For
> example, injecting a msi in VFIO/KVM is via playing with
> eventfd. But in Xen, we need to issue a hypercall from Dom0. 

This is obviously bad design, Xen should plug into the standardized
eventfd scheme as well and trigger its hypercall this way. Then it can
integrate with the existing VFIO interrupt abstraction infrastructure.

> others, like querying mappings between GFN and HFN. 

This should be done through VFIO containers, there is nothing KVM
specific there.

> As you can see, to survive from this situation, we have to rely on
> an abstraction layer so that we can prevent introducing coding
> blocks like in the core logic:

No, you have to fix the abstractions we already have to support the
matrix of things you care about. If this can't be done then maybe we
can add new abstractions, but abstractions like this absoultely should
not be done inside drivers.

Jason
