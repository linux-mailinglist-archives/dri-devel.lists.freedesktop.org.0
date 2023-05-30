Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230A8716E33
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 21:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2510010E1B0;
	Tue, 30 May 2023 19:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357BA10E124;
 Tue, 30 May 2023 19:55:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gijvGlnZVsGBrWhacqAt2deIhRKLPzqvBtBOSvbgx7Ls/0k+OKuNU2X+yGVEORXruLADGylxMGsdVnh/uC6KG4J7950oB0JwH2gPustouk7x0MJ9L8/uezWsio9+8zSTbxsbIYpii3trU8uMLLFH4Art4an2QKGRfABaEqd8Ldc/RzFCS3rGWb6QqYL++xeW39ByVDxF/98KAjm8UffUuQ8JVq/yeuMW63n9TIzDLYWocbxsTkJ7xX8+pWFWZAGkG/M5Y93p66Xh6DjaDcXd8SwIlnl6SEJ+j6KNXJcT7BFGpDWHU2JmDKoZQS5jNPxBEQyV+j05fBMb87UhU/JU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8N3BfwBuBK4/imrueJAfSvVTlsoB1WeMY8IzPDJnI8=;
 b=SKSskyUt1mG/DMs6wc+VyayzpEBcdQ6UUNow30aM9iDj0enysGkkmOmpBip+szOS8AekHJp0x+ggxMPVu8kFXBL5vda4toozNeG7VRi5g3Ka52qHkOqfu+xGn2nlyYQRquCkjloxesMiGf3jKzyJP3Xfy3qmMROGZjVNFQdSC+c4Gxt8krwQqMFWM1UtZbq2cIyJJtlzY1iD/KGG7ryo2izHJP4/YySTx0b9Jpepmo2hn34ZO7FSOLvIGpU1lq0KZWWAXr9TJRzY8EmYVg66Jqcy9lAvM7A90tNO4izTRTqsdEiNFwe3eP6cxtKm3fqsH0yT0zut3y9h1f8nLCdFAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8N3BfwBuBK4/imrueJAfSvVTlsoB1WeMY8IzPDJnI8=;
 b=u4J7k+m/wmLF114N+w1wuY6KHAIWVFUeo0b9uuZcUV3AyqzN019DPmmgLOyLSDzf9zGEc4+D+G1QyGs6BPg6/AoQjb1rszxd1mQ2HPu2/Wd/FTeOuKU4fO/xhM7QvizJyVzW6GDmi9k2ohlDwIvjLDCW1K1OqgncKmwOekmyZhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SJ2PR12MB8183.namprd12.prod.outlook.com (2603:10b6:a03:4f4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 19:55:32 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::943e:32fb:5204:a343%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:55:32 +0000
Message-ID: <59f46943-e1c1-8bbd-e68b-c57cd98e839c@amd.com>
Date: Tue, 30 May 2023 15:55:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 14/33] drm/amdgpu: prepare map process for multi-process
 debug devices
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230525172745.702700-1-jonathan.kim@amd.com>
 <20230525172745.702700-14-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230525172745.702700-14-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0076.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|SJ2PR12MB8183:EE_
