Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A370760F245
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 10:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB7410E568;
	Thu, 27 Oct 2022 08:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B16F10E568
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 08:24:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9NYA1/6LiT/FwGJ9iQKxDNzRJzabCa+Sk0RqpsANJy4fAoqolcQDKCLHF59k8ZgNpLlCAIMId6OupLTM8IuDko/qhr9/OH/S0kkxD7dAcLR9MNxgnZXt6562g1deCtBNnG4AzsLifcwo5gPD1KDG1T1vGwZaxPLbphO+J/bQje5UnjmCypBMHmSUu4s4JQ3qmWGpSRqFwHmXy6WMaYt4svn34kQYmdC1XyJCWKuvUixNm/cthhssytaAc6YCoLlIgb8J2ePop+/hoqZCgni4ZeyzWj3bq3X7bkNcLWvNycmjDvvqUvRUetfwcTVC8nnKrJ1gKUSCGLFonVnTuP+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssW8B9K6q7hhnxObzL5N+R5XSnPF1TYDgCy/b9JvuvQ=;
 b=L8JFYugAHMNTirSKETBodAMJXkOTFtMLWPsVfxQY4A2jNcxgYSQBIvlz+5zxdZtEiZQcrchG0FtB4rLEZJutW82WksBIOQgZa/zqAEPfslfHpHUuaViaEYQQONYvbRyIM0lmO7y01GCDFsDdFrMTPhyxT7xIWHIdAWnwJAGwpsP6pGFZVOkyKdDy6WaWeOpn8IlKuYbh7HhjTnAce7XLbp5AfEIDPEFJKJ8Uzs+a8MgMM4x+NcShhh0BE/YSQqfnLc97WqZlw4hInw2LChlv3UmNBfyXPz3E+XCv9+MBJWAMogyY7yCh6tKRFIT7v+qsVS+b9tB+fHFT38qZ/b9f+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssW8B9K6q7hhnxObzL5N+R5XSnPF1TYDgCy/b9JvuvQ=;
 b=DberEgoy33jq7/FlpKCm9Kl5oRkIvEJpwCYabbVss4xJC+C/S2bexBAtZKGu6UlMA+vwxiPztjkx9R2yeeDq8xb90my1IWV2w7L4xwC2aFfsccaUp+D1jlBC8w9gBwXKzUE+9FQFO91t/fm0RbKtq/tM1LjZQ3+iFGj7VHuvu5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Thu, 27 Oct 2022 08:24:36 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 08:24:36 +0000
