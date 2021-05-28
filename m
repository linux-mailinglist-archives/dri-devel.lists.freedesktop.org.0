Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC0394414
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 16:20:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA716F5C8;
	Fri, 28 May 2021 14:20:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69D16E3FE;
 Fri, 28 May 2021 14:19:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCGcwBv61dobAziXoZathyzd6GxhpkSwH/xleA8ZnrukriTYTvfwsTBWva4ad8pgL2Qjr82HtjU8YrDxxEstjQbr4f7t4OHqNKXu9UzxQ3lfcNVYlNPEgF82F0hsmO0Cv61mam05xLMoE60FzGe+yW4NvEa4kvSI6kObf3fcnR3+PFFTa+nAPeTe7+n8Li/PFtA1EFNiWzDZpcE5oyn4DIq2nQoFW8j7Pi/5e5zMIpJulL25mvlggSZgN65n155yq9OxEzGzruOWJf/puddrKj/w9C08ELzJ+q0LjgzY3aXXQd4zo84tgF0qLKZnKOYqaPsDZEPXf9z3Dijj4ZpUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgRdjoNAEgJrIj8kWEBd4j5XPkMeZkqqawTcpZduo6I=;
 b=FPqdlTRk2nTUQcnlHMeiCf+6N8i2KV0OWVXOa/exns1MLmqRN9NsSeBz6Sc9ktrRcL9XbaY5quy+yuyhj4cWbYC8PIHvMN7iz6UivsvAPlzAuEYcl78phxJMVEo7sH7cxnsGoLJrVT+4hzxDKlC4Qsorr/FCMnVwGPq2sL54HZQmQBtXHGNOCOoMOEcc/jj+7IRMbScbX5Obn61ehA/IlRlt0/tdSEKec1A3X8EZG9G0JVS7Ub3h4ltAzrQtuNWst8Ki7wNekWlDeFrB2shTrTHxcbxkhUJ6S2eEsOnTkefnWZLSUjd2t8BkNgRdU3NYg5VKvMeHM3EH94rgEBDnoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgRdjoNAEgJrIj8kWEBd4j5XPkMeZkqqawTcpZduo6I=;
 b=0iwgJQRO8FW4m0+5ZJWrIWIM9LeVYNtUsdEyksVYRecFkQPHh9s5D0U1PuvN/MOAM+R945zlkellPok1PzactaG1KiZ5x5n0qDqYzuGQJAsDQrNhb93du1ZZv53dhH3IWe6A/R7DDslFwOkz41IlEJwsVO/aN7IKHShgBdboNEA=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4740.namprd12.prod.outlook.com (2603:10b6:208:84::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Fri, 28 May
 2021 14:19:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Fri, 28 May 2021
 14:19:57 +0000
Subject: Re: [PATCH v5 07/15] drm: Add a prefetching memcpy_from_wc
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210527144710.1975553-1-thomas.hellstrom@linux.intel.com>
 <20210527144710.1975553-8-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7f2daaf6-8df1-5886-758e-ea09d27602ba@amd.com>
Date: Fri, 28 May 2021 16:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210527144710.1975553-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a878:922a:f147:ebc]
X-ClientProxiedBy: PR3P191CA0060.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a878:922a:f147:ebc]
 (2a02:908:1252:fb60:a878:922a:f147:ebc) by
 PR3P191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 14:19:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11281c8a-7702-42db-9d32-08d921e3aba2
