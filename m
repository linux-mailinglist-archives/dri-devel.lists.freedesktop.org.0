Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6805B9A59
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 14:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B5910EB0C;
	Thu, 15 Sep 2022 12:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E1510EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 12:06:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odhGlNq1VTSbqF1Ep2u/jtSK85TVw0rorvkIRGtHtjfi8xd0HiKEzulJ7B1/SPvJk/RjZKHj2qfpUUkI4gIi8e1OjSVsk6eruoSTnb21EOMbYwUJs7B4/MeUKzhihNN0EeiwrbHDS2VYd3A9bhP+IFI5Nq+9bvLgd/C5qg8J1HGQi1Pf4DMNezY1FFiwJdV7YevFSADFGRzEeuP/u6UqLClN3EbhFpsJTEgWvVPnJ/dHo4oP3oAiYFOQ8uRJW4RIPTaXWTtVUJPcmblRagOevlhGwRzXwOvjo8Ai3+6PQljxDMDGPfgKuzLP29IIFyCbDYUMVxtfMcfSlNqLig1cjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtMkkWZi01CYlZjTeKEAiaQ/rbxtvPyI3G2CjfjNRmU=;
 b=SmbxulHeu2MfaYjKN/G5F/9JRS8Uheh4sUcVc5UieE5C6EwcyZ45UuqnlKXKI+QSNeCJ7VJgk5r7GVllAdIy9TMOZgAKEhX/SFsmGX7uOQy0t/orTbvHQyhPLjIK3bojezTcRvrtATNeh9Lx1FfCJFiYw6bKAq+RRGOOFJ4To1h5sjJuNvLpWlPKsxxmjGor7zEla/Yum7vBgj/A0WWmKf4GVfUSi32g3YAf1Z+AhzVqVm7LgpLirOrdnitkdn9uKeKA5vJWC/zRwIJXxtfnEAgAhYmyaXylBODWy70jFuv28NHGTT4Vo7G2lHHFjO5AAnyOtq0fVE0tF+wREBqFpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtMkkWZi01CYlZjTeKEAiaQ/rbxtvPyI3G2CjfjNRmU=;
 b=kcptkPNr+Aj5B0cmDWApHfPXmDGsycWePgUPDYRUqFXS9abXDQBuiR7DUZOIWeuTl3zcxg2D8uzjzngS4r7g5XfMuuZy8BTtJr+Px6nK5a3Bk2CQlzRXQg8BkSq549J27XmI6F5Gq4CYFcyhbUfWCObFu8X6Qe+MXfIC82D+ir0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 12:06:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 12:06:56 +0000
