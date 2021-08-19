Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2B33F1CA3
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 17:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928226E9A1;
	Thu, 19 Aug 2021 15:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2053.outbound.protection.outlook.com [40.107.96.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECAB6E99D;
 Thu, 19 Aug 2021 15:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjnxf7gCpcthgzGwCHb0lRVs62+AnwToXUwRqmJo6pLVO9gLAF3Zjucwo5UsbGg1uVMGQqHgVM+Mwsm9Cv2U1zL5Dl1UdDOejLdIsIKFJqj2KjQAUU3zRIxmNm5yqsMMbvHZwDeJwI7M91kmWEIM3SslaZch2b7uUVqsNopeN7sxHJn52MwHE3AMnwmL/H/wsJjqmL/GM58ehePOZ0zpCJx1KXuJgHNE0rvXJTcfw0vW7KHBrECoMHHdIInuFhk0zfcc6ROeHO6MRXVZUGUnvG+mQZlCx0SYsl6SGnwzGdsVPaPyyrIM4l4agCVhhhyhEI2TmiAouVyvHhCKN3na7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86mJdmyzYz1ESBguKbukH53inv9q5G7uQ3yRpTScRs4=;
 b=l5bApzAvxZja/aKTP1pADpjoHyXrsPky/VH3bJbVhgjFWujopirgXOefnWkPDzFqnNd1p1ovJ4AFswDZVgNJ47UwSr0GPtQ++pAu0cj0y9Vb4JXROpj8Dm3KumZDM0VkEdEVNWslX1KJd8qdhbqX0NbytsuiZMFxyI83aKamGzwQMU185iu4ZwII2HNk2wpBf98kcGYNfSu+Nt8hlKwuMPaqPBEWMJfgfvJGlKKwKZV1VnCnmM4nZcHBkbVN9O/+/JAaFFOHeTPT0F9XcZs2aG9ID0ZPDjeHMo3efImwX8Hh4hs3kQAy56X/SvXI6fQwm2DyLv9Z2Q/++5qXNI6mMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86mJdmyzYz1ESBguKbukH53inv9q5G7uQ3yRpTScRs4=;
 b=yvdOCo32WiqDnJNvUzZf5FHZeUePblbaEomgetUTIXNISWuiQoh6Lgvvy/E2cKKhK7vgHRv9veKslr2TlITgpZrGe0/oZF7z9Ce7z9DtYvxJMCriOtbaqMtHclBxq1wqBg+Jf6HENTXbEnX+Xsk9iFLH1qloNoOsq67ueUu1lnc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 15:25:12 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 15:25:12 +0000
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
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <c1b7d154-55b0-1efd-4903-0d6730ccabb7@amd.com>
Date: Thu, 19 Aug 2021 11:25:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YR4k0fPfUL5viMRY@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::37) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:10af:9c1:1e34:33b4]
 (2607:fea8:3edf:49b0:10af:9c1:1e34:33b4) by
 YTXPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend
 Transport; Thu, 19 Aug 2021 15:25:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84692039-c81c-48f9-6188-08d96325898c
