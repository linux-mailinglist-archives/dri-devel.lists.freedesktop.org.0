Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34DF4B2B10
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 17:56:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACCC10E4E3;
	Fri, 11 Feb 2022 16:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDED10E4E3;
 Fri, 11 Feb 2022 16:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ka1DF9T9TDyU7LaaqQFDT4Q8XVAP0dA5RwmRsKYuw9PDVgzrIkEnWHTDFjZTMoWACsmXAzAlHC/GLawIQHuxiCtWgNGUI7gQOZAQeHLoKxbySmHK49wpAQqNRde9GMfYq4slBW8be28kg3MCkfCGh3ENcohnZsdnIMfCtCQJAw6xxGRhQyV/utR+0HzFGYyJgUTiKWkSxDNvb4vhIIh01eip0p/1dlpkNgwhkoh3ebvHkS1OcCa6n7Br5kMtjrZX6VPps7NTe5CO0X/jjPYwIRwLTncunyHoKHSokWQAUAK7kT8THVN55/LuYjdMZ2FtOj3RK8RtFJLfXdwws4aHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=By3qg0mkZCNu4Bqd0t6KUka99itlYFG0/PNVtXtaFo0=;
 b=OYyM6O/xfUryll72ATIbDgv5BW6pZr6IGBjQxG64caNVC5EnwhiR8Osw/HEQq6U7C41KGVxCOdvQreBOx6Ug0ee3h5jT6l+UFlXEplSQoycY+TaDUlr/0xZ40JnXD3Pu2DSCmKcPbfx0i/0wBDA8rCCkRojMB+rDALFaPDVEnSU4964ZpHkbwLNVTkHWyiQI/Y2tIBX+vyysWRAz7M7lMlgrbF673eXArZTWMe87bQ73klJZ+anc4j42xj7141VWt8Y/lmhasJv3K86+45u8NOQ6OcxX0Gn3qOrua9Y0r/twwosSD4f6FDYXPdBmUkvCvSFJVGLUxp0QJkiUorx6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=By3qg0mkZCNu4Bqd0t6KUka99itlYFG0/PNVtXtaFo0=;
 b=e6S800NXVF7V1H+LBukHOL95AkpWCMaGfJqmxNYzr+LaPxLWUt9WwFgMWV9B/qTUWIToO1OXmfPS1V/NOif1LS3EoSwwQZj277trE/8Kf230jOJyGnozly/8EIR/+jkcO3A0b3HZ/vlPIhJ3o1Eby0CCHfYodqf06zV9gvs1wx8KArus3/lT85sP60TrNi+89pLRqyK/T34ra3fc19vM70sKgZ5E3QAitAoDuhxKCEJoMmdtRrMFpjqOjnCyGaa8g2imdD0hQzKn/ZK91rwlgNPNCT7SFD6ysg0ry0hLM8jndctn075UPVX2S+38d1smxkQbU6aaxum1yHfiMMW72w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MWHPR1201MB0272.namprd12.prod.outlook.com (2603:10b6:301:52::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 16:56:25 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::e8f4:9793:da37:1bd3%4]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 16:56:25 +0000
Date: Fri, 11 Feb 2022 12:56:24 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Message-ID: <20220211165624.GP4160@nvidia.com>
References: <20220201154901.7921-1-alex.sierra@amd.com>
 <20220201154901.7921-2-alex.sierra@amd.com>
 <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <20220211164537.GO4160@nvidia.com>
 <6a8df47e-96d0-ffaf-247a-acc504e2532b@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a8df47e-96d0-ffaf-247a-acc504e2532b@redhat.com>
