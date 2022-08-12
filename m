Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FD6590FE3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 13:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA038D04D;
	Fri, 12 Aug 2022 11:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404442BED9;
 Fri, 12 Aug 2022 11:13:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHmmSw2caYY4agOYrrHw+CfGiRQr69S+nzVI/P5PZoLZ7OGREa2nFmWFU/6DYf6IF481e+mC2GMHfC70b9HwbzFF6/gyhVa9lQhWYZsdrahjJ/bq+IjNxL+X3BtD6j+gUbha5gmyTjKGQmdgo+fJcTd+Fr47+DCmzf8B4aqyBJdH2QLSHP75BD+Kq3XaEOI3zIsrKgSr/W44RXVqTQtdNj+3pRJCeSM9EIjp0BGt1LCqgABqYJf86GGWEtlSvSfSYbHumDc0DMOH2DusMVBq/NioggjUaG9RG6T/EcGVJ6gmfifZ7lIug/NZASL19uUg7aIO2Y5v4vWsHMsGxULP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+r1sr3YBpcktqgueix3X0grbtz2BoGsiHxUIc2NeDsI=;
 b=k1ev4D4ck1Ww2hL7taApcMAG+U7zIoyTcQ9dZnH5Jcb7+k5VvtmBuamy8fOy4gZ2WropcbPe0n2Of+HKL9Dpb/OtMg/YxZ4PhhKuW5Lnn2yP/X8agCpIY5xDH/wizWJ6L9lza1tFY95ha4MwkoWfXqEJ1HF7AC6meU2kExCcJRYwu+bFJa1FXCUkySXvCwBJVqUl7h5J3Je3c7D1QRfM6SNu5Tq7uWF9lXk7hBclGPKM27uvGHuwU459l+2LGIuTatyfmetMfVKu75iYRtn9/+EPLIGk6Vh2JNXDi7nRl6+6MzEJ/UggO/T0BU1kmwTJxd5ZY1s1gB93vvE+Onl/MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+r1sr3YBpcktqgueix3X0grbtz2BoGsiHxUIc2NeDsI=;
 b=tijI9ii8MTYw+xwIIy8+aA707BENB87CEcjepo6OGbYsT2dCT6wT6UcXzKbKix87B7Hi4F4ibh/6hmOLVw1aM60I2lCxqxAbrQy5AJK6S3RuREZZuAYXQLKEfFU5i17pqHTKCf6FJyWurcb9demArSl1Kirydaai4XeraeJuGzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1831.namprd12.prod.outlook.com (2603:10b6:903:128::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 12 Aug
 2022 11:13:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Fri, 12 Aug 2022
 11:13:06 +0000
Message-ID: <f750ab62-7deb-21a1-753e-1ee838386265@amd.com>
Date: Fri, 12 Aug 2022 13:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: remove useless condition in
 amdgpu_job_stop_all_jobs_on_sched()
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Andrey Strachuk <strochuk@ispras.ru>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20220719103954.6737-1-strochuk@ispras.ru>
 <fac8ce6e-6f5f-598d-35cc-7bf01ac90f30@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <fac8ce6e-6f5f-598d-35cc-7bf01ac90f30@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0137.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::29) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b641b37-3c03-40cd-7de1-08da7c53a1cd
