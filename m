Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3ECB14E34
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 15:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0387110E1F2;
	Tue, 29 Jul 2025 13:15:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PuNjtah8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2074.outbound.protection.outlook.com [40.107.95.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B56010E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 13:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQ8ndPrmMpZvoQl7pOvs2BOvfhnnDp3nyTSZ6WzV/AG+g8ve2dGi7D/H0zztITejlS7k+J60AtsR+nW3KBYJqy371sj3eJvJBA1x+QhlWvUius34RjIrUTD9gQoj0gKL+1TLYEnKmqe6Lc/3KTkU/+7Aahh8y8xYCUAhDOk6AchDg/8yibaTHl0/Kk2wMTJzlpgoWs7+j4VUEi59k1EoBI/tf9U6PGhvtWQ30g+5AaP874GAZH/JUFFU/Z0vSiSBn59FIEU4vUMWVZiFZOjVnq3eo2HEA18gA9aapyQWekbaP216g+0FEdy9AoBRMVhbF0aBs0G1E3cieFexRV9iMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6R2y9MIzKgh4p4crlgJU6iT5Xs9aQTF02KsxIyQvNyU=;
 b=hbpJPkV4NB5Sw0Li2HQNJOeZAOCKxHI0x+1A/F9v/Qtr1CZoWHeHEjI0sfoz7DrthI8uxa2WbZUlJPnKbU+qVjMcryTM95qBfhAb5rp0nqURyuFVAekYyROAtI4Ed7l2+kqDR+KeqgzFvUEc0Qbe4CK++aywDky8BWPiGySO8e+ItHHuHd2k4dQ4YNZFj4qmbnkQDqJcu+GZ3t7bJ0bM41nMrY9NHOgIXPcls4NUs49aZnlHvgx+c2QsiBFL4QX3zbnbkxC+e6IC97UQxDTKboVCEQu3U7TYELzmGESXbHYQgjLXuT5U0vAAtGFKkstLmitc0mL8+a9k7pAL1s3wug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6R2y9MIzKgh4p4crlgJU6iT5Xs9aQTF02KsxIyQvNyU=;
 b=PuNjtah8eZ2aSiZwTEj95uqv+AIjkfsboRn1sKSyuR1dzu7ucahskJUqOsFJqI3mcFll3DOIKFaTkSSJFfQHnx/mHvigXT90CDy9aedRf4q8T2kDNdQlZaER49IzJ9kbel/WV+iABQtGpg8BFMjzDHZuHL3ThUnUkm+gFAcV3yFvUZtj9IsVYsWtcSTWm3W+rOyYzFlkN667rAACBNiAl+Nuf/TeGMqhAsLJ2m4eMUj5gfjImPG50KXwA9OXcft5W7iMBNvXg3UUaYeZNkxZusjOQrP8WmoDyPC/ATcioTGC9lKBVd3ka4oTgcOoU/UR2YzurPJysVbRZbqBbwLNJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MN0PR12MB5810.namprd12.prod.outlook.com (2603:10b6:208:376::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 13:15:07 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8964.024; Tue, 29 Jul 2025
 13:15:07 +0000
Date: Tue, 29 Jul 2025 10:15:02 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 02/10] PCI/P2PDMA: Introduce p2pdma_provider structure
 for cleaner abstraction
Message-ID: <20250729131502.GJ36037@nvidia.com>
References: <cover.1753274085.git.leonro@nvidia.com>
 <c2307cb4c3f1af46da138f3410738754691fbb3d.1753274085.git.leonro@nvidia.com>
 <20250724075145.GB30590@lst.de> <20250724075533.GR402218@unreal>
 <20250724075922.GD30590@lst.de> <20250727185158.GE7551@nvidia.com>
 <20250729075209.GA23823@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729075209.GA23823@lst.de>
X-ClientProxiedBy: YT2PR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::24) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MN0PR12MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a0b59bd-ad75-4999-0cdf-08ddcea1f05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JkAS5HNlkVFre62pZISeLh4GukXjb/Q9HvbyZ/owSW6LO2RXRkxMQEX2P6f7?=
 =?us-ascii?Q?JO0N1bKL31ZEnDo5/0rKWMsG8P8hdpA7E77jR2nUM4EHFXbrPJLIDsdPUGV7?=
 =?us-ascii?Q?SkFi9ypbZhpv/7WQNcLWJ4BlJF0jvAo7/UkBoZo0rkTioYliW8eNzIPK6oDC?=
 =?us-ascii?Q?pBFHLb6+oLodlKksvLmVmz1FoAZqoUI+vEJy0GNTfiHknDIyAkwT/8A+yUVm?=
 =?us-ascii?Q?ra0G5aVAIReH7ERB2tD6FWD253igDUIO+M3BOIh/3Xv8oFV6jLKX89M99pSq?=
 =?us-ascii?Q?ozwjL8U8mW2uxlDdJUZEW7KjEObe3RYeUZmw7rNwhSUTbw0JbDm1ZPj8fdLf?=
 =?us-ascii?Q?6vINXvo0AWUsx9/oCi+qAEcaR1Lj0WxgfRx9XFO6OzHOd8azq8gWaYriiSGX?=
 =?us-ascii?Q?YRyqzswonA0841agpya7gMMEtfsBGYyOjbqnAE5s0SnM0XuBFyyBu4INysVI?=
 =?us-ascii?Q?yeboNcmv+MUwF29FMjxw7TEigHMWvb/+s7emTaiZe7p0CKRcilfwCFEm+mxs?=
 =?us-ascii?Q?Z2WYFHk5LPr/hqgqWHw02SeRr6RYRKtUDBWnPucUxATSmy+m4rb06JtJ7fwe?=
 =?us-ascii?Q?p6mOObJpzRoF9bXiwXYr8wDa05xnvaX/8BYil7Iu1sCQyLXIN6bcqdv/Xflj?=
 =?us-ascii?Q?46wkbXG+4v1gq2vOPiLAtJ0tiPJeINikA1Zic0tVRD826P8NqCjof5oSFI4H?=
 =?us-ascii?Q?a+bBbXv9HhSj9+pyLUoL3jpcjNiVir4q/5gBGC8wNCo5nMazDpX7I8eraLdV?=
 =?us-ascii?Q?8v6z5VAVGUprGlpaN3UmxOrTuKrZQW7GnL9bj+e9t6B1JX/uuAlTc9YITPKu?=
 =?us-ascii?Q?3XTAxg6B/Un7X/TroHM2kPL463I7g0Oz65X1WRzvQcnCR1LN4gMEPIedsyty?=
 =?us-ascii?Q?/OU4dhsW+D1v0uBFEsjgWf5gzVDqXHMtEJbxLvLuF0WC9Dnf2P7Yf31t1QFu?=
 =?us-ascii?Q?3vsY7bLDht9tFNvSbJDQ/1P6vJRz1/IaLC1kQXW3TfSZs1qwQ8lLT9oSGRyK?=
 =?us-ascii?Q?U4n7POPsiKMdlIuqCKDRF/GQtSFQNmf+s7MZ6wllei/wG7MKcHKDD77qCTgA?=
 =?us-ascii?Q?hs9aKdg2jIATPPbi4b4J8MSSC+i+obFjpCUMOzu/c2WLF2cAFCsp+tK6LE6d?=
 =?us-ascii?Q?mQFKvQQflTiivf/w5KOmWWftyF4h046W7pqOIy8YJaVIGNH/jjHeEOQNsKFH?=
 =?us-ascii?Q?1Inv1M4Awod84qGCZ2QbnWkJ+L+g6bX1ktUHlW5UYKKgN3ebpkAvpYjhLZ3n?=
 =?us-ascii?Q?hUV6X2zqeA6XwwaKAdW+4latunKIyF9YQH9xIEs+zcuE/07/lQ+f5mqnObsK?=
 =?us-ascii?Q?LOokDW18XxpKtUcxOU0mcfJm4C3F2vy5XBGrJoBFclExfDC67OQIW/N9JPE6?=
 =?us-ascii?Q?9AeqY27QKrXRIJXD59r7OHedwDo20XzXTgXwZWtG4zcbh+u3a5TKzzfMy0Yy?=
 =?us-ascii?Q?ngO1r4FcNFo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5owiKLb1tyFlILIyxNRcDGfOEAq5B4EP8MakmNt5/DSEj/IaU3HN11FMKrez?=
 =?us-ascii?Q?CbIVA9WsWt+UySx0DPOW9FG9mNlUyXtIdWgmd5tDozmRTs9a8NXtFYULMTWY?=
 =?us-ascii?Q?kpVZQik38sfwcoGN49DEnsVjIIbSl41QqLPRIrGDh46WlrQEmH94piYUjRlb?=
 =?us-ascii?Q?MbZJKKst5cJDces0BAG+w6bkHrcu6dlAeHazS4a9kZXEEG3IoqcykcRBlb9r?=
 =?us-ascii?Q?vfv431qWhQlk/6fFrn4Rq2NLzb0MY8PfhAC4g4tiulOPCxrUDoyhiF64PebT?=
 =?us-ascii?Q?ucOwBHPsjo1owqcyZidb3hLyUC82fFNxj4/3JG00d32n36ki1TN6XEaWEOvX?=
 =?us-ascii?Q?f+FlhZyqwd7i3Zp3RnwIRhwI4ifgRzI6c0zB725WVpbIGZk4KFZCqk14bb12?=
 =?us-ascii?Q?fezasc/Q1bjYi3UcaENcO7f27CcYnZURgG4Pe7fwKzv9aQUuJOWxipQAZkS0?=
 =?us-ascii?Q?pt70OpHtlWw/2qLYEfch9CJL8wTXG+wo5ho8cDk5yCfwBL/f2DJtt/ixO4RA?=
 =?us-ascii?Q?4N7Z/Zxlm9DOERyC3XIQqJuYf1SrmOvJBj9sojSSm5zrCwzFSQ2knNYHkBKY?=
 =?us-ascii?Q?Kv3+jvzVivSufMOxqiGXRlnSwq2TgYgzN9tgPLQBWGWkf42OGxUcEYL/KT/c?=
 =?us-ascii?Q?dlkUgGTaEg855z9ify+QzWoHn6Mou1KqBJAm8lGxbWk9EOAp8BpPfzZSF5yL?=
 =?us-ascii?Q?3+QxACU9aNATUoBT30USR8DNRa7hfV6F6KCiYujhBznLOdh1BOmYjBRMlpGI?=
 =?us-ascii?Q?AWVeK4e1Mdx6nyKfaDZ5J2Df7Ag5e2crCYxhWumdG7YitSQEQH4tjUKApdcr?=
 =?us-ascii?Q?eDlxbkN177uof7mxcovFkzvA+9jeFN3ZPxRB33bFxCKKLuEDsabLkJsEpHKA?=
 =?us-ascii?Q?XTkzjKegkylkXD9psD8bNx+yA1PqIP5PBLijzA4QDvOd/0x18slqutAb5Jch?=
 =?us-ascii?Q?/i/Wa5OB4N2Pu4fByCnR4D9whXjRcaI3TgWssvR7RczLtP47oMXxihDl4c+W?=
 =?us-ascii?Q?OXTDssj5FGTih04mE/pZHpG9N//oiZpFVoeu/a9kVzuNwcD/4F9NmX8B08bF?=
 =?us-ascii?Q?yBP+BKxjxwBcEWBPw1e3Qo03SnGEpHukq75W+a78+y9kOEkLy25fQ/onq+d6?=
 =?us-ascii?Q?PeY17IN5NUNisHALozt+nmvacThmHQPBdI4qQ3byOAnckyB47PrMQNil3j+I?=
 =?us-ascii?Q?hN1vuzX1/YtqAarsxeWB/QB1Pm28u/eM8jDdEapYBdrYpfRmMithiHV8DUJL?=
 =?us-ascii?Q?s2XDT6PchGF9wZ7Z/35mrVLk4o2QXU5Xt+z438xSqf76H3qmrGhkCrLz4dnz?=
 =?us-ascii?Q?vVkv1Af77i6v3cB6VPRrVQdJkYzMBK40+u5kbwwbfScLyU25TX1pS29oMRa+?=
 =?us-ascii?Q?S50N/N3x3sO+MYeQMNSzAnC3JbcPdXu9yfX1Qkj/swVOObzFPt4KLEhE8CIR?=
 =?us-ascii?Q?DoQ+YDh0mWq72FS+Y7IwVZrsyh52Cu9CClo+OdJzgOESltF04zJrtDluAwHm?=
 =?us-ascii?Q?8Hz0lf5VPHspHsdXOkmDqe4RBc4GLu4IX7AemZ9gpF/vTYETplse+i8AlVRC?=
 =?us-ascii?Q?AzbApihL/JShUgO96bQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0b59bd-ad75-4999-0cdf-08ddcea1f05c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 13:15:07.5783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viF4QoAerpzTmA+6p0qC+SdZpGxA43S6TE6dNLfjLOpP3aIN5CRaUd/sP4oF8Ciu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5810
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

