Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEC65AD172
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 13:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D12C10E30C;
	Mon,  5 Sep 2022 11:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C75410E30C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 11:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dufIg7yTVf5qMs5d56ITK4ilMRDeaMu+vpkcoJl/zuMSFwEEU+/EnZyWURhTkBPgX2C3sfvE9AKpBdyZbcEzqR1+S2otn0zl9cxR+NKYD/dwVKYpFQJmqirQUeIjIH9lfhYv5G7eNxvUW9Cre6kKk2oA7ILTSQKGzzJLXZzWBchu3q+c0NSuhiZgdpYiNKbGkploirtIvz3KTjFscGAnQZZC61kx5iiMooTb6wb0JfaSTraPcCRz8UGKnyYR8uDqphCD8ptEff4us36doeVqzl6cJxV8Sj/aUIyrNfGPOjMUQiwmL7ZJrOspviK9Z/I3cWKQCAq/tI0229baFLICaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/sHtvaYp8vEa4OFxgeaLeKsKo5bdU6Uzd7GhkxQb3NM=;
 b=oKk9bG3xvDplxsxb4lnEObcDIoL7Xo+pd0evBmt1bDSAqbbEtb5hRa90NdSA1SQ6zFjYaTOnFI8q8OgrxQs1Q9BPBBHLiFZ4f8nPQQQuIWgNXmakwnE22Bwscw1/LJiY7Sg8XORgf2Mv/FZR1rTKOfmzR9Hz64QixKwMii0LXjLwUqDmWoXuT9/tXiyrMosot9+4KuUaRUXwqO4ahYODHmbRg5uIMhzlPUnd4TTqNFXJ2ADuPgapJHgc8IeZrXW46CqrR5M7vTZGhOAUtvCebr+XHVA6s1c+ER0M14aan4B83RG+USL9czu/QmAsISEGBoAiBeU4mmfm5AwPdCnaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/sHtvaYp8vEa4OFxgeaLeKsKo5bdU6Uzd7GhkxQb3NM=;
 b=ktHmjEmgjINr/V2V2/L3s1PWoJz4OARJmqVU1y56GHam/0DNU3m5tFjI/lTzgNLaaQXgHce0M/KjtWp+6RoYX8ObJEtE4SQqiDeLeHXRe+WYvpScrCyVwdNB8HdXFO+szZbh0f7pIgbKMwy7JBmHncmiSyBmI6VHF8P5U3OpE4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6335.namprd12.prod.outlook.com (2603:10b6:8:94::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Mon, 5 Sep
 2022 11:21:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 11:21:14 +0000
Message-ID: <0038fcff-35f1-87e3-aa26-cdd104a13628@amd.com>
Date: Mon, 5 Sep 2022 13:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] dma-buf: Check status of enable-signaling bit on debug
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220905105653.13670-1-Arvind.Yadav@amd.com>
 <20220905105653.13670-2-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220905105653.13670-2-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d376a561-bd9e-4ac6-9d4b-08da8f30be5a
