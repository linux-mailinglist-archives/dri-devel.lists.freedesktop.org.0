Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7726E4C2432
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 07:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B9A10F2EF;
	Thu, 24 Feb 2022 06:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0668B10F2EF;
 Thu, 24 Feb 2022 06:47:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+vZ4weh7HENkq7rOgzefMzguOKRfWPimi1XvF8xu9BPWzCjk4YlL5TbsQDmw2Sxve+ZLsUW06JHhJfG79DjOzDbdGrLlkQeZNtW3ViLMG50DctmEaRAHHpLk0osFgJB8cAAzIeQExnSmr7WoWKs/p/QT84M7So3HBFe7kuABT24TNyfBAXl+jhn+ZAkiEJrT09FsP50EC8IzlbPnrKDMNJNNotfg5nE9tbCCVt4rQdn5S4/wX94Z9J2r4Hm70SkOmH0DWCTYIp+MLFVbm2Ng22dkknliyAKgIEHjaBegGqYDDBIK4XV51dcK4oQ12TCkuwVM4+Zdid6VvWdPNmJrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xi2JMOg1W1zn+jOgZobQfSrMvwLPURpnIZFZ8WTP6ZI=;
 b=f/K3O2956/KOohwt+AVqgO1H1P/S6iVQjiNhO/jm8StSjaV9ZoyhDJNfAshmkfszo3OJIuamwFEYn+m+H7+G++of8PHDo2bjn+JzuTwevVxqciRnrrci+JVRE2d0LqBZDSLZt6p7R57OiqHBT4d90/NKMI92JdLNVPsbYoa462jIfh5Qq/H29ZIJF6cWl8+gooK9JxvNrMWTAfIuHSQz+4iAwyxS0THcLOdraGcFmUCShTparbZiQUvOKRPtODec9g/1IcixissJaLOsmCqC45d60CN3OOaeyGV6ophI9Dcs50ae5iIbkeXvQGmLuIScG/E7HRhd3R5nFw389bx39w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xi2JMOg1W1zn+jOgZobQfSrMvwLPURpnIZFZ8WTP6ZI=;
 b=QlEqX9o/vA/TsXcbnp5QxxWEASv0e3rMXnMkNdlCGEQ63is03Uhr+Kea57/9qwhLgvP7WA+vwufDuGt0GIljtMsQ+rQuH3bV9hDfZlbK5T5J1QpD2mDal2c7wor4ggDz48P4tkNP3aqMGnDcTsCEMmxJzdqiyPKphbAlxRVCCMk=
