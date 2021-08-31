Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BD03FCCF6
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 20:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804B06E03B;
	Tue, 31 Aug 2021 18:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2082.outbound.protection.outlook.com [40.107.94.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEE489FC8;
 Tue, 31 Aug 2021 18:24:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+Y+eEuciNy5o35HqU8aGtVl0OW5iWGZrKznVZmcIwCyDTXAJRXfrWb3oLmFmieaDR/kg0WcETVg2ZfUp3LdMumeI3At6O4dhPN4VGzaDwUcc2MM+UvjXv4ZaQsA2o7StPEmUJR0LNKGlRd7H8I2KhT81X3TmXZWCoxz+pKoAcHtOkKYvrHRj4xn1wKK/HqVQDW0Eswb0pu64clwUjN75Tyf9PwGGNXFKThvqR79nx2AwGDapSF7gADbq/D8x3RRZn1TrsJ3TyH+NVifEzrKnZWLr/clTCv2F1HJcAhY/pKMf0o2BDn4TpuWM87PLNumTBBqHVQRLYgK3t0lV6TNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGU6qThPj+XHHyxJndKJqgLCOnCVwXQlFwqdPUds+UQ=;
 b=OCAcTdtHa03Uw7kYhpUDrgs/3HsXUApixhmNgTXAicfp75xvJqb03UqBcfO9I67/By7aOMoOzedxa5SRrPiSUAY5523XmGwSVAaCdhHsRJ0sddZ2OrklSUB7eoE7R0EBGmXHnLPjMT9qCnLZhDEzqUL2GnAsPeEUoSrbGjnTVBx8ET3sivMJMYpigonmt24FmCMmIbDS7VR8MieyVaNuqI5nosBkHdj1S606VhJQc2spp6yyTidHA34gkRrP2TQdj4vI2F2H1NMPqXxJpk+jZ01toKKmLdpgJBjNkG1zBrSrh41IIk+OK3nds1jXTAZBmKg8SbZkDOw4IP9Cy1c0xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rGU6qThPj+XHHyxJndKJqgLCOnCVwXQlFwqdPUds+UQ=;
 b=oQlIOzt4aby3r2gVqz0yukFNTJ+TDnM4oHf5qk1//EWRLk5e7lyUqnP/0JF60pxs8tSkFxSeqfDVW9kk0XqoGjMJgwKtAcBGoSw3TbeLj/QZsQfW+QPy7z8EsocYti+HDm478Ap6gHiqZlH5Jj05P2a0z3RXnogs794aQO/LK9A=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2349.namprd12.prod.outlook.com (2603:10b6:802:2a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 18:24:55 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::c4ac:2505:5bd8:295d%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 18:24:55 +0000
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Alex Deucher <alexdeucher@gmail.com>, Jingwen Chen <Jingwen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "monk.liu" <monk.liu@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <c1b7d154-55b0-1efd-4903-0d6730ccabb7@amd.com>
 <YSdZDtXcjxE/SPpr@phenom.ffwll.local> <YS4qhxIrcB0Ko3SB@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <2ee688a4-338b-8180-1673-2fc73c7751ba@amd.com>
Date: Tue, 31 Aug 2021 14:24:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YS4qhxIrcB0Ko3SB@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::14) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e]
 (2607:fea8:3edf:49b0:b95:7ef3:48be:2d7e) by
 YTBPR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Tue, 31 Aug 2021 18:24:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ede11ca9-02ef-4d86-b3bc-08d96caca17e