Message-ID: <5bc35aea-466b-bd09-563e-f3e32796b83b@amd.com>
Date: Thu, 27 Oct 2022 04:24:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm/scheduler: set current_entity to next when remove
 from rq
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 brolerliew <brolerliew@gmail.com>
References: <20221025061846.447975-1-brolerliew@gmail.com>
 <CADnq5_NweAo-7snRLkidNkOizu7Ft+7GgXCS2Rnv1oxmRFb_RQ@mail.gmail.com>
 <a70dcda0-6723-38f6-efeb-e8edb16dab55@amd.com>
 <69e672a5-a68e-7bad-fc49-4281c1c6039d@amd.com>
 <9774ddd6-60d9-245c-77ac-59951c13b263@amd.com>
 <ac73b553-9173-4ac5-ef16-a95b8a8cd4f9@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <ac73b553-9173-4ac5-ef16-a95b8a8cd4f9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0071.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::23) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS7PR12MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5d5188-8570-4ed9-202f-08dab7f4aec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K7vv5U56jBknHm59fuif6UIbYAXGgT4Sx59VKfwfa2FSp5rmrt1Luh7lURkODPe1zJHvkQ/OCFIQtnq6BkffbJtMcRoyd0R+wSNuLP7WsCjIjowJHbEOWPe+KcSojkBj/toVowkwWMZHpukcDlfnM1mBalEWz8eV1vuFrW+SN+V+3H/GnkIdxZJ1Xdlm4YtnJ+1qEYohVhp+0JegqQOBfwYKYMDjq8ttH4F9ccQLzZ3plJAcW52WcN/NXMu3qeJnmr9oqWoQ457tHnBOPZIFyZwhVPD+pdfamOpVJObg94AHz4p5/k3/tPuwsa1crPA6ji5mgPJ/3zY4EE/ThNoXKqSy6P+QWPm2+XksvkggN5DwB6OLkG3keFx7bsdtqGoifBBZI1bo+0IAISnuNt0GXdZtJuzebI6pcmeIC6jZGLnXCdTAX04QHlQN6nvTnTDo6z0584eW8A0NJV9p4NgrvJugV3vOTYw0WDa46FbJJzdPKnwoqwcGbLLNWcWP66UlRc7ITVuaYRMd/0utBm3tRhiJPLa7rjcVrZ4Kwt1phRkTG3429LcHnBPEYM1wfcE1AqRmM4eV/XsuvjcDKYHt+hnQ0TXyqC8yKIsBiKaz1n/EjojkQyp3BriWx2AIJ8W/xLk5V07UrL1mCp/u4ghpnyZGyJw1pepWArH8AQxp73vT8sf2LzUlELpt8wxN+YhxS9abz4xG/xajs4HrVzvw7zMoiml6QKyfKPmFDCYZqlSM2IdGNe29hU/ZXBsiE/wbGC/IvJjC0sdPGPUFkSELIm3vrXZ2Ucj5Tmgq0XKY3uU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(451199015)(83380400001)(316002)(110136005)(8936002)(6512007)(31696002)(6506007)(478600001)(38100700002)(6486002)(86362001)(66574015)(36756003)(53546011)(26005)(41300700001)(6666004)(44832011)(5660300002)(31686004)(2906002)(4326008)(8676002)(66946007)(4001150100001)(66556008)(66476007)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTAwRGxvSDRicnh4M3pDMUgxVC95Zm8raitSdGxhd3o3UXhYMldlOEpsd2Vm?=
 =?utf-8?B?UG9uT3EwQkViZmlWMVIwZHltZ0NESkdkWjRQei9NRnUrWXlaOFRKZzNUSHQ0?=
 =?utf-8?B?MVVXU1BiTHFSSGxSYWUzM29IL2ZqbVpDRzAyY0REcWEvL2c3dkdzd0JkMjNO?=
 =?utf-8?B?S090NmsrUzhBbWs4RUFRRDZjajJCb0FhVmk5cU92RUNhSEZyMmpISkpyQXNH?=
 =?utf-8?B?Zkc4TXN1MDNpWndrVG9MOFpJd0I3ZkowVEI5SkNDN1pVYUU4QlhDRXB6NmpT?=
 =?utf-8?B?SkloSzZpTFRJN0l6bktWLzQ4a25ib2h0TVFDWWU0NVE3YlBMRGsyMXZnbDJl?=
 =?utf-8?B?MzNqM0N2NWc1cmd3RlNFOHpUYmYrSDRJOWt6UStndFNHWTUvMUJyQmlLR0Iy?=
 =?utf-8?B?Z0wyY0VYNTFBU1pEeFVhYXU1bTc5RFg3RXIwMUZwTjhvcittTUZKM0p3dnVw?=
 =?utf-8?B?ZzVGU245VGRHVGl2R3NoQk9YZUJrM1krSG0wa1V0Um9NTEVsbG5ncE5wU29W?=
 =?utf-8?B?dmJCdE1RZVVFT3hGVDRmUXFaNjZYM0p5R0FCbHp6ZzZISFIra0hVM0w3b3hQ?=
 =?utf-8?B?bjRPM09aR1U4WmZmQUE4QmxXOS9pNmlQaDRQa0dJMG1qQ2RJeEgrQWxhS29F?=
 =?utf-8?B?dXpHWjlRZjJ3U2VOUUprdDRHTndIT1M5UU1rR25TLzFhaXlKUEVkdGl2blN3?=
 =?utf-8?B?bTI4NWFGUHZMcG00OHZLRW5CbDUrckNnWlptZk5rL3VVS1Y2OGRJNGhranRs?=
 =?utf-8?B?dmpocEhTR29qaTJobS8vZTJtMjY1QkhacmFucjNVbC9VS0l0VFdMdFR5ZzZZ?=
 =?utf-8?B?WERuem1nUys0dU9zT1FacjcrNVYwMHRaTjdRNXJKSWNZZ0h1b1ZwbXNoaXVr?=
 =?utf-8?B?d0FwbUZDQXNvUDJZVjI1MGtML1NLbVlIU05lYXRHbUhRdHVxRUhTK0lEMmhT?=
 =?utf-8?B?S1A1TVNlWDRVei9qRU9MOXA2dzI0VDdrQVl4YzRhdUF6SnVYcW5RdlI2eUN3?=
 =?utf-8?B?bWtNNng5amszQ2Z0dHhoNUMvM1FLZkJPQ2hUY3ZLZkthdHBuUUNrdThja3d6?=
 =?utf-8?B?cmg4TzZuTmZTOG9pejhqMU5nY1k2dFlzcU9rWGdKNHh3UUZqUzlVMGJ5aW1V?=
 =?utf-8?B?OTJrQ3k4NUJ2R084LzJMbHJ5M3JWVDQ4WDgrbFNZU2I5UTNxZG9DWGtzcWp1?=
 =?utf-8?B?Y0MzYUQ2ZS9zNW1vR2VnNTN0bGdma1BNVGgxdlFmOXUxUkF4aUo1bTQyKytp?=
 =?utf-8?B?Z01ZRUZXei9mRlNUbUE2eWRLUzVVSVgrMHlvajRiRFRnRG83cm1jdU9vYjZ6?=
 =?utf-8?B?NGFZREpTejBVWUJOYld5SUtQZlg1Mnh1YWN6bnNzWXNkYzFjS3gxdklrVGRa?=
 =?utf-8?B?ckZXY1pBYklIdEVGai9nYmxwTytsMy9UQUsvVzRXeUdraGNyWmlWSTM5VU5S?=
 =?utf-8?B?K05GaThJYS8ydTNpUDJ3NWhEK0tEK2xTNFVobDdxODhWa29BOWFlYXd1bHNR?=
 =?utf-8?B?WkV1R1RDeC9sRkJTTGF1eG53d3F4Rm9YaHdpZkFiUTdvN1B4ZlBZKzlzZFRt?=
 =?utf-8?B?K0tuR2JSM1kra1hYbU1CYllhQzRzY2RoQXVRYWJwNGsyWDFBakZuZUwxWmJN?=
 =?utf-8?B?ZXdhUHhIR1pQSGhBQ1Q5Q2p0NXR4ZDArU1J6Lzl1azFJN1graVFveXVrbGk5?=
 =?utf-8?B?anhpNWhuRzROamIydG41QjFLSGZnaGxDeHdjSGp5aWE0YTRra3g3ZEw5ZU1z?=
 =?utf-8?B?MWhoSDhMMVRjNkpzaWQ0UWhad1pZZDJxNGk1WmxoSXcvRU5rOFg5K0VnOXNE?=
 =?utf-8?B?dTRDcWFTT2NNMWNkem9tbDZJK3RGb1dSSjZZMlpVN0JiQ052U2dxN2Z6ZVF6?=
 =?utf-8?B?eXNhRFIyRFdjcnlZQXFOdXVzZlVOUmFEZTNkRjE5eHNrQVZaUTdENzd6a0xj?=
 =?utf-8?B?b3BhRDdRcVdORHN5S0hWd0VJN09UbHFhVjhXRFNYclhYS0pYOTBCZlk5V1VI?=
 =?utf-8?B?S2ovSFVxSC9jQVJpeTV3VFgyaE50L05YY2ZZOUV2SDRMdzlLODdWTDUwVEdn?=
 =?utf-8?B?ckx5MW4rc1BJSUh0NjlDWVNsQ2t6UjJ3Z3ZzUHJJeCtCREZKemwyUXhxSzJ5?=
 =?utf-8?Q?yXE3fs1tpeTqrQ0pf0M1fezoz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5d5188-8570-4ed9-202f-08dab7f4aec9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 08:24:36.0072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HYSHjLW+/CI+R2OhyhJdSeOIWfpMKOgonwm6vihpIWGFOTBV7cnOUN5By8OY9IBu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790
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

