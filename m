Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217833A3C61
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 08:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F546EE2D;
	Fri, 11 Jun 2021 06:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2074.outbound.protection.outlook.com [40.107.100.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8326E520;
 Fri, 11 Jun 2021 06:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xj7u1gpfRYGAzYxA6uaCWPhCPXy9sOvWkN0OHzResCVbbB3z6alwz9lieT8XUjqDaLqgGtuIrvCcabWtbXB1waJ9UvQzOot/hxEgg6BiNcNWhsZYQbQdFyvIM9FWhl5wG/Shca6qN+gtoVKgHI2JnUR7Uq/eBADddp10zyErLR+NIvtqXsphA7jhmoh8aePjQdQ4v5BLZijgaJXLlL7YYyAPOBgLCD1BK6K44EtD2kicNNzaEKwmJvBFkmbd5R0Jrfnv3VbxdKPz+gl/awmwdJjOlNawv6FDYTw7pWimCCx85AgVc7MwOY6Yd45gJYo/deVDJjqi0fzi7x3GbYLX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yv0EVI3xGRZapTzYMwAQL4l//hCYekHit33MB6ICRo=;
 b=XLraNPKWVtBUPHLhZLSk1wHVDciMt6a3c6f/WbiDJ1RAmnO2cs0P/jIdUGNglMuxvwrCS5Gz99SvIOkJFo68v6fr5OqiwiyzKFg81N6eWkJgE+5z4AMoKwibY1WVwERg4jFH7j1JiSJxSl2ajd68NQd78uWRKaCufyIwjVThfGCqWuMnxMF6GJ6Y68rqRgMNEc1Wb5l1cbMe26KhaJZAa5er1CbNWLJy9PZsRt/UmdxX0FUX9E0WKCCGowRmqca7RyV5ebnOeDMlV/umpC1rk1L804reIYmuyTlAfI3ktfsu+R9UsaEUNp7SIxLe+VJ66cx1+cxII7q4iGVQLk1L1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yv0EVI3xGRZapTzYMwAQL4l//hCYekHit33MB6ICRo=;
 b=iZseaLOByelmYdboanaF+30W3Fl3hHT78cqsdATwhN1BtbHz993upHMAWgtrqnmDJfe+0A2sr//rMBQdhzPiVJH3UFqX6AMp2hStf/1lsyBRFOSeKCyAtxpiSxbS2ciKAkByLomNL3NgVy8TCEvsp6IxYY4uVxWRP2Mch2IVvjk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4374.namprd12.prod.outlook.com (2603:10b6:208:266::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 06:55:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 06:55:40 +0000
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
 <f9be43e3-4107-3742-a11b-8021b2c19e32@amd.com>
 <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
 <CAOFGe95BhZ7jXLxarL=2_zNYDydEoPJWnDWAG3aaeEJsDzR5dA@mail.gmail.com>
 <CAOFGe96KrBfvBKxcUNwths5Sigk7fk7ycLeYbgxutL3msEgfyA@mail.gmail.com>
 <CAKMK7uGqGLKFp7Obp-5xW3fPuoRmBa_0OawN-4Q-niDi147tXQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4dc8314b-4366-2d92-4cca-1497a7c73721@amd.com>
Date: Fri, 11 Jun 2021 08:55:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uGqGLKFp7Obp-5xW3fPuoRmBa_0OawN-4Q-niDi147tXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e99:1d6a:3624:888b]
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e99:1d6a:3624:888b]
 (2a02:908:1252:fb60:1e99:1d6a:3624:888b) by
 AM0PR05CA0083.eurprd05.prod.outlook.com (2603:10a6:208:136::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Fri, 11 Jun 2021 06:55:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ec71159-95a1-4e01-6228-08d92ca5ecb7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4374:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43744249775176CC8500AA8883349@MN2PR12MB4374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mznH7BupYSsFeyWySGu9VB571q5sjgzT9E0iAQF/6PVGgBtx56v0pKbJDPcxWOTxaQJULYPhJtYrTegM+5/pVSfjlfWmqmfiEo9lm4wmRrx/dNlvXcV1n05t70W5i+MotJeeeVcTBCXsPmKHXurRMiqUN4p0qDqbLx2FFzNUN9pDaeezep1IEaUKUMkP1h3ENz91GhuouJlzfuSPoE0B2FvaUD5BxBIue0I9f9yEtXY6zh+YI3NqWQsco58hf7dFn2weSaXgZ7r2eBy85m4/sKjWDBDsBwAiEBKk34TTg7GkGqXgF8qHoMWdpMHCqcdNH18XXw8tZlNWrBBKyGXYR53uIX0ALO7h+lFc78Pf5kurKiTsZ/PGoCM5u4rnFcnyvEjV79QVNUn74olVAveuYiBVv4IIzHrpGoX9mqEk2lQPk6+G8femoRO3vjJ/cf6akcsQ2UkqJpgtxuO3Y0TZIs49sUqqq3qHuVghoxXgys5mQ0YwEXE+BWgUvNGxDzR737FnWbMHfhSIaQixfF/ayxGdEtuNLSyxqanEMRgg+W78kBZRK+8tjQo8IQpNZucklYIyH1rWZvnFglR4rQJIPCHuDPZC3z6DRiEJ5W6z+JoO97yyFe8phtMaQpObFJ79n1gABu5CvsideWfN0NurwvwgwDq2POwp4H587poQiFUm73DwnQSlMO5N9sK4Azeb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(6666004)(36756003)(83380400001)(31696002)(66946007)(86362001)(66556008)(53546011)(5660300002)(4326008)(66476007)(31686004)(16526019)(54906003)(6486002)(2906002)(478600001)(8936002)(186003)(38100700002)(8676002)(316002)(110136005)(2616005)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1RkeEI4a1lTSXdJeEVKaVZSQUQvTEpOSXRaZTdVOWNMSG9aaFdaSDVHOWFt?=
 =?utf-8?B?TVlHMFpCblNFNjZHbEVuTHZrT2s5MzBvS1U0LzRaVW9iRlBHT2FZalhDZzli?=
 =?utf-8?B?OFV5Yk9zSVlHeGltcGdCbUVHM1pHZEF2bExOeldKeDcvcG1kWm1mK1lqQnlz?=
 =?utf-8?B?YkRFaXYxSHlMWFgyTUpkZ1lvSE0wN01PLzl1SytWT1BQcUVMbjdabWlUcllJ?=
 =?utf-8?B?TVdIU24zaFJYQ1FmWFZlMjdXSlhUKzdiRndIMjV5SnZBaDgzdkUyWWlkMjR3?=
 =?utf-8?B?ZmFCMmZVMTBCUjR6M1VSNFRpeGJvN2phNWRiZE1vWVI2bzNxRkJZc2YwTHNi?=
 =?utf-8?B?YklQTEs0WndIamY3YmNNNGhpYlJOZ0VOaXlVZENhOXpkZWI2OXhscGZ2a0Qv?=
 =?utf-8?B?MXVkcUVwQm84UDFiWWpaUWdIcEk1RU9XT00zVUJXQW9kK1RBaENCTHhtUVRa?=
 =?utf-8?B?WHZMZnlOcFFYSGdnUDR4Z2hyR3huTzlrMGhEQXAvRk1qa0RPODBrK080bmpr?=
 =?utf-8?B?WEt0TzdtQmZQYUFWUklaNDkxenpReU8zazNUcmpnNDVpZWYwUXRzdmlRQU45?=
 =?utf-8?B?dkFWOStSZEVQTGVROVBtL2lkdFAyV1VqMytRU2JJbWJXWjY1RUIvandKZ3FK?=
 =?utf-8?B?ekdsRjc4WUdZYVJuRkRITS91QXlweG1Pa1J6NHJ6TGtBb0VQek0vVWExQ3NG?=
 =?utf-8?B?ZXdwS1ZQVFdPWTVPLzY2VFRpeFNCOTc2cXlqVzBMaXBHdFdYSFRraWhDZ1dh?=
 =?utf-8?B?d24xQlBabEZzeWRibkVnWk9wV3p5N3N1dFBmOC9Sb1MzeTFWRVcyeFZwR2NP?=
 =?utf-8?B?RGtOOEZmS3FnWnlRdC9NaDhydGFTWCtBMDlySFJEamlKNVZrWnByc3k2cEo0?=
 =?utf-8?B?OXBCcWNpNzJxQy85UWtLYWlzZGRnejY1TGIwYysrUk1zVHFyWURDaWJCVTdP?=
 =?utf-8?B?REMrTktIdjdWQlF6YnBSZHpnLzJ4ZjRoTVpUWnJ6M3RTaWlpbzJ3dnVPMlRB?=
 =?utf-8?B?SnltdHVHUkdhOCswc25aSlJxc21mZktHUkRNOVM2YUFPUU52WFd0NDRsT2Ew?=
 =?utf-8?B?d29BTUh1V1dmbzdSUllZRVFINjdvdWlYc2JBc3c3d3hFZ1JteTFySEFiemVq?=
 =?utf-8?B?NVkzdkwwZERPK2xVTWRQR09WejgvbjMyV3RWOXVCOSt2MVU3L3p6UmFjVUkz?=
 =?utf-8?B?VCtid1FtS3R0QzNiTk81N2RabUIzc2E4VmVwQ2lVWkErdEtaY0hHd1l6VDVi?=
 =?utf-8?B?V05JQ1hoUjFoN1FaTGVUSXBjMnJMK3lvL0dNOTBtZVowNm5Hb2J4K0FtL0pN?=
 =?utf-8?B?c1FTeStwUmgrYXNMYmsrTTZMUE1kSnhpWnRYSVdsb3lPSmJLVldEUEhKNTZV?=
 =?utf-8?B?a0c4d1N0OTdyNkpBbXA5eURwSXJRSnd6L0RoUE96ZmwyaFVaTXFzd2xYOWZs?=
 =?utf-8?B?VHdOY2JLUWFIVlkyb3ZVMklwelRRWDZpa3dtbGJvdC8waVo1MUxDUTA3ZzYx?=
 =?utf-8?B?MWVXOEtMbE1YTTViM0phQVdYaDhqdFZZSm9ETHZLNFBJcjlPejV0NldFc1Fa?=
 =?utf-8?B?N0pQRGpGNGJtNC9CRHhtZGI5TjE2L3NnS0tOY0s3dnM0S0M4eUIzYVBObGpB?=
 =?utf-8?B?VEF5Q0s1ajVockdZejh1Y2VyNUZpalFyeFZDdmMxS0JKdFdpazhmaWR3R3hT?=
 =?utf-8?B?Q1RyUk1lWWYrK1FZM1Jac1pON2U4VWxYM0Q4VDJNMStmblIySWVzV29CVU15?=
 =?utf-8?B?ck5aUFl3elNvaUQ3N0tIUkEvbG9VbFBJemZ1MU94VUhGWGJvLzUrUFNpK2xy?=
 =?utf-8?B?WmUxdTdRSUpJenpvTWpKQTB3YzhPdGJEd1BGRFk0a3V3M2pSMENIcHRzeUFF?=
 =?utf-8?Q?Qm/16lxrEfpp6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec71159-95a1-4e01-6228-08d92ca5ecb7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 06:55:40.4011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/iY06zIS1Uw02xNcv+g0IIetPups38Uk7cWW53O7tDjGNyA1kxUYg0Qlj3aMPcP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4374
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.21 um 22:42 schrieb Daniel Vetter:
> On Thu, Jun 10, 2021 at 10:10 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>> On Thu, Jun 10, 2021 at 8:35 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>> On Thu, Jun 10, 2021 at 6:30 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>> On Thu, Jun 10, 2021 at 11:39 AM Christian König
>>>> <christian.koenig@amd.com> wrote:
>>>>> Am 10.06.21 um 11:29 schrieb Tvrtko Ursulin:
>>>>>> On 09/06/2021 22:29, Jason Ekstrand wrote:
>>>>>>> We've tried to keep it somewhat contained by doing most of the hard work
>>>>>>> to prevent access of recycled objects via dma_fence_get_rcu_safe().
>>>>>>> However, a quick grep of kernel sources says that, of the 30 instances
>>>>>>> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe().
>>>>>>> It's likely there bear traps in DRM and related subsystems just waiting
>>>>>>> for someone to accidentally step in them.
>>>>>> ...because dma_fence_get_rcu_safe apears to be about whether the
>>>>>> *pointer* to the fence itself is rcu protected, not about the fence
>>>>>> object itself.
>>>>> Yes, exactly that.
>>> The fact that both of you think this either means that I've completely
>>> missed what's going on with RCUs here (possible but, in this case, I
>>> think unlikely) or RCUs on dma fences should scare us all.
>> Taking a step back for a second and ignoring SLAB_TYPESAFE_BY_RCU as
>> such,  I'd like to ask a slightly different question:  What are the
>> rules about what is allowed to be done under the RCU read lock and
>> what guarantees does a driver need to provide?
>>
>> I think so far that we've all agreed on the following:
>>
>>   1. Freeing an unsignaled fence is ok as long as it doesn't have any
>> pending callbacks.  (Callbacks should hold a reference anyway).
>>
>>   2. The pointer race solved by dma_fence_get_rcu_safe is real and
>> requires the loop to sort out.
>>
>> But let's say I have a dma_fence pointer that I got from, say, calling
>> dma_resv_excl_fence() under rcu_read_lock().  What am I allowed to do
>> with it under the RCU lock?  What assumptions can I make?  Is this
>> code, for instance, ok?
>>
>> rcu_read_lock();
>> fence = dma_resv_excl_fence(obj);
>> idle = !fence || test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
>> rcu_read_unlock();
>>
>> This code very much looks correct under the following assumptions:
>>
>>   1. A valid fence pointer stays alive under the RCU read lock
>>   2. SIGNALED_BIT is set-once (it's never unset after being set).
>>
>> However, if it were, we wouldn't have dma_resv_test_singnaled(), now
>> would we? :-)
>>
>> The moment you introduce ANY dma_fence recycling that recycles a
>> dma_fence within a single RCU grace period, all your assumptions break
>> down.  SLAB_TYPESAFE_BY_RCU is just one way that i915 does this.  We
>> also have a little i915_request recycler to try and help with memory
>> pressure scenarios in certain critical sections that also doesn't
>> respect RCU grace periods.  And, as mentioned multiple times, our
>> recycling leaks into every other driver because, thanks to i915's
>> choice, the above 4-line code snippet isn't valid ANYWHERE in the
>> kernel.
>>
>> So the question I'm raising isn't so much about the rules today.
>> Today, we live in the wild wild west where everything is YOLO.  But
>> where do we want to go?  Do we like this wild west world?  So we want
>> more consistency under the RCU read lock?  If so, what do we want the
>> rules to be?
>>
>> One option would be to accept the wild-west world we live in and say
>> "The RCU read lock gains you nothing.  If you want to touch the guts
>> of a dma_fence, take a reference".  But, at that point, we're eating
>> two atomics for every time someone wants to look at a dma_fence.  Do
>> we want that?
>>
>> Alternatively, and this what I think Daniel and I were trying to
>> propose here, is that we place some constraints on dma_fence
>> recycling.  Specifically that, under the RCU read lock, the fence
>> doesn't suddenly become a new fence.  All of the immutability and
>> once-mutability guarantees of various bits of dma_fence hold as long
>> as you have the RCU read lock.
> Yeah this is suboptimal. Too many potential bugs, not enough benefits.
>
> This entire __rcu business started so that there would be a lockless
> way to get at fences, or at least the exclusive one. That did not
> really pan out. I think we have a few options:
>
> - drop the idea of rcu/lockless dma-fence access outright. A quick
> sequence of grabbing the lock, acquiring the dma_fence and then
> dropping your lock again is probably plenty good. There's a lot of
> call_rcu and other stuff we could probably delete. I have no idea what
> the perf impact across all the drivers would be.

