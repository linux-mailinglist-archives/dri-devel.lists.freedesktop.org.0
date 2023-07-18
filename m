Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F1757350
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 07:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E0B10E06F;
	Tue, 18 Jul 2023 05:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A34410E06F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 05:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0ZyXgg1FNUWQepN1fRBubcUYCYza3Z8SXfvp8Ov1gAU/LBS9hPLr9yfGULWGVPxfIE6+HLcQgAJC2Y9HSwFVFJ3hDdmNzD+nPLFCvjrAOemJpkEFaCOVqxYQDLqkmzoEeeaVMQZYRWQuRJRb06ooHfRpEqb+4TlEj4cge8QDH7WSkYrtGJJLxdgtYlmED2cgDmLkCqdgYtPCCANJouw87Ke6gYs9EaUVfmwXRb7lFgZVxnEXIJ+XLCLCTIWxtG0V2OBF8WoFuwvWuEmDrOIFv0Jahy4xQHS7NG48EYnOnyhFJBkli1O7mCtxjDR1q0EjvXygXs+ir37ZKk2zuDV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QA0TPtns/NG4vXIq9ldGOvIdEQX6g9y4pY3S82OuMg=;
 b=UwLtKAPxdSZlAKbLrPlQ6/kOhNF+hL2uA4OCkXu44pHUnAH9g3jOzZjF+Lcgq7gBFFi8bU3aze1//EdBVLDDkyNRLSYhVzh4mz6MclbuSEfXggKMLv0rXPLYiK8zD0LuP2z9GkfA6+O/SagQ9ltf5cA73VO1jm+JHr/i4no8KFyUnmRWliq8r7h/jKixHNW+HZiru4E1eWDY0kAggJXybpdDBUpim88fOYixzmgUJ/lnEDoAwHN7jXbT1M4dmlutjMpEq0ZXctpUnnDfem6JKS7q0jJ4QCv/m/RDvV6mrn4PzNZ1V+vPpLFp2wuxuVH+hzgRN4QTOEOZ30MW/2I3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5QA0TPtns/NG4vXIq9ldGOvIdEQX6g9y4pY3S82OuMg=;
 b=AONmNg7II4GaTwf5zm0fCl5b83DXUcRxr9Bajg1upSNCGeptiEgItKoBea5uYDdUKnMNkm7PyPWWyAeiYImuYha4WN9AoMOZ1CgTrkX/UjAjuBsD3HrxOsh9LRtJGE+1+8N5yRcVRJdBOflOh72j8g9lmxvJEaqqJAOR0s+iAmc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CO6PR12MB5426.namprd12.prod.outlook.com (2603:10b6:5:35d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.32; Tue, 18 Jul 2023 05:45:48 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 05:45:47 +0000
Message-ID: <daf48d76-ceee-c82d-a63a-e8e7770a9d83@amd.com>
Date: Tue, 18 Jul 2023 01:45:44 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/scheduler: Fix UAF in
 drm_sched_fence_get_timeline_name
Content-Language: en-CA, en-US
To: Asahi Lina <lina@asahilina.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 alyssa@rosenzweig.io, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
References: <9c0cff84-45b1-268f-bdad-38c16316dbc3@amd.com>
 <20230714-drm-sched-fixes-v1-0-c567249709f7@asahilina.net>
 <20230714-drm-sched-fixes-v1-2-c567249709f7@asahilina.net>
 <bef7ef62-3cd9-6ceb-5eb4-5ae0c0236778@amd.com>
 <de502b41-2864-db1e-16a0-8a5d5e0e4ad3@asahilina.net>
 <d9dc2fd5-d054-dbf3-72b7-fe9deaa46350@amd.com>
 <236422117088ca854a6717114de73d99b2b9ba2f@rosenzweig.io>
 <a42bd218-6eb5-6ddb-bbb4-d25118c59f40@amd.com>
 <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <7b564e55-a9b7-0585-3cf1-d1f132f9a918@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::6) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CO6PR12MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: ea13b3b4-c098-47f9-7965-08db87523bf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wTnKYjemGBXAzHYe/nMd5QrnGJuhVYPG339xf8rpdQPMPDNIErsR6FoB2Pep/Dh+N/RVlRmySyBLd1GkoGsfRDsbBiEHGDJ3z48vKLHm/btGssipfJqAEIzkBcgGJ3zrXM9XOotibPmLcxAHiz1uhFHrw8Y0CcpRXwSbqOTaTcwV8AICHxnMaKtZ4nHoPLWIlxxDHluyLVfGLt+6UItvjpOLqIyhrcxcW1CftERUTeTkwS5kpPkiKZKRBcfGzuMITRb59bMM4r1cijOCJGLvCgouW7I+x23cx5cLWwhwHGzSr1hjuaQVD602DzZppM0yHVApCZudHBeQBI9B9mRILh+xPdUWf4Ug8Gywugp6oztdY1+mYVgxENONBy7XB/VmXm27iRqb2x3NfYlyG7JH1iSp1e6/JTiJMfPW+TLyl7QakBAk3M2MBVfo5B2QNk3UOTiU3qYT9/VXyHdR/FgT8yX31nyjZDd8dWa3XMMYeYSxgm4L9wGomjXif0YsKIAiZqgbdn67RA3BeFEYHJEVH0iuJmBiMOsyfWKCz/dVX4uF4xQgTKVqHh8pIJrFGyVJkrYFc0VlLl91fbpuIsVbyv/5eT7JgjgMnJOhmu3T+u1R0C3EQ/lrtZbbrWZES0QrGHrq0kAVEVJWEsw5VOuSmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(8676002)(7416002)(44832011)(41300700001)(86362001)(5660300002)(8936002)(38100700002)(316002)(4326008)(66574015)(83380400001)(2616005)(66476007)(66556008)(66946007)(31686004)(2906002)(31696002)(36756003)(110136005)(478600001)(53546011)(6486002)(6666004)(6512007)(186003)(26005)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M252MXFqSk92R3BTZE9uN0FjYUM1M05VU3h4WjJVME91M0NPSkVoMUFMNHFj?=
 =?utf-8?B?MHg2MGFwMVV5bEcreWFEeFlla0V1eXJGWGhlamNUUGpiOFlNa2RoeHFwdEdu?=
 =?utf-8?B?VVJ3L3J3MHZzM0lwOXgrbWxFbm5BajJYMTZEMWloYkN5R2NjODhsTGFYT3JU?=
 =?utf-8?B?dEJQOEU3SVJuTlgvaHlTOHoyM0Q3bEVscGgrV0xqZ0FVY0pvbmFCR042TmZC?=
 =?utf-8?B?YVNnbHU0Lzh2b3IvZEZVZlY4WnBXaG96dnd4VzhLeDF0TGZBQk1LR0VKdmVX?=
 =?utf-8?B?Sk53RDkvbko5UDZBQmlnZm15bHVHMnlZL2d2dTRoZHo4VExQREk4dlkwVE8w?=
 =?utf-8?B?U3hTbDV1ekRySC8vREVsNy9PdjRmd2N3K0srWnNUWWQ4SlN1U052OUM3cDZN?=
 =?utf-8?B?dDhhZnZSRDhaL1BDcXYrZFF4bTJXUEwwZnJIanJSQy9hMC9EMUEybVFZemJh?=
 =?utf-8?B?bHJML0RBTE1vNXZDNWVHcVkwRnc1Zm55bFZUSjJCUU03dzlJbmJnQnE2Nnd3?=
 =?utf-8?B?N0xtOVBxZlR0amFUWTFndWltcWNjYTJTNEdGSHNPMmhHUHpzM2ZkZGVjc1Jp?=
 =?utf-8?B?dnJOcFBCUHdoV1hCRW1JRnQ3dy9PeDNPRlRseTNGVXNkZ2pXNU5Vc3NYNmx1?=
 =?utf-8?B?VjBZbklZRWtKeXhGY0psUG9XU1F6cGFHVThpdDBGOTF4aHoraGNXWUJ1MzF5?=
 =?utf-8?B?T25IU25ZNThCd293bHAzV2wwMWFRL2p6dkxmSjU5OWQwbEpGeFZMQ3huY3VU?=
 =?utf-8?B?S0ErU3R6N2FJdVo0RUlyaFd2TlRQZzN6bnFsRG1pZ0xaZWkzQ29lNkgwL3lF?=
 =?utf-8?B?Z3ZPcTQ2eUtscEpzM2xnWVlnYTBmMDhvYkMzWVVxc3hTVzl3UXQ0em5zeGRY?=
 =?utf-8?B?Nk9jYWI3SjVtSWYvOTd5UkZyaUlQVDlyUlhIS0l2QlByR3JmeUFGVkp1emxK?=
 =?utf-8?B?UHBVSm9tRTZqYlVza3hHSWRlbytvSUxtZTdMeTNBZWVsQXhQVXd2MzAyMkJM?=
 =?utf-8?B?dEN0V1dRWGJUcEI0c3QrRjUrWlZrYjh0TGdrTXBnVlR6VHl5RWl6V0w4MGM5?=
 =?utf-8?B?TTlrZGIxc1RXV2tEK3ptUUI4a01HS09rVHh4NDhDOXRPOWQxS2tibi9OMllp?=
 =?utf-8?B?MXJ1blBOT2FKM1FJVGVvRXNlSVNkcnJiUmdQN1JqVlMrdDR5THpHUHE5dVh3?=
 =?utf-8?B?S2YrdkZOUUFDOGltRjM3b0ZHUkpUQ2dsa2ZpNmo4ak9Ra3RTU3pKbXovcmE2?=
 =?utf-8?B?RGFLQ1lvd3BJVnRGTHl5MnZtakFuNDZVWlhXSTlxTE9NSkd2YjZKVUxyNzdI?=
 =?utf-8?B?T0toT3lRUjVNZVUrSXY3RG9RbVZjT2hjQjFLOENubzc4NEVpeU0vS1hnZUtI?=
 =?utf-8?B?Rm5yWlluQ29oQWM3WlVycVBaa3FmS25tMXMwOVo2NXUwZ2lHMC9KL1dNK01Y?=
 =?utf-8?B?TngycHIrbWdtcnBNT29Cb3RzRmd3d25zUzB4VUNyWG4vcnp1REljZ1BQQzlI?=
 =?utf-8?B?TTA4RXJ3c0JFa1hDeDUxK1RUb2d5ZWVUaDlnUlhkaE9RM000UHhlMTdxQkNm?=
 =?utf-8?B?NlN1MHB3VS9QMXozVE5sWEowby83ckFNdjV5UG9qeHVUdlJJYk02dUQ1cDZT?=
 =?utf-8?B?Wi9ZS2RWRHRpTmplN2NHM1djVE93SnduWEFKSkxoeTVudjY5QlZtb0JMbjJP?=
 =?utf-8?B?UWZzRHZqYUhET2p6TmI2dzJSOGxpM3M1U1JzN3hUYzJBNHU3QlFBVkRhbDh0?=
 =?utf-8?B?M0dqSllOZUQwTFZmMitzQStHUVJvSVdZUjBNVjZuVEtPM0hhU0xtZlROeU5z?=
 =?utf-8?B?emdIbTZmb0M3eGxKL1VhYkZ2OG5YUW9ZcEtZMWlJdkMrd204UFJEQ3JWME5q?=
 =?utf-8?B?M2xYL0srK1gvSzlzTkRCOUFFZS80bks4ck5pVzlXQTdqS2dWeFIxenM1eU5I?=
 =?utf-8?B?Q1RCdUV0OGIrVW9LWDY5Z2VVcitOMmd6YzNUVmpmVCtrOERQRVBPT0JETEZx?=
 =?utf-8?B?MldPYmpLUk54OGdyWkxyNDRUUVZMN3cyaE41YlN2N2d3Q09xdjRpdjVodmc5?=
 =?utf-8?B?SUk1K1QyMzRtbWo5M0szSVpDanA2czJEaGtDN2ZVM0F3NTBVc3hqdUZzZVVp?=
 =?utf-8?Q?yQo0HByL57egm0Kq1ssLMO8Zj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea13b3b4-c098-47f9-7965-08db87523bf6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 05:45:46.7840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkHKWevkT61qFKxXTmTRBfR9Q+9Cb+3b1LpQjEqr976QrYllfJupbIlBwg8owm7y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5426
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
Cc: asahi@lists.linux.dev, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-07-17 22:35, Asahi Lina wrote:
> On 18/07/2023 00.55, Christian König wrote:
>> Am 15.07.23 um 16:14 schrieb alyssa@rosenzweig.io:
>>> 15 July 2023 at 00:03, "Luben Tuikov" <luben.tuikov@amd.com> wrote:
>>>> On 2023-07-14 05:57, Christian König wrote:
>>>>
>>>>> Am 14.07.23 um 11:49 schrieb Asahi Lina:
>>>>>
>>>>>> On 14/07/2023 17.43, Christian König wrote:
>>>>>>
>>>>>    Am 14.07.23 um 10:21 schrieb Asahi Lina:
>>>>>    A signaled scheduler fence can outlive its scheduler, since fences are
>>>>>    independencly reference counted. Therefore, we can't reference the
>>>>>    scheduler in the get_timeline_name() implementation.
>>>>>
>>>>>    Fixes oopses on `cat /sys/kernel/debug/dma_buf/bufinfo` when shared
>>>>>    dma-bufs reference fences from GPU schedulers that no longer exist.
>>>>>
>>>>>    Signed-off-by: Asahi Lina <lina@asahilina.net>
>>>>>    ---
>>>>>       drivers/gpu/drm/scheduler/sched_entity.c | 7 ++++++-
>>>>>       drivers/gpu/drm/scheduler/sched_fence.c  | 4 +++-
>>>>>       include/drm/gpu_scheduler.h              | 5 +++++
>>>>>       3 files changed, 14 insertions(+), 2 deletions(-)
>>>>>
>>>>>    diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>    b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>    index b2bbc8a68b30..17f35b0b005a 100644
>>>>>    --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>    +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>    @@ -389,7 +389,12 @@ static bool
>>>>>    drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>>>                  /*
>>>>>                * Fence is from the same scheduler, only need to wait for
>>>>>    -         * it to be scheduled
>>>>>    +         * it to be scheduled.
>>>>>    +         *
>>>>>    +         * Note: s_fence->sched could have been freed and reallocated
>>>>>    +         * as another scheduler. This false positive case is okay,
>>>>>    as if
>>>>>    +         * the old scheduler was freed all of its jobs must have
>>>>>    +         * signaled their completion fences.
>>>>>
>>>>>    This is outright nonsense. As long as an entity for a scheduler exists
>>>>>    it is not allowed to free up this scheduler.
>>>>>
>>>>>    So this function can't be called like this.
>>>>>
>>>>>> As I already explained, the fences can outlive their scheduler. That
>>>>>>    means *this* entity certainly exists for *this* scheduler, but the
>>>>>>    *dependency* fence might have come from a past scheduler that was
>>>>>>    already destroyed along with all of its entities, and its address reused.
>>>>>>
>>>>>    
>>>>>    Well this is function is not about fences, this function is a callback
>>>>>    for the entity.
>>>>>    
>>>>>
>>>>>> Christian, I'm really getting tired of your tone. I don't appreciate
>>>>>>    being told my comments are "outright nonsense" when you don't even
>>>>>>    take the time to understand what the issue is and what I'm trying to
>>>>>>    do/document. If you aren't interested in working with me, I'm just
>>>>>>    going to give up on drm_sched, wait until Rust gets workqueue support,
>>>>>>    and reimplement it in Rust. You can keep your broken fence lifetime
>>>>>>    semantics and I'll do my own thing.
>>>>>>
>>>>>    
>>>>>    I'm certainly trying to help here, but you seem to have unrealistic
>>>>>    expectations.
>>>>>    
>>>>>    I perfectly understand what you are trying to do, but you don't seem to
>>>>>    understand that this functionality here isn't made for your use case.
>>>>>    
>>>>>    We can adjust the functionality to better match your requirements, but
>>>>>    you can't say it is broken because it doesn't work when you use it not
>>>>>    in the way it is intended to be used.
>>>>>
>>>> I believe "adjusting" functionality to fit some external requirements,
>>>> may have unintended consequences, requiring yet more and more "adjustments".
>>>> (Or may allow (new) drivers to do wild things which may lead to wild results. :-) )
>>>>
>>>> We need to be extra careful and wary of this.
>>> Either drm/scheduler is common code that we should use for our driver, in which case we need to "adjust" it to fit the requirements of a safe Rust abstraction usable for AGX.
>>
>> Well this is the fundamental disagreement we have. As far as I can see
>> you don't need to adjust anything in the common drm/scheduler code.
>>
>> That code works with quite a bunch of different drivers, including the
>> Intel XE which has similar requirements to your work here.
>>
>> We can talk about gradually improving the common code, but as Luben
>> already wrote as well this needs to be done very carefully.
>>
>>>    Or, drm/scheduler is not common code intended for drivers with our requirements, and then we need to be able to write our own scheduler.
>>>
>>> AMD has NAK'd both options, effectively NAK'ing the driver.
>>>
>>> I will ask a simple yes/no question: Should we use drm/sched?
>>
>> Well, yes.
>>
>>>
>>> If yes, it will need patches like these,
>>
>> No, you don't.
>>
>> First of all you need to try to adjust your driver to match the
>> requirements of drm/scheduler and *not* the other way around.
>>
>>>    and AMD needs to be ok with that and stop NAK'ing them on sight becuase they don't match the existing requirements.
>>>
>>> If no, we will write our own scheduler in Rust, and AMD needs to be ok with that and not NAK it on sight because it's not drm/sched.
>>>
>>> Which is it?
>>>
>>> Note if we write a Rust scheduler, drm/sched and amdgpu will be unaffected. If we do that and AMD comes back and NAKs it -- as said in this thread would "probably" happen -- then it is impossible for us to upstream a driver regardless of whether we use drm/sched.
>>>
>>> Lina has been polite and accommodating while AMD calls her code "outright nonsense" and gets "outright NAK"s, and puts her into an impossible catch-22 where no matter what she does it's NAK'd.
>>
>> Well as far as I can see I'm totally polite as well.
>>
>> Pointing out that approaches doesn't seem to make sense and NAKing
>> patches is a perfectly normal part of the review process.
>>
>> What you need to to is to take a step back and ask yourself why this
>> here is facing so much rejection from our side. I have to admit that I
>> don't seem to be good at explaining that, cause we are obviously talking
>> past each other, but you don't seem to try hard to understand what I'm
>> pointing out either.
>>
>>> That's not ok.
>>
>> As far as I can see it is.
>>
>> As maintainer of a commonly used component my first duty is to preserve
>> the status quo and prevent modifications which are not well thought
>> through. And to be honest those changes here strongly looks like Lina is
>> just adjusting the code to match her requirements without looking left
>> and right first.
>>
>> Regards,
>> Christian.
>>
>>
> 
> I give up. You are ignoring everything we say, and rejecting everything 
> we suggest. We've already explained why drm_sched doesn't work for us. 
> I'm tired of repeating the same explanation over and over again only to 
> be ignored and told I'm wrong.
> 
> I'll start working on a new, much simpler Rust-native scheduler based on 
> the workqueue Rust abstractions which are in review.
> 
> ~~ Lina
> 

Perhaps it is worth having a reset and just trying to clarify requirements
one at a time, even if that involves describing a change on a single line
in a single file.

The maintainer discourse is quite common. Its ultimate goal is to keep
things working. If we let some dependencies loose, or change some requirements,
it's conceivable that this may lead to further problems with new development
of current drivers, as well as new drivers. This will lead to more one-off fixes,
and more "adjustments" to the point where the core requirement is lost,
and the code has lost its purpose and meaning.

Maintainers usually see 10 moves ahead, while driver developers as such in their
role, are expressly concerned with their immediate need to get this and that
driver and its feature working.

We should perhaps concentrate on the core of the requirements--the very
root of what is deemed to need to be changed, to understand why, and
if there's a better way to achieve this, and in general a good reason
for the way to proceed forward, whichever way is taken.

Let's take it one thing at a time, slow and perhaps in a ELI5 manner to make
sure no one misses the other person's point.

Perhaps short and lucid, but complete emails would be best, with code quoted,
and scenarios explained. I know this takes a long time--it's not unusual for me
to take hours to write a single email and I'm exhausted after that.

We all mean well here. Hope we can make something good.
-- 
Regards,
Luben

