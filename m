Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9711EB1CF99
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 02:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FEB10E1A3;
	Thu,  7 Aug 2025 00:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LCS9QAOa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C4E10E1A3
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 00:02:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzJRsSkuSdwpBC20tXnUgAgWhhCanWNP72ggyGsKCGwjehvFHzKcsNA//8dX8gI+U+Rl1zNzDGVmKwCudCC8cD0HMJ2oxwHfZ4hzsSdMplHno/c0qZEnDLbT1WfY+Gq2IE5i+wOi3TqL6AzxCEUnD+TtHTlDcGuU0wpmaOrZGA/Y4RRHcZwFBb+HQTw0k6azOKoFSlF1qXTICFvoLzEtBX9ELgkpLf6X54xUzT3wSFqUZgh5b+UKCyezd9upAzGt+FFE85e/ttIcnadheSqm2uc3zCRvQgyRv59NFEUQnC2ucBduNiMhaHCnw0HnXXVKSxNn67R+hkXV4+G8uZrcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9BpYJU1q1VVVp9RyKtd/Sa713iezlK0JgA40wwO0EY=;
 b=XeVduyeeJn3nmTcgJIgHp6vOUWPFfvr2nZ+HwaQ/+uE1lRXn3JUenefUHx/3hzOvzAiIHpyQ+6iBEIggn0kXI/C28PlkB7BSLwZ/+4QuuqTCGELmGjUcEvhqlhAz8LvJOwjfkBZyQz9lJEp/Jq+aa9oqSOPVGsqsH3P2Fx/p4f5o9iruxF9cHFKi6rX9Dyh5pIdr5/rCr0GtzPfrDtjE+hrcJK4NQoHE/mN3vwnd1g8gVc5Vjp7HoBvHlKUK45vfTrNVflltSL2sjSkoSKuQIin/yraUu3bzfbCzLY+Zyi5Fyo89s9b9HpDHj3UI9TpVP4lfOZl/tYOiF73MaQr4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9BpYJU1q1VVVp9RyKtd/Sa713iezlK0JgA40wwO0EY=;
 b=LCS9QAOaqsmvX1iJ8MKZO5jDfkc1pQLnHo1RLUgkoN4Ybu39ZRweFejEhOlbCt0txkm3lDPD6QaUcgBDY1tgiE/VEAOtzKG6rQP8anjP17ByEXCsh2pWkcMA+OwRYEEsTKPbA0IoA9WrG7d2bZJ7ZDCVLD3A6sUqdFv/RLOfMtZcnyUqZjgFgWCbKvtGfNFKizvDH8+xPFZHgX15zqZF5JHyHdNMm6T5ABsmAIlwgwNqEO1YIzInCmpR9RVgfcNHEcyGyOdC42bZJtAxXLI2eV81LBJpK9Od8bISlqYB9GholBZv33FAXbw6yOE2RfPA+cnsB4sAsqb9IYpdhv+Eqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by LV8PR12MB9109.namprd12.prod.outlook.com (2603:10b6:408:18a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 00:02:09 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 00:02:08 +0000
Date: Wed, 6 Aug 2025 21:02:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 04/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250807000207.GE184255@nvidia.com>
References: <cover.1754311439.git.leon@kernel.org>
 <cab5f1bfd64becafcc887107bb4386f2c8630ef3.1754311439.git.leon@kernel.org>
 <20250806154214.1c2618e8.alex.williamson@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806154214.1c2618e8.alex.williamson@redhat.com>
X-ClientProxiedBy: YT3PR01CA0121.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|LV8PR12MB9109:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbc89e3-d490-4494-247e-08ddd545a6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OXo7GkDC2PvcuLcpWxpUmMCBklvVDMllEtIh6M/0IaVrAKwpnqkItAHSyNnQ?=
 =?us-ascii?Q?qOb1RJubV1NApWhapU5C5BWLmniml+DljGBCTcnS/b7mRruB+mi1kDbapZT1?=
 =?us-ascii?Q?QrfTZeNkp5CaZfH0tSbq/sHTIahh+LbYR8UaMYWceSTjVWRM/BzM8jPShMwF?=
 =?us-ascii?Q?Q9c/W4su5xZh37TcCXox7ixpjADCQd8ggawHRiFVXrH/xnyc7QIB6qqF7tDS?=
 =?us-ascii?Q?YoL+ht9BSM/aQtAf3f0WGwZIrExlP8sXXQ+E4hKO7l9g3kvv97IuUl0Ijgxq?=
 =?us-ascii?Q?5Ui/Pqa7zlyIInRGGvW4GQi6W3zLKj+pn2htg7spmHFdqL9Ho0cb4hDDP6xq?=
 =?us-ascii?Q?QQ6YcsPHoYTAMENXSK2429GmGUL53iMiA3zDf7zLllDMu6vH/CQtPLjz8si8?=
 =?us-ascii?Q?greSqlMhHacl7KDGHpwbnJNOkf2hcwVlAsFmC9VGreG4l3tRo25eJB7vghVh?=
 =?us-ascii?Q?aXEeiC/9PBpjHVPHD0ZBkrP7Vg0SDweSkyeOpi//CtQH2exjTj6OjDa8l8gy?=
 =?us-ascii?Q?po8nF41aYjo+I7FizxXhRslbnsDST0wAr1KgEPFlV+GB72R67CkGAU4WmC9+?=
 =?us-ascii?Q?G8Tf1M705ue/VvgAl/BD/XxhkBA7YiSli8YRgDLUXvpc0wM5sjC17wUp69fP?=
 =?us-ascii?Q?Bqih7+N4oh6Q7A8TA2SPVWvdnwcfbjdzDW+fpSbH2wweR0sEGD+jGzQZSJeS?=
 =?us-ascii?Q?HaZSqkP0pMRCPKdUp4ukytQvN+BqBIFNNd0udhpNHjsLxYSN/ZomnIdoXrU6?=
 =?us-ascii?Q?AY6hoxwWXuaic8eOuMtAy+hV7x5STwo+htv0JGvIs7KThkfFYxg2GXAP3Byj?=
 =?us-ascii?Q?8UdSvk2wDzzk6Mty/zyoV50zyRuZbCLuic0T09yuq4pXdzFSX8RL11vjloO7?=
 =?us-ascii?Q?9ZOEkB43sSHKJFszxhQLEhjRcw7oLckcP9bxEQBcxWgsrMvctKhiRwVNxKX6?=
 =?us-ascii?Q?FxZHu5i3WcjbHHPu8WDfsIGw5AYPbSaprmRw+Mm6qEUyCu/HVrQC66idI+lr?=
 =?us-ascii?Q?+rLn2iMeyf5RypJOhsGMU4n3tUsgKcfCVSEL3+vuGswzzPw3OtTzC9/bHV10?=
 =?us-ascii?Q?a8bebS3hbI1aOJED0+uefHYi4q6FHjt0PxQQdH6oA1+FXFTGSdCnR1ueWejv?=
 =?us-ascii?Q?+gSQl7GdFMsHtshQXyYW32kpBP53Cz+J75KsypctnIoV7fsgHxmufk+JMQS7?=
 =?us-ascii?Q?xYLXLmP9RABgbw9Q3vwZD1tU6YASAaYcUtsVvx9hwetbvH3G0lPAPtPTjz9C?=
 =?us-ascii?Q?EcjraV0OWUBHAzxnR6S5j2djTi+HOLwODy5IpYkRU4/tnPvz+HwjW4znMHe7?=
 =?us-ascii?Q?XB54W0tJZjCNEPpoRpIWlD2tSc7fgeAbbwq5HLiJEAXQ9kg3UgldzYcgrdCR?=
 =?us-ascii?Q?kHQbL2wAEy5OMF3iXPmDJIrrxLFx/El6hFRoGHlL5D5O/nFbFQQ1Chd7OgQ0?=
 =?us-ascii?Q?We/D5Enm1SU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?07yU9u29SbbgDgbaa0s0BYhIsGM65Ty9jp+rLP6Nr4LfE9StweDQ5iuoOx38?=
 =?us-ascii?Q?V3oKnFAXmpcw4PTSreyAi0DJFyu/th2tyA9Vh1rWmr//C1Btw2xWJ4nPJmQr?=
 =?us-ascii?Q?CCeXvMUWN+xmda4p7cAh7IZhMg5aSkz2GYZpwKs9JqSlYXASDLS7xcW6Lwdq?=
 =?us-ascii?Q?xnsxAq3MoG7FOhqUhU3htJMyMl0jN+CeDkP7RzjaLnPXMTZPHH/8JQvpyr1k?=
 =?us-ascii?Q?gJL03/fKQdYY4mTZPx0z8CF1YFLD2AhLDMdM3aR2ATNyizdNRaSr9WgWDskr?=
 =?us-ascii?Q?EAATlkLmB8wBXjkSXABpKgoSvCugeJI8WgH7DJ2TXWmLUQm9YNqs4t+/0ov0?=
 =?us-ascii?Q?azEE7C6d05ioj9Ch4drJ0aZac8ApxMKk3CmVfPY3awh0bk/AtWpt4dKN00uP?=
 =?us-ascii?Q?ioeOxsPAR5ZVcV/3STEptQ5tI87uwbhM2Vhqi5qfXEAVdLnHhcl/MMBSpjs9?=
 =?us-ascii?Q?DaCxMOPKb7Zw2MXR9TR7Ku591wYPNKFO8lzeHXUtlyZCq4b4Q5Ed1vlpUFwl?=
 =?us-ascii?Q?QNu0LgXYZ70sz5PUF4GdElCxJLMbLhQIS7SVZeYWt25oAqsgeGWhZADUGIK3?=
 =?us-ascii?Q?Q/BND8jrZQfZJS0pAv3cSEjGCmRgKPXec10y/2dtms/+aWbP0H+gYMjQbMM/?=
 =?us-ascii?Q?A/nJc/1UPVLK8L4urgQj6g3huFXUJnmL1u9rtIuDjA+2TBgDwxtZxvU6bAkw?=
 =?us-ascii?Q?h5ijcVTBTvwvKwrddj+j2W+U90FzQVxmoZE+4mUP6Vo+ApRfAXGVH1po9lmN?=
 =?us-ascii?Q?RTJe4Ihu32la0UGEDJoicfMSB9oSL60hHFmzgNnxLYChOM/jlIau/jfdUlFt?=
 =?us-ascii?Q?ivXwAw8vBciUoHuxGAEW9ajI0RqD8G9QwsEo7Q5glvqwFyQ3JM6G3r5Tj8kZ?=
 =?us-ascii?Q?MTKOKMf/jx9R9sls5xuPnwHeMUzNhshlhVAqUk0U4iwNhxg2QbCNSE1AwrJS?=
 =?us-ascii?Q?fIQ5VjI5m5R19b/YVhbTSWS+3q+JvwJZm/aeMYeXu1tqoYVW5d3JAw1UqUQh?=
 =?us-ascii?Q?lcxsPZTcV9H+8gYmeJGVtp+RgppGkMbAjEGJq/ZMGUfqn6pNrj1S/2SgvJMD?=
 =?us-ascii?Q?aIUyvvQRcdtfUgjMACmloXk9udLoKSCsJY33pi69iIpg+9JFPw1N9lPKo8ZY?=
 =?us-ascii?Q?b8Z/dSOIepgcXBf4KMzRvapkh5VUpFVi42jnBGbLhEQMeNHFQL/YLLsGAsj/?=
 =?us-ascii?Q?BownYATT+Re7AIQDYpPu8GN/9upzHedV/uqq8uhkZMebaFS1S6q5SSTT0URf?=
 =?us-ascii?Q?dEumJ5bmYm2cZ6C4XyQfeyAFO+f4PPqoRFGnRUx6WuGDNu/ytEE+o8DVNZ1k?=
 =?us-ascii?Q?x64T2xlIckT+WVHxPcXI83eANxCZ41CJOlnYmntwtGATHKnE4rUwj9XWj8tv?=
 =?us-ascii?Q?OA4HZiGvYtDWSKLe+ZYSYp3dgA2UEbOgHQ2fdvDmI1n5SmH7r8GVsbpBcL/C?=
 =?us-ascii?Q?p3SsKfT7XLfNXnsHOX5t5o+JTeMpAUKy7ktXxvmVrX+wppGawroV8c+QMHT0?=
 =?us-ascii?Q?e/4ZTOK5zDqVl2Ha/2Zhuq5KeoO6laKtnAD/KCnR5ne7WJj9qpH12eMWcTOv?=
 =?us-ascii?Q?TV6xg+1MVqF+Y79Kujk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbc89e3-d490-4494-247e-08ddd545a6f0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 00:02:08.8420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2bhw1jjqSaLhKRrNCTkgHjJXt5dzSnnelSSf7LezGHuUX7YA071SoA1P6o+3ExZQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9109
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

On Wed, Aug 06, 2025 at 03:42:14PM -0600, Alex Williamson wrote:
> > +	p2p->mem.owner = &pdev->dev;
> > +	/* On all p2p platforms bus_offset is the same for all BARs */
> > +	p2p->mem.bus_offset =
> > +		pci_bus_address(pdev, 0) - pci_resource_start(pdev, 0);
> 
> But not all devices implement BAR0, nor is BAR0 necessarily in the
> memory space, wouldn't this calculation be wrong if BAR0 were
> unimplemented or an IO BAR?  

I think you are correct about this.

> Even within memory BARs I can imagine different translations for 32
> vs 64 bit, prefetch vs non-prefetch, but per the comment I guess
> we're excluding those.  Thanks,

Humm, I had thought it was consistent for the device, but I guess not:

	resource_list_for_each_entry(window, &bridge->windows) {
		if (resource_contains(window->res, res)) {
			offset = window->offset;

Seems like each window can have its own offset.

So the p2p should be made per-bar, and hold the bar index from the
constructor..

Jason
