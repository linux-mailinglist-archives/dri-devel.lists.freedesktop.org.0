Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F80F3E1622
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 15:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7246EA66;
	Thu,  5 Aug 2021 13:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922A86EA66;
 Thu,  5 Aug 2021 13:57:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXT526zixwNW4HWXUprf8fIJEz7afgXtCUYOBYjGbGv3+jDXQvi1n7/fJ6Q3Ig7oXN9sHzGKetlxUXyPOb2CMDIuSv70Mi+Dd+enhrXE+hgs9l4ru5eQ3dYao92GCXIqQFlPSEe8MTIQnQ9jnOz+nQFXmpo+giFply60l5LvFyRZTFL7+ORg4k3yCuxJ9sbl1iB0cvmQJuaUhrXweJylkHKPaBw1tVFWVZmBwr6+lNPD63kOCTmL7guDHQY1DyQ6rl8ZGYwZuQ0hho57mtN/lKzV6C+vn33MijVX3OJo034WdUdNetLdzh3ph8YJ7XTICjdI+Q09pyITh9QKkSoerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPng8RsXliUA0nlJ9Hb1qujCqsBZ1DdUEMl2XVI/6Ak=;
 b=CCq8Uy+r/ZdaZHtpSBbC4qPacvVrzhQPP+8MNWttU2WhvHJKVxmOIXFKAb6HEb1MXDc3rUjjSKRcBpKOVQsM4jNDJSLJI3HTVCQQYOnVXlODSJqygV0fMo1HJuAmhKctwmayePZq1+HBQ6UGvJbpLq8CJE1p8Wk4jb602bhRiEUFXVUlwl6dqIpLveLcigl81J9ZC5ILt2YrfhrIre6zlHdTBy3HnBwVlnlqSAQNlbO0M80JnCUywv6QrACf6Rpyb6n0bBNWMLpo3HQbTKpNNV3Ka/pteISk7WlRHdxnuqXvGYuD7w40l7h+QKvnaAiTK1aFSYHNa80NgQQAjfBYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPng8RsXliUA0nlJ9Hb1qujCqsBZ1DdUEMl2XVI/6Ak=;
 b=unOfsKOb/IGoImkT2B5hsTI5ykGLieQyY4xlYJfAr2dRfuwvEOWVjmJUfR1rvcli68bjz5qe7agtMMLeuHieceWC33h5hlxLv+M/teCG8UrYlHuK91giexBjsemhU1Or/P78apudvsK+H1Bne7tYw4ujoa8P2dicHzpSPTCadWw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3936.namprd12.prod.outlook.com (2603:10b6:208:16a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 13:57:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4373.027; Thu, 5 Aug 2021
 13:57:11 +0000
Subject: Re: [PATCH v5 14/20] drm/sched: Don't store self-dependencies
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Lucas Stach <l.stach@pengutronix.de>, Melissa Wen <mwen@igalia.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Luben Tuikov
 <luben.tuikov@amd.com>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20210805104705.862416-1-daniel.vetter@ffwll.ch>
 <20210805104705.862416-15-daniel.vetter@ffwll.ch>
 <f883e6af-284c-9400-ca3d-b5192d11fb01@amd.com>
 <CAKMK7uEVbTOuJVvQDybFM+9x4LUP+ojcCzWfkp4sau3oX7fjXQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <32f5f17d-9c2b-c6e3-9809-4100bcadf21c@amd.com>
Date: Thu, 5 Aug 2021 15:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uEVbTOuJVvQDybFM+9x4LUP+ojcCzWfkp4sau3oX7fjXQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ae89:49de:1628:3147]
 (2a02:908:1252:fb60:ae89:49de:1628:3147) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend
 Transport; Thu, 5 Aug 2021 13:57:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87ec8076-362c-4bcb-0914-08d95818ec23
