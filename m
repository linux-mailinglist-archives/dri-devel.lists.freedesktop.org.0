Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4420C395AB4
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 14:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F406E91D;
	Mon, 31 May 2021 12:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239826E918;
 Mon, 31 May 2021 12:37:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ysrl/vQhGLXsVCyBHIS3SA0XGv/xhWRKWFZvPDKHImTYRbqyR9vYC3dMjdCzOoinh9zwP2ZrVMIV0rOqvXJ5mYUo6ti6Vb4Zn2KmRVndu5NyMYX9ny3TWf2GfbJrYzHSgE5IShA5c6yAUXWf33YcTr3aV6nOcSfZFajTmMgHOMtJa+iSpPoS2CX/XLQu45wKu4hK9NhjwKt9ueu5qbxUqyEAPUgy4gnYOyjrkN3sa2Se6lr3YpUH6e93KHuEJwO3cCeXEihjMskbMBZKfIzDgZHjH6AYfyT7VVHh9RcxD/h1+a0cyntoT9tSn9RMLokUJfF8KSeZKg4TSuk5o/N5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hOmcJnr2FDn/1YJrZvJY9DIWa07/8LztMy41dECMhQ=;
 b=Va+WGif24WtatYV+spdfr5mAp3SXgHBe6JFnYpRhzCE5sfDq+sfSqLwbxDlgC4JOQpW/oGFYjPQQGg1V1ff0D1wV3RKR0SzzHHG1yoADsOzm/sRYXlumU3PgdAfOv2KYMdtWcXVVXtYvgJlz7HWSjosGDtDYJSYKRK0pVh4BD6zTLUROLislAx9VhOMwbsUm1Khyt7Lei+RVz1JGPPGjo3EjcjY8IJB6P1A0Q0WJMxRF6iw4abwgJrdPcivOhOBTUXRALciwjdzose60P+VifgN/Q1FYpFwMFzDazU2GOtISvnRYHRFnJclCPF0/0r/8G1mFu4JQ+qd2SxEyxWNQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hOmcJnr2FDn/1YJrZvJY9DIWa07/8LztMy41dECMhQ=;
 b=WLUx+RkX4S2iTxs2ojtRo93KORrQ9jOoAaPiNphjDeNTk4y3/P+OMIladjbjwHCv9cWbcoj4BtyeLwXz4nmFP0jEpLKn6TCwZmoB109q5FheFFVzwH2E1iVF/kcvX6EcABhchcLPLacXucS1HO0ka5kRz1ivIlFhdakWiOQxAFU=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26; Mon, 31 May
 2021 12:37:31 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 12:37:31 +0000
Subject: Re: [PATCH v7 07/15] drm: Add a prefetching memcpy_from_wc
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210531121940.267032-1-thomas.hellstrom@linux.intel.com>
 <20210531121940.267032-8-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d77b1ae8-1062-ce5d-6bce-48d55717b304@amd.com>