X-MS-TrafficTypeDiagnostic: SA0PR12MB4400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB440069531C90EC853CAA7330EAC09@SA0PR12MB4400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:175;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fnytxvQC2P131f/BJFfmL2wdvtN7gyvacykTP26duMf/UDrTUERQA14HyqciJ6dzMYt6Nu9ouyFq/Dg0GDPu3N5yoSBAMSIugh27gqR61niCebaHEzPY4V8gB1bcR2te+1/cN+jTJ2xkUDUbjtCFgA7JkSNCxeb+lUwSYH7vJxCaFbSmD5zagdBar4pLL+KMQTNu5YypU94pf5iNgp5oQu9SUpj2HsWQKlQQI9wBOn3lhMxE4B83ZKkJcnfa5l06uznsQqEJhExLybqX3p6KNKxNnMzbHDhwRpng0KUM3gT6x2BriRKNodJw4E+72MOgVe+fqjLepcRsXzbzwuJWbPYlOfYmL1xNvR9riiRYCF39Tgwk+ecWBYcQHk+pWrnpu+j+04KUrSizKxSkox0EojGdWr2MNPXIM+8dA0MqjdFdicBP4LkU61v6X51CxuRq5yFURWoprjPsYwejEzbSypEog7WLWx6J5m9o9/9HYDnKZ6DxUm5XoY79C4Qs4L7bNjoospSUvOonMkcacSg2sffZWV03VsJinVxcHQyBBnvoeGqMpKj2SzCX3C+O4sI6LUUcEzBhl4i6n9+jTmmdwKOc4z0RydF6XxRzO17AHs6SyHZqzvlgNWTiYnQQ4I5a2xaexUow5LMFoce3FoS/9lqxmZ/Av+VC2ZrqM8wjs29hRR1DWbCIlXJSP7C2tvHlHcGqL3Tt+STaFtJQcH6TdZ8jMwP9uPciFSfyBr3YCRKsEf5VX2EeQyf5Uw0+AVvjlEgS7iXtVLtWlnGZIoG2Ab++PnatZDiCeV9xk/1ABBd8Epnxtc1O/ERmnqwefEu/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(39860400002)(346002)(6486002)(316002)(36756003)(8676002)(54906003)(86362001)(186003)(31686004)(38100700002)(5660300002)(31696002)(44832011)(53546011)(4326008)(2906002)(6916009)(478600001)(66556008)(66476007)(2616005)(66946007)(966005)(83380400001)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2YxSjhqQ1FtR1RGRFl0KzFXR3JFdGVHMDBjaitVblJFN3l3QTd6TW8xZUd0?=
 =?utf-8?B?R2EzazAxd2NlMmJ6c0ZSbDBWeHdJYkVpUXJ2b3Zza1BHSWFCNU45enpzTTZS?=
 =?utf-8?B?NVJSbHNNMS92a2xrV2M1TUZpY0J0NkxsT01DWFlob29FNXM0SVVwTkZKNlQv?=
 =?utf-8?B?N2pHUjVXOGprZmYvcTRZckM5MWl0L2gvb2E0YW1qY01Sd2draW44WDZqaXhR?=
 =?utf-8?B?bXF3bzkyRFdOZmlCV3NpZWZQdXBza1htTmhwN0tHYVA0WFc0WXV5Vi9ZU2Vm?=
 =?utf-8?B?N2grNklVTEloamRGaUhjMm0zay9Jczg0ZnBEWGV0eWVDSWpyczQ2WGVLUXl6?=
 =?utf-8?B?Z1FOTS91RDl0VlQrQ1BmVUR4bStQSlNtRU1YWENvcEtFQXp2TmtyKzJVRHRj?=
 =?utf-8?B?bzAwNFRuQUNSckkyYjBqck90OUtZSjMrTzBjZ3d6Q0tOdUVVMSs4K1V1SkZE?=
 =?utf-8?B?OXZ3UWY4Z1M1OXdYWE0vVmk0MHkzUkVlbkkvZXV5MkhTTjdVNmtkemp2N2V2?=
 =?utf-8?B?dkYxd3NLVVNmNGN0S2VvZm5UUWpVa0lrZ0x3UVNRVWZ6bUJRbWhhVlJ0ZlFT?=
 =?utf-8?B?dWJadjE5Wlg2NTlTV3dPRm9laERwUVFPWENqdWtLNHRiUXF3aFVwYTVSRlVQ?=
 =?utf-8?B?K3RqQ25oVFhvVnR1K09JODlZVTA4Z1Fna29xSG5WRERQK0ZmNEtXeENGZ21L?=
 =?utf-8?B?OHBvUFdpZFVoalplK0FPVFc5NkZmZCtNaFRzY3o5SzhMSEtYZDBBOUFGQ1NT?=
 =?utf-8?B?SVQ2YzFXQzFrcnhSUTNEaWhRdW9ucXRPamVsYUVVMmlqOVdxU0FGdkQ2TVZo?=
 =?utf-8?B?Y1NWaUNiVE10N2NKc056cTJGckxEc1B1aGFWTnE3RXZWT1dJZTk1NVlnNWE4?=
 =?utf-8?B?dW5YU2xvcVlUWm9ZeTU3YkxPb1diMnRuNTBSdkF3TmhTTlI0TXNnMGhFUGQr?=
 =?utf-8?B?TDVMQS9EWEpBWTRhTDhaU0hTN3JNMVc3TEhEVzI3T0kyUWlzVlpMdFdHUnc3?=
 =?utf-8?B?azFHeFpOckUxWnJDUXVlYnVSMDhxWnI2KzlZcHFJemxDYkVYUmdySUhSVDc1?=
 =?utf-8?B?YWlPMDNmaU41U21iMmV2Rk1VWVNYSGtRNmxMT2cvNTNCNzZWMUpSWUIvZTNF?=
 =?utf-8?B?ODY1U0x1RVYxV3ZjemNON2JRZjZGQjFBY2hwVnU2eEFkcUUzWDVaTk16c21p?=
 =?utf-8?B?NHcvLzlSY2RoTXBxcTh5eDhsSXVTd3MrekZjYm85dVAvRERpOXliVVZ6M3h1?=
 =?utf-8?B?YjJtM3JQeERSTEljb2x6RExXYktwRHl5cHZmWXJ6SktrOW1qcElXZjBiVDJM?=
 =?utf-8?B?MUl0S1pEWC9VR0xRcEFEZDN1ZXFWOE5HazNNNS9nOVFvL3FOZXR3b0pEYk5K?=
 =?utf-8?B?eGduRmdZc2hiYW9CL0F6M3RJNTJyMVAxbklTK1RRQ1czUnlYV0RSazFQK3V3?=
 =?utf-8?B?ZHRDc0sydjFydGNibXhBY2dVUzRaSi9JMEpwNnlIZWFiN3dadXhvbkFCQXJX?=
 =?utf-8?B?QTA5Nnp2L3VOdTRBSEtEY2tzWldwa0p2cExuaVc5djgwVE9IclQxU0pORVY0?=
 =?utf-8?B?VmZ0cm45U3J1eGRzbG1NQmNBYk1TdENMaHl4bDd3SW5YclBvRFlqWWpyMVUy?=
 =?utf-8?B?a29wK3BaR0R3ejFMcUMwR2ppNmdiakU3MXdlZFgxd0ZSSlB1VTc5U3FhR1d5?=
 =?utf-8?B?cGxQTEl1SjF1VWdqbGNKUGdSV0UxaVJlaUN1ajRDZXN2L1NOdlBUS3ZtMDRP?=
 =?utf-8?B?K1J2TXFjTEI0MURyT2paUk1Jci9WUlh5VEVFYmM5bGUzVlZSQWsycDMxajVs?=
 =?utf-8?B?Zk9qU2xjOXRDMC9pdEVaNjAwUy9BVGtjdzc4bElZRCs0V1hmd0lKZFpHcmZq?=
 =?utf-8?Q?AeXqTa9xUAKoI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84692039-c81c-48f9-6188-08d96325898c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 15:25:12.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTkqIsH3uSrzMTjGMhR27bYarLeWZXjURmVdKBFgsP5Y3uc2n3PvQly4XcCqpvf2AP8AbgJA6xkn1ORrJ9r6NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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