X-MS-Office365-Filtering-Correlation-Id: a44e28c0-cad9-4332-3103-08db6147d35b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQTU+sZ0EOfqFIEFLderKkrK0cbgDYkPkN+QHRTG221uwl52BtMBXhEQCIVPzZN4wBgghe1hOE2uRSEvVZ4ba7O5eXlvKclGKh+dITBxFl+D0Au3jFaiXQcUzOzPi0SfHlidtTtgTJ9bbhTD71WiqgArt8V5yCMDgeI55BW41GyU/Hi+EutLKo96JrKhYQuWJ68S+2OnF5p2R/qkBkab9f0d6FviR4LBaGW9UA/039aNUol2DUtYvrl6+GY6W2xNN48FCFRtMNLxT4yatuTch+FmY5dAQ0GvCq7gWWjzpSSUdxxAFN1WCo9uRRW++MKYRQK9itVXH7iAGB39+TUmxTsbQTS2YCdPXN6hhcS6arQ/654ERa+CGk9fhP3zW13JMxrgPy8HhwhcvK9AzTGXRSJJha5+LrUzuFwxfKjwB87691DIm+gaTLJu5N2YheQZwiet4r/a5l6jDEnVP6HXn5e1/633Fm6OgbHizJrWnDPDUFLqvuEHR2tK2HuW6tlRvktPswPVnts0JE3WQpMd301r1rNWSKUrReJD4mjAOxbXMPOoE70SyYDFPdNNrSKeRIHdT0GvWlpe9M6vcQ+qTYwDOOh0qi0rfsbqhrF9thVkjmcgILyHtKye79Tl/aTFFqvkUIh/WLrAWZk8s+CivA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199021)(6486002)(2906002)(31686004)(41300700001)(186003)(31696002)(86362001)(38100700002)(8936002)(8676002)(2616005)(478600001)(26005)(6512007)(6506007)(316002)(83380400001)(4326008)(66946007)(66476007)(66556008)(36756003)(44832011)(450100002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3lBMU00YUF5bW9CUDZWbHNnOE5lWXdKL0swcVNjQkNOU2UwWTljcCtYcVlw?=
 =?utf-8?B?cVNFaklDbWxZams2cDdHVzBvb3B2Tkg5cGxLU0lEZ3NLa3M0b0wyU0ZlcEhH?=
 =?utf-8?B?TUpDbGhpYWlQMVJiSlZQMHh6WWNjTmt6dUQ1cXcxUlFkY0dOZXNlSXUraENX?=
 =?utf-8?B?N2FqZU9oS2JlbC9qUkk0R2E5SkRvZ2l2NzNCVFFTcEF2YlRxWDJHNDl4N2Jm?=
 =?utf-8?B?Qnl1WHpIaVZNSUtZS29xTGJkeXdqMDhnbDIwYjRNOFlaVXlMN0hJNTdTdjBB?=
 =?utf-8?B?bHd4cEVOaFBlQXJXNjZCQThpbTB6SmpRRUNGKzBReDFLWjdsWm01SFdFQzd5?=
 =?utf-8?B?NWYyNnR1eS9CbWRTalFkdTJIbnJaaHhlcWtKU0xvNzEzRHlIS3lraDE3VGhh?=
 =?utf-8?B?TjROV2U3aXFmNzFtWW51cENDZkVNOFQzdnJUU3NPRHVqbWVYNkdjaVNEOG1w?=
 =?utf-8?B?WUpPaFNqVG1vakhXOWF0OWdsK2ZKdlpCYnZsOUg0b0RUMzdTVy9hMk05Zkgr?=
 =?utf-8?B?aUZGNHpDSVVtVWJxVmNLQ2VLWTFqajNvV1Z3NTcveG1KTzlud05McnlWQ3Yr?=
 =?utf-8?B?ckE1UXVQYTVlK1psOXR2WVpjWGc1S08vby9BNnMrcWRMWk5WR3JQbTdjN2t2?=
 =?utf-8?B?MlQxR3V1R1JFNzN5Y21iSlBZTExWS0daTmdEc0dpNUd6VVFnWlJvZnE3QUdR?=
 =?utf-8?B?azE4UVd2MDI4cjFhVXRtT1hHLzdjTnlYcjhFUzdNSVNnNDFuM005OVk2ZVA2?=
 =?utf-8?B?cTlQa0pXVGVGZkV2cmc2MXlWYjhtb0svbUJwYlJXY0hEM1RJb0FUcjdadlpF?=
 =?utf-8?B?bFRKMU5VYWc1ZWZTU3RlRnJGQlQ3blA4alBIeDdEaGJ6SVZ5MVA3K0YzOTI1?=
 =?utf-8?B?Qlh1R2JEYXFmQ2wzQjF1ZitXNVlKTXRLVzNzRWhzMnNLWENhWlN6cjQwYUtx?=
 =?utf-8?B?TkpDNENoTWdTa2RXTUk2R21ncVZhZWQwT2dTblJneWExYVEwc0lsVSs0OVJN?=
 =?utf-8?B?ZCtyUTQ0RnYyRVhlbDFkSVRyTEZVT09aTzJEUXQvcGRKZWVpQ0RCYmFMcG1T?=
 =?utf-8?B?V1FVVEh4NTdITElxTEUyNWhRcFl1VlljWTN3bERrdXIxQUREOWtERWJ2NXAx?=
 =?utf-8?B?T2lHeGhTazRRUUdIQXEzRFhhbk13bk5vaG1YTThKQm9zQ0pxUHU5bk4xNkFM?=
 =?utf-8?B?VjFZWUlCTDU4eU9pOS84MjVyeUJXbkRGSkRuWTNQRzJHZFVwQ0lmMzE3Rzhp?=
 =?utf-8?B?WGcvQTJvc0ZLOXdpZlMrOThlS0w2NHcydFJBNXN0WHhYcnh1ajVtdzUzMmdh?=
 =?utf-8?B?TytIUmdpZC9rU0ZrL1dFUnNvMkQ2bUhKZzBYcGo1RkFMRDNKaGZDdC9oVVp3?=
 =?utf-8?B?VmRjaEFiWklGd1NENFp5YTRTbzI1YkRxek1RRGRSclk1SVF3WlZBWHBHVkZu?=
 =?utf-8?B?MmxKalF2MVFXS3BNdVB3bXVvVkxCdWtQVGRHK1NlUzNjeFJQZTFFQ2NlTUJw?=
 =?utf-8?B?ZnI5b3ZhczNvVmRKcTdsVC9ibGp5eTdXVTdaZ0VPN1NsVkt6d3hZM0RpemlT?=
 =?utf-8?B?cjBLWlM5N3VrUENQa1IzZDNTWVRCVlZ4S0dYK1NpRzgxK2czNnZWdGYwRDlm?=
 =?utf-8?B?N3RuVFc4MFpMY0ZPVXdrSHo5YmVRWWRIekE4NGtvSTRFYmVFaHFuTFpvZkUw?=
 =?utf-8?B?U3gyUldXa2ljblJiOExMMGhWeU54TUxFSk9kU2ZZa0NjdjdvS3pFcHJrWUVT?=
 =?utf-8?B?TWJUVThFSlc4ZVZ3SWp5U0xkN2VUUGMybjZiS0lKMHRzaS9WMmM1UlFLaU9D?=
 =?utf-8?B?d0dsZXp2ZUkvSzVVU2VBK08yOHROVG41cFkyNjIwd3RPdllzUWxYd0NTbE9w?=
 =?utf-8?B?R2ZNcFdrTzVYMFdBNjBoby9ETXZxbEQyaEtsWDFMRURKQXoyeVExT2Q5bjlv?=
 =?utf-8?B?MVZlcGJnUDlNZUNPSFNyT2x3cERrNXF4MXVzYklZeTZVUUd1R0xmVkpyUmQw?=
 =?utf-8?B?NGVseE1JeUdKK09xK2RFMG1GY0JiQmZBT3BCZTFLcHlwMGpBMVNVZ2pJMzRp?=
 =?utf-8?B?VkpDNEVOMXNIcE5mOTVpdkk1VlZ5aWxGeTJ3WEg5Q3BHZkpxa1d5em5USVFD?=
 =?utf-8?Q?/gMikuwss+Z+91EPKlPUeSB43?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a44e28c0-cad9-4332-3103-08db6147d35b
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 19:55:32.1071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Chin4vqjdz5Yre3Xyes2ZX2XJY/MJPbZmmf8T3o8Yvvzs36N96atMABu5KjUK3f8AzOp0MNlt1Imv4RbYs5t8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8183
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
Cc: Jinhuieric.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2023-05-25 um 13:27 schrieb Jonathan Kim:
> Unlike single process debug devices, multi-process debug devices allow
> debug mode setting per-VMID (non-device-global).
>
> Because the HWS manages PASID-VMID mapping, the new MAP_PROCESS API allows
> the KFD to forward the required SPI debug register write requests.
>
> To request a new debug mode setting change, the KFD must be able to
> preempt all queues then remap all queues with these new setting
> requests for MAP_PROCESS to take effect.
>
> Note that by default, trap enablement in non-debug mode must be disabled
> for performance reasons for multi-process debug devices due to setup
> overhead in FW.
>
> v2: spot fixup new kfd_node references
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_debug.h        |  5 ++
>   .../drm/amd/amdkfd/kfd_device_queue_manager.c | 51 +++++++++++++++++++
>   .../drm/amd/amdkfd/kfd_device_queue_manager.h |  3 ++
>   .../drm/amd/amdkfd/kfd_packet_manager_v9.c    | 14 +++++
>   drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  9 ++++
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 ++
>   6 files changed, 87 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> index a8abfe2a0a14..db6d72e7930f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_debug.h
> @@ -29,4 +29,9 @@ int kfd_dbg_trap_disable(struct kfd_process *target);
>   int kfd_dbg_trap_enable(struct kfd_process *target, uint32_t fd,
>   			void __user *runtime_info,
>   			uint32_t *runtime_info_size);
> +static inline bool kfd_dbg_is_per_vmid_supported(struct kfd_node *dev)
> +{
> +	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2);

This needs to be updated to include 9.4.3 as well. Is that coming in a 
different patch? Other than that, this patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> +}
> +
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index c8519adc89ac..badfe1210bc4 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -36,6 +36,7 @@
>   #include "kfd_kernel_queue.h"
>   #include "amdgpu_amdkfd.h"
>   #include "mes_api_def.h"
> +#include "kfd_debug.h"
>   
>   /* Size of the per-pipe EOP queue */
>   #define CIK_HPD_EOP_BYTES_LOG2 11
> @@ -2593,6 +2594,56 @@ int release_debug_trap_vmid(struct device_queue_manager *dqm,
>   	return r;
>   }
>   
> +int debug_lock_and_unmap(struct device_queue_manager *dqm)
> +{
> +	int r;
> +
> +	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> +		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
> +		return -EINVAL;
> +	}
> +
> +	if (!kfd_dbg_is_per_vmid_supported(dqm->dev))
> +		return 0;
> +
> +	dqm_lock(dqm);
> +
> +	r = unmap_queues_cpsch(dqm, KFD_UNMAP_QUEUES_FILTER_ALL_QUEUES, 0, 0, false);
> +	if (r)
> +		dqm_unlock(dqm);
> +
> +	return r;
> +}
> +
> +int debug_map_and_unlock(struct device_queue_manager *dqm)
> +{
> +	int r;
> +
> +	if (dqm->sched_policy == KFD_SCHED_POLICY_NO_HWS) {
> +		pr_err("Unsupported on sched_policy: %i\n", dqm->sched_policy);
> +		return -EINVAL;
> +	}
> +
> +	if (!kfd_dbg_is_per_vmid_supported(dqm->dev))
> +		return 0;
> +
> +	r = map_queues_cpsch(dqm);
> +
> +	dqm_unlock(dqm);
> +
> +	return r;
> +}
> +
> +int debug_refresh_runlist(struct device_queue_manager *dqm)
> +{
> +	int r = debug_lock_and_unmap(dqm);
> +
> +	if (r)
> +		return r;
> +
> +	return debug_map_and_unlock(dqm);
> +}
> +
>   #if defined(CONFIG_DEBUG_FS)
>   
>   static void seq_reg_dump(struct seq_file *m,
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> index bf7aa3f84182..bb75d93712eb 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
> @@ -290,6 +290,9 @@ int reserve_debug_trap_vmid(struct device_queue_manager *dqm,
>   			struct qcm_process_device *qpd);
>   int release_debug_trap_vmid(struct device_queue_manager *dqm,
>   			struct qcm_process_device *qpd);
> +int debug_lock_and_unmap(struct device_queue_manager *dqm);
> +int debug_map_and_unlock(struct device_queue_manager *dqm);
> +int debug_refresh_runlist(struct device_queue_manager *dqm);
>   
>   static inline unsigned int get_sh_mem_bases_32(struct kfd_process_device *pdd)
>   {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> index 0fe73dbd28af..29a2d0499b67 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c
> @@ -88,6 +88,10 @@ static int pm_map_process_aldebaran(struct packet_manager *pm,
>   {
>   	struct pm4_mes_map_process_aldebaran *packet;
>   	uint64_t vm_page_table_base_addr = qpd->page_table_base;
> +	struct kfd_dev *kfd = pm->dqm->dev->kfd;
> +	struct kfd_process_device *pdd =
> +			container_of(qpd, struct kfd_process_device, qpd);
> +	int i;
>   
>   	packet = (struct pm4_mes_map_process_aldebaran *)buffer;
>   	memset(buffer, 0, sizeof(struct pm4_mes_map_process_aldebaran));
> @@ -102,6 +106,16 @@ static int pm_map_process_aldebaran(struct packet_manager *pm,
>   	packet->bitfields14.num_oac = qpd->num_oac;
>   	packet->bitfields14.sdma_enable = 1;
>   	packet->bitfields14.num_queues = (qpd->is_debug) ? 0 : qpd->queue_count;
> +	packet->spi_gdbg_per_vmid_cntl = pdd->spi_dbg_override |
> +						pdd->spi_dbg_launch_mode;
> +
> +	if (pdd->process->debug_trap_enabled) {
> +		for (i = 0; i < kfd->device_info.num_of_watch_points; i++)
> +			packet->tcp_watch_cntl[i] = pdd->watch_points[i];
> +
> +		packet->bitfields2.single_memops =
> +				!!(pdd->process->dbg_flags & KFD_DBG_TRAP_FLAG_SINGLE_MEM_OP);
> +	}
>   
>   	packet->sh_mem_config = qpd->sh_mem_config;
>   	packet->sh_mem_bases = qpd->sh_mem_bases;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 4c912b7735b5..8fca7175daab 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -816,6 +816,12 @@ struct kfd_process_device {
>   	uint64_t faults;
>   	uint64_t page_in;
>   	uint64_t page_out;
> +
> +	/* Tracks debug per-vmid request settings */
> +	uint32_t spi_dbg_override;
> +	uint32_t spi_dbg_launch_mode;
> +	uint32_t watch_points[4];
> +
>   	/*
>   	 * If this process has been checkpointed before, then the user
>   	 * application will use the original gpu_id on the
> @@ -952,6 +958,9 @@ struct kfd_process {
>   
>   	bool xnack_enabled;
>   
> +	/* Tracks debug per-vmid request for debug flags */
> +	bool dbg_flags;
> +
>   	atomic_t poison;
>   	/* Queues are in paused stated because we are in the process of doing a CRIU checkpoint */
>   	bool queues_paused;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index d63a764dafb9..0281f79fcd7d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1612,6 +1612,11 @@ struct kfd_process_device *kfd_create_process_device_data(struct kfd_node *dev,
>   	}
>   
>   	p->pdds[p->n_pdds++] = pdd;
> +	if (kfd_dbg_is_per_vmid_supported(pdd->dev))
> +		pdd->spi_dbg_override = pdd->dev->kfd2kgd->disable_debug_trap(
> +							pdd->dev->adev,
> +							false,
> +							0);
>   
>   	/* Init idr used for memory handle translation */
>   	idr_init(&pdd->alloc_idr);
