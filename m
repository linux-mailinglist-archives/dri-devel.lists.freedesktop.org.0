Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6193BE874
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 14:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023B86E134;
	Wed,  7 Jul 2021 12:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDC26E134;
 Wed,  7 Jul 2021 12:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mz69820OESyGrC2DJtpanqgypUlMN7JsPsK9AB5UbemA2UHg16LhhT2/AoM8BbMS2cvQLxpdvMhUaB5L2B1UCsUHev6UlsfaL/EbW6vP1QeZE4sHBP27oUbWkvIsBEOkyoxQar42HuM4ocIDep0+mEuBO/3G6+zcH9AF19A3nmf3pMPfqzjLhrcQipFo+s0SHJ0oXSnhb//PiLKOkNkhI8zJUF5dP1X3yRniaTbgpsJ/j5WhU2qZyBxXmgxo9USlblIahZlknNOOMeSu4MLZ/gChETnI6A8Kj8KxAPbznMAZUVIxqtj2uN8XDTG7299kU+5byGUVXpy2M8soVaH//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xxh1O3W6ioTdgD+Ol0Q5lXaIR4DT8nHwq2HgAZFnEUw=;
 b=MG1fSYfAVpUAmnWU64F0AshXjfBshyJDJ5ctb930NGazEXNqUtY6lICK0rUSvV80l3T1RLV7+bX+SfHWDsDdCEXeNJ5Rxzz7B3NZfldzJoTU96Q+2RePMyCkUuhyaDNTPGchziKzbO6mFkNHo97Rn0LDUAjnD0tNZ3qkp6h5DGtgFATjJTiDrQX/u9JGiViFXgU/2tHZP4Mu3UsR2XD3zGu9wJgfU+h3iGdTQ8/4h2nt7OjAR5Tz6XGAfooM8fobSvvY5lVy5crg4vZ7win7lcMWPInpGkTn1N17koulTWd2vxj9ZNu6Iwu5LpW/UtnQGWk+MhSVwi6NHbHTVqLRZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xxh1O3W6ioTdgD+Ol0Q5lXaIR4DT8nHwq2HgAZFnEUw=;
 b=OnTFYayq7/E3Qt4FkNRBm1LcC+ScwfS9GDX4sH0J2aqe5U4vCE3NF4K6MoLkFM6nG8cKLLecc9ysxkV+7JJaQZqblpSR10RltZ/p3UEltwZrqgHBRxl6IYoWN24OlHkjWCU2PsXc9CkHvFeEvioQf1TcDT4Gffh8w7clef6hryY=
Authentication-Results: anholt.net; dkim=none (message not signed)
 header.d=none;anholt.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 12:58:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 12:58:21 +0000
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-2-daniel.vetter@ffwll.ch>
 <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
 <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
 <8387b5f8-a5f6-fc2d-48e6-4bb0768ac642@amd.com>
 <CAKMK7uFu7V0QzsbMGPJPnMjXOB7FrKB_d+oDwkFMVaEvgy5EOQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7933a995-0c95-9339-5385-a24681f6df3a@amd.com>
Date: Wed, 7 Jul 2021 14:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uFu7V0QzsbMGPJPnMjXOB7FrKB_d+oDwkFMVaEvgy5EOQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7671:3328:2129:96b5]
 (2a02:908:1252:fb60:7671:3328:2129:96b5) by
 FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 12:58:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d4cc20c-9336-4e86-9789-08d94146e583
