Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAB06D5C51
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 11:48:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010AE10E637;
	Tue,  4 Apr 2023 09:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CC810E023;
 Tue,  4 Apr 2023 09:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dog8gECMUCF0JAdjcc+eM4tpU642Ykqz3TGD+LWKFJ//dWnLleXbf5lqejBnXCG5r3nEuLr0yVW6MRpEGhdoqsvvmDFdaFm+bllYSSEybCyxnhJ4J8Dnnh0gUX7xfymuWUCLut1BPzfVyLkA3IQYU5GSAuQw6lclcgcNodSmhYEjz58wVcOM9U/ur1iUAZ0cq8ZmJxOafPur/NiULGG2LJsmJ6So1uU5VnDEChuLQmrj0k4JG924q5JWlgl1XpERRQPd74W05ta9WdDmJfTweUiLsryPty/4lRAieCPcVlDLVFw6SmOvx7uPeLzmXy94mwnqhS1UIg0Oj13bfcz58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ED8RpyCjVwJX4HyL/edrAEpdbuxKGoGARbSd6Wew6Dc=;
 b=nmJroWsq4sB0X3/LwN6bbeSsZ6bsbxL6kRCNaVYhIC0dci+JxtKdjwiXzpbNT5iVW6NSexkSQFwNOXjT+YCkNCTUDmhlFL1Z3eSwGEc8+SuZGwGJVQIg/QTVK5l+9sLyDXYj85XXzy6r6FvMEwYR1FSb6Izv2TiGduyfmJNWoqolerBBH1u7hNHcRtL0Aj7q6kxazGCHi+PtDxBFHSzy52VHDeKLTMhYXqwm3Qo0GnKfb5g0FtV/OjfFMM6m+6eFZir1TYx8a+wZCVv9/CENHtymE29MhhQSjg7ZjMTOgOLKXWs9Ucp/q4WZMRDq1UB524O0CJU5Wq0m1uUvWhOG0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ED8RpyCjVwJX4HyL/edrAEpdbuxKGoGARbSd6Wew6Dc=;
 b=uecP2WI1X1FTaK5xnbjYVnRtRqxcl4hMOXRy6S3sROY+svsHKz9oj73O6s49TqKpHY5VwR3p0o4y1hj7G//WcsMykjaKIzZDh35UuepOMnBeZ0AjWifTrqJjFaQSxmieDxD0FeOZ94dDefz16AsNL6rlYZYkm3lYVe0pHs6gJrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 09:48:42 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 09:48:42 +0000
