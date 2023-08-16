Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E666777E473
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 16:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A395D10E374;
	Wed, 16 Aug 2023 14:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B9010E374;
 Wed, 16 Aug 2023 14:59:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F75boSR6vekVIcUHMOjrc+LsnvZQBjoqq874w7IYOgPBj5hDte2sE65bVBlk8MJOkxbAxi6Y9R0L+SEQGl+u6IGmEvzrx9VeIY4q4BL/QjvZPrkiCy8iAAyEhrcE1hU6bTrMQ8jDs7aIwDRyYWLKC0B8sGboWw8lIU2Hu/13roV9hwGbhrGUW0V1PVC5EXeMhnSqWPueXKJ1HqCr4WRK2BI159IrN7cr2cXhlveqsJLEyGWrsIz+fKN/RIoo95aws9mUNcP5eMfrdJYN8HhBT2VvRNY2QhL+xqGlJWQK+EmJ8VVHoPdeDFideZ5nBBP9R89TLqi+HbrqhMloAgaY1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9djPY9WKKCuYOKyJBNbGXPBnnkrocKKRN/cOAdup9Gg=;
 b=XQEWTZk52UD2Fv1/2N/HKfECcykRjoewGB3NUtKCvTIPl45ZnpXkLAmkI74yJdj7MfmX94OIN3G6auNFCPHc/yPNkCgjK4QvkAXtf9S+yFFxJWP3IqsTL6n6mxHBoD/ZCqlj4hlqDvAva0QP102ZXVwax9HCMb6UwcT7ekdEmkfiJ7sjZZtYHP6FaaSkqArkkp/M2mz4qVhyk86jqvHSqo6omsy9XDwwRSKCeMtib3trlt6giBCj2FYZ35uk2wMwwsSbfXEnq0V3VQgy3+5kwrE1ewyk6EyF3UFlowqgj0G36STUGOSlg7Tf4mXwfvmp1x8vJPDhMNtw+Ctycbjtow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9djPY9WKKCuYOKyJBNbGXPBnnkrocKKRN/cOAdup9Gg=;
 b=u+HOvIzWnQYNP/qkCC7e2FIqNXHAs2EIUQZtIFHnfeA+NLXHNcGSSGLLT56cIFiLNT10imSfGA+btyTQf+8bVIwNTL8DIEkOieP6T/8Lq7vHHgh2bjjH5dP9iS9AK6YWo3YL2c3a11IGOhnDt4Nl9y7/8McxkNx+gCInhX53tc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 14:59:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 14:59:40 +0000
