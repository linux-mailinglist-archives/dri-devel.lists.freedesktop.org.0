Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3CF3A3175
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 18:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982FD6EDBA;
	Thu, 10 Jun 2021 16:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0B06EDBA;
 Thu, 10 Jun 2021 16:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXhDuB1fNe3eIt4+qRpwGfnIFx+RSZMSdxr59V225x5lxWOGX2LmHKrWSM4TSfA++1wWzqqxp9IIGizlnraPJ8REiHoCi1F/ERSpTvNgdQ0MkNZRCFvoi4KwZaSyPN51jXOdOYejIM9Khco6wd4YOccqOeBrcxvVO9MbT+2tD3CS1NMIuWGXT6xo/z+IJvQB/Nshylg3jqCGBk9FHsuoGl3o0aWQyRPm8WZ6dfWrO7cRDA/xiH9RKkTQveq2lIn6aQ03Lyoryn42AbyrCOrsyNi5tB0+wEvDscjifMIt6fmTeCYp/9YzJw57uOMTWHVobp1m0lLtYW7v8EuiJGzPKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnMcPwnAhA2HHvAC4T4Tx2Xo0fJppOEYedn/Cu/frBI=;
 b=VPVR0NvTSDntQf9VJpR3gjJRK+TS9Bz7wd4MpLRhI9qTKMkUrGdZupt9sF+8I0/aSR5aHhvCCylpfAB8bJ/q+X7ifyDk1T/5nQa39GWYT0qXBEFtTSeNBUVGu0JnGy2N8i/gCaDTasdCLidbQvUr68nTDN+SqyMTm28AhGyJS3LKIZt6WakVQQK+lfAI+sDYyJ+meUxd4U2+F+IenfKZwE8B9W2n6Gkj5tngrc9nZ+MgIZ/TZlvC/Tpo99zGb+NfnjNcHwykdtYmRHthiBwRjp0leaFC6mNwu+iRvxQZatyavxY3QV4Dr34SSIei7/GsCkcAORmg0MIbxGYvrgO7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnMcPwnAhA2HHvAC4T4Tx2Xo0fJppOEYedn/Cu/frBI=;
 b=pGU1cyJY1syiN95PWRNHUCBB9Y4gyOXH/Vb+24PZLr0fiKd7U+VAKpTkAGPRv1iSlCkrJdgHu8K/T/3cdsxHq8CXQz2DGQkuqssKMEo3P8lWkUkknlJLniUaSFX50uVQybI/wwygaG3AcUQSOUKCG52yRxrDz1JHLXxS4D0a1Ls=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Thu, 10 Jun
 2021 16:54:19 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 16:54:19 +0000
Subject: Re: [PATCH 5/5] DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-6-jason@jlekstrand.net>
 <ea36431d-521a-c1c0-59e5-a196f55c28dd@amd.com>
 <CAOFGe97+JK9-HLsVrXdvm45Qk721utwpHyy8xpqR7uRCpZm5ig@mail.gmail.com>
 <CAKMK7uGsQ3BWomCQtvrSygb-nc19LpAz2RFjsBzw-E_17tq8BA@mail.gmail.com>
 <CAOFGe947JR3tBLb-4istEX2XNU7pp4+sjgpGYGSXLWEuCcR27g@mail.gmail.com>
 <CAKMK7uFQNbOA_ijVRFrudCxNN9iqqkohq=USEG3ipcOGJHNg1g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <caca6152-2931-5bce-a193-11fdf42e291e@amd.com>
