Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2733F6032
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 16:23:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11165899B7;
	Tue, 24 Aug 2021 14:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E048989C;
 Tue, 24 Aug 2021 14:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLKWL/ktroqe7DrEKyUuHduIuc+trM3b31IqKloJVVjQcbHsBR6LFVGcVcg3g0EtcLXDgqloAnChkCCUCeiCNezIPBQO2TPiwZxnYjDb1HnN+EDQIsuiyPoqsz+iZkikbBUF9cyj34jpM3LZZy4fRHF+UBNpX49KSpX+YNftypQ4R60lRRYlq7ePFXbQacYhHYPlWjwxJZB0O16IAFjNeBh+aQKWcEfwzuUSxXT+2kgvJ6Q6ItkHXpuXDTfr0AK9qIvJQxpvzuKOYHznpPU3jZVC+4NjqymyI6od7tzm9L3N18hQ6Gx4Ch+4t6ThOERnbHBCdOK42nwx07DyFpWUbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1drMQRt6PNp0LMFIxJNmbE3IvZCF7/mQCQpFGCy+xVo=;
 b=XJ6KVjnxLId2foVL0EnPmdohACXusG4vuXVVLRuhDdH08sqeJU8CGCZrJxUdVjQ6uIqvLWNhoMmGdRz3m89JUTaOjH6HHifrdqNq7En1F6qifGTSZLXoiuMopp/6criXJKoIzSA6MJP/xKut4moyF6g1Jbnjm+tXDtNww1e4MKR6NhWre8ZM/j0+3WvTRkSnJJVl2IoV2XSQGQKah/Ydn0FzW/buCvjjRhLAtOXSWf6ldTdOij3nw1EsD0xyte++ZgY5cy5G1gRg5j9S7PVOI09BRlY8Zx6Z9lhwxaPKhsF8DMwGWOrIhnYjkbnGymBt+0YwS1kAThFuZk+AOzrcww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1drMQRt6PNp0LMFIxJNmbE3IvZCF7/mQCQpFGCy+xVo=;
 b=iBd1B+DFQSLqoHkhS2MjVvK5PiZTZ5eyPo9N0jsJItE+eZ8WhGL/AFezMTWS21jALF5z9T+DIZvBTNsbeqkFBqcue0xDGUw/GGjqhBJk/qCPeH8WXvegwBLSegIqCq9dCX+3Gr9pj1KZc7B1brGcZKTNmdiifMA37iRlRWi6o08=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4719.namprd12.prod.outlook.com (2603:10b6:805:e9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Tue, 24 Aug
 2021 14:23:19 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::17c:7262:446:f400%5]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 14:23:19 +0000
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
 <89b8132d-f297-a62e-7e50-0bc63c319c1d@amd.com>
 <BL1PR12MB52694ED19128A25F6390E4BD84C59@BL1PR12MB5269.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <d358c391-adcd-1a0c-68d3-0e6d22a01b4a@amd.com>
Date: Tue, 24 Aug 2021 10:23:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB52694ED19128A25F6390E4BD84C59@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::13) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:61c9:4593:6778:84a7]
 (2607:fea8:3edf:49b0:61c9:4593:6778:84a7) by
 YT3PR01CA0120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 14:23:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 538b40d2-f9a9-4b52-3d58-08d9670ab848
