Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D2386E334
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 15:20:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B9810EFFA;
	Fri,  1 Mar 2024 14:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MfBUc4IV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF5F10EFF7;
 Fri,  1 Mar 2024 14:20:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knl4ySk3c83aAzB07+AKZ2WgiyuH/E6+jUpwHuLhjwI+JipHaY8yFHd93/lik7vBfcyAs+coKlfQP23YluBXlqK10+4V/W3TG0fw+HgyIG7FhG7qxU1tBK6WLTT8iNFGPB26RPJSQl9d5TEWb6J9TEUTWVxL8WzX+W0PNo4W3KoXtwGsS7h0I8QjpH3tOvETvNPGvPEJBUKDJS1JX7qCSDLsr32rJpML8waCt7HmsD70T2lihQh7Gdr6UAXmLH40Y1Hg1osOpdyHQzFgpE+EmE/2rr5FwzQ7TWvki7jmm8ZDIS/T4Ly1B1ytLch187Dxj4YFtZ/pCdptf4Om2Wv3yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mPJecD/Ej+TvI7HxsbJ+QQMyTmmN/r4R3/gj0RkWrg=;
 b=Ovaqa3rIQNnWQqvz3ow0SfCRKAemUu9GUfH3/IOZEw0wp97h2kt15MSlvlXCICBkEY3PnVFGFUdz39lnoDdFnhgyEIRazSQyvTg+Njoiypc0Ye5DhX+cedsdq17dPstej4SBJbFp1teHCIuu6qCLhx8EI4OTLYZ4hj96Df/PI7odNnC4KAzPxjVICKF40Oh0tLfncQvuBKz+yTZT8CkRKEf5f4oTb754pWAVqczBb21f8vUXS3M7qeNcTlnEQiUkkZHgdMR1EEStobq9QL1g03UEL7pzQop3WTA/M0pS4pSb0Kjo46l2Qj+2d5zun0lhV57IizfBLjshClbCXyLgXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mPJecD/Ej+TvI7HxsbJ+QQMyTmmN/r4R3/gj0RkWrg=;
 b=MfBUc4IVOf+Lam7kCVVKOLD6wJlvw5g8OjqoKsLrx7MD7j5IlWUvZk6GqKmRFC0b1dmWHBHIK/0xQR654fS9b6raS9sa5V08WgeXWpDj2in7F/bkqh+4hIsf8SkELaEAmmHZR8neu0/G7m6EQPmI8sGh8xvRrgY15O0PSwi22+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5687.namprd12.prod.outlook.com (2603:10b6:510:13e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Fri, 1 Mar
 2024 14:20:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7339.031; Fri, 1 Mar 2024
 14:20:11 +0000
Message-ID: <0314e74c-cd07-417e-96f4-0b84076f7245@amd.com>
Date: Fri, 1 Mar 2024 15:20:03 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] TTM unlockable restartable LRU list iteration
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@list.freedesktop.org,
 "Somalapuram, Amaranath" <Amaranath.Somalapuram@amd.com>
