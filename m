Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFD429AB51
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 12:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ACB6E0D6;
	Tue, 27 Oct 2020 11:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383C56E0D6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 11:58:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMeyCgwyZz9J0+XYHcp86YHbcOVdGI/vsIx0c3SI86pcEcCDd5XyoTANdmBmVJ3bLlrOyBP9gKPApLQ8L5VDV3PGjG7WwswjahnVaXmilOK0E9VXNqhaGH2j8xE3aTFOf7TUmTdtkUK/LkNH7mQ/m39gu4kpQ2AHq1fzUFYutnY0yHjpvCn72WkGExhveJBm9BoOrFo9ywoAdXQCt7W9XPL/EEdRWhrn6E4KE+mBL/NrusB/CXEMoHCSjHpha2r61v+UjwAo/d/bC2vol71dvHezlBmoEF20IpmDeVkFabOoy8Npw2Edrxh/24AAUHnO/5ZRzBUr3z3W0ZVRY5IHjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRiDLXJRiSfz2euPxkq9yg41PwvSNW0K5IQpyA+z5Fk=;
 b=n6d5tlsU5QJgwX+wSOZrRQj78gUDMcYGy07ZCcB9Jt5rH6UgAqjaBGRaeiZhpLFPBKlrfcn4a9WzqjripqMR5UwmQX7/zVuOEthmrQidip2lVS3y/t7w89BxhLf6WE6XtW1ykWTYtbKqi76UY10Nb1iMqF+QA1e1m5qUXoosQ43m40ZOxYK4qgs75fAcYsdOsJFza0FyuCu5hXHNoDdR4GqJ1I0uuf//3k92d/wczbowGRL2+sxdq9BQWAJYCRsXpIiAxT881z1OyeZRLinlx0GM8yze2nFTiLfAEqQZWMnoZOOtqobpVrehcirXCoF9agh12bL5sM9lujCcb80Q6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRiDLXJRiSfz2euPxkq9yg41PwvSNW0K5IQpyA+z5Fk=;
 b=4WrUG7Wji3HGXO5lEeQS5Pwv7vxULMtCXVYYchRCWUxlKImBx+xMNYxCk+evBfSJep1PbCnmHNOu/VgUJARPF80UfZNzEDmTHoPYIycUbrn3G3f87Dght3aWV0cvpRFJDbYJXeeh22PKKvjS/1S054UGtZ9UGjc39iquLaaasds=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW3PR12MB4506.namprd12.prod.outlook.com (2603:10b6:303:53::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.23; Tue, 27 Oct
 2020 11:58:27 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::b885:8b56:a460:4624%11]) with mapi id 15.20.3499.018; Tue, 27 Oct
 2020 11:58:27 +0000