Date: Mon, 31 May 2021 14:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210531121940.267032-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b94:4956:bad4:7c81]
X-ClientProxiedBy: AM9P193CA0002.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::7) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b94:4956:bad4:7c81]
 (2a02:908:1252:fb60:b94:4956:bad4:7c81) by
 AM9P193CA0002.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Mon, 31 May 2021 12:37:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cfd36ee-88c5-4652-a11a-08d92430dbc0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-Microsoft-Antispam-PRVS: <MN2PR12MB45517130E5D695A45D6EB3FF833F9@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QAWQIFdyBdLmj5+jGWv3srpYAZnn2RiKEy4ft9q6e3zjQ2ewxXuU/6AZBeSk+PGcqF3zp5aXUCoIkbgG19UGz8a3rxUg3mbdLCCe/dnInAsNZ5PHdq0aluKKSz2JtzLaJI8UEP6MEWRMCAgXPHphqgXUfFBj7WO9JRUU0BLnDmsaBHupGvQxBoed6GB2IN+sH99I/0WvB92gxKiYIAXiXOhLnOdap91rbHCtv0AtQ4KNXIhaWn1fIANWust32LhD2eGYoOIBFWxf7+dMgRxrUFml0goENhbM8f5XQl8onWVL7bs8mb1ybuIqf9dj2LgN+64xjB82g4uAG11/GANYT/tlCGJMpQL+O+KYb+bfaQGauKi2PXKJZhzLlt3omM7fdKvTXFUoJ7kAFTx9dfeZw4KoKiPEnZIo2Oy+nlXepy8IALeFPWKQOv4JV+K65UKQ8iFLiNFcGa47dPsFvj4h/oB6fspTNl3wWohVjzKab7DSX0czV19qFawOjVmvAn6vH6uuBIisDCeS825KDIz2+X5z4AGe/TtP62ePeCnK8291M+peyi7jJRNRuz4wLzINmEcHCounopih4FFKzsMWvhJZdkjEk9aA0tnqP83lUyz5iVIjesGrmxMiksxNatfMxVh7ptsZTRtEqm41DU/YzJLwz1rfNu7EHwHdrFXLuAqec+OvrwLTHi8o1tyWIuO/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(4326008)(31696002)(31686004)(16526019)(2906002)(2616005)(8676002)(316002)(186003)(8936002)(6666004)(86362001)(6486002)(478600001)(38100700002)(5660300002)(66556008)(66574015)(83380400001)(36756003)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MzkySXVROFpQQjlxbEhOQXZGbVlJakNFZjZjNjJ5YlY3SzU2RkxlWldYSStP?=
 =?utf-8?B?VWVWeithY0o1b0U2QU1TQkpyRGRkNlkwN0JzS2lPZEtlVGh0c0w5UlNiYkps?=
 =?utf-8?B?TlNNeHVNT2VkUkI1WlRVb21aWk5UVnR4dU4yNXp1b1laVTNXNlBvYndTVG10?=
 =?utf-8?B?Tll5M1VySU43NzJ2YXkwblRDUUw0ZVoySk1BVU1mNFBTelFlY2k3c3B3OE43?=
 =?utf-8?B?bEZjWWcyRHpya21iTEtHL1hQa240aGRJakd6dXZ5aE90NlZXYTRmdGxZUWlE?=
 =?utf-8?B?UmhwRm5wYjRIc1VKT2RzTENHM1FXYXpLemtUeTNGREc5ZFVtcXdhVk5ic3Av?=
 =?utf-8?B?bHoxUmhUK3dJWk1ydUc5Wk8xMFM5NjFFTUlZTGNhalB1cHFIK2J3UnJIZnp4?=
 =?utf-8?B?dWZYbUk2TWZna2lBQkNKTFByTklRTHJuWVV5cmJ0UWpaZFFpOWVONkFkUXZ3?=
 =?utf-8?B?b2NtZHc1SnVxbFJkZWIweCt0Zk9QUjJjczdYUFFUd2FlZWNTcmNhYTBCR3M5?=
 =?utf-8?B?eGI1OXkraXN2TlpPUFptazRqNkZBWUZkanRacGZEdkUvY092VE54QlJSaGQ4?=
 =?utf-8?B?dGlrYWYxQUo3czdhMDJDL2tBMGNZNTFFZUlhNG9nekNzcEdVTGlTTTRaVlJK?=
 =?utf-8?B?dXdrVHk4VE9pYXJ5a1FQOFFRRW1tZDRxdW9NZ2hyZ3J3Z2dUQlRkbWRUZytu?=
 =?utf-8?B?RGRDRDJKd09zdTYyWHllSHhrdldLNDlwZ3RGWFFIT3o4VUpQaEVJL3hiRkRJ?=
 =?utf-8?B?ZWtodlRCWkhkbUpSbCtMQmVYc2lwbUpFY3I5MjltdEtTaG51djF4dUIzOHgx?=
 =?utf-8?B?VzR6SmR3TDRlOU1TZHFpR2VGYzFJb09NaVc1aDRPVFlEVVdBNDhDTDNzQXUv?=
 =?utf-8?B?YVVKNFgrdCtyczBoK3RveWptTSt3WGhxTExibGpDc0RHU1d5TDRuMmtpMGlm?=
 =?utf-8?B?NVlDN1RQNnNBZGdoU2RKQUhqU3FNdlkrZlhRdldwNURiQ2dHMDFnQ1JQc0FE?=
 =?utf-8?B?QlAzaHBhL0ZHOTlidjlwdjJMdGw5SzhYNnZYQ1JWOE5wQWRPT1oxVEIyOE1N?=
 =?utf-8?B?YTlEcnVvY21mZHJuS0lHSEp4aDFEOW9mMzVjS0UxTUNveWZkQnF3UXhXemRJ?=
 =?utf-8?B?RW9VRk5QZEVyUXZOWlpLODVzSmJ0WEFieDFMcGJNanpkRlNBQmExVVlIbm52?=
 =?utf-8?B?K3VHYWxjRjJxNWprSGJlSjZJb1dqNXRJWEJZQ21rME9QZjUvazg0aUI1dVdu?=
 =?utf-8?B?Q0RzUmFHL0htdHJJUnJUNlpuTlBFVmMyVHJleTdlWHF1OUZlcStlQ1laU2I4?=
 =?utf-8?B?VFJ5bHBpNzg1NFNHaVBmMGxQbDFUdHN3bDBsSWNpeDNjWEx6alRjam1LRTVN?=
 =?utf-8?B?aXFvbVhtUFYzYTNob2UvRmV2NjBJeVpIWm85cFdOL0ZLckVPaDlYczgvQTU5?=
 =?utf-8?B?c3BLakJmNCt4YmVFNDBqMWlRMlZzWVRDYzYvOXVmd1JGbW91TjdLL2RyOFd3?=
 =?utf-8?B?eEFUTmI5bzNYMWFSN1ZFR2NCcU5wV2dKb2xiRFFIN2JGOGFjSitmOGFkVU9v?=
 =?utf-8?B?QTl6NjV5UGY0MXZMTm9iUEVYc01CdFVjSDZNblBEeTRGSHhYT0daMHlzKzRv?=
 =?utf-8?B?WFo5WUgxd2swWEhPQ2kvTFhrT054Y2JKUGxqcCs0MjFsaklVeHh0SjRacDRq?=
 =?utf-8?B?OXJ0Mkg5aldpZFErMGJQekxXVHZUV29LbTA3cnlIYU50K0JDK2pFZHNGWFZZ?=
 =?utf-8?B?MXVoT3hFcXE4OWZxS3MweUc2RUlCYVhOc0lKMWZVaG5FZHZMb1djQTN6dEZq?=
 =?utf-8?B?enMxSWt1a0ZKS0RZQlZEVVRFNVlVajQrcVhXMThMcldYVjg2bzl4aldBVVJJ?=
 =?utf-8?Q?/5sEu2Rc3lq5r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfd36ee-88c5-4652-a11a-08d92430dbc0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2021 12:37:31.6108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VskCiP+ut1r5esPG3wu3c5b3CetUm/w6nAUXsHRLHF8B4UhW2k8yejVSBzkl+wgk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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