Cc: dri-devel@lists.freedesktop.org
References: <20240216131306.101932-1-thomas.hellstrom@linux.intel.com>
 <29000a0d-19ce-4727-945b-d5734313c7f1@amd.com>
 <47fc8e42dcfd868341ffc32754c302e58ac49484.camel@linux.intel.com>
 <c4f85901-1461-42e4-8db1-49877837e398@amd.com>
 <c2e29b31a1654625ef316264e2335a0158b3a228.camel@linux.intel.com>
 <f00b415e437f0a7955ca6759c30bdf0d3444e21f.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f00b415e437f0a7955ca6759c30bdf0d3444e21f.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0053.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f0::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: a626d011-cd84-4b2d-ee32-08dc39fab481
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32AnU0UKd/B8DgfxNgTVMx8G5/K5+0AXTLezpeoGMroeuz53i1Vkd/+bplGWvc2Hyl0BCQB64SJArSXRq9n7/vvR9BAn0a4Hgd6nAajwA4ZWSBSjPk6RXWo4/2Oodrte9WT+Q00CI00++s7HAoFDm7YSf2mTbU/hcNjixNp5EfuLuxWhc5HDm4ObchlWLC3xl2JX2MpspVA85PhVr22FV4l6YEm/qIGvqAs476JAI/sZn+5gwDD1hz4Cm7/PbI47xJyeXipwQFJ2d7QtIJEIUhKP3aexuYKY02xev9GTrGukNk7wxbwtWAOQ7LQ6oSTyWbJD46OI3fUg77xE+bxW8oykmoCmhCSyh+SVR3wejw8J/eAwtHK5MBl5fWJveZwBKftTQ/39cNRcXPf+CzpM6n0OTgMv6dSLy81KlS+SVOIwkoC7xrTl9uWCmXJw8SA7Y2yXj55ue5D3Yku1efFxoez1JIs1Kec09CJj0y4P4KzagzfOj5Sue2hHPNNhh9LrCHbjJkdYtAS5ZeaGDwlJzbUgNzB9M9nytAhA1XkVCIZjuv7mboiFT3qX/hqsFFOeJml5518qcX/HSU2/qi6WAzgGRM8Iegofo9kWhv6EUozpEVsFYgmnL0eoOpDpYwXGS1K1/uEowfhy/lnHGHulDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1J0NHdiT2R4OUNmK09WQUk5amtLOExwUFc3a3o1Z3FtTjVmcStiODJGNzVO?=
 =?utf-8?B?Y3RQUnJkMDRhOXc2dkYxZ2FYTC81TUJneFluekRaOUNycWhZRkNlNWFOczlp?=
 =?utf-8?B?UXU2bHFCRjlCOVZ6c3ZJZERNUWl2Mk0rYWFqS254cURudVNpeXpVQitxVmJs?=
 =?utf-8?B?YW10VWNHeCtycnBuVnlwTzZhMkRWb0JGcWllSjRka3NwalNBN0k4TGlTQng4?=
 =?utf-8?B?RzdwU0J4WUhaclJNSEZvbkhDU1dwUm84QS9RMEFWWnA4UU41eEFBcnBaODZJ?=
 =?utf-8?B?YVVsTWNpTUdGVC9SNHFpM0wyQmRkZnViQUNDUG16SnhvNko1M1RnMUxsQXFs?=
 =?utf-8?B?amxOaUF5azVnMTBjVEh0Q01zZzN3U1EzeEZaU3JkNms5VkkvTmZqNEpaVnFK?=
 =?utf-8?B?WDgzdlNDMklFT3BBMGR0andrd0w2eTRQYk8wM1NYdDdlZE9HcS9QYjVsVTFL?=
 =?utf-8?B?c0xWeCtnTkk2ODA0Wnd0c1dpcjhrdzhzanNsV3JEMUliZ2lvTnRDdHA3T29t?=
 =?utf-8?B?eERCdEhOak00dWkyR1VTZmFlYjAwbDAxSklnS3lDODFuTis3Rlp2TDlDekVN?=
 =?utf-8?B?MVdpSytGYXFIcDBDMXRqSEFQS1NvTy9FcjVJeUViSGFsTGlxZ0FkcVRieC9Y?=
 =?utf-8?B?ZldNb216SFRZaVlDWFFTTnB1cmFkWVYxSTdGU0tmVzIvWFJHTmNGczdiRS9z?=
 =?utf-8?B?Q3h6UERPRExpdkxpUkF4QWlGb1pzeHFGVmI5dHd5eEU0SE1sekFHTUdFV1Rw?=
 =?utf-8?B?RFZJUlc5aFoydzhBS3ZZOFVKSnp3SjNsYU1mU05QakpCMXVKTnQrVGliUyt4?=
 =?utf-8?B?Tm9XblM2S015VGRnUW1leDg2bVZUWTd5aFZNZjBNM1FxekNudk1QcExMUWRZ?=
 =?utf-8?B?MmtoMkF2VERSV3lJczR1ZkVnWmwwc1dPRFdzWFdSUGllR1lmSlZ1cGo4NUpr?=
 =?utf-8?B?OVhyZXlpQWd0QlptdkpTNEFUdFZjcUdWOGRkNWY3ZERVeklpTzFQckxaM2Jp?=
 =?utf-8?B?TlV2V212anFXSDNUQlNka1pWUFVQV3dGemZ4cC9kYVV1M2lHbzh5YnhHYXVs?=
 =?utf-8?B?MmdqTFBjV1kwaHhhV3NBQVd2aE5BTkdSZjdTMTBkMm1WeUF0b0hzK29wR0c5?=
 =?utf-8?B?S096QndrNFo4Yzc4cUc1T04xTE83YnRhejN5MSt2emJBWkFZQWUrejE1MHZ3?=
 =?utf-8?B?ZE9wU0gyb21SQVVRbzYySTd5R1h3UFRzOTIvcjZINVREUHdvOGo5cXI2L21q?=
 =?utf-8?B?Zmh1bGVacFRNbmw2RUZuelluWkt0ekt1KzVyeDB3RXVQcksvRzlFN3loNm0r?=
 =?utf-8?B?NnFKb0N2ZjhsR0JFRTRyejBMblNYMFB4YlFURURYdHU3a0pFaXEydnJVVnAw?=
 =?utf-8?B?VzNUU1IrYko1TzQ4NmFTNTJwT0hhQnR5UnVSdGNKRWMra1FQQWxvZ0xUOFNB?=
 =?utf-8?B?bXNmWTcwRmlFMzJHZm5BR0h3OEk2WTBGN3U1VFBnU0E5Uk1jeWhRblhXTXNC?=
 =?utf-8?B?M0dsVXowdkMvSjY4QncwTkxIcitHQ1pnOENNc0dsWEhENG1oNEROQitpRkVG?=
 =?utf-8?B?ZzNSZ216ZHdvQlZNSitzSjNLUUYyWGxlOEM2dVJtLy83ei9FOUY1MmNUWDBE?=
 =?utf-8?B?cm1BWS9GWlFRQ3RyVkQ3WWkrZUtsSlBTU3RGejJNMXFYVDRFdlk0bFVCbGJ5?=
 =?utf-8?B?SWNMZWp2aDhFbERnbkFFTnpqd0ZTWEtjREYxTjIxaTBZR0J5b2tXRXJxUHVG?=
 =?utf-8?B?WXJxZGsrQkZkc1Z3UmdPWjFZbHEyZ005bk5BSzUxQmpZWlZ3SWIwUUVvUFNL?=
 =?utf-8?B?RnVBSW8wc090SUNWdUJPL3dTdjhzeGI5L3IyL243OC9uckk2NWtKQVFITEhw?=
 =?utf-8?B?WGl1T2FLM2htWjJVbEdTZHdUME1qUXFXYW5qQXpEaEJFNm0rVnVBVzZKVFBh?=
 =?utf-8?B?Z01LRVdGZmJOa0laUG1IaWVsK2M1NzRTbEhxazUvTjZmamlDZWxObWd5YThX?=
 =?utf-8?B?akVjU3g4ZE0wOE9sbXhWdnVQNzVsSUtMN2EwNmhFblZrVXlZWVpoa2k0NExM?=
 =?utf-8?B?ZXFZMTV0TzFqYnJyRXh5V1lWQXR3Rm80SDdBaE9NZUtJanR1U2ZGTGdxNnRm?=
 =?utf-8?Q?5OtQS98FGIaZwwNGEDPO3UwJY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a626d011-cd84-4b2d-ee32-08dc39fab481
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 14:20:11.5328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bS7JbdQnWRguxk5jdtsZ0CIBRuYQW1RZwq5CiNGUfn+IPE/Z62hte7wUom5zmIfE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5687
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