Date: Tue, 27 Oct 2020 19:58:20 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/9] drm/ttm: new TT backend allocation pool v2
Message-ID: <20201027115820.GA1312088@hr-amd>
References: <20201026174117.2553-1-christian.koenig@amd.com>
Content-Disposition: inline
In-Reply-To: <20201026174117.2553-1-christian.koenig@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HK2PR02CA0143.apcprd02.prod.outlook.com
 (2603:1096:202:16::27) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HK2PR02CA0143.apcprd02.prod.outlook.com (2603:1096:202:16::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Tue, 27 Oct 2020 11:58:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e9a61f13-2730-4bcd-4a02-08d87a6f9cfa
X-MS-TrafficTypeDiagnostic: MW3PR12MB4506:
X-Microsoft-Antispam-PRVS: <MW3PR12MB45062DA5C265380CB4F6488BEC160@MW3PR12MB4506.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: clzHckm5wA9+1Twh8nMwTgDlSHo0A/c5mHB0nZgX7E/Xzs718khKNbfvHjqvjrFLEDE6ob4hGm6HWxK1Cil76O9sme0nZAaN5m0omTocQ8OcIMSvBnYNOaGrsJVBq7sf8UjblrD5fX5iZoOrJqkht3rUArMtOCQn4UxLPxMP4hAowyNLEok56HDOCgTRJ5a6oGg+HPcsnjoOp6qkTxb/VyM0kVVo8JX5ICD5W506cbR0957G0u/TNuxQb/4N7+9sftdR6PKVWOe3ZRoVoy5g7CWEazpnoBBbJFnSVifK8Uyj10i2I3GMhkioCHU+k0QnEnyIhw9v0IRv2PoWd9COPa2EgfxKfNreeeY2a2k/Fts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(8936002)(1076003)(33656002)(55016002)(186003)(316002)(86362001)(8676002)(6916009)(26005)(66476007)(66556008)(966005)(956004)(66946007)(6666004)(16526019)(478600001)(6496006)(33716001)(5660300002)(83380400001)(52116002)(66574015)(45080400002)(9686003)(4326008)(2906002)(30864003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ceLt3CdwsQcRkmFheiUZv0hy7tMyFgj+AdNnu0MYX3IXnh2Nq87cdooD2O4AM78qA1tpSozycMNoLSlCDpqHn6agF5y+e/Gv/rB1hqKUAiEUQJE4q6wrxVqShAQCDLYeUH3SdkiD/Ro/1AtXfxptD9NaPDM3njOE1uAVjwBe891ZxznVfTSmerx+3UFb6CTMZONr3jNdd7cz5m2AdA3ONjZq24RyT1lNzxqHyKEFftz6ier1rWuXyFkpNd7hMlf8A2i8ZCZFNJB64w/vFqRBkjYxelUpSWUjR4prPhnxFM/0Z+XPsAFdLd1Pf7ydlYItzxYSxKR1vueZdu+B1U1YJspMdf/yeuuLv3Yw+HPs9qTdJoZMKrz5hT/EXXf1iB5+ftmqEFn0o2lBa0poEnW/vIVj7aLrDxXt/8hAx6N5paCBkx/pLQ9rh3jP+vcsAuslozSXFfAd2wl6Fn6g497YdxrEcpuhfuYGAlaFvA0X92c522rdzKmeT5FFsYNF14vqLJwCHGJyypmCNeOZH/Dp6HnNF+ZB3ZWDyr/bGVa7WkFfmDW+bKXKj1xhxSI86UhDBSiOLCX/LrRnULgxP8SxICqdbSZXepJMJx6bEDz05XA27Ye6w3vv+kmYSSkpYtDAC3rLZ+XKXXJWFGyGwM0bXw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a61f13-2730-4bcd-4a02-08d87a6f9cfa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2020 11:58:27.1320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vn2aHS2i1P3nYXoUPr9/Jdp1acFbUCGAe2rXglCO7xdas9erKyHjvzEIXssipvSnGQLlVl9zLnHPncyoE8Be1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4506
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 06:41:09PM +0100, Christian K=F6nig wrote:
> This replaces the spaghetti code in the two existing page pools.
> =

> First of all depending on the allocation size it is between 3 (1GiB) and
> 5 (1MiB) times faster than the old implementation.
> =

> It makes better use of buddy pages to allow for larger physical contiguous
> allocations which should result in better TLB utilization at least for
> amdgpu.
> =

> Instead of a completely braindead approach of filling the pool with one
> CPU while another one is trying to shrink it we only give back freed
> pages.
> =

> This also results in much less locking contention and a trylock free MM
> shrinker callback, so we can guarantee that pages are given back to the
> system when needed.
> =

> Downside of this is that it takes longer for many small allocations until
> the pool is filled up. We could address this, but I couldn't find an use
> case where this actually matters. We also don't bother freeing large
> chunks of pages any more since the CPU overhead in that path isn't really
> that important.
> =

> The sysfs files are replaced with a single module parameter, allowing
> users to override how many pages should be globally pooled in TTM. This
> unfortunately breaks the UAPI slightly, but as far as we know nobody ever
> depended on this.
> =

> Zeroing memory coming from the pool was handled inconsistently. The
> alloc_pages() based pool was zeroing it, the dma_alloc_attr() based one
> wasn't. For now the new implementation isn't zeroing pages from the pool
> either and only sets the __GFP_ZERO flag when necessary.
> =

> The implementation has only 768 lines of code compared to the over 2600
> of the old one, and also allows for saving quite a bunch of code in the
> drivers since we don't need specialized handling there any more based on
> kernel config.
> =

> Additional to all of that there was a neat bug with IOMMU, coherent DMA
> mappings and huge pages which is now fixed in the new code as well.
> =

> v2: make ttm_pool_apply_caching static as reported by the kernel bot, add
>     some more checks
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Just verified them in my renoir platform, the page faults are gone.
Thanks!

Series are Tested-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/Makefile     |   2 +-
>  drivers/gpu/drm/ttm/ttm_memory.c |   3 +
>  drivers/gpu/drm/ttm/ttm_pool.c   | 668 +++++++++++++++++++++++++++++++
>  include/drm/ttm/ttm_caching.h    |   2 +
>  include/drm/ttm/ttm_pool.h       |  90 +++++
>  5 files changed, 764 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/ttm/ttm_pool.c
>  create mode 100644 include/drm/ttm/ttm_pool.h
> =

> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index 90c0da88cc98..0096bacbcf32 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -5,7 +5,7 @@
>  ttm-y :=3D ttm_memory.o ttm_tt.o ttm_bo.o \
>  	ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>  	ttm_execbuf_util.o ttm_page_alloc.o ttm_range_manager.o \
> -	ttm_resource.o
> +	ttm_resource.o ttm_pool.o
>  ttm-$(CONFIG_AGP) +=3D ttm_agp_backend.o
>  ttm-$(CONFIG_DRM_TTM_DMA_PAGE_POOL) +=3D ttm_page_alloc_dma.o
>  =

> diff --git a/drivers/gpu/drm/ttm/ttm_memory.c b/drivers/gpu/drm/ttm/ttm_m=
emory.c
> index 69cf622e79e5..3012d0388c51 100644
> --- a/drivers/gpu/drm/ttm/ttm_memory.c
> +++ b/drivers/gpu/drm/ttm/ttm_memory.c
> @@ -38,6 +38,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/swap.h>
> +#include <drm/ttm/ttm_pool.h>
>  =

>  #define TTM_MEMORY_ALLOC_RETRIES 4
>  =

> @@ -453,6 +454,7 @@ int ttm_mem_global_init(struct ttm_mem_global *glob)
>  	}
>  	ttm_page_alloc_init(glob, glob->zone_kernel->max_mem/(2*PAGE_SIZE));
>  	ttm_dma_page_alloc_init(glob, glob->zone_kernel->max_mem/(2*PAGE_SIZE));
> +	ttm_pool_mgr_init(glob->zone_kernel->max_mem/(2*PAGE_SIZE));
>  	return 0;
>  out_no_zone:
>  	ttm_mem_global_release(glob);
> @@ -467,6 +469,7 @@ void ttm_mem_global_release(struct ttm_mem_global *gl=
ob)
>  	/* let the page allocator first stop the shrink work. */
>  	ttm_page_alloc_fini();
>  	ttm_dma_page_alloc_fini();
> +	ttm_pool_mgr_fini();
>  =

>  	flush_workqueue(glob->swap_queue);
>  	destroy_workqueue(glob->swap_queue);
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_poo=
l.c
> new file mode 100644
> index 000000000000..d25712e3ad3b
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -0,0 +1,668 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Christian K=F6nig
> + */
> +
> +/* Pooling of allocated pages is necessary because changing the caching
> + * attributes on x86 of the linear mapping requires a costly cross CPU T=
LB
> + * invalidate for those addresses.
> + *
> + * Additional to that allocations from the DMA coherent API are pooled a=
s well
> + * cause they are rather slow compared to alloc_pages+map.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/dma-mapping.h>
> +
> +#ifdef CONFIG_X86
> +#include <asm/set_memory.h>
> +#endif
> +
> +#include <drm/ttm/ttm_pool.h>
> +#include <drm/ttm/ttm_bo_driver.h>
> +#include <drm/ttm/ttm_tt.h>
> +
> +/**
> + * struct ttm_pool_dma - Helper object for coherent DMA mappings
> + *
> + * @addr: original DMA address returned for the mapping
> + * @vaddr: original vaddr return for the mapping and order in the lower =
bits
> + */
> +struct ttm_pool_dma {
> +	dma_addr_t addr;
> +	unsigned long vaddr;
> +};
> +
> +static unsigned long page_pool_size;
> +
> +MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool"=
);
> +module_param(page_pool_size, ulong, 0644);
> +
> +static atomic_long_t allocated_pages;
> +
> +static struct ttm_pool_type global_write_combined[MAX_ORDER];
> +static struct ttm_pool_type global_uncached[MAX_ORDER];
> +
> +static spinlock_t shrinker_lock;
> +static struct list_head shrinker_list;
> +static struct shrinker mm_shrinker;
> +
> +/* Allocate pages of size 1 << order with the given gfp_flags */
> +static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp=
_flags,
> +					unsigned int order)
> +{
> +	unsigned long attr =3D DMA_ATTR_FORCE_CONTIGUOUS;
> +	struct ttm_pool_dma *dma;
> +	struct page *p;
> +	void *vaddr;
> +
> +	if (order) {
> +		gfp_flags |=3D GFP_TRANSHUGE_LIGHT | __GFP_NORETRY |
> +			__GFP_KSWAPD_RECLAIM;
> +		gfp_flags &=3D ~__GFP_MOVABLE;
> +		gfp_flags &=3D ~__GFP_COMP;
> +	}
> +
> +	if (!pool->use_dma_alloc) {
> +		p =3D alloc_pages(gfp_flags, order);
> +		if (p)
> +			p->private =3D order;
> +		return p;
> +	}
> +
> +	dma =3D kmalloc(sizeof(*dma), GFP_KERNEL);
> +	if (!dma)
> +		return NULL;
> +
> +	if (order)
> +		attr |=3D DMA_ATTR_NO_WARN;
> +
> +	vaddr =3D dma_alloc_attrs(pool->dev, (1ULL << order) * PAGE_SIZE,
> +				&dma->addr, gfp_flags, attr);
> +	if (!vaddr)
> +		goto error_free;
> +
> +	/* TODO: This is an illegal abuse of the DMA API, but we need to rework
> +	 * TTM page fault handling and extend the DMA API to clean this up.
> +	 */
> +	if (is_vmalloc_addr(vaddr))
> +		p =3D vmalloc_to_page(vaddr);
> +	else
> +		p =3D virt_to_page(vaddr);
> +
> +	dma->vaddr =3D (unsigned long)vaddr | order;
> +	p->private =3D (unsigned long)dma;
> +	return p;
> +
> +error_free:
> +	kfree(dma);
> +	return NULL;
> +}
> +
> +/* Reset the caching and pages of size 1 << order */
> +static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching c=
aching,
> +			       unsigned int order, struct page *p)
> +{
> +	unsigned long attr =3D DMA_ATTR_FORCE_CONTIGUOUS;
> +	struct ttm_pool_dma *dma;
> +	void *vaddr;
> +
> +#ifdef CONFIG_X86
> +	/* We don't care that set_pages_wb is inefficient here. This is only
> +	 * used when we have to shrink and CPU overhead is irrelevant then.
> +	 */
> +	if (caching !=3D ttm_cached && !PageHighMem(p))
> +		set_pages_wb(p, 1 << order);
> +#endif
> +
> +	if (!pool->use_dma_alloc) {
> +		__free_pages(p, order);
> +		return;
> +	}
> +
> +	if (order)
> +		attr |=3D DMA_ATTR_NO_WARN;
> +
> +	dma =3D (void *)p->private;
> +	vaddr =3D (void *)(dma->vaddr & PAGE_MASK);
> +	dma_free_attrs(pool->dev, (1UL << order) * PAGE_SIZE, vaddr, dma->addr,
> +		       attr);
> +	kfree(dma);
> +}
> +
> +/* Apply a new caching to an array of pages */
> +static int ttm_pool_apply_caching(struct page **first, struct page **las=
t,
> +				  enum ttm_caching caching)
> +{
> +#ifdef CONFIG_X86
> +	unsigned int num_pages =3D last - first;
> +
> +	if (!num_pages)
> +		return 0;
> +
> +	switch (caching) {
> +	case ttm_cached:
> +		break;
> +	case ttm_write_combined:
> +		return set_pages_array_wc(first, num_pages);
> +	case ttm_uncached:
> +		return set_pages_array_uc(first, num_pages);
> +	}
> +#endif
> +	return 0;
> +}
> +
> +/* Map pages of 1 << order size and fill the DMA address array  */
> +static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
> +			struct page *p, dma_addr_t **dma_addr)
> +{
> +	dma_addr_t addr;
> +	unsigned int i;
> +
> +	if (pool->use_dma_alloc) {
> +		struct ttm_pool_dma *dma =3D (void *)p->private;
> +
> +		addr =3D dma->addr;
> +	} else {
> +		size_t size =3D (1ULL << order) * PAGE_SIZE;
> +
> +		addr =3D dma_map_page(pool->dev, p, 0, size, DMA_BIDIRECTIONAL);
> +		if (dma_mapping_error(pool->dev, **dma_addr))
> +			return -EFAULT;
> +	}
> +
> +	for (i =3D 1 << order; i ; --i) {
> +		*(*dma_addr)++ =3D addr;
> +		addr +=3D PAGE_SIZE;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Unmap pages of 1 << order size */
> +static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
> +			   unsigned int num_pages)
> +{
> +	/* Unmapped while freeing the page */
> +	if (pool->use_dma_alloc)
> +		return;
> +
> +	dma_unmap_page(pool->dev, dma_addr, (long)num_pages << PAGE_SHIFT,
> +		       DMA_BIDIRECTIONAL);
> +}
> +
> +/* Give pages into a specific pool_type */
> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
> +{
> +	spin_lock(&pt->lock);
> +	list_add(&p->lru, &pt->pages);
> +	spin_unlock(&pt->lock);
> +	atomic_long_add(1 << pt->order, &allocated_pages);
> +}
> +
> +/* Take pages from a specific pool_type, return NULL when nothing availa=
ble */
> +static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
> +{
> +	struct page *p;
> +
> +	spin_lock(&pt->lock);
> +	p =3D list_first_entry_or_null(&pt->pages, typeof(*p), lru);
> +	if (p) {
> +		atomic_long_sub(1 << pt->order, &allocated_pages);
> +		list_del(&p->lru);
> +	}
> +	spin_unlock(&pt->lock);
> +
> +	return p;
> +}
> +
> +/* Count the number of pages available in a pool_type */
> +static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
> +{
> +	unsigned int count =3D 0;
> +	struct page *p;
> +
> +	spin_lock(&pt->lock);
> +	/* Only used for debugfs, the overhead doesn't matter */
> +	list_for_each_entry(p, &pt->pages, lru)
> +		++count;
> +	spin_unlock(&pt->lock);
> +
> +	return count;
> +}
> +
> +/* Initialize and add a pool type to the global shrinker list */
> +static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool=
 *pool,
> +			       enum ttm_caching caching, unsigned int order)
> +{
> +	pt->pool =3D pool;
> +	pt->caching =3D caching;
> +	pt->order =3D order;
> +	spin_lock_init(&pt->lock);
> +	INIT_LIST_HEAD(&pt->pages);
> +
> +	spin_lock(&shrinker_lock);
> +	list_add_tail(&pt->shrinker_list, &shrinker_list);
> +	spin_unlock(&shrinker_lock);
> +}
> +
> +/* Remove a pool_type from the global shrinker list and free all pages */
> +static void ttm_pool_type_fini(struct ttm_pool_type *pt)
> +{
> +	struct page *p, *tmp;
> +
> +	spin_lock(&shrinker_lock);
> +	list_del(&pt->shrinker_list);
> +	spin_unlock(&shrinker_lock);
> +
> +	list_for_each_entry_safe(p, tmp, &pt->pages, lru)
> +		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +}
> +
> +/* Return the pool_type to use for the given caching and order */
> +static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
> +						  enum ttm_caching caching,
> +						  unsigned int order)
> +{
> +	if (pool->use_dma_alloc)
> +		return &pool->caching[caching].orders[order];
> +
> +#ifdef CONFIG_X86
> +	switch (caching) {
> +	case ttm_write_combined:
> +		return &global_write_combined[order];
> +	case ttm_uncached:
> +		return &global_uncached[order];
> +	default:
> +		break;
> +	}
> +#endif
> +
> +	return NULL;
> +}
> +
> +/* Free pages using the global shrinker list */
> +static unsigned int ttm_pool_shrink(void)
> +{
> +	struct ttm_pool_type *pt;
> +	unsigned int num_freed;
> +	struct page *p;
> +
> +	spin_lock(&shrinker_lock);
> +	pt =3D list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
> +
> +	p =3D ttm_pool_type_take(pt);
> +	if (p) {
> +		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
> +		num_freed =3D 1 << pt->order;
> +	} else {
> +		num_freed =3D 0;
> +	}
> +
> +	list_move_tail(&pt->shrinker_list, &shrinker_list);
> +	spin_unlock(&shrinker_lock);
> +
> +	return num_freed;
> +}
> +
> +/* Return the allocation order based for a page */
> +static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct pa=
ge *p)
> +{
> +	if (pool->use_dma_alloc) {
> +		struct ttm_pool_dma *dma =3D (void *)p->private;
> +
> +		return dma->vaddr & ~PAGE_MASK;
> +	}
> +
> +	return p->private;
> +}
> +
> +/**
> + * ttm_pool_alloc - Fill a ttm_tt object
> + *
> + * @pool: ttm_pool to use
> + * @tt: ttm_tt object to fill
> + * @ctx: operation context
> + *
> + * Fill the ttm_tt object with pages and also make sure to DMA map them =
when
> + * necessary.
> + *
> + * Returns: 0 on successe, negative error code otherwise.
> + */
> +int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> +		   struct ttm_operation_ctx *ctx)
> +{
> +	unsigned long num_pages =3D tt->num_pages;
> +	dma_addr_t *dma_addr =3D tt->dma_address;
> +	struct page **caching =3D tt->pages;
> +	struct page **pages =3D tt->pages;
> +	gfp_t gfp_flags =3D GFP_USER;
> +	unsigned int i, order;
> +	struct page *p;
> +	int r;
> +
> +	WARN_ON(!num_pages || ttm_tt_is_populated(tt));
> +	WARN_ON(dma_addr && !pool->dev);
> +
> +	if (tt->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)
> +		gfp_flags |=3D __GFP_ZERO;
> +
> +	if (tt->page_flags & TTM_PAGE_FLAG_NO_RETRY)
> +		gfp_flags |=3D __GFP_RETRY_MAYFAIL;
> +
> +	if (pool->use_dma32)
> +		gfp_flags |=3D GFP_DMA32;
> +	else
> +		gfp_flags |=3D GFP_HIGHUSER;
> +
> +	for (order =3D min(MAX_ORDER - 1UL, __fls(num_pages)); num_pages;
> +	     order =3D min_t(unsigned int, order, __fls(num_pages))) {
> +		bool apply_caching =3D false;
> +		struct ttm_pool_type *pt;
> +
> +		pt =3D ttm_pool_select_type(pool, tt->caching, order);
> +		p =3D pt ? ttm_pool_type_take(pt) : NULL;
> +		if (p) {
> +			apply_caching =3D true;
> +		} else {
> +			p =3D ttm_pool_alloc_page(pool, gfp_flags, order);
> +			if (p && PageHighMem(p))
> +				apply_caching =3D true;
> +		}
> +
> +		if (!p) {
> +			if (order) {
> +				--order;
> +				continue;
> +			}
> +			r =3D -ENOMEM;
> +			goto error_free_all;
> +		}
> +
> +		if (apply_caching) {
> +			r =3D ttm_pool_apply_caching(caching, pages,
> +						   tt->caching);
> +			if (r)
> +				goto error_free_page;
> +			caching =3D pages + (1 << order);
> +		}
> +
> +		r =3D ttm_mem_global_alloc_page(&ttm_mem_glob, p,
> +					      (1 << order) * PAGE_SIZE,
> +					      ctx);
> +		if (r)
> +			goto error_free_page;
> +
> +		if (dma_addr) {
> +			r =3D ttm_pool_map(pool, order, p, &dma_addr);
> +			if (r)
> +				goto error_global_free;
> +		}
> +
> +		num_pages -=3D 1 << order;
> +		for (i =3D 1 << order; i; --i)
> +			*(pages++) =3D p++;
> +	}
> +
> +	r =3D ttm_pool_apply_caching(caching, pages, tt->caching);
> +	if (r)
> +		goto error_free_all;
> +
> +	return 0;
> +
> +error_global_free:
> +	ttm_mem_global_free_page(&ttm_mem_glob, p, (1 << order) * PAGE_SIZE);
> +
> +error_free_page:
> +	ttm_pool_free_page(pool, tt->caching, order, p);
> +
> +error_free_all:
> +	num_pages =3D tt->num_pages - num_pages;
> +	for (i =3D 0; i < num_pages; ) {
> +		order =3D ttm_pool_page_order(pool, tt->pages[i]);
> +		ttm_pool_free_page(pool, tt->caching, order, tt->pages[i]);
> +		i +=3D 1 << order;
> +	}
> +
> +	return r;
> +}
> +EXPORT_SYMBOL(ttm_pool_alloc);
> +
> +/**
> + * ttm_pool_free - Free the backing pages from a ttm_tt object
> + *
> + * @pool: Pool to give pages back to.
> + * @tt: ttm_tt object to unpopulate
> + *
> + * Give the packing pages back to a pool or free them
> + */
> +void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < tt->num_pages; ) {
> +		struct page *p =3D tt->pages[i];
> +		unsigned int order, num_pages;
> +		struct ttm_pool_type *pt;
> +
> +		order =3D ttm_pool_page_order(pool, p);
> +		num_pages =3D 1ULL << order;
> +		ttm_mem_global_free_page(&ttm_mem_glob, p,
> +					 num_pages * PAGE_SIZE);
> +		if (tt->dma_address)
> +			ttm_pool_unmap(pool, tt->dma_address[i], num_pages);
> +
> +		pt =3D ttm_pool_select_type(pool, tt->caching, order);
> +		if (pt)
> +			ttm_pool_type_give(pt, tt->pages[i]);
> +		else
> +			ttm_pool_free_page(pool, tt->caching, order,
> +					   tt->pages[i]);
> +
> +		i +=3D num_pages;
> +	}
> +
> +	while (atomic_long_read(&allocated_pages) > page_pool_size)
> +		ttm_pool_shrink();
> +}
> +EXPORT_SYMBOL(ttm_pool_free);
> +
> +/**
> + * ttm_pool_init - Initialize a pool
> + *
> + * @pool: the pool to initialize
> + * @dev: device for DMA allocations and mappings
> + * @use_dma_alloc: true if coherent DMA alloc should be used
> + * @use_dma32: true if GFP_DMA32 should be used
> + *
> + * Initialize the pool and its pool types.
> + */
> +void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> +		   bool use_dma_alloc, bool use_dma32)
> +{
> +	unsigned int i, j;
> +
> +	WARN_ON(!dev && use_dma_alloc);
> +
> +	pool->dev =3D dev;
> +	pool->use_dma_alloc =3D use_dma_alloc;
> +	pool->use_dma32 =3D use_dma32;
> +
> +	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> +		for (j =3D 0; j < MAX_ORDER; ++j)
> +			ttm_pool_type_init(&pool->caching[i].orders[j],
> +					   pool, i, j);
> +
> +}
> +EXPORT_SYMBOL(ttm_pool_init);
> +
> +/**
> + * ttm_pool_fini - Cleanup a pool
> + *
> + * @pool: the pool to clean up
> + *
> + * Free all pages in the pool and unregister the types from the global
> + * shrinker.
> + */
> +void ttm_pool_fini(struct ttm_pool *pool)
> +{
> +	unsigned int i, j;
> +
> +	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i)
> +		for (j =3D 0; j < MAX_ORDER; ++j)
> +			ttm_pool_type_fini(&pool->caching[i].orders[j]);
> +}
> +EXPORT_SYMBOL(ttm_pool_fini);
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +/* Dump information about the different pool types */
> +static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
> +				    struct seq_file *m)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < MAX_ORDER; ++i)
> +		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
> +	seq_puts(m, "\n");
> +}
> +
> +/**
> + * ttm_pool_debugfs - Debugfs dump function for a pool
> + *
> + * @pool: the pool to dump the information for
> + * @m: seq_file to dump to
> + *
> + * Make a debugfs dump with the per pool and global information.
> + */
> +int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
> +{
> +	unsigned int i;
> +
> +	spin_lock(&shrinker_lock);
> +
> +	seq_puts(m, "\t ");
> +	for (i =3D 0; i < MAX_ORDER; ++i)
> +		seq_printf(m, " ---%2u---", i);
> +	seq_puts(m, "\n");
> +
> +	seq_puts(m, "wc\t:");
> +	ttm_pool_debugfs_orders(global_write_combined, m);
> +	seq_puts(m, "uc\t:");
> +	ttm_pool_debugfs_orders(global_uncached, m);
> +
> +	for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> +		seq_puts(m, "DMA ");
> +		switch (i) {
> +		case ttm_cached:
> +			seq_puts(m, "\t:");
> +			break;
> +		case ttm_write_combined:
> +			seq_puts(m, "wc\t:");
> +			break;
> +		case ttm_uncached:
> +			seq_puts(m, "uc\t:");
> +			break;
> +		}
> +		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
> +	}
> +
> +	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
> +		   atomic_long_read(&allocated_pages), page_pool_size);
> +
> +	spin_unlock(&shrinker_lock);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_pool_debugfs);
> +
> +#endif
> +
> +/* As long as pages are available make sure to release at least one */
> +static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
> +					    struct shrink_control *sc)
> +{
> +	unsigned long num_freed =3D 0;
> +
> +	do
> +		num_freed +=3D ttm_pool_shrink();
> +	while (!num_freed && atomic_long_read(&allocated_pages));
> +
> +	return num_freed;
> +}
> +
> +/* Return the number of pages available or SHRINK_EMPTY if we have none =
*/
> +static unsigned long ttm_pool_shrinker_count(struct shrinker *shrink,
> +					     struct shrink_control *sc)
> +{
> +	unsigned long num_pages =3D atomic_long_read(&allocated_pages);
> +
> +	return num_pages ? num_pages : SHRINK_EMPTY;
> +}
> +
> +/**
> + * ttm_pool_mgr_init - Initialize globals
> + *
> + * @num_pages: default number of pages
> + *
> + * Initialize the global locks and lists for the MM shrinker.
> + */
> +int ttm_pool_mgr_init(unsigned long num_pages)
> +{
> +	unsigned int i;
> +
> +	if (!page_pool_size)
> +		page_pool_size =3D num_pages;
> +
> +	spin_lock_init(&shrinker_lock);
> +	INIT_LIST_HEAD(&shrinker_list);
> +
> +	for (i =3D 0; i < MAX_ORDER; ++i) {
> +		ttm_pool_type_init(&global_write_combined[i], NULL,
> +				   ttm_write_combined, i);
> +		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
> +	}
> +
> +	mm_shrinker.count_objects =3D ttm_pool_shrinker_count;
> +	mm_shrinker.scan_objects =3D ttm_pool_shrinker_scan;
> +	mm_shrinker.seeks =3D 1;
> +	return register_shrinker(&mm_shrinker);
> +}
> +
> +/**
> + * ttm_pool_mgr_fini - Finalize globals
> + *
> + * Cleanup the global pools and unregister the MM shrinker.
> + */
> +void ttm_pool_mgr_fini(void)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < MAX_ORDER; ++i) {
> +		ttm_pool_type_fini(&global_write_combined[i]);
> +		ttm_pool_type_fini(&global_uncached[i]);
> +	}
> +
> +	unregister_shrinker(&mm_shrinker);
> +	WARN_ON(!list_empty(&shrinker_list));
> +}
> diff --git a/include/drm/ttm/ttm_caching.h b/include/drm/ttm/ttm_caching.h
> index 161624dcf6be..a0b4a49fa432 100644
> --- a/include/drm/ttm/ttm_caching.h
> +++ b/include/drm/ttm/ttm_caching.h
> @@ -25,6 +25,8 @@
>  #ifndef _TTM_CACHING_H_
>  #define _TTM_CACHING_H_
>  =