X-MS-TrafficTypeDiagnostic: MN2PR12MB4144:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4144A1200F3C27D011A50CEE831A9@MN2PR12MB4144.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 85czof8XhBiFqRwOoxFCWdAYUDF+E1Q8LB1JOh6Gf9jCgVQD2hZvNspfBzqlafCMvAJyPg8PP7XZguWN0ag8GCGec5r8qkjrfEr/rzMZuSpWA7qKHp+fBN9Ti5ZFZjk+t/OsxKwOQcqyZ3Z5k/sMxTdX+BXmlsbObL26ch5Tvoc7K1V4gkr5UjH3a7Uf58Ysw+vuj7czo2gwCj0nhDsdVsd8r9WGFRG0YNzmc2/ZjacaF4t4qqMuLAEzO8RpkPAbHrYskcbmFN5q0y7mZ7bEjpHdwxoUvKVh24DgGGV9e7AI/hVz638Mk0w3mSziWSMz5Iy3JQG4VBMFWfqGKvQgEAsT5q6yNrLzczJI30PvD2mVYZvf2VY337IZv5+YPFfoMqadeszRV8ljVx4pt3LqG5QDkgjZNpzzvP5qAUU36PPeR4R8OUua3vRoEgNjhItxnpbYYh6OqbV6nakk3xh5r/3MDqVnfjjZbK3nMKPkw8mvaOKdaU4W8m9QFxGbOgDETJXjp4tbcu1OdM3sWOc74DZQpz/RuPYSjxGyqJwls7Xlwpdk9BWRHqd5hoNmaqYZ6NDoEfVIwfLqIxOZURyaxGTFAZJY/4LhRyeXOegKOMgUDeTAuB7vlrkVXTcaGoqL8dMaaV8Il8x1OudkxTKOHfp8quyDdqCYbtHkmHPblfkqDJQMaMiZEdTcycVWr75sLm/7Fb/Rz1fysiA+4qmqETgzqNyLGn4bTOTT3gV6RkLtG/02FBZKsSf1DZUEKpsz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39860400002)(136003)(346002)(478600001)(186003)(7416002)(66946007)(6666004)(31696002)(53546011)(66574015)(31686004)(2906002)(83380400001)(86362001)(36756003)(30864003)(6916009)(66476007)(66556008)(316002)(6486002)(4326008)(38100700002)(5660300002)(8936002)(2616005)(7406005)(54906003)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGhkelB1WUR6a0hydWhEZ01zNmtVRDVsbmJCYzZXR3ZNWnFETGR3OEptRHlk?=
 =?utf-8?B?VWdRRWFUNE5oMVpGbXBkRVVsQ1J2ckRqekp2MDNqVzY0b0pvMzU5VWxHdnpQ?=
 =?utf-8?B?L0VkNDlUaG5KTU5GZ0RXWk1CbFdVbWpsOVJLYTBXWGFNbDkxWCtmcDlwY25r?=
 =?utf-8?B?eC8yWmdaOGxEMXcycWJPUTNIaDluSVNZdk5UYk5DcXZQcitCaTA4UWxUYWhW?=
 =?utf-8?B?RUFMRTZjOUlRZVQ3eDRZMkFsS3lucFJkSjI5K1JzbHovZ0drYTZKSVkvZWc3?=
 =?utf-8?B?RUVsWEpoemdiY1JnQS9BREFJOWtDV0NuV2V5M2k2N1lpbEoxS1dUTkhwelFI?=
 =?utf-8?B?NW9mdm1tYWk2aldnSHJOWVNSK1UwazVOSzRwUk5UMHhkdEVPdE5wK3BoSW8z?=
 =?utf-8?B?V2hoZUI3eDFzekp3UXhZeUZIUmZvbVBiamN2dE82UldqT1FvL2NmNzhpbDEz?=
 =?utf-8?B?bGxLL01aNldybklMRTVwcHVsTzcrc2JvMXV0TzR6akU4UDVZWTJqWW0vcTda?=
 =?utf-8?B?U29WQVNFYWI1Sk1IcGtNcTRvVkVkcEtGL0VNM1Y2b0pYYk5LaThqQTg5YjI5?=
 =?utf-8?B?U3JYNE11VWFiSnNmWVBONS9rK1pMWmN2OS9OK2N4TS9naGFrUi81anNOdDEz?=
 =?utf-8?B?UjVMU3dFVUFPMU9GRFNlNGhoVEdsbmVTdFhuN3crNGdWcFF3dGFnK1VxWHhB?=
 =?utf-8?B?RnVVVmUvbllLc09Fd2ppNVdjQ2NaVWNWQzFsSW4vQ2RFYkVQckM5MXVzZld1?=
 =?utf-8?B?UURJQ3U3Sm1paTc1bUNCaFpiZndBYm9UMHhPYURhWk5yUHZwSGRkUGFoZmZq?=
 =?utf-8?B?OWtZOFZrdWFEb2NUdFoxcUpOdzZ2eVJRNmwreUpQaWZwcjl1dXhWNEdKZWZL?=
 =?utf-8?B?U0xIVE9WY3hrSnQ3Tm1tNmE2bnFvbGRyZTYxY3RyaFplZVd4cWFsOGF0MTgy?=
 =?utf-8?B?aDliMjg5Z0NTbVhyNnVleUlqdm1uNTdJYjYrQUR6ck5PT1JlVnVZQ2l3MWlj?=
 =?utf-8?B?YUNCa2x3dDhodG42dnVQZXNncTJENzlNNzgydFRLYzQ3TGFoQUNnK256VWt1?=
 =?utf-8?B?amczU3ZjbnZ6UzJQdm1OU1lRTVhmU01RZWFWZjE4ZVI0Q3pVMEhwV1RYdTVo?=
 =?utf-8?B?TmdWRmRHK3J5bWxtank1WnEzQU12OG45K2lIcmMwSUtVdlB4VXlLaWJMSGhu?=
 =?utf-8?B?SGhZcFNvcG1ESGpLMGhkeWtqZmcwSWh4QVdFeVkyZk1BZVZVWnp5dHhqSDhU?=
 =?utf-8?B?ZmRLM2FhejVGQndvTGxYRmdSb3J5bUx5VVVCYUU0c3RFMHNDSzVsUzNwVDcy?=
 =?utf-8?B?b1dTNFliOS85MFB2cWR5bisrbklJZHQvdjNiZ0loSjFjeEMvRjVwZjMrWkY4?=
 =?utf-8?B?MndWd1YvSFVlei9lNHNqQ3NlVUtzbG9wL0F1aFRPekF2OTVLMFZzUXV1OERp?=
 =?utf-8?B?Qi9TYXdWWHJlN0wxalFIVHVtRG5JZVBjTEgrZnFNV1dYajF5a0pJZUQwZFg0?=
 =?utf-8?B?TytQY1dyaktUaTNEdGljN0FKZ0locGE4WDVCd1E4RUozeVRkNDdyc2NUbjhY?=
 =?utf-8?B?cW5FQ3d6cXJoa00zL0FMdktCclhrdms2ZzR1bjhQNElWbXVrUHhibGRzZVJP?=
 =?utf-8?B?Y0tyamJueEpoRFM4WUhVM21QTjRqYmNTYkVaWWkrQVIyNnJNWlA4N1FKNDFq?=
 =?utf-8?B?T3dKMjJpbDdrRlVvY2R2QmE4RE53cENmNTY5ckhFN1ZjcWlNdFZIQVV2M25E?=
 =?utf-8?B?VzBTU2lTTnp3bXhtbjM0MmhkNmhHYWhrY3JvOElUUGtxZE93aE5kMjVpZTNH?=
 =?utf-8?B?Y2FmMTEyakdWTGpPR2N0bUVYczJoaHRvV2NvQ1BESm9tZFhlblQzWlQvZnBo?=
 =?utf-8?Q?IPf1e3/K1m3W+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d4cc20c-9336-4e86-9789-08d94146e583
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 12:58:21.0024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jxTvB95Z6y/gefIoQzWyP0TN5aXn4uRV91suDVRGEd7i2g/Ap2RngL0Ra0d2HQy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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
Cc: Emma Anholt <emma@anholt.net>, Adam Borowski <kilobyte@angband.pl>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nick Terrell <terrelln@fb.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.07.21 um 14:13 schrieb Daniel Vetter:
> On Wed, Jul 7, 2021 at 1:57 PM Christian König <christian.koenig@amd.com> wrote:
>> Am 07.07.21 um 13:14 schrieb Daniel Vetter:
>>> On Wed, Jul 7, 2021 at 11:30 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 02.07.21 um 23:38 schrieb Daniel Vetter:
>>>>> This is a very confusingly named function, because not just does it
>>>>> init an object, it arms it and provides a point of no return for
>>>>> pushing a job into the scheduler. It would be nice if that's a bit
>>>>> clearer in the interface.
>>>>>
>>>>> But the real reason is that I want to push the dependency tracking
>>>>> helpers into the scheduler code, and that means drm_sched_job_init
>>>>> must be called a lot earlier, without arming the job.
>>>>>
>>>>> v2:
>>>>> - don't change .gitignore (Steven)
>>>>> - don't forget v3d (Emma)
>>>>>
>>>>> v3: Emma noticed that I leak the memory allocated in
>>>>> drm_sched_job_init if we bail out before the point of no return in
>>>>> subsequent driver patches. To be able to fix this change
>>>>> drm_sched_job_cleanup() so it can handle being called both before and
>>>>> after drm_sched_job_arm().
>>>> Thinking more about this, I'm not sure if this really works.
>>>>
>>>> See drm_sched_job_init() was also calling drm_sched_entity_select_rq()
>>>> to update the entity->rq association.
>>>>
>>>> And that can only be done later on when we arm the fence as well.
>>> Hm yeah, but that's a bug in the existing code I think: We already
>>> fail to clean up if we fail to allocate the fences. So I think the
>>> right thing to do here is to split the checks into job_init, and do
>>> the actual arming/rq selection in job_arm? I'm not entirely sure
>>> what's all going on there, the first check looks a bit like trying to
>>> schedule before the entity is set up, which is a driver bug and should
>>> have a WARN_ON?
>> No you misunderstood me, the problem is something else.
>>
>> You asked previously why the call to drm_sched_job_init() was so late in
>> the CS.
>>
>> The reason for this was not alone the scheduler fence init, but also the
>> call to drm_sched_entity_select_rq().
> Ah ok, I think I can fix that. Needs a prep patch to first make
> drm_sched_entity_select infallible, then should be easy to do.
>
>>> The 2nd check around last_scheduled I have honeslty no idea what it's
>>> even trying to do.
>> You mean that here?
>>
>>           fence = READ_ONCE(entity->last_scheduled);
>>           if (fence && !dma_fence_is_signaled(fence))
>>                   return;
>>
>> This makes sure that load balancing is not moving the entity to a
>> different scheduler while there are still jobs running from this entity
>> on the hardware,
> Yeah after a nap that idea crossed my mind too. But now I have locking
> questions, afaiui the scheduler thread updates this, without taking
> any locks - entity dequeuing is lockless. And here we read the fence
> and then seem to yolo check whether it's signalled? What's preventing
> a use-after-free here? There's no rcu or anything going on here at
> all, and it's outside of the spinlock section, which starts a bit
> further down.

