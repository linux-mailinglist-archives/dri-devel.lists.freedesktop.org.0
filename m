Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03156387823
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060DB6EB36;
	Tue, 18 May 2021 11:55:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28E56EB37;
 Tue, 18 May 2021 11:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oC/xwYF6rT5YccDNyxwgh2L15Qm/8WK+KG7flu6V06W1WoGQBGcmcjzo1MiUg82OTB6OJQ2e0rAX3+8Yos8w9kQTiB72xooqluuutJQh7zUFkJhM+pwd626fDO6mF/NNG1jEc6EuU5RUb+GbmZOQQ8QXMEFesF7TFttR6uapsxcHCkxEarWHN2fm7MdGSX7x9XC78QObHdOM8o/UFe6/Fj40/zKV/nQqY3NuY1QStUtjL+jBrIgow2i5cDP9CMDV/b3/sxP7OpWg9gygB+k+TcO2gyJhEXaIBGqOC7Ae3FQXubAuu1SLdVycAl5qZ1w8SwlryoBii0+8gKx0Ku0qEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq29/rDIiCfLldKKLgC8u+dGFhyjAxFF0vPLPcOThgA=;
 b=RYnZqHmaD/I6Fx86DDxn1fYeGSWG8vUOzrEE+hjF9T0LL2jcIJu156e+Ewsxd1nUEYLICkQ6U9il4KsBj1bgYiQpGF4pjTGWEnAor15am/KH4rJH1uvFhJH7Fc5NtxwrC3hl5IdfOjbndkpa+IQCU9Rm+yb+vNHjMEMcpgX28VG0BEQZU72ttAadex1tliZfo2iOSq/gb0n7sv1X9r8g7K+Flu4iERSEIxV8J21p/pKGo7oq1/3Z9FTNETttqtMYNK25/WCacE0DdLMWBzIcBUO504/qP48N1GIVOlHKBoaVHbp7nbS3xM5PNtxoBCvKhBQe1nGElfurZyG24x9zBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq29/rDIiCfLldKKLgC8u+dGFhyjAxFF0vPLPcOThgA=;
 b=3rVMdkYbuDYptV8aPS5Qtg6qkwKxkDEUPniFldE898V29oiOGS/cpnYVE6qL93+I2i8Y8HNiqy3etkt0uns3dP2dpNRRTFWoL3vKSOPxlw/3nSKq0Aps6K2R20B/XIoNPXNV+Eo3FA91vkGVqGG/tvY4aNY781TQMenMDbcZhzY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2546.namprd12.prod.outlook.com (2603:10b6:207:3f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 11:55:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 11:55:08 +0000
Subject: Re: [PATCH v2 08/15] drm/i915/ttm Add a generic TTM memcpy move for
 page-based iomem
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-9-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6149ee00-fa4a-3757-117a-8d622eb42070@amd.com>
Date: Tue, 18 May 2021 13:55:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210518082701.997251-9-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:8470:36a5:2010:f0c4]
X-ClientProxiedBy: AM0PR10CA0031.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:8470:36a5:2010:f0c4]
 (2a02:908:1252:fb60:8470:36a5:2010:f0c4) by
 AM0PR10CA0031.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 11:55:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca6cacec-41a0-478b-1082-08d919f3c832
