Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3D4E9DF0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 19:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2886C10E038;
	Mon, 28 Mar 2022 17:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2073.outbound.protection.outlook.com [40.107.102.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58C310E038
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 17:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFC7pfWf5vyjlc/DyCkF3Lbe540xAOXiZk21tbhTd6pbmilfpceOPBdeYmvmc18zo4RbzSwCVV2KN4lYfv8KG7u6XoZrDeIEkMBGM5HGpf1RTDG5Jsniv6BzhcZjx9LAyoQKSfbUpeYZRTIsotCUOIC3bOqrGvdMsRUDmK9rSr/fKQOuz91ooisF3sxJsJ9A1BWOl/dlhFBFmX8lOajRYDHrHdQdpTwb+SDnrG8gsS0Qnvpoh4+/8/eSfh48Ac07RkpHHPgTPmE2A2MgHBvuHWnnmrFcQ33t90CGCR4iLnpcQnbp+KXw5MMHVTUIMbPP05YIvcYzMDfl74xxa1+k/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGMja0RPaF4XUJhkuM0cHrDBUOfk16buKDfqsSK8znk=;
 b=gXukJsautDV1c32ai0wce5NQXoHXgETBFAorOG+86gAxTT0IB+uZtv9CRPcRD+1dLxgqANvXi3qhZ4IbwL4iWAkFckMqoOEG3MF9qMJqxELuP+HyhdQiy4HQGLlMK6VNPDwPXmNLj2BirakswqwhuY+3Itcvyb3idu0phh3cCGerVRpYOXkXAyUlcDgfQ2NMzL4dCgFPo5MDhR7gggfSe3IFlTDEx6SIvcRMTVXHIJcHj7+oUi35B7G/J+FBQKiwTBS+UWdSTLjxgGNbgftWM94b+yv0hfRnzZNGtWuwNqPDAVJ98tENWvdn6uAiw3muo88+kFVUDvCcX1iB42bwRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGMja0RPaF4XUJhkuM0cHrDBUOfk16buKDfqsSK8znk=;
 b=AFpDsFg0eAgnyd51wFHoIpwTQvn5MYOGreKlketXe+UDaDLglhsoJMYnwOsLqKcKs0NGTRYBiOc+Sr6D2qESVexQsycZFcv6UYkz/8Tdj1Q9qCYzLSKJFvuZDosHeaPzphMjG+vPFP6ijJIIg73QGOy0j8BbpO+km19aiv1XYLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5976.namprd12.prod.outlook.com (2603:10b6:510:1db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 17:55:04 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 17:55:04 +0000
Message-ID: <6e1b9946-3f72-7d21-d319-76557c3259f9@amd.com>
Date: Mon, 28 Mar 2022 19:54:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 07/12] iio: buffer-dma: Use DMABUFs instead of custom
 solution
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>, Paul Cercueil <paul@crapouillou.net>
References: <20220207125933.81634-1-paul@crapouillou.net>
 <20220207125933.81634-8-paul@crapouillou.net>
 <20220328185425.56b51f4a@jic23-huawei>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220328185425.56b51f4a@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0100.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::41) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76b9ac9c-a14a-411c-bc1d-08da10e4164e
