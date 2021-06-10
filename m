Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771EE3A32C9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 20:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDBD6EDC7;
	Thu, 10 Jun 2021 18:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF206E4CA;
 Thu, 10 Jun 2021 18:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZE2QOglkgv4Y6QaEABmH7Xs2ukCNha/PzYX9USIOUn1mHbwe7BMjzQqGQx7aY1SOkGQsmTAMMtSpo4hfFtiiZi5HuBtEtncDFX6uQCovcSM2YnGLrRnkrQqT0pVKUCtcKdpfr+DLtnxMpVQdfYWJiXmN7C3lflMNYjItn3lLDPk/1Mtvs40Bg+vP4roALcRO51Y5f4UnZDuydlLbYS+XuS9OsuwXPhCOnG0DiQg8ZWzxihCgSu7MdAVo3hty7mOXHmeNwhIDjpnvUgnHjStfAYa0BRke+QbWj7kLrsCFxYvrQarHnbvbcheaPp6UWJ1LfiES1zxSQupIz9gdmtqJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6Y3PL9Vq8c59LMqhJ5c85ZbDAjp/py6hzw7UBQKzAw=;
 b=Yu7l9C0fxxBVYuQIlbyRhRo9G6Xj2/D5dmCeLPyEuL2GjWrrYf0AKAwFKvU0B/cfARt/MQyAUV24wjMbnwh5wp1R5r6WKGV88v+Pt2K2EpUb7MzoXC5IzkUAKkI+pSE0O74d47761HeQ21rzQkbikLVli/ODen/wWaK2gWUr7HYhfFC6GLjcrkOBvK+wr2tGrADfzpKyE4mTZxfSPd7p3nia3KSC6wAzLIkljtq46bFRntcPduLnsqDWtXmxBkt8lWDTBbUTUALcvZWM6BJpA8o3jYiXNpTJ45bGOz9YjZUsLBvpU0iIMi/xJc+hDUHaASdR4uRptfaC7EeYNmWsQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6Y3PL9Vq8c59LMqhJ5c85ZbDAjp/py6hzw7UBQKzAw=;
 b=aZnS/MGNrl9mLPrChWq0Wbb7hnoNP5Tdc//Ofb9bEgZcXSvywKIsbGiZSxIzH467HfVWpEclBVLXJhZBEFUycm3NeYto0PKOYuC2N4bJvzycc5EPJQqmcR1u/aFDBTRXpGSU7WJIOC6gQoxpq00VazadqmNAbcDdzDJ/Z6bwfz8=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4126.namprd12.prod.outlook.com (2603:10b6:208:199::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 18:12:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 18:12:25 +0000
Subject: Re: [PATCH 5/5] DONOTMERGE: dma-buf: Get rid of dma_fence_get_rcu_safe
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210609212959.471209-1-jason@jlekstrand.net>
 <20210609212959.471209-6-jason@jlekstrand.net>
 <ea36431d-521a-c1c0-59e5-a196f55c28dd@amd.com>
 <CAOFGe97+JK9-HLsVrXdvm45Qk721utwpHyy8xpqR7uRCpZm5ig@mail.gmail.com>
 <CAKMK7uGsQ3BWomCQtvrSygb-nc19LpAz2RFjsBzw-E_17tq8BA@mail.gmail.com>
 <CAOFGe947JR3tBLb-4istEX2XNU7pp4+sjgpGYGSXLWEuCcR27g@mail.gmail.com>
 <CAKMK7uFQNbOA_ijVRFrudCxNN9iqqkohq=USEG3ipcOGJHNg1g@mail.gmail.com>
 <caca6152-2931-5bce-a193-11fdf42e291e@amd.com>
 <YMJH3Xne7LUse5gN@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a720cd81-8987-11fd-809f-0d976c77a5a2@amd.com>