X-MS-TrafficTypeDiagnostic: BL0PR12MB2546:
X-Microsoft-Antispam-PRVS: <BL0PR12MB254637F3497C81C0A896EDCE832C9@BL0PR12MB2546.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BzqJJBIT3SpWWc3MB4sfDDAJX5297y7uie6/TY1pLDIZaftp4wmmEQEQzJBFw2MyyYz5E1YnSF0Hx3URybbMzcwrCQYabk+AVmm7V9eHF3vW0c7LQgDHu/TXlumDMpdish/OPQyrPukJ9QMR+8Tm4+G0O3Uu8VIjT6mmWFDrmwOQlAxHTSKvDROdd02BN9cqydH2DUw/PpPgCJ7AI+vP6CzJnVk93pTCwMX6F7pq1DYG0Fw/0xjje98vhV4fpShe3V/XLNcRKf3BFSvm0V/4mPnoe5WuN7rLmqLOzkkCdj312lQ8MuLLzP8aiJw3pIeElUAWJnNQmVP1VZqaeAGnanLEbT3N/XttHe9ENPDo0kXlR/gJ1HIx1uf0mUMRyj0raAeE7WNnC8f5xcz4MH78NOmRPcguONEZZrecb7ixoOUK2MUdwG372EWWmHdprEd8tymh6bKyhhfR+O4UzoNJGFptfFTpqogU1nPfT4vdaNwAFHUbZ6DxRt4YWXrAmGF1bY1moBerA+NJtiTqkRPMZDYh8STEbASO/3jdks1R2N5e5jdMQqoRttwwq2GD4truMb98gjSBGSO5Q1uYBYD63gT9t36JbeuK23shQhJnJ+mkT9N2tg9EhF8A1Pf0Pr7rTB64nBZFiT6zI3Kf8OvRWnewg0UMxzmuigZlWKmkuQd+fNzXec4MWrF3dx6VEHqP52vlxWkrT/DOELahHLgEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(6486002)(30864003)(66946007)(66556008)(2616005)(8676002)(36756003)(83380400001)(2906002)(5660300002)(16526019)(186003)(31696002)(316002)(38100700002)(66574015)(8936002)(31686004)(66476007)(86362001)(478600001)(52116002)(6666004)(41533002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c2RaTlpWSHVBZUFNNzB4dUNVcFdGSGRnRGNoUW5PMjZVN0ltYXBBWnhObEQx?=
 =?utf-8?B?SmRXV1lrRko5T3dJM2JjYUlhM0EzUStmbmRvaFFESWVXWWFUOCt6c0tkMGdx?=
 =?utf-8?B?UFpneW1yK0FaOWZKVjZsVmlyZTljQmZsS3ErVDdRMnRkdlo2S1czOEI3d1Uw?=
 =?utf-8?B?c1dQWDVzbDRTMGJSUDFtejFTTmtGaENCTEZ5TGpGY3ptOG1RUlViWU9WKzdO?=
 =?utf-8?B?TVdHTGp6a0hvamxPSDlwb1pjYUhmZ20yR2lNdUlMLzk3VFBxYjhGc1lQZzlq?=
 =?utf-8?B?U3ZkN2dQRXhQbko1ei80czZIZ0J6NmgyWnNBQTl0TGFoQmg0SVpacmNnUnRB?=
 =?utf-8?B?eEhZWEVkRW9IUkNoNTBkVHBMOEdMdlRRWDlXT2tBTUdWZzl2cjk5ZkFaMzNP?=
 =?utf-8?B?dGgvWURMMk95aVo4RzJsemNuWUFaMnN5N1VKNWxMekxJNjRSNlJWUk1OTTJh?=
 =?utf-8?B?SzN2c0N2OHZ5ZE16ZVhQSGlvalhrSFFLUzlnQnNGRENpbWo5Q25MTDlLTEg3?=
 =?utf-8?B?cWYrUERNSFhzRWxxWGE1bjJxMEFvWXZzcGdvZElCd3lGV003SzUxc3oybDVm?=
 =?utf-8?B?M0dGeFVEU2xmZkZlekNzeCs4NEh0VUlUelg4ZGtWdCtYVUtZY2hlYUt3TDJz?=
 =?utf-8?B?VTBoK245UXRuU2ZVeEZRTlhZNkFtQzJFUVNRdlA3YytJY3dOSkVxSUxtNGxv?=
 =?utf-8?B?SHpMS1NpZ01LYXd3aDdFbk1zbHFZbXZEMGlseGlhWlZEWlZhYkJZaXFpYTZn?=
 =?utf-8?B?bjMvMFJmaVNoQkVkZ25LNTB2VnIzdTNiVVRWRmtnWHhITC90cHd6TWltWkho?=
 =?utf-8?B?ZlBMeWdkNUVxSEdHOGU1Q01pYTZabFp5WmtqZHg0UXRJZVFjU2lyRkpCU0V6?=
 =?utf-8?B?bHVJeVliMVVGNGFTcUM1V1UxOEMzYVg4N0RjaVRwVm1MWTBlWUNpb3AzSUtR?=
 =?utf-8?B?TGdYelBscEpuNi8xbC8xbi82bHNiUGozakxHN0YrOElKcjBpNDllS05neWZr?=
 =?utf-8?B?cEVCNnUrRVRYUGdzNVk3RmtCREtGQXNTZVdNY0hET1dCakdibHkyY3VaLy96?=
 =?utf-8?B?bDVWUGNkM0IrRWx0S2JQWmdnQWpVU2s4Y3ZpblVJVzczM2FWMzlKNWQwQjZs?=
 =?utf-8?B?clhvQitKWUV5bnRBWVZ5bWdwWnN5U00wc1Fuck9ocWZMcXpkbm1TSE9wcFhQ?=
 =?utf-8?B?MDRBOU9OYWFna1ZBNlkzTE1DVTZ4U0RRSTZkTHQycTNXUThBc0luZUxxN1ZP?=
 =?utf-8?B?by9sdHRuZDVTMW43M0I4Q2M5ZW9NYVFMRzdHUkQ4MFV4aW9zc1g1WHJqajd5?=
 =?utf-8?B?SlU3T2N4OEdXZ0hzSlAwUVU3OEpFT3d6Q2k1MnYzNHpTUFlhRUMxdW42NU1m?=
 =?utf-8?B?RXZrUHZHYXFjRGpCMk9QeTl2bnVoZzVuZk00V29tekMwQXRmY2hQWG9TL1lW?=
 =?utf-8?B?bCtiTUk4K244RkdmbWtEZ1gxb3R3Y0RnNHhXdWxhU2FHYWdlbVV6eGN1WnJm?=
 =?utf-8?B?RzZoeTU5WmNRdGFhRXZPV21pQUFCdEFWQlZ5UDVFK3BySlUrSmxxN2pxbWlw?=
 =?utf-8?B?eW1mMXhscXhJSTZrTy9ZQ2pEbDNKblZQbDM2NWdJUXJzZURsWWt3SWY1SThF?=
 =?utf-8?B?SE5YZnlKUDBzanNzVkJEeUlZODhJYStobkhFdUxFM0RHRDZMZllyU241QjFV?=
 =?utf-8?B?Y3FRNjBYbysxcFk5Q0JYaUVVQWk2UEFnNnVPK0p6WC84ZGdMcERQUkNXL2pr?=
 =?utf-8?B?T0dHdncwZTB0TEc4UDhYWnpBcUdjdzRRUTREWDhjNXNBSjczV2pyWWhxdlZl?=
 =?utf-8?B?SG1TcmQ1R2dUekliSG1DUVZpclNNNVovMDlyZlQ0MzBHaWJOUW5BYWpEbUJl?=
 =?utf-8?Q?vTwhUavzWXZHD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca6cacec-41a0-478b-1082-08d919f3c832
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 11:55:07.9145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7JpyfuBGJg1FLyRDIWKuq9hq4YUDgUkkwVL1fECWEXVj0XNyZnO+2hK+U9SZdnX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2546
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



Am 18.05.21 um 10:26 schrieb Thomas Hellström:
> The internal ttm_bo_util memcpy uses vmap functionality, and while it
> probably might be possible to use it for copying in- and out of
> sglist represented io memory, using io_mem_reserve() / io_mem_free()
> callbacks, that would cause problems with fault().
> Instead, implement a method mapping page-by-page using kmap_local()
> semantics. As an additional benefit we then avoid the occasional global
> TLB flushes of vmap() and consuming vmap space, elimination of a critical
> point of failure and with a slight change of semantics we could also push
> the memcpy out async for testing and async driver develpment purposes.
> Pushing out async can be done since there is no memory allocation going on
> that could violate the dma_fence lockdep rules.
>
> For copies from iomem, use the WC prefetching memcpy variant for
> additional speed.
>
> Note that drivers that don't want to use struct io_mapping but relies on
> memremap functionality, and that don't want to use scatterlists for
> VRAM may well define specialized (hopefully reusable) iterators for their
> particular environment.

In general yes please since I have that as TODO for TTM for a very long 
time.

But I would prefer to fix the implementation in TTM instead and give it 
proper cursor handling.

Amdgpu is also using page based iomem and we are having similar 
workarounds in place there as well.

I think it makes sense to unify this inside TTM and remove the old 
memcpy util function when done.

Regards,
Christian.

>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
> v2:
> - Move new TTM exports to a separate commit. (Reported by Christian König)
> - Avoid having the iterator init functions inline. (Reported by Jani Nikula)
> - Remove a stray comment.
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   .../gpu/drm/i915/gem/i915_gem_ttm_bo_util.c   | 194 ++++++++++++++++++
>   .../gpu/drm/i915/gem/i915_gem_ttm_bo_util.h   | 107 ++++++++++
>   3 files changed, 302 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c
>   create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index cb8823570996..958ccc1edfed 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -155,6 +155,7 @@ gem-y += \
>   	gem/i915_gem_stolen.o \
>   	gem/i915_gem_throttle.o \
>   	gem/i915_gem_tiling.o \
> +	gem/i915_gem_ttm_bo_util.o \
>   	gem/i915_gem_userptr.o \
>   	gem/i915_gem_wait.o \
>   	gem/i915_gemfs.o
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c
> new file mode 100644
> index 000000000000..5f347a85bf44
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.c
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +/**
> + * DOC: Usage and intentions.
> + *
> + * This file contains functionality that we might want to move into
> + * ttm_bo_util.c if there is a common interest.
> + * Currently a kmap_local only memcpy with support for page-based iomem regions,
> + * and fast memcpy from write-combined memory.
> + */
> +
> +#include <linux/dma-buf-map.h>
> +#include <linux/highmem.h>
> +#include <linux/io-mapping.h>
> +#include <linux/scatterlist.h>
> +
> +#include "i915_memcpy.h"
> +
> +#include "gem/i915_gem_ttm_bo_util.h"
> +
> +static void i915_ttm_kmap_iter_tt_kmap_local(struct i915_ttm_kmap_iter *iter,
> +					     struct dma_buf_map *dmap,
> +					     pgoff_t i)
> +{
> +	struct i915_ttm_kmap_iter_tt *iter_tt =
> +		container_of(iter, typeof(*iter_tt), base);
> +
> +	dma_buf_map_set_vaddr(dmap, kmap_local_page(iter_tt->tt->pages[i]));
> +}
> +
> +static void i915_ttm_kmap_iter_iomap_kmap_local(struct i915_ttm_kmap_iter *iter,
> +						struct dma_buf_map *dmap,
> +						pgoff_t i)
> +{
> +	struct i915_ttm_kmap_iter_iomap *iter_io =
> +		container_of(iter, typeof(*iter_io), base);
> +	void __iomem *addr;
> +
> +retry:
> +	while (i >= iter_io->cache.end) {
> +		iter_io->cache.sg = iter_io->cache.sg ?
> +			sg_next(iter_io->cache.sg) : iter_io->st->sgl;
> +		iter_io->cache.i = iter_io->cache.end;
> +		iter_io->cache.end += sg_dma_len(iter_io->cache.sg) >>
> +			PAGE_SHIFT;
> +		iter_io->cache.offs = sg_dma_address(iter_io->cache.sg) -
> +			iter_io->start;
> +	}
> +
> +	if (i < iter_io->cache.i) {
> +		iter_io->cache.end = 0;
> +		iter_io->cache.sg = NULL;
> +		goto retry;
> +	}
> +
> +	addr = io_mapping_map_local_wc(iter_io->iomap, iter_io->cache.offs +
> +				       (((resource_size_t)i - iter_io->cache.i)
> +					<< PAGE_SHIFT));
> +	dma_buf_map_set_vaddr_iomem(dmap, addr);
> +}
> +
> +static const struct i915_ttm_kmap_iter_ops i915_ttm_kmap_iter_tt_ops = {
> +	.kmap_local = i915_ttm_kmap_iter_tt_kmap_local
> +};
> +
> +static const struct i915_ttm_kmap_iter_ops i915_ttm_kmap_iter_io_ops = {
> +	.kmap_local =  i915_ttm_kmap_iter_iomap_kmap_local
> +};
> +
> +static void kunmap_local_dma_buf_map(struct dma_buf_map *map)
> +{
> +	if (map->is_iomem)
> +		io_mapping_unmap_local(map->vaddr_iomem);
> +	else
> +		kunmap_local(map->vaddr);
> +}
> +
> +/**
> + * i915_ttm_move_memcpy - Helper to perform a memcpy ttm move operation.
> + * @bo: The struct ttm_buffer_object.
> + * @new_mem: The struct ttm_resource we're moving to (copy destination).
> + * @new_kmap: A struct i915_ttm_kmap_iter representing the destination resource.
> + * @old_kmap: A struct i915_ttm_kmap_iter representing the source resource.
> + */
> +void i915_ttm_move_memcpy(struct ttm_buffer_object *bo,
> +			  struct ttm_resource *new_mem,
> +			  struct i915_ttm_kmap_iter *new_kmap,
> +			  struct i915_ttm_kmap_iter *old_kmap)
> +{
> +	struct ttm_device *bdev = bo->bdev;
> +	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
> +	struct ttm_tt *ttm = bo->ttm;
> +	struct ttm_resource *old_mem = &bo->mem;
> +	struct ttm_resource old_copy = *old_mem;
> +	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, old_mem->mem_type);
> +	struct dma_buf_map old_map, new_map;
> +	pgoff_t i;
> +
> +	/* Single TTM move. NOP */
> +	if (old_man->use_tt && man->use_tt)
> +		goto done;
> +
> +	/* Don't move nonexistent data. Clear destination instead. */
> +	if (old_man->use_tt && !man->use_tt &&
> +	    (!ttm || !ttm_tt_is_populated(ttm))) {
> +		if (ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC))
> +			goto done;
> +
> +		for (i = 0; i < new_mem->num_pages; ++i) {
> +			new_kmap->ops->kmap_local(new_kmap, &new_map, i);
> +			memset_io(new_map.vaddr_iomem, 0, PAGE_SIZE);
> +			kunmap_local_dma_buf_map(&new_map);
> +		}
> +		goto done;
> +	}
> +
> +	for (i = 0; i < new_mem->num_pages; ++i) {
> +		new_kmap->ops->kmap_local(new_kmap, &new_map, i);
> +		old_kmap->ops->kmap_local(old_kmap, &old_map, i);
> +		if (!old_map.is_iomem ||
> +		    !i915_memcpy_from_wc(new_map.vaddr, old_map.vaddr, PAGE_SIZE)) {
> +			if (!old_map.is_iomem) {
> +				dma_buf_map_memcpy_to(&new_map, old_map.vaddr,
> +						      PAGE_SIZE);
> +			} else if (!new_map.is_iomem) {
> +				memcpy_fromio(new_map.vaddr, old_map.vaddr_iomem,
> +					      PAGE_SIZE);
> +			} else {
> +				pgoff_t j;
> +				u32 __iomem *src = old_map.vaddr_iomem;
> +				u32 __iomem *dst = new_map.vaddr_iomem;
> +
> +				for (j = 0; j < (PAGE_SIZE >> 2); ++j)
> +					iowrite32(ioread32(src++), dst++);
> +			}
> +		}
> +		kunmap_local_dma_buf_map(&old_map);
> +		kunmap_local_dma_buf_map(&new_map);
> +	}
> +
> +done:
> +	old_copy = *old_mem;
> +
> +	ttm_bo_assign_mem(bo, new_mem);
> +
> +	if (!man->use_tt)
> +		ttm_bo_tt_destroy(bo);
> +
> +	ttm_resource_free(bo, &old_copy);
> +}
> +
> +/**
> + * i915_ttm_kmap_iter_iomap_init - Initialize a struct i915_ttm_kmap_iter_iomap
> + * @iter_io: The struct i915_ttm_kmap_iter_iomap to initialize.
> + * @iomap: The struct io_mapping representing the underlying linear io_memory.
> + * @st: sg_table into @iomap, representing the memory of the struct
> + * ttm_resource.
> + * @start: Offset that needs to be subtracted from @st to make
> + * sg_dma_address(st->sgl) - @start == 0 for @iomap start.
> + *
> + * Return: Pointer to the embedded struct i915_ttm_kmap_iter.
> + */
> +struct i915_ttm_kmap_iter *
> +i915_ttm_kmap_iter_iomap_init(struct i915_ttm_kmap_iter_iomap *iter_io,
> +			      struct io_mapping *iomap,
> +			      struct sg_table *st,
> +			      resource_size_t start)
> +{
> +	iter_io->base.ops = &i915_ttm_kmap_iter_io_ops;
> +	iter_io->iomap = iomap;
> +	iter_io->st = st;
> +	iter_io->start = start;
> +	memset(&iter_io->cache, 0, sizeof(iter_io->cache));
> +	return &iter_io->base;
> +}
> +
> +/**
> + * ttm_kmap_iter_tt_init - Initialize a struct i915_ttm_kmap_iter_tt
> + * @iter_tt: The struct i915_ttm_kmap_iter_tt to initialize.
> + * @tt: Struct ttm_tt holding page pointers of the struct ttm_resource.
> + *
> + * Return: Pointer to the embedded struct i915_ttm_kmap_iter.
> + */
> +struct i915_ttm_kmap_iter *
> +i915_ttm_kmap_iter_tt_init(struct i915_ttm_kmap_iter_tt *iter_tt,
> +			   struct ttm_tt *tt)
> +{
> +	iter_tt->base.ops = &i915_ttm_kmap_iter_tt_ops;
> +	iter_tt->tt = tt;
> +	return &iter_tt->base;
> +}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.h b/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.h
> new file mode 100644
> index 000000000000..f1c8c7ae7a42
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_bo_util.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +/*
> + * This files contains functionality that we might want to move into
> + * ttm_bo_util.c if there is a common interest.
> + */
> +#ifndef _I915_GEM_TTM_BO_UTIL_H_
> +#define _I915_GEM_TTM_BO_UTIL_H_
> +
> +#include <drm/ttm/ttm_bo_driver.h>
> +struct dma_buf_map;
> +struct io_mapping;
> +struct sg_table;
> +struct scatterlist;
> +
> +struct ttm_tt;
> +struct i915_ttm_kmap_iter;
> +
> +/**
> + * struct i915_ttm_kmap_iter_ops - Ops structure for a struct
> + * i915_ttm_kmap_iter.
> + */
> +struct i915_ttm_kmap_iter_ops {
> +	/**
> +	 * kmap_local - Map a PAGE_SIZE part of the resource using
> +	 * kmap_local semantics.
> +	 * @res_kmap: Pointer to the struct i915_ttm_kmap_iter representing
> +	 * the resource.
> +	 * @dmap: The struct dma_buf_map holding the virtual address after
> +	 * the operation.
> +	 * @i: The location within the resource to map. PAGE_SIZE granularity.
> +	 */
> +	void (*kmap_local)(struct i915_ttm_kmap_iter *res_kmap,
> +			   struct dma_buf_map *dmap, pgoff_t i);
> +};
> +
> +/**
> + * struct i915_ttm_kmap_iter - Iterator for kmap_local type operations on a
> + * resource.
> + * @ops: Pointer to the operations struct.
> + *
> + * This struct is intended to be embedded in a resource-specific specialization
> + * implementing operations for the resource.
> + *
> + * Nothing stops us from extending the operations to vmap, vmap_pfn etc,
> + * replacing some or parts of the ttm_bo_util. cpu-map functionality.
> + */
> +struct i915_ttm_kmap_iter {
> +	const struct i915_ttm_kmap_iter_ops *ops;
> +};
> +
> +/**
> + * struct i915_ttm_kmap_iter_tt - Specialization for a tt (page) backed struct
> + * ttm_resource.
> + * @base: Embedded struct i915_ttm_kmap_iter providing the usage interface
> + * @tt: Cached struct ttm_tt.
> + */
> +struct i915_ttm_kmap_iter_tt {
> +	struct i915_ttm_kmap_iter base;
> +	struct ttm_tt *tt;
> +};
> +
> +/**
> + * struct i915_ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
> + * struct sg_table backed struct ttm_resource.
> + * @base: Embedded struct i915_ttm_kmap_iter providing the usage interface.
> + * @iomap: struct io_mapping representing the underlying linear io_memory.
> + * @st: sg_table into @iomap, representing the memory of the struct ttm_resource.
> + * @start: Offset that needs to be subtracted from @st to make
> + * sg_dma_address(st->sgl) - @start == 0 for @iomap start.
> + * @cache: Scatterlist traversal cache for fast lookups.
> + * @cache.sg: Pointer to the currently cached scatterlist segment.
> + * @cache.i: First index of @sg. PAGE_SIZE granularity.
> + * @cache.end: Last index + 1 of @sg. PAGE_SIZE granularity.
> + * @cache.offs: First offset into @iomap of @sg. PAGE_SIZE granularity.
> + */
> +struct i915_ttm_kmap_iter_iomap {
> +	struct i915_ttm_kmap_iter base;
> +	struct io_mapping *iomap;
> +	struct sg_table *st;
> +	resource_size_t start;
> +	struct {
> +		struct scatterlist *sg;
> +		pgoff_t i;
> +		pgoff_t end;
> +		pgoff_t offs;
> +	} cache;
> +};
> +
> +void i915_ttm_move_memcpy(struct ttm_buffer_object *bo,
> +			  struct ttm_resource *new_mem,
> +			  struct i915_ttm_kmap_iter *new_iter,
> +			  struct i915_ttm_kmap_iter *old_iter);
> +
> +struct i915_ttm_kmap_iter *
> +i915_ttm_kmap_iter_tt_init(struct i915_ttm_kmap_iter_tt *iter_tt,
> +			   struct ttm_tt *tt);
> +
> +struct i915_ttm_kmap_iter *
> +i915_ttm_kmap_iter_iomap_init(struct i915_ttm_kmap_iter_iomap *iter_io,
> +			      struct io_mapping *iomap,
> +			      struct sg_table *st,
> +			      resource_size_t start);
> +#endif

