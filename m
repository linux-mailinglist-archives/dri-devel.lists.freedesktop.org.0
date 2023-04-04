Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3526D5B9F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 11:13:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E614A10E191;
	Tue,  4 Apr 2023 09:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4815210E191;
 Tue,  4 Apr 2023 09:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9P/vjcwGn+fSlMP+VQeh7FJX1wJ7rpTPTj0okRNH60l6ERkVg/UjuVPy627LzU8gVbFNiI8kfvwhZQz/X2f4oG2bx9rmK9nzLi9FsO/4OEpRw0zQCPS1XT52oVHZIWNfUSuSvvBMLleFLG0r7RLV0pADtj+aKPbOCtQvQSySVY8QJZxIKKY9zdfbcQTzkhN0vJl9RCfB2WIopy628Z1EltHqB7I0Iq4w6qIMnWr5W/QEAJpNTzATNYIce2iBGmsvlnTEO4wADNxaGtO0v7lK/zcNjJRnr32Rs6Y3Wou131udHeDf7Vx/KZzAs6u4p0f91OSmFm62AobYjO0mb8tgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFnUxUl2MZahA+wWJZ6/BwLCDBHkSLznIF6xlTT+vRc=;
 b=dQxZPIAcff6EjYZ6tq2AJvESVIjtu9BE6wklCpMT6zfitQdfcUiT0nZg8SJFNNt86zsTMNaP4x7jU8zix0PNxuLdA6F1JY6FJ4ip5XWb0+NCLq7vZfB7F9SbMSTrLztadI6OQKxKFJ4UDIuTGp2LU7xVdkb2GGwmgpgsb+Mu6j/lpipRDZoJ5nR6XebhaLURt4DDdlT4ZJ8JynhggFOlOOe5OazCEh5SRIhKTxa9X+86HExz3C+al6kYDu62gk8HNghLW6Q9v5MUGykStw+zyHpmTKRfbrNsG58YqDmgaioXMwzOC8wl2wuVI3vT+SWoo8iOtMM6EBwO08diUz5HGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFnUxUl2MZahA+wWJZ6/BwLCDBHkSLznIF6xlTT+vRc=;
 b=U4blxMtZS7bAJWoD/Vdcss+rGd8s2VZlyo59Nx3ESI8QCaTeCdHiNRpp2FCz8jRzIvZbwAH/HO7kYIEPk7/zhMvkBXMDCDYupRszPe1kVk+MqCrclfEYSlK9ts5GsDU/ZZa90q9nuVsjS0VTxkZTGZ2sRX78V5qUivNlHA4Xgsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 09:13:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 09:13:35 +0000
