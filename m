Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E16F5748
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 13:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709DE10E280;
	Wed,  3 May 2023 11:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA43E10E280
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 11:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2DnrT8PkPkvLi8sPzOaU/3cM/oOl5JzDknFjcE9rTz+2O+bHwvFdWnB7p/cH5x5Cm77gtilTI4ThJr4Gos3nXP0/wUTb8sppx8xiDpuPI9Q9mQ+NB/62pw7di99OJ77kWne9jva+D/SpGJfQxmqi0SvIAGnlt5XWyzoHu/jszyCOxt8umx5TUCgf2ctDpunMUA+6bVklekUc5J3J6/kij3VLSeDAvrYvuc9JR/AZiRTLteRxQKH9yomwNr/VItsHKkBg8SuUsp0L5j+tLr07UcaGwLJgTYXa4NSWtu+9TLOBQ5k4Q/EBGn9pIatCqxqwcw+UbN15Uubf+gZpNtJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ib3SK/fodF51Llj9JUVDVPAgjvD1Ce/Ka6FTWsGxKU8=;
 b=AdxSWnGizk/JfVXyJvnRdnPgbivh3jy5pnPU0/ZyPtymO3FenoyWvEJhafZTghLZIciMJjl5YNJ2VqWltmE4k8tSVo53BI7+bJi5YDkh58gdhsWQxEFjKhj1s/wiuypcWIWzUDl7HdUq79CkJLhum6TdRaj1ZJzh+kSxhpHsOGEFI8imwxSBFazpja9KePsIxqUeADrLkNBXH6/tkKhiaYf6KuXV6fnyBplZR19yBl6UbEZmVAa+Tj7fsVYzFpN9yc1BAHzmAItHcooDMkHTknPAyZTq1ogIzEoR454V1bty8Z3a7F3XWULg8xM1RlkGzDQICGXP3A4xYnfZVF28hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ib3SK/fodF51Llj9JUVDVPAgjvD1Ce/Ka6FTWsGxKU8=;
 b=v520TiA5Hadpv9MXs4Xcg1nFzVYWurXdDFblYpEaAD5rZzKLs875ZP2bGktZawhgSoiPyyDp0aErvlVcbd/lMZtP3wW22NeG+0O3z8gSg66dtjeVNaNUhaUowmFJvU5JTD6X9kOabozd5KQ0fkDTp+3PqRUqntZMxFIwwwDphvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5094.namprd12.prod.outlook.com (2603:10b6:208:312::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 11:40:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 11:40:56 +0000
Message-ID: <420b8443-912e-b942-fadf-f80b57998014@amd.com>
Date: Wed, 3 May 2023 13:40:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
 <20230503101624.5dbae57c@collabora.com>
 <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
 <2ff0d221ed6033bd03c30fdd25abd2a41fb06fb2.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <2ff0d221ed6033bd03c30fdd25abd2a41fb06fb2.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0186.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL1PR12MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1e2016-cadf-4a08-2b5b-08db4bcb41f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FNKGYMbnvhPTvsySIccUB6VY8cHEvYi0Vgityx+6Wlq03K5iiK7aiENiEG8Cri+A0pEjCcEtGCjCn4/jm2ux6xJaxzqWcJADSFkyL6c+/oMO8TVlGgtrWBD5euEgqW/JjtqaFJX+rNIx6EiqBr+jY7aQjgP+PBFnkhde75V2TtUaVFhc4ySQlrzP+kv9bx1MgFuEi4eSlynUgdWIDMr3to5wXtrC5+6LoufyyMr6H4vGsfBgTd3GacD+aDt/K5Qg7xjo7bJxYrG36jvXyN275lRqudLpssdja+vno1YoZVDpFws5q6CIBS6VDoyOxOEV67v2RXgZB7rdNmwrjME4lNL1obViqzmaKWcaAoMFRdX2oIGX36HY5fgr3y9Vd9o48a5ld2Pcb36FFbCMhRbclb9s/+E6zhF+xe2U4ABKQ5mmTcIlk2Tdm+EAVSaT27Swsz/QKwA+6fTRVi0kVmabFCbpIL0+c9W2vLGSq3ZM9QuS6F7cS1mbM6nf1gGTsFdQuTicEkQG5HRtGaKwb3AIXCAhDM4ISISkQFuwsV8PvO/3zr3o3yij8+EfuPc5wDIIbqVeD2ijdhvTb3sxdTrXLldHnbfp+WKQ2HbWEYzfG0j1P6eRfjHyOCp5HV0kaVTetsPVPl0VV4l9xtLDOu1WYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(8676002)(8936002)(6486002)(31696002)(6666004)(86362001)(4326008)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(5660300002)(478600001)(38100700002)(2906002)(31686004)(66574015)(83380400001)(110136005)(54906003)(2616005)(6512007)(6506007)(186003)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzJnUFdrTnpPQkEvb0lDczVqN2liY1FmMWlLS3lUdGFSL3lkUkFtUDM3Wks4?=
 =?utf-8?B?MEw4bmJDMlJQZ21HUTdLMEJORmdpOGF3RU1QbGlVZ1JaK0xYU0ZBSEpFZTJQ?=
 =?utf-8?B?SmNqbmcrTjFhNUhwc1BMYmlxV1p0Wkh5UExOL0Q3cWUveDJNcFdocTJ3NU5X?=
 =?utf-8?B?Y0cwNFJWT1dCa0tkOUtRV2dyWlpoWkdySGIxeExMWFBIMVh1NmFDYTIzSFdV?=
 =?utf-8?B?QkpBYnQ2YXJjOThNZDQ3VmxWcFhGeWxrMXVkend2ak4yVW5LVjNXcG5pTDRp?=
 =?utf-8?B?UjYwcHB3VE1qNFViWWpLWU04ZXlta3dpK0hDc21WUlk1eUNnK3Q2YWV3L3pU?=
 =?utf-8?B?bERMb3lTRW1CNVh1QlU1eVhXUHdZcHJjLzJUUW4xbXZ5QS9Cb2FNUVVjaUp0?=
 =?utf-8?B?N3NIQXliTGZ6TFptYlEyaTVxK0dUQS8yK3BRL2VhaHJtMlVzUjNrUitNbmc1?=
 =?utf-8?B?VkhvS0E3WDZmVE9OcndMS1gvbUU3K0lvTzAzWSs3VUYvU3VkTDVGTjlpWEE2?=
 =?utf-8?B?d2k1N0lSaDVXMGJtd1BCeDBCM1pqNGp0d2ZCUDdXRkE3MUlKN0lsRUpUcXNj?=
 =?utf-8?B?U0dSV2M0OXFVK0Q4aytSSUVDM25Zd0JocHBtVnNzRWIrVlc0MGwxQ3BIeFlw?=
 =?utf-8?B?aGdOVFFqcXBlRjVnU1VMQmZ4MElpYmxZcXJHMnoxUGtnM2RFVjg4YllmSVow?=
 =?utf-8?B?aUNXNjFBUi9xc1dkMVZQVXZqNVBiYW1kUmpmTDFCaUxkR29sSTU1Qm01c1VZ?=
 =?utf-8?B?NFB6bXlOTDYybXhjU3RjS1M1czgrSVR4cjVURTcvSUdXSXk4SkMrLzBTb3du?=
 =?utf-8?B?WnB6OXhONHRMY3ZhcFBSQWc4QUExd3F2RVpBZjlPU1dRSVJxL214eWhXR2tx?=
 =?utf-8?B?cUNiMzBnY1I4THZhcU83UWo4c05Wb2cwdTFUSnhrM2FLWEpxVExudXIzZmNK?=
 =?utf-8?B?eFZGZmJRemVBdEVzZk9TSHFERGdJdmlYZTdRVVFmOGtsMDZqTTdIUFQ4QWRt?=
 =?utf-8?B?WkQxandKNU9Mbm8yeC9WdDZlQ1ZuZXlvV1V3bEVwRlpNSnFtQ085WHkyVEhD?=
 =?utf-8?B?eUFuNjVLZWRyeTBXVUJEZmxiZVZsazNUeFZROVF3Ri9GRWtzTHBIOW9qQ3lX?=
 =?utf-8?B?Wi9naktSV09abjY2aS9KUFArbng1Q2IxSVdwRWcvRUp6aUR5YURONHMyU1JW?=
 =?utf-8?B?Q205OWw0cGxxVWNpTWdvVmN1TVlrTlRsQlQxMDZmcjcvQjFPYmlrK3NsYTd6?=
 =?utf-8?B?OTZ6RktweE5rZlFMTXpyRW1KbE94UGR3aGU5TnpQajNlM0h5c2N4aVp3dkM1?=
 =?utf-8?B?U3JKSUpXTTdnL01mZnkzQjVFOWZVWnVVTEdhSVBHZUtVVnlVVnhiQ0FWbHBJ?=
 =?utf-8?B?cXFLMng4Ukp1WXEwekl6UHdFRENOTzBCS1lBNUYzb1JvU0NGY0NVcFdpZVhs?=
 =?utf-8?B?QTcxcmVoYUlrenJ2UnYxa0QvSUtzZllkRGl4UHdZQ245MjVlNmh6ZlZVcFVr?=
 =?utf-8?B?a3IyTVk2RSt3bnlwN0pRNDBOb0tsTzdPWXZpb2w5bmJVa0xDL2pHR1FmVVNu?=
 =?utf-8?B?Y2IvZEpNVlhndzhOUGlkd3hyY2E2TWErajFESFAyalFmZ3BKM25ic3lMK1Bn?=
 =?utf-8?B?QWNNWm1UT1lyZ25kb2V3aytaOUREcTU3NXpVK3lrMDJOeXp1N1pBZnhSZC9H?=
 =?utf-8?B?K3BQU1d3M3BqeW1DYmJnZ0RMREJMRlloTTMzRkdhVXFaUXdNNklhVVBUQmZK?=
 =?utf-8?B?dUVDMldtUzV5OVlGRkdFUkhEZEsvL3dFNHhYZWkwTkJvbWhpSUk5UkxxaXRh?=
 =?utf-8?B?bFN6ZTh4bzlXc2kzOFdwL3VOLzU1aVVUK09TcGNEZ3lhbmRJblR2QXVZdU1T?=
 =?utf-8?B?dXpGTXlpWGZuRityYzlPTUo1bTg4YXMzOUVhMUNLMW93ZTNoMkxsRGNKTVhT?=
 =?utf-8?B?bDEwcENBcWpid0F1NEs1NEFoRUdIYnV5clFiNnhXR2QvWVJ6bkhTUTlENG9j?=
 =?utf-8?B?NWpkREtnUitQU2JyS08zcm9XY1NMTzNYZlp0WXBNN2JMWnlKR2YvcmZOMzhC?=
 =?utf-8?B?RE8yb3JVZnI4Qy9VWHorUjdKSy8zUDV0V2RRbjJKTWd2TGxzS1pRNjRFM0E1?=
 =?utf-8?B?a00zbURZeDZxeXoyR3I5eVhDRHdRaHhkampIYUJER0hxZnptaVprZVZEdlpK?=
 =?utf-8?Q?cfk0Bxs3PHhX7CKV1kEd5Da20e+cOZBo4fe+k/zZXCZr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1e2016-cadf-4a08-2b5b-08db4bcb41f8
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 11:40:56.2670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuuUROgqOhNQmLjj6cK5tS2lYnK/ovjE6pttVXf1KNOxKVNvUBy7+5x5yL04mi40
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5094
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>, Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

Am 03.05.23 um 12:28 schrieb Lucas Stach:
> Hi Christian,
>
> Am Mittwoch, dem 03.05.2023 um 10:47 +0200 schrieb Christian König:
>> Adding Luben as well.
>>
>> Am 03.05.23 um 10:16 schrieb Boris Brezillon:
>>> [SNIP]
>>>> To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}().
>>> After the discussion I had with Matthew yesterday on IRC, I
>>> realized there was no clear agreement on this. Matthew uses those 3
>>> helpers in the Xe driver right now, and given he intends to use a
>>> multi-threaded wq for its 1:1 schedulers run queue, there's no way he
>>> can get away without calling drm_sched_{start,stop}().
>>> drm_sched_resubmit_jobs() can be open-coded in each driver, but I'm
>>> wondering if it wouldn't be preferable to add a ::resubmit_job() method
>>> or extend the ::run_job() one to support the resubmit semantics, which,
>>> AFAIU, is just about enforcing the job done fence (the one returned by
>>> ::run_job()) doesn't transition from a signaled to an unsignaled state.
>>>
>>> But probably more important than providing a generic helper, we should
>>> document the resubmit semantics (AKA, what should and/or shouldn't be
>>> done with pending jobs when a recovery happens). Because forbidding
>>> people to use a generic helper function doesn't give any guarantee that
>>> they'll do the right thing when coding their own logic, unless we give
>>> clues about what's considered right/wrong, and the current state of the
>>> doc is pretty unclear in this regard.
>> I should probably talk about the history of the re-submit feature a bit
>> more.
>>
>> Basically AMD came up with re-submission as a cheap way of increasing
>> the reliability of GPU resets. Problem is that it turned into an
>> absolutely nightmare. We tried for the last 5 years or so to get that
>> stable and it's still crashing.
>>
>> The first and most major problem is that the kernel doesn't even has the
>> information if re-submitting jobs is possible or not. For example a job
>> which has already been pushed to the hw could have grabbed a binary
>> semaphore and re-submitting it will just wait forever for the semaphore
>> to be released.
>>
> I can follow this argument, but concluding that job resubmission is
> impossible is punishing simple GPUs. On Vivante GPUs we have exactly
> one job running at a time and all dependencies are visible to the
> scheduler, as we don't have/use any hardware synchronization mechanism,
> so all synchronization is piped through kernel visible fences.
>
> It's reasonably easy for the etnaviv driver to find the guilty job to
> skip but resubmit all other jobs in the current hardware queue. I'm not
> really fond of having to make all applications deal with innocent
> context resets, while we can solve this via resubmission on simple HW.
>
> I know that more complex hardware and use-cases might still require the
> kernel driver for this HW to give up and shoot all contexts active at
> the time of the GPU reset, but that's the price you pay for the
> hardware being more capable. I don't see why we should also pay that
> price on really simple HW.

