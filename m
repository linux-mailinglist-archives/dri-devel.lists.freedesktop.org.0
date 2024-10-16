Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7E9A00AA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 07:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8BBB10E677;
	Wed, 16 Oct 2024 05:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Hg5meADj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A904210E677;
 Wed, 16 Oct 2024 05:30:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAwnqtvuxMIiTTdd2RM0XCkCQ8bXhDlwdAjCgHaCJr+lVoYLBJmURvQU17BPx592qW5J/RhfKXJnZkXPU4cCVj0G9VC2z9QoXLvl8UpObknPY0vFtD0WajTSJ1nLHTNEDtGiXs0AlmhN1xoW0YpSZdZLq27xx4lzQXLfGYgpGirKSGa0rzQrcrQXy8EiKDlHOp+bheRcaMV1q4AWVR8lUSKIRGDNWJ18/g6zdl1G7ti8iHgxRljqq5wDMHUe7i03QEvRlu5GiJGCCPRzuA70HhcfK+633fZaT5E3GS00e/xPEEbBOELV26GP8Z4adb1+fRh6zl6xK3i2V6kiZ/TaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcbxEJeY5WoEjyWI41jM64cvWrbfPwH7JKEGSncEfmI=;
 b=bd8qMNtlmDhw+3hVu1jpmZp8jbltelH5i7h6jeB3VAZyhv6xLp41W0XDZQXEcdRJfeaHRYmG1E5Vj5T7mRl39nLSnztzLs0AGcCBBtdb74CLw8CmRSet8hyqX6+KL/eWc/jOoZXFwWzOtqliq6UkAB4gynzdl2ivlXS+s4bM/XY4VZu4hSrO0TVmMAmu+UzbyWdYsohq4jXhyAw32OGYBFqxkzMc+eviLNBRJmKcjawzVISBHO9luN7HoeHOEbssrZWZ5Mdxem11Q5TbgCK+QEvvBiD3boV0EgQmHDW0QGJTVlFdkK1Neju1HrneJ7VqcALEz01KfBdtdSyHhPt5bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcbxEJeY5WoEjyWI41jM64cvWrbfPwH7JKEGSncEfmI=;
 b=Hg5meADjVjLF607um1ESWLSxxwSJns0RLbsSRrJKglt5XIU2MIue9kFqdcF0+s3ZyAGUuw43l8ZrCaidcIwakcHBsIeSn5TA5QEZ/m4/+y7gnAeRK3ajUQQCARgN3YAgbHhP56OE/p74/3UxJDBOt+kLMy0GscfKUIF5A3tbnSRnZod4fngx56RJM+vfuZ4vWqcC6+0SVTN2LBy0yod/o1yVHCEvZgzwnke0pZcfZ5G72BhdmE0onU69ll6iHfvFa0ymtOhboC5uFVizXzyfBlRzFQf0itoxrKmq1Q/seW27/QpDeB2378hulrYkbbzWjvabRiGfDipZ9S0B/VVPaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB7471.namprd12.prod.outlook.com (2603:10b6:510:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 05:30:22 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 05:30:22 +0000
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-3-ymaman@nvidia.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, herbst@redhat.com,
 lyude@redhat.com, dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 jgg@ziepe.ca, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 bskeggs@nvidia.com, Gal Shalom <GalShalom@Nvidia.com>
Subject: Re: [PATCH v1 2/4] nouveau/dmem: HMM P2P DMA for private dev pages
Date: Wed, 16 Oct 2024 16:12:14 +1100
In-reply-to: <20241015152348.3055360-3-ymaman@nvidia.com>
Message-ID: <87bjzk8viu.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0111.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:20b::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 3202ea5c-4105-43c6-ef55-08dceda3a149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HFKovndwoGQXYxa44407AwR1GPpDVE9WkXmQLQIhJJHQlNiZmmfI6DXoQO5E?=
 =?us-ascii?Q?fd0B53GLQVjhUYjWKn2dx4zJbbRV2PjMVUSyCMPV6ZlX/eQVgEKIel0x8ai/?=
 =?us-ascii?Q?xQUB44h7tk0q6oRRU6tgbK8Qy2C+Oxz0dNbhTFnmfC75X93vrXzD1QAGo0Rj?=
 =?us-ascii?Q?FzCDE+XjaspBSif7No9NSLLRd2BcmSn4QaJfYVikOgrFFZk8crZlXSYFerfg?=
 =?us-ascii?Q?k3J7OrkLf9Rtj7ZCyxhkj9uLvmtuGWhfFmvrTK9a3sC1sI3OImVWksXn7riE?=
 =?us-ascii?Q?5Wueg5opIIvYGEhRLjZjxZIPQ18bMNLvzBiLzcoe62C6bXG7EvyIHlA8iGVz?=
 =?us-ascii?Q?qCdmws/GnTvlTwSgCpn3+pBxiPOwGCEBtj/N7YZHKfl0qdhJd5cWR0pn8sGo?=
 =?us-ascii?Q?te7GW+e1HPTh3vSdSVZ2KLY2OeZn4U80KF6LAfTFsxF217bmeWj3uVJh5yoR?=
 =?us-ascii?Q?l1XmNJv02AHSv0VIe2eU6zxA2xvPzWmutLQcirlaO1t7v+Gr7RNnURCHmck3?=
 =?us-ascii?Q?AIdD7ZMFZa2RKrEas/GLjp7nExg8QGsVmMp97iMLJhxt658n/uwjjxyi8mwX?=
 =?us-ascii?Q?YntDoKHJHlzNznWR4AGV8SFQ1yWeaarAnB5gKDGKKeqzKejPOkrVit0KMqg4?=
 =?us-ascii?Q?2uQspLnblQ0WFGER204cqYMxEbEoXr8eM/RbaSY5MQu1YBZqdv0VguEL2WjJ?=
 =?us-ascii?Q?Etpr9IVaLxVBs/K3HRnqC9UJM32Zft3kPziN2A1bhdH/3Qn5Rn4cRNMyLYoq?=
 =?us-ascii?Q?uGPkuiVJ4Dgij4+DIrLs349ndz17em/V80MHbDS8JDYbo8GULSkPvbNKpKuF?=
 =?us-ascii?Q?qQwKQdCT4n92CPZ+TeI9jvYSH3mqJQdU7/2HMBQuoAP9rLgJNf9fwCsP2waa?=
 =?us-ascii?Q?35rbBPhZHhq+qp4w1ugCVayQjRHcJRDyk1P/i/r+OhrZono2wj8o5urnIrik?=
 =?us-ascii?Q?Ry+U4Q9aNUH6bKLXEH6TA8jlx/ZNRwJi9iJzH9BBRxasze43vnFvWqkTi9q3?=
 =?us-ascii?Q?HY/zMFxXtrCJo42Qh+bVu3MfoV78Y4ydfiFXkR79XD0GUo8SiGTu7g0mZFly?=
 =?us-ascii?Q?9nql1AZGftV53GAAF9ivQeIXLr6D9f4dV84pF2E5KnErvOmTT//aYrG6RBl0?=
 =?us-ascii?Q?+CYc7U9GsKENHawzdlHF6mh+7ziVQYqi7uBqwRVWjP9XIlAfl/EhJ1ERGkPq?=
 =?us-ascii?Q?C0pUtpM8KkuSb2pt+jAP7es9okLf+ksSVKhb4DkmeZo+FGKsAEmg3cxZx0hW?=
 =?us-ascii?Q?A+H4NEhWSM0udIHXM2T1nXIYyhbiqHNlBL/jfVf2lQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mv9PVmmlAf8dvZkDS7dliptKXF5o39Q059BCtVr8V40t141/hf9qy6mtdosG?=
 =?us-ascii?Q?OvR/nCd4PiOxp+Bq4srgQz2dI+y4Vyxwk/3AEAx5FEl2Ah/cKUeZWd7qWoqa?=
 =?us-ascii?Q?RH0Qf1pdCxnPQlqfiirH9CRPINI3g1VPi30OLb+mOrWiZsbBPzAoGPd4R8vV?=
 =?us-ascii?Q?njcIoyBUU86pglmdhZcLiyd02VU6yTQtP/g8BFd76H78br+ApD5aFB+BBBac?=
 =?us-ascii?Q?VK0OlCYYcPKyXfoIZ9EmrnwhDCKvrEnD2deHuirpwTPi0nQJHFF9MWCGJCPM?=
 =?us-ascii?Q?dESTM5oIwSaBYImOrIvotpE/XuC7ZYMbWkgEsYJ2nRfKAk1mPL5KCioQN8SI?=
 =?us-ascii?Q?+hwBmgsiB83ZiCV6SfRX2aWuqLVpOIjV4+pC46T03RaR+/gZ52rdk1tN92o3?=
 =?us-ascii?Q?OoJV34rreOAoiJNTsxElSr53QfW+gZcDKdw2XCV5WWQ7qYrZruJYYlqzO/mi?=
 =?us-ascii?Q?+fB+81DSmhLXjNMN/TwshP5TQJTHoQKjqPqbk87Nshb9r+dJqpxpdgVhfWtb?=
 =?us-ascii?Q?e4UcWYO30GdnAwE5xGL7Ya59Ej7nJSKlscy6/ylgrTQD4yD91ic4UXd4R4d/?=
 =?us-ascii?Q?urtVWrjGNcqqfb7Yq/tUg7IEdweuq4CImRJhluPtqTsU8IIJ2j3IYZPcNYpP?=
 =?us-ascii?Q?TaOWKLjx7hyB/8kvuo5+MLP3Y4PUOhgTjpmUtscyg209h1CRXmddfzgkVC8M?=
 =?us-ascii?Q?hC31DR2/vJbS8mHzfNM1MMN39y6u0aleo2QxD9URp3tLWmbg0FyxB7yC8f6P?=
 =?us-ascii?Q?C+ncGrLXziX1EVIOpKeu9oLPLsjqBB87Szbb+cJOnR0/8YPpG/kY/lO+9aZt?=
 =?us-ascii?Q?Hh0WCkXnJCB4t8kek9/vWL53T01CbKABlda5PFs+5j9R+yUOEXTQfXlH8Hkb?=
 =?us-ascii?Q?XTPHRORe09+FUU8Y9cS9OskaWtWA43+CJuI5AKYZ3kYDrgqXP5UIh71VWi2m?=
 =?us-ascii?Q?pOULibgu7Wa1tjDugSraazIGEwf9Yaxegt5AL/hWmkmgBB09QzSatumC7yPo?=
 =?us-ascii?Q?HSI9CMgmZdiU9pVRjIVLlNgoHLx2RFJkEpBWvewPKnmEOoeIi+6HPTP++6gA?=
 =?us-ascii?Q?eZs7c4jSb8iD72P4CY4H4TdC39xZetXn7SX+vBqT8Y22MdsWwq+LFw5lvOIZ?=
 =?us-ascii?Q?G+JQ12Pxz/j1o7U8jIKPYFcPwIMhmSMsiYpsvEfxjj3/uYq+pkvbummZ0TMX?=
 =?us-ascii?Q?JVlqaMUVbSi5tRfrt8DyyL6E/l3D4jEU/oMGvJF9n9bZNdcd+vPmU9haV5f2?=
 =?us-ascii?Q?YVZMkqPb/1KhTTDjG1RJD0ya8Xn7gHTvOj3PcyDD3rRp6MAVu730ix9C8Imu?=
 =?us-ascii?Q?njqSv6fjGSz/1yZ2n/hWrUR5RnUEEJ/RPuBZD67ax/HfKIfNtsSuRb25MSrl?=
 =?us-ascii?Q?8l5XqELVV33Z2Sp7gN1Zj9e4CV76ZdYQDlVsCP8230uTKy9tLAfZwNa7yVJO?=
 =?us-ascii?Q?gTuUKv0MtW0j61eqPn98ZlJ6V5tHq8v5pnYWyBLNO0X4yDtLtE4yX7px/gPg?=
 =?us-ascii?Q?SIvSn2LHcUCvTYyifvoLbZhVh5225d5soZmtibzjPiKCCHLf6/AtBkT4rtxw?=
 =?us-ascii?Q?bQE/ydx/6gF+iQ+clZx0zAGeVM8rSX8W554FPdL3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3202ea5c-4105-43c6-ef55-08dceda3a149
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 05:30:22.2782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fr0SHa/ffa3Ar0QnU3/x5XRCIz+xcm8PJGVJgiFXyLjn4Ebnk5auvMcZSi897FbUy3pkTsWWpqszfoqGJ9Vdjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7471
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


Yonatan Maman <ymaman@nvidia.com> writes:

> From: Yonatan Maman <Ymaman@Nvidia.com>
>
> Enabling Peer-to-Peer DMA (P2P DMA) access in GPU-centric applications
> is crucial for minimizing data transfer overhead (e.g., for RDMA use-
> case).
>
> This change aims to enable that capability for Nouveau over HMM device
> private pages. P2P DMA for private device pages allows the GPU to
> directly exchange data with other devices (e.g., NICs) without needing
> to traverse system RAM.
>
> To fully support Peer-to-Peer for device private pages, the following
> changes are made:
>
>  - Introduce struct nouveau_dmem_hmm_p2p within struct nouveau_dmem
>    to manage BAR1 PCI P2P memory. p2p_start_addr holds the virtual
>    address allocated with pci_alloc_p2pmem(), and p2p_size represents
>    the allocated size of the PCI P2P memory.
>
>  - nouveau_dmem_init - Ensure BAR1 accessibility and assign struct
>    pages (PCI_P2P_PAGE) for all BAR1 pages. Introduce
>    nouveau_alloc_bar1_pci_p2p_mem in nouveau_dmem to expose BAR1 for
>    use as P2P memory via pci_p2pdma_add_resource and implement static
>    allocation and assignment of struct pages using pci_alloc_p2pmem.
>    This function will be called from nouveau_dmem_init, and failure
>    triggers a warning message instead of driver failure.
>
>  - nouveau_dmem_fini - Ensure BAR1 PCI P2P memory is properly
>    destroyed during driver cleanup. Introduce
>    nouveau_destroy_bar1_pci_p2p_mem to handle freeing of PCI P2P
>    memory associated with Nouveau BAR1. Modify nouveau_dmem_fini to
>    call nouveau_destroy_bar1_pci_p2p_mem.
>
>  - Implement Nouveau `p2p_page` callback function - Implement BAR1
>    mapping for the chunk using `io_mem_reserve` if no mapping exists.
>    Retrieve the pre-allocated P2P virtual address and size from
>    `hmm_p2p`. Calculate the page offset within BAR1 and return the
>    corresponding P2P page.
>
> Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
> Reviewed-by: Gal Shalom <GalShalom@Nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 117 ++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 1a072568cef6..13fb8671f212 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -40,6 +40,9 @@
>  #include <linux/hmm.h>
>  #include <linux/memremap.h>
>  #include <linux/migrate.h>
> +#include <linux/pci-p2pdma.h>
> +#include <nvkm/core/pci.h>
> +
>  
>  /*
>   * FIXME: this is ugly right now we are using TTM to allocate vram and we pin
> @@ -77,9 +80,15 @@ struct nouveau_dmem_migrate {
>  	struct nouveau_channel *chan;
>  };
>  
> +struct nouveau_dmem_hmm_p2p {
> +	size_t p2p_size;
> +	void *p2p_start_addr;
> +};
> +
>  struct nouveau_dmem {
>  	struct nouveau_drm *drm;
>  	struct nouveau_dmem_migrate migrate;
> +	struct nouveau_dmem_hmm_p2p hmm_p2p;
>  	struct list_head chunks;
>  	struct mutex mutex;
>  	struct page *free_pages;
> @@ -158,6 +167,61 @@ static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
>  	return 0;
>  }
>  
> +static int nouveau_dmem_bar1_mapping(struct nouveau_bo *nvbo,
> +				     unsigned long long *bus_addr)
> +{
> +	int ret;
> +	struct ttm_resource *mem = nvbo->bo.resource;
> +
> +	if (mem->bus.offset) {
> +		*bus_addr = mem->bus.offset;
> +		return 0;
> +	}
> +
> +	if (PFN_UP(nvbo->bo.base.size) > PFN_UP(nvbo->bo.resource->size))
> +		return -EINVAL;
> +
> +	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = nvbo->bo.bdev->funcs->io_mem_reserve(nvbo->bo.bdev, mem);
> +	*bus_addr = mem->bus.offset;
> +
> +	ttm_bo_unreserve(&nvbo->bo);
> +	return ret;
> +}
> +
> +static struct page *nouveau_dmem_get_dma_page(struct page *private_page)
> +{
> +	int ret;
> +	unsigned long long offset_in_chunk, offset_in_bar1;
> +	unsigned long long chunk_bus_addr, page_bus_addr;
> +	unsigned long long bar1_base_addr;
> +	struct nouveau_drm *drm = page_to_drm(private_page);
> +	struct nouveau_bo *nvbo = nouveau_page_to_chunk(private_page)->bo;
> +	struct nvkm_device *nv_device = nvxx_device(drm);
> +	void *p2p_start_addr = drm->dmem->hmm_p2p.p2p_start_addr;
> +	size_t p2p_size = drm->dmem->hmm_p2p.p2p_size;
> +
> +	bar1_base_addr = nv_device->func->resource_addr(nv_device, 1);
> +	offset_in_chunk =
> +		(page_to_pfn(private_page) << PAGE_SHIFT) -
> +		nouveau_page_to_chunk(private_page)->pagemap.range.start;
> +
> +	ret = nouveau_dmem_bar1_mapping(nvbo, &chunk_bus_addr);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	page_bus_addr = chunk_bus_addr + offset_in_chunk;
> +	if (!p2p_size || page_bus_addr > bar1_base_addr + p2p_size ||
> +	    page_bus_addr < bar1_base_addr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	offset_in_bar1 = page_bus_addr - bar1_base_addr;
> +	return virt_to_page(p2p_start_addr + offset_in_bar1);

This conversion looks a bit complicated. Once you have page_bus_addr I
think you can just return pfn_to_page(page_bus_addr >> PAGE_SHIFT)

> +}
> +
>  static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>  {
>  	struct nouveau_drm *drm = page_to_drm(vmf->page);
> @@ -219,8 +283,9 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>  }
>  
>  static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
> -	.page_free		= nouveau_dmem_page_free,
> -	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
> +	.page_free		 = nouveau_dmem_page_free,
> +	.migrate_to_ram		 = nouveau_dmem_migrate_to_ram,
> +	.get_dma_page_for_device = nouveau_dmem_get_dma_page,
>  };
>  
>  static int
> @@ -413,14 +478,31 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>  	kvfree(dma_addrs);
>  }
>  
> +static void nouveau_destroy_bar1_pci_p2p_mem(struct nouveau_drm *drm,
> +					     struct pci_dev *pdev,
> +					     void *p2p_start_addr,
> +					     size_t p2p_size)
> +{
> +	if (p2p_size)
> +		pci_free_p2pmem(pdev, p2p_start_addr, p2p_size);
> +
> +	NV_INFO(drm, "PCI P2P memory freed(%p)\n", p2p_start_addr);
> +}
> +
>  void
>  nouveau_dmem_fini(struct nouveau_drm *drm)
>  {
>  	struct nouveau_dmem_chunk *chunk, *tmp;
> +	struct nvkm_device *nv_device = nvxx_device(drm);
>  
>  	if (drm->dmem == NULL)
>  		return;
>  
> +	nouveau_destroy_bar1_pci_p2p_mem(drm,
> +					 nv_device->func->pci(nv_device)->pdev,
> +					 drm->dmem->hmm_p2p.p2p_start_addr,
> +					 drm->dmem->hmm_p2p.p2p_size);
> +
>  	mutex_lock(&drm->dmem->mutex);
>  
>  	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
> @@ -586,10 +668,30 @@ nouveau_dmem_migrate_init(struct nouveau_drm *drm)
>  	return -ENODEV;
>  }
>  
> +static int nouveau_alloc_bar1_pci_p2p_mem(struct nouveau_drm *drm,
> +					  struct pci_dev *pdev, size_t size,
> +					  void **pp2p_start_addr,
> +					  size_t *pp2p_size)
> +{
> +	int ret;
> +
> +	ret = pci_p2pdma_add_resource(pdev, 1, size, 0);
> +	if (ret)
> +		return ret;
> +
> +	*pp2p_start_addr = pci_alloc_p2pmem(pdev, size);
> +	*pp2p_size = (*pp2p_start_addr) ? size : 0;

Why return the size here? Personally I think it would be clearer to have
the caller directly initialise/clear whatever struct values it needs.

> +
> +	NV_INFO(drm, "PCI P2P memory allocated(%p)\n", *pp2p_start_addr);
> +	return 0;
> +}
> +
>  void
>  nouveau_dmem_init(struct nouveau_drm *drm)
>  {
>  	int ret;
> +	struct nvkm_device *nv_device = nvxx_device(drm);
> +	size_t bar1_size;
>  
>  	/* This only make sense on PASCAL or newer */
>  	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_PASCAL)
> @@ -610,6 +712,17 @@ nouveau_dmem_init(struct nouveau_drm *drm)
>  		kfree(drm->dmem);
>  		drm->dmem = NULL;
>  	}
> +
> +	/* Expose BAR1 for HMM P2P Memory */
> +	bar1_size = nv_device->func->resource_size(nv_device, 1);
> +	ret = nouveau_alloc_bar1_pci_p2p_mem(drm,
> +					     nv_device->func->pci(nv_device)->pdev,
> +					     bar1_size,
> +					     &drm->dmem->hmm_p2p.p2p_start_addr,
> +					     &drm->dmem->hmm_p2p.p2p_size);
> +	if (ret)
> +		NV_WARN(drm,
> +			"PCI P2P memory allocation failed, HMM P2P won't be supported\n");
>  }
>  
>  static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,

