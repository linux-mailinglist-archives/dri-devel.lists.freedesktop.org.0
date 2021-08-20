Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBD33F2DAB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 16:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349E96EA96;
	Fri, 20 Aug 2021 14:07:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4995B6EA96;
 Fri, 20 Aug 2021 14:07:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBVvcMYXdRTeN3qpxQW/brVH+H9PP1q3zhFNyBU2XCE0ZVdQhqmKzF+9u89hQ8RGOx2SYMNOtVOHd5undU0sqaUNYARUJ0XYtmfyINxNwV3Dp+OhLVUgLjD1UVRPc8wUAVpjPmbkg17O83GIPJppvlNcTA+IEoKtNRRDF48Fne46/sPsXjYPx4hP9NkR85eIj80Hmkc2EXmb2GhxGKfFVU3QmQfzwaHoY/I041PHrJ9mXdsy+v7Oyeocn2+yj8xR/qnEdwHjRZ3Ah0UhEanLv3a/lwLopjy1XKJy4rjFM9YWHwistMzTY+vPItTT7N8JkgPa1cWrKM5wcaIuEP66Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycSA70XPHW+E9gS+cxD8OnScozrMq9JVFg/iJ7YfgS8=;
 b=Pwtv9Qq2wyRU+76rAjo+/HrTJQ54awJ7UKmG9Kaw3KfUnfiSJ1itHqX1pc8oUAyHO1/jKpQ10ZajPCEq6CeRs5LLjbVZvawOFnu6XJuKiJN/Vc9JqnOQSBCS0bnzMATR2MVdvyPyo0eL29+WyHPm32B7gQmoleeRrFGa5DzRtR2/QVmlZioqtzKfRBeFucNVuHV2KCMruMMQwAbgJNCsXp8SxdsdxrxwLZj1wqpmolS7cdPSgEvbjR7ynmpfIsehUppbQi3H5eKQeteIQZwdQOHYqO18gzzKcjo845mVKtE1eubjnQXoXRrq/b8+5p1rtomb8muvn7d+G7X73fRXSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycSA70XPHW+E9gS+cxD8OnScozrMq9JVFg/iJ7YfgS8=;
 b=A/gZTFXqP5hcZwITgmIFrMXiXU3PyqPucGs5+vjRKaMO98lKlf4MCQCcX2ZFAqpkJQ8Eu+J8nmyF03XQpT4aNTHVnYv5v1t5eX2iB/81NrudyhNUwB4M5VOuCkX1xqNZcsYjOOVIu+bjaBO2LbloA/k+k/AKAOrMBE8YWp/9Tug=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2847.namprd12.prod.outlook.com (2603:10b6:805:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 14:07:13 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 14:07:13 +0000
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: "Liu, Monk" <Monk.Liu@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>,
 "Chen, JingWen" <JingWen.Chen2@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
References: <20210818112114.1417685-1-Jingwen.Chen2@amd.com>
 <CADnq5_OApvH1Jo2VzJBHewHB_LXgg1WzUHvTBvrNYnbYdFAWhQ@mail.gmail.com>
 <69cbf5bd-42c2-be55-a604-43f4ebba159d@amd.com>
 <YR0Z7qtEti2hwZ7i@phenom.ffwll.local>
 <b92c62f2-7b1c-d4d8-cb84-1b5ccc3e4bb1@amd.com>
 <YR0cb43Wv8jGiIbb@phenom.ffwll.local>
 <82782ff5-d2a7-a4a8-8526-d1ff231630ed@amd.com>
 <YR4k0fPfUL5viMRY@phenom.ffwll.local>
 <BL1PR12MB52690CB11358D0298AABC8C084C09@BL1PR12MB5269.namprd12.prod.outlook.com>
 <BL1PR12MB526995BE01F10A5F7D8158F184C19@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <89b8132d-f297-a62e-7e50-0bc63c319c1d@amd.com>
Date: Fri, 20 Aug 2021 10:07:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB526995BE01F10A5F7D8158F184C19@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::27) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:2f68:f1b:289e:f643]
 (2607:fea8:3edf:49b0:2f68:f1b:289e:f643) by
 YT3PR01CA0091.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 14:07:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec24599a-5d01-4df6-6cce-08d963e3cef4