Date: Thu, 10 Jun 2021 20:12:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YMJH3Xne7LUse5gN@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:57c:8a70:f9b:430d]
X-ClientProxiedBy: AM0PR02CA0084.eurprd02.prod.outlook.com
 (2603:10a6:208:154::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:57c:8a70:f9b:430d]
 (2a02:908:1252:fb60:57c:8a70:f9b:430d) by
 AM0PR02CA0084.eurprd02.prod.outlook.com (2603:10a6:208:154::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Thu, 10 Jun 2021 18:12:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23f2ce15-ff76-41ce-c798-08d92c3b4cd8
X-MS-TrafficTypeDiagnostic: MN2PR12MB4126:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41269ABA15739499928DEE0A83359@MN2PR12MB4126.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tyCsjh8rRNK0iOUB9NE+1hwdhaOzPsa5gH2iszUn0rftuw+y47Q7xxFghLlKm7oKQELJgmMY2qIj5HGI0pvnzAotexU1yofaUsi3Qkp4LTBx7vuxKqobz4jXQ4zHFd6thkC7lmopF9ji5/TFJJohhG+u6pLI8E0BKzr0deUQc+hxPylGxMfG+aU9qWL+qs8b+2D6WsbVWLjdg85pfamo/Eaa7jHO8qjUdV0aZRykNnHQpqdfATSfKyZGHsQSAjdmG/W2zJEKksxJCMx/WOgW2uXHEBH4tFz6c3hQ/sJq4TcjKkMi3N9qj4j22y77u+nL76pGnOqsCnN1xZKOIAIrbmiJzaPFaU7mZzrDaT5wIq63tey9r5Q5Zux76YRoEPqL+CJd2cEaAPrI1LJLHbFPRYsBo5uPBYJA+iGYi0LZIVJZqsQrTSi3aqKUSOxZ2jS8rHepbO/7D/0HtcIJgXRUCgExO2Pn5fcHyQFgiRJQCVZJfp+nU1qiH36bF+pqJlm58aFN26pYYb5D+B34HOrCbH7JVdcb2YwZV/ao3EZUOeX0NWa7Qc0h8dlYTL2rF6Awo9hMnzTMVGZBiQDcwTb9sxGDNCS5HLPz6fXkVCfnwNLK8PSZNEQZpf3vBhS1EKn3BPiuYjnvl8ToG5q3seT8iQ2lSdwvKtFEYIksl7HycbtZhfR5//46DSidE5gP56db35sUtmQuTERP20SK2JknbtF/bYB+LfM6j98fsg/Rl9RPHV2j+h3iBUTFknoo9PhV5aFw2V+miqEUfZMScwRRffpavmEVH5UrdKwAWJQP7PyqhGBmGN0UBgt+Cw7VoLPyhJqevi3jTyasdq5KmWYQKZQBlo7OAlSdsYlMco72/Zk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(66946007)(66476007)(6486002)(4326008)(66574015)(38100700002)(36756003)(186003)(66556008)(53546011)(31696002)(86362001)(16526019)(2616005)(6916009)(966005)(30864003)(45080400002)(478600001)(5660300002)(316002)(54906003)(2906002)(31686004)(8936002)(8676002)(6666004)(83380400001)(26583001)(87944003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWlldVJUS0NIWXNMYnlZd3dONEZsdDR5alVpSDZYS1RNMk9XODg3aDJjeDNE?=
 =?utf-8?B?VjhrYkxqVlVSZS84QkFMUDdLVmZ6TXp5OHhPT3p3UE1RSU43UDRDYWMyTHVT?=
 =?utf-8?B?WWgrN3NiUlpDSjFLa2ZXM1owTjY4cmo2TkdWeTkxN0lHVjdZcFhKSm83R25R?=
 =?utf-8?B?cUpTRkdzYUR2T252ZldSdjJNQWxNSmxSV3NyRVcyT251ZEovZzVVZE9XcmJX?=
 =?utf-8?B?VmN2RnpNUUFjSG9Ma0F6N0JQUGxUR1pQSzNkN29tWXVNNENzMnZDNE1MbGpi?=
 =?utf-8?B?b1RyTzJFT3dLaWNlYUZDVDRxZmFlOHFxcXZhMktVVFhvVGpNZWxkNUN1ZVU0?=
 =?utf-8?B?elFUYXg2UHFKVTdUM2lYZzc3a21qQWV1d2tXR1FVcE5uVWhJMG9WNk1IOUVq?=
 =?utf-8?B?cTRXbUNDVUZOdDVZZGVaalVxT0dER2xhbDg2VnJEakxTM05sVXNacXRrYXBu?=
 =?utf-8?B?d0VGQldqUW1haGZoSzhMYUlkak5qelNrdUJrUkpMUEp0bDY5NUNTSFM2bXAz?=
 =?utf-8?B?ODRCYkNxalViKytJaUtLY2xRdFRNc3FaTHhpZTNvVmlJUW5xNnBSb3BGSk84?=
 =?utf-8?B?WlBmSUh1VmpjMTFqcW9nTDEzaUp2UFlTQmU3L2U3ZVJEZDMvUCtkQlIrQWFr?=
 =?utf-8?B?S2J3K1hNREtuSURZcm4rSnJheGtVOGxyR1dxenQ2blkxVUxMY09ldG1oQnls?=
 =?utf-8?B?VE1zbE1QeTlIVWpyTTFHRXBqa0NiaFJhTlZNMktzTE55cGtWSXpySE5TdkdL?=
 =?utf-8?B?YjJHRGdraUk4UTZjbzBIR09ZVU5peDlSdkFxL3RaQXFXK2tBbk56T0VGaGx0?=
 =?utf-8?B?Z0RPcUNJSTFHeW1Na2d3aytjZTUyZkNoSFNVdytHZWVyUGtNcW8wME5uU2pN?=
 =?utf-8?B?a05XbmN4UndBL2NHdDM5UVZDWWIyZnBEcG43OHRUSWJjZmJ1Y3ZQRnNqeWdX?=
 =?utf-8?B?ZWl0TzdwQmlCOTIwcVlOSUNEYUU0bW5IckZkSCtXTHJMRzRoMC9mbzJPbVgr?=
 =?utf-8?B?UjBIa1VXb3VwcjVpd3V3d1grL1JGUUp5WG1wZEFxaXZxYzNMVFNIYkRFZWQ1?=
 =?utf-8?B?bE9Yd1lyQ2tSemM3QmFlaWVGaFFSOVZjeGZreGxxaGVGRE5WZE5pd0pIV2pV?=
 =?utf-8?B?MzlzNkQ1RmlkQ016Tjh0Zk8wREN5TXNQNnlVRWV3TUZjdm0xY0NnNVk2em1C?=
 =?utf-8?B?SXRHbHpsTnlKWG0zWnBzSlNCbUl2dC9YRFpIOFFyL1djb2MxUWdwODV6TXBJ?=
 =?utf-8?B?YWhHaE0zQk4wQ09teE4yc290Qzc4UVViY3Vsa0F6REIxZHk2REx0YW01QWRX?=
 =?utf-8?B?S1dtRC83R3huZzdJR0xqTW4wdStUNlBEVU5lUkh4U2xUNWpERXFUMGFRYzM3?=
 =?utf-8?B?WDJnL1hPTHJ4UFpjMVduSFBtUG9LSFhxeTJDclhoaytIcTNJRitwVDhUUlNo?=
 =?utf-8?B?b05qMjNvUXBQVmhETEdmT1RzbXdDTFluOXptaTVick13T25nc0ZISldScTBM?=
 =?utf-8?B?dnc2N1prdnFLaHVVVnN5LzByRStmcVl2TFJQRnFDRVdyaTg4RWtIUkZEbGl5?=
 =?utf-8?B?UW5STVNWLzQwaTBMQllqdVE3U29SMVpGYjdrNnROTHNJRll2eFAvcnRvZ3Jz?=
 =?utf-8?B?bzlnQmhPWW4xazdmUElMQXB4ZTU1UlZ6alo2Tk1ETDBtUmlFOG9VWk51NkxD?=
 =?utf-8?B?Zmt3djhIcmovK29BNlY0SHI4cFNzL01ZUU1GQ0pUTzJvYy9hd3FaK0NKdnVo?=
 =?utf-8?B?TElXRWdVTW5CVGdlbjlpMXFtWkdVNEVDS01rMDcxaHNZcDlpY2FjcEtlNklN?=
 =?utf-8?B?TS9HMkF4cHR5cTg1UFVsdVZyczhSNG9RclpvZjRmNmVQNXdZelh5dWEwZ3Rv?=
 =?utf-8?Q?u4XGDop+gpbmP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f2ce15-ff76-41ce-c798-08d92c3b4cd8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 18:12:25.6522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ufqG7X8413itR+c3QRM9EkTrHpotIRgkn4mVYcoXme+S8XEpUEqiqPDiUDPj9Na
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4126
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 10.06.21 um 19:11 schrieb Daniel Vetter:
> On Thu, Jun 10, 2021 at 06:54:13PM +0200, Christian König wrote:
>> Am 10.06.21 um 18:37 schrieb Daniel Vetter:
>>> On Thu, Jun 10, 2021 at 6:24 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>>> On Thu, Jun 10, 2021 at 10:13 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>> On Thu, Jun 10, 2021 at 3:59 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>>>>> On Thu, Jun 10, 2021 at 1:51 AM Christian König
>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>> Am 09.06.21 um 23:29 schrieb Jason Ekstrand:
>>>>>>>> This helper existed to handle the weird corner-cases caused by using
>>>>>>>> SLAB_TYPESAFE_BY_RCU for backing dma_fence.  Now that no one is using
>>>>>>>> that anymore (i915 was the only real user), dma_fence_get_rcu is
>>>>>>>> sufficient.  The one slightly annoying thing we have to deal with here
>>>>>>>> is that dma_fence_get_rcu_safe did an rcu_dereference as well as a
>>>>>>>> SLAB_TYPESAFE_BY_RCU-safe dma_fence_get_rcu.  This means each call site
>>>>>>>> ends up being 3 lines instead of 1.
>>>>>>> That's an outright NAK.
>>>>>>>
>>>>>>> The loop in dma_fence_get_rcu_safe is necessary because the underlying
>>>>>>> fence object can be replaced while taking the reference.
>>>>>> Right.  I had missed a bit of that when I first read through it.  I
>>>>>> see the need for the loop now.  But there are some other tricky bits
>>>>>> in there besides just the loop.
>>>>> I thought that's what the kref_get_unless_zero was for in
>>>>> dma_fence_get_rcu? Otherwise I guess I'm not seeing why still have
>>>>> dma_fence_get_rcu around, since that should either be a kref_get or
>>>>> it's just unsafe to call it ...
>>>> AFAICT, dma_fence_get_rcu is unsafe unless you somehow know that it's
>>>> your fence and it's never recycled.
>>>>
>>>> Where the loop comes in is if you have someone come along, under the
>>>> RCU write lock or not, and swap out the pointer and unref it while
>>>> you're trying to fetch it.  In this case, if you just write the three
>>>> lines I duplicated throughout this patch, you'll end up with NULL if
>>>> you (partially) lose the race.  The loop exists to ensure that you get
>>>> either the old pointer or the new pointer and you only ever get NULL
>>>> if somewhere during the mess, the pointer actually gets set to NULL.
>>> It's not that easy. At least not for dma_resv.
>>>
>>> The thing is, you can't just go in and replace the write fence with
>>> something else. There's supposed to be some ordering here (how much we
>>> actually still follow that or not is a bit another question, that I'm
>>> trying to answer with an audit of lots of drivers), which means if you
>>> replace e.g. the exclusive fence, the previous fence will _not_ just
>>> get freed. Because the next exclusive fence needs to wait for that to
>>> finish first.
>>>
>>> Conceptually the refcount will _only_ go to 0 once all later
>>> dependencies have seen it get signalled, and once the fence itself has
>>> been signalled.
>> I think that's the point where it breaks.
>>
>> See IIRC radeon for example doesn't keep unsignaled fences around when
>> nobody is interested in them. And I think noveau does it that way as well.
>>
>> So for example you can have the following
>> 1. Submission to 3D ring, this creates fence A.
>> 2. Fence A is put as en exclusive fence in a dma_resv object.
>> 3. Submission to 3D ring, this creates fence B.
>> 4. Fence B is replacing fence A as the exclusive fence in the dma_resv
>> object.
>>
>> Fence A is replaced and therefore destroyed while it is not even close to be
>> signaled. But the replacement is perfectly ok, since fence B is submitted to
>> the same ring.
>>
>> When somebody would use dma_fence_get_rcu on the exclusive fence and get
>> NULL it would fail to wait for the submissions. You don't really need the
>> SLAB_TYPESAFE_BY_RCU for this to blow up in your face.
> Uh that's wild ...
>
> I thought that's impossible, but in dma_fence_release() we only complain
> if there's both waiters and the fence isn't signalled yet. I had no idea.
>
>> We could change that rule of curse, amdgpu for example is always keeping
>> fences around until they are signaled. But IIRC that's how it was for radeon
>> like forever.
> Yeah I think we could, but then we need to do a few things:
> - document that defactor only get_rcu_safe is ok to use
> - delete get_rcu, it's not really a safe thing to do anywhere

