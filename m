Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720636B7022
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 08:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565A610E04D;
	Mon, 13 Mar 2023 07:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E52910E04D;
 Mon, 13 Mar 2023 07:32:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jaiyn75hogGqGlHsL0IkUs7/YUKsavasdTRH3JiHXNWuBydn9UEtxx1XUnoYshv31m4hxay0tFlgdkIfgkdQeB1PdeNQRPm5Ze9UyqnXKlPvGyUQbGopOSHuq6E0Au+r8N4RaMx9giq//+ZDpLCaW3mPL5kpK/qo3bcw/gK2Le5j+JvGBzsRSihVWx9F9htU/LbatenomNrDi1NYrF3I6LWIrkiIdIwE4sTrhpH0YL3acrT3a/IwN0oeHCgwm24K5h4QjsUHNJAfiEZ72qRVE8551taJadQyZXLN+6svsKNxASxnLo/FkNgVABJBGeU/OwOIMGCya8RcMpaOtWc9kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGHUjEy0wmGU2VY7Ceit4780S2UuQsCTuoctvjhPQIA=;
 b=HBv9w2+OENsJTANkJaZjOp+kQyJZjRpimV4JYv9VNRf/WkWPw6hiREgExbsCIQsWo7lf8TlaWacoQou3x5WUnFFkTNiJUuOJS4RNairiL8QjX754KSOSy95t9pZ3XnLjBHX2i+SOPFwVf0rBOUxZfVC95T1Ufh57HrbnwNxp21mZwqRuCewQjB+VCRmexxwey8UFKNbm9GkGUk0yLxf3R+i2EXLlHae2pEEjAQ5AG59vb1RYRk3rcYe6KHKlrY6C1PwUjYl/4oAxf0bjz5g0Ysw/JCwBPEya8mDigJXw9SZSEFghrBi+JfkpKAM9NHMnVG5OfanRtTmFdIc82mWWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGHUjEy0wmGU2VY7Ceit4780S2UuQsCTuoctvjhPQIA=;
 b=0JW5bSkJoLEnQllKfmRQYctZdkZw61ocm1SrEyzJGAy8M7GwaEHyHYHL3OebEFnaobof9hXGEvj5Uw9MK3UzRvV+8MyLoHL44cAhKSFiKnpi6uiu/DkiLF8w6QguYp8DmlXNW5nKWLcIfPlMnxtlQs+93oE7ILIMkE4x7bP/IN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 07:32:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d23f:bb1:df95:3918%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 07:32:07 +0000
Message-ID: <2c0cb611-dd9f-13f5-1e55-7b7ee2db468d@amd.com>
Date: Mon, 13 Mar 2023 08:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dma-buf/dma-fence: Add dma_fence_init_noref()
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230311173513.1080397-1-robdclark@gmail.com>
 <20230311173513.1080397-2-robdclark@gmail.com>
 <1e3d4830-4797-8cc2-5882-02de44424ec7@amd.com>
