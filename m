Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 142A63C93A0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 00:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C606E4AB;
	Wed, 14 Jul 2021 22:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E546E4AA;
 Wed, 14 Jul 2021 22:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHHq/4X50rQXUrHWWfR3EMCS3j4WihF6vLNzhRaPJGZVQCxbxbaU9Ndnb6PMl6UJTDo3VyRJBS2a5kNX8x7glbNtT7v9SN14VoU5fO4Jq+aCRnCZLn4k0mMFGk+nP4iKjERvny+vdSYQfS7MAcBX7TA04ZIsCUsQh1n4by5gdhOl1JGw4pBzGK66eDy/biIhKLmIHG0fmSnNqc2TXE2X92eu7XUGb/00k307P6VY5w3DM8C8Lvme3GOpBtoETspGYDOaimDCmvwlw1yiUycasqZy8BKwMs6dLzaXwFmVOavAVPtuwBnLsG2V8oR4TLya8Wie8E+vr6S8DbjkUw4i3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNf54tI70vFupwKT+R2nvV0r7u3HDVkRRYLyskCuQps=;
 b=DVSS/20edTC2Lmpqr1Sd/fskSY0oxfHWzAG52d3r73slgwueAhdbEQoPPQ9ArY8ULNjg3kayoQ586G+1NeAdiBLsd/HjjLJXHpm0F8QF2cPxbj2dr1rPTcIdpbpp7xNqTGSejEFp9XKjHIBBk5xdU6MeK0hQIbjZS8g6wVL2NlqiznPap4FE26nub5zVcIcCkrCIX+hT5Hy3FSz4uxrr/o+iSW5D25XMDUhBKwugigzz02RXmp6PEU34SLrU7ATTnn/lnfXfW/r1fbhH/CqRp/SBdkpTl93OiIcUBE2IAiF6t4qUu8D0yvdiXc1QP/t8gio6q31VPI82Vr2tU9Tjyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNf54tI70vFupwKT+R2nvV0r7u3HDVkRRYLyskCuQps=;
 b=fZ2hlJiO5O/y89dM9OENKtgYqAC+YNTqR/1orG9LBmKZqZ03/giYc+p3MzZMbKZorliuY5pv357P8sYaloMwgQt1SXVr2BOVdreSwSYJN9KpG/JTEbuHUkeCjK7XU4T7hhXPepaKR4unqg6vuSUljkdyqZ+GVHqnLQAEtKSwr10=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Wed, 14 Jul
 2021 22:12:57 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::9f8:ec71:6535:cd36%5]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 22:12:57 +0000
Subject: Re: [PATCH v4 02/18] drm/sched: Barriers are needed for
 entity->last_scheduled
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-3-daniel.vetter@ffwll.ch>
 <2cd9df9e-08e5-d0bd-d4d3-aed00f699e4a@amd.com>
 <CAKMK7uE3dppw2=sVHRKx1b-ehVfiBphoJNJvpoPjt-=KsPp=Yw@mail.gmail.com>
 <5c5ef6ba-49d0-36cc-b537-e6f9c354f6ac@amd.com>
 <CAKMK7uGXVzaH25_spK5Pp8epx8a+9As6tVMcaj3p6Dedg0FH-w@mail.gmail.com>
 <ecd94ad4-9788-3cf1-87e4-52c37e813439@amd.com>
 <CAKMK7uEQWniuGGENjdnXpKh22hAJQe0TiQTbw1=2vXvUGyivcw@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <7cb1c62d-d195-980b-3492-0af5d9f6ec81@amd.com>