Well I would rename dma_fence_get_rcu into dma_fence_get_unless_zero.

And then we can dma_fence_get_rcu_safe() into dma_fence_get_rcu().

Christian.

>
> -Daniel
>
>> Regards,
>> Christian.
>>
>>>    A signalled fence might as well not exist, so if
>>> that's what  happened in that tiny window, then yes a legal scenario
>>> is the following:
>>>
>>> thread A:
>>> - rcu_dereference(resv->exclusive_fence);
>>>
>>> thread B:
>>> - dma_fence signals, retires, drops refcount to 0
>>> - sets the exclusive fence to NULL
>>> - creates a new dma_fence
>>> - sets the exclusive fence to that new fence
>>>
>>> thread A:
>>> - kref_get_unless_zero fails, we report that the exclusive fence slot is NULL
>>>
>>> Ofc normally we're fully pipeline, and we lazily clear slots, so no
>>> one ever writes the fence ptr to NULL. But conceptually it's totally
>>> fine, and an indistinguishable sequence of events from the point of
>>> view of thread A.
>>>
>>> Ergo dma_fence_get_rcu is enough. If it's not, we've screwed up really
>>> big time. The only reason you need _unsafe is if you have
>>> typesafe_by_rcu, or maybe if you yolo your fence ordering a bit much
>>> and break the DAG property in a few cases.
>>>
>>>> I agree with Christian that that part of dma_fence_get_rcu_safe needs
>>>> to stay.  I was missing that until I did my giant "let's walk through
>>>> the code" e-mail.
>>> Well if I'm wrong there's a _ton_ of broken code in upstream right
>>> now, even in dma-buf/dma-resv.c. We're using dma_fence_get_rcu a lot.
>>>
>>> Also the timing is all backwards: get_rcu_safe was added as a fix for
>>> when i915 made its dma_fence typesafe_by_rcu. We didn't have any need
>>> for this beforehand. So I'm really not quite buying this story here
>>> yet you're all trying to sell me on.
>>> -Daniel
>>>
>>>> --Jason
>>>>
>>>>>>> This is completely unrelated to SLAB_TYPESAFE_BY_RCU. See the
>>>>>>> dma_fence_chain usage for reference.
>>>>>>>
>>>>>>> What you can remove is the sequence number handling in dma-buf. That
>>>>>>> should make adding fences quite a bit quicker.
>>>>>> I'll look at that and try to understand what's going on there.
>>>>> Hm I thought the seqlock was to make sure we have a consistent set of
>>>>> fences across exclusive and all shared slot. Not to protect against
>>>>> the fence disappearing due to typesafe_by_rcu.
>>>>> -Daniel
>>>>>
>>>>>> --Jason
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
>>>>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>>> ---
>>>>>>>>     drivers/dma-buf/dma-fence-chain.c         |  8 ++--
>>>>>>>>     drivers/dma-buf/dma-resv.c                |  4 +-
>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c |  4 +-
>>>>>>>>     drivers/gpu/drm/i915/i915_active.h        |  4 +-
>>>>>>>>     drivers/gpu/drm/i915/i915_vma.c           |  4 +-
>>>>>>>>     include/drm/drm_syncobj.h                 |  4 +-
>>>>>>>>     include/linux/dma-fence.h                 | 50 -----------------------
>>>>>>>>     include/linux/dma-resv.h                  |  4 +-
>>>>>>>>     8 files changed, 23 insertions(+), 59 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>>>>>>> index 7d129e68ac701..46dfc7d94d8ed 100644
>>>>>>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>>>>>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>>>>>>> @@ -15,15 +15,17 @@ static bool dma_fence_chain_enable_signaling(struct dma_fence *fence);
>>>>>>>>      * dma_fence_chain_get_prev - use RCU to get a reference to the previous fence
>>>>>>>>      * @chain: chain node to get the previous node from
>>>>>>>>      *
>>>>>>>> - * Use dma_fence_get_rcu_safe to get a reference to the previous fence of the
>>>>>>>> - * chain node.
>>>>>>>> + * Use rcu_dereference and dma_fence_get_rcu to get a reference to the
>>>>>>>> + * previous fence of the chain node.
>>>>>>>>      */
>>>>>>>>     static struct dma_fence *dma_fence_chain_get_prev(struct dma_fence_chain *chain)
>>>>>>>>     {
>>>>>>>>         struct dma_fence *prev;
>>>>>>>>
>>>>>>>>         rcu_read_lock();
>>>>>>>> -     prev = dma_fence_get_rcu_safe(&chain->prev);
>>>>>>>> +     prev = rcu_dereference(chain->prev);
>>>>>>>> +     if (prev)
>>>>>>>> +             prev = dma_fence_get_rcu(prev);
>>>>>>>>         rcu_read_unlock();
>>>>>>>>         return prev;
>>>>>>>>     }
>>>>>>>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>>>>>>>> index f26c71747d43a..cfe0db3cca292 100644
>>>>>>>> --- a/drivers/dma-buf/dma-resv.c
>>>>>>>> +++ b/drivers/dma-buf/dma-resv.c
>>>>>>>> @@ -376,7 +376,9 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>>>>>>>>                 dst_list = NULL;
>>>>>>>>         }
>>>>>>>>
>>>>>>>> -     new = dma_fence_get_rcu_safe(&src->fence_excl);
>>>>>>>> +     new = rcu_dereference(src->fence_excl);
>>>>>>>> +     if (new)
>>>>>>>> +             new = dma_fence_get_rcu(new);
>>>>>>>>         rcu_read_unlock();
>>>>>>>>
>>>>>>>>         src_list = dma_resv_shared_list(dst);
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>>> index 72d9b92b17547..0aeb6117f3893 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>>>>> @@ -161,7 +161,9 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct dma_fence **f,
>>>>>>>>                 struct dma_fence *old;
>>>>>>>>
>>>>>>>>                 rcu_read_lock();
>>>>>>>> -             old = dma_fence_get_rcu_safe(ptr);
>>>>>>>> +             old = rcu_dereference(*ptr);
>>>>>>>> +             if (old)
>>>>>>>> +                     old = dma_fence_get_rcu(old);
>>>>>>>>                 rcu_read_unlock();
>>>>>>>>
>>>>>>>>                 if (old) {
>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_active.h b/drivers/gpu/drm/i915/i915_active.h
>>>>>>>> index d0feda68b874f..bd89cfc806ca5 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/i915_active.h
>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_active.h
>>>>>>>> @@ -103,7 +103,9 @@ i915_active_fence_get(struct i915_active_fence *active)
>>>>>>>>         struct dma_fence *fence;
>>>>>>>>
>>>>>>>>         rcu_read_lock();
>>>>>>>> -     fence = dma_fence_get_rcu_safe(&active->fence);
>>>>>>>> +     fence = rcu_dereference(active->fence);
>>>>>>>> +     if (fence)
>>>>>>>> +             fence = dma_fence_get_rcu(fence);
>>>>>>>>         rcu_read_unlock();
>>>>>>>>
>>>>>>>>         return fence;
>>>>>>>> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>>> index 0f227f28b2802..ed0388d99197e 100644
>>>>>>>> --- a/drivers/gpu/drm/i915/i915_vma.c
>>>>>>>> +++ b/drivers/gpu/drm/i915/i915_vma.c
>>>>>>>> @@ -351,7 +351,9 @@ int i915_vma_wait_for_bind(struct i915_vma *vma)
>>>>>>>>                 struct dma_fence *fence;
>>>>>>>>
>>>>>>>>                 rcu_read_lock();
>>>>>>>> -             fence = dma_fence_get_rcu_safe(&vma->active.excl.fence);
>>>>>>>> +             fence = rcu_dereference(vma->active.excl.fence);
>>>>>>>> +             if (fence)
>>>>>>>> +                     fence = dma_fence_get_rcu(fence);
>>>>>>>>                 rcu_read_unlock();
>>>>>>>>                 if (fence) {
>>>>>>>>                         err = dma_fence_wait(fence, MAX_SCHEDULE_TIMEOUT);
>>>>>>>> diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
>>>>>>>> index 6cf7243a1dc5e..6c45d52988bcc 100644
>>>>>>>> --- a/include/drm/drm_syncobj.h
>>>>>>>> +++ b/include/drm/drm_syncobj.h
>>>>>>>> @@ -105,7 +105,9 @@ drm_syncobj_fence_get(struct drm_syncobj *syncobj)
>>>>>>>>         struct dma_fence *fence;
>>>>>>>>
>>>>>>>>         rcu_read_lock();
>>>>>>>> -     fence = dma_fence_get_rcu_safe(&syncobj->fence);
>>>>>>>> +     fence = rcu_dereference(syncobj->fence);
>>>>>>>> +     if (fence)
>>>>>>>> +             fence = dma_fence_get_rcu(syncobj->fence);
>>>>>>>>         rcu_read_unlock();
>>>>>>>>
>>>>>>>>         return fence;
>>>>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>>>>> index 6ffb4b2c63715..f4a2ab2b1ae46 100644
>>>>>>>> --- a/include/linux/dma-fence.h
>>>>>>>> +++ b/include/linux/dma-fence.h
>>>>>>>> @@ -307,56 +307,6 @@ static inline struct dma_fence *dma_fence_get_rcu(struct dma_fence *fence)
>>>>>>>>                 return NULL;
>>>>>>>>     }
>>>>>>>>
>>>>>>>> -/**
>>>>>>>> - * dma_fence_get_rcu_safe  - acquire a reference to an RCU tracked fence
>>>>>>>> - * @fencep: pointer to fence to increase refcount of
>>>>>>>> - *
>>>>>>>> - * Function returns NULL if no refcount could be obtained, or the fence.
>>>>>>>> - * This function handles acquiring a reference to a fence that may be
>>>>>>>> - * reallocated within the RCU grace period (such as with SLAB_TYPESAFE_BY_RCU),
>>>>>>>> - * so long as the caller is using RCU on the pointer to the fence.
>>>>>>>> - *
>>>>>>>> - * An alternative mechanism is to employ a seqlock to protect a bunch of
>>>>>>>> - * fences, such as used by struct dma_resv. When using a seqlock,
>>>>>>>> - * the seqlock must be taken before and checked after a reference to the
>>>>>>>> - * fence is acquired (as shown here).
>>>>>>>> - *
>>>>>>>> - * The caller is required to hold the RCU read lock.
>>>>>>>> - */
>>>>>>>> -static inline struct dma_fence *
>>>>>>>> -dma_fence_get_rcu_safe(struct dma_fence __rcu **fencep)
>>>>>>>> -{
>>>>>>>> -     do {
>>>>>>>> -             struct dma_fence *fence;
>>>>>>>> -
>>>>>>>> -             fence = rcu_dereference(*fencep);
>>>>>>>> -             if (!fence)
>>>>>>>> -                     return NULL;
>>>>>>>> -
>>>>>>>> -             if (!dma_fence_get_rcu(fence))
>>>>>>>> -                     continue;
>>>>>>>> -
>>>>>>>> -             /* The atomic_inc_not_zero() inside dma_fence_get_rcu()
>>>>>>>> -              * provides a full memory barrier upon success (such as now).
>>>>>>>> -              * This is paired with the write barrier from assigning
>>>>>>>> -              * to the __rcu protected fence pointer so that if that
>>>>>>>> -              * pointer still matches the current fence, we know we
>>>>>>>> -              * have successfully acquire a reference to it. If it no
>>>>>>>> -              * longer matches, we are holding a reference to some other
>>>>>>>> -              * reallocated pointer. This is possible if the allocator
>>>>>>>> -              * is using a freelist like SLAB_TYPESAFE_BY_RCU where the
>>>>>>>> -              * fence remains valid for the RCU grace period, but it
>>>>>>>> -              * may be reallocated. When using such allocators, we are
>>>>>>>> -              * responsible for ensuring the reference we get is to
>>>>>>>> -              * the right fence, as below.
>>>>>>>> -              */
>>>>>>>> -             if (fence == rcu_access_pointer(*fencep))
>>>>>>>> -                     return rcu_pointer_handoff(fence);
>>>>>>>> -
>>>>>>>> -             dma_fence_put(fence);
>>>>>>>> -     } while (1);
>>>>>>>> -}
>>>>>>>> -
>>>>>>>>     #ifdef CONFIG_LOCKDEP
>>>>>>>>     bool dma_fence_begin_signalling(void);
>>>>>>>>     void dma_fence_end_signalling(bool cookie);
>>>>>>>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>>>>>>>> index 562b885cf9c3d..a38c021f379af 100644
>>>>>>>> --- a/include/linux/dma-resv.h
>>>>>>>> +++ b/include/linux/dma-resv.h
>>>>>>>> @@ -248,7 +248,9 @@ dma_resv_get_excl_unlocked(struct dma_resv *obj)
>>>>>>>>                 return NULL;
>>>>>>>>
>>>>>>>>         rcu_read_lock();
>>>>>>>> -     fence = dma_fence_get_rcu_safe(&obj->fence_excl);
>>>>>>>> +     fence = rcu_dereference(obj->fence_excl);
>>>>>>>> +     if (fence)
>>>>>>>> +             fence = dma_fence_get_rcu(fence);
>>>>>>>>         rcu_read_unlock();
>>>>>>>>
>>>>>>>>         return fence;
>>>>>
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C7f22d939bf6146fc14ad08d92c32dc58%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637589419248542906%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=rvT5PhpGMLS0mjFyPTfTXQoGFz43rxa6arU5upQZBDk%3D&amp;reserved=0
>>>

