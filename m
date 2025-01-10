Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777B7A09C86
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 21:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977FA10E023;
	Fri, 10 Jan 2025 20:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qmPjGyw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 368B810E023
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 20:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FGUj8KnkFpyPB4tEETeO9UFutJdSJuSc+bnORcVEEUosP8YYjg4SDTOaVJ0LVyaK1YHCq4rFn/Xg9liXgffH0bZFE7vHaoNQGZOqohJh3AkIxrsi3Hwuw0iQZ6w93Juxho4Zhf1v0JYclA4aXOUUByRXEyVXPV+7dysbd4tejcPSxIq4fg88KlL7dV6bEovXJcKZXXjPMpBjZLoMBTtMaKVyM49mVtQmNUawrkefe7T992CxS5A9/UF63XeyhGlmCxbiSoiR4CQ1+Sueq9oCa4bODPzvFpzeRUyby1cnm5YINDxYm4VJ9inT09QgD+YOIfJWutNnJcdxRrpkabFSuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m50YQAmEEbi6CVr6cAF6bJKG0tNOC8rjE1N9CY1ziz0=;
 b=FczKQiV5BUvF1fatsNkKcttFQFc+hp9KCs1DnHFpCgOzUGMFB/+C4Sd2DazOjA367VXtg5ES80RhPr9U+akaG2/tmnMh1J2aKyqw+EpPlkU+zp/bt+NOPc3jVHiT8GUDqj5c8uQPYKRIL9J5PKA647m1owl2al85wzrPlGcLT/tktD+/FFwib59j/IYZFg5shbxL17wi3Lalw7dd8/gjEwq4tHZxTDZLe896ShdEXQtPageLG6VER7mODJP3JRBh8VQm4bc08GpfZNU1Emxq/c7hfpEufroqM0JKLr2JxmbeNIfbToYFNdQqyiuWilYSKWMl+N5J3pQXk8gstnUrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m50YQAmEEbi6CVr6cAF6bJKG0tNOC8rjE1N9CY1ziz0=;
 b=qmPjGyw1YNo+pSSbpNXZRRNCZFyYNlOQJXaQEzjprKN+VnngjXIs85474WGtlpo8s5ge5kRzirt7NwIawy8xGl4usfci7S7V3vm2jN5PaJTXDImT7Vv8RWi5SuWbZwggkwgeOgpqBslkgIsfysBfuxU0KbeqWJm70jW/4lQaOflzGITtCRkdBT+wZSTwq56dKldyO2QpKKbiCQzQcZ/sb3dZZfLDGOWNhRx+KW/jxS6lUwGivsad2CIhxFbj7UqXGTkFYb3SMszKCrOv9D4FnLolzg55jNu+rZKJ+0zupa8jyRr+qO42XX9jcQ9EkQ/qj+7Eg/L438lCfOYrTJssUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SJ0PR12MB6966.namprd12.prod.outlook.com (2603:10b6:a03:449::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 20:38:40 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.015; Fri, 10 Jan 2025
 20:38:39 +0000
Date: Fri, 10 Jan 2025 16:38:38 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, aik@amd.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250110203838.GL5556@nvidia.com>
References: <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
 <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
 <20250108162227.GT5556@nvidia.com>
 <Z37HpvHAfB0g9OQ-@phenom.ffwll.local>
 <Z37QaIDUgiygLh74@yilunxu-OptiPlex-7050>
 <58e97916-e6fd-41ef-84b4-bbf53ed0e8e4@amd.com>
 <Z38FCOPE7WPprYhx@yilunxu-OptiPlex-7050>
 <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4F2X7Fu-5lprLrk@phenom.ffwll.local>
X-ClientProxiedBy: MN2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SJ0PR12MB6966:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aec9c20-c5e6-4e5e-7fa1-08dd31b6c3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zVmcAMMd6AC92pHp8oh1XXwyifiOBPD3fLeYpvSTKUWxk7MB8w+XzeAVqGAU?=
 =?us-ascii?Q?UoF7KuiRoBJ/5lDbAf3MDVQCNwR5uQ0D6eSjaO76bN+jFBsqfQ8krqCAg5lF?=
 =?us-ascii?Q?DXyNBUN33gFopBJKznXhXdgqkRXXhUz+HD1RJhmMq9Y/yEOO6KaNYdWQtUcY?=
 =?us-ascii?Q?4d6ZY/Xi5XXbyj4HLFe7zN7HdcqPnS5INia1osjFhHk+P11pe730IW86BBSj?=
 =?us-ascii?Q?nZl2iKVESD/sHQdFZ1o0x4pfLuayeKoVdgtCmh/M2uA24ZH34mACuyuWGNjW?=
 =?us-ascii?Q?57bZ9DpNNzEFduisszeoCJh2F/WDj6/lE/Mqz+cqIv/+Bcem0f7M3OSVgvYC?=
 =?us-ascii?Q?whxnRB9IBAeOau4UjJrxYFaK4khwLFBeEL78ew3tvqBq5v8FP5kdeggBC3Tl?=
 =?us-ascii?Q?pJ285rG5223Nru5K3ukkt8ZvXz6/xoWagrQJ+ppU9Obq5ae9nwwo7wYoVCIs?=
 =?us-ascii?Q?oGcPkwS9q8dmyGYKLDBL8NW7B4OozH/p4NZ8y52nhWP6bxmcG64+eGnP6ZpX?=
 =?us-ascii?Q?cyRKqTFPqxbCc29bU329H0eFq0RE/3PCLKp6Y8cPd+jTigmXU6nVxdlK4kor?=
 =?us-ascii?Q?SKvDFKHA6Yy01UAAXKs5E5yxnOVWjxSFVvuK7o9/sAVqv6bdF5b0iCdbJRRP?=
 =?us-ascii?Q?sC3QxO7x9+TYWfdKtEkPmvV48cJnLn/VUpKquE0CkkmtPJJNP4K4Ly3ezhrc?=
 =?us-ascii?Q?OzTlvNkjatsZLN6xJANkbnJmqGDvnAyAlIIUNS3B3W5jrcu+fcBZ/sLTPPBN?=
 =?us-ascii?Q?dv9k1ibEv+IhCrJeExVQdgjzngA3JP6I+/ywKANxpKGumSZFs+8YyeeGLrJ3?=
 =?us-ascii?Q?JrTomEzl6D85Vs8eEN2iZalM/OaG9eH7oBKOagYcP6h4yl8EWvd9J8mqaLuO?=
 =?us-ascii?Q?QzKb0/0TbhEInCdnnjAAFNlUvmTQ7LBdR13cDr/S4a87kpfmFG7iedV1mNj9?=
 =?us-ascii?Q?lFgsMdETewKKXqnuAcSieOWYW3iEHI8NXBk4WjSgPgdvWwqlAl07LF6IR3sa?=
 =?us-ascii?Q?WoffJmpKO/C0q6tfajAMQy1DgrP+qUrMDjQeCVTRv2M0PStcQGCmoC1klHue?=
 =?us-ascii?Q?LJtrgHlVhMnU8CQFak8yMtWWiTVcmhblPLtCzYMzOpEE6Ybf5UfEN39tjeRU?=
 =?us-ascii?Q?omkbBmC+jHrMr3FRS2M04zlwUwaLezDlvIP/rTJO4nRZqR0ggJDEwXFELRvu?=
 =?us-ascii?Q?oT57c+9Aus051Io68wQR6YQqyEl9X9HfUX4UpHV4GNsKcoWfI7RfYf2Jfq9k?=
 =?us-ascii?Q?ro2abELw+bLUtI6TktYUSjpGg2So0tj6OcTVv3QJ4T8+6QoaQtIoFMt/6p7G?=
 =?us-ascii?Q?jkFTHT4P0oAHQMRjCd5l/bkbI0lJE4sSEb+ZCfr9LCl3dF7JfjnM2jsN20Br?=
 =?us-ascii?Q?AUufESJw1XpHGIC6MmiauYgZnernVzUeC29ICJGAOlir5GPJmWTnL9eB1pb5?=
 =?us-ascii?Q?ZJ+nmYpYYjI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5jJJU+pNBAkb8tCrMXmu8bSKevXogkcJWi7p/c9Azwe8FqCH5rAyz18mIo0y?=
 =?us-ascii?Q?BeuBSyHpxqDYLT+IfNGYf0hlPN5aHC5jhfTJX9BGz5u9p+MnEUbwGspyEwr+?=
 =?us-ascii?Q?4in7DFlh3LZEUnMncgUfAXvn1dkEOOamFop0LUOxCPwSvblC6JdPNwCfdBDy?=
 =?us-ascii?Q?HS+O5PIr77YIO6e9S2yMI7QukCmd+AAaEmswokBs5wAhUQirfJ+ZuksQTKpS?=
 =?us-ascii?Q?owpmhF1806cxBdFmYl8n92mnAG7xemqb+RrDyzOm3XTAnAO8RegS5gfHIvFr?=
 =?us-ascii?Q?wqWPN/6QSjFv/EwzDqXlRXtzAirrb5hFcYOaCOD70ks9oUS59js6x14p/hUY?=
 =?us-ascii?Q?yyTv5XsWpccUFUBs1Ianp9NdWiqFj29LxQGSbJ8bNsQXx4Fr7Rk9Fqo/eGWg?=
 =?us-ascii?Q?tBlLDC10fs+6V4YTWvO9ARDmREs24rVC5q2drXR0Bi75tEmFBP6m2rjR1H3B?=
 =?us-ascii?Q?5mhOLCF3JzHp7QMS2guuXyu8D6ttJleZPS5cVNjs1gwvuYfyYOdzQbROCwtP?=
 =?us-ascii?Q?Jf52WJAzCkie1elIosmJL68LrbgxUzZBCj9MoFRauMGjjGt7s/huIjJcppl8?=
 =?us-ascii?Q?LGNSjFn32EeQtDQk3NNW23uS1VYPeL4h0UHV4fdTjlH2REmTTriu6VZZGc6A?=
 =?us-ascii?Q?E36qjHk51FBLizQ9yV/pCS3G/JsduoqIPGl2mROV+CaWU8IWBEW6f/8434iI?=
 =?us-ascii?Q?lxDX815Wp4kfq2wXdhzJ3uC7MD530lavAIfo/Lj9X60e4MZaAzkLJE+P4lmX?=
 =?us-ascii?Q?lFEvSycr6Y4Sf85qJydZFzLo3k8YXUE+Z4wQOS2qyoGYK18xCIS+2jsusUsX?=
 =?us-ascii?Q?em38WWX4QCHG0+PTDAgPB7XM2Qa0PmAvTf6vFqNGFq90K4YAl4/LNKNkfR2L?=
 =?us-ascii?Q?iYadB+xhBRS5nMWbx+Y6mWGTNEiM/ca7SnBayrPEft3gdTtRcy5XMUsuS5G6?=
 =?us-ascii?Q?TpXjAceUZj+pqqpW5C3Cy87iGFH7zG0SbrsBQ1ziMDauqYeTGihbmgy5Ncz2?=
 =?us-ascii?Q?GQCEkvi5OukQ0ZMpCMbhM/pTzrusqZUdADAD0gk0ablqgUHOXR07myPoyv+D?=
 =?us-ascii?Q?Qh9n9Mo9ST6toxs9EEhRWZRSoOwjpRIqX9S+6IBfVLnah0agO9mdk8UZtDl3?=
 =?us-ascii?Q?rKCdWLeSHqozpeqSzYnrcTNCl9Uo18rSsbzHP+M/rNtw8D+p3N9pBSinDBMA?=
 =?us-ascii?Q?uLJf7TsmfNPI7uKt68rxS4w1MVB1vc7c45nala4SNh9U0dAfDH3QTvpvnrE9?=
 =?us-ascii?Q?j4aYBF433dn0w8ndcRIIn38v9pgbxe5qNPRSgQ0xGDDD75jnQ7J6OmKYvVy7?=
 =?us-ascii?Q?OZdcjumd9kI4qoWnzCUG4eVleMqPzAFbaahIhoSuk8hlYYJv/YE6K9f3SZhl?=
 =?us-ascii?Q?fuxpWfgRdZrYov+3TWrt39AfzXJUyjsQcRw+WK4W86yIcnxevqGVX2g1RfVt?=
 =?us-ascii?Q?7uYohOoizAxJeZpn5JXMMa3/DzdNO1VL4iMVeHDMIjT/umKCHlu24Zi2Y1WR?=
 =?us-ascii?Q?T920bTp3PzwmZPk9FdmqmBXFnEP7+F7MLe/FIlN9ZzvuaHVncNY+o+aPmgME?=
 =?us-ascii?Q?Cr6+vj7RstDW+QwTIqY9rigj03VkRMPpA4dqZXBU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aec9c20-c5e6-4e5e-7fa1-08dd31b6c3e4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 20:38:39.8194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fKZSPwrK0rseqazA2XkqLeJ4ogZW/eYgD6ke8E64UEJN6G1VxM7LfuNPyzOS4UX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6966
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

On Fri, Jan 10, 2025 at 08:34:55PM +0100, Simona Vetter wrote:

> So if I'm getting this right, what you need from a functional pov is a
> dma_buf_tdx_mmap? Because due to tdx restrictions, the normal dma_buf_mmap
> is not going to work I guess?

Don't want something TDX specific!

There is a general desire, and CC is one, but there are other
motivations like performance, to stop using VMAs and mmaps as a way to
exchanage memory between two entities. Instead we want to use FDs.

We now have memfd and guestmemfd that are usable with
memfd_pin_folios() - this covers pinnable CPU memory.

And for a long time we had DMABUF which is for all the other wild
stuff, and it supports movable memory too.

So, the normal DMABUF semantics with reservation locking and move
notifiers seem workable to me here. They are broadly similar enough to
the mmu notifier locking that they can serve the same job of updating
page tables.

> Also another thing that's a bit tricky is that kvm kinda has a 3rd dma-buf
> memory model:
> - permanently pinned dma-buf, they never move
> - dynamic dma-buf, they move through ->move_notify and importers can remap
> - revocable dma-buf, which thus far only exist for pci mmio resources

I would like to see the importers be able to discover which one is
going to be used, because we have RDMA cases where we can support 1
and 3 but not 2.

revocable doesn't require page faulting as it is a terminal condition.

> Since we're leaning even more on that 3rd model I'm wondering whether we
> should make it something official. Because the existing dynamic importers
> do very much assume that re-acquiring the memory after move_notify will
> work. But for the revocable use-case the entire point is that it will
> never work.

> I feel like that's a concept we need to make explicit, so that dynamic
> importers can reject such memory if necessary.

It strikes me as strange that HW can do page faulting, so it can
support #2, but it can't handle a non-present fault?

> So yeah there's a bunch of tricky lifetime questions that need to be
> sorted out with proper design I think, and the current "let's just use pfn
> directly" proposal hides them all under the rug. 

I don't think these two things are connected. The lifetime model that
KVM needs to work with the EPT, and that VFIO needs for it's MMIO,
definately should be reviewed and evaluated.

But it is completely orthogonal to allowing iommufd and kvm to access
the CPU PFN to use in their mapping flows, instead of the
dma_addr_t.

What I want to get to is a replacement for scatter list in DMABUF that
is an array of arrays, roughly like:

  struct memory_chunks {
      struct memory_p2p_provider *provider;
      struct bio_vec addrs[];
  };
  int (*dmabuf_get_memory)(struct memory_chunks **chunks, size_t *num_chunks);

This can represent all forms of memory: P2P, private, CPU, etc and
would be efficient with the new DMA API.

This is similar to the structure BIO has, and it composes nicely with
a future pin_user_pages() and memfd_pin_folios().

Jason
