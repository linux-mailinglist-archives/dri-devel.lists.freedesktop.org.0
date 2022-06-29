Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C44B55F75C
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 08:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817F012AFAD;
	Wed, 29 Jun 2022 06:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B0212AF9A;
 Wed, 29 Jun 2022 06:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1ezD7kplxNOii2kyttqIm/1aGyKSzIzMf6khpDXCaCu+cwjhi7cG3EOCw0jyMfBJAA/1U/1eRl4udyNjEzlecdZgSKs5uwk64BZIjYrf1VniIpywwmxwKh8wZPvwG28rgT15wyusJXgLtBOO9kovpVlpHCD1g2oMBe/Q2UstVaZ2cyQhXDrTV/8VdiXGEaUUzN9fqgyrX18i+JXJbYzOQOrFz7+jHggz9m7CXVnA3H7s7OScLvUBrQiP9mhLOfW2wQx3NQF4+naHm/S5rV0KT3cLvWhHz4GNtEOAEJVtrOmiUa6VO/FxHrtocDvJe+N/bLOW2RjApREpK5EJWPfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zrMfGKwy3qlZCtCl+BZueqDXTX9Dxm6NHfBXmC4FX4=;
 b=OaNm8xubJYvMz4REYTT5oRd8AHK/zAO4Nq3IBJA+/kiltiBetP2Tjb7oZAdVaPVgIfB6R9bhHz9q+kNJMRggXa3+vNQe60OhVg7a6DMuoAKn3plwahmqA3IxsYcrwJW4dI+sJGdC9LjnJG3FVq0Nx8YVOAzvzMPwPCxhkkKty29voQw+2p65heexCoddy5z2wtAechyEFMtwlpZT+y8Y8dix7frmnSAInD9MxkaJLJMJNVnBw/wQI+KqZVBVwHXQ7SiWsQeC7u9qnMpaKe0BkxQf6Jw7liUYWxb0acYWC/c3+aLMKUliYbjQwNF3KYjz2qVnqJhyhhLkeQ6JuFxE1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zrMfGKwy3qlZCtCl+BZueqDXTX9Dxm6NHfBXmC4FX4=;
 b=lROO1poR6i9+fSbTDWxmiZ/Xjvl04PeKoGi0XkquRQKhaZkF5zv/S84sDCfMypM2OQXJVVOwv6/wYzUkRFEEQuoym5qXB8bYYK4a0BmbyWSOGc4vzDQYeLZ2JZeRJrsPw6wZIBWR5JkdC2iaIsS8Pb1/EEpQfDOn1NMjSrURDN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Wed, 29 Jun
 2022 06:57:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 06:57:46 +0000
