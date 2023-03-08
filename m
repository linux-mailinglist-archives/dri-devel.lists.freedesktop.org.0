Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5BD6B0201
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4375C10E5B6;
	Wed,  8 Mar 2023 08:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47A510E5B3;
 Wed,  8 Mar 2023 08:50:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llk7w19AOZJ7UuqbqNvho7su7TZmsylMHssRMAf3Z6k18lvTsETEnmg8o1i0YdgKRUrY3ZjuNZ7W/RqVeGi9gLBB5aPshFuq8PR58EfqJASiF0AxlMhvePqRUlNsyFhVtEpZWW6WzWcuYMGJ11Cza9n7fGOSabQ1YkEpUux4cxCPIPzAow5ivss7tEi0ebeN1ODCejyVJzC/I2DDtGhV2XZzRwNhq3KMnxQILaZ2yiUICocnEYZpataQqB5n1vW91t9VzKPcAiw/t+8Z1VNz/1nLcWWb2BhVqWTTyO5mH5Pv34z6ExMZuuXwBJ296RrkvlbMdHM6rzvJJ45H+OefsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBfYVEzDGbptqgO1gMmH5cDMUpeu0kIrRBrlxQdDSXw=;
 b=BRqFm/KyqzDX8ay2S9mwSeoyk2+2vGmaEHK6qdVrnnbIMJIjrmZri6Dqa4m2PoCy3cz891YYrE5rf3rBJE3NQeCjlBx9ltRx7nZGq49e7XRV8CFnsmd6mr6gY9LOmUy2glHAsaRRUNKr7uyMTKnebvuxQ8APKBqYgPX8AW6B+nbdK+A50thlrHjZtu4nGJiJdiSIcJrhlD4CbslK9OS4W9eTz8VXumKNYG2Te8vI71om35SArYriqgx3uEgwa10f9r5q0cV7MBaHmzsvRJIvZUBa91P88s9XuQNEJ01Mq6MVot7eKqg/AostYW4di10gcjc2GpGiXUKCm1xyW7fOZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBfYVEzDGbptqgO1gMmH5cDMUpeu0kIrRBrlxQdDSXw=;
 b=uGSsZA4R+9BfaOgZW7QzVq9Gdxg+ddFwlezFd8cnZ79wJ5VkxPOLLchzSw3WxFmmTm15YECeVezqjpqekAKgDE478P/xKsZEoTJi93n6QLZk9gKyDkGFcP0Uu6IUfsxLCNOOjcuh3i8+gzK8+flTo5s+ijkxeqwkvkSkW5genHA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB7670.namprd12.prod.outlook.com (2603:10b6:8:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.31; Wed, 8 Mar
 2023 08:49:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 08:49:58 +0000
Message-ID: <b446115f-ddde-f6c3-f7a6-db5d5542b396@amd.com>
Date: Wed, 8 Mar 2023 09:49:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/7] drm/ttm: Unexport ttm_global_swapout()
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230307144621.10748-1-thomas.hellstrom@linux.intel.com>
 <20230307144621.10748-5-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230307144621.10748-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB7670:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3f28e4-63dd-4413-ce6d-08db1fb218f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eK5YdValZ3Da1QI9uBmvanaA8pxGRMkCA4g2nrtiFdT1S4bTTDb6bWaAOHZggJsZIAFR7ZxeTVk+BNbEpWIfnK4uPU4N6h2TwGpRPAw2vAhAj4zIi1v2/HpHbo9sD3fJFWZWj4PLSnX91e2MEn5RTf/k8X32vJKLMbI8qO3G9eWv8mx9KhqomdCdaTi+KszEwRtnXHWjIZtk9LkgGnjzrt8pI1e+9mZcTbzGJc6QdT8dvpjSt8Tjz01dWOoU1tR8dv+XcDmM1smv0DyWvOxw5qXSSVoAaJAgmpdIj46ceQhhCzJf4F/NtIBVMOqugbJiFOtT8F9Zxt7MpsmFu2Q4tBKtLdeKN0xSI7LXy+fSm8ILOjObd71V6sxxF6aUH1k/R7OAsv3339U/XR0IWjPpjO75A2RemkqeMvoGqE9+JNaYWCKhuC6JISWIPv1gkaauShv9CG6ND/j31T9BiRQg50/QWyrw1l4zeQSxZ2slleYANZ3uS+K8vCgJwGxkB4BwU1OQd0LFhjO1yv1O+JPuLevwu9Aa8VCthI4vPT7CxqUxi9qwe7rjH4OuwVZc4OLJkbza6hYZdnmwa8a938fXgx5RAb23BysSKugpV9m19dtjiVpb4SzpuxQWmriT4mbaPbg/mnIfFK1ifqjLeJUcK06rXsWLf8n1qh2MsjBcVLXOuxmNbz9k0R2Yxu5vWCsnL115KMILnWafrWX1QcEwE4OWUqoXo/vvgxzUCFnkjxo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199018)(4326008)(31686004)(41300700001)(66574015)(8676002)(66556008)(66946007)(66476007)(316002)(38100700002)(186003)(4744005)(36756003)(2616005)(8936002)(2906002)(6486002)(478600001)(5660300002)(6666004)(86362001)(31696002)(83380400001)(6512007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3p3V2lEOUF3REpjeTJkV3RhdDNIZ0Nua1AxTTlZWVBMWnJkMDROLzh4alBm?=
 =?utf-8?B?c3VaMEU3YUsxSWQ3SFh6M09Qa1FPdHlTcEc3NnpJOHZYdDV0MTR0N0wyT2I0?=
 =?utf-8?B?OGtvb1lZVjNpYlhaTVJ5bmNYYzd1VERkZDBSTlFlTHRiZm5jNVg2YjF3bWl2?=
 =?utf-8?B?Y2NrZDlHTThFREZMdGNCcFQ1bXFSc0VqaHYwUkNxRXozVnh2S3NtKy9iQnNK?=
 =?utf-8?B?NzdDQlJlZC9VQm5Bd2tuQlVON0s2cHhVR0xLQUJMNjZPM0ZiZmFLSDFPZElw?=
 =?utf-8?B?aUNUdTJXNnlxMXQxT1gwWTA4dEVjTUMvQXc3VU5CMGhKZDRMVWtsQkZtQ1lX?=
 =?utf-8?B?ZTRoaGRGa0xBWHZFMnRzdzBwdHduNXZVNkxKclZ6MVMvK0wzV2lKVGhtTng4?=
 =?utf-8?B?aEJvSTU2M3hsWnFNUjI3R2hibWs2SUlTU0JuaDJhL0NOblpONlo0dmIvQVBG?=
 =?utf-8?B?dlhMelovM3Q5SHlZUkl5RmxHQzl5RGx1cUtFUWZPdi9KTGFvZGRNeXFnZGVE?=
 =?utf-8?B?UHl5SVlsNlpQRkhvdE9YZk1QdlRsZjB5dFNmZU1zMWJ0YXlPaHJ2dVMzKzRz?=
 =?utf-8?B?a2IrTTNNTFNoNFljSVZ0M2pKWms4akNXUmZLZXRTS1Y5QVdBcURLYjdBY1Av?=
 =?utf-8?B?UzlGVGt0MXVHaVRuclkzdjA5dzNwRDdIVHNFbmV1UXdFblo2TE9leWdnaEdK?=
 =?utf-8?B?MnJ3NCtldWxFalFnVGtENXpORkJUM1ZuV210RzFIQ0REOVkrTWdic1hJdk84?=
 =?utf-8?B?a29VZWJTZk1KeVpkQmp4M3RFWGg2ZG1lVEdQeitzdmgrNUF5cUFMVmRyaWtK?=
 =?utf-8?B?bFZqU2JUUllZdW5BcXJDMHNDM1NFdElxNDUrWldwZkR3RjJJTHNQMlU0R0I1?=
 =?utf-8?B?azd4c1lQZmNaRCtERnJDTXVBOWU2RXNrczA0a1BMNnYraXlTMnM2L2tVTk9s?=
 =?utf-8?B?cjJxa01QN1NIWlVSSjJmbnA1R3c2NE4rRXRncFNwQ0ZLVmNIL0l1M0Q4d0V0?=
 =?utf-8?B?ejZQbzhvNHpRYjBkYUpKZEJoeGt5ZlI5bm5VYU5oUWFrZWc5WUI5L0xvcFli?=
 =?utf-8?B?Q0ZFVm9FRG1GL0ZCd1BWZUZBYzBYblFuQW44NTNKdDljTWRXWG00MU45cldy?=
 =?utf-8?B?Q1pCZkw4TEpCWXpMOUdhQit0YkZwQko5VUFobndBWWZWVnloQzkwQTZkZFVD?=
 =?utf-8?B?eFVkbDRaY0xHWE9iQVdnQlFVQW9SbzdKK1dzRCtnWEhQaUZ6QVRPTm9IM0VS?=
 =?utf-8?B?Q0NXbXdKcndqQytFMFZnUGtpZ0lab0Mra1ZZamVOS2gybzVtNk93U01xLzRs?=
 =?utf-8?B?dVJzOXFZbmpRVk5TRG9NUjAwMjROWGVPQ3VYNWVzaGdVeGFOV2RVYnpaVEhE?=
 =?utf-8?B?enZid0xTTzAxRXNEanQ3bGlBQmhCZjNmUWd6NzRtWjQwOHMzekQraVJ2aC9Q?=
 =?utf-8?B?SHlSZjlzb1p3YWF5U0tIbEN5aXBuTTlWV0JVMkVUSWdidVRiUGlRVlZvUGFj?=
 =?utf-8?B?OEIvMG1FYnNYNzlPY3Mxd2dTYkROb0gvN2NNUElUVGIrbmZhVWVoWlcwOEhT?=
 =?utf-8?B?S203eHFoZDFOQnZoZGdZT2tYS255ZC90L3lCemNFb3pQeFZCcUErS0pad3Q4?=
 =?utf-8?B?d3Nock42NnRYZ0VPTThnUWhSbFA4ZTFKWXJ1bHpnK2tYWGkxQ0pmcjBaQTU1?=
 =?utf-8?B?SlduTDBaalpkYUNxY0lxV0RUY3dKYjUvZU05am5FN0xadHE2WENZSTNEZ3E2?=
 =?utf-8?B?RGRVU1g3a2pBYjZPVXFCZ1RqTHlyeHRSc1hGOExiSTJ3U1FrNU10K2JIOTh3?=
 =?utf-8?B?KzhuZFMvSXlFcTZLd1BpQU5CcUpTVkdQV0FHUUsvSnA5VUlIRTMzV1l5cmRO?=
 =?utf-8?B?dzhyeEpJT2ZtZjdDU05GYXVoY21haTJVTCtaWXVKaXVCZlZ5NXZ1c3JTejJt?=
 =?utf-8?B?V2YrekowK2dOWU9YZW8zakZLRklsS282S0lURlNmdjNKcUtiSkdzRjdMbjRX?=
 =?utf-8?B?dkRBdkYvTHk1S0FUK0FMWXBHSWp6ME5hSmNka0dWNlA0c2JSR1M4WEowYTRF?=
 =?utf-8?B?bEtkUGpPY3dTaDRkRFN6a1I4b3AxVGlRTjcxUEVqSVd4UHR3WWRKdlVGKzd5?=
 =?utf-8?B?NGhydDdsbUQ3RUdpMHVtMUVLVTV4QTJtSmNDMkdWYkNEOUllUnNxclcvWVcw?=
 =?utf-8?Q?/ULQcygsSBch7ZsBBJrsDySUty298URclbe6HLNrww6f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3f28e4-63dd-4413-ce6d-08db1fb218f1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 08:49:58.8696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMIO2q9GUrLqu+VB2hR13GpMDWakZmn0l5QqDL6+bHA8GCjqteMw5i4RZx0tP5D/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7670
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.03.23 um 15:46 schrieb Thomas Hellström:
> Unexport ttm_global_swapout() since it is not used outside of TTM.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index ae2f19dc9f81..64a59f46f6c3 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -137,7 +137,6 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>   	mutex_unlock(&ttm_global_mutex);
>   	return ret;
>   }
> -EXPORT_SYMBOL(ttm_global_swapout);
>   
>   int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   		       gfp_t gfp_flags)