In-Reply-To: <1e3d4830-4797-8cc2-5882-02de44424ec7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b0a3293-7207-4a2d-e608-08db23950c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GeZXRb9SGsjI8LoeeOL1POHsyCZRTe4Bhb3UZFm8l+CRTqOsFfIW1cQYcEatgxlimXiuHTwVDP3R3cVAaDcfrJjEXBnYTfaZZLoIj5C0eqCZdmdRU/KOejSlN55E+XrB4C3q4xYgHShpeGDX8i/v/8glk0Am5bsvONM59AZ3r7dl7tLFtm+eMqh2FdaqKX+18+SBtoNOfBJwciQV5oChlpHOyDYjWv59aR3VjD0AQ7wMAsgmMYEkbgWIFAzWSMyyoOVkMEpxjIC/Q1ho/D/CA6uZ8wNiw5pvRGkSarehpoi91SPW0cJ2Wb7RVmsKuy+CMT4ygufPAeJqI0Q2OHl32NBkvn1eyw3li9RSJyJ8c8F4p12RHJWWkKB+KZiok58divqMLWAK7eEg6bnHDd2FIzD3YQrEU/j65vg7uXNPVJqrX5wQV1sMMgwVhfmWfjoLq9vDJ3KxMzF0NfSobeSD+9goMCbt/K+djNjMVVftdz2gKRO4FJB3T1zNS97zN7O7dWq7Y7StlLWUf07R9DEgb7Cj72fa6oqIHPR8fBEdycKTXyJLIvjvNEm/Hj81QSn6WFCjL+B1zM7InykZWfGZBnrnQ4MnUO2TI8JBa37XjyzoheO3oLUu85/mIaDcVyyJLK+lyvMyQvZqoUQXFCz5GthMRMZYmSbA6EcHtKluVxMg7LwhehIJmi38c4mBYMsu39M0T2UBci2NXtm/aOxuunDuwWGee7h/DWy8Kslihvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199018)(36756003)(86362001)(31696002)(41300700001)(186003)(26005)(6506007)(6512007)(5660300002)(7416002)(4326008)(2616005)(8936002)(316002)(54906003)(478600001)(8676002)(66476007)(6666004)(66556008)(66946007)(6486002)(38100700002)(2906002)(83380400001)(66574015)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDJLNGdHVDJHaEt5cTFSYzV0aUtKWmlleFNOUmpUVEdaUnI2ckdvYjdRTXZn?=
 =?utf-8?B?WXo1RGdlQlZwdWw4cEtzbXlGUThQa0ZhZy9HN1dTeHJJT0NkQnlXTFRRaldy?=
 =?utf-8?B?MjUwZVEzVG5KN25SQzZzcDlLS1REcEtzV0d6U2VNdTBVcHpFemxiSzlUeldo?=
 =?utf-8?B?TDZWdERtemcxb3lMUXBTZW9tOEkwY3VvWXV0ZVBWY3N5cjVLTnlPT0JSQ2tO?=
 =?utf-8?B?L3p0OHBIZXYwQURTQ0VmZWJJNm1HbDNQaVI1QVdPQjZNT3JWUE5YemlDQ1Fv?=
 =?utf-8?B?OXloNWxYaHhFZ2N0RzNZWHE5WGZKM0tDekVaTGtNUkdRUVRPdWZKakowVDUr?=
 =?utf-8?B?clFHRDBJcFRQM2xHaUtDckh2OTViNXN6cmZvMnFHT0JUWSsxVi83bDdrZkhH?=
 =?utf-8?B?SjJJbGZ4Y1VkQVpEZVNuZXorQUZOa1NNUVRiMmxsbGZJWHRIcit6bVowRktn?=
 =?utf-8?B?QlAzaCtXSzluNmdIWnp1YjhYVnZKeTMzdFlKTE5pRUZJMnhBSTNLVC9qUzVa?=
 =?utf-8?B?RDJCVnZid0x3M29EVWliODQrdmVHK3NQS3B4Y3dPSm1tb0krdVJudFpWQW9S?=
 =?utf-8?B?NE1oTGpZeVdKeTFub2RBd1I2VFZxYVBYcm1PZ3FWUnZxbklyRjNhb09pdVFB?=
 =?utf-8?B?em9Pbkt3c1lDckQ0d1dXdDRFLzZ5VEk0NHptbkpldWd2QWxCalZkakYvT1d6?=
 =?utf-8?B?T0JzaEpFZjVuOEhPdHBXeHUvVVRVL0tKOWFON1dkMWQwbks3em1BY2QrbXY5?=
 =?utf-8?B?NHlvNkpxWWh0ZTl5eFNPeFI4ZjJ1dTBHbUhsT09Hc1JtbG11blpJaythMUMw?=
 =?utf-8?B?WFJLYUNvUU0waStaNGJsbjluSUpDVDVMOTJLRFhONUUrTmJOTGd4NnNLcXp6?=
 =?utf-8?B?a3ZKOFg5L1hvTzJPVVJUNXVidUZwODlIWUFBZjdLTkJUaFdFb3ZRU3RuU0Vw?=
 =?utf-8?B?N2JhY3FzbnZQa0oyRTNOa2dZYjhvTlpINDBKd0dpa2I5ZmxycDNaOHMyenB4?=
 =?utf-8?B?bkg5dFpiY3RldG4xZ29ia3RoendkWVl4LzdTa0sxbzh3TkcvQlhkbnJhNk9x?=
 =?utf-8?B?NnRyOEdjK0Z3YjAwYnVicVFxamxBczA2VnhRelZLSmcxVmhIbjlKM3JmMkoy?=
 =?utf-8?B?N3JEUjNzZ3Jza21HT1l5NVpHSnVGUlFxeU52ekVxNmVUWFBMQTlhUDZtL2hI?=
 =?utf-8?B?VnM4ZkhMVW5zdUFXakgyZEh0RTZtMUxRZ3dRZDFEYWdsWlRJWnR5RWI5UkhH?=
 =?utf-8?B?S1A0ZzdDWUlWUHlUdVE0Q2xwRmkwbjBRcFlFaTBCdnZlUmR6bmhQaEpGSmJK?=
 =?utf-8?B?SXlLcjZNdmErRlV1ZXVHNmhkR3V0UUlEWjlmYkxEdkdCTElZUG1adERMN012?=
 =?utf-8?B?L2VHdk9nSzJLMFNGemxScHRvaGszZDRoaFJWZGhrOEZ0TFpnSkFwTmpYVGI0?=
 =?utf-8?B?b2FRdjgyYTYwRUxtVjNEU3FxZVhwSUhydXlkalNmbzc4Mml6ZlNidWVNYkF3?=
 =?utf-8?B?S0VWaU9ieWR6dnJ5L0FPOExIQ2hHbzM3TGl2Y3kyY2JOTkFNN0VmdTlIMzFX?=
 =?utf-8?B?T0RXWTlsWnZoVnFFMEJaREFFeXdGMlI3Wlp5Y29ZZzBTL1Q5S25ZVHFUT0Fh?=
 =?utf-8?B?QmZmOHhiTUhKTEFIbm1YbzFJeCtvcU1hUGFNUWx2cjFTbHNTOXRuYXJ6c282?=
 =?utf-8?B?M0VPelA4N1pKZGVTMHBVQVR4R2VHSzVBL0ZWWlNnYlZ5U3pYMkJEOVVpa2o4?=
 =?utf-8?B?dFZESUtzRjZ0c3ZjQ1VYZmVJTkNOQjRCTkxzTjNJZ3h3ODc3ZThLSkJ2S0s1?=
 =?utf-8?B?Z0JJQkZKK1BxNmhNWFc4OW5ReGVJTjNGRDJkd1FnR29Qa0dWNFM2K2JVc3pt?=
 =?utf-8?B?ZUMvcFBhS1pETVF4amJxVW8xeUtZWmdNMDg1NmN1MGNvV2JPMXVkNFRQeVh3?=
 =?utf-8?B?UlovZTdoN0NtU0ZUeE9ndFpNZTR3Q1pCYUtFSjVOVU4xak1GcWVUQWFablE3?=
 =?utf-8?B?N21iM3dzYVJXZFVueVJTV3VMVCtQMG5lUU94MU9HN0dOUi9JWjlRdmtQQVQw?=
 =?utf-8?B?ajNsYlliOE44UnlNcjgyby92MXhOODJyeDM2UDd3RlIvek04TSt3UnRzTWty?=
 =?utf-8?Q?WiOtHIiF2OZGQ28hEetgAOYSo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0a3293-7207-4a2d-e608-08db23950c8a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 07:32:07.1679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YS+EMulaVy255QvjJSME4hLozmODoRc7MtHkgonAFvDqgcp9ptbQt5r808Qtxrax
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.03.23 um 08:13 schrieb Christian König:
> Am 11.03.23 um 18:35 schrieb Rob Clark:
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Add a way to initialize a fence without touching the refcount. This is
>> useful, for example, if the fence is embedded in a drm_sched_job.  In
>> this case the refcount will be initialized before the job is queued.
>> But the seqno of the hw_fence is not known until job_run().
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Well that approach won't work. The fence can only be initialized in 
> the job_run() callback because only then the sequence number can be 
> determined.