Message-ID: <20d1816f-9b0f-6caa-43df-ddc7ac40d5e7@amd.com>
Date: Tue, 4 Apr 2023 11:48:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <15dafc15-332e-2559-a9c4-61ad442ef44a@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <15dafc15-332e-2559-a9c4-61ad442ef44a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DM6PR12MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: 84422180-7800-4a36-8a6f-08db34f1c5e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pOENf34GGSmWSLEUrHTCl8ue3rzESD8YiCcTgJFdNwTa5eP1ipqWyL1WBM6W38VDxMEzmg0M/qwjXcgDThXemHaq9HX7qLtSrVGy4US0q24dX9I64gPV5SiWvt2bqwG3v9NMgDkoMgVhvRRVv3XnlLnnfBRV8ct/ajlLkGg/Wuq37lAj7zW/4jYcb3z6rjPiemah25sa7LxtonyL9hzOq7IDXdcxCbmKKL75tPTIecVPsQnn/wXAPT/UU1WRAw0QsLMKRR0CwuXwU3qeMyEc2dEXTG09WkXJepaGVGJ9zeBP6RCT2MYLPXcz3vGaJxjw6yQqxcxnjYkt3teJdyMh2Rgv039Pg3tbj1lbMCS3JEFzr0/Pc2z88w+tAQjjU9kz5jnExASdYOfr3HMxEh5Cni+E021dLpJZMQp5hXWrxgv1pCmwR4maID2+k5RMtxggigAHpxWCRL0rDiyD4jV+JOfKS/Vt67Z1hbIpCL6afyjk36R3fQAY7WxNElW6VixWsuiRtcAe75kakP3iw8og7dCaSs23TvF148cN15k6lmj51UJQG7GD8SOAmsztd/nPUQdJ3xwFa9bBKqdVG9xRBRRN5jKF8qNZrtwYyf8QRdA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199021)(66899021)(66574015)(31686004)(36756003)(7416002)(38100700002)(5660300002)(8936002)(66556008)(66946007)(8676002)(31696002)(86362001)(4326008)(41300700001)(66476007)(966005)(83380400001)(2616005)(53546011)(110136005)(2906002)(26005)(6506007)(6512007)(478600001)(6486002)(6666004)(186003)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDFCbnFMSTZhTkwwbW42VHVqZnRoU0FiM1hlS1FYZjgwWldnUVRmMjJ2S01K?=
 =?utf-8?B?SzJMUTBxNy82OVJKZXBYK3N6NmxXVTNrRTNIU1Z5V2J3bHNrbTRLdU5zRWRB?=
 =?utf-8?B?SGl6MkR5SzkyQ0p1VmxSMUtrbkpxOUhPUi9zc0tINm14TlQ4bDFYbjRBcXhT?=
 =?utf-8?B?Z1RiOURkN1RCMUVXOHJzek5YR0NXQUFHWDBDYnhtbnYvdEYxNU9Mc0tEYkU2?=
 =?utf-8?B?Y214d3U1YS9ObTdzSGEzK2I5UTRZc0VOV0RHU1hqOHdNYWZZN2dPSk91SXpL?=
 =?utf-8?B?aDkzTTQrcWNtRldKMTNNOVRUMmRPTTNMdlhQYW1xQ3RNZFFMbS85RTVxR2ZD?=
 =?utf-8?B?RnZRWFdTVGFpRi9sNmx6dmNSek85V21Bai9Sam1PMmw1MFl1V1N3WHRndHpZ?=
 =?utf-8?B?NnFjQzZyY0FTVHZEbWxQd3ltOTZuL25JWnlGTDNheldTa0VQOXVCUVBnRURp?=
 =?utf-8?B?TXJJSU5jZys4Z1FHSXkvZ1NhK3VHM1gvQ0ovdFNYSGlpdURIcThBUmdYRzl5?=
 =?utf-8?B?Wm5LZVowKzlHSVdYR3cxVXprL1F2MDV0NXF5N25rditEQVlZZjI2NTNLRVhJ?=
 =?utf-8?B?Q1hyd3ZrUnJ1QkZqd1VLUmszdjRlZzBFWDdVT1A3NTl0Zy9naUNQSFE3TWo5?=
 =?utf-8?B?SDdlalp0c1FzRlRvQ0ZpaGtFSlhYUzg1dE1wZmZwZ3NQQUYwYTZDYkJXREdK?=
 =?utf-8?B?V210aExuRk5uTWpITjlDbjV6d3ZhZHJ0ZlBUUUgzV3gzMkdvYTlydFEybUtn?=
 =?utf-8?B?QVluZ0Q3c2MvZ2x0SHRraHdaVWFseVc5NUdHTlpyREJtMGFwMDR2bmNyWU83?=
 =?utf-8?B?bkN2WWIvK0EwMCtSTGtiK1FRTTBWZStQeEUwanMwRThZM1lJeWlPcEI1UllS?=
 =?utf-8?B?Wk1tbDJSMGQvY2ZOT0YrdDlnbkVlcXNNNVJCdW9IWjBoakxZd3lGZFRNUVhH?=
 =?utf-8?B?c3hmNFFTbHd4MlBnMnBteStHVDBvRmtDdVdCNTNvTWVYaUFvSEJtVzhHNFJN?=
 =?utf-8?B?ZmFkeEtQYTJRWi9aK0IxSVpjd1JiWGpXTHlmTlJQWkh0cmcrck5vYjJSak54?=
 =?utf-8?B?L2VleHNIdFNWRzA5QzQ3clFUZCtvVnhETjNWU1NiTzh4NjAzSHNpQVgrNHFE?=
 =?utf-8?B?UGZsbkZmMzNlbklOalVrekFyV2JJWnBKbGNWSkJ5VlRTQWdPZjZmeUNaU3ky?=
 =?utf-8?B?eFlQVmE1VCtmYXJ3QVA2Q05hdnM3bzQwMFpaWitaVmppREw1R0ttSTRaQXJP?=
 =?utf-8?B?OUZGaFFzSDQ2VVc2QmQyaCtKQVdYUlpEOG8vdVF5NGFnS1NTdU5CMXc4WE5F?=
 =?utf-8?B?QUtWQzdlUEJ0R2doMm9RVkd5YXBhWHM2dS9BTGM2d00vVDJ6ZWsvSkk4ejAy?=
 =?utf-8?B?WXk0bEVEL0I4eUdiYVpSZDFqd013ZG95d0ZFUmZ0NzdLQ1A0a3pUTTlIcXpo?=
 =?utf-8?B?YUtjV04xd1NWbHNxbm5LZnI5VG1LQ09pbUllT1hmK21leWtaZzRRQ1NUUlAx?=
 =?utf-8?B?cE5YeGpFeU5pL0xDRmc1blNaczZEOHljZ2xPa1Y0ZjZLQ1h2WnErbTZXRUxK?=
 =?utf-8?B?V3lTL3gwU3BINWZlQTJyTjFnUnlZQXEwRkVtRmdZVFE2d2lUYUFKWjhaOVdC?=
 =?utf-8?B?RVlvUUhIV09qT3dORnFjamFIdWUraVlGR1Q4LzFqZEkzZHUxVzdROFh6c0dK?=
 =?utf-8?B?bVhoYU9NWURMSGFoZDVvQWdwbVovekRseXhDNkx1SjNkK0E0TnNpU1JtSng4?=
 =?utf-8?B?OFV3cWJhNlNxamNLK3YwZFdneXF0czNZcnpnTTdqZXF5aUZ2aFRKMHdnOGky?=
 =?utf-8?B?MG9rVVFsM0U2MnA2STVEazdUYW13MGd4WUljcjJiY3ZOS0hLY01uem5wWlBZ?=
 =?utf-8?B?NDZUOE9jV3NIRXI1M3BLeE9uWUhiaGN0ZlRlRVZ1VitZRVpzalZ1Y0N2SWhE?=
 =?utf-8?B?alVZTnQ4S1VGR2VCNS8rdUZKWlZHNkszTStwTzZMdDkvdytXNG9vNUhFMGhR?=
 =?utf-8?B?aThuYnN6ekJ1SFRvTE1vTnRmanA3bm5ZNWpjam5za09pYUR6bnpqeU1XSTJE?=
 =?utf-8?B?T0tVemVCanVXLzd1M0Rqakd1OHovQlVGSVlhTGNVclYyVkJXMWIvZjZDVUdV?=
 =?utf-8?Q?dvqY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84422180-7800-4a36-8a6f-08db34f1c5e2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 09:48:41.7106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YWc02RDKdl/YiQbKWN2xaFSyIeF2eXsUEn142dPWLXm557/LMnMp7xnsp4JndUc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137
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