Date: Thu, 10 Jun 2021 18:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAKMK7uFQNbOA_ijVRFrudCxNN9iqqkohq=USEG3ipcOGJHNg1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c285:5f9a:99f5:633e]
X-ClientProxiedBy: PR2PR09CA0005.eurprd09.prod.outlook.com
 (2603:10a6:101:16::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e]
 (2a02:908:1252:fb60:c285:5f9a:99f5:633e) by
 PR2PR09CA0005.eurprd09.prod.outlook.com (2603:10a6:101:16::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 16:54:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b15866b1-5933-4178-f113-08d92c3063cb
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4342BB8E0922CAB9D2CEEBB883359@MN2PR12MB4342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wLHvtifR+uR3p2RovOIsYtx89L+be1WVQx1Q1IcZYoZKKl+JhrpYuBkLwO8cbviQFJa6eCL26F5iyfhDqHI5rzt7LO5gRhqP3Uy7P5UK9WwYO0KSEHXSxTNvY7xd+H5AiZvwB4+Z72AE1FWOsFLktuernyqtoROjuewBPV2oPN0TkE+Y/z3AKrN8HBzxUH3ufYlxHjbLvmi+RLd8FdaepJJGggufArowrVQh8URQN/UtidQnytC11dHcdj5eAPGmKUfTVcxMkQa8Sw+SY9TrMs5gk3EtY9KONK40VmPG9LL4pwy7k8+0uUwRoj3HEU8mp2qhHDIlVNKVQ7cA2D8zWPAhUpg2n3pE+Lwcw/uO/jR2tc8vVTMFktf6Qa24xEsncD3cQcbmBgkTGzTuVWP+pmHIsYqohwbAGXv0sB3//VRMbUOAYMHTPrU81+InR9nix5WUJnx6EG6ViTrsRtCJts+u9Exgi4ZkPYkTWjCeAwtX5ldjEneHaRpG2zqv7qt72c8XVUctTRmMzkmntgJK+JKrQh0Gbl7YlO9nLmmFI3hZj+uvruPbGTswUTAPiMUD7tjTwJv/FnBEJ5UoftZVd6fqrkWNLhj5ElmSOdmykchLlE3gL33XBZ/Hwuw6QFhmHIP+WtqVfZV8lhJ3amC0+MtcaGzVPSbbWl8fxxHt/yhpmTZbOKPJZxAXFySjW8udarCHiRvtgQT7kK+jdO3QhV5R4L/gAk0exHMhsSgKJCSaOoHriGvw0xQ6A0SuA8iaeFxaSkeGb0TQGDUQfyXMkik5NVi+sZGC/Jiz2I90vH4ZcjzpPp4mbrjFGLLXpiuG6Ml4gvuq1RfegRnDHefGPwt6nBcfNgzgLiS7l38YMB8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(2616005)(45080400002)(4326008)(5660300002)(2906002)(110136005)(31696002)(186003)(16526019)(478600001)(66574015)(54906003)(38100700002)(6486002)(316002)(8936002)(30864003)(83380400001)(6666004)(36756003)(86362001)(8676002)(966005)(53546011)(31686004)(66946007)(66556008)(66476007)(26583001)(87944003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDk2L2hHV0ZZNWJJWlJaRkpMSCttKzdMSkF0bEhlbXFsZGUvQUpuQUg5Wmh5?=
 =?utf-8?B?TEMrSGlkRzZpQTNGOUtSQWNUYjI5QVJMTERHRmwzdlhLUHUyd0RYSTRiWmRk?=
 =?utf-8?B?a2pCbjlaU084djRVcXZ1cENLNGpwWGVzbS9jUFd2RmFoTkwxYVplQUVrcmlD?=
 =?utf-8?B?QXpKUWxBMnFLY2paY3lraGx3NnUyY2lmc0pJYUR1V2xRUnpic2lMMTNxMHZZ?=
 =?utf-8?B?Nmg1bTdEMjFKUU5zRVZpVGdsUDladG5Hcmx5cmw0aXhZcHZzeFkxekpIOGhS?=
 =?utf-8?B?dklsSEQ2OGViMjJacFJkcE9CMEEvTytDbDdCa2xhRlAyVjM2MzRNcVl4NkFI?=
 =?utf-8?B?Zy8zVllwYzJ3Ykt4WHd5Q28zS2dLRjdUazMwUEdtemtHQ3gxalVRS1dRcEFP?=
 =?utf-8?B?d0c2SnNaQlhKOHVkMDR0SzRJYUhVU296Q3V3c2pPc3grVHNSV0NKK2N1MFZ4?=
 =?utf-8?B?VjB3SEdkVWE5aGNhSG5KZHRLT0xXLythTWxpbVFzZGxTNjE1SHV0ckxNK2FO?=
 =?utf-8?B?a1MzdURRdEs0eThPdTFaNUpyS2JwQ0RtaGY4blZwdHozUXBiNjNDdUh3eTZ5?=
 =?utf-8?B?QktUdmxwVW5PRTIxMkxFUjdIckVweUNqdkdSRE5CWmg2N1RZSGhXVjlrckdt?=
 =?utf-8?B?WnFIUHFFdHNWQ1BnSVlJZmxjWUdUQWRvNTVFSzFHS0U2dnR1UmFVaWZoUEJY?=
 =?utf-8?B?NG16NWhzV1V0ZWJsRlFMNTlyTFJFUGk0K1ZLK3RQZzRuY3l0OCs3Y0VDVjhK?=
 =?utf-8?B?NDZhWnFLMVFlY0J2QlFWMnBvY05XcHdweERKQ0hDY0duVkVIaGVSdkVxSWRB?=
 =?utf-8?B?eERmaFBoRngxQ3k0dURSNkJ0V1d3QU5za1FZRDhRZkE2YmFvRXZpMTB3S3VE?=
 =?utf-8?B?cHJIdjZldUNHNS96ZDQyOTZVcU5QcFQrY2c2Z3BTeDhlQUNKTzNCMkN6ZVNl?=
 =?utf-8?B?dGhLOHljbFZEM2htRFBuMjZiS3lBRkx1UUZKQjNTQnYveEpwV1lVa0VsckdB?=
 =?utf-8?B?Ukluc0p2dTRLTDRaK1dnWWlwNDdLZFpxbWtQY0hudXU2WUozdUVrTU84WHZB?=
 =?utf-8?B?Y3A4RFZ5N1h5MERkNG1tK3FRclVvRitGS0dXMXBBZUxiNkdiS0ZhUjMyc2Fx?=
 =?utf-8?B?SUhlWlIxOEIydnIzandERXVsMU8ySDR6MWxqU2RvZ0l6Sm9YQUhhRUdXTTVy?=
 =?utf-8?B?Mm8zaWUrSFBWREZRdDFpb0JWWmZtNlhOUEJwZlY1aUJ3a3E3N2RIZCtlNjM5?=
 =?utf-8?B?emJqcnBNQyswc2tDblpkV2g3ZTBlcHdiY2F5c2E5R0hQNDBwVGhHQXkvT0lS?=
 =?utf-8?B?a2M2WVVUVkZsaUVCREsxcFBBZXQwZFJDTDBoSmcyUnA5bjBxRUdUMXlrSDlE?=
 =?utf-8?B?bzVoc2tzU2pDTGVsNlVMUWxYSVUvYzNnWUZzNkdJMS9rNTVuMncyMzBpQzFP?=
 =?utf-8?B?TlVYcWVHZ3Y5dU1uaTNSUHROaUYvNmJnbVdTZVRpR1lXKy9zdmdRbHVCc1NG?=
 =?utf-8?B?L0FNR1FyODVrdVR6aWQ4NTNZM21LLytxb3ZzbVdyVmgvb2tUVWgwUTNtc0ln?=
 =?utf-8?B?alJzQnJkMHhIdEhKMURkeGhDR3FOOXpXbyszdzlZN1VCb3lqcUFKSkRsd0t4?=
 =?utf-8?B?NjNrRW1JN1Q3RDF6blUzaHJBUVJlb0FRR1RvVEszZkhVK2FxbkpYYTkweGNs?=
 =?utf-8?B?RUtvckdpY2NsQ3BkdG9SUCtEa3ordW5Jd0E5UlY4Z3p2VE9uV1BFcUNacHNB?=
 =?utf-8?B?SHltbFcya0FVMzIrQVdJWkJyS09pWWVlQ3FrcnBWbWkxVlhHV3IxTWs2NXBT?=
 =?utf-8?B?TURKTXYvUWhYVzZxMGk1R3plU1FLeVp2b2ZVajVZMFpVMjRuMFVWVWV2MUxa?=
 =?utf-8?Q?ZCKxmc5PxQykD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15866b1-5933-4178-f113-08d92c3063cb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 16:54:19.6316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LHXOfnc1dNgzIWNESBQsRrQ+B/to0iMWQyUJRrBwX9pfPlzZdKZ8KtAp0CveMSea
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.21 um 18:37 schrieb Daniel Vetter:
> On Thu, Jun 10, 2021 at 6:24 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>> On Thu, Jun 10, 2021 at 10:13 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>> On Thu, Jun 10, 2021 at 3:59 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>>> On Thu, Jun 10, 2021 at 1:51 AM Christian König
>>>> <christian.koenig@amd.com> wrote:
>>>>> Am 09.06.21 um 23:29 schrieb Jason Ekstrand:
>>>>>> This helper existed to handle the weird corner-cases caused by using
>>>>>> SLAB_TYPESAFE_BY_RCU for backing dma_fence.  Now that no one is using
>>>>>> that anymore (i915 was the only real user), dma_fence_get_rcu is
>>>>>> sufficient.  The one slightly annoying thing we have to deal with here
>>>>>> is that dma_fence_get_rcu_safe did an rcu_dereference as well as a
>>>>>> SLAB_TYPESAFE_BY_RCU-safe dma_fence_get_rcu.  This means each call site
>>>>>> ends up being 3 lines instead of 1.
>>>>> That's an outright NAK.
>>>>>
>>>>> The loop in dma_fence_get_rcu_safe is necessary because the underlying
>>>>> fence object can be replaced while taking the reference.
>>>> Right.  I had missed a bit of that when I first read through it.  I
>>>> see the need for the loop now.  But there are some other tricky bits
>>>> in there besides just the loop.
>>> I thought that's what the kref_get_unless_zero was for in
>>> dma_fence_get_rcu? Otherwise I guess I'm not seeing why still have
>>> dma_fence_get_rcu around, since that should either be a kref_get or
>>> it's just unsafe to call it ...
>> AFAICT, dma_fence_get_rcu is unsafe unless you somehow know that it's
>> your fence and it's never recycled.
>>
>> Where the loop comes in is if you have someone come along, under the
>> RCU write lock or not, and swap out the pointer and unref it while
>> you're trying to fetch it.  In this case, if you just write the three
>> lines I duplicated throughout this patch, you'll end up with NULL if
>> you (partially) lose the race.  The loop exists to ensure that you get
>> either the old pointer or the new pointer and you only ever get NULL
>> if somewhere during the mess, the pointer actually gets set to NULL.
> It's not that easy. At least not for dma_resv.
>
> The thing is, you can't just go in and replace the write fence with
> something else. There's supposed to be some ordering here (how much we
> actually still follow that or not is a bit another question, that I'm
> trying to answer with an audit of lots of drivers), which means if you
> replace e.g. the exclusive fence, the previous fence will _not_ just
> get freed. Because the next exclusive fence needs to wait for that to
> finish first.
>
> Conceptually the refcount will _only_ go to 0 once all later
> dependencies have seen it get signalled, and once the fence itself has
> been signalled.

