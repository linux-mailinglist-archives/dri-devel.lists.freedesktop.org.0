Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA24BC526
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 04:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7E310EB45;
	Sat, 19 Feb 2022 03:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514D810EB45;
 Sat, 19 Feb 2022 03:03:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAkw4LCoS/pWQgE7NKqnMJTePymLu27dJ4xz0C+xCWq7KyjJAiInhp1hNRIp83zanxCNRljzCIFVrVwsA9DZgesRaF9qT9Ztco8bxSbTQzoKCmZB/Mo7jonvtVgIeUNtWo2SkuvleAoXNh+qEH2jB0ZdSBhoBV899RMEAPQK7Dxwpv+wkCWgX2xNkIO77LpJxg70cIv/N1RvxyX2qPOzwHT6nJqNhImdjPgke4ldblvYKofRkMkDElZpjiz8pp4g//3BYEem/QBABOZlT0sx7ocN2bDP6GqgEunMz2028kYnZATfmQE1hZKRwVrfog0TSlLC89mYVonNs/25gEJEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xT50eUU9+OtzCjUU3OFBFYym7ViA5CmrTT//SOMGk8A=;
 b=nsNW9Ae+NBPJwi1XUldEgtuuTxvwPKfoXI6zenWakfO21ebuYqEgBaQHQ6wosQTbFzhI6UGcRF54qr0deo4Y62v19PO6IZ138SRETJ4Ig21z89hxDw6YZ6VS7sjoMytRemLszahl0eK93ZzCPTDuzmAhyGoX+wsHLu8O7PeXGzo75ovYGkZzZoJnWeyYRdWGyLJCckHutxSzX9djF7jOiDYz06FWW5OkzmO4Oi8v7up50oM5S31qhcOJ2XoGMH9iP7gpn2SrGxDC9+OqcedXI5RDf13QnZBO+9fIZTlGdHBd+xtxTMTYHYrScXyWGl7iCWYvEjQU6E9I/aF3XzmC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xT50eUU9+OtzCjUU3OFBFYym7ViA5CmrTT//SOMGk8A=;
 b=g9f5dx/a3vuBDcNeGzs6MwEN88KOsdVQ5QM/DTq6EEB48n8vsbcqFpur7ozQzcVaoXd3uoH1cRaMl9skbggzFvrl4pOI/VnZ99XGrsy0fmAsDo5LPNeFhX+8GguLmZfrBUCZ7rdxc6Pjxr/MogbyuV/Buitjkab4Fn5m1aWdkhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4887.namprd12.prod.outlook.com (2603:10b6:a03:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Sat, 19 Feb
 2022 03:03:21 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4995.024; Sat, 19 Feb 2022
 03:03:20 +0000
Message-ID: <86d0225c-ca6e-c43e-835c-322770fd68c2@amd.com>
Date: Fri, 18 Feb 2022 22:03:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/amdkfd: rework criu_restore_bos error handling
Content-Language: en-US
To: Tom Rix <trix@redhat.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 david.yatsin@amd.com, rajneesh.bhardwaj@amd.com
References: <20220218173913.3376948-1-trix@redhat.com>
 <b98981f4-358b-ebdd-dade-4027c57a1a7e@amd.com>
 <4ca24c08-9014-3380-b8cc-dc0ed9a01a73@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <4ca24c08-9014-3380-b8cc-dc0ed9a01a73@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f32ef96-4bd4-4b6a-9406-08d9f35462ae
X-MS-TrafficTypeDiagnostic: BY5PR12MB4887:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4887EE87630C21610CD8656A92389@BY5PR12MB4887.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jv7M5I4M+OvFghNeIXUgaBsZMzjhQhNS7uvPaAnuY2Wlruaqz0CyO6FlqAWe3lq0WUTIkFRPa/t382qVD/vpebp2Egts7275/K6loy9XM2p9bOx4AOfUcWGKkXNAJ5DMbVXZ30L2LsuZ0Q/GR5E1DvWQ8WN6Xm2LamUS+Y/wgMj+Xm0nXOug0pwm80Uy60YWnl3chIOK6KymNvilMtU03dyQ6P3ZPeG5wM7TDh9/0WwAkc0/wdGY5ekOseKp2MkhytoFtOCTmcNIgAJTkN6y3L/24K4PxrGfF7I0bMQmowFYsUcyUI+OlTGuYj/KMEEyOgB2P7JsE88k7lJwwr7uISuaBH480sNI2bSrFgtORYgxEzhfomeOvxyEpm5hPZVXRtg1sh23SVTXKXS7iMF1DL/haK6ASfnJqOF06dcI+72d2e+MLC0ddXi60onLJlv5LyGIvmCE1UMYrMhLrRRvlOOKnIIy+FUoeuYepTewhON0pwu57WhYLvPFxRdiGQ7nS2orUDALfqWlHJ1RLCSHSJwOOoCRwflKEnF5CzfI8Z54YSz8xj240X2VgKm6jqidBAj+YoRA35sAvHEvD7jWVxoAgXaLstXyn++w3LHdfcHS2cjOjnrDm8el9lXadFnXbuA72s9ChJ9Y0VdDyPvH/IXxesH9VZIQv1/hcOO7r1A1nEJlkg+axt5I1y4wJN5p5UeJ8ZpVbKy1TS29i79X1qFvMAUcGRy6GdmOhY0CrdD6wUDuxuroyvaf9rCDRZnB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(26005)(2616005)(6512007)(31696002)(6636002)(38100700002)(86362001)(8936002)(36756003)(31686004)(66476007)(66556008)(66946007)(508600001)(53546011)(83380400001)(5660300002)(316002)(44832011)(6506007)(8676002)(6486002)(921005)(4326008)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGV6WnovMDQ2aDFaUjc5aS9NeWZwSWhSaU1TL3MrSFFSQTdSOEdoaGpFT2FP?=
 =?utf-8?B?SVkxaXJacWdVcW5mVDd0Z3NnS3IrbHROTE5LMENSa05ucEorcm4yY05Sb0Y0?=
 =?utf-8?B?SlE5VjZOdXJYTVpvU0x3OTdCaEpTeitoQ1pMTU10cHZ3Z0tEaXZ6NFkzeXky?=
 =?utf-8?B?cE0xZUU1M3dvcTh0VDJtVHRvNzRZL2V4emltajd1b1VmbkhSYmk3UzF1cWRw?=
 =?utf-8?B?UEovaDJDRTg4bU1YNUd2bDh6R2JXZmpFSzVjMEMvSEt2V3hGU21QNnZKZjJ6?=
 =?utf-8?B?cmptWWpka29pZSsySFJJeW96NTVNUXV1Vjg3UFN2WnVQTUhLSkhmTXZZYStF?=
 =?utf-8?B?VkhscUIrdTE1aUNEUkxUcE1lOUZ4a1dZRVZvbm82OHlzRUVoL0s4OG92Tm5r?=
 =?utf-8?B?eUk1VTJoMlI4aHhBN0c2YjMrVE81ZzZicitkc0FKNFE5SThma0pPNStZWjla?=
 =?utf-8?B?S2FieXlkeHQwL1BwczgxQURORWEvMkFoYTVkV1BOTDBsMDk1RXFSaGhZTVc1?=
 =?utf-8?B?ZGMzV0V5bGUrTi9LMWdGQWQ4NnRGN2c1QmliR2tDQit6K0tPUW4xNGIzOUw3?=
 =?utf-8?B?Rk1pby9EWGtqMDRXa0VkeFpvTmVjK1ZNalJlRC8rbDFEWXAvYkh1VDkyZ1Jn?=
 =?utf-8?B?QUJEZTBZV2k2eFRsWTdTR0F5dVJwR0drRHpoQSt5Q3E2dzdlclc5aDlINFpY?=
 =?utf-8?B?cDFPZkczMERscEpTSjdLQlp4K1prektMQWRFa3Yvbk0wQ3JFSkVUOXp3ODN2?=
 =?utf-8?B?T3lUSlBWNFhjalhyUWI0Z0ZzUitrbFp0bksvZmJiUXZjeHBQcXhGNmNVbWNk?=
 =?utf-8?B?TnhWVWd1RnU3SGFINTJKWU5FZHRHN0RmZ3JGS3JEWURBamw5cEJSMkVKRUJB?=
 =?utf-8?B?Y045RXgrbml0aWJ3RGtmcXdCb2ROQTI4S285VlZ5R3dzbDZCbnpHejZxaXha?=
 =?utf-8?B?MmQxMDVRdU1tMlFsZ3BkbURSTVlSNExXSUJHVEwyNGl6NlpoSEZZamd2Z3JU?=
 =?utf-8?B?TlA1Q0tGR2JwenQrRDFNWWM3UUs5YlFyd1FTT3M2WVVVaFQ3QnNIMjFJdkFL?=
 =?utf-8?B?YVRvZ2Q0MFdIYk9PSmJaNkpjMHNDdUZrZENGRjI5dDlLeHZORlZ1VWVROXRi?=
 =?utf-8?B?VGt6bnlQbEZRdUxGdHhnSEJiQjdmRFZ2WW5rUTNNZkREZXNjMCszd2JFczNz?=
 =?utf-8?B?WVZEQkJjS0Evc0t5VE5qMmpaYkZQZmk3QjVZTkpEOGpUUllKcEI1NTJzeGxx?=
 =?utf-8?B?K2FhZkVXaGRhdkJwTjJkbjRORjljWFRNc2o5SWxnazdxbEwrUGlYZW1Vc3p4?=
 =?utf-8?B?a3BWQXhhVGkxMlZKMFNuNDNncWlRZ3Jqa295SXJJZWZyU2xxemlQTVNwRVJC?=
 =?utf-8?B?aWhCZHpMQmduRVdSb2RLdUVMZWlYZXpWck9yd3RGanc5OVoyaWtnSk45bXN0?=
 =?utf-8?B?OXpHSU1WZFdseWFFZGVHTjVhMjJOSCtTTWpGUk1OclFXcGpxVXkzd0ZsR2Vm?=
 =?utf-8?B?ZXZQZzNELzR2bFJDekNYajRkR0RSSkxMRFpLS2xvUUY2RWFWZzBwRE51Mkxk?=
 =?utf-8?B?dnhmdDczcCtNZ1hZeCs0eHdnQmc0N25ZY2RUZUFGdnpRUnFnZm9VeEtBZEVq?=
 =?utf-8?B?WUx2RHNMKzVmYkdKdGVyWVpsckluVGg5NU5TNkJsNE9HNnI1MUU1aGdEbW91?=
 =?utf-8?B?WFJrVDJuUXcxbEM2Yi9LbnNrTFYycVdaelM4N0EvekpIQXppMEl3Nmh4ZlNT?=
 =?utf-8?B?VEV2TFk2T3RncVg5WkRTbFp2NU1mUWRmRmRobGY2b1o0ZFZXNFY3a0ZBYnJG?=
 =?utf-8?B?eUpoN1EzaDZBT3VUbGM1bXhTSURNMFhZVlhxWmhycEtHN0MwZkllVE5wRXJU?=
 =?utf-8?B?eWYzckRldThZdks4b2ZVcG0zdzAwWlFHWmVVbUxseWlGL0NMQVJyTVkydmp1?=
 =?utf-8?B?QW1RK3NOVDUzUkExc2ZHcTg3Mzh4VWEzN2NiRTl4empsSkUvOG0wSDE3K0lV?=
 =?utf-8?B?bThUZmFMclBzdWQwWGovaTBPU3Vwa09uZEVhWDlkNXBJMnpmZDg5bUVXVXRi?=
 =?utf-8?B?K29Qd0tkdUlOSnJjWXBvOEl1VTZJM1hNS1ZhcDRnL1hCWERNNWlnaFhVM2NP?=
 =?utf-8?B?N2owUDRmbXJXQmt0V085U2pGQzREdzBvRjV5UW42ZFp4Q2JZSHFZUDN1Smw0?=
 =?utf-8?Q?t95fXH0eVNTXRAeFmCyWkp4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f32ef96-4bd4-4b6a-9406-08d9f35462ae
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2022 03:03:20.9296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4PFFOxTHVa0mcvy0SqqsfgcCTeVtOkThsWKH0dfoDDt3NXdwD1SqkIH3wv7XzX0tYHCGLTPnk7WizPidhjklng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4887
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-02-18 um 21:34 schrieb Tom Rix:
>
> On 2/18/22 10:35 AM, Felix Kuehling wrote:
>> Am 2022-02-18 um 12:39 schrieb trix@redhat.com:
>>> From: Tom Rix <trix@redhat.com>
>>>
>>> Clang static analysis reports this problem
>>> kfd_chardev.c:2327:2: warning: 1st function call argument
>>>    is an uninitialized value
>>>    kvfree(bo_privs);
>>>    ^~~~~~~~~~~~~~~~
>>>
>>> If the copy_from_users(bo_buckets, ...) fails, there is a jump to
>>> the generic error handler at exit:.  The freeing of bo_privs and
>>> unwinding of the dmabuf_fd loop do not need to be done.
>>>
>>> Add some specific labels for the early failures.
>>> Reorder the frees to be the reverse of their allocs.
>>>
>>> Move the initialize of 'i' back to the loop.
>>> The problem with the early frees predates the loop
>>> unwinding problem.
>>
>> I think the existing error handling strategy in this function is 
>> fine. Having only one exit label avoids potential issues when using 
>> the wrong label. Freeing NULL pointers is not a problem. The loop 
>> becomes a noop if i==0 (this was fixed by you in a previous patch). 
>> The only real problem I see is that bo_privs is not initialized. So 
>> this should really be a one-line or maybe two-line fix:
>>
>>     struct kfd_criu_bo_bucket *bo_buckets = NULL;
>>     struct kfd_criu_bo_priv_data *bo_privs = NULL;
>
> This is the other way I considered to fix the problem. So it will work.

OK. I have already submitted this version to amd-staging-drm-next. Thank 
you for reporting the problem.

Regards,
   Felix


>
> Tom
>
>>
>> Regards,
>>   Felix
>>
>>
>>>
>>> Fixes: 73fa13b6a511 ("drm/amdkfd: CRIU Implement KFD restore ioctl")
>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 15 +++++++++------
>>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c 
>>> b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> index 965af2a08bc0..1d5f41ac3832 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> @@ -2102,7 +2102,7 @@ static int criu_restore_bos(struct kfd_process 
>>> *p,
>>>       const bool criu_resume = true;
>>>       bool flush_tlbs = false;
>>>       int ret = 0, j = 0;
>>> -    uint32_t i = 0;
>>> +    uint32_t i;
>>>         if (*priv_offset + (args->num_bos * sizeof(*bo_privs)) > 
>>> max_priv_data_size)
>>>           return -EINVAL;
>>> @@ -2119,13 +2119,13 @@ static int criu_restore_bos(struct 
>>> kfd_process *p,
>>>       if (ret) {
>>>           pr_err("Failed to copy BOs information from user\n");
>>>           ret = -EFAULT;
>>> -        goto exit;
>>> +        goto free_buckets;
>>>       }
>>>         bo_privs = kvmalloc_array(args->num_bos, sizeof(*bo_privs), 
>>> GFP_KERNEL);
>>>       if (!bo_privs) {
>>>           ret = -ENOMEM;
>>> -        goto exit;
>>> +        goto free_buckets;
>>>       }
>>>         ret = copy_from_user(bo_privs, (void __user 
>>> *)args->priv_data + *priv_offset,
>>> @@ -2133,12 +2133,12 @@ static int criu_restore_bos(struct 
>>> kfd_process *p,
>>>       if (ret) {
>>>           pr_err("Failed to copy BOs information from user\n");
>>>           ret = -EFAULT;
>>> -        goto exit;
>>> +        goto free_privs;
>>>       }
>>>       *priv_offset += args->num_bos * sizeof(*bo_privs);
>>>         /* Create and map new BOs */
>>> -    for (; i < args->num_bos; i++) {
>>> +    for (i = 0; i < args->num_bos; i++) {
>>>           struct kfd_criu_bo_bucket *bo_bucket;
>>>           struct kfd_criu_bo_priv_data *bo_priv;
>>>           struct kfd_dev *dev;
>>> @@ -2323,8 +2323,11 @@ static int criu_restore_bos(struct 
>>> kfd_process *p,
>>>           if (bo_buckets[i].alloc_flags & KFD_IOC_ALLOC_MEM_FLAGS_VRAM)
>>>               close_fd(bo_buckets[i].dmabuf_fd);
>>>       }
>>> -    kvfree(bo_buckets);
>>> +free_privs:
>>>       kvfree(bo_privs);
>>> +free_buckets:
>>> +    kvfree(bo_buckets);
>>> +
>>>       return ret;
>>>   }
>>
>