Date: Wed, 14 Jul 2021 18:12:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uEQWniuGGENjdnXpKh22hAJQe0TiQTbw1=2vXvUGyivcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:208:91::23) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:e67b:e66d:5af:3e87]
 (2607:fea8:3edf:49b0:e67b:e66d:5af:3e87) by
 BL0PR05CA0013.namprd05.prod.outlook.com (2603:10b6:208:91::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.12 via Frontend Transport; Wed, 14 Jul 2021 22:12:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93ea74f4-4cf1-4da6-07cc-08d9471488bc
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2749FD79A32F1602ED46735DEA139@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:43;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VTBb0kX+GxvZOyWuo0u9OgR/NLcnlT36DnrVqMzouYNjhZ0ndyQ5b48PGApJfht6QnB36CoCvWHW/6JTIkEtk5ey++q3xihhel0bpcNQBv+qfObm9r87TbgjQ/KhxvhpftRrkRa01ovwwzvLK5jARXeqncrBzCXoM6ARUEUwhoD05wlddlJJ1plKmW+60U3Rxqzkda0xXyTiIw9Y+qj+meHPpQvQXq4I7tO6QnyK32oSSpOY+ALlTHhUfT1XNSjxIr/m8GvtqTP0SXWQRfWnaYLtoxu4Rw8PKxREr6n5lLDclhZmYTmry11GpXfrHbvb/El+k0RFBKFRzzu+p8FRMkggHNzb1caZ7P6+QULcNA0GfSidzy0HN5UsMKEhf3DrmTIhP6jViuc2lzGN+k18AvRlaYkfOv0bvh8H7cHhSgR1zj65SoPBybwjloUbuSBYQdAl3AJxhgHjrnX20wt0BFWt/fbyBWRDARHfApAVaYoL/4+U3rM9/SDiomSHUWK4/T+GZWPgurYMee3p9RgeiOSOebUFjmLskw9+4roFnpEE24uMQnsVwraLt0jr+f5YY1TX2MbC+dqPie2yveJprPS0LxXUQUqXJTrWl+U08UEQm2bdPQa0cLDvmIUdozU+YJaDT9arfrRd0+OorudGCXafbwT6ch40MQhUBW+rptLt0M8eZ3nfRNWHgFxjUaP7D5Qb5lvewUM7WOwt1FKqxoLnHPJw5m78fuK2KRatmr89BF46RpLh4mDPpbJuxcFQa00PDH8+Iti7bJIeFTeSzZRHfBj+Cgag37W206bVwfSi1vDHFFzK915r5bpzVu/AzlPaN86nV1ejm8XyQuCP6fb8hUQEOKwvtMLe69LrOlU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(66556008)(8936002)(66476007)(478600001)(66946007)(316002)(2616005)(44832011)(31696002)(53546011)(6916009)(966005)(66574015)(86362001)(8676002)(36756003)(31686004)(5660300002)(45080400002)(4326008)(54906003)(30864003)(186003)(6486002)(2906002)(38100700002)(83380400001)(60764002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm5XU2k5UkFvUjRsbVFMbzlUQ2lHREl1WW1tbUtoR0dmcVFudU94SUt2Z1Vk?=
 =?utf-8?B?REtTQ3JWVjQxaFFaQ2N2ZVBhRVlFNk5lUUswOVI1bTZOaWJZOFBOOVZXWk1P?=
 =?utf-8?B?MEFyS2pWRmM4d3VkY0FvQnNJMXgzMjRRSGRMUEhiQTRxZm5CRHREeE9ZSDZP?=
 =?utf-8?B?MTUram11ODY3cThUeHBSUXdFams3VzVmWGp5bUg3by9VYURCbTZHUVl3eThl?=
 =?utf-8?B?OVgxUnJjNkFYanRmYUxlaDRPL2s1TUNRdzNYRVk0eG93NzZPdjlGRmhqQk5r?=
 =?utf-8?B?YnZmMld5ZnpodEhhblJtNFJmdForbVdGaW1kU1ptOFlSRjZxOGc3WVM0d0xy?=
 =?utf-8?B?WWpiWkFweDFSTjU2ODFNbG1Uem9CUm5nRDJmY3lCd3hoU25tU1Z6bWgxelc1?=
 =?utf-8?B?bWV6MWRZNktBclpZSWpjTkg3aG1FWXlBWHphTFZVeTM2ZkxzUjFSWkorL0do?=
 =?utf-8?B?ZTEvT200aDhUV3RHZVFkRUhmOEkvM3lpMytzVCtDcW9RNkE4T0VrWm9CRVpK?=
 =?utf-8?B?VWZVRnZTM2VvRy9sZXdLSUJUNTlMb3RGZmtPZlJZb2Y1RGRnVERPa1JYV0ds?=
 =?utf-8?B?M0RDRkx4c2hxbHhRYXdHUWlEbVBJLzBJWVQ4aEw4K0Y1MGwxeXE4V2c0TjRv?=
 =?utf-8?B?TEpVdXFkSkxyZXZFMkRoZUtkTDdETUR6ay9tUkV6bXlLMHBlMWJXSjUrNW5h?=
 =?utf-8?B?cGJpNkRRK2d2d0hvQ2dIdXRNVnB4VnRQOE5ZL3FtdGJNcERMdmxNRE1kNGRU?=
 =?utf-8?B?NW4zVU5Venp1LzUydUg4V1E5L2V6dGJEZHRLT0FZZ1A2T1hwRGllenB4azRW?=
 =?utf-8?B?UTlqSFplanlXeERPT0MzTWZ1ZUIzTitkdjlpMGtLbnNST3hrOGQxRDJocDlm?=
 =?utf-8?B?cXdmR3RURS9zb2xEQTVSU0IwVTQ2Vld0bjc1SGdlT1FLZndEWXNINlBlVVFL?=
 =?utf-8?B?YkFXelYvNDVTMkxLclpKNFFKMFFUYjFWZTRTdWZxZkR0WHRtbHVHZmcvd1hO?=
 =?utf-8?B?NXdSdkdoQ2d0WnB2Uk0xSzA1SVRaZzFvM0ZUcDJ6SWRWL0l3K0F5M2czdlda?=
 =?utf-8?B?WmRBWkNKZDQzVHVUQ25zWGFySC8rdTBBWEh5Unh2ZFRzOGw0TU5BMmsycUYw?=
 =?utf-8?B?b1N6Sk9qR3hiamVRelBMaHhxQ0tQbVpBVXJrZU1wTTF4WWRWTDNEcHk2TEI2?=
 =?utf-8?B?WmpwUktkMHlZeEpIS3dGUnJPN1ZvU1JaSjVnS1YrOGZnOHV2L3JrOTRkVi91?=
 =?utf-8?B?NncyZWxza2U3ZTNJeURtU0R3TUl3c3h5K2lZVDFmd3p6c1g1OWFOSWFSN002?=
 =?utf-8?B?MGhsS3kvUEZLb3JyQ3p4cVM5N1VNMk44dk9YRlUxeTcxQkdoWnhrTFBEWk5O?=
 =?utf-8?B?ZWZKaWJUTkVXRVVPVGxYMkxIOGVReFhtbUo4bWM4TytSZmpuNjZvVU82NkRo?=
 =?utf-8?B?Y2pNVXpMTWg4UWRuV2NGbm1sTDB0bGd5MDZWd3FwT3g0aGV3eWFwN3pTM1FE?=
 =?utf-8?B?RXEzaXQ0YTNhMzhRZXRyREdRVWp2T1hWNG8zTG5lbyt0bnpkUlQ0VlJLaVdS?=
 =?utf-8?B?Rll1UUFTUGd4RXlRSUN3MURaTXBSSmkwQlU4Y0hhME1JWUhnMEkwalU4MkhY?=
 =?utf-8?B?aXVFdU9FRmlKMVdiMGpJalYyYWxXUFg5QkhqMHNjN01zb0JpUm5GSkFhRFAy?=
 =?utf-8?B?eWFIb0ZRRmdVVTE3M1N6WUNkMWtJdzhpZFcwTXl2M1JZMDVzVlp6aWhmUy96?=
 =?utf-8?B?WXNPUEdYb2d5bWw4TUZBV01BN1ZpVjdRVk16ME1KUXhzVXRCU01GenFUWlc3?=
 =?utf-8?B?NmpWN2M5dzFtaHp6VDdXNFJDWnJCT1NTYm1weVZheWNMOGNtTnRLekJkQm9D?=
 =?utf-8?Q?s5jan2D/AVD4P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93ea74f4-4cf1-4da6-07cc-08d9471488bc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 22:12:57.1477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RXTjohNtdzCGrpzCTtCbNI5vBRR7QEo4f0ddkD3oCzBCaAZ8iLwkebIhG/3hKShkGkuH/lkLssSdrs6kLN6bmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-07-13 12:45 p.m., Daniel Vetter wrote:
> On Tue, Jul 13, 2021 at 6:11 PM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>> On 2021-07-13 5:10 a.m., Daniel Vetter wrote:
>>> On Tue, Jul 13, 2021 at 9:25 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 13.07.21 um 08:50 schrieb Daniel Vetter:
>>>>> On Tue, Jul 13, 2021 at 8:35 AM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 12.07.21 um 19:53 schrieb Daniel Vetter:
>>>>>>> It might be good enough on x86 with just READ_ONCE, but the write side
>>>>>>> should then at least be WRITE_ONCE because x86 has total store order.
>>>>>>>
>>>>>>> It's definitely not enough on arm.
>>>>>>>
>>>>>>> Fix this proplery, which means
>>>>>>> - explain the need for the barrier in both places
>>>>>>> - point at the other side in each comment
>>>>>>>
>>>>>>> Also pull out the !sched_list case as the first check, so that the
>>>>>>> code flow is clearer.
>>>>>>>
>>>>>>> While at it sprinkle some comments around because it was very
>>>>>>> non-obvious to me what's actually going on here and why.
>>>>>>>
>>>>>>> Note that we really need full barriers here, at first I thought
>>>>>>> store-release and load-acquire on ->last_scheduled would be enough,
>>>>>>> but we actually requiring ordering between that and the queue state.
>>>>>>>
>>>>>>> v2: Put smp_rmp() in the right place and fix up comment (Andrey)
>>>>>>>
>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>> Cc: Lee Jones <lee.jones@linaro.org>
>>>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/scheduler/sched_entity.c | 27 ++++++++++++++++++++++--
>>>>>>>      1 file changed, 25 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> index f7347c284886..89e3f6eaf519 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> @@ -439,8 +439,16 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>>>>                  dma_fence_set_error(&sched_job->s_fence->finished, -ECANCELED);
>>>>>>>
>>>>>>>          dma_fence_put(entity->last_scheduled);
>>>>>>> +
>>>>>>>          entity->last_scheduled = dma_fence_get(&sched_job->s_fence->finished);
>>>>>>>
>>>>>>> +     /*
>>>>>>> +      * If the queue is empty we allow drm_sched_entity_select_rq() to
>>>>>>> +      * locklessly access ->last_scheduled. This only works if we set the
>>>>>>> +      * pointer before we dequeue and if we a write barrier here.
>>>>>>> +      */
>>>>>>> +     smp_wmb();
>>>>>>> +
>>>>>> Again, conceptual those barriers should be part of the spsc_queue
>>>>>> container and not externally.
>>>>> That would be extremely unusual api. Let's assume that your queue is
>>>>> very dumb, and protected by a simple lock. That's about the maximum
>>>>> any user could expect.
>>>>>
>>>>> But then you still need barriers here, because linux locks (spinlock,
>>>>> mutex) are defined to be one-way barriers: Stuff that's inside is
>>>>> guaranteed to be done insinde, but stuff outside of the locked region
>>>>> can leak in. They're load-acquire/store-release barriers. So not good
>>>>> enough.
>>>>>
>>>>> You really need to have barriers here, and they really all need to be
>>>>> documented properly. And yes that's a shit-ton of work in drm/sched,
>>>>> because it's full of yolo lockless stuff.
>>>>>
>>>>> The other case you could make is that this works like a wakeup queue,
>>>>> or similar. The rules there are:
>>>>> - wake_up (i.e. pushing something into the queue) is a store-release barrier
>>>>> - the waked up (i.e. popping an entry) is a load acquire barrier
>>>>> Which is obviuosly needed because otherwise you don't have coherency
>>>>> for the data queued up. And again not the barriers you're locking for
>>>>> here.
>>>> Exactly that was the idea, yes.
>>>>
>>>>> Either way, we'd still need the comments, because it's still lockless
>>>>> trickery, and every single one of that needs to have a comment on both
>>>>> sides to explain what's going on.
>>>>>
>>>>> Essentially replace spsc_queue with an llist underneath, and that's
>>>>> the amount of barriers a data structure should provide. Anything else
>>>>> is asking your datastructure to paper over bugs in your users.
>>>>>
>>>>> This is similar to how atomic_t is by default completely unordered,
>>>>> and users need to add barriers as needed, with comments.
>>>> My main problem is as always that kernel atomics work different than
>>>> userspace atomics.
>>>>
>>>>> I think this is all to make sure people don't just write lockless algorithms
>>>>> because it's a cool idea, but are forced to think this all through.
>>>>> Which seems to not have happened very consistently for drm/sched, so I
>>>>> guess needs to be fixed.
>>>> Well at least initially that was all perfectly thought through. The
>>>> problem is nobody is really maintaining that stuff.
>>>>
>>>>> I'm definitely not going to hide all that by making the spsc_queue
>>>>> stuff provide random unjustified barriers just because that would
>>>>> paper over drm/sched bugs. We need to fix the actual bugs, and
>>>>> preferrable all of them. I've found a few, but I wasn't involved in
>>>>> drm/sched thus far, so best I can do is discover them as we go.
>>>> I don't think that those are random unjustified barriers at all and it
>>>> sounds like you didn't grip what I said here.
>>>>
>>>> See the spsc queue must have the following semantics:
>>>>
>>>> 1. When you pop a job all changes made before you push the job must be
>>>> visible.
>>> This is the standard barriers that also wake-up queues have, it's just
>>> store-release+load-acquire.
>>>
>>>> 2. When the queue becomes empty all the changes made before you pop the
>>>> last job must be visible.
>>> This is very much non-standard for a queue. I guess you could make
>>> that part of the spsc_queue api between pop and is_empty (really we
>>> shouldn't expose the _count() function for this), but that's all very
>>> clever.
>>>
>>> I think having explicit barriers in the code, with comments, is much
>>> more robust. Because it forces you to think about all this, and
>>> document it properly. Because there's also lockless stuff like
>>> drm_sched.ready, which doesn't look at all like it's ordered somehow.
>>
>> At least for amdgpu, after drm_sched_fini is called (setting sched.ready
>> = false)
>> we call amdgpu_fence_wait_empty to ensure all in progress jobs are done.
>> Seems to me at least, this should guarantee that all in flight consumers
>> of sched.ready (those who still see sched.ready == true) are finished while
>> all later consumers will see sched.ready == fakle and will bail out.
>>
>> On second thought there is a gap between checking for sched.ready and
>> inserting
>> the HW fence for the new job so this might still be a bug... Looks like
>> we need to check for
>> sched.ready after inserting the HW fence  and for this we will need
>> barrier or locking.
> Yeah, and at that point I think it's good to split up drm_sched.ready
> from a new thing for when the hw died, like drm_sched.wedged or
> .hw_death or similar, so that we can tell them apart. Trying to submit
> a job to a non-ready scheduler is a driver bug and should WARN, while
> submitting a job to a dead scheduler should probably result in -EIO
> being returned to userspace (instead of the current -ENOENT, assuming
> I haven't missed a errno remapping code somewhere in amdgpu).
>
> Also, then you could do a drm_sched_die() or similar function which
> combines setting the hw_died with the right barriers and cleaning up
> all the jobs.
>
> Wrt the fundamental race: I think that's not fixeable easily, so maybe
> the scheduler thread also needs to handle this and immediately fail
> these jobs by setting all fences to -EIO and completing them, without
> even calling into the driver. If you try to catch this synchronously I
> think it would require some kind of locking in push_job, plus failure
> handling, which would be a) slow and b) real ugly in the driver code.
> Just accepting that some jobs can slip through and letting the
> scheduler thread clean them up is I think cleaner.


I agree about moving this check to scheduler thread, I also not quite
understand why in some places which are clearly post the job being
pick-up by it's scheduler thread such as amdgpu_ib_schedule, still
check for sched.ready... What's the point ? Also there are direct submission
cases where IB insertion into HW ring is done without any scheduler 
involvement
and even more in that case why we care that scheduler is not ready.

Andrey


>
> If userspace then goes ahead and closes the ctx before all the jobs
> are cleaned up we can handle that with the normal drm_sched_entity
> cleanup logic. Which would be another reason to split normal cleanup
> from hw death.
> -Daniel
>
>> Andrey
>>
>>> E.g. there's also an rmb(); in drm_sched_entity_is_idle(), which
>>> - probably should be an smp_rmb()
>>> - really should document what it actually synchronizes against, and
>>> the lack of an smp_wmb() somewhere else indicates it's probably
>>> busted. You always need two barriers.
>>>
>>>> Otherwise I completely agree with you that the whole scheduler doesn't
>>>> work at all and we need to add tons of external barriers.
>>> Imo that's what we need to do. And the most important part for
>>> maintainability is to properly document thing with comments, and the
>>> most important part in that comment is pointing at the other side of a
>>> barrier (since a barrier on one side only orders nothing).
>>>
>>> Also, on x86 almost nothing here matters, because both rmb() and wmb()
>>> are no-op. Aside from the compiler barrier, which tends to not be the
>>> biggest issue. Only mb() does anything, because x86 is only allowed to
>>> reorder reads ahead of writes.
>>>
>>> So in practice it's not quite as big a disaster, imo the big thing
>>> here is maintainability of all these tricks just not being documented.
>>> -Daniel
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> -Daniel
>>>>>
>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>          spsc_queue_pop(&entity->job_queue);
>>>>>>>          return sched_job;
>>>>>>>      }
>>>>>>> @@ -459,10 +467,25 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>>>>          struct drm_gpu_scheduler *sched;
>>>>>>>          struct drm_sched_rq *rq;
>>>>>>>
>>>>>>> -     if (spsc_queue_count(&entity->job_queue) || !entity->sched_list)
>>>>>>> +     /* single possible engine and already selected */
>>>>>>> +     if (!entity->sched_list)
>>>>>>> +             return;
>>>>>>> +
>>>>>>> +     /* queue non-empty, stay on the same engine */
>>>>>>> +     if (spsc_queue_count(&entity->job_queue))
>>>>>>>                  return;
>>>>>>>
>>>>>>> -     fence = READ_ONCE(entity->last_scheduled);
>>>>>>> +     /*
>>>>>>> +      * Only when the queue is empty are we guaranteed that the scheduler
>>>>>>> +      * thread cannot change ->last_scheduled. To enforce ordering we need
>>>>>>> +      * a read barrier here. See drm_sched_entity_pop_job() for the other
>>>>>>> +      * side.
>>>>>>> +      */
>>>>>>> +     smp_rmb();
>>>>>>> +
>>>>>>> +     fence = entity->last_scheduled;
>>>>>>> +
>>>>>>> +     /* stay on the same engine if the previous job hasn't finished */
>>>>>>>          if (fence && !dma_fence_is_signaled(fence))
>>>>>>>                  return;
>>>>>>>
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C01c4933fcb364820067408d9461d9c29%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637617915261739604%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=t6oYaz%2FvvN0GhRc35qksHXOHCLGfF1OxNKrqkRF6VWg%3D&amp;reserved=0
>
>
