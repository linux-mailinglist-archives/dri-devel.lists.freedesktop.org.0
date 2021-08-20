Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61393F3166
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 18:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9806EACC;
	Fri, 20 Aug 2021 16:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 499CB6EACB;
 Fri, 20 Aug 2021 16:18:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJBmUWWZNtJ50x7gwivykWZRh3NsYZZQvk5iWdLcXJCXtV6BFtvMKAlJ9taGXkj3PjhOUDEX0epdNiZ9qKHnBT6bRGutgPYHKUwN9mMrfHobkAiQCJ5EY4Ss2VO/lFPhV/+mphKzz+1jHf/5NMphWKSET8eWIP7wMOcJyRh2UFmYEmKSJu9eYpTH7WtlkuuBCJfZ3Q/zHYhFFVAPKoHxvBBpPsXm55PDlZpJdXXKhTA/x0vr9xJDZsmxtib9m2sTCBG7nl7bQscma5CIqGBkqdlRn5wS9IRbTG+v8kZYwBrTgaxeQH318GJ47NHkDink7xWwLekP2EOhhjS/oUhWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+WaNLdz7enwSthT4xXgeGdAE/539Ks9FMXd5VQbbew=;
 b=RoiVb//VNBCkdUZdyERChxB8/6HKwvkPOAdm2c+BTHmbA8ZOiQiUr1mojcqDNX6vXV8rUKSIEU28VtJdRZVI6RFCyvjZEf0sH86zyqjsa7fIMSsP2y5OdptbRsnNepVHUjKz0hh9py46Eg/FCZSa24OhOg3gsf1+Um+uxYRPFL5Fo6tINej7JKoUxLNiscxcgF+V0M/bhV9OqLd69TWhmysOrRTNXdf56U7Jvb8WDxMTxpnDflcSmJXngeGx6o7Fh8fC/C9lf8Cswk2wxJTz0dH8PnAbM1ldDM461z9K8MncyKmNisw0a3bmcoYE7AncRrYfYKfMdtb+gXEItzaKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O+WaNLdz7enwSthT4xXgeGdAE/539Ks9FMXd5VQbbew=;
 b=rYjSLNeLnGVIVExf+LTmz/tPoTIFm843QB/t9WHOzpQTsuFURLGF5SC0PwybHZiDJZTnZ1Vby1BWP0l1j4pyMyMRRuiG7MDKY4pqD7lZ4Nuyg8f1UNJONs5kUNIPGDA0uQE2SYENsBz8DNMlu/bTMT9T+6BeicQ5uF1fwM7DqJQ3jhdMw17+nuI6zsEkn7ukiSnDSphxbUyMaEJ8xWTZXyaMrn+6cfCvoEGeEbZWtiUrVf2MSf2sMMxuXh2VMHcMPjiqBHlTtm/sY3A0sG6nS/VwfPJW+glDtH79Iwyc3h6ASHzKngl++Or9AYEn9WnbYsqRuIfqTgOxcOl/MPRBnw==
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5333.namprd12.prod.outlook.com (2603:10b6:208:31f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Fri, 20 Aug
 2021 16:18:28 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%8]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 16:18:27 +0000
Date: Fri, 20 Aug 2021 13:18:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>,
	Christoph Hellwig <hch@infradead.org>
Cc: Doug Ledford <dledford@redhat.com>, Leon Romanovsky <leonro@nvidia.com>,
 Ariel Elior <aelior@marvell.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maor Gottlieb <maorg@nvidia.com>, Maxime Ripard <mripard@kernel.org>,
 Michal Kalderon <mkalderon@marvell.com>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Mustafa Ismail <mustafa.ismail@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Shiraz Saleem <shiraz.saleem@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Weihang Li <liweihang@huawei.com>, Wenpeng Liang <liangwenpeng@huawei.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zack Rusin <zackr@vmware.com>,
 Zhu Yanjun <zyjzyj2000@gmail.com>
