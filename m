Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0D6D75B6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 09:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E1510E031;
	Wed,  5 Apr 2023 07:41:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9811910E856;
 Wed,  5 Apr 2023 07:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9z9XApDGnYNos6FxdxkMlReE9x9oog5jancnCTiIIN6/0UgsvdhRe2pU22DoOxZxkjwTXv02iIdGHeMKAZFPLpob25sCYloltP1lrZFNdwEM2hPjAbUVGa4EOSjQHDI/wI1qKkgul42UcwetWoZCJFvBZ5/O7T2tz6kBf7nf/+ZVXiWKekO26XTPSQdB0juN/Vdu+xpMEDjZkhi+W89UXBUEWX2DdiSjUD6MfUVIeBaUF398I+cKgOTIx7Rk+4SotwQvj6seRC0FR/WxxVDRSgpDbePu8DyLKPh4VSVyzUCnY0TsRHLEzp2tIR5qJ8rycoVhHfbN+2VeZ/hmnhIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVezkNDuJBWxOjFdDIEi8VU1pBEn58EfinTnoXlLlZo=;
 b=GTHzqsicXmfux3pedLKQvXoaAQK+YkeAOl8sRnoJQiv3lvwK/NZDKLlo1vM7Qm045JqEpZq4bDQVyRDUMZHbvoOUQgDfG42L5hBAqBBPGebwRgdAF/7rhYrVBlnB+L1DjAPuQcqZGrWX0m5/GzWmdHEY1jbXVOpiGJ6q7LXJDjOaUUFbllMy2d5ksKgDtyX6WV6VOAlKcsujrxXSRD+Bc4CGY5ocxQJI6uMOVURS1ELanPDwXdhe/yd46Yktf718hJ7YW9RycnLjv/Y0E0mW2so6gJg4A6KjWmZxQY/IZ1PNZzDbABsnetAqJ7aF3IrauMGfa/TndY9gUaY9Pm9+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVezkNDuJBWxOjFdDIEi8VU1pBEn58EfinTnoXlLlZo=;
 b=FLCeujIdCUB6uk2xXJNYO+A+TH1/AWg4xattPRNIiWRw60fEWlJuYVjpQ6ct3kuiXzBTQC0GhjW6TxQs4JsGbvBAnqNMV3RDWIrmOCOJ7zMCf91b5/zg0H5eT2zdXI6uAwAcUR6eM8pva2eDMFEaLxlZNMcdDJbCJdx9z4x2d6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ1PR12MB6364.namprd12.prod.outlook.com (2603:10b6:a03:452::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 07:41:28 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 07:41:28 +0000
Message-ID: <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
Date: Wed, 5 Apr 2023 09:41:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
 <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ1PR12MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 487a7e0d-22bc-4ad4-8521-08db35a92a97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qUYZFNuIN93RWYTZBRhTYgbGys14Uy/W5Mqzsj4DuFbMRhqbMUufiYFL5mn/8pCFafH7lEWS3p9VkB4TTs+fikzhDAvRW+5PwYxvK0bgF84Yc6UVPHcDk7muHyGhw7PiFgTjPNlU8aoctSW1u7UwP4/qbs+pe5wSZti6cvGdaMkJeipgzJD9iYaS5TcvEsnkedHqeUSqf3LiWWH2mccOMjki50AKg9XQ63QD94ReqmXRYy09C2n6483nTBEdAsWoeDNkyQx36fUDm0dNcYe3PsXkBPnRmCYyefE73TM6N59OuELkhan2K8LVO+jhJv4zRNIWRtipeFCrXBKQsGf499QDSJSyxC8ol5pP4qANZwaPjK0JFdaIBpWjzz/6lJmn4DH+1PEvjajxdCX29S2A2r9pmJ30emcFMg4gWpyqhkS00VXY2LbTZGMooW/cUfEv16Z0UDAIA+P29ioJsflEiJROwbWX3vXb+r/4S0YUoRUJm9O77AutMFh4JmgFUXjx7r0RIFztlrrf5LFxrTOrZ5dK+pSwX/ZOzGrH7tWfaDmpasuMw2hPWSKGnABfsq0B1vUtsxYtUTsu2qIyMdnoD0+zv11ZW43aTkb6sB4W+F0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(366004)(396003)(451199021)(2616005)(83380400001)(966005)(478600001)(6486002)(186003)(6666004)(316002)(6512007)(6506007)(2906002)(5660300002)(36756003)(38100700002)(66574015)(66476007)(66556008)(4326008)(6916009)(41300700001)(86362001)(31696002)(66946007)(8676002)(8936002)(31686004)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djVaai81eUVWMFdZTDZxQWt6TCtNK3VwbXU1YkFvaDJaV3pSaE5pdnJpeWJ5?=
 =?utf-8?B?eUE2dzlLc1BFU1pQSUFKYUZKc0N2QlNYYkc4dWQvNmhVRWIrSU9ubkFERFJ4?=
 =?utf-8?B?andhcklYd29ET00xVHk3MStBRElheTI4SE03QmdSRktscit5VTY3Ry9GaTJw?=
 =?utf-8?B?d3cyOHA4WVhSdVZsQ1MxaUZGc1pGdE1sSzN1YkpHZlU1aCs2WTBUYkZHZ1Nw?=
 =?utf-8?B?aHlybU5kaXZYb0R3dWpsTVRWTTJKRUJZUjJjM3FaM3MraVVRdjZYWnFCc1Ji?=
 =?utf-8?B?dEdOMnZJU1NGK1c3YkQ5TjFFOHRDUWZwUHlDSGdDSTNCMDkzNTdQV1A3WUta?=
 =?utf-8?B?ZTc2NDhlSUFjVTQ1WVpXNEUrQmpXMldRZWNMQ3R4OVYvZHZRUW82aldtQmJh?=
 =?utf-8?B?bE9QOXJqbWk4WDM3MVNtU2xzUUFIUlJUeFlpYnM5TGIrdnFkOTRvbTM0R0Ew?=
 =?utf-8?B?VnVRT0Ixci9tS1VVQVI5NWlqSDE4U3FReXJYQzNXSE42RFFEZmNpOExRa0Nj?=
 =?utf-8?B?M0k5M0dXQ0FwdXBPNG1JOStuQ0xXdWVFSkpGSERaSjl3UmJkNU9TWEI2Y2do?=
 =?utf-8?B?Q2lHeHUyRWdOaU1EV25jLy96dXBReW9LL1RkakZEbnFWaXJqUmF6RnIzNkNQ?=
 =?utf-8?B?b3ZSZEJ3c3lDRGN3SkI0TTZEMUJvWlJKMitkMnRSZlQ0TWlFdXhtNHZlUDAy?=
 =?utf-8?B?NU1CZE9pa3BPYXl0eC80eTNUTXpCWE5SUjhTZ05JL0dsNkpkaUZtUEQwSUxw?=
 =?utf-8?B?S0ozckNXdzBxWjU0ZDZxL0NDaXdtWEJPcmplUWR6dEs5NElpZFBEVlMyZFVt?=
 =?utf-8?B?M3VZeUx2NDFOZGJONXBIWjE3empqemxLWmMySll4dVBJZFlFakpCMkl0ZW84?=
 =?utf-8?B?ZlZURjVac2NZVVNiK0dBT0dFYmJHU2YxVllhbzBGWFRnSmdoUFYzaVg2VmJ6?=
 =?utf-8?B?bUlmZHJSY1I1R1dCMk9JMXZuSzVBVElrcE9oV0Y0VFd3VEFrV1VqWjJwZy9B?=
 =?utf-8?B?ZkhIeUxyMnRMSjlNOXdqSnRpbkR2bW5oUDBmaDlPOEd5Z3lRWDBmN1oxaENj?=
 =?utf-8?B?MjdqdjBQdHhSRTBocnlzTmxKSkIwTTZwVHY0UTR6b2tsZ3RIM2ZDcnRwZURk?=
 =?utf-8?B?aWVkd2E5eEUwc1VTWmZ6Tzc2V2hTWXVmNG9NMlV0Zlo5R3hCUkc1TWN3SDdo?=
 =?utf-8?B?RlJqYkRrRmY4WVEzamJxSEhXeUd5Y01pRjAxU1dwWEdKSG9OR2xwc04zaXFm?=
 =?utf-8?B?L3FwZ1lnS2FNblRXeW5LSTNlbFRNaFZGMXlibEFkcDdTRHRsV1pUTlVNZ2xS?=
 =?utf-8?B?NDR3dlRNUmVOZVQ5SHNlVU9yOEVTQ2UwVThURmI5Z1p6a09Sb1VnSEFnQi8r?=
 =?utf-8?B?MFVZTmhTaVNoWmZ6Z1c1cmp4ZURMTlpiWHFXZHQzQ3JXYWxmdTJVaURwQm5H?=
 =?utf-8?B?Yzd3Yi9idC9WTlZsb0NHT3U1MVpxZVlxbGdjbW5qZnpBUEZMcUJqS01FVjVT?=
 =?utf-8?B?QSt4T1k3TFhKRHBCdmJvempFVWRmSmZLVDZ3ZFgyUnZmVFRsRnlZc25vdE5i?=
 =?utf-8?B?dUFWR1NDN281MXdlZytySzE3VE1jUldoRnp0V3RRbWk5Q3VVUmczbk0yaHda?=
 =?utf-8?B?Y1JhaXQvbVdiUmpMMXJKTDBOYmNYd2JXMEJyOU5PUWRCOEJCblR2U21LZUQv?=
 =?utf-8?B?VFErbmNUSi8ralRqaFJKRlp0M2RZOWg1Snl1MkVJbmdDWHBkQVljKzgyWkY3?=
 =?utf-8?B?M3U3RnJtOTQyTnVyMlpVRCtQZmZZM0M1Tkp5MkwwZjM2L05LUHZjckZDcjFr?=
 =?utf-8?B?ZGExalNLbGVNaUN2Y0RuV3lPT2FKRzRWVWdYWWN5ekxtL3p4Wm53NkhkNklm?=
 =?utf-8?B?MWVmVnlTMzlMVnk2alIxQzFUVHU3MG9DMVlLSVVaemRxWDRjYmhDbG1FUWk5?=
 =?utf-8?B?L1MxVml3VHp6dHlnSUVSdVR3N1g4UDYxd2hNQ09LTWViRWVCa2JEb0tFL0tZ?=
 =?utf-8?B?SS9VdzRMajd6YVZNTkY4UERiWnNERGZML0ZiRlFId2NrbU5xdzBYV1lWcWNL?=
 =?utf-8?B?Z3U0clBkaEQ0KzVPQ1NlaGNnVTRSTWVPR08yNkJ0c0Q5Vmx3Wm82MVFXL2Vy?=
 =?utf-8?B?WW5xUU1pL2RGRXdNZ2hVWEpsOWtEekVPcVQ0TXN4SVhJYmtEZUgwN1pKWDRu?=
 =?utf-8?Q?2ItGF9NEBkOOdbcduXFsFThqZhzm8bYWPiatieK9RQfs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 487a7e0d-22bc-4ad4-8521-08db35a92a97
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 07:41:28.5326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+kk7+hgo5/efTIZS04qZ3ws93WzhEB9ItBsg1VFHCPSd2W8odlBb7Wxt+Hmbtrb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6364
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
 lina@asahilina.net, dri-devel@lists.freedesktop.org,
 boris.brezillon@collabora.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.23 um 15:37 schrieb Matthew Brost:
> On Tue, Apr 04, 2023 at 11:13:28AM +0200, Christian König wrote:
>> Hi,
>>
>> Am 04.04.23 um 02:22 schrieb Matthew Brost:
>>> Hello,
>>>
>>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>>> have been asked to merge our common DRM scheduler patches first as well
>>> as develop a common solution for long running workloads with the DRM
>>> scheduler. This RFC series is our first attempt at doing this. We
>>> welcome any and all feedback.
>>>
>>> This can we thought of as 4 parts detailed below.
>>>
>>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
>>> entity (patches 1-3)
>>>
>>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
>>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
>>> severals problems as the DRM was originally designed to schedule jobs on
>>> hardware queues. The main problem being that DRM scheduler expects the
>>> submission order of jobs to be the completion order of jobs even across
>>> multiple entities. This assumption falls apart with a firmware scheduler
>>> as a firmware scheduler has no concept of jobs and jobs can complete out
>>> of order. A novel solution for was originally thought of by Faith during
>>> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
>>> and entity. I believe the AGX driver [3] is using this approach and
>>> Boris may use approach as well for the Mali driver [4].
>>>
>>> To support a 1 to 1 relationship we move the main execution function
>>> from a kthread to a work queue and add a new scheduling mode which
>>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
>>> The new scheduling mode should unify all drivers usage with a 1 to 1
>>> relationship and can be thought of as using scheduler as a dependency /
>>> infligt job tracker rather than a true scheduler.
>>>
>>> - Generic messaging interface for DRM scheduler
>>>
>>> Idea is to be able to communicate to the submission backend with in band
>>> (relative to main execution function) messages. Messages are backend
>>> defined and flexable enough for any use case. In Xe we use these
>>> messages to clean up entites, set properties for entites, and suspend /
>>> resume execution of an entity [5]. I suspect other driver can leverage
>>> this messaging concept too as it a convenient way to avoid races in the
>>> backend.
>> Oh, please absolutely *don't* do this.
>>
>> This is basically the design which makes a bunch of stuff so horrible broken
>> on Windows.
>>
>> I can explain it in more detail if necessary, but I strongly recommend to
>> not go down this path.
>>
> I'm afraid we are going to have to discuss this further. Let me explain
> my reasoning, basically the idea is to have a single main entry point to
> backend - the work queue. This avoids the need for lock between run_job
> and any message that changes an entites state, also it really helps
> during the reset flows (either TDR or GT reset) as we can call
> drm_sched_run_wq_stop can ensure that nothing else is in the backend
> changing an entity state. It all works out really nicely actually, our
> GuC backend is incredibly stable (hasn't really had a bug pop in about a
> year) and way simpler than what we did in the i915. I think the simplity
> to largely due to this design of limiting the entry points.
>
> I personally don't see how this a poor design, limiting entry points
> absolutely makes sense to me, if it didn't why not just call cleanup_job
> bypassing the main execution thread (now worker), this is the exact same
> concept.

Well then I strongly suggest to read a few analyses on the failure of 
the message processing loop on Windows.

Have you ever wondered why classic Win32 applications sometimes seems to 
be stuck and don't do anything? This design pattern combine with 
timeouts to solve deadlocks is the reason for that.

The major problem with this approach is that analyzing tools like 
lockdep have a hard time grasping the dependencies.

What you can do is to offload all your operations which are supposed to 
be run in the same thread as work items into a work queue. This is 
something lockdep understands and is able to scream out lout if someone 
messes up the deadlock dependencies.

Regards,
Christian.

>
> FWIW Asahi liked the idea as well and think it could be useful for AGX.
> Matt
>
>> Regards,
>> Christian.
>>
>>> - Support for using TDR for all error paths of a scheduler / entity
>>>
>>> Fix a few races / bugs, add function to dynamically set the TDR timeout.
>>>
>>> - Annotate dma-fences for long running workloads.
>>>
>>> The idea here is to use dma-fences only as sync points within the
>>> scheduler and never export them for long running workloads. By
>>> annotating these fences as long running we ensure that these dma-fences
>>> are never used in a way that breaks the dma-fence rules. A benefit of
>>> thus approach is the scheduler can still safely flow control the
>>> execution ring buffer via the job limit without breaking the dma-fence
>>> rules.
>>>
>>> Again this a first draft and looking forward to feedback.
>>>
>>> Enjoy - Matt
>>>
>>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
>>> [2] https://patchwork.freedesktop.org/series/112188/
>>> [3] https://patchwork.freedesktop.org/series/114772/
>>> [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
>>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
>>>
>>> Matthew Brost (8):
>>>     drm/sched: Convert drm scheduler to use a work queue rather than
>>>       kthread
>>>     drm/sched: Move schedule policy to scheduler / entity
>>>     drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>>>     drm/sched: Add generic scheduler message interface
>>>     drm/sched: Start run wq before TDR in drm_sched_start
>>>     drm/sched: Submit job before starting TDR
>>>     drm/sched: Add helper to set TDR timeout
>>>     drm/syncobj: Warn on long running dma-fences
>>>
>>> Thomas Hellström (2):
>>>     dma-buf/dma-fence: Introduce long-running completion fences
>>>     drm/sched: Support long-running sched entities
>>>
>>>    drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>>>    drivers/dma-buf/dma-resv.c                  |   5 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>>>    drivers/gpu/drm/drm_syncobj.c               |   5 +-
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>>>    drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>>>    drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>>>    drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>>>    drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>>>    drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>>>    drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>>>    drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
>>>    drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>>>    include/drm/gpu_scheduler.h                 | 130 +++++++--
>>>    include/linux/dma-fence.h                   |  60 ++++-
>>>    16 files changed, 649 insertions(+), 184 deletions(-)
>>>