> +#define TTM_NUM_CACHING_TYPES	3
> +
>  enum ttm_caching {
>  	ttm_uncached,
>  	ttm_write_combined,
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> new file mode 100644
> index 000000000000..c6bfd8322fe1
> --- /dev/null
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Christian K=F6nig
> + */
> +
> +#ifndef _TTM_PAGE_POOL_H_
> +#define _TTM_PAGE_POOL_H_
> +
> +#include <linux/mmzone.h>
> +#include <linux/llist.h>
> +#include <drm/ttm/ttm_caching.h>
> +
> +struct device;
> +struct ttm_tt;
> +struct ttm_pool;
> +struct ttm_operation_ctx;
> +
> +/**
> + * ttm_pool_type - Pool for a certain memory type
> + *
> + * @pool: the pool we belong to, might be NULL for the global ones
> + * @order: the allocation order our pages have
> + * @caching: the caching type our pages have
> + * @shrinker_list: our place on the global shrinker list
> + * @lock: protection of the page list
> + * @pages: the list of pages in the pool
> + */
> +struct ttm_pool_type {
> +	struct ttm_pool *pool;
> +	unsigned int order;
> +	enum ttm_caching caching;
> +
> +	struct list_head shrinker_list;
> +
> +	spinlock_t lock;
> +	struct list_head pages;
> +};
> +
> +/**
> + * ttm_pool - Pool for all caching and orders
> + *
> + * @use_dma_alloc: if coherent DMA allocations should be used
> + * @use_dma32: if GFP_DMA32 should be used
> + * @caching: pools for each caching/order
> + */
> +struct ttm_pool {
> +	struct device *dev;
> +
> +	bool use_dma_alloc;
> +	bool use_dma32;
> +
> +	struct {
> +		struct ttm_pool_type orders[MAX_ORDER];
> +	} caching[TTM_NUM_CACHING_TYPES];
> +};
> +
> +int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
> +		   struct ttm_operation_ctx *ctx);
> +void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
> +
> +void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
> +		   bool use_dma_alloc, bool use_dma32);
> +void ttm_pool_fini(struct ttm_pool *pool);
> +
> +int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
> +
> +int ttm_pool_mgr_init(unsigned long num_pages);
> +void ttm_pool_mgr_fini(void);
> +
> +#endif
> -- =

> 2.17.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7Cray.=
huang%40amd.com%7C230f7e8cf7cb4cf071dc08d879d65b80%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637393308868626401&amp;sdata=3DauZEtmOZcY9tiFUyQHjl7oH=
dQ6MNypCUUg4EHZUGYBw%3D&amp;reserved=3D0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