X-MS-TrafficTypeDiagnostic: BL0PR12MB4740:
X-Microsoft-Antispam-PRVS: <BL0PR12MB474004B444A4440C7621068B83229@BL0PR12MB4740.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ux9ig6JFNvyrDBIpoBMjZoaBAKcwnMPshGqeqrZcp5E7q0oRkTWJfjwf5pS/WQPM7MVQ0ooO5tb33czwKlOVK/dF3hX9TWDJX4iqlRRADUJFW3tgbYncy3bNpsOU+gLgGxhsujJJhH0yonT4vTz+FjBkN09EKBWIHcuEC9PQvciewz7uh2lwB5Uypyy1cgEWuwblo1z+T5+1UkEvsamfe3ZtZx6g6tt46z2CvgiagSxIR72XNZxhVxZI1WeE3XjTXHNpwb7lk6avXtTBOkawdKhcuhDskBVlBisaUwB2vMfOT577CApN2X6A1dt9mkNWF/gpzV2mGX2ro63MOJZcLZ7x4zvHHPjYob7q4zjOZJ3QFGhCBUNd6vmV0ydhkFjgoEbppdw1ecY/jTWB+bd8TC+2cF9gA4xdNF4BOoPAbrBOxxAhQxp4RlqrNipVKzq3T5ZHQm/d9tdFRyV9TjeRhSa9Uwj/b/apYH4JJg2JDWa7PlKPmtw7rKzSsbrj6/P1bBJC8JmbLIOML5zOBgZMIpkbByzLSJH3VTXqFQEf9d6bcN1JpDYvc93LBVqbqQ2hTCRNUSfHzXCxtPxZwbSpq0+MKaOo74AyY1F1LcA90+xmUpjZOI9DnWWt5INfDIsVkIvejD3sGqCW52qLAtSY2w3yHVqRLUeUPmKgbZS6eVFhKOw81eLg0965F+HnJcQ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39850400004)(4326008)(36756003)(5660300002)(16526019)(83380400001)(2616005)(31686004)(186003)(66574015)(38100700002)(31696002)(316002)(2906002)(86362001)(478600001)(6666004)(66476007)(66556008)(8676002)(6486002)(66946007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eW1KQlo5dGdQdm9FTXlXTnQwdnlQMVIva0ZzSjJtNUlHa3ZHR1RiTEZuSTBx?=
 =?utf-8?B?NUxvWkxVaEs2UjdXUGJKd3c2eVVtU3d5ZHNiOE1sempRUkFXNVNTUDNrTWNJ?=
 =?utf-8?B?VU5XalpHbjBjbXZpSDE3dlhiSDg2dk9BdzRVTFBYNWhjMlhPeDVBNHFDOXYx?=
 =?utf-8?B?SFFpUGJERElMTzVWcEpGRXJLUFVPOHFKb0twT2JTdC9XcmJFbEpyeDJFUmk0?=
 =?utf-8?B?ZkF1VVR0S2dSVm9aUkJxZkt3dGJaQVFBb2NRd0wrWWNUK1VzeEJhaitjZk9E?=
 =?utf-8?B?YW1JWkFsditaME5iQm5NSGE5eUp4dVp0SHh3QW0xU3VEQk42akI4L3pGdWFK?=
 =?utf-8?B?RmxhV1JCM1lxd3k1dGVwV0dOZ2Y2MHZZc0ZZQUg3dTlyc1RWRE1IdWZQRU1Z?=
 =?utf-8?B?WElTazVGV1NWQlhwRmtzdnhPY1IreGUwY3B1VGh6RWVpWWE5U3E4RkdXaEts?=
 =?utf-8?B?VkdjSkVDV2xyZXNqYU9yVnFsSTdwdGlVMDhFMCtwOExLSW5la0lPTDBSaFNV?=
 =?utf-8?B?RGJhSitIMnh3MUVLNVdYdjRpcUx5WGVIRHA2RUVYdTR0VkF2MDMvNVpNdmxX?=
 =?utf-8?B?Yjh1akdDY0JMUVllYm5kdmZwQ2xQWHN4RElYKzhLVlo0anRGa20ybFpqcjlS?=
 =?utf-8?B?eVRicmtIUzV1VFJaemhXRFo5eWJSVk81RFIzakZ3bDNPTDQvMmlvS0NBelQ3?=
 =?utf-8?B?MWlXRzNFaW9iWWxCTlFVOEFHODFWWUt6QzB1NG02VWhnNWV3YVBPVG54cjZY?=
 =?utf-8?B?b2lieTBRQkhGZzljOU55NlpmN2MwS3N5QVVkSDR6V0prVTl3UGprRzdPM1pF?=
 =?utf-8?B?VVZlMXljVFJKWmRxREUvYk40VXNCbVpCWEQyMmFDQ042c1RER0Z6a1phUTVo?=
 =?utf-8?B?b2VMTnRDN2dyZ0RQRWpFTVZ3aDZjTmhyaDdCd1JWTnc0NHUwUW1rdk9IVmU1?=
 =?utf-8?B?RW9wTDkxeC9BZnU2OWhMc2FhYTFDU2h5MnhJallOYWtEZFhvRXd2a2V3MzBI?=
 =?utf-8?B?MmV6cmJzTCt0TXRFY2VnZXQ5VXhVMWcwVXZXMVhpa1hjWlVnSkdHNXdpMDdp?=
 =?utf-8?B?cVRvaG54a0FrNE9EZVV6Z1JNR3RXamRIbm5aNHhLa1RVY2R0bTkvRDhLd1JF?=
 =?utf-8?B?Mi9Wdjh6bTBFcGVvZERNTWRwS2tGNmRkSXkzZ0JiUCtwR1BUOGNXenQ2cEND?=
 =?utf-8?B?Qkd2NExhSkM4UERlaHFrbVVJbTJDTEVmcEx3ZXN0ckoxbTdFK21FNkxOR25v?=
 =?utf-8?B?QTJHUWtiSHlHZHRVbHFqcE1HY3k4SUVPYUV0c08zOUFMUzRZUE9tYzR0T015?=
 =?utf-8?B?N3RRTEhpNzd5Z1RTaDdlK25qMS9yN3VUN2VocFg3ZVUrSVRrTERYbFljdmh2?=
 =?utf-8?B?RkNiOWtKTk1HNWJxRG9YVDFvUGY2emxWZlFrdGlzLytuMHdsZnVEcXpkTklQ?=
 =?utf-8?B?QVlRMmVFSTRRRVQrUnd1SUtxdFErOXI1UnBhNHVReFIzbytXdjNqT05OTlhq?=
 =?utf-8?B?QjJMRjdveWVQU2kvOHRUYVRnOFVkWnVselRrRFhHM0Y0M3d3eW1XTGd2bXU0?=
 =?utf-8?B?VFYwTnVwaVIvcTVVYllLWCtIbUZRek5JbG10bmltZWsxRkJwczY4R1d5Wmx0?=
 =?utf-8?B?Nk9McXlVVkxqY0pKdzcwbXN0bUhnTUxydVQ0VGpMdEF2dkpGREZlWEFLMU52?=
 =?utf-8?B?N0FteFFzRVhnT3QzQ0RtQkI2a3FTNHh2MWZDbUlxY1U2ZzErZE41T3A2UmhE?=
 =?utf-8?B?S1BqZVBQbXIxejV2MHpwV3hIbnp1MXBQcENYQ1MzaFNmQ3d0ZGUrWlNxSDJQ?=
 =?utf-8?B?MHV3NFo4MHBvaGkrVlU0cFFJMnZLYzlXTTBKN2sxSGdmakE4V0NiNy90bGt3?=
 =?utf-8?Q?RQkmH3bganpuA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11281c8a-7702-42db-9d32-08d921e3aba2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 14:19:57.3248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkgI/3pBHp0SmiYqPAdjjAGNl5bGNtVPu72mw/VFu6B1H/L6yF0vpL875VfBEQwO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4740
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

Am 27.05.21 um 16:47 schrieb Thomas Hellström:
> Reading out of write-combining mapped memory is typically very slow
> since the CPU doesn't prefetch. However some archs have special
> instructions to do this.
>
> So add a best-effort memcpy_from_wc taking dma-buf-map pointer
> arguments that attempts to use a fast prefetching memcpy and
> otherwise falls back to ordinary memcopies, taking the iomem tagging
> into account.
>
> The code is largely copied from i915_memcpy_from_wc.
>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   Documentation/gpu/drm-mm.rst |   2 +-
>   drivers/gpu/drm/drm_cache.c  | 138 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_drv.c    |   2 +
>   include/drm/drm_cache.h      |   7 ++
>   4 files changed, 148 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 21be6deadc12..c66058c5bce7 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -469,7 +469,7 @@ DRM MM Range Allocator Function References
>   .. kernel-doc:: drivers/gpu/drm/drm_mm.c
>      :export:
>   
> -DRM Cache Handling
> +DRM Cache Handling and Fast WC memcpy()
>   ==================
>   
>   .. kernel-doc:: drivers/gpu/drm/drm_cache.c
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index 79a50ef1250f..08614f7fdd8d 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -28,6 +28,7 @@
>    * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
>    */
>   
> +#include <linux/dma-buf-map.h>
>   #include <linux/export.h>
>   #include <linux/highmem.h>
>   #include <linux/mem_encrypt.h>
> @@ -35,6 +36,9 @@
>   
>   #include <drm/drm_cache.h>
>   
> +/* A small bounce buffer that fits on the stack. */
> +#define MEMCPY_BOUNCE_SIZE 128
> +
>   #if defined(CONFIG_X86)
>   #include <asm/smp.h>
>   
> @@ -209,3 +213,137 @@ bool drm_need_swiotlb(int dma_bits)
>   	return max_iomem > ((u64)1 << dma_bits);
>   }
>   EXPORT_SYMBOL(drm_need_swiotlb);
> +
> +#ifdef CONFIG_X86
> +
> +static DEFINE_STATIC_KEY_FALSE(has_movntdqa);
> +
> +static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
> +{
> +	kernel_fpu_begin();
> +
> +	while (len >= 4) {
> +		asm("movntdqa	(%0), %%xmm0\n"
> +		    "movntdqa 16(%0), %%xmm1\n"
> +		    "movntdqa 32(%0), %%xmm2\n"
> +		    "movntdqa 48(%0), %%xmm3\n"
> +		    "movaps %%xmm0,   (%1)\n"
> +		    "movaps %%xmm1, 16(%1)\n"
> +		    "movaps %%xmm2, 32(%1)\n"
> +		    "movaps %%xmm3, 48(%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +		src += 64;
> +		dst += 64;
> +		len -= 4;
> +	}
> +	while (len--) {
> +		asm("movntdqa (%0), %%xmm0\n"
> +		    "movaps %%xmm0, (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +		src += 16;
> +		dst += 16;
> +	}
> +
> +	kernel_fpu_end();
> +}
> +
> +/*
> + * __drm_memcpy_from_wc copies @len bytes from @src to @dst using
> + * non-temporal instructions where available. Note that all arguments
> + * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
> + * of 16.
> + */
> +static void __drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
> +{
> +	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
> +		memcpy(dst, src, len);
> +	else if (likely(len))
> +		__memcpy_ntdqa(dst, src, len >> 4);
> +}
> +#endif
> +
> +static void memcpy_fallback(struct dma_buf_map *dst,
> +			    const struct dma_buf_map *src,
> +			    unsigned long len)
> +{
> +	if (!dst->is_iomem && !src->is_iomem) {
> +		memcpy(dst->vaddr, src->vaddr, len);
> +	} else if (!src->is_iomem) {
> +		dma_buf_map_memcpy_to(dst, src->vaddr, len);
> +	} else if (!dst->is_iomem) {
> +		memcpy_fromio(dst->vaddr, src->vaddr_iomem, len);
> +	} else {
> +		/*
> +		 * Bounce size is not performance tuned, but using a
> +		 * bounce buffer like this is significantly faster than
> +		 * resorting to ioreadxx() + iowritexx().
> +		 */
> +		char bounce[MEMCPY_BOUNCE_SIZE];
> +		void __iomem *_src = src->vaddr_iomem;
> +		void __iomem *_dst = dst->vaddr_iomem;
> +
> +		while (len >= MEMCPY_BOUNCE_SIZE) {
> +			memcpy_fromio(bounce, _src, MEMCPY_BOUNCE_SIZE);
> +			memcpy_toio(_dst, bounce, MEMCPY_BOUNCE_SIZE);
> +			_src += MEMCPY_BOUNCE_SIZE;
> +			_dst += MEMCPY_BOUNCE_SIZE;
> +			len -= MEMCPY_BOUNCE_SIZE;
> +		}
> +		if (len) {
> +			memcpy_fromio(bounce, _src, MEMCPY_BOUNCE_SIZE);
> +			memcpy_toio(_dst, bounce, MEMCPY_BOUNCE_SIZE);
> +		}
> +	}
> +}
> +
> +/**
> + * drm_memcpy_from_wc - Perform the fastest available memcpy from a source
> + * that may be WC.
> + * @dst: The destination pointer
> + * @src: The source pointer
> + * @len: The size of the area o transfer in bytes
> + *
> + * Tries an arch optimized memcpy for prefetching reading out of a WC region,
> + * and if no such beast is available, falls back to a normal memcpy.
> + */
> +void drm_memcpy_from_wc(struct dma_buf_map *dst,
> +			const struct dma_buf_map *src,
> +			unsigned long len)
> +{
> +	if (WARN_ON(in_interrupt()))
> +		return;

I would either make it a BUG_ON() or at least use the fallback memcpy.

Just returning without doing anything isn't really nice.

Christian.

> +
> +	if (IS_ENABLED(CONFIG_X86) && static_branch_likely(&has_movntdqa)) {
> +		__drm_memcpy_from_wc(dst->is_iomem ?
> +				     (void __force *)dst->vaddr_iomem :
> +				     dst->vaddr,
> +				     src->is_iomem ?
> +				     (void const __force *)src->vaddr_iomem :
> +				     src->vaddr,
> +				     len);
> +		return;
> +	}
> +
> +	memcpy_fallback(dst, src, len);
> +}
> +EXPORT_SYMBOL(drm_memcpy_from_wc);
> +
> +#ifdef CONFIG_X86
> +/**
> + * drm_memcpy_init_early - One time initialization of the WC memcpy code
> + */
> +void drm_memcpy_init_early(void)
> +{
> +	/*
> +	 * Some hypervisors (e.g. KVM) don't support VEX-prefix instructions
> +	 * emulation. So don't enable movntdqa in hypervisor guest.
> +	 */
> +	if (static_cpu_has(X86_FEATURE_XMM4_1) &&
> +	    !boot_cpu_has(X86_FEATURE_HYPERVISOR))
> +		static_branch_enable(&has_movntdqa);
> +}
> +#else
> +void drm_memcpy_init_early(void)
> +{
> +}
> +#endif
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3d8d68a98b95..8804ec7d3215 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -35,6 +35,7 @@
>   #include <linux/slab.h>
>   #include <linux/srcu.h>
>   
> +#include <drm/drm_cache.h>
>   #include <drm/drm_client.h>
>   #include <drm/drm_color_mgmt.h>
>   #include <drm/drm_drv.h>
> @@ -1041,6 +1042,7 @@ static int __init drm_core_init(void)
>   
>   	drm_connector_ida_init();
>   	idr_init(&drm_minors_idr);
> +	drm_memcpy_init_early();
>   
>   	ret = drm_sysfs_init();
>   	if (ret < 0) {
> diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
> index e9ad4863d915..cc9de1632dd3 100644
> --- a/include/drm/drm_cache.h
> +++ b/include/drm/drm_cache.h
> @@ -35,6 +35,8 @@
>   
>   #include <linux/scatterlist.h>
>   
> +struct dma_buf_map;
> +
>   void drm_clflush_pages(struct page *pages[], unsigned long num_pages);
>   void drm_clflush_sg(struct sg_table *st);
>   void drm_clflush_virt_range(void *addr, unsigned long length);
> @@ -70,4 +72,9 @@ static inline bool drm_arch_can_wc_memory(void)
>   #endif
>   }
>   
> +void drm_memcpy_init_early(void);
> +
> +void drm_memcpy_from_wc(struct dma_buf_map *dst,
> +			const struct dma_buf_map *src,
> +			unsigned long len);
>   #endif

