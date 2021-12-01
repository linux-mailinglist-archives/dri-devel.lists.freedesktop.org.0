Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0F9464BAC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 11:32:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373E06F9B9;
	Wed,  1 Dec 2021 10:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C22F6F9B9;
 Wed,  1 Dec 2021 10:32:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SrTc5EWVmeQCC1C1uia8cJHxco4xiukyu1SOt+qK1it5u7zuIg1iyhTvDnjDQlXoxlYgKsSA/pA1DCwim43B9yymSUE+ubukmTHbMXDb/b+OoqPOmODdcVm4ocwv/96PaSw9atSF/dCcj3EKzFf9oxDdx7mIfd2akXJKBg6h25hqUadG8nafKfZFkQQ3PZjrKEKcncNWOljzIkO4SQaWkOZDIs+16G2/7Q8EBLX0iYB/sfMJx47UUxY4yLxkwJodsEVzvSpTLsSlkc37jspAj9jPGmHBetshKN1/bFC2VaUtW/Mi3WzYXmQdT6h5S4E4zBdOubgvdEWKIhTfFmNplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUu9y9agBHgY1B2Oz70+jMcaOE/5QusuhkNfZNeDn3c=;
 b=CyhKbg2cHw7MIgbdFFOtXIHJQWyRimyB39Um5CcANJthHpxfOfuF5+7kre8yfENj2Pl/9yiGvY0xrjxJV7zXnGvSrWgBbbSweVNYwzJ08LEP82bFlpK8h5X2q7oI6sQ6MSic2ZOt4h3vWx36yT3j13ZRP6ZjuXcigM19ZfVDIZNurGGLb0KmXFTT2Zn1bEjMhjx5GxI7WKB2pS2gBd1I98wCsP8DqtZjlWrq+xO/k/SOrhYi0Q2iBk7tyzZJsUcEI13L1Nqkb13nyiXr+eaT0ixkApCqPq87BAOUH8myr7BnNveLTHg4fNpphMiGJjaS6ggy6H0rOk5iVVjkAA289w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aUu9y9agBHgY1B2Oz70+jMcaOE/5QusuhkNfZNeDn3c=;
 b=mWHdVmKI0HR/PpCvzn+BOfNXpzIIRrnD/TzTV4H+RZIvQ3GMfqd0aFoyF8uLvMI6mQdcJVdTZwVJPIhh55enUA53979KYWRv+gZ8888Q8cuBzGyhej6DBrf+TYU6pYezgHnJFnOe1wFnxbma2R//B+a2uc91t2e7XnBsDo1FCSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com (10.174.101.14) by
 MWHPR1201MB0191.namprd12.prod.outlook.com (10.174.99.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22; Wed, 1 Dec 2021 10:32:15 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Wed, 1 Dec 2021
 10:32:08 +0000
Subject: Re: [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid establishing a
 locking order between fence classes
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <20211130121936.586031-2-thomas.hellstrom@linux.intel.com>
 <c7502701-e85c-39f0-c249-702d029faa9e@linux.intel.com>
 <b440cfbc-2b9a-1aa2-76d6-17337f835777@linux.intel.com>
 <52a7cf8c-59c7-fec0-2274-d19bdc505314@amd.com>
 <57df8b0b-1d65-155f-a9a6-8073bbd4f28f@linux.intel.com>
 <2551da4d-2e51-cc24-7d4a-84ae00a1547c@amd.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
 <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
Date: Wed, 1 Dec 2021 11:32:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:208:14::24) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM0PR03CA0011.eurprd03.prod.outlook.com (2603:10a6:208:14::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.22 via Frontend Transport; Wed, 1 Dec 2021 10:32:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa9edb0a-032d-4b9d-6a9a-08d9b4b5d3d7
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0191:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0191CA5A3F72DCF0E4C673BE83689@MWHPR1201MB0191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZpVcleBxnna7z/cnINtSC1MAuzQLoCVG2CM1ssvcyF5nrH33pUElcfnILJv5j7Om6IGBOQ1LIquh4AiQGfoJpDii+dsKgm8lkamqzBAr3cLwqJJhEhZtKntPpZtAC4pO1pPzNtjyuodnifGxRcMo5aQSp/xysetGtBhBtGA3uLZH1u7F5dNhZ3/YEIna7MlX7uerUvz4WY2zSv5lYZuone5h/mAawECG6SpJlC2mxDhD8GoWe1GrAWyn0ppTTN6wrJggVQSPP2AF91PF8oGMJ3wfq6hpMlLFNTj1io02+2L+LJG3NJn1hV7lGYDlzNyQbH3cQikc66hMQmMuKinghRBS1FvvFGkSNwJ39GGxb6ci0hW69lVVhdbxtoMwwvfny+G7ZOwjImxshhQoJkIC14m5rNBR0Uhg6/01EEV24xWkQ5Cykjlul6JutCnuJuocPpFWVCY5ZhqTBttjod2xRN9SgbuaPT+Yocn+N3eNC+ITiFSirkg2UPccuZVeNtULNRx2RvC5fRN5kLFJ+bR85lkCiKc6JnfsyvM/FwI/XPS8WC6aWkLlViFiXnUxeRwyoFNiuWCdRESsNbr2I6dogaJGCqs1+uD2WuxvbKWJ1aQRZ8uR8JNsF3FjWDh03ONnUA9twkhSAiF/sJRLM+e2FiEZ4Qy4kDOLS4go0eAu9jQcDIvsWlqRlqSzREGmMqhrJNhztxu8UZB5Gevmvk/s9PRYUi/+M1N4m5ndKkU2OiQNsx8sUGzi9+d7mmv5T4CK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31686004)(4326008)(8676002)(86362001)(26005)(186003)(508600001)(83380400001)(36756003)(2906002)(5660300002)(316002)(16576012)(6486002)(956004)(66946007)(2616005)(6666004)(8936002)(110136005)(66556008)(66476007)(66574015)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXdlVHVlYlhhckxLK1Z4YlFjTERIeTA3WU5WTk05ck5RUnFFcHM1QXpIZjVq?=
 =?utf-8?B?MUt6dkoyeTFOZlBxRmQxT05TR2xRTHZPYXFLbHUwYTdzQlIrRm52Y3lMMnU1?=
 =?utf-8?B?cGVYc0Yza21ZUXdmdDRyZnArVUIwb2MrQzdrbXNCNlJnRll0YzVDcGlOeVFy?=
 =?utf-8?B?OUFBN3M0ZUoyK0Z6NzJjSnkxaHgxM3dwSnBZZzEzS2YxQkpSNGFsR2RSTThX?=
 =?utf-8?B?Y3NtaytnSEhXMjkzL1Mybkk4RjU0WkdkZFNiV1hyeFBHZWF6NkcxNlpqVWdo?=
 =?utf-8?B?eVFaWHlwWmRiSDU1Wlp5UFMyZS85MkRRbUJMQVJNYzRJOWt1Qmk5QjQxdzhB?=
 =?utf-8?B?YXFoV3VZdWZtc2hhVGZwN1prQjAxY0Ftc1p3Njh3N3crQzFERmxZaE9MOWlp?=
 =?utf-8?B?UDFHMHY3cFY5SU1xNUQ1OGtjaUU1M1cxZTVXZ09hTkg3V1ozNXFma3E0NXEw?=
 =?utf-8?B?QVhhWUxqa2R6UERLc0pUVzhRaXBETTcrdEpmSzJ5bDd4MHpNNWpGWURvMlBM?=
 =?utf-8?B?RzY0MG5iODdDWmU0OExjN2FvQ3BJWnBnR2dpR0JmQjI2OXE4UFNRYzFneEtF?=
 =?utf-8?B?WmFyQ0dQZEcwYmxLMU41R25mWGI4YTBYZ3hjd3NXQXJ3VnMxMGVOcUdtZWI1?=
 =?utf-8?B?OTZTUXNSaHQwVHRzWEFBSFZkYXFqZTl0QXk3WitzSEc4ZWhGcGk3VWRQa1Fy?=
 =?utf-8?B?TnJCZ2NlbkFSVWxNN1ZIVERUVFpvdkVHY3JpdzVQS1EyR295elR3Uk91cjZY?=
 =?utf-8?B?ZGdyUTh0bEE0VDVNbDF6MjN2SFI1RHl6RnlwdXgra0k4N0ZIWDU0WWVEOFVa?=
 =?utf-8?B?TnFpNVdSa0dOSHo2SzVCcWtiVHp3am0vdnB1YzRDdDVUZC83dlcvcndYNFRp?=
 =?utf-8?B?T3RHK05ET3BJdXJINUl0cmlYQmN6dVZOSTNNNlpYTDhBbThoTzVlUDhRMGtl?=
 =?utf-8?B?akpuUVNLUEFObk04OWQ2N3hPTURGMmhNWkVxSEh1OXRQcDBhVStuWXNTSmlX?=
 =?utf-8?B?d0tteldZNWUrbDIrQlQ4ZGhabVdXMjJZNnZvT1cyVHBrUHgvUDNpMVR1UXBP?=
 =?utf-8?B?UGF0VE1kakJjdnJFa3dTVjdaZVNJb2VBeHB3Z2VsblRrNU8xSDBnYitnTDFQ?=
 =?utf-8?B?QzJ3ZUpLLzNxblpYd05MUFcyc0Jkb0k0aSsrN0JqWlM0WGoxSVFDU3dyTG0x?=
 =?utf-8?B?R3MzVnI4T0hYaGduc1JnV0tYTnVvY0FxZ3B6MHBMQkE1dHJtVU4yOUxQTnRN?=
 =?utf-8?B?YktoTFJuZkRYWmdya3VZVXNibXBucktZaE1hWUY5aHdBb3VKSWZhaUlGMk5C?=
 =?utf-8?B?QmFxVzhBdC8xbmpJNHIzeFlXOEpITjJUNkNMY05ib1lESzUvZktmVXVmTFpH?=
 =?utf-8?B?RHhBL3VGMk9OcnlUY201ZEVKbzk4cVJyS1poa1gvR2xTNGl0aks4L1pxbFdN?=
 =?utf-8?B?emNMYzRBSnl2bmhtWW80OGlZc3B0eTZ4NzJGcHo0U1IwVGw1R0N2QSs4VjZF?=
 =?utf-8?B?ZnFxQXJGWFh5ZDBzd1l3NFhObXNSZHNjZHVzOFVxSk9vV0ZGbTlxN3VHT1BF?=
 =?utf-8?B?aDk4K3FMVDZKODNTRk9JeGc3U1lmVlVrR1dVTHZpUlZQNnUwMVJjRE9vOFN5?=
 =?utf-8?B?Q3piV242cUNuRFFic1VPbitmL3prK3lYa1BSeDBuRDhNYlRHUE85eTZUcXBW?=
 =?utf-8?B?WTgwUStpcFNYQVBqWXRKUFI0dHVsOVNSTXlkRmlSV0psMmo3WVU0bkhLQzVO?=
 =?utf-8?B?Wk1DTDRZSGxPVnVzQXlFcHh5dDBaRm41SEVuWVlQempPL3FodHM3Q2w1NnZs?=
 =?utf-8?B?QzhaNDA4akdwSmk5b2lURnZ1ank3cUlPZEliM2Uzanp0c09uYm9PQm9zYkZk?=
 =?utf-8?B?SVpPRnJPUUZ4YlpOTkRSemVDMXZaRnd5SSswVjFZK3JJdTlCWTVmTnJtTW5Y?=
 =?utf-8?B?S3Iwc1JGOU9mT0pTSlVzbEtZSU9aTTlIYmNOSk5Sak1XL2tWNDU0WmFzRG1M?=
 =?utf-8?B?TGNVWkszc0R6OHAvblA2QXpWOHpZU2ZIMEc0Q3NjNmRNQzh4T0dMT1dIUURD?=
 =?utf-8?B?RFFUODB5Wi9sVWM5SEZyd1JwNWpCdzE0YU1ERmR6d2xzSmd0QzZNQmp1Q2Nq?=
 =?utf-8?Q?LKjk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9edb0a-032d-4b9d-6a9a-08d9b4b5d3d7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 10:32:08.7495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDS81bEY7I8AD5YMhyH3N6qkUoCRObJcWILngXLge3OtPFGRSJdIow17dNtjDQw9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0191
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.12.21 um 11:15 schrieb Thomas Hellström (Intel):
> [SNIP]
>>
>> What we could do is to avoid all this by not calling the callback 
>> with the lock held in the first place.
>
> If that's possible that might be a good idea, pls also see below.

The problem with that is 
dma_fence_signal_locked()/dma_fence_signal_timestamp_locked(). If we 
could avoid using that or at least allow it to drop the lock then we 
could call the callback without holding it.

Somebody would need to audit the drivers and see if holding the lock is 
really necessary anywhere.

>>
>>>>
>>>>>>
>>>>>> /Thomas
>>>>>
>>>>> Oh, and a follow up question:
>>>>>
>>>>> If there was a way to break the recursion on final put() (using 
>>>>> the same basic approach as patch 2 in this series uses to break 
>>>>> recursion in enable_signaling()), so that none of these containers 
>>>>> did require any special treatment, would it be worth pursuing? I 
>>>>> guess it might be possible by having the callbacks drop the 
>>>>> references rather than the loop in the final put. + a couple of 
>>>>> changes in code iterating over the fence pointers.
>>>>
>>>> That won't really help, you just move the recursion from the final 
>>>> put into the callback.
>>>
>>> How do we recurse from the callback? The introduced fence_put() of 
>>> individual fence pointers
>>> doesn't recurse anymore (at most 1 level), and any callback 
>>> recursion is broken by the irq_work?
>>
>> Yeah, but then you would need to take another lock to avoid racing 
>> with dma_fence_array_signaled().
>>
>>>
>>> I figure the big amount of work would be to adjust code that 
>>> iterates over the individual fence pointers to recognize that they 
>>> are rcu protected.
>>
>> Could be that we could solve this with RCU, but that sounds like a 
>> lot of churn for no gain at all.
>>
>> In other words even with the problems solved I think it would be a 
>> really bad idea to allow chaining of dma_fence_array objects.
>
> Yes, that was really the question, Is it worth pursuing this? I'm not 
> really suggesting we should allow this as an intentional feature. I'm 
> worried, however, that if we allow these containers to start floating 
> around cross-driver (or even internally) disguised as ordinary 
> dma_fences, they would require a lot of driver special casing, or else 
> completely unexpeced WARN_ON()s and lockdep splats would start to turn 
> up, scaring people off from using them. And that would be a breeding 
> ground for hairy driver-private constructs.

Well the question is why we would want to do it?

If it's to avoid inter driver lock dependencies by avoiding to call the 
callback with the spinlock held, then yes please. We had tons of 
problems with that, resulting in irq_work and work_item delegation all 
over the place.

If it's to allow nesting of dma_fence_array instances, then it's most 
likely a really bad idea even if we fix all the locking order problems.

Christian.

>
> /Thomas
>
>
>>
>> Christian.
>>
>>>
>>>
>>> Thanks,
>>>
>>> /Thomas
>>>
>>>