On Tue, Jul 29, 2025 at 09:52:09AM +0200, Christoph Hellwig wrote:
> On Sun, Jul 27, 2025 at 03:51:58PM -0300, Jason Gunthorpe wrote:
> > On Thu, Jul 24, 2025 at 09:59:22AM +0200, Christoph Hellwig wrote:
> > > On Thu, Jul 24, 2025 at 10:55:33AM +0300, Leon Romanovsky wrote:
> > > > Please, see last patch in the series https://lore.kernel.org/all/aea452cc27ca9e5169f7279d7b524190c39e7260.1753274085.git.leonro@nvidia.com
> > > > It gives me a way to call p2p code with stable pointer for whole BAR.
> > > > 
> > > 
> > > That simply can't work.
> > 
> > Why not?
> > 
> > That's the whole point of this, to remove struct page and use
> > something else as a handle for the p2p when doing the DMA API stuff.
> 
> Because the struct page is the only thing that:
> 
>  a) dma-mapping works on

The main point of the "dma-mapping: migrate to physical
address-based API" series was to remove the struct page dependencies
in the DMA API:

https://lore.kernel.org/all/cover.1750854543.git.leon@kernel.org/

If it is not complete, then it needs more fixing.

>  b) is the only place we can discover the routing information, 

This patch adds the p2pdma_provider structure to discover the routing
information, this is exactly the problem being solved here.

>     but also more importantly ensure that the underlying page is
>     still present and the device is not hot unplugged, or in a very
>     theoretical worst case replaced by something else.

I already answered this, for DMABUF the DMABUF invalidation scheme is
used to control the lifetime and no DMA mapping outlives the provider,
and the provider doesn't outlive the driver.

Hotplug works fine. VFIO gets the driver removal callback, it
invalidates all the DMABUFs, refuses to re-validate them, destroys the
P2P provider, and ends its driver. There is no lifetime issue.

Obviously you cannot use the new p2provider mechanism without some
kind of protection against use after hot unplug, but it doesn't have
to be struct page based.

Jason
