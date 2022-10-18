Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2593A6035D1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 00:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A3A10F038;
	Tue, 18 Oct 2022 22:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABC210F038;
 Tue, 18 Oct 2022 22:24:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwnA64SwpNC8t5JCtLUyqljkQlYzGW9HiMFgnJcWhqDXMCbA6QlsRVww0hpcK1nEvXpLM9zKEZBr44qQPCP/HyhCGlMeeTMJJeznqjVaRq5D2K4gTxl3eEt5s8iehb8TGQuLFecLMZgJ+E+tOSa2MMm+8zISpA7ICg/y9qmMaV2uONS6WfofVps6wuXm9DcFD0SCvdMb2489nEr64z9ER0YgUEVGLFXdXBL3oAUiY64RInvuBnktwVBPw5MoRrO2Xgj3khKT8HwR4Y62L1jiJz6HArxjZRVMb4V2f2sOCI437u3cMdGe97zCskvmCzIk3Kx2yxjQ/vh6tJsq7xX10A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF5M4iMo2za85S8tP7zUyYBenkJLVQRtDe8TEkrs/+Y=;
 b=GFyiIWIIRTeX+gk0Tl4omuOmISWReEZZA6oycCxCqhdJYn9QBR74SLqFxBo0yOYYpxy6RKxcVXwG727qyAZQS4+FqI4X1jM1suTnwPtXXzTAHUbuxt06f5Ve7SDbeD8vOaaKJKSbs5bHK4pZ5m9Ti9LTRyeMAoEl0gSE/2XYx06pOY/3M6V3RMqHCDSjtrbRCKOYwW7sq+hWIxye8H1bDN0UWVwb6xt02XelrLOeN3l+KIj03eIr5Ihj8zx38PR4hh2ldJVEanLjB5nqrcxn4o/CNEGdNvGB6ypqnI+PUj3YEOBzL38bHnyKyEOxPonmBapsKQcP8mPRrfz8B3Bnjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF5M4iMo2za85S8tP7zUyYBenkJLVQRtDe8TEkrs/+Y=;
 b=F+sLF+b3+0JKj2lqVeC1DJIMto+030khMDud2x6tf5o25krUvT2D7hF+awkXxl+iBuudqD6JXHNEGE0MEHo8YmisO/HyqYjwFApXu8/DlL85fGm+FKhxzDQnccnlFl/uRK55qpOxS1A/aOnej/n4so06AosDgys7mbFE05GwGfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH8PR12MB7206.namprd12.prod.outlook.com (2603:10b6:510:226::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.22; Tue, 18 Oct 2022 22:24:13 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 22:24:13 +0000
Message-ID: <0550486d-6f13-87df-d85d-153a02f0199e@amd.com>
Date: Tue, 18 Oct 2022 18:24:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/2] drm/sched: add DRM_SCHED_FENCE_DONT_PIPELINE flag
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20221014081553.114899-1-christian.koenig@amd.com>
 <c8585fab-6e8d-de4b-eb2a-e8bff6e3fde8@amd.com>
 <CADnq5_P9dZUUg_nwUikEM3T_sswFypk8tJPqayYEVtcNtnS5fA@mail.gmail.com>