You can still re-create the hw state inside your driver to continue work 
from some point if know that this will work.

As I wrote below the scheduler component can even provide help with with 
that in the form of providing all the unsignaled hw or scheduler fences 
for example.

But what we absolutely should *not* do is to have this re-submission 
feature, because that requires re-using the dma_fence objects. In other 
words this dance with detaching the scheduler fence from the hw fence 
and attach a new one is what absolutely doesn't work.

>> The second problem is that the dma_fence semantics don't allow to ever
>> transit the state of a fence from signaled back to unsignaled. This
>> means that you can't re-use the hw fence and need to allocate a new one,
>> but since memory allocation is forbidden inside a reset handler as well
>> (YES we need to better document that part) you actually need to keep a
>> bunch of hw fences pre-allocated around to make this work. Amdgpu choose
>> to illegally re-use the hw fence instead which only works with quite
>> extreme hacks.
>>
> I'm with Boris here. Could you please explain when a fence would be
> already signaled in a GPU reset scenario and would need to go back to
> unsignaled, so we are on the same page here?

Take a look at how this re-submission feature of the scheduler works. 
The approach is basically that you detach the hw fence from the 
scheduler fence and then attach a new one.

Either you re-use the hw fence, violate the dma_fence semantic or make 
sure you can always allocate a new hw fence object. Basically you can 
only choose between evils and all of them suck.

