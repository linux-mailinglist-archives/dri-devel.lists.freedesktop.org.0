Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFD260F1DB
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A661F10E55B;
	Thu, 27 Oct 2022 08:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214D210E55B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPBTMgu4FxmCbMjWlyudawP0jHpGGN8OcIcLWGcXSXGGgLvvOU4sNEecC+6/06tqpvKJ8pSCQvknDzz78r0gUvjTHPr6cGKdn1MK4KDFkd5FYKhTClNtnXCBZcRJabIiMguIjtWt0kATF/KD+oeIDfnTmTZzXnLzuWY8wshKDZk/bp8CVjN84L/sHCqFihFsXdCcnb5WJeFauuG9ZyoyNujIOasjLpiXRjkiBUJfLh5DUSgOZMJ96AGY6PZwqAPPMggXhzu69QnZ04D3RPZwPhoKHP5+mtfAbB6b90Lr9ouxvlsa98b4n7B6f8yfpHovWvrwTHlz/RWxS7N1FK90FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZHHMnPAYBkevkZCgikK8Yo+BiQpdWWOw3tBC/TqvvA=;
 b=Cpm+iq0eI5zkQhzoDhwwpgojDtVPCnQq9q5IwGlHybexqS+4TEo7Kd2rf/MuOJ1S0CNQU7SXj8K5cOT/jUpbNmfQk7r635IW2pTXL066ocRIo9jEO+BHMM3kQtZ+lJPdMdXhsH0AIGbhrC8kL1BxFslNOMe6dEeT4uOGv4KZ8JgoCk6vrEnoihrLReU0oSmI6+KwvwGYgnlBhBbt6jnWoPDO1fXSvEwl5LO9XTHVHPQFp7DZXkgxGAQb1G8P84IKZnEtT1F0CYDu9ZBT48CUhUmc0IXIcod3JzAUAaDdK5ifWn3TYMMtXWma7tZdeGpt7TpH9Ok1xyyG6lIb+76B/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZHHMnPAYBkevkZCgikK8Yo+BiQpdWWOw3tBC/TqvvA=;
 b=Q4B22c50kXTpt//mxAiI5qemnEsDRMDEjY5ehcmJbM2Bm1C5gdHOmM3CoKxWzuMR5qk6rXK8DPtPN61D/7G2y5HgZTb6AWYFcrqrSE9FL+YkPCow4PHgUGxyA5JdX3NKTnh/wfHPa5u9fiRupEMF6sKu14O3qLwUCCaj+9V0tY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Thu, 27 Oct 2022 08:07:28 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 08:07:28 +0000
Message-ID: <9774ddd6-60d9-245c-77ac-59951c13b263@amd.com>
Date: Thu, 27 Oct 2022 04:07:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/scheduler: set current_entity to next when remove
 from rq
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
To: brolerliew <brolerliew@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20221025061846.447975-1-brolerliew@gmail.com>
 <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
 <a70dcda0-6723-38f6-efeb-e8edb16dab55@amd.com>
 <69e672a5-a68e-7bad-fc49-4281c1c6039d@amd.com>