Am 01.03.24 um 14:45 schrieb Thomas Hellström:
> On Thu, 2024-02-29 at 18:34 +0100, Thomas Hellström wrote:
>> Hi, Christian.
>>
>> Thanks for having a look.
>>
>> On Thu, 2024-02-29 at 16:08 +0100, Christian König wrote:
>>> Am 16.02.24 um 15:20 schrieb Thomas Hellström:
>>> [SNIP]
>>>>> My approach was basically to not only lock the current BO, but
>>>>> also
>>>>> the
>>>>> next one. Since only a locked BO can move on the LRU we
>>>>> effectively
>>>>> created an anchor.
>>>>>
>>>>> Before I dig into the code a couple of questions:
>>>> These are described in the patches but brief comments inline.
>>>>
>>>>> 1. How do you distinct BOs and iteration anchors on the LRU?
>>>> Using a struct ttm_lru_item, containing a struct list_head and
>>>> the
>>>> type. List nodes embeds this instead of a struct list_head. This
>>>> is
>>>> larger than the list head but makes it explicit what we're doing.
>>> Need to look deeper into the code of this, but it would be nice if
>>> we
>>> could abstract that better somehow.
>> Do you have any specific concerns or improvements in mind? I think
>> patch 1 and 2 are pretty straigthforward. Patch 3 is indeed a bit
>> hairy.