The last_scheduled fence of an entity can only change when there are 
jobs on the entities queued, and we have just ruled that out in the 
check before.

Christian.


> -Daniel
>
>> Regards
>> Christian.
>>
>>> -Daniel
>>>
>>>> Christian.
>>>>
>>>>> Also improve the kerneldoc for this.
>>>>>
>>>>> Acked-by: Steven Price <steven.price@arm.com> (v2)
>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>>>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>>>> Cc: Qiang Yu <yuq825@gmail.com>
>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>>>> Cc: David Airlie <airlied@linux.ie>
>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>>>> Cc: Kees Cook <keescook@chromium.org>
>>>>> Cc: Adam Borowski <kilobyte@angband.pl>
>>>>> Cc: Nick Terrell <terrelln@fb.com>
>>>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
>>>>> Cc: Sami Tolvanen <samitolvanen@google.com>
>>>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>>>> Cc: Lee Jones <lee.jones@linaro.org>
>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>>>> Cc: Chen Li <chenli@uniontech.com>
>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>> Cc: "Marek Olšák" <marek.olsak@amd.com>
>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>>>> Cc: etnaviv@lists.freedesktop.org
>>>>> Cc: lima@lists.freedesktop.org
>>>>> Cc: linux-media@vger.kernel.org
>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>> Cc: Emma Anholt <emma@anholt.net>
>>>>> ---
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>>>>>     drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>>>>>     drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>>>>>     drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>>>>>     drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
>>>>>     drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++----
>>>>>     drivers/gpu/drm/scheduler/sched_main.c   | 46 +++++++++++++++++++++---
>>>>>     drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
>>>>>     include/drm/gpu_scheduler.h              |  7 +++-
>>>>>     10 files changed, 74 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>> index c5386d13eb4a..a4ec092af9a7 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>>>         if (r)
>>>>>                 goto error_unlock;
>>>>>
>>>>> +     drm_sched_job_arm(&job->base);
>>>>> +
>>>>>         /* No memory allocation is allowed while holding the notifier lock.
>>>>>          * The lock is held until amdgpu_cs_submit is finished and fence is
>>>>>          * added to BOs.
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> index d33e6d97cc89..5ddb955d2315 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>>>>>         if (r)
>>>>>                 return r;
>>>>>
>>>>> +     drm_sched_job_arm(&job->base);
>>>>> +
>>>>>         *f = dma_fence_get(&job->base.s_fence->finished);
>>>>>         amdgpu_job_free_resources(job);
>>>>>         drm_sched_entity_push_job(&job->base, entity);
>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> index feb6da1b6ceb..05f412204118 100644
>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>>>>>         if (ret)
>>>>>                 goto out_unlock;
>>>>>
>>>>> +     drm_sched_job_arm(&submit->sched_job);
>>>>> +
>>>>>         submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>>>>>         submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>>>>>                                                 submit->out_fence, 0,
>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>>> index dba8329937a3..38f755580507 100644
>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>>>                 return err;
>>>>>         }
>>>>>
>>>>> +     drm_sched_job_arm(&task->base);
>>>>> +
>>>>>         task->num_bos = num_bos;
>>>>>         task->vm = lima_vm_get(vm);
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> index 71a72fb50e6b..2992dc85325f 100644
>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
>>>>>                 goto unlock;
>>>>>         }
>>>>>
>>>>> +     drm_sched_job_arm(&job->base);
>>>>> +
>>>>>         job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>
>>>>>         ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> index 79554aa4dbb1..f7347c284886 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>>      * @sched_job: job to submit
>>>>>      * @entity: scheduler entity
>>>>>      *
>>>>> - * Note: To guarantee that the order of insertion to queue matches
>>>>> - * the job's fence sequence number this function should be
>>>>> - * called with drm_sched_job_init under common lock.
>>>>> + * Note: To guarantee that the order of insertion to queue matches the job's
>>>>> + * fence sequence number this function should be called with drm_sched_job_arm()
>>>>> + * under common lock.
>>>>>      *
>>>>>      * Returns 0 for success, negative error code otherwise.
>>>>>      */
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> index 69de2c76731f..c451ee9a30d7 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>>>>>      *
>>>>>      * Free up the fence memory after the RCU grace period.
>>>>>      */
>>>>> -static void drm_sched_fence_free(struct rcu_head *rcu)
>>>>> +void drm_sched_fence_free(struct rcu_head *rcu)
>>>>>     {
>>>>>         struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>>>>>         struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>>>     }
>>>>>     EXPORT_SYMBOL(to_drm_sched_fence);
>>>>>
>>>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>> -                                            void *owner)
>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>>> +                                           void *owner)
>>>>>     {
>>>>>         struct drm_sched_fence *fence = NULL;
>>>>> -     unsigned seq;
>>>>>
>>>>>         fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>>>>>         if (fence == NULL)
>>>>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>>         fence->sched = entity->rq->sched;
>>>>>         spin_lock_init(&fence->lock);
>>>>>
>>>>> +     return fence;
>>>>> +}
>>>>> +
>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>> +                       struct drm_sched_entity *entity)
>>>>> +{
>>>>> +     unsigned seq;
>>>>> +
>>>>>         seq = atomic_inc_return(&entity->fence_seq);
>>>>>         dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>>>                        &fence->lock, entity->fence_context, seq);
>>>>>         dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>>>                        &fence->lock, entity->fence_context + 1, seq);
>>>>> -
>>>>> -     return fence;
>>>>>     }
>>>>>
>>>>>     module_init(drm_sched_fence_slab_init);
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index 33c414d55fab..5e84e1500c32 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -48,9 +48,11 @@
>>>>>     #include <linux/wait.h>
>>>>>     #include <linux/sched.h>
>>>>>     #include <linux/completion.h>
>>>>> +#include <linux/dma-resv.h>
>>>>>     #include <uapi/linux/sched/types.h>
>>>>>
>>>>>     #include <drm/drm_print.h>
>>>>> +#include <drm/drm_gem.h>
>>>>>     #include <drm/gpu_scheduler.h>
>>>>>     #include <drm/spsc_queue.h>
>>>>>
>>>>> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>
>>>>>     /**
>>>>>      * drm_sched_job_init - init a scheduler job
>>>>> - *
>>>>>      * @job: scheduler job to init
>>>>>      * @entity: scheduler entity to use
>>>>>      * @owner: job owner for debugging
>>>>> @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>      * Refer to drm_sched_entity_push_job() documentation
>>>>>      * for locking considerations.
>>>>>      *
>>>>> + * Drivers must make sure drm_sched_job_cleanup() if this function returns
>>>>> + * successfully, even when @job is aborted before drm_sched_job_arm() is called.
>>>>> + *
>>>>>      * Returns 0 for success, negative error code otherwise.
>>>>>      */
>>>>>     int drm_sched_job_init(struct drm_sched_job *job,
>>>>> @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>         job->sched = sched;
>>>>>         job->entity = entity;
>>>>>         job->s_priority = entity->rq - sched->sched_rq;
>>>>> -     job->s_fence = drm_sched_fence_create(entity, owner);
>>>>> +     job->s_fence = drm_sched_fence_alloc(entity, owner);
>>>>>         if (!job->s_fence)
>>>>>                 return -ENOMEM;
>>>>>         job->id = atomic64_inc_return(&sched->job_id_count);
>>>>> @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>     EXPORT_SYMBOL(drm_sched_job_init);
>>>>>
>>>>>     /**
>>>>> - * drm_sched_job_cleanup - clean up scheduler job resources
>>>>> + * drm_sched_job_arm - arm a scheduler job for execution
>>>>> + * @job: scheduler job to arm
>>>>> + *
>>>>> + * This arms a scheduler job for execution. Specifically it initializes the
>>>>> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
>>>>> + * or other places that need to track the completion of this job.
>>>>> + *
>>>>> + * Refer to drm_sched_entity_push_job() documentation for locking
>>>>> + * considerations.
>>>>>      *
>>>>> + * This can only be called if drm_sched_job_init() succeeded.
>>>>> + */
>>>>> +void drm_sched_job_arm(struct drm_sched_job *job)
>>>>> +{
>>>>> +     drm_sched_fence_init(job->s_fence, job->entity);
>>>>> +}
>>>>> +EXPORT_SYMBOL(drm_sched_job_arm);
>>>>> +
>>>>> +/**
>>>>> + * drm_sched_job_cleanup - clean up scheduler job resources
>>>>>      * @job: scheduler job to clean up
>>>>> + *
>>>>> + * Cleans up the resources allocated with drm_sched_job_init().
>>>>> + *
>>>>> + * Drivers should call this from their error unwind code if @job is aborted
>>>>> + * before drm_sched_job_arm() is called.
>>>>> + *
>>>>> + * After that point of no return @job is committed to be executed by the
>>>>> + * scheduler, and this function should be called from the
>>>>> + * &drm_sched_backend_ops.free_job callback.
>>>>>      */
>>>>>     void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>>>     {
>>>>> -     dma_fence_put(&job->s_fence->finished);
>>>>> +     if (!kref_read(&job->s_fence->finished.refcount)) {
>>>>> +             /* drm_sched_job_arm() has been called */
>>>>> +             dma_fence_put(&job->s_fence->finished);
>>>>> +     } else {
>>>>> +             /* aborted job before committing to run it */
>>>>> +             drm_sched_fence_free(&job->s_fence->finished.rcu);
>>>>> +     }
>>>>> +
>>>>>         job->s_fence = NULL;
>>>>>     }
>>>>>     EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>> index 4eb354226972..5c3a99027ecd 100644
>>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>>>>>         if (ret)
>>>>>                 return ret;
>>>>>
>>>>> +     drm_sched_job_arm(&job->base);
>>>>> +
>>>>>         job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>
>>>>>         /* put by scheduler job completion */
>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>> index 88ae7f331bb1..83afc3aa8e2f 100644
>>>>> --- a/include/drm/gpu_scheduler.h
>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>>>     int drm_sched_job_init(struct drm_sched_job *job,
>>>>>                        struct drm_sched_entity *entity,
>>>>>                        void *owner);
>>>>> +void drm_sched_job_arm(struct drm_sched_job *job);
>>>>>     void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>>>                                     struct drm_gpu_scheduler **sched_list,
>>>>>                                        unsigned int num_sched_list);
>>>>> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>>>                                    enum drm_sched_priority priority);
>>>>>     bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>>>
>>>>> -struct drm_sched_fence *drm_sched_fence_create(
>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(
>>>>>         struct drm_sched_entity *s_entity, void *owner);
>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>> +                       struct drm_sched_entity *entity);
>>>>> +void drm_sched_fence_free(struct rcu_head *rcu);
>>>>> +
>>>>>     void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>>>>     void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>>>>
>