Message-ID: <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
Date: Wed, 16 Aug 2023 16:59:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 516de608-2352-4391-8640-08db9e696ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9NZDyHFSNdXPQSCkQjAnjL9FhNPlVeeJkUlNPNPiTUXlH4M4GS1d1Q1BLfVSdWRriOuxqq+v3tF9LO8gi/j4sko/zNw7F+IC05yFaDTw6iN1C3yLml62KCkUB0IZaQna8fX4kBL6caS+W42wPMf2dRlIu/oX2tF4cvn+yIYHh+H2K5EjVsusgP8lNhlSWAwY+RSgJHgLloXFH19LzfArsYlZ2XnJ/2qRcI2g6cjacSsM6+BhfBmQXFVlxhAl+6tTQ/PA7k1xCQIqh6bIVh1EQ5tk8HT2O6Bdk5SszniKR0haR63ofDjtG+Q3r0yxOs/6d5rY7Pf2i0sM4Mg5SosoDuB23bjgF9qWRbVIkwN29oabiJ7IOAhbivxITA+c0UspgUDXjeYKCuERa3Rso72bWHAILMZPjuGeXB7RyKd+sofBgGv/cAxY22sxuC9LneuYP/q124v6k4tbj9RPVfuVOSXnwM7dK3HW0ROtCy5iKrN3lk+lHer+sXzLUoqZyUsewmCjRIIGPd2tkwUWGP3u96VyugFEh3HQcYhnioafHI4wlXFM9xc84uX9Ffw6oZi7XT5uLJGtHhQuQReXRwrobF7pryi1RRmmNuBLmwixeKJEls3OZWcX40DtbEsaXHxnvnV45QFTlyHMLRE63zFeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(66946007)(110136005)(66476007)(66556008)(41300700001)(5660300002)(66574015)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(7416002)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UklkVUp5ZC80RkltcGFFVXNxa05BMTBPcE5za1dwWW9BTm1FbWJtVjh1QS9F?=
 =?utf-8?B?eDVLMW9KSXhVYitrRVhYeENZNW5kZDgwMEtKblRqZFRsTVppVWE0MDFSUDRO?=
 =?utf-8?B?QkdFbEhjQ09zWmFzZHpjQmM5alRFTzFQQlRqRjZsYk9CbkxseG03VzhaWGVC?=
 =?utf-8?B?UzZqQkF3T2RFWml5WWlNZGxnOXVXNTNzMldnL1o5ZmlRRjVyUHJtM3kvR2Zy?=
 =?utf-8?B?SG9OMXFrR3M1Q2ljQm5HamEwSFI3QzlTd2J2djdGTlM0U0xpWkMvaFcyVGxU?=
 =?utf-8?B?Nm42WWZCbmdmM05Wd3hDNHFPcGp5QWRHNGhGWWNoMnpJMllVS1d6S1R5Um91?=
 =?utf-8?B?ZG5ydERXRXpRZGhEZUgwSytuMkZ5Z0l3aUJ6UXNLRVJ3aXlUM1c2bnVTS0kw?=
 =?utf-8?B?dUc4amh6emxDM0dxSDFKV3plcUJNS1V2bzB0S2ZybmhQNzJ4MVhVSkFWazB2?=
 =?utf-8?B?d3RNZWdDelRZVzF3ZEd0QWZpbmtDWmRaL2pwb1pWT1dPZ3QrN0NFU1Rqb2FV?=
 =?utf-8?B?VGFXZm9PRkFWaDJISStWUEJtMVdBQk9nZHRyMldGSXJNeVUyR2NZT09xVEVE?=
 =?utf-8?B?VVpuYUVRSkpzQkZpbUlsQ3orTWFqWFpWeTYxRUU3bFl1UVN6WGFockZDSDcz?=
 =?utf-8?B?QmQyRk52djlQLzh6cEJmTlI1ZzRESHFRZ3ZqditySUZ3SDlabmNLSG5NM0VX?=
 =?utf-8?B?NUJMMnJMMHZRMExZV0NabHVpdnJVTktlNDYzcm5WcGRkSXVBNWJKcTFTUmU3?=
 =?utf-8?B?Q21LbE9zdyt2RnZGNzZMOGFMYUlPTFpwYXBLTUE2VFI2ZG9rdjFodVdCQVJs?=
 =?utf-8?B?OFVEWjhNajZ4YzhGTXlqdm1SaXVIUDFJVkQ0ZEhuRVFnbzNXekRDdWd3emtP?=
 =?utf-8?B?QUo3RCtkYzhmbmJXUGZEUGJxNjhrSU9PUkZpVmpwNjJpTWFPUGNEVmdUWUNK?=
 =?utf-8?B?cmJCM1V4RjE4N245bG5GRVpydkxhaXJVeEhHOU9QSzRHOUhFMkVGK2dWZ1dW?=
 =?utf-8?B?Ung3TS84SzZNZnpoWWE2NndjTkZkMXYxcGt0eVNKOSswSEc5YUZmb3FDQWFO?=
 =?utf-8?B?Q09YYkFWa3lRUUtDVmJ2NnBLZStLYU5NNG1xQXUzVU5pM0pSQm9TWVV2TTBq?=
 =?utf-8?B?REx1bWpJREFwWUJYZlpablFKT3VXTTJPYzVEdFg4QkVTNW93MFY2WkpjUUlq?=
 =?utf-8?B?V3B3bkRlQmZVQ2tRcjIxY3RibW5JbHd3dXEwSHlQbk03aXFSbnNtdjVOY2hH?=
 =?utf-8?B?cjJCRU5pYUdwdmI1TStIV21lZkxEcGE0elVjYTgvdmptMFd4cWxRSFU3czJk?=
 =?utf-8?B?OWpGOE8vTWFHNkVlYWdLbDh4REZSU21zS2pNQ0gvVDVkcVJVZzAyQmg5b1ZM?=
 =?utf-8?B?M1ZadlRXT1grRHlvZUZrUnBnT1MxYUUvRTVNdGRyMkFUZ1RYbmxnOEZKZXVW?=
 =?utf-8?B?emRnallubVpMbGpSenhlRjBDbmdicFUyZlNQMC9NRWJ0K0RnMWZ2TjU2cjFn?=
 =?utf-8?B?RjRpWGVjMlFvYzdmNTFVQTNRa0xTV3Zwb0VDaTZmdFA4OEZCQjdQZE9LZFFj?=
 =?utf-8?B?ZGp4SFFOZlprVjBqcWFJQkpTanh4UitJSGFOK08xb3FxQm14MCtBMGZzQTEy?=
 =?utf-8?B?RnV5cDlNajFKU25rUE93czNzV1pzZHN0Q3lDeUc2eHVXbWUwRm8veTBIaHIx?=
 =?utf-8?B?NTVmOStyNm9sWmNNR1FhM0JDWWxXZVdBVEZDaDRHK2lBdUUxb0ZTeFN6ZmFl?=
 =?utf-8?B?WkhLMmxucHo4T1c5Y3d6d1dmSTNiSDFadUllbzFaRG5iNU1hc05LT2UvTkVI?=
 =?utf-8?B?M1VrS2pHQUVzVXF0MUp4M1pqRlN2OHBxa2FGNW5PbkRsM0ZWMER2R21Fb3Nn?=
 =?utf-8?B?dkhQbzhXdVFrM0F0aFJqZmpGNW5tTDFyZUw2bXNqVlBiSnJGeS9oY1dSL081?=
 =?utf-8?B?a3lzSXNwK25lNXo0bjFaam9qeERJMThxQjlGdU8zT3RlQjdzVmdYS3NUd0hY?=
 =?utf-8?B?Q2pIQXlHZSt1QTZoeGp5eXA0aWZLSE5oaENLN0VROVhiTW1iR2dxamVhMlN1?=
 =?utf-8?B?ZFgvSDhCaVl4aWp1RmZGOE81YytoQ1d1azR0UEhTQ1RHOU1NcHM0ZlI4bHdz?=
 =?utf-8?Q?NKOOcV4qph7/lhAFpLlms1kYP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516de608-2352-4391-8640-08db9e696ac1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 14:59:40.4984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OHrliV0vSIanEnkbiTzxjkTpbeSvmkXXpG15xHxBQJs7cWnrjYB+Drq3a+4rB5R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.08.23 um 14:30 schrieb Danilo Krummrich:
> On 8/16/23 16:05, Christian König wrote:
>> Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
>>> Hi Matt,
>>>
>>> On 8/11/23 04:31, Matthew Brost wrote:
>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first 
>>>> this
>>>> seems a bit odd but let us explain the reasoning below.
>>>>
>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>> guaranteed to be the same completion even if targeting the same 
>>>> hardware
>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>> which allowed to reorder, timeslice, and preempt submissions. If a 
>>>> using
>>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR 
>>>> falls
>>>> apart as the TDR expects submission order == completion order. Using a
>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>
>>>> 2. In XE submissions are done via programming a ring buffer (circular
>>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if 
>>>> the
>>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get 
>>>> flow
>>>> control on the ring for free.
>>>
>>> In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
>>>
>>> In Nouveau we currently do have such a limitation as well, but it is 
>>> derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB would 
>>> always be 1. However, I think most jobs won't actually utilize the 
>>> whole ring.
>>
>> Well that should probably rather be RING_SIZE / MAX_SIZE_PER_JOB = 
>> hw_submission_limit (or even hw_submission_limit - 1 when the hw 
>> can't distinct full vs empty ring buffer).
>
> Not sure if I get you right, let me try to clarify what I was trying 
> to say: I wanted to say that in Nouveau MAX_SIZE_PER_JOB isn't really 
> limited by anything other than the RING_SIZE and hence we'd never 
> allow more than 1 active job.

But that lets the hw run dry between submissions. That is usually a 
pretty horrible idea for performance.

>
> However, it seems to be more efficient to base ring flow control on 
> the actual size of each incoming job rather than the worst case, 
> namely the maximum size of a job.

That doesn't sounds like a good idea to me. See we don't limit the 
number of submitted jobs based on the ring size, but rather we calculate 
the ring size based on the number of submitted jobs.

In other words the hw_submission_limit defines the ring size, not the 
other way around. And you usually want the hw_submission_limit as low as 
possible for good scheduler granularity and to avoid extra overhead.

Christian.

>
>>
>> Otherwise your scheduler might just overwrite the ring buffer by 
>> pushing things to fast.
>>
>> Christian.
>>
>>>
>>> Given that, it seems like it would be better to let the scheduler 
>>> keep track of empty ring "slots" instead, such that the scheduler 
>>> can deceide whether a subsequent job will still fit on the ring and 
>>> if not re-evaluate once a previous job finished. Of course each 
>>> submitted job would be required to carry the number of slots it 
>>> requires on the ring.
>>>
>>> What to you think of implementing this as alternative flow control 
>>> mechanism? Implementation wise this could be a union with the 
>>> existing hw_submission_limit.
>>>
>>> - Danilo
>>>
>>>>
>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>> kthread for submission / job cleanup. This doesn't scale if a large
>>>> number of drm_gpu_scheduler are used. To work around the scaling 
>>>> issue,
>>>> use a worker rather than kthread for submission / job cleanup.
>>>>
>>>> v2:
>>>>    - (Rob Clark) Fix msm build
>>>>    - Pass in run work queue
>>>> v3:
>>>>    - (Boris) don't have loop in worker
>>>> v4:
>>>>    - (Tvrtko) break out submit ready, stop, start helpers into own 
>>>> patch
>>>>
>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>
>>
>

