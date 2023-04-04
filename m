Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6B06D5B77
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 11:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC34110E1F9;
	Tue,  4 Apr 2023 09:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F45E10E624;
 Tue,  4 Apr 2023 09:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gN80/mDzkeCRT/TykqBv6tOxrpJvN5iqWUAnzJYgxyZG8sOGnKndMay16VfpFPMxpbCaZ1MLFPoUxdXk5Gm0wIK+kOR1AOYIULMXSVlgYhyr2WYiJZjffJRdPxiLeOWC/oeSR12DAV0FOBzCP1zelvTgOCcja5GNcqmhRuRp6mA4/+f1fFcGPW5/1hDnC5pVMsvQAt2UY+r+FPtxhjzfZNTndIXw1EPO0Hla4RTfEZHrygC4GKSC/rQ6o6mEqz1dr8PUKa0f2vQp23j6nIjd1VoVRoRblXGiU7nZWlSCD6ocYvQgcu3HuKQOd6fmoq5wsMsy/hgZV5zlE0S8m3mvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rw9bXDb/TYtpHAv4DhwF8fG7OPwVhLriofIRT7zTtrk=;
 b=mOVSc9e8AeA2X1N+6letRkf65FwVMmqXUNfBlbVdH6alelhrA6WFAADGu+xqe9ERFSKJwAVF8A/Al7XV+nuK++frmkPZlNG5DXTJsDkCBZkO3D+Oo08ubX8C4Y22iqSxDE4TWL7+Xv5zpfsHQhiOMZA+L3IRlRjMEcnwTd8Gd40/kAXi9cW0ytHVrdac+xAciz7QdhN8PUnrcqT7LO5TUJ9TPkU7VhOX9iNEfeUMyMEWSnTcJo+17I07+fjwdC+TdEzhGKMzACDCCqNbWn2xUmvqYHa43g9mSP50KJXdRrCy6QU4uQkiUfweXXrX3nCo73CxMCTYvop2qnyE8bm9+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rw9bXDb/TYtpHAv4DhwF8fG7OPwVhLriofIRT7zTtrk=;
 b=SySri0+r6kYY/u6w401woPVCb6Ra86fFJEpM/H9nJGJoXu442XAkoGFLRM26vg9NfosuESY9aCeBvTciA38n1vkGgAWFQYq1oK2OzaBxAXP33uZzelHwB1ZtOdicDB7JmasgD+elCBFfGS70fO0fLubdwxrZPTI5ViN2ybK1AWs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM4PR12MB5868.namprd12.prod.outlook.com (2603:10b6:8:67::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 4 Apr
 2023 09:05:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 09:05:00 +0000
Message-ID: <1f89e43f-fcf0-80ad-4319-26e3dfe8b0c1@amd.com>
Date: Tue, 4 Apr 2023 11:04:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, "Tuikov, Luben" <Luben.Tuikov@amd.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM4PR12MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: c711951f-2982-45d3-87e2-08db34ebab91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NQqFS11pTO9HZ9Ub1g0khMIQm6nkxtYFTfQJbt1yJDv49K13QfiDxg/EmAEP0VmMBAVGhw9V01XTUDkWQgrhB5TBJglYCTUvLn6GON1JHjHfj3+KJgmMVwcaTZABAIqabDtDCnd1wfCtZLg+Wd1wP4W8qnaW5r5KIh0uHASvndx7wJPGiWHNu3rqrJhZcaLnQQXlx8Xx5Vrzdb7sky+GVe9GGiE8Gn0ye6Hdka9qRV28WjMKjc9978G80/SRK6Pdk8iGW5bYhaZYFyVxQUx6WzUJou75IkP4vruoEFuRsF0xIP8zhO327Xg1QRvKYZbnTyuFSukEa+eSY0EMecDHdz9aRn83+kfiD7dqeIPviqyAjcv0/ykVvcwjI5Ly1vJw7mVgi7hR5C4eg1vJKk1197hzLkB1JEcf6AGnFNX32QNBE8VFRPcoBSV8i6AsxxEVNqWbGXKrpUqwEn8hNqRHxW+iWKswiCyYXEILzs4T8ColuqydYqgzbkKlJJz5U9jMk7wQhkkoOUv09hVHyYTKAfcbD9PXdbikXDYwfsHGZh45fUtyRaTKstLuvt+GLpEw2HqrJTml7Tudzq+vy3kXKCmp9m5uFh9KoK1sckMBNpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199021)(5660300002)(478600001)(316002)(66476007)(66556008)(8676002)(66946007)(110136005)(6636002)(6512007)(6506007)(6666004)(6486002)(26005)(966005)(2906002)(186003)(4326008)(8936002)(41300700001)(7416002)(38100700002)(31696002)(86362001)(2616005)(66574015)(83380400001)(36756003)(31686004)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qy82Nkt3c3YzK211U0RWU1BIeUNObEJ4NkpwQktWVkg1endLd29NU2d1eGVy?=
 =?utf-8?B?aTlBRjA0RVlUUkRoMGhYclIybzRNZllsd3hKYUxVV2F0azdqakFHOUlwbWND?=
 =?utf-8?B?K09MSEpwaE9obGlPbGNMejFmT21hemlYemFscDlVUEEwMVliN2pwQ0lMNW9k?=
 =?utf-8?B?MjNmY1RLdEdSLzhsRHZPUVNNN1BQenZnUm52MXBrSkpoUnJmWEVHTDl4Vnlp?=
 =?utf-8?B?TE0zclRmQk4yUFQ5T3d4RDN4QXJuRkJDY2ZGQTAwOTcxUVVJS0pLVXVoR0do?=
 =?utf-8?B?eEtXRy9CNlUyUE9sZFlPWUFiOFE3RVM0cWtGR2pHcmFzY0VJM0ZodWh4S3pW?=
 =?utf-8?B?K2JicXZqejlaYXpGSExxNGhiNFcyWnIzVWVrdEQ0VVNTTUNHZkpLZnVCQzlv?=
 =?utf-8?B?WVdxeXV4NUFMelNiTlhYYUVjSFB6OXFJM05CR0p6VWxIVjllWkdIejFOa1VB?=
 =?utf-8?B?YnZ4Z0xhZHlVNkVLZ3Y5VVpkcWEyMHA4QVpWUmFnaFBwbDVsb2Jaa3VYbWVC?=
 =?utf-8?B?VlU4Z3JCSmN2MTBpcDRVbzI4SVV2S0M1azVHMFIxaGRHZ3prYU5uUmRPLzND?=
 =?utf-8?B?dHRjWThCSVFJVlRtaWVIa1BzV1VJNHE4alYyL2l6UElHUEJPTDVmUTBkQmxs?=
 =?utf-8?B?ZnZCZEtrQ2RZL3NERjdNUnlFeVprNXgvQnBVd1dkNWdJZ0YwTDN5cEs3MU5x?=
 =?utf-8?B?elFiQkI3OVlCRit2QktVWk5DcGZ1WWNtYlFvbElJRUhBZFRvamJPTkZNM2lR?=
 =?utf-8?B?ekUrR3J6STh3dzRnZ0xON3c4ajQyRTE5dlpSMjdSbk83MWxNSjhWdW9ScVcw?=
 =?utf-8?B?Qzl5VWNzY214Ylp4RTdBdHcyR3J1VURtellWMXAxTk9kL3E4b3RwbHBod3Ba?=
 =?utf-8?B?N1ZrTzRPeXduVHZhK3VjeXpVR3ExM3JRY2xTdlV0RHl6YXFFNFpSZ1hnYVcr?=
 =?utf-8?B?RE80RWhzMEtocHJ3Z1MrcVhOZEZoS1poTFdpUG5WZUNNSDRKeEtRUm9EZVVQ?=
 =?utf-8?B?UlpwTWJHcHQ3VCsxSWpNRnRXMGNLamVLR29ZeVY1VStxMVp3MHJITWRsam9z?=
 =?utf-8?B?Y1BWbkFXY2VDQTFuR2xrN3RGUkduWE42UVNYRUpCNHpvUjd1b0VtNFRxcnNC?=
 =?utf-8?B?M1Y0bjdtQ0JLa0dUM1BmbDhva0xsUHkvQ2ZGbFFwdm1sRjdZcnlEV3M5N2d6?=
 =?utf-8?B?ekJ5MVYrdVkrYUgrTEh5VWQrVnNCWm5JRi9YVW1XcXBreUNsazFYc3V3Z1c2?=
 =?utf-8?B?T3ZDVUF6YnBnRjViVkdIdmN0T3BrUkQ1MkpPZkwyOXJpcWUvdUhpQXRST0FQ?=
 =?utf-8?B?WHE4S0RFRW9tTVFsejRQZ0RDOEFLUm1qSStTWko5bWZoWDdDbm4rWmNBK3Ny?=
 =?utf-8?B?ZjdBaEFXRzJ5MFZ1N09zdTZERVUvUVRZRlFvRCtvb2V6enVIRStoZW80a3Zj?=
 =?utf-8?B?VXkvZ0FmZmVPRXhoTmdDVWoybGtWNDBEanlnSFpJOFBYSzNPbXY1Mis0NXlE?=
 =?utf-8?B?cDdqUm1tN2NMZ1ExZWJhRUZpSzgrRjY3QVpVKzZkMXpXdytmSTVoZkxjZS9F?=
 =?utf-8?B?NlJpSyt3cnVxSXFMeVVUeDdGZ2xPSFQ1WDRld3Y1eElzQlA1eE44dGhBcFRy?=
 =?utf-8?B?TERTMDkzS2dabFkwbDVsTnk1SkRYR1IvV3BQWG5TOFNwVFQwNWhMcGw1cHVS?=
 =?utf-8?B?TExLaCtxSUVhQkRnRlova3RxaitzcGhzMENkZjdSR1Rsc2tVZ2JnM05URU5Z?=
 =?utf-8?B?RURaYnZOOXB2MmFycVZDUUpnSkd2dGVTb3huQWx3OGJMRDhySCtTYkJXTVJw?=
 =?utf-8?B?MHZaYVh2azk5L00venpoODFIUG9sSnNLK2FzUG9JY0xzZml6MDMyRjB4RlJL?=
 =?utf-8?B?cUU2blpmSkFPTnVHM0dzUGFiNTl4S0pncXRYK2Z4Z2hqRStpM2llL3Jkallq?=
 =?utf-8?B?SHhnRXBkUmROc0grVldPR0NOT0U4NGtkaDRCbkJZYTZaRkNEazFsenlkQ2hT?=
 =?utf-8?B?U2E4eVNDTERKclJZWmw3YTVqbkNpRTE0MWY0cG11dlNOVTZxT3NVOFI4YzVq?=
 =?utf-8?B?Z2R6QWtzTTBTdVFYT1pCYWMzMnVydjM4dGIwUGRYMkZXbFVydk5JY3pYclNa?=
 =?utf-8?Q?1rF7ZXqhfQ7v+dLFYDtuYZb94?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c711951f-2982-45d3-87e2-08db34ebab91
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 09:05:00.6182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaIplMH2Y2MEWAx+EXs1Wi9GWnPUbOdG0HiogeALYsLs5BihtJgedoPt1UHt1SdB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5868
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please make sure to CC Luben on scheduler patches.