X-MS-TrafficTypeDiagnostic: MN2PR12MB3936:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39360EA2327274B557DBB36383F29@MN2PR12MB3936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4DiSDv8JD+cumGd/PGJAt8ZZFK5kARWzCUc4d+YI3t3PSIo2ToFaU38ujm5dLSoh3Hj//ITmkLVh8bxMn8sckCZI4d5x6xcnPZh5lvl3LV7qN+8Ge3tuzcm3pKFmKI/agAIK2XUGDYHJTULIVE2vntcbnhqbgLkMQgdhBBF0YdfXnWOPgYRADZ8GagQ+M7mnq271ku40UcpphF/7hEYGxrBtI/2uvLVqcIB80bA9BDQXa8PPVXtkxpP/no8Q9HYVfCm6baDMKskoyPkPekwwSjhZzw0VlJnWALUcd9C0yDeOY3J9VBtuesL6Fpi4c/fZf5uV7XRlAFvPVyz7QrOvb+xSLzwBJDh26YKRaVpzanDQOlAF5JoZZNsEAO0bZZuXFHgn5DICqYVVLSqYt+EA7019QdHSw1F1/cJmyMgx9SQYDCJ8c9SMsLC1mX/5dJ0nqsAt5F3OI47RNDDp4AvONKktKsdXxOIN0qydzQtcfaIx+6sAEjWQUa45t2yQK99hmXCIBp+Aeqa59oz8K8QB7s8avIWfKsizH3LY9uSTsnX1sygcMsaQUK4f/v1L2DkPqMb8qPwOedLsLsBqZefc4b/UKfRqsDQyD567BiYsE0RMbLOH0WNH6i0ld4Ndb1GuT539LkRbdXz7f8xBplJ+B1DgcM6u7NMAnbe/zDi9fbuVEYc385BIv6ucnnlR2UZhqvjjyUExX0HUMkr0kxwIp8xfmbqKpQ4eQht+yC8JgeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(66946007)(66574015)(31686004)(6486002)(316002)(4326008)(2906002)(86362001)(31696002)(54906003)(36756003)(8676002)(2616005)(66556008)(8936002)(6666004)(53546011)(6916009)(186003)(66476007)(83380400001)(478600001)(5660300002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUt4dmdiSHUxbHlrL1pEcUQ5eExkWXN6bzBsdHo2WUxRVzFTSHB5Q1I2dlFl?=
 =?utf-8?B?K0YxdXBDVVhsa3JESXpCRncvSktnSWxpOUR2blA3dHRyM1BvZExOL2dhWm1r?=
 =?utf-8?B?WDY4ZWt3bnpiZDgzUitYSWpzZVk2b1hMM1UyQ1VkRWpORU10UVcyeWdtM3lI?=
 =?utf-8?B?dDl4eGVSNzlCRmxBV0xGREoyK0JMeGl4b3gxTDNZUFN5NzFzeFdYVEFnanZE?=
 =?utf-8?B?WHl3NzhpMVlPeDZ3MVdjRGY0MU1KM1FXVm5KSkpjaEYzZEl6R1FYVGtUYWsw?=
 =?utf-8?B?WjAySTEzaC90bTBvQXp2UU5pcGpKWXFZVXhkcS8vb0t5MXFCaE1GNXJaUkpD?=
 =?utf-8?B?RHlHV3BTS3hUVTNBWk5ydWxZZTd6aVE1QTRNS3Z1cWJKMXpqZGVDQXVlZmp2?=
 =?utf-8?B?SC81QW5tdnlsblB1V3BvVjdzRXpDOHFoSFpxcFgvTC9TdEo5OWRiN3Q2YVV0?=
 =?utf-8?B?ajlGUTFwd2w2cFZFNmp2SytkL3VSUW5nemlYa2FjNVVkQVp6SFNUSHdDMjJ6?=
 =?utf-8?B?S2Y5eVFtY0VPZGkvQ0ZxU1VkV2YrR2c1emJ0OTBBWVlkT0JjcFZNejdGQm1K?=
 =?utf-8?B?SlUrYU93d1pnQVUwOHhjSk5xMFdEeUhTQ3UwU2lzWEJYODlZSjNicElxT09Y?=
 =?utf-8?B?R0ozWUU2OU5CZTZRT0EyNjIyeFZlQWh3OXh5QUk0RDlsajFRMElBWHk2aWVt?=
 =?utf-8?B?YlpZdjZzTlNVQ3ZiK2o3RjdSd2RUZExNd1ZNWHZDdFhyQzdxRnhERlR3NnFH?=
 =?utf-8?B?ajJOUHZSTDZqckZzUC80dFRYb0sxbnNoS1V0cFJYTEFEZUR4ZmwvNTFPNUNO?=
 =?utf-8?B?OWl4SEI5OVk3YnhXTTJxc29NUzlEZ2lkVVhlNHA4RStWVnRBck9Rdm5wMlo4?=
 =?utf-8?B?c1JTL0tVaE5xUG8rV3RnL1dQYkZQM01PUitIcHkwbkFSL0RPZFFzMUpKeWdl?=
 =?utf-8?B?SmEvY2g2a29VS1NXN042S3lUQnRYa3pnTGNURHZKUVNaUEdUUk1Kd0lpQldF?=
 =?utf-8?B?TFE0WklKaEErNlJweEJHL2ZZK3NQL0QxL0t3TmlFWGJQWEI5SnVYNms1KzU2?=
 =?utf-8?B?SngxZllXV00yZXhhMzdRQjU3dCtrMlNoMVVsbm9BM3ZKMjhFYlpDVmtvODR0?=
 =?utf-8?B?blRFdHVzMFQ3d3ljQ3l0L2xxMEpOaFBSbXlnbGVZb3NCS3JXdFU0UEUzb3I3?=
 =?utf-8?B?YkhGS1pHY25mM0F4TkYvU3VWWGlXQ1NyNytzOEpnbEE5SEZrbWNDQUJTQkR0?=
 =?utf-8?B?UktoVFhmeFVFNkpwdmp0a2diMVgrK3EzL2M0ZHVBTzBCbVpUM0V6dmh1T1N4?=
 =?utf-8?B?K1hLQ0Y5WkcrNi82c2ZSTEJyb1ZGTk5CdUFpampUbXZ5S0hjRE8wTzhqTHZD?=
 =?utf-8?B?ZmlvQ3dlVzRQTWkweGpXczRPTzVLVGY4ZFJ6TFNySkJhZU9BT0gzWnd0L0Q4?=
 =?utf-8?B?YSs4djFQVzgwLzdyempBTFNRckEyVmJjQ0ZIMmcyYURUQlUzcUkzSWxMNS9p?=
 =?utf-8?B?SkdDaVpwTWxiZEVmeWx5YU1uVjJvMXIvakNHR2pMWkkxNUFXNFNlajFMcDg1?=
 =?utf-8?B?Yk9qaVdrSzFNNWxvanNnRXZqNGk1QUZUUXJyU29weFRBR3pKcE9QMlpOQWlX?=
 =?utf-8?B?aHFhcTIxMnNKd21VVlVGQnhaTlhNYlpSNXdhOXk5WlZQVnZ1enNLWkRiU2VV?=
 =?utf-8?B?bndqRlJ3S0hVKzg4bkp4NkYra1lHcFJTMnlTRjlaa2hNN1htUXVNWFcrQlB1?=
 =?utf-8?B?NFRkdFlvSkswNkFwY0ZsZXA3SnNUTTc5VlMzR1FGL0tFTFlJUzJBZlkzcXBi?=
 =?utf-8?B?RDhDMGxkQ05wS3hyWEtvc0Z5UlJ5ei9DVTE2ZGVOL1plbGJISnBheHVwamE1?=
 =?utf-8?Q?PNQ28WPyI+ulk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ec8076-362c-4bcb-0914-08d95818ec23
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 13:57:11.5113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+2ZD9B9P6YRJq79WspYAJakfUB3wo24cYnX75Uj8gpAsLBzPr3ed4Cp9MOJczqa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
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