X-MS-TrafficTypeDiagnostic: PH7PR12MB5976:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB597681BE8803885BDCAFAFE4831D9@PH7PR12MB5976.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bs1I3uImMaYHKtkMYxjmWv/SE64OVi7bzNSCpr7VhiGOGyYN8ybVeXsqMF4tvR5BvOfk3M2g6xkMJSLoClV3cMKoSBd+C4dDOVHJD7bXMuhb0TarOvPJB72G22M+WxX4f7ZPMCpKFJnCiLhDurGcjhpjDZG/ZVARG3zdpXLmKrZGpyhKo2w4LtCXSg9vmi8dpmkeUo4QPENwVs46RBNV6PLqoDrhZad2B4/3eOuhFnH27jA4+MfUuSdzhLFEsVXv+QaCWAPu7a4teI9DYl0NgXYuy/4frUdNOAE4sO02S32TMSi8a+yewv34Vx0B1anhNtRltUfuk8ZIHuCNhny514RcfBwRbO7me4SWfuYRlDESFYpvAQLmW4zln183wpmB1czajLMN8m2z74QYSHdjoIHhs4v047UsqKMO8fa+QkCsgGXKSz/bAY8YQMEHwWP3938dyoZ2SPAvC1PeDOnTJzRLVyBJHuzg+tJszIt4R5QLKCScqvRIZwxXJIOv8rQghfVNbdPM9iY5TY5gFcay3pZX0PsMcS84v0gYG59Mt2Pn0pJiWYRMW2PykaX8y5cBTGLOgVRcqBNF40r4EBCQrvHXcBkI/mKKbxPwJ7Cikym8X4VYOtk9R7V5z7N0TFG1tjN09BlO8EsY4hXxpcZsd5QGMv3aPIonvgUAQVFOODPdJeAY1eR+GGIbkbc8KJaA02KOwFtK4HCiX/CErDa0Bbs9D6GGvyZVcuF9/7G+O8FpzRE+xlDVnWWqc8O/JkgO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(2906002)(54906003)(31696002)(36756003)(86362001)(8936002)(31686004)(66556008)(508600001)(4326008)(316002)(66476007)(6666004)(110136005)(38100700002)(6486002)(66946007)(6512007)(186003)(7416002)(83380400001)(6506007)(5660300002)(30864003)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnlyZVZnREJwa0o2SmR5WXM4SFNnMWpRdHRaNnNzNHNjWktUN2lzdzJqSEpj?=
 =?utf-8?B?N3NrV1JRMk9FU01uQ2hlYkt1YzhiS1UvVisrRVdESktjbm9WM0FaMTNQcms3?=
 =?utf-8?B?Ym9LR1BxS0J4bUo3K0E1RlAxbElVdjVnK3dka1VoZG1DbzNMYjhWbHZVYThZ?=
 =?utf-8?B?SldOMGc1NXdnMnRCV0xQcmNKWG1pZUw2Q2duVmdGUFg5S3E3SHB3VmxxMGxN?=
 =?utf-8?B?M2d4Nm9SSDRkNVVQOEUzTEdvVzZDQysvaWxGUVNkWTE0V2JmS1g3MGQrMXRY?=
 =?utf-8?B?RitsZktZWU14Y1diZWVEYnA5UUxGU2xKZnQvbzg4aWpadVErTzNrNHlEd2Ir?=
 =?utf-8?B?ZVgyeGpYU0NLN3RFK2QvUXRxMHFzaTR0dk5VUkVLalJiTjNLclhKcWRJVkFi?=
 =?utf-8?B?OUhESWZhazFQdWRkM1dQTTc2anRjRFE3SVRpcXBqdGhxODVPZmtHQTZlYkFR?=
 =?utf-8?B?UDZVeXpIS0M4TEUrWFBHR3FwdGNOQTJjMytRYU95TFRFeHg3RHU2bVdVWGpM?=
 =?utf-8?B?ZVl3M3V3VlZMbXRFWVhlY3BBeEZqZEREU2o5UXVDZFFRN2k0Zi9yTEgzSEJp?=
 =?utf-8?B?d0ZBdjFVL09ZcE9UL2xBWWxTOVlJUGpqekRldStFdDNjTGRkMExOSDA2a3Jq?=
 =?utf-8?B?UkMwc0hqRjZ4R2JHUEZLRU5ReTlZcTdXVlRhbWpEVENiSExRTm43UFVJNGtJ?=
 =?utf-8?B?SGd3b3hQNlpmZXB1RlRROXpDY1hHY3ZMR1ZkM1oybElqYmdMZXFPcm5lWlMy?=
 =?utf-8?B?eDczS1Y0ZXZCTnBIRmQwUW5uQUx0UkdHOUVWN3FkR25EUWFCY05yNVgvaE9X?=
 =?utf-8?B?L1MyMWJFbkJvTzhxbEhDVExqTUoxeDg2NExYbzhlWUlRL0Z3TGxUYWZMazFh?=
 =?utf-8?B?K3NxdG4wcVllcFlCMkdMWGozUVB6bkt6dTVWNU15L3dCemhGYS9WNEoxcWhl?=
 =?utf-8?B?OGtMeFVkZU0rTmpIY0g1ZlFJekN5ZjQvRUk1VVpYT2J0N0xQYzFWRkl2RDNu?=
 =?utf-8?B?UHFpdTNhZnJ3VzZDRVluSXgzaDJxbXhMck8wQUVmMHBiYlRmOGc1K3dPTHFR?=
 =?utf-8?B?QVZrSlZXMlNHbzVQQzNpVzNrSnhRam93TWxYSEhrZ2VybTFrT296eDUxdzdM?=
 =?utf-8?B?V0hEd1kyQ1gwbUdOa1cvU0lXMGN1VnBzVHkrMjJmR3pEcDNTb0VtamJZdXZO?=
 =?utf-8?B?TW5McjdpQ2VNVkFsamlIL0E5NVZ1M04rdi94eWhkM1l1cW43MEpEdmNuSUtT?=
 =?utf-8?B?TUVJdkJXSms0bzlsVCtqQ0pQcVo1ZWZ4Q1FFWDVtWFV2cStudEU2T2VmL1Vl?=
 =?utf-8?B?Q3BoTi9QQWoxTTVicEM4MjRLclpxdGtSTFN1NVNCeGFTUmIyN2Z6OUdvQVpm?=
 =?utf-8?B?eVFlZ1phOWluRUlMY1VyYloxRmlhMFFYMXdqNzBNVXZTL1ZXYnE4Qm9naUQr?=
 =?utf-8?B?QWtxSlYxSVRnRlo5TlBuWXI0amV3akoyNkZlN2l3OWk5TDlSWm9kckVGdElr?=
 =?utf-8?B?b2UyRE0zejVGUk0xU050NGQ4a0RKNk9ld3ZmLzVDZHhTNldyL2FPWHRjSTBW?=
 =?utf-8?B?VEZaYy8xbHd3RVZzeTE5NGZyRmFrVHNMVkpTMUNManB5VXJOVFdiM09SKy9C?=
 =?utf-8?B?VkpaNldYTjVWVE9ERlBOcTBvWDM3YllhTkl2R0tNYUhBWW5FNFhhWFoyOFNO?=
 =?utf-8?B?dy9HL0lPZ3U4UytaQ0ZpMSsrYkp0dHk2RFFwZnZ0UE1INEEyd2dXNFRxYmlo?=
 =?utf-8?B?aEthdnY4UE5WM3BKZzF0bEpvNjhtbU0rUkErUncrbmRSMy9FdnRQTWYwSHY0?=
 =?utf-8?B?NUNCM2VSaGhsZ1o2aEU4cU5vWHV4TDliUC9sV013NjhLVk9lNjh2ZG5hWkc5?=
 =?utf-8?B?T1JEN3hXdEZtbDhWZFk0N1MvR1UrVUdQN2RxaEdQeVVlMHV2bThxd0FKTHI2?=
 =?utf-8?B?UkxXVW1PRGpoakVLSGdZYktvVHc3MmlnVFhZN0V4aHlxWGNBT0trL1ppUE5Q?=
 =?utf-8?B?Q0N5UDRTcGdXM3JWWnRDSnZ1REYvRkd5ZGNtYjZacTZSUnJkVStnaWQ5dXc1?=
 =?utf-8?B?N0FEVUFiYjVSQ0tzSkFjTE1iN2ZjTHdVcnlwSTlWNklweVY3Rm1hR3hZRUEz?=
 =?utf-8?B?WkoxVlU0aU9IZGUrK1p5TUtTWUtkcXN4K0tqU1NJN0IwYk1kbFdiNW5jY3l6?=
 =?utf-8?B?VUI3czZxUGJRaGE4YmFkTVBmdE9TUzhjajErTGtmU3YrMDRsRG1QSGtZTk9z?=
 =?utf-8?B?cElaUFVqajdFVlhHdFh2cmxYNC9uSk5kNmREK1paamRqME5MSlpMbkMzSDla?=
 =?utf-8?B?NWM4Q1Nuc3JmT092WUVWSmZ4c1R6QUo5U2loZkhVQ2JJaHNCbDVZTk0rQ1dI?=
 =?utf-8?Q?/rCZnG4YwII54qdTpdnYVCw6Gbne6c66c1h8VXoEGKxbS?=