X-MS-TrafficTypeDiagnostic: SN1PR12MB2349:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23495BBFA2A633FB18B0C9FCEACC9@SN1PR12MB2349.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bryk2zQxzbx9yH26cps7TazXF6S4JnipRrADqXs/qJp9uo8+viUBEvzeV2HkpUrQ3/BKadDZXWGUlF9VmhUrJAbtmeNfLCaWS9XfpRB+OYZaoVdz5dLFqv/blCB/+jQjKuPMzL9Gz+pp/KcDVQ3w0HfjXN6Tsu2swsPPlBkdl4HqWidxC0/g9VIjMW4a9cr/BnuNYP6KHFkAIdDuk3ZwEuuutBUiq6gF0hgA1NToPFGjGChu6dKghDE9Z7bmQruoDD+py3jRyGPOFjOLV1jwcU30BFfd/HdOHa7jgwoXeQywVJTSMMkkjNMK6L8GDn7Qd+ZLLotLgyQcZbTbWg2YzMpXDkq917048oqpOhZGJi7+i6esOqX0+PG5+FSUOnYQLOmsqkmuycrrEkExy0zcGj7P6WIZA7SI9X+R2mF5BFUYNPBpueOWFiMIBGdXX9Fxu3IGao+EtYupd4casTHwtPq9aKsD3TRc9Y5rWY+xce8mb22Reb9vyiMicVo67vgyYUngiAwUlTsl2EP6Xp2I7OqIsI1NPFfQ5XMow54e47TgsLRqCwSMmvNHITnQqmibPpUUdac6396Guv4LdVd/jXM1Wwm7TdXg7PGjp7sczT5fSo6a5J5WmxaE57Cxo1LHD65Avcb0V9hHYo7gpZ8p62Q2Usrn6Bj3Va0ldMFOLzz2B/jdXE/xvJqT2Z1kAltXHxuFeYkgsOgt4d+ceLXzSqfRVdixEVP+uWLNcVvTlcm55FW9zi0zs4jsv1q8TGKgraNES4sxkvsULmJAVvojaVzBiuJc+BQn+JEjQ8teCIw0/TdazkjkYER8/oYhCcP/AqYyi/Gm3clPq5Sj29bGTEDTZ67Lt3DgNgFWUDMABCQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(53546011)(66946007)(5660300002)(31696002)(30864003)(2906002)(478600001)(966005)(38100700002)(186003)(36756003)(66556008)(2616005)(86362001)(6916009)(44832011)(316002)(4326008)(6486002)(31686004)(83380400001)(8676002)(54906003)(8936002)(45080400002)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2VLc1NWQ3ozU0tpeWE0UGRvMWRodk5QVVFORk8vSCtmNitkS25DVzJKUlB5?=
 =?utf-8?B?YUNHNGRKL0g1d3dRcG5Idnc4VCsxbkFWU0MzcWMwd015N3ozeTVZMHpXTU8w?=
 =?utf-8?B?eklVZXFZT3VIVmNpaUNxVXh2OUlzYW9JbWZHSmJoai9kTGFKRUliLzVMWHBm?=
 =?utf-8?B?ajBNaHpxRUg4cTRIL2NDM3UwbktUTlBLZ0JCelJrL3lHN3R4Q1VPSGcrcUU4?=
 =?utf-8?B?V2ZzQlYwT0NGR2VwOUZTZkdnZGZpRXNlUlFsYnY3MmVaUXBubUZERTV0WTFu?=
 =?utf-8?B?eUlwcHdreWpUSmc5ZHRsYnBTWERLUHJ1TTVWTVBJN0d2ZTh4RjBlUHlDYkNG?=
 =?utf-8?B?VTNTcU1EQmlkYVBQOHg4WExOQ0s2WEw2VGpDUkZBejdKN2ZKaGxBbGk2TW5p?=
 =?utf-8?B?YVlyQXZRbTAxY2RhUzVSZ0tPbXg1TSt4U1NRUVNTTk9KWlpvbk9qRmRKLzI2?=
 =?utf-8?B?T0VIa2Y2K2x3T3FBZkxUUkQxcnBRdUZxdW9HcHJjdll2NkVBWFJvbzNnOVdN?=
 =?utf-8?B?Nm9YYUpIdnFQY3JmOFdUajhQUUpzaVY1YWR5UlZMczZ3NkJOcFJDK2xtMGlW?=
 =?utf-8?B?Q2x6ZG5sZkxnV1cwUVo2dzU5MnJIcXJpWVU5WWh0VlFwYk9OUElwb3hNYkhu?=
 =?utf-8?B?UklURlFRaEJHMnRGcE9NT3dablpNSXFTSHN2cG9CYk02Nkl1Smx2b0t6TVlU?=
 =?utf-8?B?d25oUFRCdXFZRVd2bmN4aktaeENZeVAyeUQ4NFZkR1I0MDVRaHJDandLa1ZQ?=
 =?utf-8?B?VG5QV2ZWeVBBU2RoOFVEQTV6S2Y5bUszMm1kVC9NV1VrTFJNUE43b0k2Rmk1?=
 =?utf-8?B?a29TU2hwN3JVeFJRTTZQZ3R5V2g2WWhMaENhL2R3d0NlWnpVQmx3WWdDaDha?=
 =?utf-8?B?S1puY0RCK3NFekpSTDFMYVU1Uk5WVjFEZmVzdGp6OS9zbGZNTHFYcGJ1U3U2?=
 =?utf-8?B?Y1VZdmR3aWkxQm9za3Z4eDJSTDVWNVI2SmZQUVcwekt0K3ptNURXNThMelNy?=
 =?utf-8?B?L1JSS1JsTnhCOS9jSVlPSjUyTEN0RVF5SEp1TWNwZ0ZBcVlGU3ZRZk9jbVhH?=
 =?utf-8?B?TzlrMUVYSmUxYkM1cC8veGpIajE5K2V2VnlwUXZ4ZURXSUJHMFdIVm5mWVNV?=
 =?utf-8?B?bkd5bXBkeXBhdG5ZSnlnNDJEVk81bGJqV2pRRGNObEhzL2RRaHFiaG05MjUr?=
 =?utf-8?B?ZWVTanpQRm0xZnVTTHdqc1JBWGhrTFBOQVJrRjlTLzhycllGREh4ZVQrUWZX?=
 =?utf-8?B?a1Eyb3lOVDZmb2I3RGZ0SUNOa1N2UjYwaHppMGE4T1lnR2FJZ0FPU3A2eG5o?=
 =?utf-8?B?TGFiOGNpY0JScXBnTDBwZ2ZDbUtrSGRqOGN1WjlmZGJUaWxscWxkK2tEc3Iz?=
 =?utf-8?B?NVpCTjhYenNLTHJWV09HOWZIYTJLakNRYlVaaitxQUc4cWN5N0NSRk1KbTdL?=
 =?utf-8?B?NitSc1ZnaFE4OXdDNTJpdkJkR1hUeXJ2ZzhxcFFwUHV0cnJiVEpaNlFpdWN5?=
 =?utf-8?B?V3BCbTFOSzhhOHk3MmRWeG1mVnZybGl1VUVOOThBVm1jNStUamdoV1BEbk1v?=
 =?utf-8?B?T2hSUjQ2U00wbVQ0M1pPT29JUzdaU0o0YzIwOGxqd2diTHVmeXg0UjJnd2x3?=
 =?utf-8?B?ajJ2OXZPVG5oS3p5MVdCVmlhRFJoMk1XS3h5NEY0Rk5SZWdxYU9mS2xwTFZ2?=
 =?utf-8?B?ZjNodE9ITFBYb0ZnTlkwclhrWHN1VDJKQjdQcXozbGNHZDFQMzRzZ3htcmxG?=
 =?utf-8?B?UzBCek16NWFDeitmcklxZ2JnclNuclVBZ090VC96SzNPL054NFRNV1FqRFgy?=
 =?utf-8?B?ckMwSTJPbzQ1NW1CTW5QNElqdnpOYlRyYVRzVnNhUVZ4ZTdvamN2V01IbnlW?=
 =?utf-8?Q?sgl4q7kZfyXdS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ede11ca9-02ef-4d86-b3bc-08d96caca17e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 18:24:55.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+zqKuo0UzrNaubb6nNR04k0rCh8Pqv63Rl5A8FmiK21LXDHc453pGpQfwoYh4tXCjhbigiA5lAt+BDIXIn03g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2349
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