On 2022-10-27 04:19, Christian König wrote:
> Am 27.10.22 um 10:07 schrieb Luben Tuikov:
>> On 2022-10-27 03:01, Luben Tuikov wrote:
>>> On 2022-10-25 13:50, Luben Tuikov wrote:
>>>> Looking...
>>>>
>>>> Regards,
>>>> Luben
>>>>
>>>> On 2022-10-25 09:35, Alex Deucher wrote:
>>>>> + Luben
>>>>>
>>>>> On Tue, Oct 25, 2022 at 2:55 AM brolerliew <brolerliew@gmail.com> wrote:
>>>>>> When entity move from one rq to another, current_entity will be set to NULL
>>>>>> if it is the moving entity. This make entities close to rq head got
>>>>>> selected more frequently, especially when doing load balance between
>>>>>> multiple drm_gpu_scheduler.
>>>>>>
>>>>>> Make current_entity to next when removing from rq.
>>>>>>
>>>>>> Signed-off-by: brolerliew <brolerliew@gmail.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/scheduler/sched_main.c | 5 +++--
>>>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index 2fab218d7082..00b22cc50f08 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -168,10 +168,11 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>>          spin_lock(&rq->lock);
>>>>>>
>>>>>>          atomic_dec(rq->sched->score);
>>>>>> -       list_del_init(&entity->list);
>>>>>>
>>>>>>          if (rq->current_entity == entity)
>>>>>> -               rq->current_entity = NULL;
>>>>>> +               rq->current_entity = list_next_entry(entity, list);
>>>>>> +
>>>>>> +       list_del_init(&entity->list);
>>>>>>
>>>>>>          if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>>>>                  drm_sched_rq_remove_fifo_locked(entity);
>>>>>> --
>>>>>> 2.34.1
>>>>>>
>>> Looks good. I'll pick it up into some other changes I've in tow, and repost
>>> along with my changes, as they're somewhat related.
>> Actually, the more I look at it, the more I think that we do want to set
>> rq->current_entity to NULL in that function, in order to pick the next best entity
>> (or scheduler for that matter), the next time around. See sched_entity.c,
>> and drm_sched_rq_select_entity() where we start evaluating from the _next_
>> entity.
>>
>> So, it is best to leave it to set it to NULL, for now.
> 
> Apart from that this patch here could cause a crash when the entity is 
> the last one in the list.
> 
> In this case current current_entity would be set to an incorrect upcast 
> of the head of the list.

Absolutely. I saw that, but in rejecting the patch, I didn't feel the need to mention it.

Thanks for looking into this.

Regards,
Luben

