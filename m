Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 914944A9F28
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 19:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAAC10E394;
	Fri,  4 Feb 2022 18:35:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB1D10E394;
 Fri,  4 Feb 2022 18:35:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvvG1H88zcjo/ReoCEha5kTd2XtqKHK3NqR8AcRps5/KKMM/bXCGgO2UBkh2E3nCwBU9tevWAe8fzWMrNS4LB5bNMRdTiTuJs/e9GTSJvMBdeHRTwNullcwnDBWCqhCC0Nb/4OESpm3a9+KzHhXZZQiDrxKzFPuBo+ePkA3BRxbZNWX9GM/Fe7/fgMJdDu9GBtzXppNVbZGdVil/n78AH07l7ATys0j/0ZkazDkr42HfVUfdcTrvNo4GUqXESqvDs9yFjhOcgvVg95IH2mvcmdCh3HBL3JDqMhYcAn2noc7MJZvPeeB4unoidM/2rKob6emG6yZrjhv/M2hJflWETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1B3pLSPE9kKpLaQTBCPKOHqa+wXGmdJ5XUJrvnKb00=;
 b=X5B5IlVMoQ0QGeGULJSLwK5WqPVCNI5rskIPsJa7YX1A386F84zsKrBltwsGnfrND2XSU02AJbra9z3uboVDKNe9b2b97P/8bwulsVX67+pkhDdAKteRMkrzFWF7lF+K3/GfDX0iwK3JJCfUtsom0BoFSiw6MCv+Y336aJ932qehm5XFAyHqAFHMWmQ9ryc4DluIGxDMy/aqi5pPuNJslMnUx1sRy1DKQUVmtn2XZvOjN7IniHEkw9A/Kk1UJfGLEcCpVu3ZkAPUGz8v9aYyqC9DJaHcMRhs9aMv484r6varapCQErvjzXjWI/0Q2NIXIGlipWfpyF4LF1wWBMihzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1B3pLSPE9kKpLaQTBCPKOHqa+wXGmdJ5XUJrvnKb00=;
 b=J1CST43pVRIUgnsS+6KKuAa8kVgCe0a8EKx9bpAfkPcyXDYybmWBTXBpNItFDhTRiKF6OIluOCl0Hxsy6CRTi54OqTWl4cykov8h6yOy7BJmdoTJWdkaklh0ZrY4N25jt+Yn+Wlfrz+lLCDK9W1MHBoufdW0klnrldbXujGxwaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB3079.namprd12.prod.outlook.com (2603:10b6:a03:a9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Fri, 4 Feb
 2022 18:35:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d861:5699:8188:7bd3%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 18:35:45 +0000
Message-ID: <4156d270-b30a-402f-268a-7ce28b1f2237@amd.com>
Date: Fri, 4 Feb 2022 19:35:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/19] iosys-map: Add offset to iosys_map_memcpy_to()
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-3-lucas.demarchi@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220204174436.830121-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a773ca1e-2f63-4313-7da9-08d9e80d2821
X-MS-TrafficTypeDiagnostic: BYAPR12MB3079:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3079BC91A5EE2F03E5A2F89F83299@BYAPR12MB3079.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eNGevhhXjVZ7erX2NJeb0oNlZzt4/96sUwUsOklK/+a3DyQ9Onk/WPerIHXyuGDxZxUXjrjLdODstSB7AbLmwUyOKh/kexTCCTdSodXkjYTssWK6sISNboOUmfOZDfDwzNKTbrHdNePIsm3s3NKVTQNi2pVSF/zyerc5kixXa5tpTCC7gRbQdTp7zvmSkj1z9fvjGsBMSOnARRE+i72WrEAnPS2Ir9B4f6A4vK//vA0/ICtmrYc0yRcV0NL490xQ9gxkJ087b6pSQ/Ig7HQ+MSsmaFfR4Jcc4wkUOZlmADpNMRq+AIGagLDrHJ759hu6n3k1NWx2azP9s6e7gARZPmna3jBBYbaCSPV2jkx6tj3bhdKZcxnCDGCIMUcsS4bwUeaaB6nQv8K6eEoYu2jwRNb8Yu9ruOl2KRNRFiAhuP4+szNxxyXNG5FzWJlz8v5SEJTe2d0SaFuEqZ/ymVJzOEP3rZ2OMCM7zCPV417MbkVT4rEHYcN0nP252zwaeesuQvm3mqE/u/Kq/7aEE+PqbnlfRJUhwigckg63Yk045eaeHVwLOwcQrgDM4rD3VIrsZ2wIHOUabD68Atc93lKyvUp7FI/2m2fIuGrPVmYdrXthTn/RlCYWybz0ddXxOA3Mk4F/uLJgW0zuELILJ46dOJirJd1k1k+W0j6jkrhb0v3ftbEskAhCih8n23xGOpFTyLeBM/d0/oha8lS67vOXSZOv2f6y41UD78oW88EchLbPMZJD6anJ3jNaAx3d3Oab
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(2906002)(5660300002)(7416002)(38100700002)(2616005)(6506007)(316002)(6666004)(6512007)(54906003)(66556008)(8936002)(8676002)(4326008)(66946007)(66476007)(83380400001)(6486002)(36756003)(508600001)(31686004)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmVUalpZb0JPMlpNMGN4cG9KYUM3WUltQks1K2xmenJ2Z1E4UlYvNHN3SDdF?=
 =?utf-8?B?TGNnYjhhMkd3VEZ3M3RJbkhKRy9wdjI0eEk2eUxMOXY1QzBZbzl1cHNHanlR?=
 =?utf-8?B?cjRranlQZEtVMlhRNkt2WTlFSWNrWFd3eGVqUlc0blRLNlVwd1NTakRXdC81?=
 =?utf-8?B?NW02NFIxQ1dQOXJiSXlBYlZoWEU2YXNQK0N4VHpFSlFCdGg0ckxHWkdxcGFl?=
 =?utf-8?B?WkE0T0R0dWQ4NHlHZURUaCtHWW50QUVnVlV1dUxDUkZpS3loQ1JiQmRqdVFW?=
 =?utf-8?B?VGtpT0xNbEpHYVJBYVBQdUJMSGkxSk03TS8xVXhHcE56TjRVemxXQ3pWVVZ0?=
 =?utf-8?B?UkJUbFhNUDBndVFvYkM3a1c4UDNVaGRIYlhkd2xaY0pCK294SDBJUFVHRTFW?=
 =?utf-8?B?VUhPUWRRSXRCNlBOaEttdTZqTnh5Y3ZBc0RWWjF5VHl3eEFYNnErbWxjVzZm?=
 =?utf-8?B?R1RvLzRvMDNJRnkveDl1bHRKZFc5UzhVK3oyYXM0c2RJbEluQ0hNNzBwREJD?=
 =?utf-8?B?Z3Q0WWtONHR5Uy9PMFJmSm1MUnI1NDU3Z3E2RnZtK292SFFFL211ZVhNNHBm?=
 =?utf-8?B?eEsyZThoMnlnTkNhS0xRRGptckhiQVhjM0JhMHRwWmJRWVFVckZ3U2dKemdX?=
 =?utf-8?B?L3o0Ryt2UXJLZWZPQkR1WkRkYlc3bHdTdGhtcFZMS3N6OUxiUWlMTnY1M05s?=
 =?utf-8?B?ZG44VVN2aTlJdTI0RytzL2dHN1Bpa2xuVmd4eFFkcSsxNndURlh1ZFFQR29D?=
 =?utf-8?B?NWRZZEY1VU5NR0RSWmJFaUFsR0p5aDBIL2FGK1Uva2xweVVqdHYrSHI2QlBK?=
 =?utf-8?B?bXNORFRIeDZ1cFM3S0lDUGozbE9rNXJsZW9LU1drNFNEcC9GUWswbUlieDlT?=
 =?utf-8?B?aEdqZkp6VS90VkhsWXk0K2VkTFlMeU1WbXRvcVN0N1lKTVk5S3JHZ2txL0Yw?=
 =?utf-8?B?Tm1Nc21UTDlMWXNlbWl2M2c4Sjk2b1FTVi9SV1V5MGo3SFVQZmhNU01JMnR5?=
 =?utf-8?B?RlB4MTdOUTlyZHJQNXltRXVJODc5eEx4eXJaZlJybGpZUTY0YW82S2hDZWhy?=
 =?utf-8?B?cG0rV3F2cWZtTkU4Y3pTNXBVU1lDVGV1SjV6S0V2RDhac0tRcUp5V2JxQXNY?=
 =?utf-8?B?bHN3azZNb0xuOGtyYTdrZ0JxVmxIQVptS3B4R0ZRT3JlR2xiTlJhdDZ5K2lS?=
 =?utf-8?B?SFFBVTV1bkdVNEsrbTlwUFE5dCtuR3YwbFZQWkN6TEgwKyt2ZXIydDgrSjhl?=
 =?utf-8?B?UVpwc1Q0Y0ViT2EwTm1UZEtEbWZldGRTR1JSakxOby9KYmgrbFdsL1Z3bXhN?=
 =?utf-8?B?TkhHWnZ2NWlkTVFrcTVLdlVFcE5ObFhwSVVjN3hFR0FNcHBDVG41aVU0NDlU?=
 =?utf-8?B?WGNzOTA1cUdreVh2UFFGWmZLRHJUMDAwVlAzek1vbFRITzN6UzlLVHNuMVNR?=
 =?utf-8?B?dG1wSVlWeXgvQ2dXQ2ZYdEpwUlVRaWY2M1JjQldqdWtJQ1hTeWMvK3FUS0FV?=
 =?utf-8?B?dUthSDk2aElWeUxLVjFLKzAraWdYMlpLN0J6WlAwNVc5Vm9CTExVb0s3L3Fl?=
 =?utf-8?B?WVhLcElJaUFFcjVjbmE4bHNQQXdUYXBWQjJNbUEzQ1JIQzJJb1BhZnd3dmJO?=
 =?utf-8?B?Tm84SnpoYTRDYVVOaUJWK0pjZkFwZFhBODluWWNkd1NRVFhNM01KQUV1Tkxx?=
 =?utf-8?B?VTdWLzZDY1NVQmRPTXAwTlkyVDdiT2ZlMkFNamxFMmxIdDRZNnEzeGxJRzVq?=
 =?utf-8?B?aDQ4ZWxSdm1FRWt3SnE2WVdZWHQzVEk2elFScStkRW90WThaaldVVDN1NFY5?=
 =?utf-8?B?U01SSEZJWnd1cUFWSU1CR2lZNnQ1L202dFBQTTZoZkFJY1ZuTXFqR0FlTnd0?=
 =?utf-8?B?aXBPYWFVc1V3WUt3cTJhbCs1WkFLNmp4Y2hrTExxcGRwR2p0MlZsMHJ4Mmlv?=
 =?utf-8?B?Y0xlU0pibWFnaVlSdnNiSmg4eGZOVk9rZXNudUZjS2hXRzBnNVdwV1UxOG5R?=
 =?utf-8?B?Y1FyNlF3Q1VNMzdtVkluZ1NveEpZS2hMdmdNcGxXL2NpMk5ZZnRmZVc3cU5h?=
 =?utf-8?B?NUZTNmlHalF3bHQ1SnpYemsySUh6YjYrTnlEaXlNRGpuNWVEa1pZY2FoeHFp?=
 =?utf-8?B?bURwNXJad3NKb3JFNkk0dklvSndaV2p6N2JvWGE0MjZENm9yd1RyUldOQ2pp?=
 =?utf-8?Q?Z/OIyXvZkCz+9IK4nPpCyFo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a773ca1e-2f63-4313-7da9-08d9e80d2821
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 18:35:45.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lS0gXj+eWx76yTop/GNWdQKeDmxBe6A3ZAOFfjKl9I4LVIQF7F4M8oJEimZnlNx4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3079
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.02.22 um 18:44 schrieb Lucas De Marchi:
> In certain situations it's useful to be able to write to an
> offset of the mapping. Add a dst_offset to iosys_map_memcpy_to().
>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_cache.c     |  2 +-
>   drivers/gpu/drm/drm_fb_helper.c |  2 +-
>   include/linux/iosys-map.h       | 17 +++++++++--------
>   3 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index 66597e411764..c3e6e615bf09 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -218,7 +218,7 @@ static void memcpy_fallback(struct iosys_map *dst,
>   	if (!dst->is_iomem && !src->is_iomem) {
>   		memcpy(dst->vaddr, src->vaddr, len);
>   	} else if (!src->is_iomem) {
> -		iosys_map_memcpy_to(dst, src->vaddr, len);
> +		iosys_map_memcpy_to(dst, 0, src->vaddr, len);
>   	} else if (!dst->is_iomem) {
>   		memcpy_fromio(dst->vaddr, src->vaddr_iomem, len);
>   	} else {
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index 238f815cb2a0..bf5cc9a42e5a 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -385,7 +385,7 @@ static void drm_fb_helper_damage_blit_real(struct drm_fb_helper *fb_helper,
>   	iosys_map_incr(dst, offset); /* go to first pixel within clip rect */
>   
>   	for (y = clip->y1; y < clip->y2; y++) {
> -		iosys_map_memcpy_to(dst, src, len);
> +		iosys_map_memcpy_to(dst, 0, src, len);
>   		iosys_map_incr(dst, fb->pitches[0]);
>   		src += fb->pitches[0];
>   	}
> diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
> index f4186f91caa6..edd7fa3be9e9 100644
> --- a/include/linux/iosys-map.h
> +++ b/include/linux/iosys-map.h
> @@ -220,22 +220,23 @@ static inline void iosys_map_clear(struct iosys_map *map)
>   }
>   
>   /**
> - * iosys_map_memcpy_to - Memcpy into iosys mapping
> + * iosys_map_memcpy_to_offset - Memcpy into offset of iosys_map
>    * @dst:	The iosys_map structure
> + * @dst_offset:	The offset from which to copy
>    * @src:	The source buffer
>    * @len:	The number of byte in src
>    *
> - * Copies data into a iosys mapping. The source buffer is in system
> - * memory. Depending on the buffer's location, the helper picks the correct
> - * method of accessing the memory.
> + * Copies data into a iosys_map with an offset. The source buffer is in
> + * system memory. Depending on the buffer's location, the helper picks the
> + * correct method of accessing the memory.
>    */
> -static inline void iosys_map_memcpy_to(struct iosys_map *dst, const void *src,
> -				       size_t len)
> +static inline void iosys_map_memcpy_to(struct iosys_map *dst, size_t dst_offset,
> +				       const void *src, size_t len)
>   {
>   	if (dst->is_iomem)
> -		memcpy_toio(dst->vaddr_iomem, src, len);
> +		memcpy_toio(dst->vaddr_iomem + dst_offset, src, len);
>   	else
> -		memcpy(dst->vaddr, src, len);
> +		memcpy(dst->vaddr + dst_offset, src, len);
>   }
>   
>   /**