X-MS-TrafficTypeDiagnostic: SN6PR12MB4719:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4719FC07385B37E35412BC3EEAC59@SN6PR12MB4719.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VAz1xdreKfxwnlVZdlmAZWOFBJxJ9o/AP1YMzziQU97ngoqAklTJsfCf87mXJRAg2MH+vIVuZGkGWSgYH2S5gLkqmSQruPSox5heRTGCAfvA78INagnUDBav2C9xxw+R7DPYENVBYpHt2R2vhP8SpjbDm6u4RzIU3MUovJ0LQWKjX50Vrix3W4XWm12rQ1zZtZgRF6zl8+LasYpaWVzeHKLC2CpfB5srNmCGkw5i/Jf9HlWDniGKEzkiqz+PgYZNrnXbYAOtos6x/UUTBsJxB6+lxU0CY2rv2G7jNL36XK3kiKuOEOANN8mEMKk85hb89OA6xAO30Xp8UtYsuDGaEvEXoQM/EJB7AztGQQzcijjGY5JVs7TMcnqrNdgGK5jbLXfmFt0+5QhrS3kdZYdE2YiAWP2Za6QHjTZWL0sbsX92pBnkVykDcocDn0+yk9Dx+Y4uonaLNl57Y5o/AOuD1puMQl7yZrk3u49Kjb2vhmGj9RT4+cu0gIQCL9xnFwzwW+fRh90OSTR1MeybgfDFc4sKtkc9hrDyAMVfs7uJ9CiLft0AkyaNZBOomTaCWNqK9aOh8SafAguGF0CbWtyFM3DOxJiH5/+BlLNhAUQPWdNrjjjj9Qg4FFYOE4PTuocfdrSZ3BQsBIanae3MVlBMz6fktgzhH6TTyP/3/tF9xVXukFoj/qpHgNADDUI1ALozz3BQ9sH8nOjP9vjD/JdO7q7TkfI8h6Jq2INTC+grQ4G2s3/tu4iV1XqCIbYFfwjmp70ktAkwFzEjkrnW041wNAbSDHdjcee3wIBLeDf5F8cHgszDqehn+uMx9X61ItRnA+Ckwu6pgfHhjtUD7Jhlj84C2h4nS97Q3o3M3FEbxfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(8676002)(2906002)(8936002)(31686004)(54906003)(110136005)(44832011)(316002)(83380400001)(31696002)(66476007)(6486002)(2616005)(36756003)(38100700002)(4326008)(966005)(66946007)(30864003)(478600001)(53546011)(186003)(5660300002)(45080400002)(86362001)(6636002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nlh4ZFpmZ2RZU3VCd0lvSXN2T3BwdWVscmhTVWpBMDhEQXAxb0hoMlZkNEpV?=
 =?utf-8?B?VHJNV0luUUd0NVlhcm8vbEtJTUxqdWM0QVJua3VXSjlLd0Y3ekd6NHVpSm14?=
 =?utf-8?B?MWNNMWJ4QlM5NEFQbDAwdDZZUGlVQzVCb0MyZUNVOHh6aWU2VTFjWmx3NGt0?=
 =?utf-8?B?NjVRTHlJS0JMcjhKeHV4TGtMcndvclEzMUl1SjdqMjJzUWV2bE5WWEJnR2lL?=
 =?utf-8?B?aE42dG5PY1cyKzdLZm5vRUxtMHJYbHdRODcwZTZMNDlQbytVUEdISVJBSGE0?=
 =?utf-8?B?ckRKcjRSdVBQaWdqTnFZbkErek5Vc0xaWlZIOG9BbVZheXJWSFkraHMwYVpQ?=
 =?utf-8?B?SzBiRUgvOUVjekx6cTNoOUNIejZsUDQ2Q1R2bFRFM0txSHM5RlFCMHVvQ1R3?=
 =?utf-8?B?VlViRFVQbUtxdkxVSVVwbWxqdllNMDI3eGYzSktUOUFuYzhmODd0QVFpZE1h?=
 =?utf-8?B?TkFEQ0syY3k2d081SUpCL05mZFkwQUg1ZmpvdDArR05CNnZSYnhkV1VhT01K?=
 =?utf-8?B?NjBOdGVMTGJ2RjNLdDNUNWc5YW41dTEzbW4rU2dvYkcxbW8wa015ZGVSUHNT?=
 =?utf-8?B?VHVDekswYUhPenVTSENidFlsT0dwODQxa05aNS9YOVlNQVNuL1FqWkxLb2lC?=
 =?utf-8?B?UEllZERCRzU3TVhzQi95Tm1nd1JjVU11SWtDVUZuTjQzNXgwQWdIWGlrN0Rw?=
 =?utf-8?B?cC9RN3FFdXFQaGkxQThJeTZlQkJuNmtodkF3Y1dyR3J0RkJiNmZuUnc4YXF1?=
 =?utf-8?B?Y3UxWUNld3NYa2c5b0xScXBxWjdzWGoySit1VDNKb0hiYURrZjhSemlaWVAr?=
 =?utf-8?B?ZGNNdFZUOTlZdDM1QStIZUVIaXdTQzl6VnZDZ3YrQUN6YmlpZDg2NW1zVU55?=
 =?utf-8?B?bEhpRVk1K2ZMM1RVTE1yeVNQcXZoRlpPMTFaQXlDSUVMMWxQVlZyTFVQTkZw?=
 =?utf-8?B?NFVZQy9Fa3Nua2J2dHRLeWZsYzA4UW5BNElZOHpIaUo0Z1hEWVBYVlBnNTJu?=
 =?utf-8?B?RGFRalg2eUR1ZkthdzVFbVYzSmV4ZFFTSEI1VW1hazArZUxPQmYwdDdQMlVl?=
 =?utf-8?B?RENiSXBkS3NEZ0xsSE9ONkhPRFRseW9CaGtoc3JSWHFHVGNEazhHd1FTa3pE?=
 =?utf-8?B?eDFwM1U5akphQnJtWkloZlVCREkzZVpKYU5HTXZiendYN1FxVGc5MjQ3SEtr?=
 =?utf-8?B?dlB5TExYM1hHRldkK2dqS1dqQWtqS1VMSnNnT0VacjRLdWlEM3JLTW05TUsy?=
 =?utf-8?B?WUY0ODIrcnNOMVpiT296M3Vpd2E5dGVncjU0TjNqQkpNWG5tQkFFaXAxUWp0?=
 =?utf-8?B?bXV2a1crMVEzNjB6ODFrU0tzMWcvYkg0KzNxRXorV3p5bFk0RkVtYkZMaVoz?=
 =?utf-8?B?L0dvVko0U1Y4T2VCckR0VC9VNU9zai8wY1BvR3lyTTlrTEVRd0JsT1NIeDFV?=
 =?utf-8?B?eG9rVEc3dWpqZHdDWXhVQ1Fla1lkbTBQSnhMc0JWbGlqemJXUUVXWnN4Z25L?=
 =?utf-8?B?dXBtSFNuR1VvdmNwRXc2cDArSDRVb2svc1k5TU0zMkRqUTk2Q1NEUTNSdUJS?=
 =?utf-8?B?KzlHRFA0czdhakhNaDExbWR3VmtCQXdxTGYyZTA0MTJkMXF5cjJVY1BMalcy?=
 =?utf-8?B?U3l4c3B0RWZZbUZNK085blBNYUxWNUhxUU94eDhNZ3pQUVh4MDRzRDBEOERj?=
 =?utf-8?B?MnY0L1dVNGNQVTR0MUdzZTBiN3hHcWFrcDB3NERleWZhckRxRWprdnVNU3k3?=
 =?utf-8?B?aWhlVGtsYXhuL2VqSzR1bXZUMEZiNFROQm5mT2dvT0pXQW1zSC8xa3ZLQnov?=
 =?utf-8?B?SldPT3dybHpGdWQ2TE5qQWF6LzFHVktJVE1WcnJCaUI1SlRvRzVqU3c2Ly9O?=
 =?utf-8?Q?lmCY41mBBciW1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 538b40d2-f9a9-4b52-3d58-08d9670ab848
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 14:23:19.1180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2h7sCq7asmJJgM6lvso3ne8n9ri3aA/1zopIyLd0u+SLVTR7E3RKS/Qeo9RbhgX5iL6zgwwN6PnswG5KZjVUeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4719
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

On 2021-08-24 3:24 a.m., Liu, Monk wrote:

> [AMD Official Use Only]
>
> Hi Andrey
>
> Sorry that it is really hard for me to get any particular or solid potential bugs from your reply, can you be more specific, e.g.: what kind of race issue is introduced by this "kthread_stop/start" approach.


Hey, you might have missed my replies in the thread regarding this. 
Check them here.

https://www.spinics.net/lists/amd-gfx/msg67041.html
https://www.spinics.net/lists/amd-gfx/msg67090.html

In summery IMHO we can park/unpark only within serialized section 
against all other possible TDR handlers (at whole ASIC or even XGMI hive 
level).
Today we achieve this by locking. IN the new proposal there is no 
locking - so we either add one or just serialize TDRs to single thread 
execution.
Let me know if you think it's not an issue actually - i might be missing 
something.

Andrey


>
> To your another question/concern:
>>> . In a constant rapid stream of jobs each new job comming will try to start the timer but most of the time this operation just bails out as there is already pending timer from one of the previous jobs which cancels out any new ones [1] so, when the TO handler does execute eventually it's not because something wrong but simply because TO has
> Expired
>
> I totally agree withy you on this point, and I think I have a patch to address this, but this problem is not related with our current topic at all ... our  current topic is the bailout bad job handling from advanced TDR mode.
>
> The bug here is our current TO handler only do the counting on the first job to the given scheduler, and the following coming job won't recalculate the TO at all, and I can assure you that this is a regression because when I implement TDR years ago I already considered planned for such problem.
> Please check this change to resolve it:
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a2a9536..7b5f99a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -235,6 +235,13 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>                  schedule_delayed_work(&sched->work_tdr, sched->timeout);
>   }
>   
> +static void drm_sched_restart_timeout(struct drm_gpu_scheduler *sched)
> +{
> +       if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
> +           !list_empty(&sched->pending_list))
> +               mod_delayed_work(system_wq, &sched->work_tdr, sched->timeout);
> +}
> +
>   /**
>    * drm_sched_fault - immediately start timeout handler
>    *
> @@ -693,6 +682,11 @@ drm_sched_get_cleanup_job(struct drm_gpu_scheduler *sched)
>          if (job && dma_fence_is_signaled(&job->s_fence->finished)) {
>                  /* remove job from pending_list */
>                  list_del_init(&job->list);
> +
> +               /* once the job deleted from pending list we should restart
> +                * the timeout calculation for the next job.
> +                */
> +               drm_sched_restart_timeout(sched);
>                  /* make the scheduled timestamp more accurate */
>                  next = list_first_entry_or_null(&sched->pending_list,
>                                                  typeof(*next), list);
>
>
> if you guys do not have concerns I can submit this patch for review, but again, let's focus on bailing out had job handling as our priority, we are very close to our purpose, let me know what's your concerned race issue and we can address it.
>
> Thanks
>
> ------------------------------------------
> Monk Liu | Cloud-GPU Core team
> ------------------------------------------
>
> -----Original Message-----
> From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Sent: Friday, August 20, 2021 10:07 PM
> To: Liu, Monk <Monk.Liu@amd.com>; Daniel Vetter <daniel@ffwll.ch>; Koenig, Christian <Christian.Koenig@amd.com>
> Cc: Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-gfx@lists.freedesktop.org>
> Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
>
>
> On 2021-08-20 3:12 a.m., Liu, Monk wrote:
>> [AMD Official Use Only]
>>
>> @Daniel Vetter @Grodzovsky, Andrey @Koenig, Christian
>>    
>> Do you have any concern on the kthread_park() approach ?
>>
>> Theoretically speaking sched_main shall run there exclusively with
>> job_timeout since they both touches jobs, and stop scheduler during
>> job_timeout won't impact performance since in that scenario There was
>> already something wrong/stuck on that ring/scheduler
>
> Regarding last paragraph, and specifically the claim that there was already something wrong if the TO handler starts execution - Not sure about this and I wonder if we have a potential bug here - when we start the timeout timer in drm_sched_job_begin we do it for each new incoming job. In a constant rapid stream of jobs each new job comming will try to start the timer but most of the time this operation just bails out as there is already pending timer from one of the previous jobs which cancels out any new ones [1] so, when the TO handler does execute eventually it's not because something wrong but simply because TO has expired. If in this case the pending list not empty a false TDR will be triggered. I think long ago we used TO handler per job and not per scheduler, this would solve this problem but hurt the serialization issue we are trying to solve. So not sure what to do.
>
> [1] -
> https://elixir.bootlin.com/linux/v5.14-rc1/source/kernel/workqueue.c#L1665
>
> Andrey
>
>> Thanks
>>
>> ------------------------------------------
>> Monk Liu | Cloud-GPU Core team
>> ------------------------------------------
>>
>> -----Original Message-----
>> From: Liu, Monk
>> Sent: Thursday, August 19, 2021 6:26 PM
>> To: Daniel Vetter <daniel@ffwll.ch>; Grodzovsky, Andrey
>> <Andrey.Grodzovsky@amd.com>
>> Cc: Alex Deucher <alexdeucher@gmail.com>; Chen, JingWen
>> <JingWen.Chen2@amd.com>; Maling list - DRI developers
>> <dri-devel@lists.freedesktop.org>; amd-gfx list
>> <amd-gfx@lists.freedesktop.org>; Koenig, Christian
>> <Christian.Koenig@amd.com>
>> Subject: RE: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
>>
>> [AMD Official Use Only]
>>
>> Hi Daniel
>>
>>>> Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
>> Yeah we had this though as well in our mind.
>>
>> Our second approach is to call ktrhead_stop() in job_timedout() routine so that  the "bad" job is guaranteed to be used without scheduler's touching or freeing, Check this sample patch one as well please:
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index a2a9536..50a49cb 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -319,17 +319,12 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>           sched = container_of(work, struct drm_gpu_scheduler,
>> work_tdr.work);
>>    
>>           /* Protects against concurrent deletion in
>> drm_sched_get_cleanup_job */
>> +       kthread_park(sched->thread);
>>           spin_lock(&sched->job_list_lock);
>>           job = list_first_entry_or_null(&sched->pending_list,
>>                                          struct drm_sched_job, list);
>>    
>>           if (job) {
>> -               /*
>> -                * Remove the bad job so it cannot be freed by concurrent
>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>> -                * is parked at which point it's safe.
>> -                */
>> -               list_del_init(&job->list);
>>                   spin_unlock(&sched->job_list_lock);
>>    
>>                   status = job->sched->ops->timedout_job(job);
>> @@ -345,6 +340,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>           } else {
>>                   spin_unlock(&sched->job_list_lock);
>>           }
>> +       kthread_unpark(sched->thread);
>>    
>>           if (status != DRM_GPU_SCHED_STAT_ENODEV) {
>>                   spin_lock(&sched->job_list_lock); @@ -393,20 +389,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>           kthread_park(sched->thread);
>>    
>>           /*
>> -        * Reinsert back the bad job here - now it's safe as
>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>> -        * bad job at this point - we parked (waited for) any in progress
>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>> -        * now until the scheduler thread is unparked.
>> -        */
>> -       if (bad && bad->sched == sched)
>> -               /*
>> -                * Add at the head of the queue to reflect it was the earliest
>> -                * job extracted.
>> -                */
>> -               list_add(&bad->list, &sched->pending_list);
>> -
>> -       /*
>>            * Iterate the job list from later to  earlier one and either deactive
>>            * their HW callbacks or remove them from pending list if they already
>>            * signaled.
>>
>>
>> Thanks
>>
>> ------------------------------------------
>> Monk Liu | Cloud-GPU Core team
>> ------------------------------------------
>>
>> -----Original Message-----
>> From: Daniel Vetter <daniel@ffwll.ch>
>> Sent: Thursday, August 19, 2021 5:31 PM
>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>; Alex Deucher
>> <alexdeucher@gmail.com>; Chen, JingWen <JingWen.Chen2@amd.com>; Maling
>> list - DRI developers <dri-devel@lists.freedesktop.org>; amd-gfx list
>> <amd-gfx@lists.freedesktop.org>; Liu, Monk <Monk.Liu@amd.com>; Koenig,
>> Christian <Christian.Koenig@amd.com>
>> Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
>>
>> On Wed, Aug 18, 2021 at 10:51:00AM -0400, Andrey Grodzovsky wrote:
>>> On 2021-08-18 10:42 a.m., Daniel Vetter wrote:
>>>> On Wed, Aug 18, 2021 at 10:36:32AM -0400, Andrey Grodzovsky wrote:
>>>>> On 2021-08-18 10:32 a.m., Daniel Vetter wrote:
>>>>>> On Wed, Aug 18, 2021 at 10:26:25AM -0400, Andrey Grodzovsky wrote:
>>>>>>> On 2021-08-18 10:02 a.m., Alex Deucher wrote:
>>>>>>>
>>>>>>>> + dri-devel
>>>>>>>>
>>>>>>>> Since scheduler is a shared component, please add dri-devel on
>>>>>>>> all scheduler patches.
>>>>>>>>
>>>>>>>> On Wed, Aug 18, 2021 at 7:21 AM Jingwen Chen <Jingwen.Chen2@amd.com> wrote:
>>>>>>>>> [Why]
>>>>>>>>> for bailing job, this commit will delete it from pending list
>>>>>>>>> thus the bailing job will never have a chance to be resubmitted
>>>>>>>>> even in advance tdr mode.
>>>>>>>>>
>>>>>>>>> [How]
>>>>>>>>> after embeded hw_fence into amdgpu_job is done, the race
>>>>>>>>> condition that this commit tries to work around is completely
>>>>>>>>> solved.So revert this commit.
>>>>>>>>> This reverts commit 135517d3565b48f4def3b1b82008bc17eb5d1c90.
>>>>>>>>> v2:
>>>>>>>>> add dma_fence_get/put() around timedout_job to avoid concurrent
>>>>>>>>> delete during processing timedout_job
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
>>>>>>>>> ---
>>>>>>>>>       drivers/gpu/drm/scheduler/sched_main.c | 23 +++++------------------
>>>>>>>>>       1 file changed, 5 insertions(+), 18 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> index a2a953693b45..f9b9b3aefc4a 100644
>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> @@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>       {
>>>>>>>>>              struct drm_gpu_scheduler *sched;
>>>>>>>>>              struct drm_sched_job *job;
>>>>>>>>> +       struct dma_fence *fence;
>>>>>>>>>              enum drm_gpu_sched_stat status =
>>>>>>>>> DRM_GPU_SCHED_STAT_NOMINAL;
>>>>>>>>>
>>>>>>>>>              sched = container_of(work, struct
>>>>>>>>> drm_gpu_scheduler, work_tdr.work); @@ -325,11 +326,10 @@ static
>>>>>>>>> void drm_sched_job_timedout(struct work_struct
>>>>>>>>> *work)
>>>>>>>>>
>>>>>>>>>              if (job) {
>>>>>>>>>                      /*
>>>>>>>>> -                * Remove the bad job so it cannot be freed by concurrent
>>>>>>>>> -                * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>>>>> -                * is parked at which point it's safe.
>>>>>>>>> +                * Get job->s_fence->parent here to avoid concurrent delete during
>>>>>>>>> +                * processing timedout_job
>>>>>>>>>                       */
>>>>>>>>> -               list_del_init(&job->list);
>>>>>>>>> +               fence =
>>>>>>>>> + dma_fence_get(job->s_fence->parent);
>>>>>>> While this is true for amdgpu, it has no meaning for other
>>>>>>> drivers for whom we haven't done the refactoring of embedding HW
>>>>>>> fence (parent) into the job structure.
>>>>>>> In fact thinking
>>>>>>> about it, unless you do the HW fence embedding for all the
>>>>>>> drivers using the scheduler you cannot revert this patch or you
>>>>>>> will just break them.
>>>>>> btw, why did you do that embedding? I do still have my patches
>>>>>> with dma_fence annotations floating around, but my idea at least
>>>>>> was to fix that issue with a mempool, not with embeddeding. What
>>>>>> was the motivation for embedding the wh fence?
>>>>>> -Daniel
>>>>> The motivation was 2 fold, avoid memory allocation during jobs
>>>>> submissions (HW fence allocation) because as Christian explained
>>>>> this leads to deadlock with mm code during evictions due to memory
>>>>> pressure (Christian can clarify if I messed
>>>> Yeah that's the exact same thing I've chased with my dma_fence
>>>> annotations, but thus far zero to none interested in getting it
>>>> sorted. I think it'd be good to have some cross-driver agreement on
>>>> how this should be solved before someone just charges ahead ...
>>>>
>>>>> this explanation). Second is to exactly revert this patch because
>>>>> while it solved the issue described in the patch it created another
>>>>> with drivers who baildc out early during TDR handling for various
>>>>> reason and the job would just leak because it was already removed
>>>>> form pending list.
>>>> Can't we reinsert it before we restart the scheduler thread? It
>>>> might need a separate list for that due to the lockless queue
>>>> tricks. Or am I thinking about the wrong kind of "we lost the job"?
>>>> -Danile
>>> If you look at the original patch it would reinsert it even earlier -
>>> right after stopping the  SW scheduler thread, and even then it was
>>> to late for some drivers as they would decide to return back from
>>> their TDR handler even before that. It is solvable but in an ugly way
>>> as far as I see, you need to require each driver in his code to put
>>> the job back in the list if they do it before reaching the place
>>> where scheduler framework does it. Kind of spaghetti code seems to me.
>> Hm yeah I didn't realize this all happens before we stop the scheduler thread.
>>
>> Why can't we stop the scheduler thread first, so that there's guaranteed no race? I've recently had a lot of discussions with panfrost folks about their reset that spawns across engines, and without stopping the scheduler thread first before you touch anything it's just plain impossible.
>>
>> I'm also still not understanding what exactly you guys have done, can someone please dig out the the amdgpu patches that motivate all this maybe that's clearer? A full explanation would still be good since I've only started in scheduler stuff.
>>
>> Another thing I recently pondered for tdr races looking at i915 code is whether the tdr should first block the completion fence for that job. My motivation is to have a race-free error capture (if the completion races then we might start evicting memory and everything goes boom), but maybe that helps here too. Some kind of atomic "block this fence from completing thing.
>>
>> Or I'm I completely guessing in the wrong direction?
>> -Daniel
>>
>>> Andrey
>>>
>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>>
>>>>>>>>>                      spin_unlock(&sched->job_list_lock);
>>>>>>>>>
>>>>>>>>>                      status =
>>>>>>>>> job->sched->ops->timedout_job(job);
>>>>>>>>> @@ -342,6 +342,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>                              job->sched->ops->free_job(job);
>>>>>>>>>                              sched->free_guilty = false;
>>>>>>>>>                      }
>>>>>>>>> +               dma_fence_put(fence);
>>>>>>>>>              } else {
>>>>>>>>>                      spin_unlock(&sched->job_list_lock);
>>>>>>>>>              }
>>>>>>>>> @@ -392,20 +393,6 @@ void drm_sched_stop(struct
>>>>>>>>> drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>>>
>>>>>>>>>              kthread_park(sched->thread);
>>>>>>>>>
>>>>>>>>> -       /*
>>>>>>>>> -        * Reinsert back the bad job here - now it's safe as
>>>>>>>>> -        * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>>>>> -        * bad job at this point - we parked (waited for) any in progress
>>>>>>>>> -        * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>>>>> -        * now until the scheduler thread is unparked.
>>>>>>>>> -        */
>>>>>>>>> -       if (bad && bad->sched == sched)
>>>>>>>>> -               /*
>>>>>>>>> -                * Add at the head of the queue to reflect it was the earliest
>>>>>>>>> -                * job extracted.
>>>>>>>>> -                */
>>>>>>>>> -               list_add(&bad->list, &sched->pending_list);
>>>>>>>>> -
>>>>>>>>>              /*
>>>>>>>>>               * Iterate the job list from later to  earlier one and either deactive
>>>>>>>>>               * their HW callbacks or remove them from pending
>>>>>>>>> list if they already
>>>>>>>>> --
>>>>>>>>> 2.25.1
>>>>>>>>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.
>> ffwll.ch%2F&amp;data=04%7C01%7Cmonk.liu%40amd.com%7C27fcce7ca8dd4f3960
>> 8508d962f40f33%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376496226
>> 57672189%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
>> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JVZtg3AhbiA%2FDmVbNGo3M
>> xVliO83nh8%2Fi50PCMsvwyY%3D&amp;reserved=0
