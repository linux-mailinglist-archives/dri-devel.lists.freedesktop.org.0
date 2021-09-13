Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BC0409CE7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 21:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFA56E237;
	Mon, 13 Sep 2021 19:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DC76E22B;
 Mon, 13 Sep 2021 19:24:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpnDoOIXkru/jRLspVz3bPnlu53WbIWuRDGALLyqtGBXJoZdy4gurjYQuG2TblMEm+tOgcJ1rsSCLw0gZZj6xRWDlO57io3OQ6ZGUkm6X3zyKpFv0a6QW9t3v8eGYTd7vgm6aTqtYQw5/nSVJbqIrz4SBjR32rk/upVb40njRBG2y72Pkx59cY72oJFTONGJZzjzowjAuxw5m+9UTlE56C1tahUq9uNZ3/hox49EYrL6GnhzB70AViErvGqGzUxj+MVHqXhi+L6cZmH6GBg5S9krigUOJJx2ZAWrG1CCMUMpSgPJaPS05cjHtuUDhpDlGiIEYWa/1fafwWxQGBR8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=NxQdwY3KBK2uvQ6zOhOYy+6E6Eam8AdjRwpt2W9lfrw=;
 b=h7KhCuSpwGcW4holqmLGDIGpRA45fVq0ybMxWSRXK+xYqzzgw/AN4xmhTVZ2rZWWgUYApK8kHmBbDgKR5eCP9clwGUy5vWmcqBkXH1/rvaSSvBCZDiwxlD+/WG51J3tCX/RrWyseOmWoAbEveaccNqAu4ymsCure65qSWk2NiGpjm85n4Om34OfLRXoMjSYTh9UkG1GI8fQXX9B1BM7fE0sfQlOVrzuxWavvYlhB9aMY4Z65j5RF4B6Lg3mQzBtGscDvmf1LCqvNxNWSiSEcmIubL3ru0lxf5lQTV1a3RfFoavY3J67pNeNzm7YFerLmcNLP17CMngV0lsmx5s5i6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxQdwY3KBK2uvQ6zOhOYy+6E6Eam8AdjRwpt2W9lfrw=;
 b=UEVurqOGPEPYaq63mmoJkS7wwxCayMK/+ayY2R9PRLbZFU8k6ojkVwk01KLkLkkiMAgzU+/qCOaTachs5C3fOri0R+dVaYy+NBraGEIhk5D9oXn2+Rb1SRHBW6URMti0/anXAQKTCQk5LFuZbpBN8zHlfL8RElavCrjxAGhUzaL7hZwMhr/l2nG5r9XDv66SHQxAYpyZuXlpzTCfYU7n2HnAnRFLMx9COcmzREs7ljgq4qGfzJrwQ+FKHAJeVHPqi0nc4KPBZnuiWrp3jpk/EB1aRm+uSeTCNlpQ4qisv1HbnmgEFYRa1c8stlMwDvAkESTnJWQKvSX+H2uYtoQsaw==
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Mon, 13 Sep
 2021 19:24:09 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 19:24:09 +0000
Date: Mon, 13 Sep 2021 16:24:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Cc: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 0/9] Move vfio_ccw to the new mdev API
Message-ID: <20210913192407.GZ2505917@nvidia.com>
References: <0-v2-7d3a384024cf+2060-ccw_mdev_jgg@nvidia.com>
 <1e431e58465b86430d02d429c86c427f7088bf1f.camel@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e431e58465b86430d02d429c86c427f7088bf1f.camel@linux.ibm.com>