Yeah, seen that as well. No idea of hand how to improve.

Amar should have time to give the patches a more in deep review, maybe 
he has an idea.

>>
>>>>> 2. How do you detect that a bulk list moved on the LRU?
>>>> An age u64 counter on the bulk move that we're comparing against.
>>>> It's
>>>> updated each time it moves.
>>>>
>>>>
>>>>> 3. How do you remove the iteration anchors from the bulk list?
>>>> A function call at the end of iteration, that the function
>>>> iterating is
>>>> requried to call.
>>> Thinking quite a bit about that in the last week and I came to the
>>> conclusion that this might be overkill.
>>>
>>> All BOs in a bulk share the same reservation object. So when you
>>> acquired one you can just keep the dma-resv locked even after
>>> evicting
>>> the BO.
>>>
>>> Since moving BOs requires locking the dma-resv object the whole
>>> problem
>>> then just boils down to a list_for_each_element_safe().
>>>
>>> That's probably a bit simpler than doing the add/remove dance.
>> I think the problem with the "lock the next object" approach

Stop stop, you misunderstood me. I was not suggesting to use the lock 
the next object approach, this anchor approach here is certainly better.

I just wanted to note that we most likely don't need to insert a second 
anchor for bulk moves.

Basically my idea is that we start to use the drm_exec object to lock 
BOs and those BOs stay locked until everything is completed.

That also removes the problem that a BO might be evicted just to be 
moved back in again by a concurrent submission.

>>   is that
>> there are situations that it might not work. First, where not
>> asserting
>> anywhere that all bulk move resource have the same lock,

Daniel actually wanted that I add such an assert, I just couldn't find a 
way to easily do this back then.

But since I reworked the bulk move since then it should now be possible.

>>   and after
>> individualization they certainly don't.

Actually when they are individualized for freeing they shouldn't be part 
of any bulk any more.