I think that's the point where it breaks.

See IIRC radeon for example doesn't keep unsignaled fences around when 
nobody is interested in them. And I think noveau does it that way as well.

So for example you can have the following
1. Submission to 3D ring, this creates fence A.
2. Fence A is put as en exclusive fence in a dma_resv object.
3. Submission to 3D ring, this creates fence B.
4. Fence B is replacing fence A as the exclusive fence in the dma_resv 
object.

Fence A is replaced and therefore destroyed while it is not even close 
to be signaled. But the replacement is perfectly ok, since fence B is 
submitted to the same ring.

When somebody would use dma_fence_get_rcu on the exclusive fence and get 
NULL it would fail to wait for the submissions. You don't really need 
the SLAB_TYPESAFE_BY_RCU for this to blow up in your face.

We could change that rule of curse, amdgpu for example is always keeping 
fences around until they are signaled. But IIRC that's how it was for 
radeon like forever.

Regards,
Christian.

>   A signalled fence might as well not exist, so if
> that's what  happened in that tiny window, then yes a legal scenario
> is the following:
>
> thread A:
> - rcu_dereference(resv->exclusive_fence);
>
> thread B:
> - dma_fence signals, retires, drops refcount to 0
> - sets the exclusive fence to NULL
> - creates a new dma_fence
> - sets the exclusive fence to that new fence
>
> thread A:
> - kref_get_unless_zero fails, we report that the exclusive fence slot is NULL
>
> Ofc normally we're fully pipeline, and we lazily clear slots, so no
> one ever writes the fence ptr to NULL. But conceptually it's totally
> fine, and an indistinguishable sequence of events from the point of
> view of thread A.
>
> Ergo dma_fence_get_rcu is enough. If it's not, we've screwed up really
> big time. The only reason you need _unsafe is if you have
> typesafe_by_rcu, or maybe if you yolo your fence ordering a bit much
> and break the DAG property in a few cases.
>
>> I agree with Christian that that part of dma_fence_get_rcu_safe needs
>> to stay.  I was missing that until I did my giant "let's walk through
>> the code" e-mail.
> Well if I'm wrong there's a _ton_ of broken code in upstream right
> now, even in dma-buf/dma-resv.c. We're using dma_fence_get_rcu a lot.
>
> Also the timing is all backwards: get_rcu_safe was added as a fix for
> when i915 made its dma_fence typesafe_by_rcu. We didn't have any need
> for this beforehand. So I'm really not quite buying this story here
> yet you're all trying to sell me on.
> -Daniel
>
>> --Jason
>>
>>>>> This is completely unrelated to SLAB_TYPESAFE_BY_RCU. See the
>>>>> dma_fence_chain usage for reference.
>>>>>
>>>>> What you can remove is the sequence number handling in dma-buf. That
>>>>> should make adding fences quite a bit quicker.
>>>> I'll look at that and try to understand what's going on there.
>>> Hm I thought the seqlock was to make sure we have a consistent set of
>>> fences across exclusive and all shared slot. Not to protect against
>>> the fence disappearing due to typesafe_by_rcu.
>>> -Daniel
>>>
>>>> --Jason
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>> ---
>>>>>>    drivers/dma-buf/dma-fence-chain.c         |  8 ++--
>>>>>>    drivers/dma-buf/dma-resv.c                |  4 +-
>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  4 +-
>>>>>>    drivers/gpu/drm/i915/i915_active.h        |  4 +-
>>>>>>    drivers/gpu/drm/i915/i915_vma.c           |  4 +-
>>>>>>    include/drm/drm_syncobj.h                 |  4 +-
>>>>>>    include/linux/dma-fence.h                 | 50 -----------------------
>>>>>>    include/linux/dma-resv.h                  |  4 +-
>>>>>>    8 files changed, 23 insertions(+), 59 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>>>>> index 7d129e68ac701..46dfc7d94d8ed 100644
>>>>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>>>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>>>>> @@ -15,15 +15,17 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
>>>>>>     * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
>>>>>>     * @chain: chain node to get the previous node from
>>>>>>     *
>>>>>> - * Use dma_fence_get_rcu_safe to get a reference to the previous fence of the
>>>>>> - * chain node.
>>>>>> + * Use rcu_dereference and dma_fence_get_rcu to get a reference to the
>>>>>> + * previous fence of the chain node.
>>>>>>     */
>>>>>>    static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
>>>>>>    {
>>>>>>        struct dma_fence *prev;
>>>>>>
>>>>>>        rcu_read_lock();
>>>>>> -     prev = dma_fence_get_rcu_safe(&chain->prev);
>>>>>> +     prev = rcu_dereference(chain->prev);
>>>>>> +     if (prev)
>>>>>> +             prev = dma_fence_get_rcu(prev);
>>>>>>        rcu_read_unlock();
>>>>>>        return prev;
>>>>>>    }
>>>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>>>> index f26c71747d43a..cfe0db3cca292 100644
>>>>>> --- a/drivers/dma-buf/dma-resv.c
>>>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>>>> @@ -376,7 +376,9 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>>>>>                dst_list = NULL;
>>>>>>        }
>>>>>>
>>>>>> -     new = dma_fence_get_rcu_safe(&src->fence_excl);
>>>>>> +     new = rcu_dereference(src->fence_excl);
>>>>>> +     if (new)
>>>>>> +             new = dma_fence_get_rcu(new);
>>>>>>        rcu_read_unlock();
>>>>>>
>>>>>>        src_list = dma_resv_shared_list(dst);
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> index 72d9b92b17547..0aeb6117f3893 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>> @@ -161,7 +161,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
>>>>>>                struct dma_fence *old;
>>>>>>
>>>>>>                rcu_read_lock();
>>>>>> -             old = dma_fence_get_rcu_safe(ptr);
>>>>>> +             old = rcu_dereference(*ptr);
>>>>>> +             if (old)
>>>>>> +                     old = dma_fence_get_rcu(old);
>>>>>>                rcu_read_unlock();
>>>>>>
>>>>>>                if (old) {
>>>>>> diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
>>>>>> index d0feda68b874f..bd89cfc806ca5 100644
>>>>>> --- a/drivers/gpu/drm/i915/i915_active.h
>>>>>> +++ b/drivers/gpu/drm/i915/i915_active.h
>>>>>> @@ -103,7 +103,9 @@ i915_active_fence_get(struct i915_active_fence *active)
>>>>>>        struct dma_fence *fence;
>>>>>>
>>>>>>        rcu_read_lock();
>>>>>> -     fence = dma_fence_get_rcu_safe(&active->fence);
>>>>>> +     fence = rcu_dereference(active->fence);
>>>>>> +     if (fence)
>>>>>> +             fence = dma_fence_get_rcu(fence);
>>>>>>        rcu_read_unlock();
>>>>>>
>>>>>>        return fence;
>>>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>>>>> index 0f227f28b2802..ed0388d99197e 100644
>>>>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>>>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>>> @@ -351,7 +351,9 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
>>>>>>                struct dma_fence *fence;
>>>>>>
>>>>>>                rcu_read_lock();
>>>>>> -             fence = dma_fence_get_rcu_safe(&vma->active.excl.fence);
>>>>>> +             fence = rcu_dereference(vma->active.excl.fence);
>>>>>> +             if (fence)
>>>>>> +                     fence = dma_fence_get_rcu(fence);
>>>>>>                rcu_read_unlock();
>>>>>>                if (fence) {
>>>>>>                        err = dma_fence_wait(fence, MAX_SCHEDULE_TIMEOUT);
>>>>>> diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
>>>>>> index 6cf7243a1dc5e..6c45d52988bcc 100644
>>>>>> --- a/include/drm/drm_syncobj.h
>>>>>> +++ b/include/drm/drm_syncobj.h
>>>>>> @@ -105,7 +105,9 @@ drm_syncobj_fence_get(struct drm_syncobj *syncobj)
>>>>>>        struct dma_fence *fence;
>>>>>>
>>>>>>        rcu_read_lock();
>>>>>> -     fence = dma_fence_get_rcu_safe(&syncobj->fence);
>>>>>> +     fence = rcu_dereference(syncobj->fence);
>>>>>> +     if (fence)
>>>>>> +             fence = dma_fence_get_rcu(syncobj->fence);
>>>>>>        rcu_read_unlock();
>>>>>>
>>>>>>        return fence;
>>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>>> index 6ffb4b2c63715..f4a2ab2b1ae46 100644
>>>>>> --- a/include/linux/dma-fence.h
>>>>>> +++ b/include/linux/dma-fence.h
>>>>>> @@ -307,56 +307,6 @@ static inline struct dma_fence *dma_fence_get_rcu(struct dma_fence *fence)
>>>>>>                return NULL;
>>>>>>    }
>>>>>>
>>>>>> -/**
>>>>>> - * dma_fence_get_rcu_safe  - acquire a reference to an RCU tracked fence
>>>>>> - * @fencep: pointer to fence to increase refcount of
>>>>>> - *
>>>>>> - * Function returns NULL if no refcount could be obtained, or the fence.
>>>>>> - * This function handles acquiring a reference to a fence that may be
>>>>>> - * reallocated within the RCU grace period (such as with SLAB_TYPESAFE_BY_RCU),
>>>>>> - * so long as the caller is using RCU on the pointer to the fence.
>>>>>> - *
>>>>>> - * An alternative mechanism is to employ a seqlock to protect a bunch of
>>>>>> - * fences, such as used by struct dma_resv. When using a seqlock,
>>>>>> - * the seqlock must be taken before and checked after a reference to the
>>>>>> - * fence is acquired (as shown here).
>>>>>> - *
>>>>>> - * The caller is required to hold the RCU read lock.
>>>>>> - */
>>>>>> -static inline struct dma_fence *
>>>>>> -dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>>>>>> -{
>>>>>> -     do {
>>>>>> -             struct dma_fence *fence;
>>>>>> -
>>>>>> -             fence = rcu_dereference(*fencep);
>>>>>> -             if (!fence)
>>>>>> -                     return NULL;
>>>>>> -
>>>>>> -             if (!dma_fence_get_rcu(fence))
>>>>>> -                     continue;
>>>>>> -
>>>>>> -             /* The atomic_inc_not_zero() inside dma_fence_get_rcu()
>>>>>> -              * provides a full memory barrier upon success (such as now).
>>>>>> -              * This is paired with the write barrier from assigning
>>>>>> -              * to the __rcu protected fence pointer so that if that
>>>>>> -              * pointer still matches the current fence, we know we
>>>>>> -              * have successfully acquire a reference to it. If it no
>>>>>> -              * longer matches, we are holding a reference to some other
>>>>>> -              * reallocated pointer. This is possible if the allocator
>>>>>> -              * is using a freelist like SLAB_TYPESAFE_BY_RCU where the
>>>>>> -              * fence remains valid for the RCU grace period, but it
>>>>>> -              * may be reallocated. When using such allocators, we are
>>>>>> -              * responsible for ensuring the reference we get is to
>>>>>> -              * the right fence, as below.
>>>>>> -              */
>>>>>> -             if (fence == rcu_access_pointer(*fencep))
>>>>>> -                     return rcu_pointer_handoff(fence);
>>>>>> -
>>>>>> -             dma_fence_put(fence);
>>>>>> -     } while (1);
>>>>>> -}
>>>>>> -
>>>>>>    #ifdef CONFIG_LOCKDEP
>>>>>>    bool dma_fence_begin_signalling(void);
>>>>>>    void dma_fence_end_signalling(bool cookie);
>>>>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>>>>> index 562b885cf9c3d..a38c021f379af 100644
>>>>>> --- a/include/linux/dma-resv.h
>>>>>> +++ b/include/linux/dma-resv.h
>>>>>> @@ -248,7 +248,9 @@ dma_resv_get_excl_unlocked(struct dma_resv *obj)
>>>>>>                return NULL;
>>>>>>
>>>>>>        rcu_read_lock();
>>>>>> -     fence = dma_fence_get_rcu_safe(&obj->fence_excl);
>>>>>> +     fence = rcu_dereference(obj->fence_excl);
>>>>>> +     if (fence)
>>>>>> +             fence = dma_fence_get_rcu(fence);
>>>>>>        rcu_read_unlock();
>>>>>>
>>>>>>        return fence;
>>>
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C950d2a5b7a2541d8826b08d92c2e1f5a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637589398891140393%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=tmXfib41sZCvL3S9sQsOSmYQhz7ikSTk6xtRP7xabdI%3D&amp;reserved=0
>
>