Am 04.04.23 um 11:43 schrieb Tvrtko Ursulin:
>
> On 04/04/2023 01:22, Matthew Brost wrote:
>> Hello,
>>
>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>> have been asked to merge our common DRM scheduler patches first as well
>> as develop a common solution for long running workloads with the DRM
>> scheduler. This RFC series is our first attempt at doing this. We
>> welcome any and all feedback.
>>
>> This can we thought of as 4 parts detailed below.
>>
>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
>> entity (patches 1-3)
>>
>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
>> severals problems as the DRM was originally designed to schedule jobs on
>> hardware queues. The main problem being that DRM scheduler expects the
>> submission order of jobs to be the completion order of jobs even across
>> multiple entities. This assumption falls apart with a firmware scheduler
>> as a firmware scheduler has no concept of jobs and jobs can complete out
>> of order. A novel solution for was originally thought of by Faith during
>> the initial prototype of Xe, create a 1 to 1 relationship between 
>> scheduler
>> and entity. I believe the AGX driver [3] is using this approach and
>> Boris may use approach as well for the Mali driver [4].
>>
>> To support a 1 to 1 relationship we move the main execution function
>> from a kthread to a work queue and add a new scheduling mode which
>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
>> The new scheduling mode should unify all drivers usage with a 1 to 1
>> relationship and can be thought of as using scheduler as a dependency /
>> infligt job tracker rather than a true scheduler.
>
> Once you add capability for a more proper 1:1 via 
> DRM_SCHED_POLICY_SINGLE_ENTITY, do you still have further need to 
> replace kthreads with a wq?

