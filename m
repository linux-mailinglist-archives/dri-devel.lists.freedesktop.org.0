Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2883F278F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E3F6EA28;
	Fri, 20 Aug 2021 07:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CAB6EA28;
 Fri, 20 Aug 2021 07:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRKMr+ofOeljrSTSVqtU02eQSk38cwRuSKM0CD4fFlivUvjlnEl07ozNBJD4F29clB2XWEM7gtmwDncRllL13kyXyUBYbxN7l27pM8yvlmJsCk/derRPrpw4PHf2KmZZkliu/A8x5on0LYKk/VFJG2j1R9vVtzBgV2co4iP51eRAiYCU9zWxOiQ4GsVXvAvHPN7gNdPiFDrWn1VwyYY+zUQMEu3qOzw9ad0f1V/Iguca23RmzzxNycZDZS+TQMvWvrfX3/HxhJSnbv6tG7qav0V04mzWRqtcz3PAJhcqYpBkdlsjItZUqkF/s8i6GKoOrqKZ/NKT/SX8XrBkcysnUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92y6lh9UJ7a6WEU7fR1Dqps+pWc6B2fp6V/su3QHyXc=;
 b=UuIr7gWTIUtCB/PDaCB8/UD15bJ60w1zMSimlKgB2eb6+IxuePvEwGorUy6PFQYnprwF9PB5e4nb6MqLm74ZDD5aFLUiVnoeNBxqOnORnFKLuqQT+0aEhI9FKYBhWGlgxHFwrZ8ZAOfo13y1cbsw5UY+4+zPAVldNHoK6DlddswsGFxnmiqLwLRkc3ltYiLx/Ccy0FMH6DfNn4Yn3A80zX1zJTrT3PYrcdthG4+H8dHjn85UwuhxDZ2ZG8+l1sVrvHwuckhUVnOQaSWND8kmDmCTuwwfyaORjWyrqeiCyDBzGG07PfD06ECJ7QVU1cwMbOp55JGmhkIxJv5+A1MYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92y6lh9UJ7a6WEU7fR1Dqps+pWc6B2fp6V/su3QHyXc=;
 b=cYkcxcgBX2kVFZ1OpHe816X1BolkFfUY43OCaWMXANOp6Ai9jyM7LXi+owzR1OLrznCy/9EPNfGhpQ+awTjkCTsXtn9sAMQgPdpnhY1iLm6MGBzD8Mzf15vAECXguA6NhJWJIDT7Et6ZGzReA2Kqd1FKNMmSKItBCH0zX7OOr3M=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4535.namprd12.prod.outlook.com (2603:10b6:208:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Fri, 20 Aug
 2021 07:20:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 07:20:49 +0000
Subject: Re: [PATCH v2] Revert "drm/scheduler: Avoid accessing freed bad job."
To: "Liu, Monk" <Monk.Liu@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ede7948c-3365-d98c-464b-6c3356b914b8@amd.com>
Date: Fri, 20 Aug 2021 09:20:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <BL1PR12MB526995BE01F10A5F7D8158F184C19@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:208:122::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR04CA0009.eurprd04.prod.outlook.com (2603:10a6:208:122::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 07:20:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc78174f-c7f5-40ba-bf8f-08d963ab08f3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4535:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4535A2394C7830C4E978309683C19@MN2PR12MB4535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:374;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJWsBWiNu6cfuxHaxrgHC2+qfPStGL5+9JqFhnRlcaqRP+uiprZ8bjq3McbcCtp16YA02OlEKTd+Wen0zW0KJ4izuUr755/+ydOjOPwg3mOPjCAPyfSPsq+n5FFhp3W6IwRUWlywjH1duUk/duiZvGdSuJNzRKyCk11gfFt/K1UYpmH2MrIOVFexZHwDaf7wxbV5cBImOZBLt9t7wYCOA59D8kM9UwQmy4lLuX68Pk5cKC0Pths8gRZySsT9/Ah6bd+c7a5YgNHRanKKtgGei+UAe4pQMLRtAXkNwyjZu7o3M1FAQ4HE+qw3P/wlrNxKh6yuwOwhQuQZ1RFOkU4VGTBzsuk8cSa7AqtfUPzR2rRdfLDyxQKim9Dfb1Y6SISiCCMCVS/dHYKfN3rwG1gTVzwCo7YgQ4qSzUU+RUdtEVhU1PTpYzki+lynrykaexvARtHLBgO+yzcnCKyg8A58t5TYQcLA2so/ccMG6iK68/RReiuwHDQrzBtI09OCkY1lXLgPymGvgoaTX8RrnaHsZ7RdiJu5nlcStem+E5Urqt2ViQjB7FUcnkxaHsNqsj32w4iIiUsEB14bC3dFmIEDakQlNXKKZi8BokGYAx7W/o7AMZXja1yKI4goNv2teC1bTUHcS6bhFtiDm2DJ+EZp0KlJKjskSNRR7gkYKR1YhFqNe296511dflxiC+u80UF9eTIV7zwf0PyeZPLVvx3W2M9bJgtztWJzvsTaFwqYyP7/2VAgYCc+dW/ssy12nbMS6ZBHkSG++40mftC2RWHQaX3GOVIIto7AKIMvfXpwm8neDifIYR/CGiOlzkne6K7ebQLhaeV9Yk/yK0GnCemH7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(396003)(376002)(136003)(45080400002)(26005)(30864003)(316002)(110136005)(38100700002)(36756003)(16576012)(2906002)(54906003)(66946007)(53546011)(2616005)(6636002)(6486002)(956004)(66556008)(66476007)(5660300002)(966005)(83380400001)(8676002)(86362001)(8936002)(6666004)(4326008)(478600001)(31686004)(186003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2lwZm9CWmd5MzR0UEtMMzNIMlovY0VDVjNQN0xoUCtiMjVwSWtxT3p2OVFj?=
 =?utf-8?B?K014aE11WWV0UDkzdVZscmN3cDVYQ3V4SGdDekd0ZmdBUFlIYUFGaHVYWXJF?=
 =?utf-8?B?emNiWFBuVnFUZmNFbUcwY1NYWnpjUHR3TSs3SXgrLzFMQ09NV1dDOFZWWFBX?=
 =?utf-8?B?alQ4bWFBeTJVa1Z6SEl4QW1PSUFkWWhyUTRpZmp4WkJoRmg1U1hGOUl0RUJ5?=
 =?utf-8?B?c21TK216NDlDQkVERmxMVVFTUXQxSTFoRFNpek1WVFpUY3drQWNlNGovcGF5?=
 =?utf-8?B?b0FCRmErR0J3QTg5YUJkZW83amJQYmxwMG5SKzZLYmpHN1JFQ2NYbGdQdm5G?=
 =?utf-8?B?bzZMMlUzV0liK0M1eEI0S1ZVZm1Mc2FGM2dZTUlETnRKeWszZzNpRjdTMWF4?=
 =?utf-8?B?djF4MGtoS2Z5LzJLWG5RRC92ZW1WSHRIcmR2WEQ0SER0M3BwaWZwRUtMSGI2?=
 =?utf-8?B?SnhQQTg2K1hUMUNyTy9pNmdBQm5EMFdUL3hTa0VlYWtTQW9VM2lrdUpiRUpG?=
 =?utf-8?B?aWFBbjQyQ1RvdHRrL1hiRGNzeUswZk5rdTQ4dlh3WHZ3L01GR2hYNU5zd2xM?=
 =?utf-8?B?RnFuMU9vVzNsYkNwN1BxNk9ZaFVsbVRtZWdZZkFzU0xPTEEyTXk0cmE3QjVa?=
 =?utf-8?B?Vm10dHZ0RUt0NzlJcDhtdDhqNkt4elhRT0VmWHNrbFNleU9LeUpFYnNiSzJz?=
 =?utf-8?B?YTZ6RVpSQWhrMlhyazB0RnpETUJvSCtnSjlCeHRjdXYyRTFoRE16NXJOMFpY?=
 =?utf-8?B?ZUtDcWtjb2s4UENkS1pTYmNzTzJ0bnppUVRMdzIwMWhWczAvd091bDdIT253?=
 =?utf-8?B?QVI5U2dGQ0xMcWdTUUVzZ2JPdi9kdWRmOERZeXphcmNZOWlVeTJ3UklpcWx2?=
 =?utf-8?B?TWpKUldnb1IvUDNzT1JrZWFRVDJ5RHdNRDFxcjZjY1dxNmp6bnMrZXhNWDIy?=
 =?utf-8?B?Slc0bkc4YW04UjZ3S1hCdHJrZEZUZy9yWE1uR3ZtVGhJaWh3amE0MXFBeDlt?=
 =?utf-8?B?NkhTdzZCTkJDekF6SXp4THNEeGxscHdJTG42ejVXVjlGQjQ5WExiTW1jbWZB?=
 =?utf-8?B?Q3JaUFFvc0M2alVaS2hWcFRwYkNqN0ZublJXK0hXVmxxRkY3akJRcElxSmIw?=
 =?utf-8?B?Z1lWTGJtWGQ2cXdQU1UrQ1lSc2owQUtSRDRLOHV5b0tsanVMNmlpcEt5dVA4?=
 =?utf-8?B?dG15OGt2YlpPaUcrTStFRDc1aXlGMkdLekwzZEhGODVMSjZvUFdpSXd3dDRW?=
 =?utf-8?B?VUpTL3dSQ3VPemNmR1lQTC83aUJ3VE9wRWhGRXI2VFFFckJXOXJzMkNUdHZW?=
 =?utf-8?B?WEdwQ1dtRkt4TXluVVJoNU9aVXlYQ0sxd2VFMWNBaDFRaGtycTFIV2xFVFBl?=
 =?utf-8?B?ZmVidDF6OUF1dllzYUNTV0VLbzdOOERDeDF0WFZhazlQbnFvYitRU2g1VmI5?=
 =?utf-8?B?dWx2SjRRcjNZN09MbTFEUVh4QnlWcHc3N01DTlJOV2pGMlF4c1JlTHpkQTZG?=
 =?utf-8?B?Z1h6bk9QK3pyQXNENFl3cm0yZ2ZHNUd5eGYraWdYelJUS0ZxRmtkNWxwVzZG?=
 =?utf-8?B?M21OOG1laEJFTmhjZ0RuWnlvaDNVNy9IYTJPWmtHNDVTeGx6ZEV4aXFGTzVO?=
 =?utf-8?B?dUtacVh3UTJITGNCREZTdVdhVHVxODdvbXN3RzZDOElnTVNabDRlQWR5OVBa?=
 =?utf-8?B?aUFiOUpPQmZGR3JyZFZWdW9qbXJUVUlUczdKQVFZeXhqRFplNEhFL1F2a1h5?=
 =?utf-8?Q?VxJieQIxI9Z6fibzweet6ckUazVMxGoygJvsIWu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc78174f-c7f5-40ba-bf8f-08d963ab08f3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 07:20:49.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi/woHkOPFWLRCqFg4tmkMlZI7GlamHdD99/OIkfTfrmU1opP41eQMS8YG5j3AWk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4535
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

No, that perfectly works for me.

The problem we used to have with this approach was that we potentially 
have multiple timeouts at the same time.

But when we serialize the timeout handling by using a single workqueue 
as suggested by Daniel now as well then that isn't an issue any more.

Regards,
Christian.

Am 20.08.21 um 09:12 schrieb Liu, Monk:
> [AMD Official Use Only]
>
> @Daniel Vetter @Grodzovsky, Andrey @Koenig, Christian
>   
> Do you have any concern on the kthread_park() approach ?
>
> Theoretically speaking sched_main shall run there exclusively with job_timeout since they both touches jobs, and stop scheduler during job_timeout won't impact performance since in that scenario
> There was already something wrong/stuck on that ring/scheduler
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