Ah, wait a second! After reading the msm code I realized you are going 
to use this exactly the other way around that I think you use it.

In this case it would work, but that really needs better documentation. 
And I'm pretty sure it's not a good idea for msm, but let's discuss that 
on the other patch.

Regards,
Christian.

>
> Regards,
> Christian.
>
>> ---
>>   drivers/dma-buf/dma-fence.c | 43 ++++++++++++++++++++++++++++---------
>>   include/linux/dma-fence.h   |  2 ++
>>   2 files changed, 35 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 74e36f6d05b0..97c05a465cb4 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -989,28 +989,27 @@ void dma_fence_describe(struct dma_fence 
>> *fence, struct seq_file *seq)
>>   EXPORT_SYMBOL(dma_fence_describe);
>>     /**
>> - * dma_fence_init - Initialize a custom fence.
>> + * dma_fence_init_noref - Initialize a custom fence without 
>> initializing refcount.
>>    * @fence: the fence to initialize
>>    * @ops: the dma_fence_ops for operations on this fence
>>    * @lock: the irqsafe spinlock to use for locking this fence
>>    * @context: the execution context this fence is run on
>>    * @seqno: a linear increasing sequence number for this context
>>    *
>> - * Initializes an allocated fence, the caller doesn't have to keep its
>> - * refcount after committing with this fence, but it will need to 
>> hold a
>> - * refcount again if &dma_fence_ops.enable_signaling gets called.
>> - *
>> - * context and seqno are used for easy comparison between fences, 
>> allowing
>> - * to check which fence is later by simply using dma_fence_later().
>> + * Like &dma_fence_init but does not initialize the refcount.  Suitable
>> + * for cases where the fence is embedded in another struct which has 
>> it's
>> + * refcount initialized before the fence is initialized.  Such as 
>> embedding
>> + * in a &drm_sched_job, where the job is created before knowing the 
>> seqno
>> + * of the hw_fence.
>>    */
>>   void
>> -dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops 
>> *ops,
>> -           spinlock_t *lock, u64 context, u64 seqno)
>> +dma_fence_init_noref(struct dma_fence *fence, const struct 
>> dma_fence_ops *ops,
>> +             spinlock_t *lock, u64 context, u64 seqno)
>>   {
>>       BUG_ON(!lock);
>>       BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>> +    BUG_ON(!kref_read(&fence->refcount));
>>   -    kref_init(&fence->refcount);
>>       fence->ops = ops;
>>       INIT_LIST_HEAD(&fence->cb_list);
>>       fence->lock = lock;
>> @@ -1021,4 +1020,28 @@ dma_fence_init(struct dma_fence *fence, const 
>> struct dma_fence_ops *ops,
>>         trace_dma_fence_init(fence);
>>   }
>> +EXPORT_SYMBOL(dma_fence_init_noref);
>> +
>> +/**
>> + * dma_fence_init - Initialize a custom fence.
>> + * @fence: the fence to initialize
>> + * @ops: the dma_fence_ops for operations on this fence
>> + * @lock: the irqsafe spinlock to use for locking this fence
>> + * @context: the execution context this fence is run on
>> + * @seqno: a linear increasing sequence number for this context
>> + *
>> + * Initializes an allocated fence, the caller doesn't have to keep its
>> + * refcount after committing with this fence, but it will need to 
>> hold a
>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>> + *
>> + * context and seqno are used for easy comparison between fences, 
>> allowing
>> + * to check which fence is later by simply using dma_fence_later().
>> + */
>> +void
>> +dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops 
>> *ops,
>> +           spinlock_t *lock, u64 context, u64 seqno)
>> +{
>> +    kref_init(&fence->refcount);
>> +    dma_fence_init_noref(fence, ops, lock, context, seqno);
>> +}
>>   EXPORT_SYMBOL(dma_fence_init);
>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>> index d54b595a0fe0..f617c78a2e0a 100644
>> --- a/include/linux/dma-fence.h
>> +++ b/include/linux/dma-fence.h
>> @@ -279,6 +279,8 @@ struct dma_fence_ops {
>>       void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>>   };
>>   +void dma_fence_init_noref(struct dma_fence *fence, const struct 
>> dma_fence_ops *ops,
>> +              spinlock_t *lock, u64 context, u64 seqno);
>>   void dma_fence_init(struct dma_fence *fence, const struct 
>> dma_fence_ops *ops,
>>               spinlock_t *lock, u64 context, u64 seqno);
>