Subject: Re: [PATCH rdma-next v3 0/3] SG fix together with update to RDMA umem
Message-ID: <20210820161826.GA532091@nvidia.com>
References: <cover.1627551226.git.leonro@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1627551226.git.leonro@nvidia.com>
X-ClientProxiedBy: BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::14) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 16:18:27 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mH7Du-002Ecy-GV; Fri, 20 Aug 2021 13:18:26 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd09b723-71e5-4f32-cb06-08d963f6247a
X-MS-TrafficTypeDiagnostic: BL1PR12MB5333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB53339187676BC2C13D537A04C2C19@BL1PR12MB5333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V60BcVt50viD2uc19gWX2C2sMhYJLEBIzKvhxYSk6Lja+Ye6vBOdlQIcZaZ+dv/eWCn8QXoNDa2gR1LuxWIP4JIq/UTG+73+hL8KBA70hq+3ZUrsxIzMXtVrbUFiy4sU9VRbhCMTK7nTqAQEFiLpC/Z3ZKgb+m80run54KicYSkbPusjqDZRVoGEbXBQm/2WZgYUZVA5uhfV2Wtzge0v1oE0zczDn5eX3wUB/cTBJJOgFTMvaHQFba264T40TWKZCbp+qKFjzVlPpRH+2JZ/AvERa/s9Yn6QLjKh8emq40hrADHCPvkXqdNmhJd0SxT1ieO3DvXsw22PF0QK3AiCakld+F9mfBeP87weJL48sgI/w5bhkLbOZtKVBRA8QEJdXxBTr9WSef/3wuOCF5db2bRtRFFG/5bb1thP3s8loe1BIbT3wV4MSWxC90ZzJq67Y+Ux5kKbhoxfssEfsCHQsdhFJYrYWIkVpxPrX9FpvnBVeGDVIP+TyG5hPGQUmBohK/SEqVE8byL2e1cIzE52rk05aEqTkT8MCaWjp7t4x+4OAuwVM+bTxzBuJ6VotTVBq4Yz1rxpnDJgUk0T+zVbuWs/kdYn9UA4Dy/3SYIf3XfqFyM0uytARn0a0dLXmr06DKGLcsY4goPzSuai243EzcVd/Qncc2PlQJOWTZWJ1m2bcK0djSrh/O7qyUSma8p7E9sGP0SpFJgMmoZF3Py/j1qbJwlPU4dtbfqVsMNXCNH8u/3BaVJqI2uikiBlBJ6p1YWCHpeYNGzcrvevq8gFW7Nk2N2/pvwHGvcQEzDjYuoXThQFoHCCHz10qhyQBDzq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(9786002)(9746002)(66946007)(66556008)(66476007)(478600001)(316002)(110136005)(54906003)(36756003)(38100700002)(4326008)(5660300002)(15650500001)(1076003)(8936002)(8676002)(966005)(83380400001)(26005)(33656002)(2616005)(186003)(86362001)(426003)(2906002)(7416002)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f+45o8xnYvghp+vcQoJ+ZnA8lYwWey/SSNPzqdP0MiGZt80Fg52ddOnYB7ko?=
 =?us-ascii?Q?VbzicuUjlr+FpLIQlTJXr1CXAoCAEGmY2Y2tymjULsF/Nw9k6v8Y2MZJUP9+?=
 =?us-ascii?Q?6thIU52s2tjgKLWmxe3STWgLi21wT0r35dS2ohIDaglyp4gBhJwd0gEMFIZJ?=
 =?us-ascii?Q?4lWUrnuG8rhHhV4d401SilLd4p0upoYxNyqc24+G55arkbWf68IqdzAlkynu?=
 =?us-ascii?Q?J3gNmx0zWGUiYMWlJcA22gNtsY9DOyhIt7sDuJuklsjfLsRKRVFJW7BCCUyT?=
 =?us-ascii?Q?uJEQ6Ui9TWZ1ft46t4mpLtj4JzcS1Ql6Xfdl0sx/k+u7XnuJV7fGCNIDU1Og?=
 =?us-ascii?Q?UIpZ0b+5rAGtLUfle/htAb7s85y9gMtcyO71GTISb5IEEDwZoYHW8le3Cfbe?=
 =?us-ascii?Q?gbdEoz1GjW7/ZTf107lm3XfbM9u1H1LU74l89BQNBM0E8gvKTyInv4GNPYsY?=
 =?us-ascii?Q?mzmI6QX2GTe55JKKx3g1I7gOaqAbcFtM+DiZDn+hl4Aru6ZK/MMqi1PhUTZa?=
 =?us-ascii?Q?afafKO4W6xC4lOhpZrdypiCdlcs376KvHi+ZQKGgSmDeLKpsUVeuuOY00Bci?=
 =?us-ascii?Q?L6DMHrS8OEQaA/uCBL+O2U1CG5kBfB5iQt5Beco3Fj6qgftO/PjX1EVRCbSY?=
 =?us-ascii?Q?GkBIhUBV1j2sQw7Bra8niZg7KWWj9R1eN0IEUzOPn/cIP40COfL5QoIWIQ43?=
 =?us-ascii?Q?ef/CWyGYqmCg8oItisLokhRFiDdsyo9cOMQq7yK6F1u5LDtxfmNRMgTR5WwR?=
 =?us-ascii?Q?Us5knab6PqYTF4QN4S7VnCdip1EhYdtwhPcdHFomZdOQjey+quG3pP2YslSB?=
 =?us-ascii?Q?VXVDPBxfHxA8cyMikbHrouNw5mUlLV3Rsu1RZocwmLxsrozXmULk7hYLshLp?=
 =?us-ascii?Q?fDjFMmcRqbXc39Jed5gGF6VaJS8D131FHHNsZgH3bAN7ymXy/1FeuipuTRn8?=
 =?us-ascii?Q?voDNRxYL5qPghzY5xRtNByXfROVhcKFPiAPr60Ns3yDcWpwu/8w6mkIIZc5f?=
 =?us-ascii?Q?tCZlPIb6LNzKg8C41FkMiawU42UUVOoBbv0HdZOGACRpaiKcYpFNNozsivoE?=
 =?us-ascii?Q?oECBlepgwEiquOgPthVAuYcAw+xrJK41pSnrixxnYCloqUv5xwJMxYkeFkyZ?=
 =?us-ascii?Q?AxjUYTE5DD+/6tZmCRQibwsV9vEDfDFEa4pbTpm3OxgXXiwdqnu+S7enUlqy?=
 =?us-ascii?Q?OzdDLPpzJZBJixbR8x1s1tYPj5Ra6GZv6XNOIa3o4GV8WwG4OuRgkPXZaive?=
 =?us-ascii?Q?IwAitXxcjB7omN9XigzEKHDSdH5nuaI9K7JgqkvLh8jT4QhYRj6xvZxVstDy?=
 =?us-ascii?Q?HCUP9Td9vSNYQ2G8qAGa7W3d?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd09b723-71e5-4f32-cb06-08d963f6247a
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 16:18:27.7654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5kkE+uWQbuYEzLsxPVfkpsBSkD3s38pKMpFX2BvYSq7PzIbu8zynQnQAe2Tkv1V
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 12:39:10PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Changelog:
> v3:
>  * Rewrote to new API suggestion
>  * Split for more patches
> v2: https://lore.kernel.org/lkml/cover.1626605893.git.leonro@nvidia.com
>  * Changed implementation of first patch, based on our discussion with Christoph.
>    https://lore.kernel.org/lkml/YNwaVTT0qmQdxaZz@infradead.org/
> v1: https://lore.kernel.org/lkml/cover.1624955710.git.leonro@nvidia.com/
>  * Fixed sg_page with a _dma_ API in the umem.c
> v0: https://lore.kernel.org/lkml/cover.1624361199.git.leonro@nvidia.com
> 
> 
> Maor Gottlieb (3):
>   lib/scatterlist: Provide a dedicated function to support table append
>   lib/scatterlist: Fix wrong update of orig_nents
>   RDMA: Use the sg_table directly and remove the opencoded version from
>     umem

I'm going to send this into linux-next, last time that triggered some
bug reports.

But overall it looks okay, though some of the sg_append_table is bit
odd. Certainly using the sg_table throughout the RDMA code is big
improvement.

Lets see a v4, reviews/etc and I'll update it.

Jason