Message-ID: <893fc57d-7a49-4b39-ff74-867579141b22@amd.com>
Date: Thu, 15 Sep 2022 14:06:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 6/6] dma-buf: Check status of enable-signaling bit on
 debug
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <20220914164321.2156-7-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220914164321.2156-7-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 53afd2f5-2815-42c2-fd1e-08da9712c8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0UOMuEhABNdJYFWp/UJpUOzil+9c14yXgdEXOMqkhhlDtjpo/4p52rZ67W4wuRKsLyXEC5uMD+yTh1K8sgghooVvfcbv0MUCZ2zBP//wYvfr0Uy4EWA17AEhtF/9vBqG7S0bLh9JhObUYRFnPKVNsXYjwHcG1STYtvz3bSrya/83VqtXzaNwERm9VYXzoMgHbL8MA2gNvxwqI9eSfMaNENBUUp9EfUGl8YFs7Pl3azwSs0GCuanzvJxeGqNcBZkFZroa160AQBUTH3HJwduwy3KQMQjXuc5ofbJuaF8sSp3CgQe+3nGx2h9E4iH2tH4p1FBe4kse6fy2iwU9bXMEqguzVyynIlVDN3Ok5d3E09n/dih06q3UwfZjKa3VJWe5fYHmvCYuSYYMDt4FrFWycTrhKPC7mvTdLeMAv8Jl/V82VMF5D9xYqGuZRdh/F7U3TrKd/7Z52b8vNxv03z43JCqbMu6FsxL9IZvXD4rZe5zxKJstMX43Cu4svfWv5aIoaQyXp6uQxZm7YaneL4XKQDiTqS1RgqtM8p7wEn3VpH8Nkm2se5W0nwj5C9+1AQcZcalMpmvyF4culbQW8hwo6GY6z/hRm2wojsBT/8r1XXeGheBS+jnmBf8xFRtXaMyLQmvJM+4aL9zHW2niW3DC3MLZIKG8h/QDawZDfBx7zTonpRvZw7myZVjcX7vDcJ5Df/HNmDGzlXSkYYijuutJ62AahvwT2y29nCw0jS8IMs/B2O4FX/TQ30DFvQWyXh/vh+viMY8SRFqXCqU9adLC4vu08Uys5e/08vyPQQgBOXXSAvg8OwzZF73rMmdfv574
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199015)(186003)(86362001)(31696002)(6512007)(478600001)(41300700001)(26005)(66574015)(36756003)(5660300002)(2616005)(6486002)(8936002)(83380400001)(316002)(6506007)(6666004)(921005)(66476007)(66556008)(8676002)(38100700002)(31686004)(66946007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdFc251VDdnOEdkWEZtR3RvWTJNRkpzL0dESTJsNnVjcmxJTUxKTTAzS1lr?=
 =?utf-8?B?YkdqTS8rMHBIVlhxbDdEbnZ0QnR6UVNHZHVtOGl1SmROMXU2cjVDLzB0Sk42?=
 =?utf-8?B?cmtRU3JrRHB4bFVYOGlQVGE1MVFncDR2cVlVTHpjTnpoSUZJTkJNalBtTGxk?=
 =?utf-8?B?cjFiQzNra0VKNjY4TlJXbzBhSUpQMkd6QTA5akc5ejg5UHN1WlRRZHNmc1BQ?=
 =?utf-8?B?c0xuOENhcDlxbkpSeTRhTlVZL2dlQ1dwcTdYM29lOFV3ODhOZmVnSWcxQ1Nu?=
 =?utf-8?B?NVhoY2tsaGZxVUJTbWFRUURzd0FLL2V0ZU1ya3ZGelNwaE9WeFJHeGsycTA2?=
 =?utf-8?B?VXBUeGMvOXE0aGt6QzFhQ2l3QzdGbVdwUXVNU1hRb3BTQ0VPcVc1M2dvdTN5?=
 =?utf-8?B?c2VTbWJBY1MzcDNOTlhyY0dmUlpwb2d2cndCV2d3aGtzTTZyRnlnSmMxQXZT?=
 =?utf-8?B?Y0tXWW1YMUNYQ0ZxTmxMSjBBL0E1aVZMbVkxanh0REdCYmZScUkwR3JnRWZY?=
 =?utf-8?B?dFJOc2E5cUszYSs0N0VuSTMxL3RIcGVtSlRXRm9kVnp5aWVpakFJNXlBVjdI?=
 =?utf-8?B?ME44a2dLenMvMnlpbmYvOUJlcE95RHlTMzUvTlZWbWJJZXJaTDV6M3NEWnZE?=
 =?utf-8?B?SWQvQzRQRWI1MDllRDJNSStKbCtGZTdhOVc5MURvNi9WUTY1R3JacjZOZlBy?=
 =?utf-8?B?N3V4RkJTajNWMyt1c0syUmNzRzAvVHJTeFpmWWRFRHY4YjlyZDJMK2FqV2dM?=
 =?utf-8?B?bk5ud2JjbFhIdnNiajhZVXFQNjc1cWlnMVZha04vY09TYzBqZ1QrSTBMbE9w?=
 =?utf-8?B?c0JyeE5rMzlrRnkxRHVkL25yZkV5bG44bG12cjhoOTkzTHR1OHRycEpLVitk?=
 =?utf-8?B?bElIWU5BN1dDSHFMdkhNY1NSL3F0aTlITzBCbU9qa0FUOUlqWW92Tll6dnNK?=
 =?utf-8?B?eTJBdkt4dStFUXBGV3JBSHNiaDFCck1RbUVIeEpodW5NbGkrVGRPZFcvZ2xM?=
 =?utf-8?B?c3MvRS9uMXdXZWxXRmpFalB2WkxyYm5SOHl5RlR3U1A2dXplaE5tUVhZcnN6?=
 =?utf-8?B?QUdoLzd4UHk0WHBDVnBOZDZ6WEsySXl0VkJVdzNDc0NDb3MzM0J0ZUxEWG1m?=
 =?utf-8?B?TUlERDdsN2dRNGYzUjltMUdodFRSQ0V2YThZZHhQWnVMU0w3OFNhYTVsQkNq?=
 =?utf-8?B?ck5kQk53S1BxSHpuRjdRMTY3VnIzcG5GNTUvOFlTR2UvWmUwRlJpUXdqa3RV?=
 =?utf-8?B?MjNoZnN4WVlFc1RHcEVCRThPLzROaGMwZWR6b0ZMaHpJdnBOQ0RScjBFaEFD?=
 =?utf-8?B?bXpOYzE4TGNVY1hiUFpsaFJKZXBRV25iWHBIemhwenprK2w4TElndi9ITkc3?=
 =?utf-8?B?T0JNb3UyeDhkRGlTcXlaL0FUcWEvWlVzRXZ1WGlCYmxxOE9kdjB1b3pNQlZx?=
 =?utf-8?B?NVgxanYzY0ZYaWFycE4yOU1KVFZxd1dacUl6V3lhTXEwOEhQOGZBTmJYUTFz?=
 =?utf-8?B?WW05Mnk1Z084OVViNHpoQ1c4c3g4a3F2d2djdHFlZ05VdTBOc201NDZFazkx?=
 =?utf-8?B?RW92TFBPNml0a093N2tOREdkcmRtZEhSRnFRbWp1S1ZzVmRaS2lXbUxFZUx4?=
 =?utf-8?B?SjlNZFhjY1I2cVVhbmJRRnd0N1BPeW8rcXlWYXRCOUU4TGgvVEsyRFM2aEcy?=
 =?utf-8?B?SjZ5bDNyanRpYWNLN1JjeU1XcHNQc2V1VjZiQjFCTVoydTVsWFFnQTZpdHh5?=
 =?utf-8?B?NzV6a09aUDZSQ2F0OCthUzNCcytHRFFGaGFKN3U1Z1A3emRYODk5NitGMlhT?=
 =?utf-8?B?OHl3Z0ljZTExdDlnYXF6ZjZPQ2lDdnJMR2c4U2plOVlJb1N5Yi9aTzVKWlc2?=
 =?utf-8?B?a3lEV1I3RGs4NGM5bGFNWnRwcldseHNHWXUralVEYUZmNm1SblZqZFNnMXdu?=
 =?utf-8?B?ME50d1gxTmpXR2tMYXN0R0o5ZDZTSVhicmxUZFFEdkNUTndtVEMrOUJ5TGJq?=
 =?utf-8?B?bmI3azlzbngybUNJYXFpZElFUFEzMm81QTUyREtYSC8yVzdGYnRqNHNnSno1?=
 =?utf-8?B?UFdPZU1VY040dEpqcEhVOEQ2cnVidldtbkY3Zm93V1E1TGV0T3lmVzdDaFhM?=
 =?utf-8?Q?rfooHUr03ORYZiEQ+PfC4ML6z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53afd2f5-2815-42c2-fd1e-08da9712c8d9
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 12:06:56.3937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaZEn9Cv+DL0KZd+eoJ6UYWR2Dq8EDWEOHYo9/jQGVbq7/LvxSlMEgY/jzBpoyt0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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

Am 14.09.22 um 18:43 schrieb Arvind Yadav:
> Fence signaling must be enabled to make sure that
> the dma_fence_is_signaled() function ever returns true.
> Since drivers and implementations sometimes mess this up,
> this ensures correct behaviour when DMABUF_DEBUG_ENABLE_SIGNALING
> is used during debugging.
> This should make any implementation bugs resulting in not
> signaled fences much more obvious.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>
> Changes in v1,v2 :
> 1- Addressing Christian's comment to replace
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH instead of CONFIG_DEBUG_FS.
> 2- As per Christian's comment moving this patch at last so
> The version of this patch is also changed and previously
> it was [PATCH 1/4]
>
> Changes in v3:
> 1 - Adding new config DMABUF_DEBUG_ENABLE_SIGNALING.
> 2 - Replace CONFIG_DEBUG_WW_MUTEX_SLOWPATH to new
> CONFIG_DMABUF_DEBUG_ENABLE_SIGNALING.
>
> ---
>   drivers/dma-buf/Kconfig   | 7 +++++++
>   include/linux/dma-fence.h | 5 +++++
>   2 files changed, 12 insertions(+)
>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index e4dc53a36428..c991e6a51510 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -65,6 +65,13 @@ config DMABUF_SELFTESTS
>   	default n
>   	depends on DMA_SHARED_BUFFER
>   
> +config DMABUF_DEBUG_ENABLE_SIGNALING
> +	bool "DMA Fence enable signaling debug checks"
> +	default n
> +	depends on DMA_SHARED_BUFFER
> +	help
> +	  This option enables additional checks for software signaling of fence.
> +
>   menuconfig DMABUF_HEAPS
>   	bool "DMA-BUF Userland Memory Heaps"
>   	select DMA_SHARED_BUFFER
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 775cdc0b4f24..01e1fa4d3cec 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> +#ifdef CONFIG_DMABUF_DEBUG_ENABLE_SIGNALING
> +	if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
> +		return false;
> +#endif
> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   