Content-Language: en-CA
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <CADnq5_P9dZUUg_nwUikEM3T_sswFypk8tJPqayYEVtcNtnS5fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::31) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH8PR12MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d7ddf4-96fb-457c-84d4-08dab1577c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4U4QstouGJI9W6cVEmODssSobvvB3M+SYusdUjGGZfV0P/NQ7cp8/b3kOlVIUrMfuxi+yJ9nQ8f7tMGREqfWWcwRYuQeZOAZ9B1QQnaUZDvAN7+/ApY5GPmMJgt0L3aG5taOpzfr6GJd+Fs6/MoqLQ2oTvB+FGBdp8wNft0CkjNm9N7PIqKOBOl450dQtlddVN2mx5e0W/f59JNL1eiF7iaW33bk8H3fX7B7E+mz/YItcF+Zm8uFfPnHxHtgkZnyHWlDCn2Ph0Z2UmOgIqhudGxvfU0disGnCC7DZAY6d8OtGxK5wErauzrz32nFfC16YzpWH4Es/3p/afrDqMA0XCaaOhL7yl7tk3QJ4RI216QRHl9T+DMcrBJkZ1cHl2cI6qa3nZb8EHyH7oQiGFS8xsVT2BOEJXRvkmRwzmEDpe+P4YXUlp1tYipDDmP8x8NfqlmmUd0+IUn7blk34f1zBXFYy4hKNpUGF7LRSylIxP6lcFxbDLOX1gf+XcQRh2ZPRdemwm2YRnxJY0BgCa8P6wKiEy+qZDid57khPSYUO68/MHK4zKRtzwZk7idML33X4TFBgtmKPt2Gt7cN5AAhP+fNyiKEksiL22eYH0RiDgz++SV6zeZltOUsBq9Wr1Mm3ur1/dcd0NjLJOpO9MKpFDUsGFYZleahdIehd83zYhn4SuprvcgCMYOF05NUT86H5TW1R2ugF60Y+jx6Bx06ZObQTIdjTKJiErGOVuzAiFxr8x68bWUmIBDodVXMmQJaQgQet3Qfsaxo/4wBg6xJts4TO8Ip/g/ZvE/Jz61pm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199015)(66556008)(5660300002)(44832011)(54906003)(8676002)(31686004)(316002)(6636002)(66476007)(110136005)(478600001)(4326008)(6512007)(53546011)(6506007)(41300700001)(26005)(186003)(4001150100001)(2906002)(2616005)(6486002)(8936002)(36756003)(83380400001)(66574015)(66946007)(38100700002)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVlyZkpQVGtuRGZ0NmQ4VUtPMW5lRTVIUFN5TzBQNmZxcDJ0NWtWTGFOclQv?=
 =?utf-8?B?b1RSYmI5Tmd6SEtVaGZ4d3loaDJUM1pKNit1YkVndmw2RElLNkg1Z3JJMnc2?=
 =?utf-8?B?WkU2cE5zbzJMeXZtc25kcDF2bHhiOS96WFkvNVZVb3o5N1EwcVUyZ2ZkNTNW?=
 =?utf-8?B?UHlOQVJEdGllZlBYNERFK3g1Q05sRDhjRmZFRDhQdC9wcGxVbTdlOWFYakdC?=
 =?utf-8?B?YUQ0VEg2U2JPU3UzZkF3YW90eVJjeEdNbDZOdS9DQkk2elB4VnY4bHVzbVFm?=
 =?utf-8?B?SW5NZjVnTVphcnpnVjEzTzdoVysrTzJvVEFIc0x1WGRLYTBPSFltN0hlSk85?=
 =?utf-8?B?ank4bkxBTnVaZkZvYmgwdlJXTVVEVXVoakJLZURwZThqZWJwK2xwYVpYMTFZ?=
 =?utf-8?B?TkVMcjgwTk9INGZjZFBjMER2S0pMeVZWYkRMb0dKMWNLTUs2cDYxYS91WkZz?=
 =?utf-8?B?WmNFc25OU1RKVjNpVVMxUEtqV2cxSUVHd2R5WDVvbnBacVlNaVZkQnA1OWY0?=
 =?utf-8?B?U3ZRaDhwWU5MeEwwZnlZWmJycXVzVHZpWEd3WDQzMkdNTHpOeHZUV3VVODJD?=
 =?utf-8?B?a0R2OXNEeE00dURYMWMyNXVsNDVqQ2RuT2R6U3lHdWdZbnRzKzVPdEd4TEtL?=
 =?utf-8?B?RElXRUVZaU03d29ubVd2bUl6M2l2SUx4aDlXd1dUZTRaKzV2TWpTNjVmMmdt?=
 =?utf-8?B?R1R5ZkZXeGd2a1hrblNMeCtxR0xOWHhrZnFrWlVxNlZHWEhMbnVRa3pNcDNv?=
 =?utf-8?B?MFJHNXQvOU8vK01rRXF1NFdpOGZIYkRnOG13WUh3TUhiVWsvT2FRMm5QYVdy?=
 =?utf-8?B?Y01MVFU4Ylp1bDMwWTk1a0VXQkRyb3ZEcktldGowWVJwK285Y25LT2FoV2JE?=
 =?utf-8?B?Sk9qUE1JUHVDYlFyVklGM3AzaDRDM1JKcmZFQWpMcVVIWkxxRnNTcmp2RzRm?=
 =?utf-8?B?S0wzUERBcGJTQi9yV3RxdkZrUUJIY2VuMmRsZGZxS1FFYmc0cGxiVnhDWXhz?=
 =?utf-8?B?NEI3MkVpQW85aTFvTlhHODhLTklvODJjUUFZSW5NNVNTNEhNekFMaEFTZzhi?=
 =?utf-8?B?cFZMS2F3WW5RUWZBNGZYOWpzVVJvY1kvSjhwMkZqYnpWZ3lsOXJobTBBTCtB?=
 =?utf-8?B?Q3pPdmI4SUM3TGNrTUYvZmdoTEF5VFZZQlpkYmVmcnMxQTh0ZXZhZnJaNCtt?=
 =?utf-8?B?NEIxUHFHcWE2Sm50SWtLT21DaXVDeWhmRVdJQ1l3NTdWdTJPZFdqVFR1TUMx?=
 =?utf-8?B?b2xtSERoTjVDL2dWZ1M4RG5PeE9EZEw2QkNvT1E4Qkk4aWw1ZGhOY0hodFdk?=
 =?utf-8?B?ekcwYTFwYSswZTJlamhzcDlsYkNQK3hzZ0M5azlCYS9JWkFOcHVUaTdjQXBJ?=
 =?utf-8?B?by81Y3BKSm9qSUJhZzI0VnpnUTh1V2JWSDcyaUdDM0VNSkpPalhRandWcGtp?=
 =?utf-8?B?Y05TVUJoS0krZ1BCdFNJbEZYN1hlSnB5Q0ViTXRROEVuRHRhZkhqUHVSR2NY?=
 =?utf-8?B?WDVKR1BUQVdvcHJyRWpBZ0tlREpSaVFzTld5NXhRNUVoUUxhVHU3WFJJcHN4?=
 =?utf-8?B?SHROMWF5Q0RzdUJIREFrZXlqNytuc3l2dDFxdk1ZajlqTUxERUhkaWZjZXp3?=
 =?utf-8?B?TTcyYloyek1haWh6eUhxVmlFcXFRMHk3U0tSdTUxdGVvNTdiODVGZnhjTE5P?=
 =?utf-8?B?T3VBS1EySzZGeEpCUS9CbGJ4TEl6U1U2dDFIc1FRVTlveVhMUlVWdk1FdDFT?=
 =?utf-8?B?MDdGdTZ4bkRrWUVwdldlZzltT1E0a2IzdnpKVkI5SUpyRkpuZUNWM0gwMUJM?=
 =?utf-8?B?QWRvclRKUURDM0xkaUljdnROckhkc3BhcDVyMXEwZmhKcmxRTHZGdmt5QURS?=
 =?utf-8?B?RmlwTW9GRnMwbkwzaWtqNWgzaG1xcldiekszbTF0djhZdkl3MVQ5U3ljMWFt?=
 =?utf-8?B?cngwYk53UTNleWpKUFpwc3RUdGFYUWFIMHZTQ3Y1NDFPT2VhNVNraE5Kb3lq?=
 =?utf-8?B?QW94emJiSld1VVNBN0hCOWZHMGV6QStXTVAzNXJ1OFJvM0U1WCtYWXpGWldU?=
 =?utf-8?B?VWU1WEFoVGhKVTNzSWh2TEt2M0VwL3Exbk4ybWtuMDNoNjF2YmRWa3ZNelJG?=
 =?utf-8?Q?B2i+3bEkWSklT4sUxFDacE9kQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d7ddf4-96fb-457c-84d4-08dab1577c32
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 22:24:13.2646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aokKyG13frkQrd59BY7Lg1b745jqB/kzmWF5dB6tIsOgSL19DyU9TuCcZWfNUFQ4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7206
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-10-18 11:37, Alex Deucher wrote:
> On Tue, Oct 18, 2022 at 11:11 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> Gentle ping to others to get this reviewed.
>>
>> Alex, this is fixing the TLB flush errors and I think we need to get it
>> into -fixes ASAP.
>>
>> Christian.
>>
>> Am 14.10.22 um 10:15 schrieb Christian König:
>>> Setting this flag on a scheduler fence prevents pipelining of jobs
>>> depending on this fence. In other words we always insert a full CPU
>>> round trip before dependen jobs are pushed to the pipeline.
> 
> typo: dependen -> dependent
> 
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> CC: stable@vger.kernel.org # 5.19+
> 
> Please add a link to the bug as well for both patches.  With those
> fixed, series is:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Hi Christian,

Thanks for fixing this. You can add my,

Acked-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

> 
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
>>>   include/drm/gpu_scheduler.h              | 9 +++++++++
>>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 191c56064f19..43d337d8b153 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -385,7 +385,8 @@ static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
>>>       }
>>>
>>>       s_fence = to_drm_sched_fence(fence);
>>> -     if (s_fence && s_fence->sched == sched) {
>>> +     if (s_fence && s_fence->sched == sched &&
>>> +         !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
>>>
>>>               /*
>>>                * Fence is from the same scheduler, only need to wait for
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 0fca8f38bee4..f01d14b231ed 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -32,6 +32,15 @@
>>>
>>>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>>>
>>> +/**
>>> + * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
>>> + *
>>> + * Setting this flag on a scheduler fence prevents pipelining of jobs depending
>>> + * on this fence. In other words we always insert a full CPU round trip before
>>> + * dependen jobs are pushed to the hw queue.
>>> + */
>>> +#define DRM_SCHED_FENCE_DONT_PIPELINE        DMA_FENCE_FLAG_USER_BITS
>>> +
>>>   struct drm_gem_object;
>>>
>>>   struct drm_gpu_scheduler;
>>