The question is maybe not the perf impact, but rather if that is 
possible over all.

IIRC we now have some cases in TTM where RCU is mandatory and we simply 
don't have any other choice than using it.

> - try to make all drivers follow some stricter rules. The trouble is
> that at least with radeon dma_fence callbacks aren't even very
> reliable (that's why it has its own dma_fence_wait implementation), so
> things are wobbly anyway.
>
> - live with the current situation, but radically delete all unsafe
> interfaces. I.e. nothing is allowed to directly deref an rcu fence
> pointer, everything goes through dma_fence_get_rcu_safe. The
> kref_get_unless_zero would become an internal implementation detail.
> Our "fast" and "lockless" dma_resv fence access stays a pile of
> seqlock, retry loop and an a conditional atomic inc + atomic dec. The
> only thing that's slightly faster would be dma_resv_test_signaled()
>
> - I guess minimally we should rename dma_fence_get_rcu to
> dma_fence_tryget. It has nothing to do with rcu really, and the use is
> very, very limited.

I think what we should do is to use RCU internally in the dma_resv 
object but disallow drivers/frameworks to mess with that directly.

In other words drivers should use one of the following:
1. dma_resv_wait_timeout()
2. dma_resv_test_signaled()
3. dma_resv_copy_fences()
4. dma_resv_get_fences()
5. dma_resv_for_each_fence() <- to be implemented
6. dma_resv_for_each_fence_unlocked() <- to be implemented

Inside those functions we then make sure that we only save ways of 
accessing the RCU protected data structures.

This way we only need to make sure that those accessor functions are 
sane and don't need to audit every driver individually.

I can tackle implementing for the dma_res_for_each_fence()/_unlocked(). 
Already got a large bunch of that coded out anyway.

Regards,
Christian.

>
> Not sure what's a good idea here tbh.
> -Daniel