X-ClientProxiedBy: BL0PR0102CA0044.prod.exchangelabs.com
 (2603:10b6:208:25::21) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR0102CA0044.prod.exchangelabs.com (2603:10b6:208:25::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 19:24:08 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mPrYl-00HEBt-S6; Mon, 13 Sep 2021 16:24:07 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 403ba96e-8df1-40b2-6e82-08d976ec0f29
X-MS-TrafficTypeDiagnostic: BL1PR12MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5032C1477F1EF2ED95A821ACC2D99@BL1PR12MB5032.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4ysEwtpik3fx36hBT73ZZrPK7rcdSVkKcTjKcksH3MKnoAshBBgMonzacxvwRCFVwIx4FOR9nCcJYDld3Fdi4uM56zLQjC2qNfO1Nm78dQQpfoBrVy1WwCHo9APzEiEsafOeo0zJEmwhwwj9DxYzbuAb3eoA46IgOapu5byst57Ffem2TBN2SknlbUxNGrI2gbk8431jmlQQcs2+zjqG0Dh8q7Hvkp9dfSeynfMk+YPQlTtKRSbdigaDqIR/vKx2+gHByAyowe3FDSiUgzb0/SW1GPDJf9TFYpF7XG3FEzLWlMYLo7SxvsGmfq80KeXsD2FjrRrhfZmLWxRMaVpl1E0VlYzfJ1xulc6zUsvinnqLsk3Zcjw+4htXQtaEJVqblJjPCgpFzTQh0kOsm9gL1DDtHeBZHtNuqNZxS9wBAbL+PXc5r20hXYXCraqyCPWsYdMC0OsEoC1dHA1FMifcx9FCwyZutnoz1KQwy9bS7SfZEMSSRMt5Ajh/ZUz5fI60Nnxiuxvhs1kAQRH0TAJaiR2UJgt/8+DRO5awcGXowc9JHtLYNz+Gm9mj7NU6Ml8E6lUd319OoyQpaUcImxqXLrLvcMEJ3RBv+lm1nO/N7aezwmHDGa+78UZWVMaaTcvrfFF2LwXd26Q0e7dVSxhFuEEP0RD4q/qPKiY4Z4/UVnJGfY2/26EINe5thaUNtVgyrMa2I1VNFdDxw7N8PDeGp0y0Em1U1Gp+D4p6jUnulE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(66946007)(36756003)(478600001)(6916009)(26005)(7416002)(316002)(66476007)(66556008)(426003)(8676002)(54906003)(86362001)(2906002)(5660300002)(33656002)(186003)(2616005)(38100700002)(1076003)(83380400001)(966005)(9746002)(4326008)(8936002)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GTdBOX5KR+NMVQf7QUdWwzbqfGLVaDZntJnZRZ4FO0SJJGQ9CjmoTwtT+GO3?=
 =?us-ascii?Q?QhQf3vzA5uIP/JFM7HafS6PGPdSx8GBBhKu5Ma5wcpFxY6+l8U8fMKosnglO?=
 =?us-ascii?Q?zFtSH/FM2eUS+JM3txD41fYqlgXaH77I6M6gQX8H+WwH1hK0YLANduu3XyQ+?=
 =?us-ascii?Q?xoM0wusRs3XuThQ/MVfyuF9xkQCi0Jeh1JDDGIHauVZChPrnzhbJrhiBwmZ/?=
 =?us-ascii?Q?tYZregpX1tSwWRwt0lYYBQT50yGh35OOoRzqQLO9Je0CWw/62I6sN4Xd2pI1?=
 =?us-ascii?Q?a+6qmL5QmjzcNFCfQgQVn/4oPZBxV+TY7DCKP2XDA8VRKjpFBTEm0xJrahuv?=
 =?us-ascii?Q?Mho+BO3Pr30/EV4bbDRH9nJop5IssKwUSSAH7t7T6WDmB3T1iwGIRDNYWWok?=
 =?us-ascii?Q?y3a92t8SengijNr5pRm7SE6rVPKtGdA7EuiEr6uHiMlg9R4RriltCgb0oOfF?=
 =?us-ascii?Q?Sve3wworOBG+uDLnQZBibkqnHFAX6EL/0feoYIEeurx1g+DQWAHhZWM3gl26?=
 =?us-ascii?Q?6nRBzJnta6/o4v7OPFg1FRJKyv6ySzCNKK06uPDjRlsof2Pxk6+zMCGtS7xO?=
 =?us-ascii?Q?dkTIldtNVSBPpte/uxyC+pB2V5XXDU18UAD28MRSxQ3Xv5Ous8YGR6VbXjXC?=
 =?us-ascii?Q?szEdYvLxN80WaH6LfYgtTzFF41zikTQL0Q69f4Oo45G9ktbBC6Q9+QiFhKCG?=
 =?us-ascii?Q?bxUe9R2be+7D5q5K/N7tMlYuQ+91qARvSJxg/hB4U8AnGul+ThqWG1yGnIxg?=
 =?us-ascii?Q?iR35amffN5N2d95eET77nr0IlV6Xd2egrbI/FHGYrDL4KFpn5q7x6wPpv5Jn?=
 =?us-ascii?Q?+6eLnNBGG5XbehGGHMbn9VM3q8AsewChXW/yxZhSLLmtpl2hMd09tS8flZQj?=
 =?us-ascii?Q?vIVBdcyKRo8Guic1bMeetykcoRSx1dIrUCJPDP8+j78fJaemK0Eb9HqnqAA9?=
 =?us-ascii?Q?Ss7mOsziFelQK8CdzM9fqWyFGGZa2jw/heJhYHxzpUogxbM4nRE5EPynID8r?=
 =?us-ascii?Q?aE97JBA3vytv1k1nZebB9ykbx0gKLvWOMc3ybRRm/bzsXJE7Ztc/7LySCO52?=
 =?us-ascii?Q?HBRugT9xxCSdcnJyIvX4R3EXwhfZveKn0ZOWiQYR8w32rZSgaQVu/rG4LTix?=
 =?us-ascii?Q?EQWXBjr1KCtxdmDJdnNN88byhbOw80nR3jS4jx0wr9mFtn2S/meAzc2N1xOG?=
 =?us-ascii?Q?1UWTr9Azw9OmUYgoWoqV58gvRAQe1dkYq05tIcU1QETKjVXEOPoR00G/kRN1?=
 =?us-ascii?Q?jlwAYmYxNJ3NLnJalQo61AFULKKl3HaarYqKGAvPLXqezoJ5RhNKet930d0T?=
 =?us-ascii?Q?2OEJksh981BnHqo7fGB85/i3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403ba96e-8df1-40b2-6e82-08d976ec0f29
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 19:24:09.0967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKV6trJX1GT9FIFQFzgKOrc+tsouYFCYKDK/SaVKXorb45hrtGxkM8yN3ijD1kzY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5032
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

On Mon, Sep 13, 2021 at 01:40:34PM -0400, Eric Farman wrote:
> On Thu, 2021-09-09 at 16:38 -0300, Jason Gunthorpe wrote:
> > This addresses Cornelia's remark on the earlier patch that ccw has a
> > confusing lifecycle. While it doesn't seem like the original attempt
> > was
> > functionally wrong, the result can be made better with a lot of
> > further
> > work.
> 
> I thought I'd take a stab at seeing how this works with the hardware
> before looking at the code much. git couldn't apply patches 1, 6, or 9
> to 5.15-rc1, but I was able to hand-fit them into place. 

Oh? Thats odd, I had no remarks from git when rebasing onto
v5.15-rc1..

Maybe this is a situation where you need "b4 am --prep-3way" ...

> [   64.585462] Call Trace:
> [   64.585464]  [<0000000000000002>] 0x2 
> [   64.585467] ([<000003ff80179d74>] vfio_ccw_mdev_ioctl+0x84/0x318
> [vfio_ccw])
> [   64.585476]  [<00000000bb7adda6>] __s390x_sys_ioctl+0xbe/0x100 
> [   64.585481]  [<00000000bbfbf5e4>] __do_syscall+0x1bc/0x1e8 
> [   64.585488]  [<00000000bbfcc8d8>] system_call+0x78/0xa0 

I think it is this:

diff --git a/drivers/s390/cio/vfio_ccw_fsm.c b/drivers/s390/cio/vfio_ccw_fsm.c
index df1490943b20ec..5ea392959c0711 100644
--- a/drivers/s390/cio/vfio_ccw_fsm.c
+++ b/drivers/s390/cio/vfio_ccw_fsm.c
@@ -441,6 +441,7 @@ fsm_func_t *vfio_ccw_jumptable[NR_VFIO_CCW_STATES][NR_VFIO_CCW_EVENTS] = {
 		[VFIO_CCW_EVENT_IO_REQ]		= fsm_io_error,
 		[VFIO_CCW_EVENT_ASYNC_REQ]	= fsm_async_error,
 		[VFIO_CCW_EVENT_INTERRUPT]	= fsm_disabled_irq,
+		[VFIO_CCW_EVENT_OPEN]		= fsm_nop,
 		[VFIO_CCW_EVENT_CLOSE]		= fsm_nop,
 	},
 	[VFIO_CCW_STATE_CLOSED] = {

I rebased it and fixed it up here:

https://github.com/jgunthorpe/linux/tree/vfio_ccw

Can you try again?

Thanks,
Jason