On 2021-08-31 9:11 a.m., Daniel Vetter wrote:
> On Thu, Aug 26, 2021 at 11:04:14AM +0200, Daniel Vetter wrote:
>> On Thu, Aug 19, 2021 at 11:25:09AM -0400, Andrey Grodzovsky wrote:
>>> On 2021-08-19 5:30 a.m., Daniel Vetter wrote:
>>>> On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
>>>>> On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
>>>>>> On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
>>>>>>> On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
>>>>>>>> On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
>>>>>>>>> On 2021-08-18 10:02 a.m., Alex Deucher wrote:
>>>>>>>>>
>>>>>>>>>> + dri-devel
>>>>>>>>>>
>>>>>>>>>> Since scheduler is a shared component, please add dri-devel on all
>>>>>>>>>> scheduler patches.
>>>>>>>>>>
>>>>>>>>>> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>>>>>>>>>>> [Why]
>>>>>>>>>>> for bailing job, this commit will delete it from pending list thus the
>>>>>>>>>>> bailing job will never have a chance to be resubmitted even in advance
>>>>>>>>>>> tdr mode.
>>>>>>>>>>>
>>>>>>>>>>> [How]
>>>>>>>>>>> after embeded hw_fence into amdgpu_job is done, the race condition that
>>>>>>>>>>> this commit tries to work around is completely solved.So revert this
>>>>>>>>>>> commit.
>>>>>>>>>>> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
>>>>>>>>>>> v2:
>>>>>>>>>>> add dma_fence_get/put() around timedout_job to avoid concurrent delete
>>>>>>>>>>> during processing timedout_job
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
>>>>>>>>>>> ---
>>>>>>>>>>>       drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>>>>>>>>>>>       1 file changed, 5 insertions(+), 18 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> index a2a953693b45..f9b9b3aefc4a 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>>>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>>>       {
>>>>>>>>>>>              struct drm_gpu_scheduler *sched;
>>>>>>>>>>>              struct drm_sched_job *job;
>>>>>>>>>>> +       struct dma_fence *fence;
>>>>>>>>>>>              enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>>>>>>>>>>>
>>>>>>>>>>>              sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>>>>>>>>> @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>>>
>>>>>>>>>>>              if (job) {
>>>>>>>>>>>                      /*
>>>>>>>>>>> -                * Remove the bad job so it cannot be freed by concurrent
>>>>>>>>>>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>>>>>>> -                * is parked at which point it's safe.
>>>>>>>>>>> +                * Get job->s_fence->parent here to avoid concurrent delete during
>>>>>>>>>>> +                * processing timedout_job
>>>>>>>>>>>                       */
>>>>>>>>>>> -               list_del_init(&job->list);
>>>>>>>>>>> +               fence = dma_fence_get(job->s_fence->parent);
>>>>>>>>> While this is true for amdgpu, it has no meaning for other drivers for whom
>>>>>>>>> we haven't
>>>>>>>>> done the refactoring of embedding HW fence (parent) into the job structure.
>>>>>>>>> In fact thinking
>>>>>>>>> about it, unless you do the HW fence embedding for all the drivers using the
>>>>>>>>> scheduler you cannot
>>>>>>>>> revert this patch or you will just break them.
>>>>>>>> btw, why did you do that embedding? I do still have my patches with
>>>>>>>> dma_fence annotations floating around, but my idea at least was to fix
>>>>>>>> that issue with a mempool, not with embeddeding. What was the motivation
>>>>>>>> for embedding the wh fence?
>>>>>>>> -Daniel
>>>>>>> The motivation was 2 fold, avoid memory allocation during jobs submissions
>>>>>>> (HW fence allocation) because as Christian explained this leads to deadlock
>>>>>>> with
>>>>>>> mm code during evictions due to memory pressure (Christian can clarify if I
>>>>>>> messed
>>>>>> Yeah that's the exact same thing I've chased with my dma_fence
>>>>>> annotations, but thus far zero to none interested in getting it sorted. I
>>>>>> think it'd be good to have some cross-driver agreement on how this should
>>>>>> be solved before someone just charges ahead ...
>>>>>>
>>>>>>> this explanation). Second is to exactly revert this patch because while it
>>>>>>> solved the issue
>>>>>>> described in the patch it created another with drivers who baildc out early
>>>>>>> during TDR handling
>>>>>>> for various reason and the job would just leak because it was already
>>>>>>> removed form pending list.
>>>>>> Can't we reinsert it before we restart the scheduler thread? It might need
>>>>>> a separate list for that due to the lockless queue tricks. Or am I
>>>>>> thinking about the wrong kind of "we lost the job"?
>>>>>> -Danile
>>>>> If you look at the original patch it would reinsert it even earlier - right
>>>>> after stopping the  SW scheduler thread, and even then it was to late for
>>>>> some drivers as they would decide to return back from their TDR handler even
>>>>> before that. It is solvable but in an ugly way as far as I see, you need to
>>>>> require each driver in his code to put the job back in the list if they do
>>>>> it before reaching the place where scheduler framework does it. Kind of
>>>>> spaghetti code seems to me.
>>>> Hm yeah I didn't realize this all happens before we stop the scheduler
>>>> thread.
>>>>
>>>> Why can't we stop the scheduler thread first, so that there's guaranteed
>>>> no race? I've recently had a lot of discussions with panfrost folks about
>>>> their reset that spawns across engines, and without stopping the scheduler
>>>> thread first before you touch anything it's just plain impossible.
>>>
>>> Talked with Christian on that, for each TDR we actually stop all the
>>> schedulers for all the rings and not only the hanged ring since
>>> ASIC reset will impact all the rings anyway. So we cannot allow
>>> other timeout handlers for other rings run in parallel to ours
>>> as they will stop/restart the threads we just stopped and rely
>>> on them being stopped. So it's all done with device wide lock
>>> inside the amdgpu tTDR handler. Only inside the locked
>>> section then we may stop/restart the scheduler threads.
>>> Christian also mentioned that you proposed at some point
>>> to serialize all TDR handling into single threading for all rings - this
>>> seems
>>> like something that could be used - we then don't need any
>>> locking against TDR handlers from other rings and then we may
>>> stop the scheduler thread as first step
>>>
>>>
>>>> I'm also still not understanding what exactly you guys have done,
>>>> can someone please dig out the the amdgpu patches that motivate all this
>>>> maybe that's clearer? A full explanation would still be good since I've
>>>> only started in scheduler stuff.
>>>
>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fagd5f%2Flinux%2F-%2Fcommit%2Fde7515d43659f852590645a688f8d493e4a18141&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C94e4badd78c04cb74ad208d96c80debd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660123033001546%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=itjKBNUdOAyze1%2FOWJtBD7ed%2B8PBbB28QbJEddkc98w%3D&amp;reserved=0
>> Uh, it would have been really good if this was discussed a bit wider
>> beforehand. Now we have rather diverging approaches to this. Also would be
>> really good to resurrect the dma_fence annotations too.
>>
>> Can you guys pls spend a bit of time on this? Shouldn't be to hard to type
>> up rfc conversion patches for the other drivers.
> Ping for this. Currently the hw fence is returned from the ->run_job
> callback, and that's not great design.


What's the problem you see there ?


>
> If we embed it, then I think it should start existing latest from
> drm_sched_job_arm. Maybe not yet initialized, but at least allocated. So
> the right thing to do here is to have the hw fence as a pointer in
> struct drm_sched_job. And check in drm_sched_job_arm() that it's at least
> allocated.


Why we need to allocate the HW fence if it's embedded within a job struct ?


>
> Otherwise we're just diverging across drivers and tempting them to do the
> wrong thing with the current ->run_job callback interface.


Maybe we should switch from embedding in driver level job struct as it's now
to drm_sched_job and just leave the fence initialization to driver 
specific code ?

Andrey


>
> Can you guys look into this?
> -Daniel
>
>>>> Another thing I recently pondered for tdr races looking at i915 code is
>>>> whether the tdr should first block the completion fence for that job. My
>>>> motivation is to have a race-free error capture (if the completion races
>>>> then we might start evicting memory and everything goes boom), but maybe
>>>> that helps here too. Some kind of atomic "block this fence from
>>>> completing thing.
>>>>
>>>> Or I'm I completely guessing in the wrong direction?
>>>
>>> I think we already do it here - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.14-rc1%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fscheduler%2Fsched_main.c%23L410&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C94e4badd78c04cb74ad208d96c80debd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660123033001546%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Maya0Mk1sAliheOv7fCM8bTC7qTOp74Agt1u67kYCJw%3D&amp;reserved=0
>> Ah yes this works becase drm/sched has separate hw fence from the logical
>> job fence.
>> -Daniel
>>
>>> Andrey
>>>
>>>
>>>> -Daniel
>>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>>
>>>>>>>>> Andrey
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>>                      spin_unlock(&sched->job_list_lock);
>>>>>>>>>>>
>>>>>>>>>>>                      status = job->sched->ops->timedout_job(job);
>>>>>>>>>>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>>>                              job->sched->ops->free_job(job);
>>>>>>>>>>>                              sched->free_guilty = false;
>>>>>>>>>>>                      }
>>>>>>>>>>> +               dma_fence_put(fence);
>>>>>>>>>>>              } else {
>>>>>>>>>>>                      spin_unlock(&sched->job_list_lock);
>>>>>>>>>>>              }
>>>>>>>>>>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>>>>>
>>>>>>>>>>>              kthread_park(sched->thread);
>>>>>>>>>>>
>>>>>>>>>>> -       /*
>>>>>>>>>>> -        * Reinsert back the bad job here - now it's safe as
>>>>>>>>>>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>>>>>>> -        * bad job at this point - we parked (waited for) any in progress
>>>>>>>>>>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>>>>>>> -        * now until the scheduler thread is unparked.
>>>>>>>>>>> -        */
>>>>>>>>>>> -       if (bad && bad->sched == sched)
>>>>>>>>>>> -               /*
>>>>>>>>>>> -                * Add at the head of the queue to reflect it was the earliest
>>>>>>>>>>> -                * job extracted.
>>>>>>>>>>> -                */
>>>>>>>>>>> -               list_add(&bad->list, &sched->pending_list);
>>>>>>>>>>> -
>>>>>>>>>>>              /*
>>>>>>>>>>>               * Iterate the job list from later to  earlier one and either deactive
>>>>>>>>>>>               * their HW callbacks or remove them from pending list if they already
>>>>>>>>>>> --
>>>>>>>>>>> 2.25.1
>>>>>>>>>>>
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C94e4badd78c04cb74ad208d96c80debd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660123033001546%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=r7EGQcWGcRinVxmD%2F%2FIFA8WgRpYNnt7feQseD92U6kc%3D&amp;reserved=0
