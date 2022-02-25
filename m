Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9E4C3C39
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 04:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9198B10E1F4;
	Fri, 25 Feb 2022 03:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A4B10E1F4;
 Fri, 25 Feb 2022 03:13:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVj1vVjB1jN44JmniH8eSM6a32K4y38IghbS3R5ddKqRAzb5k5ro4hAzTjSwzYRCgqxryzp32haSfAexguuL5Ov3yYqUcQ6rOIxEtiwW7YEQ6CGKh4+eaDuelYQ74cDuzmcBSCUJgUh/M/CobnGVQGKGtqpYWLKDqTopbhtqfIeRbkS29tXO0yqjnmdtootiqG0kpmcM9YS7zoHBZaCvHOKD/uFc7s7QvyBP9nQNJWuZgj72qKoLoN08HXTn1eBdwEsTEb+iUifzt+V7prZjkJDM+VXLjnVrnH55A1ornkMjTpA5/cz36YE7PgDlClc1PXmA0ZP59+aOUUaaFQKxVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/XRR+4ypqnGjl/SB034PCN9HfbJM/E6oq+IdE13C4g=;
 b=NJAuz7CJx8Ww4jgMh1utqrOqeFwFaN9FRzkUxVnc+64YFeNdtJqL/agJxPz+gbwvaatV43mNc2ShRktQKZM7ZsdTjS21CF3tbzSjWFeSj5QvnBLCPSeGKwumixRYZ7ivq5bHmt+JoRD08j+MsEEeKpKQ1h8l6Og3hk55SLt3VJoNTuk2dHVYkecCfwDR6fPjllg0wskJbbcNqDadaYBFgT/k2JiL1TiXkpubm/Zz+TjXCgRdmuNiyCQIHexJH96cUw4lR6JlpvU+Tg4mKGX9G7PZzBjDav9K3XGvsteruEegYfUiVPa3GTnekMiWQ0HrmNrlTN1sz6TuEgOQJlLiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/XRR+4ypqnGjl/SB034PCN9HfbJM/E6oq+IdE13C4g=;
 b=zrdFK/IemnRSc60ssDh77wPAQFtyesrYGsHhBK3RMhYNM9MTBgKIUvTRAzLxwxR5j/tI/sthMpw9l43Hk6fuY2TrEwOjd7ZbVHeYMgFmU3OfYpLjsd+eKxEtPGCEmVjR76Q7kiHmpgQ2j2rXQhwz6yY+y4IjufS2/b9vjgSiLpI=