X-MS-TrafficTypeDiagnostic: DS7PR12MB6335:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ycagU7L15RZ01gbXQJ0cEAQ3TSa5eOXJAn0zT1TvtV/jRsju3Nfiz5tr1B54kFn16TT/mVKhdVtvALFD9+JZMP8amO2myRxhDrBEmwRKwFRsmGwRh4y08tkLjPi8dYPlSzLdV/WxG8rSwzLUhfDSGxkw7tiXEftYEFk+Q1Eh3itF/wkYnG9O3FBsEYWUO79pda7+GEvh7EfqLEYFJLroVv7TA97eyyvLXmq++wUBJFkIbnOT5lPJ/K6yQDNyo0Ew82c6HHNQani3mcRLms7bYEGrXfKnRwemSAUFhr2feaM5lZOqlDTtW1IRfJ5EdCa7J+uq0OF40DEHf2fTOoL6oCukQoxpkNgjDwe2sT60/9rD3a1OUA2qKUbWBqclVf3JCEsDKr9rCTwxjTPc0kideJeyqoJVS9D903p8s2u149ZKYRXWukVVnnB/J6W8PeJPPfEQAFNp4elIAagJnL92GqqRyUCsdfJxIQkzJpc6XkjfNCxnw+/DKHw6RtRu2x8+7lxj8bua7wWgS8aSERyEhZ95YuXspsvPke9zqJs8EulgC/dWVEBYAbOIMXayCObvSufeJznNtZ3vPqkccTQu69snO9iMzv3860fO3IOuWTrc98MequzWQg0LE5TO5oQS+mckl+tF9mba0v1gaEYiILI/QLfrLVOqiF4+lcRA9JlFTO7IfLfyxU0fNht6wDVct0Ar+ggL/R/DYJOcmnbEVeelZvOsRcXL4rmQtUvCPc0NTkBHkzPHN+30M81ri8SlctxIWZxycydcj01b/wFdb5WV7Vc9aiQwQaFj3ZRg3foiXjCevoO9Gvr3foTzrjE+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(6512007)(2616005)(186003)(5660300002)(26005)(8936002)(41300700001)(2906002)(31696002)(36756003)(86362001)(31686004)(6506007)(6486002)(6666004)(478600001)(921005)(316002)(66476007)(8676002)(66946007)(38100700002)(66556008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXZ4NnAvZnVaR0U3aTI5R0JVNUJoa0IyVmRjaHc3UW1kVlAvYkJRNWR5L0VG?=
 =?utf-8?B?UEduZ04zSi93dFoyc1BqSVpQY1AvYjFaQXhoWFZLeWtVbjlnT25vTitMdUFj?=
 =?utf-8?B?VlNZOTVld040SjJyNm9DMHJSd25RdzIwSm43dythSVZlcWpTdURQRjlXWlI3?=
 =?utf-8?B?dnowb0dFcTdOd1ZPOEFPVWxpZnptMDd2RGJJQTlwdUF5NDc5SUpCTDNEQVcz?=
 =?utf-8?B?Y1YxcW1ScWlPNWw4TGJsOEI4M3NnK1NYRVMyUW45L3VYTDl0VGRQNUlNN1FO?=
 =?utf-8?B?TzlWZ3ZIaHJPZUZIOVkvcElPRGJqZmliQm9DY0ZKY2ptZS9CVUVkejVGcGI5?=
 =?utf-8?B?WGs3NFF1YTU4T0FiaStnU1JtL3IrNGRUdU8vSkRLRkhzM0ZLNDVQTnV2WFp0?=
 =?utf-8?B?WlZ5dnpiaWF5WW40Sm0rZmxya2ZtK1hpcmQ1UnlRaXM5S2pKSjNrSVFkVVFI?=
 =?utf-8?B?YlZRdE5OakQ1eXJaMzRzR3g2S1owQ241eHg2NHg1aTNhNG1HM1JzOENUdGRw?=
 =?utf-8?B?Ti82eWFHNjRPbzFHcWNEVW5JU0J3OCtVaGFGVVZId21SL3gvRUdBSUs5dUpT?=
 =?utf-8?B?Z0dTVngzZXdrQjZiMlR6Snk3MDIvUVorZXNzZmlOWFJnMiswdXFScG02NVhx?=
 =?utf-8?B?NjlpQk5JNXVXVGdWNjBFMnlYbjlOcExLanJZSEZkQmIvRk1CRUxnT1duZCtT?=
 =?utf-8?B?YnF2ZFlNYzVBdmcxZUF5NkE1bGpReXdKZTBDcFVsMHR5Q0xUL2J3VlNsblRn?=
 =?utf-8?B?a3gxSzVXRkEwaksyK3N4OVpJc0gweFZvSHU5clllRjBaOVp2Z0FHV1kyYzJP?=
 =?utf-8?B?M2sxbnhXdmhFVFpOYVRMcDBmV29zR2YwQlNpSmhBeVNpNi9tVUdVSG1hNGRE?=
 =?utf-8?B?ZjJnVC8vNCtHd3hmRDRiajc3TUliVU1peUMxb3Q2SUIxTE5KMnozWnhmdEdk?=
 =?utf-8?B?NFkvVEJMZS9WV2I3WFJFTUxMS3l4cEZNaGFQQVZFNjQ2MmpzbTIrRm11cnpn?=
 =?utf-8?B?dVNPNkZHTmd0R1lsczZSUm5sK1VGOS9tTWlabDZGSlViRU9TdFF6S2ozR2h3?=
 =?utf-8?B?a1FPaEQ1blZCWVdxam02SDdUSys5NGFmeGdaTDRTd21WZG1RdzNOcEVKSEU3?=
 =?utf-8?B?MmhIRlMyTUJLZHpEU0dqLy9QQVVXS0dPa3kxVHVGUEQ4Rm5ZT2ZQNkNXTmVM?=
 =?utf-8?B?dGgrSHRJUCs5S2lvZzhKVzNnTm43eGl4aHh4QXdHVEhZSlgwMENkN2svNFZp?=
 =?utf-8?B?a1BaRkw2QUpTb1ZvM0k4Q2s5MVltYUszSkgzNXh3UmZZL1FmRTFvNFo5QjlS?=
 =?utf-8?B?MWFKdlBCVGt6MkJvRGN5Y3JYdVd4VkNoc29sdUhrUFZkbFR5MTlpZTF4MFJx?=
 =?utf-8?B?T2E3UXJFTm9yRXZDQXYrdmdFY3RKMHNMVzhwU0w3eUdGRmJmVi9KZmc1Mmdt?=
 =?utf-8?B?dmdEYjBaZnpreHBKVTNNenVsUVA4enpEckpqWm5JTGN6SFpLejBIRENld2lM?=
 =?utf-8?B?RmhRemFRbEpQT1FlMEtxYzhHYkN6cEFBUmI5anE2alo0RUtMbWV2b1plcWFW?=
 =?utf-8?B?OHlJVnBqVUN5SHh2UDQ2RWptNWNzb2Z6UXFhaFZpMUYvTkIvdnRuUi9IWWJK?=
 =?utf-8?B?RXNSVTdYeHJlZFMvWHFOK2k0MW5DNHlkeXE1TGl4V250VTNEZTBaeW1BQ1Zt?=
 =?utf-8?B?cVZLbWVVWGUwVTlTcTd1ZVV3N3lDc0pmSXVyL1BzOWtQck9WMkE4QzRYTExv?=
 =?utf-8?B?WFMxdEc0alNHZm1qS3FWdC81SE5WQ21yUVh4Y2MvRHIrUzFVQW4zRk0rTExD?=
 =?utf-8?B?QVZxWkRBME5wci95VmRFQUNYOUdMRktvUXVxemRZb1VlNko2SmlWMGVmZWg0?=
 =?utf-8?B?ZmNtaHVaMjdWYWxwRitwU1FWdkszWXRtQ29qK08vVnFLOE0xWjVJSUd2UWdn?=
 =?utf-8?B?Wm9qZkpHZHl1RlV4MkRhbVNaVUJEK2R6b2J6eXJOZUNQS29TeC9wU0ZqQVhS?=
 =?utf-8?B?Vk43aGtTS1dyMWY1L3RWKzc1eldzbi9Ra05yL3lqcUJLcEo4THljaWtGMlZu?=
 =?utf-8?B?bVBDbVZJYjFPYStFSTNYaVUyWWhPQjkvVGxOR0xLbWhiQVliS3Jnb0JoY2pl?=
 =?utf-8?Q?KngeORvbQUHhyazSUH+Qa9xy8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d376a561-bd9e-4ac6-9d4b-08da8f30be5a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 11:21:14.3501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uic2kGThekTf5aYVkmMyYcxgiD9rz3kjfATW7Nntt3zuD3YpOsg2Lxp09KAiBKn+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6335
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

Am 05.09.22 um 12:56 schrieb Arvind Yadav:
> The core DMA-buf framework needs to enable signaling
> before the fence is signaled. The core DMA-buf framework
> can forget to enable signaling before the fence is signaled.
> To avoid this scenario on the debug kernel, check the
> DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT status bit before checking
> the signaling bit status to confirm that enable_signaling
> is enabled.

You might want to put this patch at the end of the series to avoid 
breaking the kernel in between.

>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   include/linux/dma-fence.h | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 775cdc0b4f24..60c0e935c0b5 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -428,6 +428,11 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>   static inline bool
>   dma_fence_is_signaled(struct dma_fence *fence)
>   {
> +#ifdef CONFIG_DEBUG_FS

CONFIG_DEBUG_FS is certainly wrong, probably better to check for 
CONFIG_DEBUG_WW_MUTEX_SLOWPATH here.

Apart from that looks good to me,
Christian.

> +	if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
> +		return false;
> +#endif
> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   