Regards,
Christian.

Am 04.04.23 um 02:22 schrieb Matthew Brost:
> Hello,
>
> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
> have been asked to merge our common DRM scheduler patches first as well
> as develop a common solution for long running workloads with the DRM
> scheduler. This RFC series is our first attempt at doing this. We
> welcome any and all feedback.
>
> This can we thought of as 4 parts detailed below.
>
> - DRM scheduler changes for 1 to 1 relationship between scheduler and
> entity (patches 1-3)
>
> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
> GuC) which is a new paradigm WRT to the DRM scheduler and presents
> severals problems as the DRM was originally designed to schedule jobs on
> hardware queues. The main problem being that DRM scheduler expects the
> submission order of jobs to be the completion order of jobs even across
> multiple entities. This assumption falls apart with a firmware scheduler
> as a firmware scheduler has no concept of jobs and jobs can complete out
> of order. A novel solution for was originally thought of by Faith during
> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
> and entity. I believe the AGX driver [3] is using this approach and
> Boris may use approach as well for the Mali driver [4].
>
> To support a 1 to 1 relationship we move the main execution function
> from a kthread to a work queue and add a new scheduling mode which
> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
> The new scheduling mode should unify all drivers usage with a 1 to 1
> relationship and can be thought of as using scheduler as a dependency /
> infligt job tracker rather than a true scheduler.
>
> - Generic messaging interface for DRM scheduler
>
> Idea is to be able to communicate to the submission backend with in band
> (relative to main execution function) messages. Messages are backend
> defined and flexable enough for any use case. In Xe we use these
> messages to clean up entites, set properties for entites, and suspend /
> resume execution of an entity [5]. I suspect other driver can leverage
> this messaging concept too as it a convenient way to avoid races in the
> backend.
>
> - Support for using TDR for all error paths of a scheduler / entity
>
> Fix a few races / bugs, add function to dynamically set the TDR timeout.
>
> - Annotate dma-fences for long running workloads.
>
> The idea here is to use dma-fences only as sync points within the
> scheduler and never export them for long running workloads. By
> annotating these fences as long running we ensure that these dma-fences
> are never used in a way that breaks the dma-fence rules. A benefit of
> thus approach is the scheduler can still safely flow control the
> execution ring buffer via the job limit without breaking the dma-fence
> rules.
>
> Again this a first draft and looking forward to feedback.
>
> Enjoy - Matt
>
> [1] https://gitlab.freedesktop.org/drm/xe/kernel
> [2] https://patchwork.freedesktop.org/series/112188/
> [3] https://patchwork.freedesktop.org/series/114772/
> [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
>
> Matthew Brost (8):
>    drm/sched: Convert drm scheduler to use a work queue rather than
>      kthread
>    drm/sched: Move schedule policy to scheduler / entity
>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>    drm/sched: Add generic scheduler message interface
>    drm/sched: Start run wq before TDR in drm_sched_start
>    drm/sched: Submit job before starting TDR
>    drm/sched: Add helper to set TDR timeout
>    drm/syncobj: Warn on long running dma-fences
>
> Thomas Hellström (2):
>    dma-buf/dma-fence: Introduce long-running completion fences
>    drm/sched: Support long-running sched entities
>
>   drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>   drivers/dma-buf/dma-resv.c                  |   5 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>   drivers/gpu/drm/drm_syncobj.c               |   5 +-
>   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>   drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>   drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>   drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>   drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>   drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>   drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
>   drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>   include/drm/gpu_scheduler.h                 | 130 +++++++--
>   include/linux/dma-fence.h                   |  60 ++++-
>   16 files changed, 649 insertions(+), 184 deletions(-)
>