Am 31.05.21 um 14:19 schrieb Thomas Hellström:
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

Acked-by: Christian König <christian.koenig@amd.com>

> ---
> v7:
> - Perform a memcpy even if warning with in_interrupt(). Suggested by
>    Christian König.
> - Fix compilation failure on !X86 (Reported by kernel test robot
>    lkp@intel.com)
> ---
>   Documentation/gpu/drm-mm.rst |   2 +-
>   drivers/gpu/drm/drm_cache.c  | 147 +++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_drv.c    |   2 +
>   include/drm/drm_cache.h      |   7 ++
>   4 files changed, 157 insertions(+), 1 deletion(-)
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
> index 79a50ef1250f..b887d7dec8b8 100644
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
> @@ -209,3 +213,146 @@ bool drm_need_swiotlb(int dma_bits)
>   	return max_iomem > ((u64)1 << dma_bits);
>   }
>   EXPORT_SYMBOL(drm_need_swiotlb);
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
> +	if (WARN_ON(in_interrupt())) {
> +		memcpy_fallback(dst, src, len);
> +		return;
> +	}
> +
> +	if (static_branch_likely(&has_movntdqa)) {
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
> +void drm_memcpy_from_wc(struct dma_buf_map *dst,
> +			const struct dma_buf_map *src,
> +			unsigned long len)
> +{
> +	WARN_ON(in_interrupt());
> +
> +	memcpy_fallback(dst, src, len);
> +}
> +
> +void drm_memcpy_init_early(void)
> +{
> +}
> +#endif /* CONFIG_X86 */
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