X-ClientProxiedBy: BLAPR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:208:32a::20) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec207d12-32b8-4992-63be-08d9ed7f70a2
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0272:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0272EEB10BF2B94BBEEECE0DC2309@MWHPR1201MB0272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v+l7VY8sWJx3Jw+BnWuwwCjWxUfgjpA5Wwr4jWpudaE+o1UsW31850DwXlNuOWDsr/JVCemKQYzhANnbNQFw+pXyG1mZWAEDa9+UzISrM9HJHnGiubucUELU7yFzM9/7QJWMCxB2mEz5RHVNTiIE3HsuEhjyxF2dAEyJ3wAxMTDocBBUIJxuJvWXc+661KiJ8Ni0rLjgTKxMmzg8L+7yZJ1Fc8ZBR8dx8EI7KSUx2UWWfCCp2F/0ruao8q4c5b/g7LpKkbaeQWhOn65ZUcUgCxhI96jF+8bFZJps/N8ecq/HhKZrK0VtZfe70iICiRHM3YkGpfljm03sofGsC9Hw34P/18vtYGMaJqTqdxijPOw83XVQ9Qw0WO7tgsoT7Tii1Twba7xtT04Q9azObq4vhZ43xE2yTndnTt0PxoMPaQcw+pmdzyXsyho8sjzyKsKrGNe3NQaRUzHGk7spEIIKbMgxlWj4P9LwZ1vWkqrNqsvcEDNWn7SBvK5grNhHfi1B1VF+nYMKRBY5hkho4LeoFw5PDqacOIxS/rwo9epVh198QUNveiTq4KveH2cUed+GMUbYbbJWVwhT6F5kDOxZt9IeMWl90dfI5cMCOE7Hasbw3hfJw7XJZ8I2yJxAX+U9ahDbqfJQp+4FAVNNYjL5UA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(2616005)(508600001)(8676002)(66476007)(66946007)(7416002)(6486002)(5660300002)(86362001)(8936002)(316002)(66556008)(6916009)(26005)(186003)(6512007)(38100700002)(53546011)(1076003)(2906002)(6506007)(36756003)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4jQWN3+Q5BSU6bBLY7MFuwREZY4ESOKs3pG7gGWIBfMqLl4hgieHYS3zenSl?=
 =?us-ascii?Q?/QCjtbVDeFmFdXQtyYwRvwqsL+coWAkYs8yS0gaiOi7izPm8/mb0UX7ThmGu?=
 =?us-ascii?Q?AtGi64RDBp9GfYXjcYSWbhraSi54jdG9O2RiRr0KcS5RceyZTwnPmR2L2mPu?=
 =?us-ascii?Q?kG/qQlHZyV/hOxnn0vvKeITdk/+nvSWcKk211AIWegcB33vQ6lSsB9C3P9Za?=
 =?us-ascii?Q?3hYr/udVk3FEjKX38ZLSgNZvg8M/R7+zEecRy1fgY7k0SgYD+4pXc+yNmycJ?=
 =?us-ascii?Q?HhEOc/ryVc65XQrL8+GjyIEytUdJZij00WxMVs+Q+bMGacgQV+socaQynGn/?=
 =?us-ascii?Q?NoyMwyJ/Wf85Uy7oY3EHyBDC3AqyjcW7KGlVEnRLMzZ0U0A8Y45mf+o0NGFW?=
 =?us-ascii?Q?hqEZ+/dhjpqlaYBO80L5wvWK70GqjGJcXywdqe2hDhu9EisjAJysxWvNwL7m?=
 =?us-ascii?Q?Rt46kuJCWvkoGyV1EvR9dcEQ5jy6GkQpyaQZYfBvishfTGPD2qzkDegoHfSm?=
 =?us-ascii?Q?6D6h/gCFyWn7wuAJkzDukdvG9gFi0kv2Aka3xc7q+0cA2Ozkz1FkLmP8jjR2?=
 =?us-ascii?Q?HyXlyGCl0SuIrFhpRPkyb9+ApeJHeSQAHGFyZfMNr8Yu6T+UsHJPle0ORmnS?=
 =?us-ascii?Q?HxOTLKoeqpZfultLjSTMFF8jMypD/FI/2E3kC7pDejnqMbWCtf0nMuMujFdD?=
 =?us-ascii?Q?yYVivSKXhgWULXmyljZTzMnwaJ8W+gdOUSBl9qfQQcPArRmowYEzDdT39hwO?=
 =?us-ascii?Q?NIaRVEGaWBTJ7+UntxSNGc//0uWPTfg4q519zjYjFXxvNt658tYVQ9NMkTxx?=
 =?us-ascii?Q?ZQs1ozBwQgTST8NK+iSrbKTQbsR1c39v08NiMcFFhfVsisUfIkMh0JyJG32t?=
 =?us-ascii?Q?nqozPrFgVjP9xQKWPi+XX+1oGy1h2ZWA6hHVCikkDf8tPSjqoCXSTGEFBu7d?=
 =?us-ascii?Q?hy/uaUf+SmFeP4MPp383gGnwgl2d0Loi+3xIc2R68l2iP7+jnbpw+QMqPU/o?=
 =?us-ascii?Q?Zszp1U8Y7bc2lqPulZiygMSCft0TrMkP6se9p9rvusBhVGd0YVjR6whFkr4G?=
 =?us-ascii?Q?kxRSS2NbT8gE1ghUDdPUTQRh5c4qd9WBkkvFGoFHm3Bo4FjRRjS8fQ88ZAmL?=
 =?us-ascii?Q?2MLD+oC80CFvPTxOoPxLFnYGak29cudRkunw5yFVkYkzSAxncC01oN4fpI93?=
 =?us-ascii?Q?Vjk9gKLDAD4iloDq9FyOezWqD3qkCZ2K5n4HG/ZRJrUPIQHMhvmnF4IYw5cs?=
 =?us-ascii?Q?UiClddInNWjDDFWr+5UJfmZ5OJqzKN5NHrHb09h7/6Mu8wWULrMu71J7a4x+?=
 =?us-ascii?Q?m2/cD1AbvBx/ri+p8IFRKCu8Anq+Gr240J6GtZU4Hm1DTWZ1w9blKLLS3maa?=
 =?us-ascii?Q?eX/XostVmah32dAw1H9Utw0n+5tIZDvAwosxoWGauDxuius9HZQvsH6nIf8o?=
 =?us-ascii?Q?BTTPTcm69MeisLrM/QmZAK71PcQCkvV2JXSgMRyZgkVnQ370fu4B1mIUuoAC?=
 =?us-ascii?Q?YO1NyQHpt1DeWGUaxk7iS1zM8BptNiZk4DXZQ5gHdOjfZ0/8m9KvtvwsxrVX?=
 =?us-ascii?Q?ZgTbozP/pQi0lQwNykM=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec207d12-32b8-4992-63be-08d9ed7f70a2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 16:56:25.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhJ2aleoWcKILV1Kyk4ZJfO+yduo2mMiZcVlQBbRCJd3gz2K71CpD3fmhEL1uCRh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0272
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 11, 2022 at 05:49:08PM +0100, David Hildenbrand wrote:
> On 11.02.22 17:45, Jason Gunthorpe wrote:
> > On Fri, Feb 11, 2022 at 05:15:25PM +0100, David Hildenbrand wrote:
> > 
> >> ... I'm pretty sure we cannot FOLL_PIN DEVICE_PRIVATE pages
> > 
> > Currently the only way to get a DEVICE_PRIVATE page out of the page
> > tables is via hmm_range_fault() and that doesn't manipulate any ref
> > counts.
> 
> Thanks for clarifying Jason! ... and AFAIU, device exclusive entries are
> essentially just pointers at ordinary PageAnon() pages. So with DEVICE
> COHERENT we'll have the first PageAnon() ZONE_DEVICE pages mapped as
> present in the page tables where GUP could FOLL_PIN them.

This is my understanding

Though you probably understand what PageAnon means alot better than I
do.. I wonder if it really makes sense to talk about that together
with ZONE_DEVICE which has alot in common with filesystem originated
pages too.

I'm not sure what AMDs plan is here, is there an expecation that a GPU
driver will somehow stuff these pages into an existing anonymous
memory VMA or do they always come from a driver originated VMA?

Jason