Yeah, I fail to see the need for that as well. On the other hand it 
would be really nice to get rid of the rq/priority design in general.

>
> Or in other words, what purpose does the offloading of a job picking 
> code to a separate execution context serve? Could it be done directly 
> in the 1:1 mode and leave kthread setup for N:M?

Well moving from kthread to work item is beneficial on it's own since 
the later usually follows the the source of it's queue. E.g. when this 
is triggered by an interrupt we run on the CPU of the interrupt and not 
have inter CPU signaling.

>
> Apart from those design level questions, low level open IMO still is 
> that default fallback of using the system_wq has the potential to 
> affect latency for other drivers. But that's for those driver owners 
> to approve.

Oh, yeah that's a good point as well. This needs some high priority queue.

Christian.

>
> Regards,
>
> Tvrtko
>
>> - Generic messaging interface for DRM scheduler
>>
>> Idea is to be able to communicate to the submission backend with in band
>> (relative to main execution function) messages. Messages are backend
>> defined and flexable enough for any use case. In Xe we use these
>> messages to clean up entites, set properties for entites, and suspend /
>> resume execution of an entity [5]. I suspect other driver can leverage
>> this messaging concept too as it a convenient way to avoid races in the
>> backend.
>>
>> - Support for using TDR for all error paths of a scheduler / entity
>>
>> Fix a few races / bugs, add function to dynamically set the TDR timeout.
>>
>> - Annotate dma-fences for long running workloads.
>>
>> The idea here is to use dma-fences only as sync points within the
>> scheduler and never export them for long running workloads. By
>> annotating these fences as long running we ensure that these dma-fences
>> are never used in a way that breaks the dma-fence rules. A benefit of
>> thus approach is the scheduler can still safely flow control the
>> execution ring buffer via the job limit without breaking the dma-fence
>> rules.
>>
>> Again this a first draft and looking forward to feedback.
>>
>> Enjoy - Matt
>>
>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
>> [2] https://patchwork.freedesktop.org/series/112188/
>> [3] https://patchwork.freedesktop.org/series/114772/
>> [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
>> [5] 
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
>>
>> Matthew Brost (8):
>>    drm/sched: Convert drm scheduler to use a work queue rather than
>>      kthread
>>    drm/sched: Move schedule policy to scheduler / entity
>>    drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>>    drm/sched: Add generic scheduler message interface
>>    drm/sched: Start run wq before TDR in drm_sched_start
>>    drm/sched: Submit job before starting TDR
>>    drm/sched: Add helper to set TDR timeout
>>    drm/syncobj: Warn on long running dma-fences
>>
>> Thomas Hellström (2):
>>    dma-buf/dma-fence: Introduce long-running completion fences
>>    drm/sched: Support long-running sched entities
>>
>>   drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>>   drivers/dma-buf/dma-resv.c                  |   5 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>>   drivers/gpu/drm/drm_syncobj.c               |   5 +-
>>   drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>>   drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>>   drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>>   drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>>   drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>>   drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>>   drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>>   drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
>>   drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>>   include/drm/gpu_scheduler.h                 | 130 +++++++--
>>   include/linux/dma-fence.h                   |  60 ++++-
>>   16 files changed, 649 insertions(+), 184 deletions(-)
>>