X-MS-Exchange-AntiSpam-MessageData-1: CqiajbqtTpeXuQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b9ac9c-a14a-411c-bc1d-08da10e4164e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 17:55:04.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3e41/V8QlEEjoiEBkjsfHvcmB52gzsqhR2gNoZjMCvrGxCzUUhgbT0Piwmg0qQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5976
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.03.22 um 19:54 schrieb Jonathan Cameron:
> On Mon,  7 Feb 2022 12:59:28 +0000
> Paul Cercueil <paul@crapouillou.net> wrote:
>
>> Enhance the current fileio code by using DMABUF objects instead of
>> custom buffers.
>>
>> This adds more code than it removes, but:
>> - a lot of the complexity can be dropped, e.g. custom kref and
>>    iio_buffer_block_put_atomic() are not needed anymore;
>> - it will be much easier to introduce an API to export these DMABUF
>>    objects to userspace in a following patch.
>>
>> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Hi Paul,
>
> I'm a bit rusty on dma mappings, but you seem to have
> a mixture of streaming and coherent mappings going on in here.
>
> Is it the case that the current code is using the coherent mappings
> and a potential 'other user' of the dma buffer might need
> streaming mappings?

Streaming mappings are generally not supported by DMA-buf.

You always have only coherent mappings.