Received: from CO2PR05CA0107.namprd05.prod.outlook.com (2603:10b6:104:1::33)
 by BN8PR12MB2899.namprd12.prod.outlook.com (2603:10b6:408:6b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 24 Feb
 2022 06:47:49 +0000
Received: from CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:1:cafe::58) by CO2PR05CA0107.outlook.office365.com
 (2603:10b6:104:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17 via Frontend
 Transport; Thu, 24 Feb 2022 06:47:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT051.mail.protection.outlook.com (10.13.174.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Thu, 24 Feb 2022 06:47:48 +0000
Received: from [10.252.114.66] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 24 Feb
 2022 00:47:44 -0600
Message-ID: <3752a89c-d468-8c39-03a9-37d592dae89f@amd.com>
Date: Thu, 24 Feb 2022 14:47:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is
 ready
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-3-andrey.grodzovsky@amd.com>
 <d82ac1a0-d81d-9861-fc1b-8cc06017a2b5@gmail.com>
 <1d7cb471-c32c-416c-4336-317ee9f171ef@amd.com>
From: JingWen Chen <jingwech@amd.com>
In-Reply-To: <1d7cb471-c32c-416c-4336-317ee9f171ef@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e3745339-4a9f-434f-64fb-08d9f7619205
X-MS-TrafficTypeDiagnostic: BN8PR12MB2899:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB2899B069A5D4D62D9D4DD820B73D9@BN8PR12MB2899.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UZGZsj3OtS98ttWU0QeBwDjtScOjt7rPiMrxMiOoMYTZs+gakJHZW3PEtG/CQz0NmNQ0ulXat7APgtC+Mrgr0KsqrWGw7oOMigPbNYaVSfdOor2JqeySyCW8nhSlD6KUa7t8ZU5g15BADbzO3kxXyWQuVwIjR8MFESuo3bfpUxhFKTHZB5XhAl6nPOG2JSDkno+Uv/LpR+BVvgWuVJ9YTsRGLUC8xCUlgNFTDfKFzzG0TKBwcHCzx1F+G0bc/sXzeIUtTUCIqgkrYRToDFPfGzapYJiPgwloc7CWisSDxmdFhwv66ZXyTtMLDtbDu86WbaRaLtCYbx701Kjr9cALh2oM9ZHvaLPwU7olxNvBAvq/wfa4b0IRBeEUQmqSW2NyxuZkWc66F3cdfZGZVHeqV0swhSS4AC3tznpF4vLMt/MHlTkvt/njSGKOEvwvtT6HITOpL8UcxVlwf5EKW57IB2JD3zxWx3WSP4QX3x1nZ1BliCORCo0ribP6XAvfcjC2ViWjalYS/tXxYAnVRMmrpdOdH4zZhdMVuLgaaIjLImXW198ifJrZXBYYc1w8ghgWvY220Eb+Gr1Dac51JK4LyZbSvNAPpvlSDKZgXTzWv8FytXtL7Ty7xkijxFPB8vpa2437nJaK67FmV4GKgzjRfy4snxj5tXqCjzuvuWPRjRZbHpEhkpkgnrwJStK0l7nwQZT7iWqwtZ5Hz5JBlCyTnuYH9c5RtdM2ByitD81jeGz17819Eggubz0tc3+lta7c
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(53546011)(16576012)(47076005)(40460700003)(54906003)(36860700001)(16526019)(70206006)(70586007)(36756003)(66574015)(5660300002)(31696002)(8936002)(31686004)(26005)(356005)(336012)(508600001)(83380400001)(2616005)(82310400004)(81166007)(6666004)(110136005)(186003)(8676002)(2906002)(316002)(426003)(4326008)(43740500002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 06:47:48.1476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3745339-4a9f-434f-64fb-08d9f7619205
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2899
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, lijo.lazar@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrey,

Will you port this patch into amd-staging-drm-next?

on 2/10/22 2:06 AM, Andrey Grodzovsky wrote:
> All comments are fixed and code pushed. Thanks for everyone
> who helped reviewing.
>
> Andrey
>
> On 2022-02-09 02:53, Christian König wrote:
>> Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
>>> Before we initialize schedulers we must know which reset
>>> domain are we in - for single device there iis a single
>>> domain per device and so single wq per device. For XGMI
>>> the reset domain spans the entire XGMI hive and so the
>>> reset wq is per hive.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>
>> One more comment below, with that fixed Reviewed-by: Christian König <christian.koenig@amd.com>.
>>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>>>   3 files changed, 51 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 9704b0e1fd82..00123b0013d3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2287,6 +2287,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
>>>       return r;
>>>   }
>>>   +static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>> +{
>>> +    long timeout;
>>> +    int r, i;
>>> +
>>> +    for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>> +        struct amdgpu_ring *ring = adev->rings[i];
>>> +
>>> +        /* No need to setup the GPU scheduler for rings that don't need it */
>>> +        if (!ring || ring->no_scheduler)
>>> +            continue;
>>> +
>>> +        switch (ring->funcs->type) {
>>> +        case AMDGPU_RING_TYPE_GFX:
>>> +            timeout = adev->gfx_timeout;
>>> +            break;
>>> +        case AMDGPU_RING_TYPE_COMPUTE:
>>> +            timeout = adev->compute_timeout;
>>> +            break;
>>> +        case AMDGPU_RING_TYPE_SDMA:
>>> +            timeout = adev->sdma_timeout;
>>> +            break;
>>> +        default:
>>> +            timeout = adev->video_timeout;
>>> +            break;
>>> +        }
>>> +
>>> +        r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>> +                   ring->num_hw_submission, amdgpu_job_hang_limit,
>>> +                   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
>>> +        if (r) {
>>> +            DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>> +                  ring->name);
>>> +            return r;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +
>>>   /**
>>>    * amdgpu_device_ip_init - run init for hardware IPs
>>>    *
>>> @@ -2419,6 +2460,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>>>           }
>>>       }
>>>   +    r = amdgpu_device_init_schedulers(adev);
>>> +    if (r)
>>> +        goto init_failed;
>>> +
>>>       /* Don't init kfd if whole hive need to be reset during init */
>>>       if (!adev->gmc.xgmi.pending_reset)
>>>           amdgpu_amdkfd_device_init(adev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> index 45977a72b5dd..fa302540c69a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> @@ -457,8 +457,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>>>                     atomic_t *sched_score)
>>>   {
>>>       struct amdgpu_device *adev = ring->adev;
>>> -    long timeout;
>>> -    int r;
>>>         if (!adev)
>>>           return -EINVAL;
>>> @@ -478,36 +476,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>>>       spin_lock_init(&ring->fence_drv.lock);
>>>       ring->fence_drv.fences = kcalloc(num_hw_submission * 2, sizeof(void *),
>>>                        GFP_KERNEL);
>>> -    if (!ring->fence_drv.fences)
>>> -        return -ENOMEM;
>>>   -    /* No need to setup the GPU scheduler for rings that don't need it */
>>> -    if (ring->no_scheduler)
>>> -        return 0;
>>> +    ring->num_hw_submission = num_hw_submission;
>>> +    ring->sched_score = sched_score;
>>
>> Let's move this into the caller and then use ring->num_hw_submission in the fence code as well.
>>
>> The maximum number of jobs on the ring is not really fence specific.
>>
>> Regards,
>> Christian.
>>
>>>   -    switch (ring->funcs->type) {
>>> -    case AMDGPU_RING_TYPE_GFX:
>>> -        timeout = adev->gfx_timeout;
>>> -        break;
>>> -    case AMDGPU_RING_TYPE_COMPUTE:
>>> -        timeout = adev->compute_timeout;
>>> -        break;
>>> -    case AMDGPU_RING_TYPE_SDMA:
>>> -        timeout = adev->sdma_timeout;
>>> -        break;
>>> -    default:
>>> -        timeout = adev->video_timeout;
>>> -        break;
>>> -    }
>>> -
>>> -    r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>> -               num_hw_submission, amdgpu_job_hang_limit,
>>> -               timeout, NULL, sched_score, ring->name);
>>> -    if (r) {
>>> -        DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>> -              ring->name);
>>> -        return r;
>>> -    }
>>> +    if (!ring->fence_drv.fences)
>>> +        return -ENOMEM;
>>>         return 0;
>>>   }
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> index fae7d185ad0d..7f20ce73a243 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>> @@ -251,6 +251,8 @@ struct amdgpu_ring {
>>>       bool            has_compute_vm_bug;
>>>       bool            no_scheduler;
>>>       int            hw_prio;
>>> +    unsigned         num_hw_submission;
>>> +    atomic_t        *sched_score;
>>>   };
>>>     #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))
>>