In-Reply-To: <69e672a5-a68e-7bad-fc49-4281c1c6039d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MN0PR12MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d9511c-8cf2-4a1e-21a7-08dab7f24a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PYXTCGQB50B9EwP/hAQYbbZtnMfN6a5owxXsScZEJER/sVaRu1nMvXhGAzGYjt0k9E0AB3sy6Cm4n2Q/Xvrkw4h4fFvuqIb/L3B7Q7rrQGD5mjI79gl24HZVT1OvHc1HZQTMMwr3qKhORLE/EN0ZvhkO1qZTqeWeQqrmL1Mn2buOxhXflubrzOX0yGW9npqTQyuhyXbgUq7qvvHbm4cSyA01VzYIdmw/AZ9K0qDGOPU4t2a3dSXnm9H7kOTwCATj4yF6iDqYUL1tgq2ZOrpGy02K4KQqDXWoiy4Rpilm+plzk7P9f2RUZuXdV8ocy3kZyUMONSfAHZa4goNAKIZnQCV7j4kHQZIalNIya4mMMBuwrO6Qzg4QSqmEgpn4lfPQ7ZcBv46HeSsHNs3W7u+bivt1Aw51+ldolN7Lug9UVcZe791iD2KpcDM3a2dpMSDeuiSzWTfh+AysbjowHrk9OITxQHwop5/34TrrsaiVnMvJDSeZJzYxE6cPZSk6kRo0zyQjoDEXIxHDQFisf3nzbCx71B7VjDfZANwiSVthIQqzEkHzo1qVY9h1QZZlFbY8gthkF4zQ14TuZJ0KTUbYlYz1YcO3Hx2XM8Ts2cQ1NfsJPHjpgKUJLyoiPDb9F6aGp72tOL/73hv66knHHX+p6yAHnsa4V2Dtv2+FB81n2U1gWynqdy89/LfySOwQHsLD5gtkyeNJQqtfL+KM8YufB66scYYbwahT3vHtrHZcx2uq4KByHeaMimIxzAtTfvoRnbYKszEni/eaAbh1JZYCqMwktIdpVLc19qfyCFBpAhk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(451199015)(86362001)(31696002)(186003)(38100700002)(44832011)(5660300002)(8936002)(2906002)(4001150100001)(66556008)(8676002)(83380400001)(6506007)(53546011)(6512007)(2616005)(26005)(316002)(6486002)(110136005)(6636002)(41300700001)(66476007)(4326008)(66946007)(478600001)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTYrKy9RR2ZxOXM2WTJGUE9QVlFjb0x1TUREQlNGVWQ4bkc5bDRWVlNPNFlE?=
 =?utf-8?B?c2VDTjNESDVlVUMvQU5PSkZmR1F2RHVCdEhSeTBERUl4cUttUW1tYVJ3b1l5?=
 =?utf-8?B?VGV2WURhWHp6dUZMQWxqRjY4aTZ0emRkN01hemNVd25LYUJtUVdZYVR1bUVx?=
 =?utf-8?B?SlN2Y2lmYVk2Qy96bk1BVlBkdk5pYkYwS1hwdDg2UzdtbnlPM1JDUGZIdVpP?=
 =?utf-8?B?YWFQeG1LTExZWG44bDc1VVV3ZDNVVWlxUHJ5VVBQQnlVWmRwNFZBVmk4aHIv?=
 =?utf-8?B?UDdIREZEcXBTdElHVEpxWml1cTQ3ZWR0dkFOVUNoOWYyQmhGYkVGTXRCbk1r?=
 =?utf-8?B?Mm1UbUtnWjd6aUtYRmR4NHJLUXQ4d1IrK011MTBVejN4S0RxZ214WUpneExm?=
 =?utf-8?B?U2gvWVN3QVpwTHpKR1FDOW9pbGRoekhYSlg0OVdiVGVOb2tkRElnNG54cWlu?=
 =?utf-8?B?Q1hNMll3TEk0NWJCNlhqLzQ0MzdnYnRIN2dyM0tEMXJxNW5lejBXNXBvT05p?=
 =?utf-8?B?L0VOY2tWeTEzUWpVSnloSTVPbTJRWVVNVFJZRFVGeE9PMnEzOHg1WjVjQ216?=
 =?utf-8?B?aUxTQTRpdWt5UmRiM25VSTgyaXJiVm13b2FPNDNocHZEa2FQUG9mdng1eFlP?=
 =?utf-8?B?TEpScjBWdVlDWE5ORmpEUUIwbklKWTVZQVJGeUNuRS8vY1FxSW5JT1llMy9t?=
 =?utf-8?B?RGdINTV5WGxiR2pGajZlZFpRaWV6c1VmMFUrZHZOT0tkMWd5TzFBUlgydEM5?=
 =?utf-8?B?RWZWd0xIL1MrQU96UDllVXNGMkpzUG5waSsxQjlBaHRBOXhCSlhiaEU5dlRS?=
 =?utf-8?B?ZXR2Vi80MzNmV2NLT21adGI3VWtYaGV5Tm01eHBHbGFsL0NZRGIyazlza1By?=
 =?utf-8?B?Q2NWYmg4R0FZeGpqTTNpbnJNQUNZdS80S3JPcGNMVC8vd1VqWHp5RThLWGdW?=
 =?utf-8?B?d0NEclFvL2gvMG05VHI3VHViVTJRemxtNHJseFltczExRmxQdzlBRVdOb0Jv?=
 =?utf-8?B?STlkVVBFQ3JlY09KdDR6NHNvZGt1dUZDTWkxMXFHcEpueWRWZHhvbHl2SGVZ?=
 =?utf-8?B?SXh6ZHpTT0lvT05QaDVlVThOQ0J1dnF3ZDF5MmhnVTlaNURadFkrcDVGNWFR?=
 =?utf-8?B?MTQ0MW9NbFVERDQ5eHhPTGRnUjdJbEM3Slg0WlVVbVpTVmJzWVBVcUs0cnpV?=
 =?utf-8?B?RVdXK2JQMFJ0Ykd6ekNJNU4wMUhpNlJHUXNkaXN1VDU0S3pUVXdQSHhGa04r?=
 =?utf-8?B?N2t5NGczeWJSUVF0aVdRZFZHUEFLTUFiSC8xVW5sOWRZelhOV1V3Z3JBL3VU?=
 =?utf-8?B?N0c1ek1RRVRwMVdaakhOZTViTmYrc0V4cGFjYk84MXFtSit1T2JHKy95QXBt?=
 =?utf-8?B?aElJOTkyenp5SEM2bjBFTWwrbitwdkQvUTlSRlEvMklKYlUyOXZodUdtYTI1?=
 =?utf-8?B?TUVtUXpiU0hOTHZqM1hnOU1TVEk5b2VUeDFzQ3hYeG9oL2Z5TmxMQWhSeVM2?=
 =?utf-8?B?YVdxczBlZllsOUpZQWNFelhlRnd1OFViSUZmUDhSa0JaY05QYk5LOXZaVnlp?=
 =?utf-8?B?MlhpQncvRjh3Qms3cTQySExNMWdmdnRYU0JHUXZLQVMxa0hveTltRnVNWnN3?=
 =?utf-8?B?RldJS1dYTkFHZDNsZ1VGM0Q0NnEvRkUzNzE4b0xpN0h0dDMxRVJTUCt0elA2?=
 =?utf-8?B?QmQ1U25wUkE0dUhtOVZCaWpjTFhhUkNwODhFNXNNQkdVMUxNQzQzUXp5N2o4?=
 =?utf-8?B?VUpQVkF5Z2xCZEM1UnNKTVdxQjlWOW5uTnlBaFY3eGJEK2lkTnJTOTNZYjE0?=
 =?utf-8?B?bDhjNW5zRFpWUEI5eFQrME1tQU9QdG9adlhxQ3B2TFROYTRMSnFTQWdWaTFN?=
 =?utf-8?B?WUdGbnNJcDNLTnp6MFdLbjVGdDVwYVFEZTROUFF3bEFUWDZ1dmdobUpvZmFj?=
 =?utf-8?B?R0xiK3JwQTFTdGgxSk9QRFQ0akgzRlk5RGdVZGlCdXdoenJUbWlkWVRsbit1?=
 =?utf-8?B?TVlXdTRJR2dVMU9sTWpYU2JibzZQUndmUmQ4WWR5OFk2WmZrQ3RnWEs5bjRn?=
 =?utf-8?B?TUV1WlgxMFRNV2Rva1kvcTRmc0cxNVhPZUE0ZXVxQXZLVG9JWk9XdGVkNXNo?=
 =?utf-8?Q?JPnGgJeualHvk5al33stF+o07?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d9511c-8cf2-4a1e-21a7-08dab7f24a81
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 08:07:28.7541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VafEGYWrbeI4AsZ7/FxVxkaaUra6yb8IfzGw68ZKUF9pgAryeGg/bJl1JITW+e68
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-27 03:01, Luben Tuikov wrote:
> On 2022-10-25 13:50, Luben Tuikov wrote:
>> Looking...
>>
>> Regards,
>> Luben
>>
>> On 2022-10-25 09:35, Alex Deucher wrote:
>>> + Luben
>>>
>>> On Tue, Oct 25, 2022 at 2:55 AM brolerliew <brolerliew@gmail.com> wrote:
>>>>
>>>> When entity move from one rq to another, current_entity will be set to NULL
>>>> if it is the moving entity. This make entities close to rq head got
>>>> selected more frequently, especially when doing load balance between
>>>> multiple drm_gpu_scheduler.
>>>>
>>>> Make current_entity to next when removing from rq.
>>>>
>>>> Signed-off-by: brolerliew <brolerliew@gmail.com>
>>>> ---
>>>>  drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index 2fab218d7082..00b22cc50f08 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -168,10 +168,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>         spin_lock(&rq->lock);
>>>>
>>>>         atomic_dec(rq->sched->score);
>>>> -       list_del_init(&entity->list);
>>>>
>>>>         if (rq->current_entity == entity)
>>>> -               rq->current_entity = NULL;
>>>> +               rq->current_entity = list_next_entry(entity, list);
>>>> +
>>>> +       list_del_init(&entity->list);
>>>>
>>>>         if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>>                 drm_sched_rq_remove_fifo_locked(entity);
>>>> --
>>>> 2.34.1
>>>>
>>
> 
> Looks good. I'll pick it up into some other changes I've in tow, and repost
> along with my changes, as they're somewhat related.

Actually, the more I look at it, the more I think that we do want to set
rq->current_entity to NULL in that function, in order to pick the next best entity
(or scheduler for that matter), the next time around. See sched_entity.c,
and drm_sched_rq_select_entity() where we start evaluating from the _next_
entity.

So, it is best to leave it to set it to NULL, for now.

Regards,
Luben