> Also the no memory allocation policy really needs some documentation.
> Currently etnaviv may allocate a bunch of memory to create the
> devcoredump before resetting the GPU and I don't believe etnaviv is the
> only driver doing such a thing. The allocations are set up in a way to
> just give up if there is memory pressure, as getting the GPU back in
> working order is obviously more important than writing GPU state data
> for post mortem analysis, but I also don't see where else this
> allocation could be done.

Well doing some optional memory allocation for devcoredump for post 
mortem analysis is perfectly fine. If that fails you can just write into 
syslog "sorry can't dump because of lack of memory".

But what we can't do is to rely on memory allocation for proper 
operation, e.g. something like "I can't get the desktop working again 
because memory allocation in the GPU reset handler failed" is a no-go.

>> The third problem is that the lifetime of the job object was actually
>> defined very well before we tried to use re-submission. Basically it's
>> just an intermediate state used between the IOCTL and pushing things to
>> the hw, introducing this re-submit feature completely messed that up and
>> cause quite a number of use after free errors in the past which are
>> again only solved by quite some hacks.
>>
> Isn't it still well-defined? The job object lives until it's parent
> fence signaled. Pulling a unsignaled parent fence and attaching a new
> one is not a problem.

Yeah, problem again is which parent fence? The old one, the new one? How 
to prevent racing between fence signaling and job timeout? Can we 
cleanup the job from the interrupt or atomic context? (Turned out no, we 
can't).

The idea of the job object was to give the scheduler something to work 
with, e.g. you push it into the scheduler on the one end and get it back 
on the other end based on scheduling properties, dependencies etc... 
Initially that was even just a pointer to void.

The hw fence then represents what's currently running on the hw, with 
timeout, resource allocation, etc...

If necessary the driver can even use the same object for both (like 
amdgpu does now), but the key point is that this is nothing the 
scheduler should be dealing with.

Regards,
Christian.

>
> Regards,
> Lucas
>
>> What we should do in the GPU scheduler instead is the follow:
>>
>> 1. Don't support re-submission at all!
>>       Instead we can provide help to drivers to query which fences
>> (scheduler or hw) are still not signaled yet.
>>       This can then be used to re-create hw state if (and only if!) the
>> driver knows what it's doing and can actually guarantee that this will work.
>>       E.g. the case for XE where the kernel driver knows the contexts
>> which were not running at the time and can re-create their queues.
>>
>> 2. We can provide both a wq to use for single threaded application as
>> well as start/stop semantics.
>>       It's just that the start/stop semantics should never touch what was
>> already submitted, but rather just make sure that we don't get any new
>> submissions.
>>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>
>>> Boris

