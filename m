Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5ED3A3D6D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 09:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5446EE41;
	Fri, 11 Jun 2021 07:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2049.outbound.protection.outlook.com [40.107.100.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FAE6EE3D;
 Fri, 11 Jun 2021 07:42:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0ejDIfi7dJDzf8zTzYtSM+hQb1f4751s+MRBDv+m6V2jLqZh+WySrlCajSS1kDRR+/YQll0jATnRd22Jiqty2w1uw0sXlmTHMQBuuQVFdYVu1Den4c9qncTh+mORuL54IZPzbLZq9jrBl4Tedq0zRqZBFwgoCLNeexDMSKa1HiSzmN7bTpUZ7ZkxuiTccipz5DoulkelXNXVMuJ26l+uneFOWVY4DvWMz8YV1kjXMmz4DRAFL8/ssB3K46IZb0g6v39GuelfvNQkWoGmWBpfL9BJpq3df92NbPkQhYN4bVK2fgKnbmnFXB6ntiIZR/Diz75knYFsyQAgOOL1Ed2Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7G6PfnRBc8egt7ErLY9efQtsATkDvaF3Wqb/4PtaYc=;
 b=n3rU0KOyrkfzctYjRHhFNU02ANU4VNfq54x/ZVNNFRIPbIss1kwgF6lY/ZkWzDzQclFukE0s4SfssHS5KYnBGieH33tyU8ehF4H/Q60T5/8jnJpszS50X1xxK7MQ+VsVC7agqE9oh3iUO9IvUNKKsBzoWRutSZQYOvT5dmlEv0Ha+oQ5z1cF7BvSgOpVeiieBS4O50wPVkAFmZPH6ZCqwUVTp3p56BT8VQhLvrbieCcFPTsNH0VKRz0RCCHbRJqiGrHUKuv8Ip2IBEY+MyPfF3ZzaQazEl2vcz1OyZKVfs8OJw4cskf/5hxJBosbvL+OPn9ooANfCcHvTspqMomjZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d7G6PfnRBc8egt7ErLY9efQtsATkDvaF3Wqb/4PtaYc=;
 b=VfQNQrTDyGJtDd6/7YXfkttbL3GTvB+F2sd3qW1cF+cFrXUNySNU1TqueeaVzVKGBDYRrC/XwC8fsNrreFSwGmEb4pic/Mp4wDfsnOU2Jjd/mj/6XJdG5j7tvCZGNTM0JHAe4Ejs7Avo1/4zXMFTJqKR0o8oKJbNniFX99RRBGU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Fri, 11 Jun
 2021 07:42:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Fri, 11 Jun 2021
 07:42:13 +0000
Subject: Re: [Intel-gfx] [PATCH 0/5] dma-fence, i915: Stop allowing
 SLAB_TYPESAFE_BY_RCU for dma_fence
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <ae289388-911f-2928-d695-050863ee1007@linux.intel.com>
 <f9be43e3-4107-3742-a11b-8021b2c19e32@amd.com>
 <CAKMK7uFMEdFjUSphcyxuKMW8HfLOWQAE2iw-Fei+SRTDwUbRdQ@mail.gmail.com>
 <CAOFGe95BhZ7jXLxarL=2_zNYDydEoPJWnDWAG3aaeEJsDzR5dA@mail.gmail.com>
 <CAOFGe96KrBfvBKxcUNwths5Sigk7fk7ycLeYbgxutL3msEgfyA@mail.gmail.com>
 <CAKMK7uGqGLKFp7Obp-5xW3fPuoRmBa_0OawN-4Q-niDi147tXQ@mail.gmail.com>
 <4dc8314b-4366-2d92-4cca-1497a7c73721@amd.com>
 <CAKMK7uHhL3kepoaznCvAsx8H20sBjWQZgsnWY+zm63KgfCA4CQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b475e546-02d5-bacf-8764-233efd784ba0@amd.com>
Date: Fri, 11 Jun 2021 09:42:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uHhL3kepoaznCvAsx8H20sBjWQZgsnWY+zm63KgfCA4CQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1e99:1d6a:3624:888b]
X-ClientProxiedBy: PR0P264CA0071.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1e99:1d6a:3624:888b]
 (2a02:908:1252:fb60:1e99:1d6a:3624:888b) by
 PR0P264CA0071.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1d::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Fri, 11 Jun 2021 07:42:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f0da5c4-43f4-4ced-df86-08d92cac6d5a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4518122E6B84E871A045A2B183349@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7APxHjAdHCw3VpvctN+IGvR4aToYDjRDqBaQwe8A3f5ctT4YTC/EtUbA6mblF6kEpwy7BHTtPnaQW/3uKT/HWtmSiqjWosJMiiMPu9o2wAguO9LanlGxC9lu1YoS/mdYjdXanbmCn5PTUAAcjejwPAFd2Wx+iKOBmlrR9h8qBaVPdGqQb0/UCGV8cUdbadjsM+YI20CuGk/huo5BFuTLRerWytUuaNp8AgalT1stZ/XrYfI83btxzlMv3T6//iiN50cGcMvQF/3PeUCG2ZXe1RcHbReipD/gvqqwsFBDmxTZrin68VpVlsVJCVIsCDaok9Tx1RMdrzWOleGlKM3HYDCn9nI/ioToLZOCB4PzZd9G7t35anZYfgdMQZZam0Nk0G+ad5DABMUNGfxVo/bjhkY6pfkac/eHaIWzsO6uUI0N1ICx5B+ieRu1/Clcs0/lld5xZhO3YNUok5HGAzXeXvhKLHR3y1fWlykwzTdq4FqQ2fKONiojq3bnsfIJje3SCVUx/FHLheuyzkjXM4Rc9nFP50qQFK4CXMpUrHfSmTuaVYxfS5qovy6vV4a67Pr49wDaJAkxhdjfKYtr4L6AyKWrryW+8X3ugbUlkUFL3jcmf0fwBuK+qL14tO4+FB9ANdT9pNThtL1bXAZge8a4Ok808d2KpT7IhuF43bUcTJAbIfbtljhLHvqZaBPum02y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(31686004)(66574015)(53546011)(54906003)(5660300002)(2906002)(6486002)(36756003)(2616005)(86362001)(6666004)(110136005)(316002)(8676002)(66476007)(66556008)(8936002)(38100700002)(4326008)(31696002)(83380400001)(186003)(478600001)(16526019)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzJ5djl5RTVTb0hPdDMvQmd0YzdoZHlxcWRBUFBOZ0RCb0prZmlOVUs0eGRm?=
 =?utf-8?B?Q0VrZFN3L2FTQ2JGQUtKNkw2VXBIVFUzSXNwa1hmci9SdFU2ZlJQWnFzOVVU?=
 =?utf-8?B?T0tpVWtoOWZyRC82UWE5d1o3aUdBdzRrRmVuM1lydnNYNThtN0lNQ2ZueFlE?=
 =?utf-8?B?TDZlM0lhekJobVJPSk1LLzYvMDVHekZnOS9RWEg4NW1zVXczRnhxQmxQUmRR?=
 =?utf-8?B?MDhSZnltU2RPT1JmTHpOMFk2L1ZsTXAwVi9sTVpHS3hJT29maHlSQW9LUWUw?=
 =?utf-8?B?NTAxVmNBeDdYZUhHdUVpdVgzU2JCOWEraDl2aFEzWm1iaVN4dlYzd0YralRD?=
 =?utf-8?B?amplKzNBSnJ4eGp0bFVMMG1veDVFMlh1Y1o1cENLMHRWUkVzR3cxMHpQeFBL?=
 =?utf-8?B?djFkSGtNM0hydXlIakJqSGZGbGtVdUhvN1dwTHFGVXFPa1p5WFVDWnBIREk1?=
 =?utf-8?B?cnBKWFJHOXdIVlFYVXoyMzZJM2FRQWlRRE45c0VXUFZGVnI1bjNKNFFVdURp?=
 =?utf-8?B?aGk3SVJKTTJKTUZJVFJHQ1liL2RmRGo4dEdUSTI5OGZEeEo3TnR3d0NENmEr?=
 =?utf-8?B?b2thL3lnbHFCK0hRL0F2ZUhTMkdLZ0ZsaFRTTEJKRm1VdDcxZjFNU2x6Y0Ey?=
 =?utf-8?B?alh0NGdYRThEdVhUeC9SbU9GR1owSnVJRzIrRFVOejFTQmxJcEhSeEJQSmxO?=
 =?utf-8?B?MWp0dENqdnVsY2w0dFhCNXgvZWRibGsvbHFmNDl4NEQxT2RuZHNqZDZLOW1X?=
 =?utf-8?B?Q0hqNS83TkpoYkxEdjlIckd4SlVXcUplZmZ0NTBvenBxdmthRE9tZkZUNisr?=
 =?utf-8?B?QVVEWlUrNGtBMElvT1h4UVF6STdLdmo5Nk96dWk3R1BEbHlCLzhXM3F3N0Zw?=
 =?utf-8?B?U2oxNnZmMEpOaHZuR2l3NEFCdGdGM3cwcGwzZm1TT09FbXo5UUNZTE5MS0Vu?=
 =?utf-8?B?eUw5d003dnl6VW52S3MyZEtla2ZMY0NYcm9MME9yOEkzZVB0elVaeXgycUxM?=
 =?utf-8?B?Sk1vYkJrRVFrS25IRVhpdC9JM2xNUUdDc1l1V0Zpc1ZVZVBXZXJRM0RLUjgz?=
 =?utf-8?B?VjlUUjk4b0NOU2ZjMFFNdENnNVdLdFVnYzRSdUZ6Y2JHRm8zd2EyRG1XT085?=
 =?utf-8?B?dkZSbXNlOUZuTFVYZHlPZzluMEJyYkhpUHl2Rmh2L3pZOVlFT1YyMy9PcGhw?=
 =?utf-8?B?SDdxc1FBbzVnRTV6SzVLNGE2OW4rZzIzTkpzeE12OVV1dU1DNThMQ0hoeURZ?=
 =?utf-8?B?UVg2K0p5ZktUT0xPZ2JaZVlhWmJjb2NrRTZwcWp0b1ZvSzhmSnJYWTBuTGhU?=
 =?utf-8?B?RjdxbThMYmRyTmpIY3o3anlQYmNZQkY5QlhwbFFoU1hPVkhBcFZyZFBFTlF1?=
 =?utf-8?B?eEZDOEFoZFVlV2cvTkRJVmFSZHd1OGpMb3hmZ3Y4bFY1L3ZveENNV2NJL25l?=
 =?utf-8?B?UHZNamtzMkltMFQ0Ly9MMDg0d3A1WVpOSFFYNktySzBNY2FpMzhNRmFGT0p4?=
 =?utf-8?B?dENBMDd2UGczaXArUFdsSldSclNiTkhoZXlDNWxBbjg0VC96blVsUk54L1Ez?=
 =?utf-8?B?c05CUjdxcU9XOVROLzdON1VKYXZhWVdQUVpXaE1HVW1pRm9HN3BQSStNSElW?=
 =?utf-8?B?QlNndU10aGRLR3N1dTFIcGVEdCtuK250WExrZ3JiYnlBTUNRMmZ5bTdjTThv?=
 =?utf-8?B?anl3dkFHbVJmanRQUHFocEZmazM0S0l2YzluS0xBNDU3Z1d0WFJZKzlrbm9S?=
 =?utf-8?B?TElQZW5QSUZpMHdnaEVnZHI5MzA1ZGdTMWdPelE5bjJBQTJMUW5JRVdXVDFk?=
 =?utf-8?B?ZXQzNHFGUStaV2xKV2dSVTBRWURIdHBXc1dPRG9qekVZMGg4dDcyb0N0RDAw?=
 =?utf-8?Q?SsRxClVXiNnGC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f0da5c4-43f4-4ced-df86-08d92cac6d5a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 07:42:13.1284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARZTBmru/nzSpdmLwCmBU/ZHlCOh8rNW8lsILER6t37qu0oNS3njYAPYyk1I7zTG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.06.21 um 09:20 schrieb Daniel Vetter:
> On Fri, Jun 11, 2021 at 8:55 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 10.06.21 um 22:42 schrieb Daniel Vetter:
>>> On Thu, Jun 10, 2021 at 10:10 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>>> On Thu, Jun 10, 2021 at 8:35 AM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>>>> On Thu, Jun 10, 2021 at 6:30 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>>> On Thu, Jun 10, 2021 at 11:39 AM Christian König
>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>> Am 10.06.21 um 11:29 schrieb Tvrtko Ursulin:
>>>>>>>> On 09/06/2021 22:29, Jason Ekstrand wrote:
>>>>>>>>> We've tried to keep it somewhat contained by doing most of the hard work
>>>>>>>>> to prevent access of recycled objects via dma_fence_get_rcu_safe().
>>>>>>>>> However, a quick grep of kernel sources says that, of the 30 instances
>>>>>>>>> of dma_fence_get_rcu*, only 11 of them use dma_fence_get_rcu_safe().
>>>>>>>>> It's likely there bear traps in DRM and related subsystems just waiting
>>>>>>>>> for someone to accidentally step in them.
>>>>>>>> ...because dma_fence_get_rcu_safe apears to be about whether the
>>>>>>>> *pointer* to the fence itself is rcu protected, not about the fence
>>>>>>>> object itself.
>>>>>>> Yes, exactly that.
>>>>> The fact that both of you think this either means that I've completely
>>>>> missed what's going on with RCUs here (possible but, in this case, I
>>>>> think unlikely) or RCUs on dma fences should scare us all.
>>>> Taking a step back for a second and ignoring SLAB_TYPESAFE_BY_RCU as
>>>> such,  I'd like to ask a slightly different question:  What are the
>>>> rules about what is allowed to be done under the RCU read lock and
>>>> what guarantees does a driver need to provide?
>>>>
>>>> I think so far that we've all agreed on the following:
>>>>
>>>>    1. Freeing an unsignaled fence is ok as long as it doesn't have any
>>>> pending callbacks.  (Callbacks should hold a reference anyway).
>>>>
>>>>    2. The pointer race solved by dma_fence_get_rcu_safe is real and
>>>> requires the loop to sort out.
>>>>
>>>> But let's say I have a dma_fence pointer that I got from, say, calling
>>>> dma_resv_excl_fence() under rcu_read_lock().  What am I allowed to do
>>>> with it under the RCU lock?  What assumptions can I make?  Is this
>>>> code, for instance, ok?
>>>>
>>>> rcu_read_lock();
>>>> fence = dma_resv_excl_fence(obj);
>>>> idle = !fence || test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
>>>> rcu_read_unlock();
>>>>
>>>> This code very much looks correct under the following assumptions:
>>>>
>>>>    1. A valid fence pointer stays alive under the RCU read lock
>>>>    2. SIGNALED_BIT is set-once (it's never unset after being set).
>>>>
>>>> However, if it were, we wouldn't have dma_resv_test_singnaled(), now
>>>> would we? :-)
>>>>
>>>> The moment you introduce ANY dma_fence recycling that recycles a
>>>> dma_fence within a single RCU grace period, all your assumptions break
>>>> down.  SLAB_TYPESAFE_BY_RCU is just one way that i915 does this.  We
>>>> also have a little i915_request recycler to try and help with memory
>>>> pressure scenarios in certain critical sections that also doesn't
>>>> respect RCU grace periods.  And, as mentioned multiple times, our
>>>> recycling leaks into every other driver because, thanks to i915's
>>>> choice, the above 4-line code snippet isn't valid ANYWHERE in the
>>>> kernel.
>>>>
>>>> So the question I'm raising isn't so much about the rules today.
>>>> Today, we live in the wild wild west where everything is YOLO.  But
>>>> where do we want to go?  Do we like this wild west world?  So we want
>>>> more consistency under the RCU read lock?  If so, what do we want the
>>>> rules to be?
>>>>
>>>> One option would be to accept the wild-west world we live in and say
>>>> "The RCU read lock gains you nothing.  If you want to touch the guts
>>>> of a dma_fence, take a reference".  But, at that point, we're eating
>>>> two atomics for every time someone wants to look at a dma_fence.  Do
>>>> we want that?
>>>>
>>>> Alternatively, and this what I think Daniel and I were trying to
>>>> propose here, is that we place some constraints on dma_fence
>>>> recycling.  Specifically that, under the RCU read lock, the fence
>>>> doesn't suddenly become a new fence.  All of the immutability and
>>>> once-mutability guarantees of various bits of dma_fence hold as long
>>>> as you have the RCU read lock.
>>> Yeah this is suboptimal. Too many potential bugs, not enough benefits.
>>>
>>> This entire __rcu business started so that there would be a lockless
>>> way to get at fences, or at least the exclusive one. That did not
>>> really pan out. I think we have a few options:
>>>
>>> - drop the idea of rcu/lockless dma-fence access outright. A quick
>>> sequence of grabbing the lock, acquiring the dma_fence and then
>>> dropping your lock again is probably plenty good. There's a lot of
>>> call_rcu and other stuff we could probably delete. I have no idea what
>>> the perf impact across all the drivers would be.
>> The question is maybe not the perf impact, but rather if that is
>> possible over all.
>>
>> IIRC we now have some cases in TTM where RCU is mandatory and we simply
>> don't have any other choice than using it.
> Adding Thomas Hellstrom.
>
> Where is that stuff? If we end up with all the dma_resv locking
> complexity just for an oddball, then I think that would be rather big
> bummer.

