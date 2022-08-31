Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE45A7EF5
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 15:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619C210E3BB;
	Wed, 31 Aug 2022 13:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF7A10E3C7;
 Wed, 31 Aug 2022 13:34:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIoKETf0Smiexq/wyfflxiGslqc3psj4zHrzFMWA3s/bLATT30R6r7CK09lK97bdRyGRz/1LduPqoFOqGiV0Ctk+oPUYnfyrE7npMloBKOHKBpjKxgZF+m1Q7miTRsURROaoZdiQpKadq0po6AW428Zzd6p4My4O+XQUE/m7r+L3FE/lVEepKMJgjfNWPiolU2zc9HAJCJ39vacTrdviE/Ri+XBztLqn5ZvmT19cJazn1vlysrNgVn6vOjX67TGPsQpmXx6/hkcJyGE5E2Lsfdwe86cn9V9ZMVwzRDn+4tRkCA/cCp96t27A+AL5YeFRX3Vi5PPcsy+XYsHrsYloFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zheT2z10dx4kCEJRQcRjmvABLsOlvHqYCEix0rhOwB0=;
 b=jllRaFg1595Gb9DPGpGf1tN4PAKtd2HTZlsCbt+I09xRIPSj1bKB8KLRI5g9oyLa9NuVLzeXLBirZjmaoO4uAvpYMvexpY5LMgZwkYd3LygCZGDK2xzt6W195fGNPsRGZzEHLzMTEJO5hqgOBtFdN0WBeQxCQS63ppsa/l05oKCeKpFwKM05dRUTBotgAC0Q2whpwhnLw5nSYVTS+RhATuykOkM05bl471v+qNfvZqVn/7EA84lTL9MsnyFi6R8F7lK/e1GCkkUBcLm0ZhnRJZ9/TB58Nybmv9f13FTFL8L0WdHCoEN9TyPdhkqOMWtpLsHvPmupG44Q1OWruC0FdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zheT2z10dx4kCEJRQcRjmvABLsOlvHqYCEix0rhOwB0=;
 b=3/fVajjs7KwEUk4wSXChY9JFvy+Wk2lJtdxTNX5E/Ww7GHcGdPq2cZ9/aET3+oJzO3dDHQ7zM3dpGhJl4YSe2PF23YgQKMW0ra7tuHV98TqW/DkuyfDTSsish0I5uYx7Pwa2iJSXStXuZqU64TzughlfglcbWPyRRbU5HeTrHug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB5452.namprd12.prod.outlook.com (2603:10b6:510:d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 13:34:38 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 13:34:38 +0000
Message-ID: <06f90d85-2f31-e815-fd5a-f19af141df63@amd.com>
Date: Wed, 31 Aug 2022 15:34:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] drm/i915: audit bo->resource usage
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20220824142353.10293-1-luben.tuikov@amd.com>
 <1de21f6e-4b11-ee9b-1b54-fd67728766ad@amd.com>
 <cc4c59ad-5d69-b174-5464-bd9896459169@intel.com>
 <ce090a95-a822-5079-7b86-0c949e98cd64@amd.com>
 <3f3715fb-1f2b-83a5-bff7-6e06164e5546@intel.com>
 <9c7cc7ea-dd30-6df5-3f06-97a6c6d254e0@amd.com>
 <55d88b45-6986-de38-d574-d0ce7d06c62e@intel.com>
 <1392ea7c-88a3-9a56-1ccb-e2f16cd55f72@amd.com>
 <303ae81e-d9af-6912-8cdb-c881015da634@intel.com>
 <7047e694-997c-2082-48cb-f9f628c40183@amd.com>
 <50b37045-87de-04d0-7464-afcb5f9a2a0d@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <50b37045-87de-04d0-7464-afcb5f9a2a0d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0402CA0014.eurprd04.prod.outlook.com
 (2603:10a6:203:90::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a224ba3b-b497-4192-5ace-08da8b558d05
X-MS-TrafficTypeDiagnostic: PH0PR12MB5452:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BVvxGR86G7msC/vRVLSc940WM/v+vrQzBLiGHdTn8OQJ8KyWIOAMlXNMSqsIBmImHQ3cV6TGFuJRIoEfxB6kcgjjjNHbulayhe5cDCuDMyW+RnkizOowLPuFKGAWqKR/eto6riGTPxk/LRyHSjJQQuXYoxmlz7a4f44MO8ucioVL5h0yR5QMhWP0RUyIWdJIikJjPw22SnkOc1jjbVT794tVo8ynwoveGq0ueXGp0MuhYhx8nIhMzRnurhv3uIlUkIvttzCzTTR2uukakgX3mCB9zE8PFg7vUtqBCxrNFahf7oo0ZYit038m+U6g+BHW17t0b7e3Vz+b3qBWgJ2AFHmnBGBmLkxUesxiDwzxJ0/z7/sjC4271+vZPwSejKflJixlapZxyml9ubywinjq7SirhMUPnDBM9ZvYOM5qNvdK/gO2vhvWGT1aZI0IOoMoMgnCkZM1x3Zl7cxO2ZsmZ5NWOElvnBtWXRoQaRPapcj/uOZ28u3ro93VMV5D8XT4C8AdR1+NBbruz+5i1GL6xrMMJhulQB+d9YqNrr1uoigORVJomqqQMnQlrM0nTyuViRnhG2jl4tZ4dxG/WBP7Pu+IjrWgRXhYpe8MtsPM0OMQ78W3SfDCOlYeSOXAQMRh0qvsyWWrxjGdjG+L/P13+MlPAF4JMXMdqzQ1fdi2BnbPAey1IvJ9r4SbWnRHU3AosdXb5aXTAfAA/7zGxIDG5vZRmr80VRkspWSG86B6P726XPu0gyQp21cQI++d6kwD78/9FXIGl5MIUJrvEShRFeL5XaUe6w6k8OqRG9evZlc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(6512007)(6506007)(53546011)(83380400001)(66574015)(2616005)(186003)(86362001)(31696002)(38100700002)(31686004)(36756003)(5660300002)(8936002)(4326008)(8676002)(66476007)(66556008)(66946007)(2906002)(41300700001)(478600001)(6666004)(110136005)(6486002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajArZlVQdDA0R1RIaVM4Zzh2YlRhbHBEdkZteGlYS0c3V2E2bThrVmIxbStL?=
 =?utf-8?B?V2k5Q1V2bkhVcE5MVUtpVFNmb3RsdGZOWHpIbnFhNHBhZ2hoSys1S3g5S2ZJ?=
 =?utf-8?B?RDd4c0I0MVNFWUl2ZWFrSUZFblFQL0FhS28xaVJPNmFyYmJmQzlaV1hqOHQz?=
 =?utf-8?B?cEIrQWhLQ2R2OHpQbzVMR0JKOXlkSTg4a1F2YXNPVnFEeGhTbFlmSTVLWGZw?=
 =?utf-8?B?WnhkdDVmeE5GMnQwQ2gzY2Y3MlNJYjZha3g0TEdub3NoZ1lFNk9QVGIxcWZ4?=
 =?utf-8?B?eWRFMm00U1FmWWJwK2s4WVEzaDR1aHh3a296WmdIOSt2LzFBTWFmTmplTEtx?=
 =?utf-8?B?a2lGT3IvZW9VZ3puQ1M4VDhvT3VnYWJYSm9BcHkyK0VZS3VBYXM3T3RSYTBN?=
 =?utf-8?B?N29EU1JIbFZpelVNYUxOOHNkdnA2OVlEL3Rub0ZMVlNsM3NFMDN5YXpZWTkv?=
 =?utf-8?B?Wlh1VTdtRDhuVC9rU2NjMXJYS3hZYlVtUFByMFo2WGhYZEdVWis0MGpZcFJH?=
 =?utf-8?B?RjEwelBQSWZ5NTJSNzNoS0tHaUdoQnNhZWVQc1hMRUt1T29CQUJ6NnEyRTNF?=
 =?utf-8?B?N3QydU1jTEhmRHZIWm9qNEpMSUE4VW1xaDhUL05iOGJPZkR3WXVSKzFCbFNB?=
 =?utf-8?B?MCsyb09GR0ZNRHN0VFc4b0Rsc3MxZW5MOHZlM042RXg0N3lLaEhlZVpiR0Ey?=
 =?utf-8?B?WjJDVmtldDM3TUU0NHErMWpWUXpqdHhXSThHYi9ZSnFORkF5ZEczd0xYZjl0?=
 =?utf-8?B?UUpqOFVKY0F3OEpDd0VQWGVOUW9zVEg4VUQybDYwQ2VjWG8zQmZZQnNxanRC?=
 =?utf-8?B?eFI3UUN5TnVlR3lwakxVSmZNK0RIRk1QNlpSSG9lTWs1VzFXTkxDaWpxakZ1?=
 =?utf-8?B?eE42SmhKQUNYalhrYy9NaDBWV0l2ajRnMkkrSEVQWWpHa0wzbHVZMys4Slor?=
 =?utf-8?B?NG5SRmxOcnNtNEJ0VDk0TTRINFJmc0YvR21Dd2ZoZnVZSFhyYWg4Tk5EZ3pJ?=
 =?utf-8?B?NFlOVlBGb0QzRk9DSEs2Z0pHbERuamc4RjM2RXVuaUVXUjFMVG1DYk5nazRU?=
 =?utf-8?B?RTlzRWl4MHZnK3VHY2xweHYwcXhNbTA1dEU2NnZ5L0F4a0czRGlzR29rdGk4?=
 =?utf-8?B?NWN2eHZuVjNVSEdrdjFZMW1QUVY2WjhreGxsblpXVHdObVBSKzRTVmh5WU5J?=
 =?utf-8?B?U04xUU5zcjdHUURYa0t6YklnZ05LSHVNYWE2ck5wdnkva2FNei96ZFVUYWVh?=
 =?utf-8?B?UlMzeWgvemRZZ0loazhBZWNqUElScExhMis4VDF1NlYwQWkxN1NuNFU1Nm13?=
 =?utf-8?B?Q1Y4SEowNWtZV29EdDJ6dVpZQzljL200YlpwREkxei9ZL3NGWXdZME0zYmFJ?=
 =?utf-8?B?cHZaa2Z2Tzh0TmlyelRPd3crZTNuTlg5RzE3U0s0L3lyTDFaTmhacDFlSStF?=
 =?utf-8?B?eDkzL3h2VzJPbjZDK24yV2dGV1A4T2FwcjRTRzVleW9zOEFoamtGcjRhOUd3?=
 =?utf-8?B?QWoyOWlVUEZEMTBNczR1T0tTK0JxREN5dTVWbVljL2dSRllZc3B0YkhBejQ4?=
 =?utf-8?B?QWlXWmg2NFhqdHo3NnZRVFhyd25kMzF2RWt3WDErVDVVM2RhSFZUUEhVeXRx?=
 =?utf-8?B?K005bjB5cndyRTNRZUVMQk5QTWJXWlhwMUJMWm56VUdwVEh5dE1xekZDdnov?=
 =?utf-8?B?WXdIc2hVYk1NWWpMRi9qQ0pEMXdpTHFjeEswY2dWZnVYSTVvZ01mNGlwUkRZ?=
 =?utf-8?B?TDR3SjNDbEVFQlJnL0ZYdUFCbmFua0FWRHdubnZUV1oybjVBemd3S3gybUZl?=
 =?utf-8?B?ZDBPRis3YURvbVpFeXBBa2IwUVJET2JjUG1CRjdDSC9RVU1GTEViaUN6R3BY?=
 =?utf-8?B?VVRVZDhUT1hnbjRCUUxmUElReG04bUVVbXdoSXBQOEpzbjhMdUR1eXdjZWFU?=
 =?utf-8?B?VVdWd0pJNlYwRUhwRGZ4eXgxWTdQSmxqcS93cVBhd2dsSmU2TGRmaEwzSmhN?=
 =?utf-8?B?bTg4VUp2TW5rSXZ1MjNEbWhuaEI2djkwSkpOOHZnem44bk5Md0JjQlRmdXM2?=
 =?utf-8?B?Qk94RVZ2NkRoOXE5UndmcXJoQnoxbHR4bHVwMHlSWVp2QTc2L25PRmRDaWFQ?=
 =?utf-8?B?dzdyWWpUdTkzUjZLSlBPMkx2Q3VEcEs3NlNjWmlHYlR5Y3Y4QmhlVVFlU2p6?=
 =?utf-8?Q?sQY2ljFceozuyXjT0N8fKzfIS4tjPf9BKAntpt8lyTXG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a224ba3b-b497-4192-5ace-08da8b558d05
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 13:34:38.1859 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAD4dLM9Lb9AKKfhcWafqvdFp6goGj8H3bcIxI3uHuIPafd6jtbZKq2sIWpj7jzm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5452
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
Cc: Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.08.22 um 14:50 schrieb Matthew Auld:
> On 31/08/2022 13:35, Christian König wrote:
>> Am 31.08.22 um 14:06 schrieb Matthew Auld:
>>> On 31/08/2022 12:03, Christian König wrote:
>>>> Am 31.08.22 um 12:37 schrieb Matthew Auld:
>>>>> [SNIP]
>>>>>>>
>>>>>>> That hopefully just leaves i915_ttm_shrink(), which is swapping 
>>>>>>> out shmem ttm_tt and is calling ttm_bo_validate() with empty 
>>>>>>> placements to force the pipeline-gutting path, which importantly 
>>>>>>> unpopulates the ttm_tt for us (since ttm_tt_unpopulate is not 
>>>>>>> exported it seems). But AFAICT it looks like that will now also 
>>>>>>> nuke the bo->resource, instead of just leaving it in system 
>>>>>>> memory. My assumption is that when later calling 
>>>>>>> ttm_bo_validate(), it will just do the bo_move_null() in 
>>>>>>> i915_ttm_move(), instead of re-populating the ttm_tt and then 
>>>>>>> potentially copying it back to local-memory?
>>>>>>
>>>>>> Well you do ttm_bo_validate() with something like GTT domain, 
>>>>>> don't you? This should result in re-populating the tt object, but 
>>>>>> I'm not 100% sure if that really works as expected.
>>>>>
>>>>> AFAIK for domains we either have system memory (which uses ttm_tt 
>>>>> and might be shmem underneath) or local-memory. But perhaps i915 
>>>>> is doing something wrong here, or abusing TTM in some way. I'm not 
>>>>> sure tbh.
>>>>>
>>>>> Anyway, I think we have two cases here:
>>>>>
>>>>> - We have some system memory only object. After doing 
>>>>> i915_ttm_shrink(), bo->resource is now NULL. We then call 
>>>>> ttm_bo_validate() at some later point, but here we don't need to 
>>>>> copy anything, but it also looks like ttm_bo_handle_move_mem() 
>>>>> won't populate the ttm_tt or us either, since mem_type == 
>>>>> TTM_PL_SYSTEM. It looks like i915_ttm_move() was taking care of 
>>>>> this, but now we just call ttm_bo_move_null().
>>>>>
>>>>> - We have a local-memory only object, which was evicted to shmem, 
>>>>> and then swapped out by the shrinker like above. The bo->resource 
>>>>> is NULL. However this time when calling ttm_bo_validate() we need 
>>>>> to actually do a copy in i915_ttm_move(), as well as re-populate 
>>>>> the ttm_tt. i915_ttm_move() was taking care of this, but now we 
>>>>> just call ttm_bo_move_null().
>>>>>
>>>>> Perhaps i915 is doing something wrong in the above two cases?
>>>>
>>>> Mhm, as far as I can see that should still work.
>>>>
>>>> See previously you should got a transition from SYSTEM->GTT in 
>>>> i915_ttm_move() to re-create your backing store. Not you get 
>>>> NULL->SYSTEM which is handled by ttm_bo_move_null() and then 
>>>> SYSTEM->GTT.
>>>
>>> What is GTT here in TTM world? Also I'm not seeing where there is 
>>> this SYSTEM->GTT transition? Maybe I'm blind. Just to be clear, i915 
>>> is only calling ttm_bo_validate() once when acquiring the pages, and 
>>> we don't call it again, unless it was evicted (and potentially 
>>> swapped out).
>>
>> Well GTT means TTM_PL_TT.
>>
>> And calling it only once is perfectly fine, TTM will internally see 
>> that we need two hops to reach TTM_PL_TT and so does the NULL->SYSTEM 
>> transition and then SYSTEM->TT.
>
> Ah interesting, so that's what the multi-hop thing does. But AFAICT 
> i915 is not using either TTM_PL_TT or -EMULTIHOP.

Mhm, it could be that we then have a problem and the i915 driver only 
sees NULL->TT directly. But I really don't know the i915 driver code 
good enough to judge that.

Can you take a look at this and test it maybe?

>
> Also what is the difference between TTM_PL_TT and TM_PL_SYSTEM? When 
> should you use one over the other?

TTM_PL_SYSTEM means the device is not accessing the buffer and TTM has 
the control over the backing store and can swapout/swapin as it wants it.

TTM_PL_TT means that the device is accessing the data (TT stands for 
translation table) and so TTM can't swap the backing store in/out.

TTM_PL_VRAM well that one is obvious.

Thanks,
Christian.

>
>>
>> As far as I can see that should work like it did before.
>>
>> Christian.
>>
>>>
>>>>
>>>> If you just validated to SYSTEM memory before I think the tt object 
>>>> wouldn't have been populated either.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>>
>>>>>> Thanks,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> I've been considering to replacing the ttm_bo_type with a bunch 
>>>>>>>> of behavior flags for a bo. I'm hoping that this will clean 
>>>>>>>> things up a bit.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>>>       caching = i915_ttm_select_tt_caching(obj);
>>>>>>>>>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>>>>>>>>>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>>>>>> index 9a7e50534b84bb..c420d1ab605b6f 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>>>>>>>>>> @@ -560,7 +560,7 @@ int i915_ttm_move(struct 
>>>>>>>>>>> ttm_buffer_object *bo, bool evict,
>>>>>>>>>>>       bool clear;
>>>>>>>>>>>       int ret;
>>>>>>>>>>> -    if (GEM_WARN_ON(!obj)) {
>>>>>>>>>>> +    if (GEM_WARN_ON(!obj) || !bo->resource) {
>>>>>>>>>>>           ttm_bo_move_null(bo, dst_mem);
>>>>>>>>>>>           return 0;
>>>>>>>>>>>       }
>>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>
>>

