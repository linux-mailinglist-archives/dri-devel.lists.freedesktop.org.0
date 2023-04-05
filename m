Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B046D775F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE2C10E88D;
	Wed,  5 Apr 2023 08:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AD610E88C;
 Wed,  5 Apr 2023 08:53:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6nufPIft1yPvVJM9LiLSAeflg6gNE/EVbwAsBgQgAXIjxiUwgXDd794I00DL7jU78mSMxzcHfXEJ9S4+3909nn14N4i6yBiaC6O6BefMwhz1RDAkyZVOEqHng9mgF0cH5rgaJ91FUo6XN86ylDq8efqBAlXZA+PyUq6qTP1eXbqtPWZ6nJJRLMb6xmph/54EZo4bjm44XiVCOvBbV2Se8KkEzXfghfd7es+72nAevyJKN7a61ZBnIyTql7T5yhzIcjgUCNrm+gIvAslQahMpzf7y11jxgCFSMSOKXGoNzC7DzQV/Bpq9Fto7V72aI6rni9vapcfgOHsk1fdBcFADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytktUnGu5//0VGQ4ZICUEEcVHDYOM3xj3eSAT/D+wuw=;
 b=bejn5UvisyoRSf6INyJoII/Aukx1yRmz1cm40Ldy2CTSrG1PefMqcF/JzrEGjh5sHZhUG/nMbGcuQo/Z/bzwsR55bnZj1+2C5F36oC18BwvLlw1HgUsy4VAsdHFmY4W0Ko8612DVn8+NVtRpb/fZzZV3OOphFyScmT5ac/lc90yGIuPtgweRfMuaxcc97JX8Tyd9WdlGUfGMXr7yJF93JjoawIUUZC34ls35hPbhGzuUi6BHUSE5bPtZnzvT37lLlqFKtHcOhoTS4YvhWYsHf64l7YpEwBLfvDYlUJzFH4IhPDWqMYv2SskVe1B4CjUJAbNQYMu7zLOdhawo3iCXeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytktUnGu5//0VGQ4ZICUEEcVHDYOM3xj3eSAT/D+wuw=;
 b=rHdhuyYKaeSKmxL4w6whiC122oFJd8UD83Tg20LBem/Cbw1ldYzU2lZ5t1G5KMI/YoEj73tva3y9j1qtxgNl6fSRVlL8bn6YSEg5KVMs5Ddmp0pYOsG5JOIw1XFt7hJwR+pkOQaF6us6PYYggFFodWMq2aZirD2C+LfUaXUXIEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB7821.namprd12.prod.outlook.com (2603:10b6:a03:4d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 08:53:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 08:53:32 +0000
Message-ID: <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
Date: Wed, 5 Apr 2023 10:53:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
 <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
 <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
 <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bf2e21-69ff-483b-33f9-08db35b33b6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iKvNIjRlYKXjyDwS4dzH2wjTgCFWz1nCrSVyLVM1aJ/jGK4B7lXGUIggzB+LBgzrAONORFdtKcirTxSYuQJLBVNpRIyrI2RP4mBWxIXe7X2MODkdnlGkhAGkb9SdKAf8nDs6+aPPwRypPyAwO90QOcnzfa8p5moklUhozDJ61L9BhU4LiLu2jNg6XkVELF+1RdrIFZxZ2mtc4r3m45ViXl3tpRSBclitxIsIDrK5LikcF0hZOIkIW+rtr1qyJyY0Jtab9jzSKuNeWR+GpNCnFHJC17r9goYUqw4ImUJV0yDNVqEqdoPNpKiuNf9dP/dJh37Hj4wr4wuZqK8/PkYnksgeDhcLv+C9cy6pDq3MdgKVGEMaa2jigvVTN3IZHTRVPSSTRvCB8BMY2TzFpgue+sQ4yFoNOu4jDgMNAW8Wq0bJKmM/EPEwvVoUUBTPeJyJs1+7KjF/LiXxj/drhV92ehLXzz0FVfS6TBiNqzMFQNXUyAoCa/gy2pIn8eFtR3gvXo2qlitnsoUaQAw0TMKq+lT03DL5NIbfnqao70H8cJUXBtt4KdF3SDMbOFpUrf1BR0UbtC/VJC6/rhrl0Jjis/pZ+4s1jNK8SHZEr96Bito=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(4326008)(478600001)(66476007)(8676002)(6916009)(66556008)(66946007)(6512007)(6486002)(6506007)(966005)(86362001)(6666004)(2616005)(31696002)(36756003)(186003)(66574015)(316002)(83380400001)(7416002)(5660300002)(8936002)(38100700002)(2906002)(31686004)(66899021)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZVZ0ttRkdvVkNIUU4rU3YvVHVvV0hwbWRxdWdHajZmcHMzM1dCaEZuL1VX?=
 =?utf-8?B?c0paNldvREJzaGhZMGJpa3VSZ3ZibG1SSE1JTlRsenBqM1dlcTg3RnE2QXZX?=
 =?utf-8?B?VFJGZGJ4OFlTQ3hwM3ZrNXFVY3J1Ujk2b0ZRb3lCK3hqaUdJc0Q3Vk5Sclo1?=
 =?utf-8?B?UVdMMFRoYmxOeVRHV2IrNFp0Mk9vZXV0UlordUZxUWpsY3NYendTcFp2akdN?=
 =?utf-8?B?S3IxTmhIOE9MdERCd2REcFJnUEZXVEpWcDNYMFNUUGN0U29qRHpXWWJhSnFa?=
 =?utf-8?B?cE1TajRUVXcxQmFwR1oxUDBiZWgxZ1pXT2NCRkdmOGVpSzV1V2pFUTdKY2x2?=
 =?utf-8?B?S2RySXpUdjFwUlpOMkFKbGpKaUFZS2w1aEJNUnp3NUtTZC83MU1naTQvSDNv?=
 =?utf-8?B?b29mVGZXUzNFcmZOdUswYlVXN3ptTVc3WGhZcHk1a3BOYlEyeGRwUmp6ZlZo?=
 =?utf-8?B?V3A5KzRSWDFQS2libUdURXZnVENXMzYxWElSY3ZtK2F0RGhGeTR0dWxDRnE2?=
 =?utf-8?B?OVB0T1VzcUk4Z01KbkgyTi9mODNmbjZoanpQMXMreUNVOUF6SjZyN29Ca1Ra?=
 =?utf-8?B?aHNJZUJneTdPbFh4VFg5QmFXV1ZnU3NEeWN3WkFvT2NwY05lSHd2WTQzRFVV?=
 =?utf-8?B?VWt3Z3p3a0RObVQraFB5c2VvOGtOaFEzby9pOGZNZFVRYWc5RnFZSEI5c3Jn?=
 =?utf-8?B?MWJiMERpMlpsbm9LZUFPTXJYWEJ6MWZFRFNnSkxaK28zVEZyWWdDK2o2RFF1?=
 =?utf-8?B?SkR1YUVtTlJaeXVxQkhqdVAvVmVHcjRENmtWOWVWejRydzVSTTA3d3BWRnJ5?=
 =?utf-8?B?Q1lKSElYeDFmbURrMEpld0JGVEtpNFo5WVVGZjZkeEJzbkw4M2IvSkdEQnlw?=
 =?utf-8?B?VytiVTVpZGRtZE1ZQmVyT3EzYzloOWpEb2xHRjR3RDdoQjh6SlJFRENOejI0?=
 =?utf-8?B?a3g4UVk5d09WVXdISEM4QjFiNXZMQVltSmwreUwzWXFibDVRbEVvOTZRRnI0?=
 =?utf-8?B?eUhpMDVKM3E3TjBDVUUxSGlrZFBVK09OVG9iczI4V0RsamtyelNXYWNxNDND?=
 =?utf-8?B?elBUWnhDSWZDUjZpNHkwSTViSld4WUYydWNNMFVsUWhBb21iaTJSZ2VVVW1v?=
 =?utf-8?B?dGVHSUIvVkxqKzRHRENUbWhINjRIL1FNVnBmN2djeFY4Q3lMUjdJQXEybzNE?=
 =?utf-8?B?dFVYeWtCMWphS25HWDMvQ3lRTTcrZVRsUlB2UG5kYk9NWjI2SWpaK1gvd1B2?=
 =?utf-8?B?Nzk0WVlxNVFQR25mL1N2RVNQdU1XNUMxeXAvNkEySVNzT3ZnQTdtcXRRZFFI?=
 =?utf-8?B?dmhEUkFGdTVmRHozSHluUjBVeHNWekhGMk5HWjc2ejV2SmFQekFvVU9pMUd5?=
 =?utf-8?B?d3lyQlRQRDdkWUo1TkZjcTJEQVBNRUJOanI1dyt6QlNadU51WXg5dUh6Tmhy?=
 =?utf-8?B?U3NDcDZ3bGYyYzRsaklZamFzU3BiN3hBTGRuMHplNHd6WGZsZ1QxVFB0Zm5v?=
 =?utf-8?B?RzZ3UEordHRpMW0vbXhMc1VQR3ZDT2kzK1BXVmZlL2FlblRNMmVkdEFtU2Fl?=
 =?utf-8?B?Z0REVGh5WHBFV0FEdjBBUmVkb3ljZlBiZ3VESW5MUm5LbmViTnFJWDdsdFFr?=
 =?utf-8?B?SGpubzVrQXRMYkdrYzRSYlltaTl3M3RncCt6KzdSaG5wOXh1N0dYVUVEckQw?=
 =?utf-8?B?bWlJV0NlS1h1UnBrVGs1UEtYMjlUQlRudlZSNDk2NTc0MWxPbTM5ZVJFZjhJ?=
 =?utf-8?B?K05GMjJ5UzRaNSt0RkEyZUFiZWx3UlNsRDYwZnR5WlIyZmhXTmJ1cjFTR21D?=
 =?utf-8?B?OXh3M09LZjhNZUo1V3B6QkhQZmNpdTJ6VnZkVFRpQ0lHUkhnNlUzaXhvOTlT?=
 =?utf-8?B?RzVCOGNvbVpTaVhWQlFLUXhxT0JlQm9QOEFQOEVaSVZCenNnSkVrWjA0NW9T?=
 =?utf-8?B?V29RL0NrajFNQ3RtS1dVaU96dWd1Tys5MjZ0elYxVW9HY0N6MUdWZ2dpUENE?=
 =?utf-8?B?bTkzM0NFWTFlOVVhWHJDZU1QL2RRZ1lPZWdwQkx1SUFlM29BNUN2VXltQ1g3?=
 =?utf-8?B?WVVaejhONjNDZExGYTlCaU42OEwwZTlEN1FNUzh3RlFSQXFoclViZlNCZktN?=
 =?utf-8?B?SVdHV0JEbUNMV0hRSmxCL2tlbXkycnpZWnNsZGNKZVY0OUs2SG16cDNzbkpG?=
 =?utf-8?Q?CabnPqlPi9AY5NUUwv18dx0E3vhjd4Vkrk3A9vdCqbV0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bf2e21-69ff-483b-33f9-08db35b33b6e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 08:53:31.8136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyePXbNtP0G5f8U1umLf95yU2s1Tl4e83uEAsiVdCNjMb1CxQOTct7kPcqQQXiUQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7821
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.04.23 um 10:34 schrieb Daniel Vetter:
> On Wed, Apr 05, 2023 at 09:41:23AM +0200, Christian König wrote:
>> Am 04.04.23 um 15:37 schrieb Matthew Brost:
>>> On Tue, Apr 04, 2023 at 11:13:28AM +0200, Christian König wrote:
>>>> Hi,
>>>>
>>>> Am 04.04.23 um 02:22 schrieb Matthew Brost:
>>>>> Hello,
>>>>>
>>>>> As a prerequisite to merging the new Intel Xe DRM driver [1] [2], we
>>>>> have been asked to merge our common DRM scheduler patches first as well
>>>>> as develop a common solution for long running workloads with the DRM
>>>>> scheduler. This RFC series is our first attempt at doing this. We
>>>>> welcome any and all feedback.
>>>>>
>>>>> This can we thought of as 4 parts detailed below.
>>>>>
>>>>> - DRM scheduler changes for 1 to 1 relationship between scheduler and
>>>>> entity (patches 1-3)
>>>>>
>>>>> In Xe all of the scheduling of jobs is done by a firmware scheduler (the
>>>>> GuC) which is a new paradigm WRT to the DRM scheduler and presents
>>>>> severals problems as the DRM was originally designed to schedule jobs on
>>>>> hardware queues. The main problem being that DRM scheduler expects the
>>>>> submission order of jobs to be the completion order of jobs even across
>>>>> multiple entities. This assumption falls apart with a firmware scheduler
>>>>> as a firmware scheduler has no concept of jobs and jobs can complete out
>>>>> of order. A novel solution for was originally thought of by Faith during
>>>>> the initial prototype of Xe, create a 1 to 1 relationship between scheduler
>>>>> and entity. I believe the AGX driver [3] is using this approach and
>>>>> Boris may use approach as well for the Mali driver [4].
>>>>>
>>>>> To support a 1 to 1 relationship we move the main execution function
>>>>> from a kthread to a work queue and add a new scheduling mode which
>>>>> bypasses code in the DRM which isn't needed in a 1 to 1 relationship.
>>>>> The new scheduling mode should unify all drivers usage with a 1 to 1
>>>>> relationship and can be thought of as using scheduler as a dependency /
>>>>> infligt job tracker rather than a true scheduler.
>>>>>
>>>>> - Generic messaging interface for DRM scheduler
>>>>>
>>>>> Idea is to be able to communicate to the submission backend with in band
>>>>> (relative to main execution function) messages. Messages are backend
>>>>> defined and flexable enough for any use case. In Xe we use these
>>>>> messages to clean up entites, set properties for entites, and suspend /
>>>>> resume execution of an entity [5]. I suspect other driver can leverage
>>>>> this messaging concept too as it a convenient way to avoid races in the
>>>>> backend.
>>>> Oh, please absolutely *don't* do this.
>>>>
>>>> This is basically the design which makes a bunch of stuff so horrible broken
>>>> on Windows.
>>>>
>>>> I can explain it in more detail if necessary, but I strongly recommend to
>>>> not go down this path.
>>>>
>>> I'm afraid we are going to have to discuss this further. Let me explain
>>> my reasoning, basically the idea is to have a single main entry point to
>>> backend - the work queue. This avoids the need for lock between run_job
>>> and any message that changes an entites state, also it really helps
>>> during the reset flows (either TDR or GT reset) as we can call
>>> drm_sched_run_wq_stop can ensure that nothing else is in the backend
>>> changing an entity state. It all works out really nicely actually, our
>>> GuC backend is incredibly stable (hasn't really had a bug pop in about a
>>> year) and way simpler than what we did in the i915. I think the simplity
>>> to largely due to this design of limiting the entry points.
>>>
>>> I personally don't see how this a poor design, limiting entry points
>>> absolutely makes sense to me, if it didn't why not just call cleanup_job
>>> bypassing the main execution thread (now worker), this is the exact same
>>> concept.
>> Well then I strongly suggest to read a few analyses on the failure of the
>> message processing loop on Windows.
>>
>> Have you ever wondered why classic Win32 applications sometimes seems to be
>> stuck and don't do anything? This design pattern combine with timeouts to
>> solve deadlocks is the reason for that.
>>
>> The major problem with this approach is that analyzing tools like lockdep
>> have a hard time grasping the dependencies.
> wq is fully annotated and actually splats. Plain kthread doesn't, without
> adding something like the dma_fence_signalling stuff.
>
> But yeah if you block badly in the work items and stall the entire queue,
> then things go sideways real bad. There's not really any tools we have in
> the kernel to enforce this, since we still want to allow mutex and
> sleeping and stuff like that.
>
>> What you can do is to offload all your operations which are supposed to be
>> run in the same thread as work items into a work queue. This is something
>> lockdep understands and is able to scream out lout if someone messes up the
>> deadlock dependencies.
> I thought that's the plan here?

At least from my impression that didn't looked like what was implemented 
here.

>   Or at least what I thought the plan was,
> and why I really think we need a per engine worqqueue to make it work well
> (and also why I suggested the refactoring to split up drm_scheduler into
> the driver api struct, which stays per-engine, and the internal backend
> which would be per drm_sched_entity for fw schedulers that round-robin gpu
> ctx on their own).
>
> Also maybe we need to allow drivers to pass in the workqueue like we allow
> for the tdr handling already, since that simplifies the locking.
>
> At least for intel gpu I think this message passing design makes some
> sense because fundamentally the fw only has a single blocking message
> queue. And so intel/xe fundamentally needs to deal with the "stupid code
> might block forward progress for everyone" problem you're describing, not
> matter whether it's done with the help of drm/sched infra or not.
>
> I do agree though that we shouldn't encourage drivers to use this which
> don't have that kind of fw command queue design. So maybe a huge comment
> to explain when (and _only_ when) it's ok to use that message passing
> would be needed, and explaining why in other cases it would make things a
> lot worse?

I would approach it from the complete other side. This component here is 
a tool to decide what job should run next.

How that is then signaled and run should not be part of the scheduler, 
but another more higher level component.

This way you also don't have a problem with not using DMA-fences as 
dependencies as well as constrains for running more jobs.

Christian.

> -Daniel
>
>> Regards,
>> Christian.
>>
>>> FWIW Asahi liked the idea as well and think it could be useful for AGX.
>>> Matt
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> - Support for using TDR for all error paths of a scheduler / entity
>>>>>
>>>>> Fix a few races / bugs, add function to dynamically set the TDR timeout.
>>>>>
>>>>> - Annotate dma-fences for long running workloads.
>>>>>
>>>>> The idea here is to use dma-fences only as sync points within the
>>>>> scheduler and never export them for long running workloads. By
>>>>> annotating these fences as long running we ensure that these dma-fences
>>>>> are never used in a way that breaks the dma-fence rules. A benefit of
>>>>> thus approach is the scheduler can still safely flow control the
>>>>> execution ring buffer via the job limit without breaking the dma-fence
>>>>> rules.
>>>>>
>>>>> Again this a first draft and looking forward to feedback.
>>>>>
>>>>> Enjoy - Matt
>>>>>
>>>>> [1] https://gitlab.freedesktop.org/drm/xe/kernel
>>>>> [2] https://patchwork.freedesktop.org/series/112188/
>>>>> [3] https://patchwork.freedesktop.org/series/114772/
>>>>> [4] https://patchwork.freedesktop.org/patch/515854/?series=112188&rev=1
>>>>> [5] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c#L1031
>>>>>
>>>>> Matthew Brost (8):
>>>>>      drm/sched: Convert drm scheduler to use a work queue rather than
>>>>>        kthread
>>>>>      drm/sched: Move schedule policy to scheduler / entity
>>>>>      drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling policy
>>>>>      drm/sched: Add generic scheduler message interface
>>>>>      drm/sched: Start run wq before TDR in drm_sched_start
>>>>>      drm/sched: Submit job before starting TDR
>>>>>      drm/sched: Add helper to set TDR timeout
>>>>>      drm/syncobj: Warn on long running dma-fences
>>>>>
>>>>> Thomas Hellström (2):
>>>>>      dma-buf/dma-fence: Introduce long-running completion fences
>>>>>      drm/sched: Support long-running sched entities
>>>>>
>>>>>     drivers/dma-buf/dma-fence.c                 | 142 +++++++---
>>>>>     drivers/dma-buf/dma-resv.c                  |   5 +
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +-
>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  15 +-
>>>>>     drivers/gpu/drm/drm_syncobj.c               |   5 +-
>>>>>     drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   5 +-
>>>>>     drivers/gpu/drm/lima/lima_sched.c           |   5 +-
>>>>>     drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
>>>>>     drivers/gpu/drm/msm/msm_ringbuffer.c        |   5 +-
>>>>>     drivers/gpu/drm/panfrost/panfrost_job.c     |   5 +-
>>>>>     drivers/gpu/drm/scheduler/sched_entity.c    | 127 +++++++--
>>>>>     drivers/gpu/drm/scheduler/sched_fence.c     |   6 +-
>>>>>     drivers/gpu/drm/scheduler/sched_main.c      | 278 +++++++++++++++-----
>>>>>     drivers/gpu/drm/v3d/v3d_sched.c             |  25 +-
>>>>>     include/drm/gpu_scheduler.h                 | 130 +++++++--
>>>>>     include/linux/dma-fence.h                   |  60 ++++-
>>>>>     16 files changed, 649 insertions(+), 184 deletions(-)
>>>>>