This is during buffer destruction. See the call to dma_resv_copy_fences().

But that is basically just using a dma_resv function which accesses the 
object without taking a lock.

>>> - try to make all drivers follow some stricter rules. The trouble is
>>> that at least with radeon dma_fence callbacks aren't even very
>>> reliable (that's why it has its own dma_fence_wait implementation), so
>>> things are wobbly anyway.
>>>
>>> - live with the current situation, but radically delete all unsafe
>>> interfaces. I.e. nothing is allowed to directly deref an rcu fence
>>> pointer, everything goes through dma_fence_get_rcu_safe. The
>>> kref_get_unless_zero would become an internal implementation detail.
>>> Our "fast" and "lockless" dma_resv fence access stays a pile of
>>> seqlock, retry loop and an a conditional atomic inc + atomic dec. The
>>> only thing that's slightly faster would be dma_resv_test_signaled()
>>>
>>> - I guess minimally we should rename dma_fence_get_rcu to
>>> dma_fence_tryget. It has nothing to do with rcu really, and the use is
>>> very, very limited.
>> I think what we should do is to use RCU internally in the dma_resv
>> object but disallow drivers/frameworks to mess with that directly.
>>
>> In other words drivers should use one of the following:
>> 1. dma_resv_wait_timeout()
>> 2. dma_resv_test_signaled()
>> 3. dma_resv_copy_fences()
>> 4. dma_resv_get_fences()
>> 5. dma_resv_for_each_fence() <- to be implemented
>> 6. dma_resv_for_each_fence_unlocked() <- to be implemented
>>
>> Inside those functions we then make sure that we only save ways of
>> accessing the RCU protected data structures.
>>
>> This way we only need to make sure that those accessor functions are
>> sane and don't need to audit every driver individually.
> Yeah better encapsulation for dma_resv sounds like a good thing, least
> for all the other issues we've been discussing recently. I guess your
> list is also missing the various "add/replace some more fences"
> functions, but we have them already.
>
>> I can tackle implementing for the dma_res_for_each_fence()/_unlocked().
>> Already got a large bunch of that coded out anyway.
> When/where do we need ot iterate over fences unlocked? Given how much
> pain it is to get a consistent snapshot of the fences or fence state
> (I've read  the dma-buf poll implementation, and it looks a bit buggy
> in that regard, but not sure, just as an example) and unlocked
> iterator sounds very dangerous to me.

This is to make implementation of the other functions easier. Currently 
they basically each roll their own loop implementation which at least 
for dma_resv_test_signaled() looks a bit questionable to me.

Additionally to those we we have one more case in i915 and the unlocked 
polling implementation which I agree is a bit questionable as well.

My idea is to have the problematic logic in the iterator and only give 
back fence which have a reference and are 100% sure the right one.

Probably best if I show some code around to explain what I mean.

Regards,
Christian.

> -Daniel

