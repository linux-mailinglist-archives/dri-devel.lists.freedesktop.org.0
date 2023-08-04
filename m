Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8597705E2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 18:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B6010E733;
	Fri,  4 Aug 2023 16:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41C310E732;
 Fri,  4 Aug 2023 16:24:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBDOLi7BtrevfpXB/V5t2aDJGwvicfV+FJIBz5oJpdxHUhNEqtRpLVZ+0So/fm3QITgsqu4VKavErtGeNlL2OHZ4JG5hw606HHxngd/a6B4hdwaYdLbdj4Ox7ktJD/cgd+gesITTlWv0IdAW7NFFXHRfiN/Iop0zHm6ldF3UhRVVSm64DMVVE7YOFw4CwgjTZH8Q+Av0C+LE+cQhhEP+FxzA6LHaNpNvR0lFItffWdlmYEBDSTzrCJIMhY0ALtCQc/ExoD2J9h/OuoPPjeVQWi1MJny2v6rsr41VuV7mbVpPLE0ReHmQuJNzS5mDruc8/JBn15mGaPai8SVAao5o2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt7xP9HjM9KYJVlQy6mKqcCGI34cgcHsd2VoVsIGnyE=;
 b=i+BlGVFuqj5TsN7cGs40WxZOxjOUOMTfjKle5+z8vdXczpzQRT6f9BOPKSqiyLD7pDjQcSThQfwCQbGTowqP6WKx4svk8IFy2u5t2nhioWvllyZyPKt+jGvW1X6iSRo+xtNtq2TAZwznLBjSAWrNeKeqPQHwz8TYHeh4518L25kAA4akiLV7SxlMqFVdutdE4awhwoeIJjKwfex1/Tu+zfUQ1meZNdAvuDiFxtLcCGrSva/oOXLyGUiXgNiFE7IYEm5nlvfp2SkA6KwRCOCjcv2n8IkMvOCckRhnphoKiOMFMn8D6d7R1nuKbanl9e+BkLu5HsQIm1e5LQexjQDRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt7xP9HjM9KYJVlQy6mKqcCGI34cgcHsd2VoVsIGnyE=;
 b=i4ryzqVA3ViLZJkfAxISN7ouxlrvVGY5vSWObzj1QOK10oG7QdsVrOxTYwA6VqW9tH2AMdrO46DgKskExEFQXjK0xCC0zhGaEmCxu3xo/uN0zw+hNroJ6KMZc2dDTWTeHmmNkhjKCO0M9Ku7kzHul0j4t/FPOV/CW5cFawf3OKI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS7PR12MB8081.namprd12.prod.outlook.com (2603:10b6:8:e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 16:24:22 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::ca28:efb4:a838:58fb%4]) with mapi id 15.20.6652.021; Fri, 4 Aug 2023
 16:24:21 +0000