X-MS-TrafficTypeDiagnostic: SN6PR12MB2847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB28473607A3D2B396EB680674EAC19@SN6PR12MB2847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:374;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TyC6FNtK5mZ5S2F7lK5FxUz1Y+BE9/0k77Rz+PUweIRTFiHetqSrctQp6biAmJVRqD+CMrDaF/os+lRutTVQkx38S9Z4EEYlLzq8uq+6K9NuCmt4MwZhdxLcs6WKqAoTcn6mkRIJP+5tEWa6KxPvKaAowFkx3LjIrpwpUhYs4pB24RFAFkycoQMIFa6Mp5oLrWqs2g54hO5Ir/8TBvGGM6EVrher6JyBS9znN9EjJwN4pSHOCETrH0xB6gVVECzMf1tLtZkclZ1p6wMsaxKFybgXQ4W4GtKaUMmdUqOheNczkQK1xVQ+hjDn+EI5SVzO4TElWYMVqFabrsRcmZKUqkg8Uu61Jkz5cYDJiAH2RFsBpucMvyWu2u7bZIoLV3Wy8p9dcJMatYjwz5a0EiS7yeO5L/VJIrToRecEp0El6m6FqEFJERzgwmqktEjBX7cF+tXpT7VrX3dd9Jahu2DtN4e+J7/v+Q+HXB3dMJRsIyOYW1wIokcuMbamhmCwiMrnKe23echBmKImX+zJQ52hUYZwMx5798myVIpzzToyvNAv8HI12B/+4rMDveGpZNtpuwx1a9rqNFethBvsINHgsrx0232FJNAx6RTjnUEpxtbZOVQmju3hYY9VOsf37oABwD2KEPVjLH8jUoBzJMctrSRD3Ll7GtIIt2Ly/RitNly0d9S386nmgiszKNKO+HWJgomP/ywZZBt+Wpy5EAu+1DeWjmtSgHn185pj0eKa+bSUD8wcAUlVwFvtg/xZalMqDxx6ysZRTF7UoIYqsKJLlmytF3xvR+gDotr4eJ6PCs2YIzGRuGl4KWcDbcqgVdv1s9jFIc8ULrKNfJsClN0B8PMHz0/yTpMF0ay/SSz/Tmg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(5660300002)(8936002)(66946007)(86362001)(8676002)(6636002)(53546011)(66476007)(66556008)(31696002)(6486002)(186003)(4326008)(36756003)(45080400002)(83380400001)(966005)(478600001)(316002)(2616005)(31686004)(110136005)(2906002)(44832011)(54906003)(30864003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDd1UElzd0ttY3NPY3YxaFpqekpFR2Eyb0ZIUXlEZ0traWhhMXIxVmF3b1hp?=
 =?utf-8?B?WFZnMWRjemt5OXA3dzcwaFErZXE4Mmh4L2ZqMzFXM3ZvZ2xWUHZ6OXlTZlNa?=
 =?utf-8?B?eGtPOWJMRVRQZHVPZG1XSkVNN0tKMkpuODBDeDl3VFAvMCszM2tWK3cvWHVX?=
 =?utf-8?B?MS9Qd1MxcWdLQ3BocHZNbnBJNDNkcWptVXhZQUZJK05JbGQ5UHo3OHpORURa?=
 =?utf-8?B?SGMwWmlFcWMyQk5oaVA5LzgzMmFrYmFTUkNZNmdlOW43SkpINXVhdE9KS2xF?=
 =?utf-8?B?aEhhdWpUWGJEbXR2RVp3dFdXdUduQVNPdDVkem9MK2pRc2FJck9GNjZxSWl4?=
 =?utf-8?B?WjRteTk2Yk02ejZDSnZiUzZFdWNRa2tNRFRFYWN6MUQ1QllyL3ZLMXhSUkcw?=
 =?utf-8?B?Um8wMUNHZmFXT3NmRElFanVnRHZHODYvZ1FreGhiUnlKbm9RU3greWlzY0F4?=
 =?utf-8?B?dTB0M0Z4U3MxalM0OHBzcGFEWDhIT3NCRE9NZC9ZNnI2WlI0WlhFSEZzaFRt?=
 =?utf-8?B?UCtWTXNVRDU2UjVpRkZ2QkVlRlhabHh6SkZjODhReU12OG9KVHIvWGIwQ2ZE?=
 =?utf-8?B?Y1ZLQmJ1Y1Q4Q3FFbjk5N2xqek9LMTdRK1Rmby9Cdk8weTFXVkFHTnZ0aStK?=
 =?utf-8?B?ZmQzU0Jsb2FERGYwWEhhZi9uTnZKaUE4TWUySTYwWURLdkhiQ2JXWVR6a0RJ?=
 =?utf-8?B?SGFmMnRSTUp3eTUrdFg4azdydDNTZ3NBSWJjZlFuRVcyTUhrVU04dmNmNjJW?=
 =?utf-8?B?NEZQaFNRa3ROMUdNNmw3ekdOUmFOenFSOVVyY0RIdkJNbEwvODJCbkZHdU5R?=
 =?utf-8?B?bElScDdjNytrSHhnakxLOGRHM1psRVBXSDE3bUI5NnJJMEJtZVFGZVl3aE1l?=
 =?utf-8?B?cjNJV1lPZm14aXF6d2QyczBMaFYwRDhPNEV5WE1ub1lRall6blNzTkRrR0pa?=
 =?utf-8?B?T3pCVFQwZXpEWlZBVXpWQlJWWjVqT0JXM29xRVVJNE9pcVRnbmRPblJEOXZN?=
 =?utf-8?B?YWxxeHhZeU1KRVd1ZFRkNGZscUowVW5xdXVTL0NFampXYjh0OW1wUUdwd3U5?=
 =?utf-8?B?dC9LUkZib3IyVDJsclc0ajEvMGZTKzlrdG9IZ1MyQXpjb3h3aUVNMlFXTk5x?=
 =?utf-8?B?TWphMHR0NVo0enRyaGlpUy9aNGorcEU4K1E0UExXSDlvNk1UTFFMMSt3ckRw?=
 =?utf-8?B?SEozcFJWeUszUklwSnUrSVVkWjBCQmMvZVhBOEkrMVBuaWNYVUEyZ2plVWZH?=
 =?utf-8?B?M3RRUmtPeXFPdHM0WUhkSXd2SjlkeUV6V0VCTllzYjJsblRTMWcrSW1SZ1A4?=
 =?utf-8?B?NmxaMmxjQlF4REVjdHpQTTc4T0U3cE9BTWEvTUlQOFdxUGZ4Qm4rVUhhR2Vw?=
 =?utf-8?B?eGJva01XTFZ2WGxLdC93ZWhjSC9ZOG9TYzNmUHRiWkNQSFBOZFJYeC9iZUlI?=
 =?utf-8?B?QTRpYndwc0F4MHgreEV2NGFNL09KdEtLZEErR3RZZWJVVzlvSWVkQ2wyZy85?=
 =?utf-8?B?WUdISFoyY3RrMUxXaFF6K0lSemsxaVNUOUJLRVpJd1lOdEJOVnJtNGc1SkJi?=
 =?utf-8?B?azk1NEtBd2Q4bWZUSTFXcnZENElpenh4ZnplYndhNjQySzdvTm56NWlhc0xD?=
 =?utf-8?B?NUY3SE9PVDhIRkVycnRvUlIxT1V3UytMVFI2Tzh3QlpvNy8yTUl4SzFtK2sr?=
 =?utf-8?B?SGtyb1BjZG9Wc0lKa0VHYlBydUFsQ0hyTWhPMFQreG1qWFIwQm5UZjNvajJt?=
 =?utf-8?B?SmJUT1gxSDRTMkRqNHNXdFhaaU4zcXhmMVpUSUpSZ2lndzdab3p6ejQ0NFFI?=
 =?utf-8?B?bmNxWmd2SEpJdmhjS2JVME5Ma2UxYW5nVFArZWRsTmZiWHoxRHZCRERHL0Rp?=
 =?utf-8?Q?q4cIJSGbAGLJw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec24599a-5d01-4df6-6cce-08d963e3cef4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 14:07:13.2056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2795st8SUS8C1UykDRhUR4wJt0yMATkF0BgH+uKWT/LCF72WiYxPnZutOlGdcKqxPTvRRNVrGodW0+mxX7mhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2847
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


On 2021-08-20 3:12 a.m., Liu, Monk wrote:
> [AMD Official Use Only]
>
> @Daniel Vetter @Grodzovsky, Andrey @Koenig, Christian
>   
> Do you have any concern on the kthread_park() approach ?
>
> Theoretically speaking sched_main shall run there exclusively with job_timeout since they both touches jobs, and stop scheduler during job_timeout won't impact performance since in that scenario
> There was already something wrong/stuck on that ring/scheduler


Regarding last paragraph, and specifically the claim that there was 
already something wrong if the TO handler
starts execution - Not sure about this and I wonder if we have a 
potential bug here - when we start the timeout timer in
drm_sched_job_begin we do it for each new incoming job. In a constant 
rapid stream of jobs each new job comming
will try to start the timer but most of the time this operation just 
bails out as there is already pending timer from one
of the previous jobs which cancels out any new ones [1] so, when the TO 
handler does execute eventually it's not
because something wrong but simply because TO has expired. If in this 
case the pending list not empty a false
TDR will be triggered. I think long ago we used TO handler per job and 
not per scheduler, this would solve this problem
but hurt the serialization issue we are trying to solve. So not sure 
what to do.

[1] - 
https://elixir.bootlin.com/linux/v5.14-rc1/source/kernel/workqueue.c#L1665

Andrey

>
> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Liu, Monk
> Sent: Thursday, August 19, 2021 6:26 PM
> To: Daniel Vetter <daniel@ffwll.ch>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Cc: Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
>
> [AMD Official Use Only]
>
> Hi Daniel
>
>>> Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
> Yeah we had this though as well in our mind.
>
> Our second approach is to call ktrhead_stop() in job_timedout() routine so that  the "bad" job is guaranteed to be used without scheduler's touching or freeing, Check this sample patch one as well please:
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a2a9536..50a49cb 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -319,17 +319,12 @@ static void drm_sched_job_timedout(struct work_struct *work)
>          sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>   
>          /* Protects against concurrent deletion in drm_sched_get_cleanup_job */
> +       kthread_park(sched->thread);
>          spin_lock(&sched->job_list_lock);
>          job = list_first_entry_or_null(&sched->pending_list,
>                                         struct drm_sched_job, list);
>   
>          if (job) {
> -               /*
> -                * Remove the bad job so it cannot be freed by concurrent
> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
> -                * is parked at which point it's safe.
> -                */
> -               list_del_init(&job->list);
>                  spin_unlock(&sched->job_list_lock);
>   
>                  status = job->sched->ops->timedout_job(job);
> @@ -345,6 +340,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>          } else {
>                  spin_unlock(&sched->job_list_lock);
>          }
> +       kthread_unpark(sched->thread);
>   
>          if (status != DRM_GPU_SCHED_STAT_ENODEV) {
>                  spin_lock(&sched->job_list_lock); @@ -393,20 +389,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>          kthread_park(sched->thread);
>   
>          /*
> -        * Reinsert back the bad job here - now it's safe as
> -        * drm_sched_get_cleanup_job cannot race against us and release the
> -        * bad job at this point - we parked (waited for) any in progress
> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
> -        * now until the scheduler thread is unparked.
> -        */
> -       if (bad && bad->sched == sched)
> -               /*
> -                * Add at the head of the queue to reflect it was the earliest
> -                * job extracted.
> -                */
> -               list_add(&bad->list, &sched->pending_list);
> -
> -       /*
>           * Iterate the job list from later to  earlier one and either deactive
>           * their HW callbacks or remove them from pending list if they already
>           * signaled.
>
>
> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Thursday, August 19, 2021 5:31 PM
> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Liu, Monk <Monk.Liu@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
>
> On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
>> On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
>>> On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
>>>> On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
>>>>> On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
>>>>>> On 2021-08-18 10:02 a.m., Alex Deucher wrote:
>>>>>>
>>>>>>> + dri-devel
>>>>>>>
>>>>>>> Since scheduler is a shared component, please add dri-devel
>>>>>>> on all scheduler patches.
>>>>>>>
>>>>>>> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>>>>>>>> [Why]
>>>>>>>> for bailing job, this commit will delete it from pending
>>>>>>>> list thus the bailing job will never have a chance to be
>>>>>>>> resubmitted even in advance tdr mode.
>>>>>>>>
>>>>>>>> [How]
>>>>>>>> after embeded hw_fence into amdgpu_job is done, the race
>>>>>>>> condition that this commit tries to work around is
>>>>>>>> completely solved.So revert this commit.
>>>>>>>> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
>>>>>>>> v2:
>>>>>>>> add dma_fence_get/put() around timedout_job to avoid
>>>>>>>> concurrent delete during processing timedout_job
>>>>>>>>
>>>>>>>> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>>>>>>>>      1 file changed, 5 insertions(+), 18 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index a2a953693b45..f9b9b3aefc4a 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>      {
>>>>>>>>             struct drm_gpu_scheduler *sched;
>>>>>>>>             struct drm_sched_job *job;
>>>>>>>> +       struct dma_fence *fence;
>>>>>>>>             enum drm_gpu_sched_stat status =
>>>>>>>> DRM_GPU_SCHED_STAT_NOMINAL;
>>>>>>>>
>>>>>>>>             sched = container_of(work, struct
>>>>>>>> drm_gpu_scheduler, work_tdr.work); @@ -325,11 +326,10 @@
>>>>>>>> static void drm_sched_job_timedout(struct work_struct
>>>>>>>> *work)
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
>>>>>>>> +               fence =
>>>>>>>> + dma_fence_get(job->s_fence->parent);
>>>>>> While this is true for amdgpu, it has no meaning for other
>>>>>> drivers for whom we haven't done the refactoring of embedding
>>>>>> HW fence (parent) into the job structure.
>>>>>> In fact thinking
>>>>>> about it, unless you do the HW fence embedding for all the
>>>>>> drivers using the scheduler you cannot revert this patch or
>>>>>> you will just break them.
>>>>> btw, why did you do that embedding? I do still have my patches
>>>>> with dma_fence annotations floating around, but my idea at least
>>>>> was to fix that issue with a mempool, not with embeddeding. What
>>>>> was the motivation for embedding the wh fence?
>>>>> -Daniel
>>>> The motivation was 2 fold, avoid memory allocation during jobs
>>>> submissions (HW fence allocation) because as Christian explained
>>>> this leads to deadlock with mm code during evictions due to memory
>>>> pressure (Christian can clarify if I messed
>>> Yeah that's the exact same thing I've chased with my dma_fence
>>> annotations, but thus far zero to none interested in getting it
>>> sorted. I think it'd be good to have some cross-driver agreement on
>>> how this should be solved before someone just charges ahead ...
>>>
>>>> this explanation). Second is to exactly revert this patch because
>>>> while it solved the issue described in the patch it created
>>>> another with drivers who baildc out early during TDR handling for
>>>> various reason and the job would just leak because it was already
>>>> removed form pending list.
>>> Can't we reinsert it before we restart the scheduler thread? It
>>> might need a separate list for that due to the lockless queue
>>> tricks. Or am I thinking about the wrong kind of "we lost the job"?
>>> -Danile
>>
>> If you look at the original patch it would reinsert it even earlier -
>> right after stopping the  SW scheduler thread, and even then it was to
>> late for some drivers as they would decide to return back from their
>> TDR handler even before that. It is solvable but in an ugly way as far
>> as I see, you need to require each driver in his code to put the job
>> back in the list if they do it before reaching the place where
>> scheduler framework does it. Kind of spaghetti code seems to me.
> Hm yeah I didn't realize this all happens before we stop the scheduler thread.
>
> Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
>
> I'm also still not understanding what exactly you guys have done, can someone please dig out the the amdgpu patches that motivate all this maybe that's clearer? A full explanation would still be good since I've only started in scheduler stuff.
>
> Another thing I recently pondered for tdr races looking at i915 code is whether the tdr should first block the completion fence for that job. My motivation is to have a race-free error capture (if the completion races then we might start evicting memory and everything goes boom), but maybe that helps here too. Some kind of atomic "block this fence from completing thing.
>
> Or I'm I completely guessing in the wrong direction?
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
>>>>>>>>                     status =
>>>>>>>> job->sched->ops->timedout_job(job);
>>>>>>>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>                             job->sched->ops->free_job(job);
>>>>>>>>                             sched->free_guilty = false;
>>>>>>>>                     }
>>>>>>>> +               dma_fence_put(fence);
>>>>>>>>             } else {
>>>>>>>>                     spin_unlock(&sched->job_list_lock);
>>>>>>>>             }
>>>>>>>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct
>>>>>>>> drm_gpu_scheduler *sched, struct drm_sched_job *bad)
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
>>>>>>>>              * their HW callbacks or remove them from
>>>>>>>> pending list if they already
>>>>>>>> --
>>>>>>>> 2.25.1
>>>>>>>>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Cmonk.liu%40amd.com%7C27fcce7ca8dd4f39608508d962f40f33%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649622657672189%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JVZtg3AhbiA%2FDmVbNGo3MxVliO83nh8%2Fi50PCMsvwyY%3D&amp;reserved=0