On 2021-08-19 5:30 a.m., Daniel Vetter wrote:
> On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
>> On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
>>> On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
>>>> On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
>>>>> On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
>>>>>> On 2021-08-18 10:02 a.m., Alex Deucher wrote:
>>>>>>
>>>>>>> + dri-devel
>>>>>>>
>>>>>>> Since scheduler is a shared component, please add dri-devel on all
>>>>>>> scheduler patches.
>>>>>>>
>>>>>>> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>>>>>>>> [Why]
>>>>>>>> for bailing job, this commit will delete it from pending list thus the
>>>>>>>> bailing job will never have a chance to be resubmitted even in advance
>>>>>>>> tdr mode.
>>>>>>>>
>>>>>>>> [How]
>>>>>>>> after embeded hw_fence into amdgpu_job is done, the race condition that
>>>>>>>> this commit tries to work around is completely solved.So revert this
>>>>>>>> commit.
>>>>>>>> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
>>>>>>>> v2:
>>>>>>>> add dma_fence_get/put() around timedout_job to avoid concurrent delete
>>>>>>>> during processing timedout_job
>>>>>>>>
>>>>>>>> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>>>>>>>>      1 file changed, 5 insertions(+), 18 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index a2a953693b45..f9b9b3aefc4a 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>      {
>>>>>>>>             struct drm_gpu_scheduler *sched;
>>>>>>>>             struct drm_sched_job *job;
>>>>>>>> +       struct dma_fence *fence;
>>>>>>>>             enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>>>>>>>>
>>>>>>>>             sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>>>>>> @@ -325,11 +326,10 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>
>>>>>>>>             if (job) {
>>>>>>>>                     /*
>>>>>>>> -                * Remove the bad job so it cannot be freed by concurrent
>>>>>>>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>>>> -                * is parked at which point it's safe.
>>>>>>>> +                * Get job->s_fence->parent here to avoid concurrent delete during
>>>>>>>> +                * processing timedout_job
>>>>>>>>                      */
>>>>>>>> -               list_del_init(&job->list);
>>>>>>>> +               fence = dma_fence_get(job->s_fence->parent);
>>>>>> While this is true for amdgpu, it has no meaning for other drivers for whom
>>>>>> we haven't
>>>>>> done the refactoring of embedding HW fence (parent) into the job structure.
>>>>>> In fact thinking
>>>>>> about it, unless you do the HW fence embedding for all the drivers using the
>>>>>> scheduler you cannot
>>>>>> revert this patch or you will just break them.
>>>>> btw, why did you do that embedding? I do still have my patches with
>>>>> dma_fence annotations floating around, but my idea at least was to fix
>>>>> that issue with a mempool, not with embeddeding. What was the motivation
>>>>> for embedding the wh fence?
>>>>> -Daniel
>>>> The motivation was 2 fold, avoid memory allocation during jobs submissions
>>>> (HW fence allocation) because as Christian explained this leads to deadlock
>>>> with
>>>> mm code during evictions due to memory pressure (Christian can clarify if I
>>>> messed
>>> Yeah that's the exact same thing I've chased with my dma_fence
>>> annotations, but thus far zero to none interested in getting it sorted. I
>>> think it'd be good to have some cross-driver agreement on how this should
>>> be solved before someone just charges ahead ...
>>>
>>>> this explanation). Second is to exactly revert this patch because while it
>>>> solved the issue
>>>> described in the patch it created another with drivers who baildc out early
>>>> during TDR handling
>>>> for various reason and the job would just leak because it was already
>>>> removed form pending list.
>>> Can't we reinsert it before we restart the scheduler thread? It might need
>>> a separate list for that due to the lockless queue tricks. Or am I
>>> thinking about the wrong kind of "we lost the job"?
>>> -Danile
>>
>> If you look at the original patch it would reinsert it even earlier - right
>> after stopping the  SW scheduler thread, and even then it was to late for
>> some drivers as they would decide to return back from their TDR handler even
>> before that. It is solvable but in an ugly way as far as I see, you need to
>> require each driver in his code to put the job back in the list if they do
>> it before reaching the place where scheduler framework does it. Kind of
>> spaghetti code seems to me.
> Hm yeah I didn't realize this all happens before we stop the scheduler
> thread.
>
> Why can't we stop the scheduler thread first, so that there's guaranteed
> no race? I've recently had a lot of discussions with panfrost folks about
> their reset that spawns across engines, and without stopping the scheduler
> thread first before you touch anything it's just plain impossible.


Talked with Christian on that, for each TDR we actually stop all the
schedulers for all the rings and not only the hanged ring since
ASIC reset will impact all the rings anyway. So we cannot allow
other timeout handlers for other rings run in parallel to ours
as they will stop/restart the threads we just stopped and rely
on them being stopped. So it's all done with device wide lock
inside the amdgpu tTDR handler. Only inside the locked
section then we may stop/restart the scheduler threads.
Christian also mentioned that you proposed at some point
to serialize all TDR handling into single threading for all rings - this 
seems
like something that could be used - we then don't need any
locking against TDR handlers from other rings and then we may
stop the scheduler thread as first step


>
> I'm also still not understanding what exactly you guys have done,
> can someone please dig out the the amdgpu patches that motivate all this
> maybe that's clearer? A full explanation would still be good since I've
> only started in scheduler stuff.


https://gitlab.freedesktop.org/agd5f/linux/-/commit/de7515d43659f852590645a688f8d493e4a18141


>
> Another thing I recently pondered for tdr races looking at i915 code is
> whether the tdr should first block the completion fence for that job. My
> motivation is to have a race-free error capture (if the completion races
> then we might start evicting memory and everything goes boom), but maybe
> that helps here too. Some kind of atomic "block this fence from
> completing thing.
>
> Or I'm I completely guessing in the wrong direction?


I think we already do it here - 
https://elixir.bootlin.com/linux/v5.14-rc1/source/drivers/gpu/drm/scheduler/sched_main.c#L410

Andrey


> -Daniel
>
>> Andrey
>>
>>
>>>> Andrey
>>>>
>>>>
>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>>>                     spin_unlock(&sched->job_list_lock);
>>>>>>>>
>>>>>>>>                     status = job->sched->ops->timedout_job(job);
>>>>>>>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>                             job->sched->ops->free_job(job);
>>>>>>>>                             sched->free_guilty = false;
>>>>>>>>                     }
>>>>>>>> +               dma_fence_put(fence);
>>>>>>>>             } else {
>>>>>>>>                     spin_unlock(&sched->job_list_lock);
>>>>>>>>             }
>>>>>>>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>>
>>>>>>>>             kthread_park(sched->thread);
>>>>>>>>
>>>>>>>> -       /*
>>>>>>>> -        * Reinsert back the bad job here - now it's safe as
>>>>>>>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>>>> -        * bad job at this point - we parked (waited for) any in progress
>>>>>>>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>>>> -        * now until the scheduler thread is unparked.
>>>>>>>> -        */
>>>>>>>> -       if (bad && bad->sched == sched)
>>>>>>>> -               /*
>>>>>>>> -                * Add at the head of the queue to reflect it was the earliest
>>>>>>>> -                * job extracted.
>>>>>>>> -                */
>>>>>>>> -               list_add(&bad->list, &sched->pending_list);
>>>>>>>> -
>>>>>>>>             /*
>>>>>>>>              * Iterate the job list from later to  earlier one and either deactive
>>>>>>>>              * their HW callbacks or remove them from pending list if they already
>>>>>>>> --
>>>>>>>> 2.25.1
>>>>>>>>