Regards,
Christian.

>
> Jonathan
>
>> ---
>>   drivers/iio/buffer/industrialio-buffer-dma.c | 192 ++++++++++++-------
>>   include/linux/iio/buffer-dma.h               |   8 +-
>>   2 files changed, 122 insertions(+), 78 deletions(-)
>>
>> diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
>> index 15ea7bc3ac08..54e6000cd2ee 100644
>> --- a/drivers/iio/buffer/industrialio-buffer-dma.c
>> +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/poll.h>
>>   #include <linux/iio/buffer_impl.h>
>>   #include <linux/iio/buffer-dma.h>
>> +#include <linux/dma-buf.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/sizes.h>
>>   
>> @@ -90,103 +91,145 @@
>>    * callback is called from within the custom callback.
>>    */
>>   
>> -static void iio_buffer_block_release(struct kref *kref)
>> -{
>> -	struct iio_dma_buffer_block *block = container_of(kref,
>> -		struct iio_dma_buffer_block, kref);
>> -
>> -	WARN_ON(block->state != IIO_BLOCK_STATE_DEAD);
>> -
>> -	dma_free_coherent(block->queue->dev, PAGE_ALIGN(block->size),
>> -					block->vaddr, block->phys_addr);
>> -
>> -	iio_buffer_put(&block->queue->buffer);
>> -	kfree(block);
>> -}
>> -
>> -static void iio_buffer_block_get(struct iio_dma_buffer_block *block)
>> -{
>> -	kref_get(&block->kref);
>> -}
>> -
>> -static void iio_buffer_block_put(struct iio_dma_buffer_block *block)
>> -{
>> -	kref_put(&block->kref, iio_buffer_block_release);
>> -}
>> -
>> -/*
>> - * dma_free_coherent can sleep, hence we need to take some special care to be
>> - * able to drop a reference from an atomic context.
>> - */
>> -static LIST_HEAD(iio_dma_buffer_dead_blocks);
>> -static DEFINE_SPINLOCK(iio_dma_buffer_dead_blocks_lock);
>> -
>> -static void iio_dma_buffer_cleanup_worker(struct work_struct *work)
>> -{
>> -	struct iio_dma_buffer_block *block, *_block;
>> -	LIST_HEAD(block_list);
>> -
>> -	spin_lock_irq(&iio_dma_buffer_dead_blocks_lock);
>> -	list_splice_tail_init(&iio_dma_buffer_dead_blocks, &block_list);
>> -	spin_unlock_irq(&iio_dma_buffer_dead_blocks_lock);
>> -
>> -	list_for_each_entry_safe(block, _block, &block_list, head)
>> -		iio_buffer_block_release(&block->kref);
>> -}
>> -static DECLARE_WORK(iio_dma_buffer_cleanup_work, iio_dma_buffer_cleanup_worker);
>> -
>> -static void iio_buffer_block_release_atomic(struct kref *kref)
>> -{
>> +struct iio_buffer_dma_buf_attachment {
>> +	struct scatterlist sgl;
>> +	struct sg_table sg_table;
>>   	struct iio_dma_buffer_block *block;
>> -	unsigned long flags;
>> -
>> -	block = container_of(kref, struct iio_dma_buffer_block, kref);
>> -
>> -	spin_lock_irqsave(&iio_dma_buffer_dead_blocks_lock, flags);
>> -	list_add_tail(&block->head, &iio_dma_buffer_dead_blocks);
>> -	spin_unlock_irqrestore(&iio_dma_buffer_dead_blocks_lock, flags);
>> -
>> -	schedule_work(&iio_dma_buffer_cleanup_work);
>> -}
>> -
>> -/*
>> - * Version of iio_buffer_block_put() that can be called from atomic context
>> - */
>> -static void iio_buffer_block_put_atomic(struct iio_dma_buffer_block *block)
>> -{
>> -	kref_put(&block->kref, iio_buffer_block_release_atomic);
>> -}
>> +};
>>   
>>   static struct iio_dma_buffer_queue *iio_buffer_to_queue(struct iio_buffer *buf)
>>   {
>>   	return container_of(buf, struct iio_dma_buffer_queue, buffer);
>>   }
>>   
>> +static struct iio_buffer_dma_buf_attachment *
>> +to_iio_buffer_dma_buf_attachment(struct sg_table *table)
>> +{
>> +	return container_of(table, struct iio_buffer_dma_buf_attachment, sg_table);
>> +}
>> +
>> +static void iio_buffer_block_get(struct iio_dma_buffer_block *block)
>> +{
>> +	get_dma_buf(block->dmabuf);
>> +}
>> +
>> +static void iio_buffer_block_put(struct iio_dma_buffer_block *block)
>> +{
>> +	dma_buf_put(block->dmabuf);
>> +}
>> +
>> +static int iio_buffer_dma_buf_attach(struct dma_buf *dbuf,
>> +				     struct dma_buf_attachment *at)
>> +{
>> +	at->priv = dbuf->priv;
>> +
>> +	return 0;
>> +}
>> +
>> +static struct sg_table *iio_buffer_dma_buf_map(struct dma_buf_attachment *at,
>> +					       enum dma_data_direction dma_dir)
>> +{
>> +	struct iio_dma_buffer_block *block = at->priv;
>> +	struct iio_buffer_dma_buf_attachment *dba;
>> +	int ret;
>> +
>> +	dba = kzalloc(sizeof(*dba), GFP_KERNEL);
>> +	if (!dba)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	sg_init_one(&dba->sgl, block->vaddr, PAGE_ALIGN(block->size));
>> +	dba->sg_table.sgl = &dba->sgl;
>> +	dba->sg_table.nents = 1;
>> +	dba->block = block;
>> +
>> +	ret = dma_map_sgtable(at->dev, &dba->sg_table, dma_dir, 0);
>> +	if (ret) {
>> +		kfree(dba);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return &dba->sg_table;
>> +}
>> +
>> +static void iio_buffer_dma_buf_unmap(struct dma_buf_attachment *at,
>> +				     struct sg_table *sg_table,
>> +				     enum dma_data_direction dma_dir)
>> +{
>> +	struct iio_buffer_dma_buf_attachment *dba =
>> +		to_iio_buffer_dma_buf_attachment(sg_table);
>> +
>> +	dma_unmap_sgtable(at->dev, &dba->sg_table, dma_dir, 0);
>> +	kfree(dba);
>> +}
>> +
>> +static void iio_buffer_dma_buf_release(struct dma_buf *dbuf)
>> +{
>> +	struct iio_dma_buffer_block *block = dbuf->priv;
>> +	struct iio_dma_buffer_queue *queue = block->queue;
>> +
>> +	WARN_ON(block->state != IIO_BLOCK_STATE_DEAD);
>> +
>> +	mutex_lock(&queue->lock);
>> +
>> +	dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
>> +			  block->vaddr, block->phys_addr);
>> +	kfree(block);
>> +
>> +	mutex_unlock(&queue->lock);
>> +	iio_buffer_put(&queue->buffer);
>> +}
>> +
>> +static const struct dma_buf_ops iio_dma_buffer_dmabuf_ops = {
>> +	.attach			= iio_buffer_dma_buf_attach,
>> +	.map_dma_buf		= iio_buffer_dma_buf_map,
>> +	.unmap_dma_buf		= iio_buffer_dma_buf_unmap,
>> +	.release		= iio_buffer_dma_buf_release,
>> +};
>> +
>>   static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
>>   	struct iio_dma_buffer_queue *queue, size_t size)
>>   {
>>   	struct iio_dma_buffer_block *block;
>> +	DEFINE_DMA_BUF_EXPORT_INFO(einfo);
>> +	struct dma_buf *dmabuf;
>> +	int err = -ENOMEM;
>>   
>>   	block = kzalloc(sizeof(*block), GFP_KERNEL);
>>   	if (!block)
>> -		return NULL;
>> +		return ERR_PTR(err);
>>   
>>   	block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
>>   		&block->phys_addr, GFP_KERNEL);
>> -	if (!block->vaddr) {
>> -		kfree(block);
>> -		return NULL;
>> +	if (!block->vaddr)
>> +		goto err_free_block;
>> +
>> +	einfo.ops = &iio_dma_buffer_dmabuf_ops;
>> +	einfo.size = PAGE_ALIGN(size);
>> +	einfo.priv = block;
>> +	einfo.flags = O_RDWR;
>> +
>> +	dmabuf = dma_buf_export(&einfo);
>> +	if (IS_ERR(dmabuf)) {
>> +		err = PTR_ERR(dmabuf);
>> +		goto err_free_dma;
>>   	}
>>   
>> +	block->dmabuf = dmabuf;
>>   	block->size = size;
>>   	block->state = IIO_BLOCK_STATE_DONE;
>>   	block->queue = queue;
>>   	INIT_LIST_HEAD(&block->head);
>> -	kref_init(&block->kref);
>>   
>>   	iio_buffer_get(&queue->buffer);
>>   
>>   	return block;
>> +
>> +err_free_dma:
>> +	dma_free_coherent(queue->dev, PAGE_ALIGN(size),
>> +			  block->vaddr, block->phys_addr);
>> +err_free_block:
>> +	kfree(block);
>> +	return ERR_PTR(err);
>>   }
>>   
>>   static void _iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
>> @@ -223,7 +266,7 @@ void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
>>   	_iio_dma_buffer_block_done(block);
>>   	spin_unlock_irqrestore(&queue->list_lock, flags);
>>   
>> -	iio_buffer_block_put_atomic(block);
>> +	iio_buffer_block_put(block);
>>   	iio_dma_buffer_queue_wake(queue);
>>   }
>>   EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
>> @@ -249,7 +292,8 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
>>   		list_del(&block->head);
>>   		block->bytes_used = 0;
>>   		_iio_dma_buffer_block_done(block);
>> -		iio_buffer_block_put_atomic(block);
>> +
>> +		iio_buffer_block_put(block);
>>   	}
>>   	spin_unlock_irqrestore(&queue->list_lock, flags);
>>   
>> @@ -340,8 +384,8 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
>>   
>>   		if (!block) {
>>   			block = iio_dma_buffer_alloc_block(queue, size);
>> -			if (!block) {
>> -				ret = -ENOMEM;
>> +			if (IS_ERR(block)) {
>> +				ret = PTR_ERR(block);
>>   				goto out_unlock;
>>   			}
>>   			queue->fileio.blocks[i] = block;
>> diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
>> index 490b93f76fa8..6b3fa7d2124b 100644
>> --- a/include/linux/iio/buffer-dma.h
>> +++ b/include/linux/iio/buffer-dma.h
>> @@ -8,7 +8,6 @@
>>   #define __INDUSTRIALIO_DMA_BUFFER_H__
>>   
>>   #include <linux/list.h>
>> -#include <linux/kref.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/mutex.h>
>>   #include <linux/iio/buffer_impl.h>
>> @@ -16,6 +15,7 @@
>>   struct iio_dma_buffer_queue;
>>   struct iio_dma_buffer_ops;
>>   struct device;
>> +struct dma_buf;
>>   
>>   /**
>>    * enum iio_block_state - State of a struct iio_dma_buffer_block
>> @@ -39,8 +39,8 @@ enum iio_block_state {
>>    * @vaddr: Virutal address of the blocks memory
>>    * @phys_addr: Physical address of the blocks memory
>>    * @queue: Parent DMA buffer queue
>> - * @kref: kref used to manage the lifetime of block
>>    * @state: Current state of the block
>> + * @dmabuf: Underlying DMABUF object
>>    */
>>   struct iio_dma_buffer_block {
>>   	/* May only be accessed by the owner of the block */
>> @@ -56,13 +56,13 @@ struct iio_dma_buffer_block {
>>   	size_t size;
>>   	struct iio_dma_buffer_queue *queue;
>>   
>> -	/* Must not be accessed outside the core. */
>> -	struct kref kref;
>>   	/*
>>   	 * Must not be accessed outside the core. Access needs to hold
>>   	 * queue->list_lock if the block is not owned by the core.
>>   	 */
>>   	enum iio_block_state state;
>> +
>> +	struct dma_buf *dmabuf;
>>   };
>>   
>>   /**

