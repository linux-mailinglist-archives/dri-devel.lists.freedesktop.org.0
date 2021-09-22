Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D488414239
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 08:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E954F6EAB5;
	Wed, 22 Sep 2021 06:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434296EAB0;
 Wed, 22 Sep 2021 06:58:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHVWpLxmhO0F0RZ0ToZHIG52OfEXovFaOi2Sny3Ts6lDgR3jx6KywJFbBGOMFjzMdZNgENXXiKP74ePX00YaT/k/r01gBmwcr/s3zZvUMWJcDEHYPcbbLKQm56q5gam6oL1DGRHrIDYJI0BBmXcP+zcdGMDEkXgTKpIoVZZ9mKxEYcXuRmOsqv4q32M8eFJlCy2aQ6bIpTLsj2GUfoBhiR1PB2u0OEAluxAWvGe2m/8vhwz/6NtBKTzyKqgOfxNhE9k3mjZ8nxRkkIeRKpAhU7/M6aohvSPcRnHWEbgvqEiV3iuCGwAaXzRYTrzR5Oc5uvYrshoylUj6usZNJwQ1WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=VMyZ+uLO6JYjrzvVz4v0kT4lnrzf1PNysZWN0rRy3ZI=;
 b=nrWYhuGFZgdcrCxnSzy/5oeO6SR9YzUFGA+heyKKAzAn+SPomdQ105C2dn2Ce96oX1tRQ6R2OxRQ1axaARAZvDFmTRcgv/9hkCDJ+u6uqcCt6+uzH47BDSpRgBrU3ZYOzIVPMWkCKcVq+nIBVO1XA9O2EPHD7Pel5Xq/rfi3Ckm9IuxY0Ect9PeacCOpDZqzeyrOoPVuxMvYUJ6ZeRgbN6q1wTho/86u941im9kgi4qbgOeu+A4ddoJ/3nkFPM25TgsYJDWwRvSN3CBMpEidRNMcov4LvBLdxCK/4X/Y9bsiqR+bfeJlObi00bnpDZNhsQNpGTo40dUoaOSqYAOEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMyZ+uLO6JYjrzvVz4v0kT4lnrzf1PNysZWN0rRy3ZI=;
 b=Y7Q4NMuDA8QLqm+lviGQykytvFvqDEZRRqBc1XOIuqbTa1Ju2OErXrilkaFsFESOzruYOqkzcjLnRvhyT0hLwy1t7CUVBdAU2SzHapk7BfiFrqL/qDRcMgrrBmO1dYf28ZDdlw0Ewr3u020adSJSTCfmU+TlPIpKGsOHOlwBqAs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3901.namprd12.prod.outlook.com (2603:10b6:208:16c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 22 Sep
 2021 06:58:16 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.018; Wed, 22 Sep 2021
 06:58:16 +0000
Subject: Re: [PATCH 1/2] Enable buddy memory manager support
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, matthew.auld@intel.com, daniel@ffwll.ch,
 alexander.deucher@amd.com
References: <20210920192011.221102-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bec28f12-11ea-6662-014a-08bc427213dc@amd.com>
Date: Wed, 22 Sep 2021 08:58:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210920192011.221102-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0032.eurprd03.prod.outlook.com
 (2603:10a6:208:14::45) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR03CA0032.eurprd03.prod.outlook.com (2603:10a6:208:14::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14 via Frontend Transport; Wed, 22 Sep 2021 06:58:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b50b181-5209-4204-e23e-08d97d9659f8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3901:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB390194C7D71C8B6ED32F482083A29@MN2PR12MB3901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:137;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GFoN/9Ag5cKBV+LTvSodWbbe6RE+Jr4HUXgDx4Og1Tb1zH01Q4lylMeKyK0RTH+eftdbjKqbkvR1Pi7qFGQoSxQzQTHc4JM63mnaKMtfRK9wFsMoue+wpV0DG/VNhgJ+uI0ykRu6QuZs8xVF7naifQAoHtHkFJSJdShUdknmiTstqUWHPiV1zb1EQEfQDGO+NplVxIs0Qn3XFeW3SbTUfNn4ZSkKppr+LoHWWHfRdM1pBH4lf7R2SvvX2Hx02h/Cv4eJ8tjo1EpOoatIYvm4iEFRbutGwcqvtz+ms+HUAwtodWB7EQtyP0Pidgwz0+DfQO47kbOzUwFm529qYXHefOQdkM1eCUFw1Fam3w1Zvsf9Iv3SdgN7ZEUbFRap4KHXOiZzDbtFrnP/l41xkE6nS3ECwD4LhpJGzPfeMnTst4AueAZQt6T9LQ3p/E2M6685V2cTP2W3ccQ8d3YZh2QONaCqYc4myz3uCqanR5k2NXqxB6BZBZZuU1GiTPEOafddEJzDIIBtRrXuglmjOMu0EontuhgwGlWrnl44E6fujmnjFSBIRSogWnDsvfHT5KqqRQqVt8uBej3jhqYGUY1ca8D3C1iieQTa61BHwwUNUIQY2JSCclE0XdfHecE94rim+xF/ywWZjUvl3nGfUl6BtMCmLD+ArkfHWzMMSlUZhwK/9E7lDp3CY9XuhkwSIeDjfeuvTY2wxOqX0BQhrNdwX/++UI7tcdeqYRhUPVo9ZFrU3H9ILDGtyu4E03Cqp6fh2EsCubunXkVvZ4BQfoYQ2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(66556008)(83380400001)(66946007)(38100700002)(6486002)(508600001)(2616005)(5660300002)(86362001)(66476007)(30864003)(16576012)(186003)(2906002)(316002)(6636002)(6666004)(8676002)(26005)(8936002)(31696002)(31686004)(956004)(134034003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmpkdmtBa2NsdEJNMVhTaEZzSlZPTUlzZ1hNS0xYSHp3NzZWeXA1aUFOVEJi?=
 =?utf-8?B?c0Q0OXBtZDBieWw0U1Y4aVREdlVCaXFaTW5taGJ0eEo3dEVidy9BRDI3c2hK?=
 =?utf-8?B?My9oaVV4NkUzcC9WaVR2c2Y3QVc5TXI3WmlLa211dkRKL053N1A4ZGJTZ3Zv?=
 =?utf-8?B?TkUvbXREY3ovTlo0V1htNXMzNkNyU1NIZG5oMHluMktxYmtzUmdBc2tycUY2?=
 =?utf-8?B?Yi9SRDYwTThzZmh3U2xnVEczbTdGNlg1TU5GemJSS3VPNW16MWU1d1lqWGYx?=
 =?utf-8?B?Z1F6VGZWaDhqOWthS1VIMVVFbVZZVEJXc09OaEFDcjJuRmNGdkV0L3FYSmt6?=
 =?utf-8?B?a0pmaXZZMUdURVRrSCsyZDUyN1c3dUMxSmJncjRRbGRqMFNFTkkzOE5yM2E3?=
 =?utf-8?B?S2wzTnV3eHpTZjBJSnB1TExqUFZBMUREZ1ZHKzNvRkdXejB5SjJUVkdFeWJK?=
 =?utf-8?B?dS9oRWlNUVZtbmJYS1pSS1ZmYytjdU1MNGJwdG1XZE5MLzlEOG8xdHlqTW0y?=
 =?utf-8?B?bmhJK29Nd2UraytSNWFveHVTZ3VFSkpoV3dQTjcvUFRacHpPeGd3R0ZoYVhK?=
 =?utf-8?B?aTB3OHdvYllFRmZVLzh1SW83cTh4SkwwY2NpbHhmZEVoUFJoUEFsdER2ditH?=
 =?utf-8?B?Q0xmMUZzSGdDWk5jVW9lS2RQR0tKS0FkQ0VzV1hVWE05OVE3TWpHdUlzaW16?=
 =?utf-8?B?cTFxTk00ZUxldVB3MHRKeHVIN1dwWTJiY05PRTZzeVdLaUtrZUlRQjBJSDd0?=
 =?utf-8?B?emx3YmlvTzNjOWRlUU11bHROR2d4SEw5amhnbW52eHNURVpBTy9BYWV6cXVV?=
 =?utf-8?B?T3lrT05WY0hncUhSbnZjZDdmZ2pkNnpZaktZVFNvWWQvWTFyem5hWkZaZnBE?=
 =?utf-8?B?U053YUlKeEJWaWMzNklyalFCS1d3MDd3RU41bnBHME4zc3Jic1BVczNQS3Zu?=
 =?utf-8?B?TnRHaHBqZ21oWE04QjFrY2psc0J1cktmWkxRUHFzdE9hMDZWaWpHdENSWkJs?=
 =?utf-8?B?TFlCNHNKN1pmMjU2b05NUUswajZmNVppd1QxMzhvYzg2Vzh2OURIcVVHN3o5?=
 =?utf-8?B?ZXExaURaZEdKdkpIK3hBWGFqYnRiQVVXK2F0VVFveGxMMUtQR1h1aW9ZZGgz?=
 =?utf-8?B?ZVhGZDRmZTRMQ3YwRHNhdXNhT0lzVlBTWmF0WWdjeUZXQW44UnVzWmFTdWpK?=
 =?utf-8?B?YStBTUI5UGNIUElWVWRKWVNnL2xpc0VPQWVrQVdONmpTdHpTUXJSMTVaTFIy?=
 =?utf-8?B?TE9YWEwza3drRmZvdzdTdmJxejJzZDZXSUs5UW9ZZk5yVENrMlBFQ1YwZEJu?=
 =?utf-8?B?S0sveng1QnoycXRkTmdqZlM4V1VHUVgrSGE3R2FDcE9La1A5SzAvN3BXSWlx?=
 =?utf-8?B?TmxnTEtVSHVwWkpFRUZJRWxvTHNCeWhUY0lGNUhyQmRRRUJwbDBpaGlxY1RR?=
 =?utf-8?B?N1d4S2h4a2FlVmVYRzB3WDQ5bEdCUC9XcHRBSzdySlFCVkt6Sy9hZjNlZGlN?=
 =?utf-8?B?d1VZcVRyS1EvR2dQMEVsdkRQdDZVTjdCK3ltUG5VZmNlQjNpYm84UGNNRDU3?=
 =?utf-8?B?N2tPZU1jMnFBbkZXUzdGL2h4QXVwSThLdktIVnNlbG0xRlpHTnlNalp4YnpL?=
 =?utf-8?B?S3hjL0wvWXo1R1N4ZkE3Ti9Rc25jL3NmN0VaNDZTNmRFQnNFR0RwQUJSSWEw?=
 =?utf-8?B?ZjYrU3BDdXZUT3BpWXQyRXp2K0Rmb3BmVkU3QjkvWTJ6UzF4SDR1aHhwKy96?=
 =?utf-8?Q?jI0A15hYQjjJGKkBWKGsUelxaUUb7yWzzI6o9SV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b50b181-5209-4204-e23e-08d97d9659f8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 06:58:16.1852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XkgJgcOUCda5pcNxyYXA7leg8NUix8X1+LPX2/vfezX8+4XjUd9ErYwG9ho6VmYe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3901
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

Am 20.09.21 um 21:20 schrieb Arunpravin:
> Port Intel buddy system manager to drm root folder
> Add CPU mappable/non-mappable region support to the drm buddy manager

And where is the patch to switch i915 and remove the Intel copy of this?

In general I think that every public function here needs a kerneldoc 
description what it is all about.

Regards,
Christian.

>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/Makefile    |   2 +-
>   drivers/gpu/drm/drm_buddy.c | 465 ++++++++++++++++++++++++++++++++++++
>   include/drm/drm_buddy.h     | 154 ++++++++++++
>   3 files changed, 620 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/gpu/drm/drm_buddy.c
>   create mode 100644 include/drm/drm_buddy.h
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index a118692a6df7..fe1a2fc09675 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -18,7 +18,7 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
>   		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>   		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
>   		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> -		drm_managed.o drm_vblank_work.o
> +		drm_managed.o drm_vblank_work.o drm_buddy.o
>   
>   drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
>   			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> new file mode 100644
> index 000000000000..f07919a004b6
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -0,0 +1,465 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright � 2021 Intel Corporation
> + */
> +
> +#include <linux/kmemleak.h>
> +#include <drm/drm_buddy.h>
> +
> +static struct drm_buddy_block *drm_block_alloc(struct drm_buddy_mm *mm,
> +			struct drm_buddy_block *parent, unsigned int order,
> +			u64 offset)
> +{
> +	struct drm_buddy_block *block;
> +
> +	BUG_ON(order > DRM_BUDDY_MAX_ORDER);
> +
> +	block = kmem_cache_zalloc(mm->slab_blocks, GFP_KERNEL);
> +	if (!block)
> +		return NULL;
> +
> +	block->header = offset;
> +	block->header |= order;
> +	block->parent = parent;
> +	block->start = offset >> PAGE_SHIFT;
> +	block->size = (mm->chunk_size << order) >> PAGE_SHIFT;
> +
> +	BUG_ON(block->header & DRM_BUDDY_HEADER_UNUSED);
> +	return block;
> +}
> +
> +static void drm_block_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block)
> +{
> +	kmem_cache_free(mm->slab_blocks, block);
> +}
> +
> +static void add_ordered(struct drm_buddy_mm *mm, struct drm_buddy_block *block)
> +{
> +	struct drm_buddy_block *node;
> +
> +	if (list_empty(&mm->free_list[drm_buddy_block_order(block)])) {
> +		list_add(&block->link,
> +				&mm->free_list[drm_buddy_block_order(block)]);
> +		return;
> +	}
> +
> +	list_for_each_entry(node, &mm->free_list[drm_buddy_block_order(block)], link)
> +		if (block->start > node->start)
> +			break;
> +
> +	__list_add(&block->link, node->link.prev, &node->link);
> +}
> +
> +static void mark_allocated(struct drm_buddy_block *block)
> +{
> +	block->header &= ~DRM_BUDDY_HEADER_STATE;
> +	block->header |= DRM_BUDDY_ALLOCATED;
> +
> +	list_del(&block->link);
> +}
> +
> +static void mark_free(struct drm_buddy_mm *mm,
> +		      struct drm_buddy_block *block)
> +{
> +	block->header &= ~DRM_BUDDY_HEADER_STATE;
> +	block->header |= DRM_BUDDY_FREE;
> +
> +	add_ordered(mm, block);
> +}
> +
> +static void mark_split(struct drm_buddy_block *block)
> +{
> +	block->header &= ~DRM_BUDDY_HEADER_STATE;
> +	block->header |= DRM_BUDDY_SPLIT;
> +
> +	list_del(&block->link);
> +}
> +
> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
> +{
> +	unsigned int i;
> +	u64 offset;
> +
> +	if (size < chunk_size)
> +		return -EINVAL;
> +
> +	if (chunk_size < PAGE_SIZE)
> +		return -EINVAL;
> +
> +	if (!is_power_of_2(chunk_size))
> +		return -EINVAL;
> +
> +	size = round_down(size, chunk_size);
> +
> +	mm->size = size;
> +	mm->chunk_size = chunk_size;
> +	mm->max_order = ilog2(size) - ilog2(chunk_size);
> +
> +	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
> +
> +	mm->slab_blocks = KMEM_CACHE(drm_buddy_block, SLAB_HWCACHE_ALIGN);
> +
> +	if (!mm->slab_blocks)
> +		return -ENOMEM;
> +
> +	mm->free_list = kmalloc_array(mm->max_order + 1,
> +				      sizeof(struct list_head),
> +				      GFP_KERNEL);
> +	if (!mm->free_list)
> +		goto out_destroy_slab;
> +
> +	for (i = 0; i <= mm->max_order; ++i)
> +		INIT_LIST_HEAD(&mm->free_list[i]);
> +
> +	mm->n_roots = hweight64(size);
> +
> +	mm->roots = kmalloc_array(mm->n_roots,
> +				  sizeof(struct drm_buddy_block *),
> +				  GFP_KERNEL);
> +	if (!mm->roots)
> +		goto out_free_list;
> +
> +	offset = 0;
> +	i = 0;
> +
> +	/*
> +	 * Split into power-of-two blocks, in case we are given a size that is
> +	 * not itself a power-of-two.
> +	 */
> +	do {
> +		struct drm_buddy_block *root;
> +		unsigned int order;
> +		u64 root_size;
> +
> +		root_size = rounddown_pow_of_two(size);
> +		order = ilog2(root_size) - ilog2(chunk_size);
> +
> +		root = drm_block_alloc(mm, NULL, order, offset);
> +		if (!root)
> +			goto out_free_roots;
> +
> +		mark_free(mm, root);
> +
> +		BUG_ON(i > mm->max_order);
> +		BUG_ON(drm_buddy_block_size(mm, root) < chunk_size);
> +
> +		mm->roots[i] = root;
> +
> +		offset += root_size;
> +		size -= root_size;
> +		i++;
> +	} while (size);
> +
> +	return 0;
> +
> +out_free_roots:
> +	while (i--)
> +		drm_block_free(mm, mm->roots[i]);
> +	kfree(mm->roots);
> +out_free_list:
> +	kfree(mm->free_list);
> +out_destroy_slab:
> +	kmem_cache_destroy(mm->slab_blocks);
> +	return -ENOMEM;
> +}
> +EXPORT_SYMBOL(drm_buddy_init);
> +
> +void drm_buddy_fini(struct drm_buddy_mm *mm)
> +{
> +	int i;
> +
> +	for (i = 0; i < mm->n_roots; ++i) {
> +		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
> +		drm_block_free(mm, mm->roots[i]);
> +	}
> +
> +	kfree(mm->roots);
> +	kfree(mm->free_list);
> +	kmem_cache_destroy(mm->slab_blocks);
> +}
> +EXPORT_SYMBOL(drm_buddy_fini);
> +
> +static int split_block(struct drm_buddy_mm *mm,
> +		       struct drm_buddy_block *block)
> +{
> +	unsigned int block_order = drm_buddy_block_order(block) - 1;
> +	u64 offset = drm_buddy_block_offset(block);
> +
> +	BUG_ON(!drm_buddy_block_is_free(block));
> +	BUG_ON(!drm_buddy_block_order(block));
> +
> +	block->left = drm_block_alloc(mm, block, block_order, offset);
> +	if (!block->left)
> +		return -ENOMEM;
> +
> +	block->right = drm_block_alloc(mm, block, block_order,
> +					offset + (mm->chunk_size << block_order));
> +	if (!block->right) {
> +		drm_block_free(mm, block->left);
> +		return -ENOMEM;
> +	}
> +
> +	mark_free(mm, block->left);
> +	mark_free(mm, block->right);
> +
> +	mark_split(block);
> +
> +	return 0;
> +}
> +
> +static struct drm_buddy_block *
> +get_buddy(struct drm_buddy_block *block)
> +{
> +	struct drm_buddy_block *parent;
> +
> +	parent = block->parent;
> +	if (!parent)
> +		return NULL;
> +
> +	if (parent->left == block)
> +		return parent->right;
> +
> +	return parent->left;
> +}
> +
> +static void __drm_buddy_free(struct drm_buddy_mm *mm,
> +			      struct drm_buddy_block *block)
> +{
> +	struct drm_buddy_block *parent;
> +
> +	while ((parent = block->parent)) {
> +		struct drm_buddy_block *buddy;
> +
> +		buddy = get_buddy(block);
> +
> +		if (!drm_buddy_block_is_free(buddy))
> +			break;
> +
> +		list_del(&buddy->link);
> +
> +		drm_block_free(mm, block);
> +		drm_block_free(mm, buddy);
> +
> +		block = parent;
> +	}
> +
> +	mark_free(mm, block);
> +}
> +
> +void drm_buddy_free(struct drm_buddy_mm *mm,
> +		     struct drm_buddy_block *block)
> +{
> +	BUG_ON(!drm_buddy_block_is_allocated(block));
> +	__drm_buddy_free(mm, block);
> +}
> +EXPORT_SYMBOL(drm_buddy_free);
> +
> +void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
> +{
> +	struct drm_buddy_block *block, *on;
> +
> +	list_for_each_entry_safe(block, on, objects, link) {
> +		drm_buddy_free(mm, block);
> +		cond_resched();
> +	}
> +	INIT_LIST_HEAD(objects);
> +}
> +EXPORT_SYMBOL(drm_buddy_free_list);
> +
> +/*
> + * Allocate power-of-two block. The order value here translates to:
> + *
> + *   0 = 2^0 * mm->chunk_size
> + *   1 = 2^1 * mm->chunk_size
> + *   2 = 2^2 * mm->chunk_size
> + *   ...
> + */
> +struct drm_buddy_block *
> +drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order,
> +		bool bar_enabled, unsigned int limit,
> +		enum drm_buddy_alloc_mode mode)
> +{
> +	struct drm_buddy_block *block = NULL;
> +	unsigned int pages;
> +	unsigned int i;
> +	int err;
> +
> +	pages = (mm->chunk_size << order) >> PAGE_SHIFT;
> +
> +	for (i = order; i <= mm->max_order; ++i) {
> +		if (mode == DRM_BUDDY_TOP_DOWN) {
> +			if (!list_empty(&mm->free_list[i])) {
> +				block = list_first_entry(&mm->free_list[i],
> +						struct drm_buddy_block, link);
> +
> +				if (bar_enabled) {
> +					if (!(block->start > limit))
> +						continue;
> +				}
> +
> +				break;
> +			}
> +		} else if (mode == DRM_BUDDY_BOTTOM_UP) {
> +			if (!list_empty(&mm->free_list[i])) {
> +				block = list_last_entry(&mm->free_list[i],
> +						struct drm_buddy_block, link);
> +
> +				if (bar_enabled) {
> +					if (!(block->start < limit &&
> +							(block->start + pages) < limit))
> +						continue;
> +				}
> +
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (!block)
> +		return ERR_PTR(-ENOSPC);
> +
> +	BUG_ON(!drm_buddy_block_is_free(block));
> +
> +	while (i != order) {
> +		err = split_block(mm, block);
> +		if (unlikely(err))
> +			goto out_free;
> +
> +		/* Go low */
> +		if (mode == DRM_BUDDY_TOP_DOWN)
> +			block = block->right;
> +		else
> +			block = block->left;
> +		i--;
> +	}
> +
> +	if (mode == DRM_BUDDY_TOP_DOWN && bar_enabled) {
> +		if (!(block->start > limit))
> +			return ERR_PTR(-ENOSPC);
> +	} else if (mode == DRM_BUDDY_BOTTOM_UP && bar_enabled) {
> +		if (!(block->start < limit &&
> +				(block->start + pages) < limit))
> +			return ERR_PTR(-ENOSPC);
> +	}
> +
> +	mark_allocated(block);
> +	kmemleak_update_trace(block);
> +	return block;
> +
> +out_free:
> +	if (i != order)
> +		__drm_buddy_free(mm, block);
> +	return ERR_PTR(err);
> +}
> +EXPORT_SYMBOL(drm_buddy_alloc);
> +
> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= e2 && e1 >= s2;
> +}
> +
> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
> +{
> +	return s1 <= s2 && e1 >= e2;
> +}
> +
> +/*
> + * Allocate range. Note that it's safe to chain together multiple alloc_ranges
> + * with the same blocks list.
> + *
> + * Intended for pre-allocating portions of the address space, for example to
> + * reserve a block for the initial framebuffer or similar, hence the expectation
> + * here is that drm_buddy_alloc() is still the main vehicle for
> + * allocations, so if that's not the case then the drm_mm range allocator is
> + * probably a much better fit, and so you should probably go use that instead.
> + */
> +int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
> +			struct list_head *blocks,
> +			u64 start, u64 size)
> +{
> +	struct drm_buddy_block *block;
> +	struct drm_buddy_block *buddy;
> +	LIST_HEAD(allocated);
> +	LIST_HEAD(dfs);
> +	u64 end;
> +	int err;
> +	int i;
> +
> +	if (size < mm->chunk_size)
> +		return -EINVAL;
> +
> +	if (!IS_ALIGNED(size | start, mm->chunk_size))
> +		return -EINVAL;
> +
> +	if (range_overflows(start, size, mm->size))
> +		return -EINVAL;
> +
> +	for (i = 0; i < mm->n_roots; ++i)
> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
> +
> +	end = start + size - 1;
> +
> +	do {
> +		u64 block_start;
> +		u64 block_end;
> +
> +		block = list_first_entry_or_null(&dfs,
> +						 struct drm_buddy_block,
> +						 tmp_link);
> +		if (!block)
> +			break;
> +
> +		list_del(&block->tmp_link);
> +
> +		block_start = drm_buddy_block_offset(block);
> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
> +
> +		if (!overlaps(start, end, block_start, block_end))
> +			continue;
> +
> +		if (drm_buddy_block_is_allocated(block)) {
> +			err = -ENOSPC;
> +			goto err_free;
> +		}
> +
> +		if (contains(start, end, block_start, block_end)) {
> +			if (!drm_buddy_block_is_free(block)) {
> +				err = -ENOSPC;
> +				goto err_free;
> +			}
> +
> +			mark_allocated(block);
> +			list_add_tail(&block->link, &allocated);
> +			continue;
> +		}
> +
> +		if (!drm_buddy_block_is_split(block)) {
> +			err = split_block(mm, block);
> +			if (unlikely(err))
> +				goto err_undo;
> +		}
> +
> +		list_add(&block->right->tmp_link, &dfs);
> +		list_add(&block->left->tmp_link, &dfs);
> +	} while (1);
> +
> +	list_splice_tail(&allocated, blocks);
> +	return 0;
> +
> +err_undo:
> +	/*
> +	 * We really don't want to leave around a bunch of split blocks, since
> +	 * bigger is better, so make sure we merge everything back before we
> +	 * free the allocated blocks.
> +	 */
> +	buddy = get_buddy(block);
> +	if (buddy &&
> +	    (drm_buddy_block_is_free(block) &&
> +	     drm_buddy_block_is_free(buddy)))
> +		__drm_buddy_free(mm, block);
> +
> +err_free:
> +	drm_buddy_free_list(mm, &allocated);
> +	return err;
> +}
> +EXPORT_SYMBOL(drm_buddy_alloc_range);
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> new file mode 100644
> index 000000000000..50e4d819a3dd
> --- /dev/null
> +++ b/include/drm/drm_buddy.h
> @@ -0,0 +1,154 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright � 2021 Intel Corporation
> + */
> +
> +#ifndef __DRM_BUDDY_H__
> +#define __DRM_BUDDY_H__
> +
> +#include <linux/bitops.h>
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <linux/sched.h>
> +
> +#define range_overflows(start, size, max) ({ \
> +	typeof(start) start__ = (start); \
> +	typeof(size) size__ = (size); \
> +	typeof(max) max__ = (max); \
> +	(void)(&start__ == &size__); \
> +	(void)(&start__ == &max__); \
> +	start__ >= max__ || size__ > max__ - start__; \
> +})
> +
> +enum drm_buddy_alloc_mode {
> +	 DRM_BUDDY_TOP_DOWN = 0,
> +	 DRM_BUDDY_BOTTOM_UP,
> +	 DRM_BUDDY_ALLOC_RANGE
> +};
> +
> +struct drm_buddy_block {
> +#define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> +#define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
> +#define   DRM_BUDDY_ALLOCATED	   (1 << 10)
> +#define   DRM_BUDDY_FREE	   (2 << 10)
> +#define   DRM_BUDDY_SPLIT	   (3 << 10)
> +/* Free to be used, if needed in the future */
> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
> +#define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
> +	u64 header;
> +	/* Store start and size fields in pages */
> +	u64 start;
> +	u64 size;
> +
> +	struct drm_buddy_block *left;
> +	struct drm_buddy_block *right;
> +	struct drm_buddy_block *parent;
> +
> +	void *private; /* owned by creator */
> +
> +	/*
> +	 * While the block is allocated by the user through drm_buddy_alloc*,
> +	 * the user has ownership of the link, for example to maintain within
> +	 * a list, if so desired. As soon as the block is freed with
> +	 * drm_buddy_free* ownership is given back to the mm.
> +	 */
> +	struct list_head link;
> +	struct list_head tmp_link;
> +};
> +
> +/* Order-zero must be at least PAGE_SIZE */
> +#define DRM_BUDDY_MAX_ORDER (63 - PAGE_SHIFT)
> +
> +/*
> + * Binary Buddy System.
> + *
> + * Locking should be handled by the user, a simple mutex around
> + * drm_buddy_alloc* and drm_buddy_free* should suffice.
> + */
> +struct drm_buddy_mm {
> +	struct kmem_cache *slab_blocks;
> +	/* Maintain a free list for each order. */
> +	struct list_head *free_list;
> +
> +	/*
> +	 * Maintain explicit binary tree(s) to track the allocation of the
> +	 * address space. This gives us a simple way of finding a buddy block
> +	 * and performing the potentially recursive merge step when freeing a
> +	 * block.  Nodes are either allocated or free, in which case they will
> +	 * also exist on the respective free list.
> +	 */
> +	struct drm_buddy_block **roots;
> +
> +	/*
> +	 * Anything from here is public, and remains static for the lifetime of
> +	 * the mm. Everything above is considered do-not-touch.
> +	 */
> +	unsigned int n_roots;
> +	unsigned int max_order;
> +
> +	/* Must be at least PAGE_SIZE */
> +	u64 chunk_size;
> +	u64 size;
> +};
> +
> +static inline u64
> +drm_buddy_block_offset(struct drm_buddy_block *block)
> +{
> +	return block->header & DRM_BUDDY_HEADER_OFFSET;
> +}
> +
> +static inline unsigned int
> +drm_buddy_block_order(struct drm_buddy_block *block)
> +{
> +	return block->header & DRM_BUDDY_HEADER_ORDER;
> +}
> +
> +static inline unsigned int
> +drm_buddy_block_state(struct drm_buddy_block *block)
> +{
> +	return block->header & DRM_BUDDY_HEADER_STATE;
> +}
> +
> +static inline bool
> +drm_buddy_block_is_allocated(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
> +}
> +
> +static inline bool
> +drm_buddy_block_is_free(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_state(block) == DRM_BUDDY_FREE;
> +}
> +
> +static inline bool
> +drm_buddy_block_is_split(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_state(block) == DRM_BUDDY_SPLIT;
> +}
> +
> +static inline u64
> +drm_buddy_block_size(struct drm_buddy_mm *mm,
> +		      struct drm_buddy_block *block)
> +{
> +	return mm->chunk_size << drm_buddy_block_order(block);
> +}
> +
> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
> +
> +void drm_buddy_fini(struct drm_buddy_mm *mm);
> +
> +struct drm_buddy_block *
> +drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order,
> +		bool bar_limit_enabled, unsigned int limit,
> +		enum drm_buddy_alloc_mode mode);
> +
> +int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
> +			   struct list_head *blocks,
> +			   u64 start, u64 size);
> +
> +void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
> +
> +void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects);
> +
> +#endif