Am 05.08.21 um 15:25 schrieb Daniel Vetter:
> On Thu, Aug 5, 2021 at 3:18 PM Christian König <christian.koenig@amd.com> wrote:
>>
>>
>> Am 05.08.21 um 12:46 schrieb Daniel Vetter:
>>> This is essentially part of drm_sched_dependency_optimized(), which
>>> only amdgpu seems to make use of. Use it a bit more.
>>>
>>> This would mean that as-is amdgpu can't use the dependency helpers, at
>>> least not with the current approach amdgpu has for deciding whether a
>>> vm_flush is needed. Since amdgpu also has very special rules around
>>> implicit fencing it can't use those helpers either, and adding a
>>> drm_sched_job_await_fence_always or similar for amdgpu wouldn't be too
>>> onerous. That way the special case handling for amdgpu sticks even
>>> more out and we have higher chances that reviewers that go across all
>>> drivers wont miss it.
>> Well you should probably drop the sentence about the vm_flush, this is
>> completely unrelated.
>>
>> Additional to that I still don't think that this is a good idea.
>> Dependency handling is something completely driver specific.
>>
>> E.g. even when you have submitted jobs back to back they still might
>> need a cache flush in between and that is not only for amdgpu like this.
>>
>> What you can do is to optimize for while looking at the fences later on
>> and then note that you have done so and what the last hw fence is you
>> used instead.
> Out of 6 drivers using drm/sched 5 can use this. When we get i915
> over, that one will be added to the list. amdgpu can't use any of this
> anyway due to the vm_id allocation requirements, which is why I
> mention that. Also note that all the callbacks are still there, so you
> can just ignore this all and still build your own. Like amdgpu does.

The VMID allocation stuff is rather easy to handle, that's why I noted 
we should remove that sentence.

The problematic stuff is handling the cache flush and pipeline sync 
which you make impossible with this here.

> So I'm not sure what exactly your object is, aside from "this doesn't
> fit for amdgpu", which a) I know b) the commit message explains c)
> doesn't actually hurt amdgpu in the slightest. And we still get the
> benefit that for most drivers it's a nice optimization.

Well exactly that's what I wanted to avoid. We still can use this in 
amdgpu even with the VMID allocation stuff and I still hope to do so.

Can't we add this as a wrapper or similar?

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
>>> Acked-by: Melissa Wen <mwen@igalia.com>
>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index f77456929139..49e507f91ec0 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -660,6 +660,13 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>        if (!fence)
>>>                return 0;
>>>
>>> +     /* if it's a fence from us it's guaranteed to be earlier */
>>> +     if (fence->context == job->entity->fence_context ||
>>> +         fence->context == job->entity->fence_context + 1) {
>>> +             dma_fence_put(fence);
>>> +             return 0;
>>> +     }
>>> +
>>>        /* Deduplicate if we already depend on a fence from the same context.
>>>         * This lets the size of the array of deps scale with the number of
>>>         * engines involved, rather than the number of BOs.
>