Received: from MW4PR04CA0212.namprd04.prod.outlook.com (2603:10b6:303:87::7)
 by MWHPR12MB1776.namprd12.prod.outlook.com (2603:10b6:300:113::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 03:13:42 +0000
Received: from CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:87:cafe::77) by MW4PR04CA0212.outlook.office365.com
 (2603:10b6:303:87::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22 via Frontend
 Transport; Fri, 25 Feb 2022 03:13:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT023.mail.protection.outlook.com (10.13.175.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Fri, 25 Feb 2022 03:13:41 +0000
Received: from [10.252.114.66] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 21:13:37 -0600
Message-ID: <7c07d1b7-e700-60f3-1114-f1386892e836@amd.com>
Date: Fri, 25 Feb 2022 11:13:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is
 ready
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-3-andrey.grodzovsky@amd.com>
 <d82ac1a0-d81d-9861-fc1b-8cc06017a2b5@gmail.com>
 <1d7cb471-c32c-416c-4336-317ee9f171ef@amd.com>
 <3752a89c-d468-8c39-03a9-37d592dae89f@amd.com>
 <48c207dc-cc7a-efda-a4a8-4f1f1a6511fe@amd.com>
 <BL1PR12MB514424A75728E78BC0E5B848F73D9@BL1PR12MB5144.namprd12.prod.outlook.com>
 <91b8771b-695d-b126-13ec-50dddd56f200@amd.com>
From: JingWen Chen <jingwech@amd.com>
In-Reply-To: <91b8771b-695d-b126-13ec-50dddd56f200@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b87612e-11dc-4ffd-e890-08d9f80cd36a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1776:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1776497219C355A17F817D6EB73E9@MWHPR12MB1776.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CgF+odoyXpufc9jWEvorschokhEXd/1D4fukZcxWhUkiazr/EFtsP6uZgsSNXh5YX/ICrFQNCcneBxTyjAV3ekL2LGNjdl43y2MMueG/+y2aSwDizUHLBlgrkWM2ULaOKBUXkDgJ14linAXopuOz3UnD9p2ScUbrqOJgWGHZDA2ZFGEO1U2GOfvUy7CrR+d3vEE44fpZI0K/Ul3+rnYLnaiQW3iYTfiiluP6j2D++LPL4vIFWzUxWEXxkAcXYJCMGBvpv1x3MGAwXn7zkHWz4mE+anJSJljLyDvJPWxIKFAZrGPd2293tq4t/qsphALR/6mpkUqItwJmsLVyEf8iR/FfXMEbswK/+se3JWLW2ofT1y5/DcqSV7OV1UKg3mwiEMjo0F/O5fCfCLy0X7WtgnZI+RqkLlyiNPp9f9dSktOpFSOmyALZSpNtlTL00qWXPxhRgwijRy0gkQj0M+LoABcFvAq3GXsjEUxOk4OIOSJ9ikTbD4uGGdjjrNpWBIZK/7mthEDoL5adhvDx20x9KObZ8LjrC+p4zU+6gpLMRMwaVwEiAM9mOSFIfLY24mT45c6dtPyZqfwJwQelvJLr26JGjPE+VezdfVTIFkXTdx6OM86GOP+pw/0TyxnjuJfw+nW3px/XW0n9uqIGOX7UuRwjFyGVjilyHcsI9xDE/aEdLklH+aJcxC+h4FHvDGyKnNma4DUBLcDPyXKFU8Im+44W156WdQGWb9vIZNEBDeScLrDQ9iDavB9Mrtr2RCdy
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(81166007)(2906002)(47076005)(82310400004)(70206006)(356005)(4326008)(66574015)(8936002)(8676002)(40460700003)(70586007)(53546011)(16576012)(110136005)(508600001)(6666004)(31686004)(31696002)(54906003)(26005)(83380400001)(2616005)(36756003)(426003)(5660300002)(16526019)(316002)(336012)(186003)(36900700001)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 03:13:41.8212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b87612e-11dc-4ffd-e890-08d9f80cd36a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1776
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
Cc: "Chen, Horace" <Horace.Chen@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrey,

Sorry for the misleading, I mean the whole patch series. We are depending on this patch series to fix the concurrency issue within SRIOV TDR sequence.



On 2/25/22 1:26 AM, Andrey Grodzovsky wrote:
> No problem if so but before I do,
>
>
> JingWen - why you think this patch is needed as a standalone now ? It has no use without the
> entire feature together with it. Is it some changes you want to do on top of that code ?
>
>
> Andrey
>
>
> On 2022-02-24 12:12, Deucher, Alexander wrote:
>>
>> [Public]
>>
>>
>> If it applies cleanly, feel free to drop it in.  I'll drop those patches for drm-next since they are already in drm-misc.
>>
>> Alex
>>
>> ------------------------------------------------------------------------
>> *From:* amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> *Sent:* Thursday, February 24, 2022 11:24 AM
>> *To:* Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
>> *Cc:* Liu, Monk <Monk.Liu@amd.com>; Chen, Horace <Horace.Chen@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; daniel@ffwll.ch <daniel@ffwll.ch>
>> *Subject:* Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is ready
>> No because all the patch-set including this patch was landed into
>> drm-misc-next and will reach amd-staging-drm-next on the next upstream
>> rebase i guess.
>>
>> Andrey
>>
>> On 2022-02-24 01:47, JingWen Chen wrote:
>> > Hi Andrey,
>> >
>> > Will you port this patch into amd-staging-drm-next?
>> >
>> > on 2/10/22 2:06 AM, Andrey Grodzovsky wrote:
>> >> All comments are fixed and code pushed. Thanks for everyone
>> >> who helped reviewing.
>> >>
>> >> Andrey
>> >>
>> >> On 2022-02-09 02:53, Christian König wrote:
>> >>> Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
>> >>>> Before we initialize schedulers we must know which reset
>> >>>> domain are we in - for single device there iis a single
>> >>>> domain per device and so single wq per device. For XGMI
>> >>>> the reset domain spans the entire XGMI hive and so the
>> >>>> reset wq is per hive.
>> >>>>
>> >>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> >>> One more comment below, with that fixed Reviewed-by: Christian König <christian.koenig@amd.com>.
>> >>>
>> >>>> ---
>> >>>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
>> >>>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>> >>>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>> >>>>    3 files changed, 51 insertions(+), 30 deletions(-)
>> >>>>
>> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> >>>> index 9704b0e1fd82..00123b0013d3 100644
>> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> >>>> @@ -2287,6 +2287,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
>> >>>>        return r;
>> >>>>    }
>> >>>>    +static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>> >>>> +{
>> >>>> +    long timeout;
>> >>>> +    int r, i;
>> >>>> +
>> >>>> +    for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>> >>>> +        struct amdgpu_ring *ring = adev->rings[i];
>> >>>> +
>> >>>> +        /* No need to setup the GPU scheduler for rings that don't need it */
>> >>>> +        if (!ring || ring->no_scheduler)
>> >>>> +            continue;
>> >>>> +
>> >>>> +        switch (ring->funcs->type) {
>> >>>> +        case AMDGPU_RING_TYPE_GFX:
>> >>>> +            timeout = adev->gfx_timeout;
>> >>>> +            break;
>> >>>> +        case AMDGPU_RING_TYPE_COMPUTE:
>> >>>> +            timeout = adev->compute_timeout;
>> >>>> +            break;
>> >>>> +        case AMDGPU_RING_TYPE_SDMA:
>> >>>> +            timeout = adev->sdma_timeout;
>> >>>> +            break;
>> >>>> +        default:
>> >>>> +            timeout = adev->video_timeout;
>> >>>> +            break;
>> >>>> +        }
>> >>>> +
>> >>>> +        r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>> >>>> + ring->num_hw_submission, amdgpu_job_hang_limit,
>> >>>> +                   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
>> >>>> +        if (r) {
>> >>>> +            DRM_ERROR("Failed to create scheduler on ring %s.\n",
>> >>>> +                  ring->name);
>> >>>> +            return r;
>> >>>> +        }
>> >>>> +    }
>> >>>> +
>> >>>> +    return 0;
>> >>>> +}
>> >>>> +
>> >>>> +
>> >>>>    /**
>> >>>>     * amdgpu_device_ip_init - run init for hardware IPs
>> >>>>     *
>> >>>> @@ -2419,6 +2460,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>> >>>>            }
>> >>>>        }
>> >>>>    +    r = amdgpu_device_init_schedulers(adev);
>> >>>> +    if (r)
>> >>>> +        goto init_failed;
>> >>>> +
>> >>>>        /* Don't init kfd if whole hive need to be reset during init */
>> >>>>        if (!adev->gmc.xgmi.pending_reset)
>> >>>> amdgpu_amdkfd_device_init(adev);
>> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> >>>> index 45977a72b5dd..fa302540c69a 100644
>> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> >>>> @@ -457,8 +457,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>> >>>>                      atomic_t *sched_score)
>> >>>>    {
>> >>>>        struct amdgpu_device *adev = ring->adev;
>> >>>> -    long timeout;
>> >>>> -    int r;
>> >>>>          if (!adev)
>> >>>>            return -EINVAL;
>> >>>> @@ -478,36 +476,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>> >>>> spin_lock_init(&ring->fence_drv.lock);
>> >>>>        ring->fence_drv.fences = kcalloc(num_hw_submission * 2, sizeof(void *),
>> >>>>                         GFP_KERNEL);
>> >>>> -    if (!ring->fence_drv.fences)
>> >>>> -        return -ENOMEM;
>> >>>>    -    /* No need to setup the GPU scheduler for rings that don't need it */
>> >>>> -    if (ring->no_scheduler)
>> >>>> -        return 0;
>> >>>> +    ring->num_hw_submission = num_hw_submission;
>> >>>> +    ring->sched_score = sched_score;
>> >>> Let's move this into the caller and then use ring->num_hw_submission in the fence code as well.
>> >>>
>> >>> The maximum number of jobs on the ring is not really fence specific.
>> >>>
>> >>> Regards,
>> >>> Christian.
>> >>>
>> >>>>    -    switch (ring->funcs->type) {
>> >>>> -    case AMDGPU_RING_TYPE_GFX:
>> >>>> -        timeout = adev->gfx_timeout;
>> >>>> -        break;
>> >>>> -    case AMDGPU_RING_TYPE_COMPUTE:
>> >>>> -        timeout = adev->compute_timeout;
>> >>>> -        break;
>> >>>> -    case AMDGPU_RING_TYPE_SDMA:
>> >>>> -        timeout = adev->sdma_timeout;
>> >>>> -        break;
>> >>>> -    default:
>> >>>> -        timeout = adev->video_timeout;
>> >>>> -        break;
>> >>>> -    }
>> >>>> -
>> >>>> -    r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>> >>>> -               num_hw_submission, amdgpu_job_hang_limit,
>> >>>> -               timeout, NULL, sched_score, ring->name);
>> >>>> -    if (r) {
>> >>>> -        DRM_ERROR("Failed to create scheduler on ring %s.\n",
>> >>>> -              ring->name);
>> >>>> -        return r;
>> >>>> -    }
>> >>>> +    if (!ring->fence_drv.fences)
>> >>>> +        return -ENOMEM;
>> >>>>          return 0;
>> >>>>    }
>> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> >>>> index fae7d185ad0d..7f20ce73a243 100644
>> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> >>>> @@ -251,6 +251,8 @@ struct amdgpu_ring {
>> >>>>        bool has_compute_vm_bug;
>> >>>>        bool            no_scheduler;
>> >>>>        int            hw_prio;
>> >>>> +    unsigned num_hw_submission;
>> >>>> +    atomic_t        *sched_score;
>> >>>>    };
>> >>>>      #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))