Message-ID: <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
Date: Tue, 4 Apr 2023 11:13:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 48d17348-627c-4d55-e00b-08db34ecde7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KNvWRa+NKnfB4Ey93HiWIR3xHOZzbSZeh9z25+Uthu+5YKzk0n5IhtI3XMkS6wE//zJXqnPX88LGDhFp6SzZ/rzkC/gEj9Ac527FuTC4G5atWcwW4wwQ2r5ddh+751C09L2IXBtTWMxZYNRolhxQBMfDAgjBVx3teId4s6YEbMr9oNDeEdDKPF45bE6RUvlbhAxd02aimjvl4YpTZhPevJmoyeOYQEeVCz5i33L7MKnZDLoZAvfjd3h8U5HHU4DvM5CcW+t7W0Zr6+MV+VOJTH6A8wESRfXCDSpqK7faHVROnRYowLVkCXmwRP5rvGrC0tCcVOSkWNClG5UKmW6OLt4bCwUrAuaaOIMggK/Arqn6qZK9kwx+fbsv12QROyNqk+H3PERvvyjWIQp2ogpRK1+2wOxn5k9QMfMDizf2dNFECf6lOesZqwQ0jeAWVQOPhsD7akSQ4T6KbYhQXi0Cg8OguFHeOqciq/WS4fXAdcHQwbIX42B4z3ZL4cNh/DFRJ6FDVHoLrb/DQiEBE7teStShUPu5NDx9Ju/ZzGbhSy3fxKobk56ZFwizfPge/82UJOnHERckh7FzWgOotB+wKZm1M/Y5ySfND1El08D2T+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199021)(4326008)(66556008)(66476007)(66946007)(478600001)(8676002)(8936002)(316002)(5660300002)(7416002)(38100700002)(41300700001)(66574015)(186003)(83380400001)(6486002)(966005)(6666004)(6506007)(26005)(6512007)(31696002)(86362001)(36756003)(2906002)(2616005)(31686004)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjN0NlZsQ3BCOGE1UFVqYmVEZkh2bkVraW5ES3ROOXpDRHZFQ0JDY2kyNWMx?=
 =?utf-8?B?N2xiYVhzZ2FOdXlsMndaVzVzQUUrd3liQmVLSkNGVVZCaldwcnNvL0VmNFF3?=
 =?utf-8?B?S3p6K0RBb0YrVGZ1UnpRekVoM0xzZ256TDJZdy9wb3YvUlNTdEhSM3I0Q0NR?=
 =?utf-8?B?OU1KWGRUMjNlTXU2dElrLzd2a3laNlhFQ1VHY1ljYW1mYXFuUzJHQUJ1M0lU?=
 =?utf-8?B?bW5iS3R3SHk2UUExOGlXaU4vbDhrQXR5aDNGaFNIdGlRcGhPcWVBSGQvL0pw?=
 =?utf-8?B?dURsNUozejlFLzVpaUNQaXhZN1NYVHNxcmwxVjBEaFRCZHB3ZjlNc2VZMi9x?=
 =?utf-8?B?TkZ1ZDNKSkZ0V013bExYdERNQy9UQ3dXcmIzMVJOY1VrYmRrSDhLQnZ5WVhQ?=
 =?utf-8?B?TWczWDJlNGpocy81U1o3ZzRRdEdSNnVUdmZjNXdHTmc0Z0U0ZHpWZkxEbkZ5?=
 =?utf-8?B?TFRobEl6bTlDa2ZWR3lhZ0tDNWJkQ1JTUTVUU2Z0R01lbUo3amhhdVFTclJ4?=
 =?utf-8?B?UmRQb2hLNVF1bjJva0cweWVONjhHRU56bHhMbFFkcmxKK2NWOFdrZ0JWOUNo?=
 =?utf-8?B?TlAzS3JubU1uVUpzbE1GS1QzUUptQUUydFNUZjBac3NSbkRpOUFaNVVCb0xS?=
 =?utf-8?B?ams5QStuaXk1aS9Qa3hQUmhHQnIycW56c1IvdXZOM0cwR0VueTcxVEpIYlY2?=
 =?utf-8?B?WUFIcHU0Tlc3UFV5L2MxUm01bFkwSmxFQ0RCQ2dRa3JoZ3NwYXZDclF2Q1Jx?=
 =?utf-8?B?UFlyb2FJaFFaaWUvdkJyb2laS3BDdXNucjdNUE4vOGV3VU9jSWwwNkVCbUl0?=
 =?utf-8?B?Z2h0aDNVdUtPT1NtdEJkeHBkZkZPdVZlYmJYeCtHTnpWOURDVzlPZU5GR3Az?=
 =?utf-8?B?Mkw1UnhvSEdKUFFzR0N0V1ljTnFzSnpocmhhRUF3STVuZ1h1QWNLWFBhL09o?=
 =?utf-8?B?YUdtQUxadmp4Q0JaR0RIbWdrdHJHSXJPdmM1M1pLRlV5YlFGMVZqdjcxcFJk?=
 =?utf-8?B?ZkF6UHVXSVlyYmpIa2x0ZE16aXQ4RU56eUlmSzIweVZvS1hScm05VXUzZU52?=
 =?utf-8?B?Tno0RkpvOFZIc3doWWZML2gyMUp3NmpDM0ZhZTFiMitVQndKaXZoM3pkdWNT?=
 =?utf-8?B?djloUWpDOTFSUGs0dS9rYytMVDQ3alZManhjNkZNbVNtSHFuRTVBQndKZkhm?=
 =?utf-8?B?ai9CN0dncTNiTmtpVjFGenZzUjBrc0R2WDgzT0M1N1orMW03aWxLekhrM2tI?=
 =?utf-8?B?WmVlWVZ3bXlORkJGbHRsaUJSckhpRnpzOXhqazFRUjJBaGVJdlJYU0dlRUha?=
 =?utf-8?B?U3M5TlVWUTdTUVZZbERGRlRGVDlJQ2FPN3cyK3lHclBMa3hPSm1Wa0hobFBi?=
 =?utf-8?B?Y2FEYmJDaFhlcC93VDlSTmMwVTVXMC9UMkMrRHlmNGJ0VzNHZmRPeEZlWkZn?=
 =?utf-8?B?dTZKaExXSVh4c0s4MHZ3YlRFVGd4UmowYXJ2OGJhMVJyZm9oQllHTEhDS1pP?=
 =?utf-8?B?eUMrZmR6NCtNSTU0SUptT2dqYU54V2U3c3JEQ1JWbS8rNU5KNlBmNHZnNGF5?=
 =?utf-8?B?M1pjbFFUMzlZN1EwbzhScXF0ZTlDNEFLa1ZueENvMjBqYlgzNWR0RzVwbyt2?=
 =?utf-8?B?MGF2YVpBdHhHZjZsSHQrMXd1UVlaWU1PWnFmRDM0cHVidkxRMG9aOSt5dThv?=
 =?utf-8?B?eEtOQnNqMGNiY3VwREZ1Q2RqekNlbk50aitsMEU1MXVXNjVqUGNCWmIyL0l5?=
 =?utf-8?B?d2EvZkdyMkJEcWh6ekRUM1c2dFJSS1lPa0IydlQ1bzNvVHNtQ2t3Nm91S21H?=
 =?utf-8?B?NVJRWW9LZkxXZ0tQZHhSUk4yS1MwRmErNDJ1Ryt0SDdHYmthbnFlTGJnYmVn?=
 =?utf-8?B?cVIzTEZaazZkVVEyd3VCbzBuWVA3akVIYkNobnV4cHM2aWszd1h6VC96N2I3?=
 =?utf-8?B?emZ5OHk5bFptTW9hSTdIblJsYjlyd3BjQ2JTMVF1Umh4Vkw3OWFkUlYzRDRK?=
 =?utf-8?B?dGJSaDFTNUNEMDJBQnZKRE9DQzJyM2JRaHU1NVU1elhzMHFsVi9mUUN6cmtm?=
 =?utf-8?B?OHJpaVpDT0NYK3JSSmhKWmhaZ2NTaUJZTXA0bWRMNVJvNHpYVTZzQTg1anNB?=
 =?utf-8?Q?vkj4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d17348-627c-4d55-e00b-08db34ecde7e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 09:13:35.5302 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuhoQctrtTzEB7NefZeftmAWZU/dlmow8IIS39NdmJba/EX0GBNOKZzkt/uFzsnN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264
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

Hi,

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

Oh, please absolutely *don't* do this.

This is basically the design which makes a bunch of stuff so horrible 
broken on Windows.

I can explain it in more detail if necessary, but I strongly recommend 
to not go down this path.

Regards,
Christian.

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