>>   (I think I had a patch
>> somewhere to try to enforce that, but I don't think it ever got
>> reviewed). I tried to sort out the locking rules at one point for
>> resources switching bos to ghost object but I long since forgot
>> those.
>>
>> I guess it all boils down to the list elements being resources, not
>> bos.
>>
>> Also I'm concerned about keeping a resv held for a huge number of
>> evictions will block out a higher priority ticket for a substantial
>> amount of time.
>>
>> I think while the suggested solution here might be a bit of an
>> overkill, it's simple enough to understand, but the locking
>> implications of resources switching resvs arent.
>>
>> But please let me know how we should proceed here. This is a blocker
>> for other pending work we have.
> Actually some more issues with the locking approach would be with the
> intended use-cases I was planning to use this for.
>
> For example the exhaustive eviction where we regularly unlock the
> lru_lock to take the bo lock. If we need to do that for the first
> element of a bulk_move list, we can't have the bo lock of the next
> element when we unlock the list. For part of the list that is not a
> bulk sublist, this also doesn't work AFAICT.

Well when we drop the LRU lock we should always have the anchor on the 
LRU before the element we try to lock.

This way we actually don't have to move the anchor unless we found a BO 
which we don't want to evict.

E.g. something like

Head -> anchor -> BO1 -> BO2 -> BO3 -> BO4

And we Evict BO1, BO2 and then find that BO3 doesn't match the 
allocation pattern we need so only then is the anchor moved after BO3:

Head -> BO3 -> anchor -> BO4....

And when we moved inside a bulk with an anchor we have already locked at 
least one BO of the bulk, so locking the next one is a no-op.

> And finally for the tt shinking that's been pending for quite some
> time, the last comment that made me temporarily shelf is was that we
> should expose the lru traversal to the drivers, and the drivers
> implement the shrinkers with TTM helpers, rather than having TTM being
> the middle layer. So I think exposing the LRU traversal to drivers will
> probably end up having pretty weird semantics if it sometimes locks or
> requiring locking of the next object while traversing.

Yeah, I was just yesterday talking about that with Amar and putting him 
on the task to look into tt shrinking.

And completely agree that providing the necessary toolbox for eviction 
is a better approach than burying the eviction deep into the TTM logic.

> But regardless of how this is solved, since I think we are agreeing
> that the functionality itself is useful and needed, could we perhaps
> use this implementation that is easy to verify that it works, and I
> will i no way stand in the way if it turns out you come up with
> something nicer. I've been thinking a bit of how to make a better
> approach out of patch 3, and a possible alternative that I could
> prototype would be to register list cursors that traverse a bulk
> sublist with the bulk move structure using a list. At destruction of
> either list cursors or bulk moves either can unregister, and on bulk
> list bumping the list is traversed and the cursor is moved to the end
> of the list. Probably the same amount of code but will look nicer.

Yeah, I'm just not sure if this handling here will be so simple with 
multiple anchors. That sounds very fragile.

Regards,
Christian.

>
> /Thomas
>
>
>> /Thomas
>>
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> /Thomas
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> The restartable property is used in patch 4 to restart
>>>>>> swapout
>>>>>> if
>>>>>> needed, but the main purpose is this paves the way for
>>>>>> shrinker- and exhaustive eviction.
>>>>>>
>>>>>> Cc: Christian König<christian.koenig@amd.com>
>>>>>> Cc:<dri-devel@lists.freedesktop.org>
>>>>>>
>>>>>> Thomas Hellström (4):
>>>>>>      drm/ttm: Allow TTM LRU list nodes of different types
>>>>>>      drm/ttm: Use LRU hitches
>>>>>>      drm/ttm: Consider hitch moves within bulk sublist moves
>>>>>>      drm/ttm: Allow continued swapout after -ENOSPC falure
>>>>>>
>>>>>>     drivers/gpu/drm/ttm/ttm_bo.c       |   1 +
>>>>>>     drivers/gpu/drm/ttm/ttm_device.c   |  33 +++--
>>>>>>     drivers/gpu/drm/ttm/ttm_resource.c | 202
>>>>>> +++++++++++++++++++++++-
>>>>>> -----
>>>>>>     include/drm/ttm/ttm_resource.h     |  91 +++++++++++--
>>>>>>     4 files changed, 267 insertions(+), 60 deletions(-)
>>>>>>