Message-ID: <c3ae568d-f941-2b66-1e36-9d67b6a231ea@amd.com>
Date: Fri, 4 Aug 2023 12:24:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/amdkfd: fix build failure without CONFIG_DYNAMIC_DEBUG
To: Arnd Bergmann <arnd@kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Philip Yang <Philip.Yang@amd.com>, Alex Sierra <alex.sierra@amd.com>
References: <20230804132924.2314478-1-arnd@kernel.org>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230804132924.2314478-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0075.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::8) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS7PR12MB8081:EE_
X-MS-Office365-Filtering-Correlation-Id: 74827918-ee64-4105-39ea-08db9507424a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I53HyPyfPvwXBDIuUmVGr2aE35IgGYos1xdcsQsLXa7p2l5xTbGm1RKrpZPi/dHHdSFyz/IHkngQD8b2G5ZDP98XC8WMje1PGyzUVMHsJB004xJG9mC/5x8Ik7x3Ti8TAod0L3O2AiuJdpNL9W1Z+o5WDOb0Oy9/Hg0MqiT0lt2inlCeOrMQ43Ua6uxtFBg5kCTmWXCyNjB9HRWmfJbGz4XPZ8rovXKub7ENrVGwYE/mt/LcTmlPL/rQmzN3tfRIC6X8fD9x27h2cV74f0lghty9YV/M1qKCrBxkfTldWtvQwTF26omFvxiEhfZQgzkU6l4T2O6nehaa9G8Q9nHrhnFlyT+MDi2bY9CnITJ5kMi9wz6VlrTqyW3HGik8Ne3quxrHAHrhW5/uzbv7p2EdGaLXeXhRsGKjhtWnlWNYgtmZKctxbLzzrtn/Axx1S1L7dIA7BzGep2X0A0RhWjjcJoko4gTY95QV3SsEjwito9dz7jDiKoo2CCB0WIrymxq3c0C/qUfnOtlowCltxCq9tuRamPO/IYvhoGIOcon37xHYfUzg/KvVKA2YQoAf7hGdchrM+8aN4Jz5AtZsnWhKDMYZT6+eAnaIj95ILEp14yLubQ+rPcL9PyLlet5LXfACXVV4jS42bRM0hgCm+pxZYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199021)(186006)(1800799003)(41300700001)(6636002)(4326008)(2906002)(66556008)(8676002)(8936002)(31686004)(5660300002)(66476007)(478600001)(44832011)(54906003)(110136005)(316002)(66946007)(86362001)(31696002)(6666004)(6486002)(6512007)(38100700002)(26005)(6506007)(36756003)(2616005)(53546011)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFJUemRtZzl4Nnd0Ky9kSXhMRzFOeENWMWZmTnNFOUY2MUxXRWRiTkVvZU80?=
 =?utf-8?B?WmhnekFCWGJlc2xhTXRhWDdIeHVwYldqajk4VE1SWWhvNzcra2o1aDJKaEZQ?=
 =?utf-8?B?VFVGS3BhTDdCeit2MENwR0VHVW1hcElDSkhZbGd5aTRXVUdrVUVjTC85c0hG?=
 =?utf-8?B?WGYva1pYZDE2L3dMeUhSa2NxMUVDRjFBTlJnWmNUem5EV1pzd1RBUVB3N0s5?=
 =?utf-8?B?Z01qRmx1MGN1Y3hhNVF5UGdBdlJLNjNUcG9kYkZ6S1gweEo2YXluMy9MSDBa?=
 =?utf-8?B?UzdLK1MwNEVtRUJxNGdSbTd3WW8vaDB5TTJQNHF2OTRncHRMU0poY010VmxK?=
 =?utf-8?B?aWF2M0c1c2k4OGIveTNOdU8yU1hZSTFtWHlZNVQ2ODFSY05ia0g1NlFObEdO?=
 =?utf-8?B?OWZURnYveFluWlg5cUZNN0h6cytzNlRvVWxROVMvbWpPS3JBbCtjcWR2VWgw?=
 =?utf-8?B?RVErcngvUXhYdEUrU2pyOFRpOENKVUNhS3R6ODJ3ZzdLN1hVTTdCNnRxNm16?=
 =?utf-8?B?Y0s2bExBTjdqQ2gxMkgwS3drNisrYnBTaVZ3OHRzSGVtaE5SaXBpbzZHbDht?=
 =?utf-8?B?bjlmdDNZU0l5UDl2dnlYS29nVkxLNkVGUFp6djV4eEFXdVBrV3N2OXoxbWE3?=
 =?utf-8?B?bVlCeDM3YnU5clh2ZE0xb3ZnMW1qTzk0RGNuZ0xkUnRHdS9Ecll6NEM4WFBU?=
 =?utf-8?B?MnFKdEo3N3FMK09jc1JNRzNIOXltNWpLMjRNdmdzd0ljZkw2RW96OXVFZGVw?=
 =?utf-8?B?ZEVZVlBwWkcxTnJXYXZaeXl3MjJLNDByWTlsZFBwc3NqV2EyMXJTZ3NCUXNE?=
 =?utf-8?B?QVVUOVZodS8xSE50Rzk4WWg0NitkbEYvUUpiN2hncVJ3eEhubEtOVjhmdC8y?=
 =?utf-8?B?Z1VXQ3RmSDZNdE9HN1FwSEs3ZmJoWjdadWI3ZGl0WHRiWmFmL3FySjFXME1h?=
 =?utf-8?B?enpzRTlQWVNib01BTWowSU5QTi9iMjVtL2I0MUZmanNCUGtMY3NHckFtZlRZ?=
 =?utf-8?B?VUVJTWM1TTFyQUtlYUJqN3FnS3VmTjFNK25hSzN6WktiQndvbnYvWk95cHV3?=
 =?utf-8?B?Rkh1WUFkdnE2Snh3cWo3eDA2WEk4T0JtNlFybFZJUC92emJwVk1RcktKQzNw?=
 =?utf-8?B?c2VTSHdRSGRDTTZQYm50Tk4xTTVjc2pHZ01oR0lBVWRaVTM5TjNDNkVWZUpC?=
 =?utf-8?B?QVNkUlBmV2k1R2ozOW1CdXdDamRiaGFyckxQOFljQkxha3g0bFNJeXRPYlJQ?=
 =?utf-8?B?NXVTSzhEOXpVK2MrdWJVMWsybWZ4M1N3OGxMeTlqM0hGdy9Edk10ZjVQMEcr?=
 =?utf-8?B?MHFZcEZtWnF3V3FoRk9ENjE1U3cyTTZJd0htRENna2IvYkFEeGlYMmlFd1Rm?=
 =?utf-8?B?NkxrdnJsRWlvNk1udHRuZklmUUNMRERqdEpMbGVkOFI5MlJ6WW5HTFg4Z3Rw?=
 =?utf-8?B?SVRqU3lYZXcyRGFkdG5ZUlNvVW9rODY2cUJXRG1WeDJXemR0S3BVU3Fybkt1?=
 =?utf-8?B?aitBY3JUZGhzRkRsbit4MFVoWVBndUtER3JCRlc1VHVLQWI5UUV0MUhjVVda?=
 =?utf-8?B?QXUrV2F1T2lENmRGcDJNVEk3YmVOcTFEM08zZWIrWWV4anpZU1lRbWFtcEla?=
 =?utf-8?B?NC9ydEcwU0J6MGJZc3BRUW9KRGNRcFZtTFBPMVFNUnBicXdBd0dTTEhpYVJ6?=
 =?utf-8?B?Q2pXZ3dzMzhadld4TjlyTC9oMDgyUVlHTzlNV01hT1hNOXdTZGZ4Y0pPRk9C?=
 =?utf-8?B?bmQxWHhIeFpqK3RpQVI3bXBTS3pFZUNiSFlZOFdiRVp4bko4WHl0NUVMSDZ1?=
 =?utf-8?B?YmFSNnZLTG9YbmYyS2drdWRYSE5rMHBhR2piTGRPNXB4WThnaDNoU0tRRkJI?=
 =?utf-8?B?SzNUYzNyeFFWRjlEdVQ1Yk9yQkJoelpTN2dvWm5SZDNqQ2pBT1pwRVlvVWdy?=
 =?utf-8?B?d0ptbUdLVStEdk1zS0hwL2N2ekNBTkpmUjJoR2U4ZGF3d0pFVDhhRWI0UFVT?=
 =?utf-8?B?SERzZ0FqZ0dMNC9ONXRJVk14ZCszVGhOT1JoSVg1VmVLL1RrMkdLQVV0VFVm?=
 =?utf-8?B?Rk9JaGlXbTBFSTIya3V4R015MFBUcXF5eWJtaDNiSHZiRVpZQWpPeGlLTHIv?=
 =?utf-8?Q?D3tOVhCRQnV2xtY4RgpiooFTw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74827918-ee64-4105-39ea-08db9507424a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 16:24:21.5561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+DS3lnhPDfZ4Q2bjKWB90dqcuZPlNqYvatVXOkNPJTKXJZL1DrFQ9LYBvBm6va3ril9OzlcxYUhjMO/PXqW8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8081
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
Cc: Mukul Joshi <mukul.joshi@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Graham Sider <Graham.Sider@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-04 9:29, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_DYNAMIC_DEBUG is disabled altogether, calling
> _dynamic_func_call_no_desc() does not work:
>
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c: In function 'svm_range_set_attr':
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:52:9: error: implicit declaration of function '_dynamic_func_call_no_desc' [-Werror=implicit-function-declaration]
>     52 |         _dynamic_func_call_no_desc("svm_range_dump", svm_range_debug_dump, svms)
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_svm.c:3564:9: note: in expansion of macro 'dynamic_svm_range_dump'
>   3564 |         dynamic_svm_range_dump(svms);
>        |         ^~~~~~~~~~~~~~~~~~~~~~
>
> Add a compile-time conditional in addition to the runtime check.
>
> Fixes: 8923137dbe4b2 ("drm/amdkfd: avoid svm dump when dynamic debug disabled")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

The patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

I'm applying it to amd-staging-drm-next.

Thanks,
   Felix


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 308384dbc502d..44e710821b6d9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -23,6 +23,7 @@
>   
>   #include <linux/types.h>
>   #include <linux/sched/task.h>
> +#include <linux/dynamic_debug.h>
>   #include <drm/ttm/ttm_tt.h>
>   #include <drm/drm_exec.h>
>   
> @@ -48,8 +49,13 @@
>    * page table is updated.
>    */
>   #define AMDGPU_SVM_RANGE_RETRY_FAULT_PENDING	(2UL * NSEC_PER_MSEC)
> +#if IS_ENABLED(CONFIG_DYNAMIC_DEBUG)
>   #define dynamic_svm_range_dump(svms) \
>   	_dynamic_func_call_no_desc("svm_range_dump", svm_range_debug_dump, svms)
> +#else
> +#define dynamic_svm_range_dump(svms) \
> +	do { if (0) svm_range_debug_dump(svms); } while (0)
> +#endif
>   
>   /* Giant svm range split into smaller ranges based on this, it is decided using
>    * minimum of all dGPU/APU 1/32 VRAM size, between 2MB to 1GB and alignment to