Message-ID: <0c6e33b7-9af1-842e-d1e6-38d685112848@amd.com>
Date: Wed, 29 Jun 2022 08:57:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/i915: Remove __dma_fence_is_chain()
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220628233512.439555-1-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220628233512.439555-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bfb5701-068f-44a6-b0f5-08da599caba1
X-MS-TrafficTypeDiagnostic: DS7PR12MB5840:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IGBGH5xIHnO0MDQ7z/R/UzgNCwpUXYGCTXg7+xEjXjEvoXqdjcK9Llx/LndhRlQdXck+PeVlFD8OmJYQQ679axSFjT8NL43TqVTo/t/GuOeXPHlLffMTtfpP3123w/+UEEbjIOHThn5tS3YVptMcSzuSyMPmmt79JZ8cZE0qeGnAKmc7049i5EldWWAeVnLFhpcv6OMmqLYSEQsmQxrEBBXZwrJr3xaSXX95pdvk3CreSR5wog+vp3m/DOI8sab1xXXkZqhczqYlUuFALO/zdyzb1F41GvSfeb6bEOrRXwtQN7oicbujmW1CWsdH198NfbaczUP4tLzYRlNzKEIp7qxfTOrnChMj6wzjl8dCeL0TiPa7NJkOaEFjE6RsZ5XDhoLmiPaAzTWa9KMDnemnngmwt9tci/maLI65+qo5p2Lm9zPN6uMkPAzrB6NHddzuBatdtKn81azmff7BBkU8u/Ffxlgb061LUnDYcPaSetPYPQbeqBNJdv3+wJhCn+yffnPtn8KoGfrIYcNFEm4eG5SBY8Ocmm4UqFgqYInAGHREEI8H0K9C2UJ80w4PXbl9zuq/AiLOOMEqdyxPr8u40OYOJR3Nm8enQD+MaJVuVRQPCcJHrt61reyeqwszEKRKh0kcwBaVSl3VRIi1zX12jYthDWxKHJYszbz5ge2na74Jt0M2npuOaojPd/qwz84KaLgfVr20zMgOnEkHl8MQyeziM1ceTE76UBt2oUMONtSBPYzt5/svNQEMs527QFo+gfsqPTnQbmaZY8lo8hX+kBKE0EVvmCRKA0zubdvjEqAPxdNp3s3FijSMjn9eZBqm51PpX8ZTLjEzpLc3pPcHIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(36756003)(2906002)(7416002)(86362001)(66556008)(316002)(6666004)(478600001)(31686004)(54906003)(31696002)(6506007)(6512007)(38100700002)(6486002)(4326008)(66476007)(8676002)(66946007)(83380400001)(2616005)(186003)(41300700001)(5660300002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTJLTlVqZDJ1ZFRLa0hKcFFKbHFXZDNnbVF2TlJ4Q2ZOZEpRNUxvc0IzUG9z?=
 =?utf-8?B?TnpBa1NRREV1NElFMVlkV1dFdHR1WGpBQTF5d01vV2daK0ZBd3JlT21VUVhD?=
 =?utf-8?B?YXQ5YS9ISlBhNC8waThFS0VSNFQrNG9sTDAxYldxSk5UaUsvck9Da29IUWxy?=
 =?utf-8?B?Y21YWDRvT1VRdVVvL2pkS2lRVkJqcjRLKzBzUjR0dXgzUVVKd2pNcXFOL2J5?=
 =?utf-8?B?cEdGb2RzbGEzSFl5bERGTCtXaVVJSDludURaT2Z5Zm5FYnlQWnVoSmFxSzNr?=
 =?utf-8?B?SldsK2JSa251OTB6UUpuODdXM1NRVTRldVE2M2MrS2hPSUF1cWhHNGZpaC9z?=
 =?utf-8?B?dGtZRXREWGx3b1EyL3E0RnBrQ0o2bWFHa05lY09RdmxiMm9lVW5JZnVteWJq?=
 =?utf-8?B?MzJSUWRqRTFIUFN5L1RUS2E0QkY1c0pmeHVENEtmYkZ1QkxHemhYZEJNaWhk?=
 =?utf-8?B?d2t6MjNRMlB5TWJFN2poMTUvbmVsRHhTV1FPaEcxb0c4MXRuTktUOFZBT2F5?=
 =?utf-8?B?ZGgxTjR6Q0lQNE9HUHI0L3FkSFh2TGpvamN2dnlwM1NEd0hHTi9KZ2NicTJl?=
 =?utf-8?B?RkJHYzZqMDJMeTh1bnJPZ05YODM0WWFOQ3VIMXlYZkkzL2ZZdm5RS0ZNNkRt?=
 =?utf-8?B?aXZuYStlVjY1WGpadDRGUGpqOE9FR2ZORlhaejd3ZnhvdlozWDdQT3kxVnVH?=
 =?utf-8?B?YXlJUnFrTExlY3VGQjJnSklSbEJDS2h2ZnA0UXIrRVJHL29TZGc3WWQybi9v?=
 =?utf-8?B?U2locS9GUkY1cWN6bkVmQUsyUXVVOFBhMlNyRDdkMGxrRWlhdTF2V0ZvK0cy?=
 =?utf-8?B?QXVjM1E5bloyVk5JTnF3VUkyQmwyQjJZc1ZqMnRsU21PRU5zYllPVkdkR3hH?=
 =?utf-8?B?Q0lYWTZuNzg3bENhZk9EUFNjdFQyeVhvUUJhL1RPejd5aUlDaWVFek56aFpY?=
 =?utf-8?B?aXpDRWdYQTJXQUZwdzF3M2hGOElyTVY0eG1CK0hBb3RKUlArQVhubGkxb2xZ?=
 =?utf-8?B?RVRlN2loRkxabTNsLzFEQkxGL256Z0tISVBtMk9WNnc1eGQvUkRIaFVuc0JJ?=
 =?utf-8?B?OTBhQ1VUZjhyWjMyTnhkVFZuaVZLR3UrWmY0WTlqanc1MjhXRGN2VVU4eGo5?=
 =?utf-8?B?QkhaNUhYc2RDNXRuTFE4cHRqb3NhRkZiMStpZ0tXb3hiOU5NdTZnWXpoNmMr?=
 =?utf-8?B?cHo1MHBWajRnOW1HUUo5a0JPRkpKb2J2NGtnRUpKMEdVNkIxRDAydmFNcGNQ?=
 =?utf-8?B?UEl2ZFdVOG45OWhoNlduR3djeFdQbmU2SGlMSnJZZ3I5RlVwZnAvai9hT3Na?=
 =?utf-8?B?SEFQYUo0cnpSSjB4bFVSUXNNTTVBcG1qQnV5b1N3NWxqZ0hLMkFmV2pxZno3?=
 =?utf-8?B?K1NXR0QxNVdGbVJwa0hVMUUyMWp3M21FaVpJS0h2Mm5lSzBJNjFITkhPL3hq?=
 =?utf-8?B?WXo0MWJCME50WDcvSFcvY2xnbUgrdFJnRncyUEVoQWt4TFdpQkFuM3E2VHpN?=
 =?utf-8?B?MXRTbWtNdWg1Ui95cG5tblQ3aU9zWVdIWTlsRncrWGVVczJORUoydlp3a2lG?=
 =?utf-8?B?Y3lKaWFvR0ZLSG9yWGl2ZVRSeGo0NVpYdlUvMEZKNG1EV2tOVmNndG9YVnNZ?=
 =?utf-8?B?cFlXR3ppVTVvV3BGblpiT3lOcmR5RG1RQmtNMFhuREdVaTZha2F6bTdDTTk2?=
 =?utf-8?B?MzlFUmFhWFp2TjZMT1M5bVUzMHhCK21ldStzUUQrSEdRUFdreEdPcEhza1BB?=
 =?utf-8?B?MDdWV0gySStKZyt6TVUwQmJHMjdnWHBFd3JycEhUaWhQWmZPTEJESVY1NTdN?=
 =?utf-8?B?N0x0STZjNmZ5b09LckJwRmFzeU1PQm03MjBZTGIvZk1TZ3J2ZU41bndDbzBu?=
 =?utf-8?B?amlDRVprTmYxUW5Ma255bGVaVUFkbDZlalBRSlkvZ01UbGdIeENQdWJGRkxq?=
 =?utf-8?B?TGREcXF3TmVWdGp4aHNraFlaQU82N05oaDJCMVV5clFnL1VJVWV2RVpKNU5Z?=
 =?utf-8?B?YVhRYVVWRXZFejVpZWJBQjN3VlhZRjRVVis5YVNNeEFEcXdYQWN1Tzl3NzRR?=
 =?utf-8?B?NDdNamtwUkl4ZHVoNGtDbUwwK094b1AyZnhZZ0ViL1hyaGc3VzV4SXJsMFY2?=
 =?utf-8?B?UWROaUNocjhhaDcvUzM4UTU0R0RkdzN1UmQvbFNzbGRPcTJlV0RSc2JsUGhF?=
 =?utf-8?Q?6CbNFdNffL4NXJXksDhSawaJ2YY8QhPRpSvsZmdBvBFL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfb5701-068f-44a6-b0f5-08da599caba1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 06:57:45.8585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GJuX+CSrhu45rn/M2MLDBeLwN/MbDwTSSJvhZ+EDlKaivUgPxqDNUsoKhH1haJ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.06.22 um 01:35 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> drive-by cleanup
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

We should probably completely remove that dependency and rather use 
dma_fence_unwrap instead.

But that's probably for another patch Reviewed-by: Christian König 
<christian.koenig@amd.com>.

Christian.


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 319936f91ac5..667841780514 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -73,11 +73,6 @@ static void fence_set_priority(struct dma_fence *fence,
>   	rcu_read_unlock();
>   }
>   
> -static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
> -{
> -	return fence->ops == &dma_fence_chain_ops;
> -}
> -
>   void i915_gem_fence_wait_priority(struct dma_fence *fence,
>   				  const struct i915_sched_attr *attr)
>   {
> @@ -93,7 +88,7 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
>   
>   		for (i = 0; i < array->num_fences; i++)
>   			fence_set_priority(array->fences[i], attr);
> -	} else if (__dma_fence_is_chain(fence)) {
> +	} else if (dma_fence_is_chain(fence)) {
>   		struct dma_fence *iter;
>   
>   		/* The chain is ordered; if we boost the last, we boost all */

