Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F31473A36D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:44:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAAE10E56B;
	Thu, 22 Jun 2023 14:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C8B10E56B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 14:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/w+QtgSI1vsEe/ZsNB2yGkWKbnUMsYCwf6Bd+o9gVt8urXg3e1JjDvKJQiAJN8pu+zJarxduA309Bf20+jGo5SBl6HoFfpdrq3v0HIi5JDTWT5TIUUYQlLJse2nBslKMjmko7chg4PPLTWO6CLwdfmHMUaqFh6MIvgM9hzN/lki76qu7If+SoKaB9wpv9/ZDOowNKeH9rqkHrO8D76QDZc8N+aysQcav4Kqxp4udd5XXrLwaKCXEm4iLyc9jDliKGZe0mIJs0LHiSHJX+kr/7KmVwZgkbuM4gKg1+3yXT2FGEhngRWrcvtLf1JtTDNkOwrWBLyXshD4+wEeePX8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zO8nuwFGC3Nw/FWVXTRTMqLN48QRoT7KWrBiTi6xlpI=;
 b=M7ukW2J6WC48sbJDWPJyOa0/7/4a6IgkVXBTCbdexJcHBDMIU7EwsFnJvMZ9D6mnp3H2pdsCIg21dq3U8hIgCY5+gbbG+rGgIvEHuyIKLdzqRfK+1rmhkug+MgXnWXdzhJBqvzFfr5Rr18lB2yZW50LQSwRlHORpPhA4Hrn78+PCWPbpBdKNIOJahaItfeikAvUF005ak99zATb7vpwAutL1pPrj7H/L6fTzfJmc4bKzEYnbzCt7Qj68yIWaK1nivOaY/GNtQwNPxr6Vhr4vCEvj646G84M3Z66kMRqYCAcq0B8SLnWAhOd3d+8ZHXQlKTFzAwWsHs/pBDiw1gdiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zO8nuwFGC3Nw/FWVXTRTMqLN48QRoT7KWrBiTi6xlpI=;
 b=MlGDkewSLKBmr0xdqfTwxdxJVUyH91G2kgqbfqo/1+4dXyNKzYA/r5zXHNaUb8bnAO6zdTC1r8ieLwT7gBQp6nBp1YTnrsu/jmAMXMw804JRAH0yG6xJYPVw9mTAICv8OIhzhrKKtJZbN7RbIXteay2hd/A5Y01VB6Tstr2CQ80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4907.namprd12.prod.outlook.com (2603:10b6:610:68::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:44:33 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 14:44:33 +0000
Message-ID: <79e0e550-962a-5f08-609b-123f4de9d433@amd.com>
Date: Thu, 22 Jun 2023 16:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, Alex Deucher
 <Alexander.Deucher@amd.com>, "Tuikov, Luben" <Luben.Tuikov@amd.com>
References: <20230621073204.28459-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230621073204.28459-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0233.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: b4830a60-ae14-480c-7472-08db732f313d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GPEw9v6Hryjmx9SR/9jRsh38nwhXaX1PYX/i55sFZ4KPRzjaFyihYI9739kO5YWRTXLo8NNTMpQkl/Je08y/pMO7CEbzZQ6Ps3/zLvrxwkqoK0NFyPVaPNqXgzxtWQipWCI88RYdTO8isYhVXcuA17Zn4DryUxWpPbcQ592jNAz0BFiDqG8KLA65J+joxSJE5ZJ3WDH5EviczQ4D47AFw4FlFFh5sTZtLe9VU3XaLUM7fYQm8I/WKZ/4HH4lZ7Xf0hbGpKRmslh93jFIeO69kv0wfr77w37B7VPI9VlFmHOiJoJvNkaX3PGdqdgiN7Q4quayxE7NL8BICry6vh9clrT++xSZ6uQfwr3ipgnauHnYm++7zXttNaR6Fn4dd9rDcE+82bywRszvp9M2hlUbDe5udiW3j9shqh2Ad6UIawhSh0M9tr8PvThl5fiHg7/EAAB63EgCcxebIq3WqWNYDl+6kAz7jfKKR/82CqZ+gcyz31uUYVN8wBJoU84ikMWFCAi5uVMdXe71itOUHKIAwJsPYPI8MtPcZKnSdbVlS2SGhl39ngBrgELM5LOW2T2Y4VdMMjt1utitHAJSy4WzPTXEphV0hf2Lq1+G7HhEYIxawdCzw5aW3No0UeP1oys4ccYkCfEt8KBc2RBNayNN9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(31696002)(86362001)(38100700002)(8676002)(41300700001)(8936002)(66946007)(66476007)(66556008)(316002)(2616005)(83380400001)(5660300002)(66574015)(6486002)(6506007)(478600001)(6666004)(6512007)(6636002)(4326008)(186003)(110136005)(2906002)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnRHTk5SL2xGZENxa2xLRzRDV2x3ZDNleWZ4ZlVIZmtzVk5UWFdlTzdPTFls?=
 =?utf-8?B?NXF2dDVCVlQxaENWbVV5cU9QSFlpK011ZkdqQTZLbk95dWxSaExtaGRsRGhu?=
 =?utf-8?B?TXEvd3NreEVqaVRTS3pYbnltc3pUOXgxam02NnJ0TUZ1enVoRGowMmZlZGJG?=
 =?utf-8?B?c2pJY2dKektYWHdsOWJKYkY3RlRIS01UbUIyMGFuWmdCbjRYcEJ6NUNqbVdj?=
 =?utf-8?B?b0k5bEhlK1M2NEw3MEgxSUw2UmM1UzRUQy93T3RDRzNvR291Tmlaa3hXVE5F?=
 =?utf-8?B?TU9IZVJWYmhFUENyTjBQL01YWFhBbldOa3lKNHhkVnR5S2JITlAramp0RTdn?=
 =?utf-8?B?c2lQK01XRWxIQm9udk9iVlplT0hhRTZtcjVlU2ZOK25rQWRTeEZJMW00bERZ?=
 =?utf-8?B?S2VkaUJ2SjZoMGQzdzR1Q0E0Rm5IQlVzQlptVlZ1bU1QZEh2d3FHY25lNjVa?=
 =?utf-8?B?QzlMemF4VG84WVJWVkdTUUVSMTlqZ2xEVkFKWkRwQjNMbTVpdis1dENrMVQr?=
 =?utf-8?B?VHcvQS9zeDNHTGZJcmd2Z0h2RGRyQldVakNRNTZuWitlWElJcVhaNEljbTZo?=
 =?utf-8?B?MVg1SDN3dTR2aUNsbDY2bCtZa2JIY1gxNE94bmtjcEFzMTNzZ2JmNU1rYjla?=
 =?utf-8?B?TUR1YmUrZ2JJMGtzd1hGRjRHOUdteUp3U1BFeXd1MTVaWStrNkhhcVo1VVpi?=
 =?utf-8?B?RVJyNlRyOVBTZkl2SkNKVHpaZm5ZTEZ6SUZVWGRoWkZTVUtPZXRVaVUyOTVE?=
 =?utf-8?B?cnJiQXNvbm1IZ2xvRVBtREIxVlVWSUQ0bVBYOVlBMUt3UCtpMGNGVVhqVWh5?=
 =?utf-8?B?SWFqS0xWMmxJeEZlUEVIY0NScEFLQ2Z1NW9pTVA4RFVDOFF4OGhYYURkMktz?=
 =?utf-8?B?Qm5FZFdXMllXM3JMbllGMkZya3lrRUVtV3F6WFhnelZ5TWI2dlF1ck1OaU14?=
 =?utf-8?B?cm1WOTU4Ulk5K2E2NG8zeFJjMklWWERZTXJPYzZnMFptOStmemtWSk1iNWwy?=
 =?utf-8?B?Q1V4c09IVTBCQ3dzdFJLei9kK2x0WjBiSlpOSGsxSTNYVEdNSUwzenlWSFV0?=
 =?utf-8?B?RHlLRjF2VGhOMFp1VEdzclZMckErU05KODltSllWRWFod1VVd3JLN3FVamV1?=
 =?utf-8?B?VWdjVU9pYTkvemlJUVJQSGIzS0VoOFdTZmwyc0pyZzFjL2Q0SDFyQ2NvaUhH?=
 =?utf-8?B?cXBKMmtNenZFNkFMYUVTWHNCczA2RmUvTko3ZmJ3RVR5eXB4aUdXZEhBYzNj?=
 =?utf-8?B?bCs4SHY1elpnUWJxTlY0a2tlVFNGY2pWbHhRNEhVeVBVZjN2VE8wOXYvZzhC?=
 =?utf-8?B?aTdjY3lQbXJPSmNEVlViQWlFSFZkSUZ4MGt5MVFOSmN5SGhmekdJTzNBMWtG?=
 =?utf-8?B?S1NQMmN4ejNKVzNvK0RNaTQ2N0dBeVZweWhza0wwVVVneEtEb3ZHNTNjdFph?=
 =?utf-8?B?TGc4YVU2ZHVjQThrdGFFckZvZU5yZFNiaENvZU5OQnVZcFJZS2hlc244bnRv?=
 =?utf-8?B?bTVHNkNXeTZOOXRzUVMwcW0xdm1UYlBEOEZPMG9WbGRYR3E1OXozZWZQSFJT?=
 =?utf-8?B?U2t4K0FyT3Jsd3FaSC9PbFVDWGpudGp4K1F3VEQ5d29hNmI0U3JydG81RkFB?=
 =?utf-8?B?dkhvV3hnOFFnOXZUYmZIa0ZMT3F3a1BONHU1elNiZ0h1T25Xd1N0U2p6M1F3?=
 =?utf-8?B?RGpieFJrTkJmbE1yVEVZWEY0KzRJdDNyN1JQVjJqdG5jY0ZmVm03QkFVYTNK?=
 =?utf-8?B?LzlCZkEwc1JHNWhGMzdSMVptSzJVOW13ajFWNjVqcC8wc1dEWnJNQnVZdUZx?=
 =?utf-8?B?RVNFaEVsaGVRc2NxQWFGakYxWnd2UmsxZFNtRlEweWhqdzdXVm9pQk1rSnBl?=
 =?utf-8?B?SGVSdlcweDFuaU1Ea2ROUlV1NnIyRkdNTmZpSU5hN2dUdkhaNGs3a29kYmVQ?=
 =?utf-8?B?TWpPVXJ6dkh0L0cwV1czelRQZElTMnFpb3I1WFRQOE5kWXdWS0VuZTBCbita?=
 =?utf-8?B?aFZGVFFCUFBveVIzRkJycTIxMXBJQmxqcHFMbFhYQUFveStWYnd3bVV4eGJZ?=
 =?utf-8?B?N2lLZG5YVnRCMFBoU3k3YzFZZUNISG5MMVlBOWkxWXU4dEp4bVVya1Z5cGRq?=
 =?utf-8?B?NGxFN1FFeXQrd2x2c3hOa2VicnhuSUN2TkRGK25SSnhJL250NklGOHRyL0hZ?=
 =?utf-8?Q?96wTC7oTHHfHlTkH4g0+1AJmq4xYIZoLcKzOsg9ugYDD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4830a60-ae14-480c-7472-08db732f313d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 14:44:33.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQ4F5aL/6q3SlNvIt2GpsqFGo/9eX5qMOUHBQ6p11b5JEXNF/QFLB11pmlQ5xyEv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4907
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
Cc: juan.hao@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex, Luben or somebody else at least a bit familiar with that, can I 
get a quick rb or acked-by?

This is an important bug fix for Android CTS.

Thanks,
Christian.

Am 21.06.23 um 09:32 schrieb Christian König:
> Some Android CTS is testing for that.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> CC: stable@vger.kernel.org
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 11 +++++++++--
>   drivers/dma-buf/dma-fence.c        |  5 +++--
>   drivers/gpu/drm/drm_syncobj.c      |  2 +-
>   include/linux/dma-fence.h          |  2 +-
>   4 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 7002bca792ff..06eb91306c01 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -66,18 +66,25 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   {
>   	struct dma_fence_array *result;
>   	struct dma_fence *tmp, **array;
> +	ktime_t timestamp;
>   	unsigned int i;
>   	size_t count;
>   
>   	count = 0;
> +	timestamp = ns_to_ktime(0);
>   	for (i = 0; i < num_fences; ++i) {
> -		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i])
> +		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>   			if (!dma_fence_is_signaled(tmp))
>   				++count;
> +			else if (test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT,
> +					  &tmp->flags) &&
> +				 ktime_after(tmp->timestamp, timestamp))
> +				timestamp = tmp->timestamp;
> +		}
>   	}
>   
>   	if (count == 0)
> -		return dma_fence_get_stub();
> +		return dma_fence_allocate_private_stub(timestamp);
>   
>   	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>   	if (!array)
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index f177c56269bb..ad076f208760 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -150,10 +150,11 @@ EXPORT_SYMBOL(dma_fence_get_stub);
>   
>   /**
>    * dma_fence_allocate_private_stub - return a private, signaled fence
> + * @timestamp: timestamp when the fence was signaled
>    *
>    * Return a newly allocated and signaled stub fence.
>    */
> -struct dma_fence *dma_fence_allocate_private_stub(void)
> +struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
>   {
>   	struct dma_fence *fence;
>   
> @@ -169,7 +170,7 @@ struct dma_fence *dma_fence_allocate_private_stub(void)
>   	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>   		&fence->flags);
>   
> -	dma_fence_signal(fence);
> +	dma_fence_signal_timestamp(fence, timestamp);
>   
>   	return fence;
>   }
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0c2be8360525..04589a35eb09 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -353,7 +353,7 @@ EXPORT_SYMBOL(drm_syncobj_replace_fence);
>    */
>   static int drm_syncobj_assign_null_handle(struct drm_syncobj *syncobj)
>   {
> -	struct dma_fence *fence = dma_fence_allocate_private_stub();
> +	struct dma_fence *fence = dma_fence_allocate_private_stub(ktime_get());
>   
>   	if (IS_ERR(fence))
>   		return PTR_ERR(fence);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index d54b595a0fe0..0d678e9a7b24 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -606,7 +606,7 @@ static inline signed long dma_fence_wait(struct dma_fence *fence, bool intr)
>   void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
>   
>   struct dma_fence *dma_fence_get_stub(void);
> -struct dma_fence *dma_fence_allocate_private_stub(void);
> +struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
>   u64 dma_fence_context_alloc(unsigned num);
>   
>   extern const struct dma_fence_ops dma_fence_array_ops;