X-MS-TrafficTypeDiagnostic: CY4PR12MB1831:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h69yE+RjhM0XQdQD1H3Azwom7ij0Uq2NEkHN7Jm6fD15B8jISioY1AgaNrxUsCWOA7q80cbVX1IhjJQ7Owv7CqEk8Yy+T9n9TBQwv6mitpcNcWh+SGQB6tfLna5XUBr6YZS3I9YjkyqtAeXfSm5c2asDa546RCsHzaZp+vWyxIzBZtLnI6W/X38QHeIs7BsW0nCAZK4cope9OPgsDh0VdZi18rTu/gZU7+6KdPV6XqR4Fe7MxA3gpnZTBKIIT+2YsPPt6+x+ASOcpG9ZoWeBG1BJMUpGVcsazVAnHI69l7BZGKJXY4skqsFg9j5dyqn3HCkGTwYU0vaPELEip0ht9eB5hur9rIu3LHQrfWxVbp+X0N7TYPPPVJkiAyFyEejc1IqQ4kHiOZENkoPvD8WzosqTPkXLJQjhDKro/ubCh5NK1Q+gMcRKf5Fj/I82o2OCMDXW34LZAwrkkVIEMHoLmvVvyE36aKxqlbmRpHcstHBIqSkmIx6g2kPfdOQeZR9ApA3ci4gmEaEAYmVycIfD+OEkfftHGL31XRhKUn5lLK/04blFAfCliDUBzeXUMbdD6hQjPtVChOLDuCBX8gR2Rn3HkTFAm+zsp0u+kQOz5Zx3CdWjFN8CPRQHeoI+3OYrtPiCqu83FZZnxwOCfYma7rIG67VvyVI1Q0ViK6Ti49XKrY8nEbm80FlD7AKx0TypM1sNKndXr9pLklOxD/zBdTTzEz7HFKG6SW2nfT/b2kYkBThnqNKeKWlLn0wcqxL3Zf7d4fJQrNTqN1cth5/DrkPnsiC7rTMTtZwVqjhWmgZyDFilV6NZUQnLnQXOk1ekoxGYapzlpBn8KoqNh3OT1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(136003)(376002)(346002)(53546011)(2616005)(186003)(54906003)(41300700001)(6666004)(26005)(110136005)(6512007)(316002)(31696002)(6486002)(86362001)(478600001)(6506007)(6636002)(38100700002)(83380400001)(2906002)(4326008)(8676002)(5660300002)(66946007)(66556008)(66476007)(31686004)(8936002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emFqK0dGamV2cW9KSm9vYXZ4U044R1F3SU5ocmxQRXV6VWFtQUYyTGwxK3Vs?=
 =?utf-8?B?dGJFOHQyNUY5OHRTUlpZVDU3blVESkx0QkxFMy94UW96b21nQkJNR2N1QVVs?=
 =?utf-8?B?eWEyL3pxd3ZFcHJWVmxSRkNYejN2UzlhK2FDbjUzTVM4N3VhQmNzdDNBWTNn?=
 =?utf-8?B?V255Y0hFaWhkcTRHL2w1bnNaamxCVEJtWDFyMmtuTXI3QUt4QXlrcU9LYUdB?=
 =?utf-8?B?eFZJSWo5MFcvajVGUVFaMmllamZWQlo1a2dOOTk2ZXgrK00yMmhPTzcyWnhV?=
 =?utf-8?B?Q0FqbEw5T2JpWld3QUx0dUNURjFIQjVvTGZ4S0wvUnRBNnFlajNwdGdnSzAy?=
 =?utf-8?B?QllMTW5vZTVsZXBvTkZlZEdlRUJTTUFvVkRldi93TlRtUjFRSU96UmhrOVdL?=
 =?utf-8?B?S2VrbU9MR1hBZFhCdXRkOHl4SkpyS1MxMklCL1Y5aHJKbTdUTWNFcFJGVkx2?=
 =?utf-8?B?SCtHanl6QWZQbkJJMlEra1hBREYxbTl2cmI1YndUVUF5bWVVWHcrQlVINDU3?=
 =?utf-8?B?Q01HMVRtWTc3dFlwZ25meGtQK3NqNDNEY2UyaDJKKzhyMVYxbkoyTjVPMXBR?=
 =?utf-8?B?cnFIWHFVS2diQi9LZTlxY1QrQWtSOElSM29GSTFFMTI2L1A4NlJSZHhmRm9Q?=
 =?utf-8?B?ellLTENmakNpcjJlc25jdDRka1F0aURnaDhacnVoV3JWR2N5alNuRkQ5Nlgr?=
 =?utf-8?B?dXRQNlhJcFliemtINkN6aTN2UWZMTFM4eG1kWTFxMW83WEh1M1U0R2hRUC9u?=
 =?utf-8?B?OW1CL0xMd3pja1h4bUF2dnU5eDdsR1VhK3lXeU5tSUhtRDE1RVNJM0VvQ1pp?=
 =?utf-8?B?MU9WNldXbE42NUwxenpmNkRlL0FPMkloQlBwMXNjSEkzWGpYQjNPWXBhWFNm?=
 =?utf-8?B?dXl3UVQ5STJQMzJsd0FzbDlndDdvcHNxTjBYRHd4dGlSN053ak5DUUtlVEdj?=
 =?utf-8?B?dWtXOThwNXlIajRLK2RaV1BXTktOZ05IVHdDVXM2anNVeTc4ZCtFcEJ1V0Y4?=
 =?utf-8?B?NVRtQlVDNWhsS0hHcm4vZ2F0OTFWVmZzakVYcC9qT2pWcG5lcGkrWG53T1Jk?=
 =?utf-8?B?VzRRMUJCZHZLdXJSTTdJSm9mYmFlV1pjKzVwNFE3dUdQZnZZcElZZ2FOVzBM?=
 =?utf-8?B?SDVxa0swZkNvdzFKZDJNQWtOdHVyQVhWR3lmME02eWovOTZsRGIwWVg2M2Ja?=
 =?utf-8?B?RVorZ3VzTnFuLzZzL0p6RlhtK0dORVBSSkY1eWY3cmR6N1c4cUc1OTBzc2c5?=
 =?utf-8?B?Qkt0T0tRd05RanB2eTdHZ1dYQ3dzb0RWWng0RFpsUG5hOXJKeGM0RVJqMU5X?=
 =?utf-8?B?Z3UzbWkzZThXWEQ2U2FaQnNUc0w3VGhoeSsxb1hZRTkzTEZSNzFmS3ZBd0ls?=
 =?utf-8?B?T012aFZOUVJTUUNOTFpHam9WK2dWVWo5cEtVUjNBeXpycmo0Njc1amhYWHgx?=
 =?utf-8?B?eUI3dnVobEpZcHk4MkxFT0JjUVBneHlkVFM4enlHUi9laFNxUlRDbWNnV0Jo?=
 =?utf-8?B?V01uSVQ4dmNXVEw3MnloNEdUM1VUQXRCSUNrcnNoQVl3ekpDUlJPb2VjNlpL?=
 =?utf-8?B?VzBacmhYeFZ5VkFGVWdpdDlydDhUMGNEQktvajFwZDE5QWZjRlRRdGZvUTBr?=
 =?utf-8?B?ZDMrazlrWVR4d2tmaFhkZTUyUDNOcVh4RFUzdTFDc1JXUTk3VEN0aWpGN1Nn?=
 =?utf-8?B?U1ZTcEdQNE52Q1FoU2w4UnpWSlh0R2M0aGJkNVpZUVpuWWdJa2sraHZTL3JS?=
 =?utf-8?B?NVF6bFdrUW44QktSa3ZOU2dYYllxZnFFeTgrbVdvZmZ1UHdmak1mU2NKNjNR?=
 =?utf-8?B?ZVRybWd0aXlpSlJBQldBYXpDcU1tKzFFNTNaK3RRSHpUY3FkS2FqUzJZNzBy?=
 =?utf-8?B?ajZzam00dElsNml6blJDM3R0MjN4V25hUW12Y2JuTzFuYnpBNy82WUdhdDFU?=
 =?utf-8?B?UmNzZDFMcUhNVFp5UE5CZGR4NEdmSytZT2g0M2FDK0JwRUw1c1hwREpEaGhh?=
 =?utf-8?B?MjcvMFNFZFl3L0x1dDJOY2NaMnBkcFhtdFZMNVNxNDFmb2syY0h1MHgzOE1O?=
 =?utf-8?B?UlcwQ3ZGcENkRFZ0b0JFSUpNaEpMbFRZZWNXMlk2Q0Y5VmZoL1Zjb3ZweHA0?=
 =?utf-8?Q?r3MXh23DwGMQ2oPqxceq241YO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b641b37-3c03-40cd-7de1-08da7c53a1cd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 11:13:06.8043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oH2NzpPxptp6o2Kd56++0CPVMyNWHbaTwTJbuNb9ShhCVTE9LTkMmyUJ6udu8KMA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1831
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
Cc: dri-devel@lists.freedesktop.org, ldv-project@linuxtesting.org,
 Jack Zhang <Jack.Zhang1@amd.com>, Guchun Chen <guchun.chen@amd.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Surbhi Kakarya <surbhi.kakarya@amd.com>,
 Melissa Wen <mwen@igalia.com>, amd-gfx@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

@Alex was that one already picked up?

Am 25.07.22 um 18:40 schrieb Andrey Grodzovsky:
> Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>
> Andrey
>
> On 2022-07-19 06:39, Andrey Strachuk wrote:
>> Local variable 'rq' is initialized by an address
>> of field of drm_sched_job, so it does not make
>> sense to compare 'rq' with NULL.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
>> Fixes: 7c6e68c777f1 ("drm/amdgpu: Avoid HW GPU reset for RAS.")
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 4 ----
>>   1 file changed, 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index 67f66f2f1809..600401f2a98f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -285,10 +285,6 @@ void amdgpu_job_stop_all_jobs_on_sched(struct 
>> drm_gpu_scheduler *sched)
>>       /* Signal all jobs not yet scheduled */
>>       for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= 
>> DRM_SCHED_PRIORITY_MIN; i--) {
>>           struct drm_sched_rq *rq = &sched->sched_rq[i];
>> -
>> -        if (!rq)
>> -            continue;
>> -
>>           spin_lock(&rq->lock);
>>           list_for_each_entry(s_entity, &rq->entities, list) {
>>               while ((s_job = 
>> to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {

