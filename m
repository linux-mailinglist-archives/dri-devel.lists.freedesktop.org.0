Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393D4C3129
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 17:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C8110E9A6;
	Thu, 24 Feb 2022 16:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C3F10E99A;
 Thu, 24 Feb 2022 16:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1gGHC8NzcJFihZ9XAH6AsvhFrXd7mgurv7cdREcrihB8s6wqg//M1up0TtpddxssF5Thvha1hRZp7fKT1Xqk4RGiUkfrBuVtGCsspISuTNbUmeaAAxFQafjfW+CLsVLcFMjVxlwUltP3Rea9wjT6E05vgpScCM0z7sXi3FOK81wH4wgu2ZUZxWjPvPnNNfSnRmDbinFMI6uE01hHvv5f2fjIeS0a+QsNQF2i8kfD0spuyb75RKUgSrjV/LUdv/pX5f7g56lUmzpS8+u0dekuvPeZ9ZQQNy9yy+2dHbJE3W3bGpK47WVZ7ShZ9+FfngAiDgrwzr5RCqU92b20zt6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQIomeIcPThxSYxWFYojVvcW75CX8Wxgz9I9KYNj80c=;
 b=Rw32hkzW5nUbFve7V5u23wNqNgpbWQMBXTdcLc3SY59Xl9fl3bcLNCpsO/TxQ5OrPmEke2V1n1asCiIuKjwhjVnKz0GY+yeevzQuuX/iytRC9BOjyqDq0bA3wL0ZRgWmm1nXNLA/gjd/sVmhFAhs7JReiLOERgs5NlZXkI4FzPQnw/TL0fNPjw8cUxQQ4kMVZ29OYERUI8g8LLHCYFMfSDXH4R/l/bBWf1sC7Ci9Mr0k1WZ3iatOyF2AKdG6PoCSkcYdYMSiTuKAzBQ0ZpxTHrm/u0ZyNCItgJ7dqctUh7zg5JhMPOu/uBFgsg2gWC+5Rdxvv9AMrWnaQqbYJANBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQIomeIcPThxSYxWFYojVvcW75CX8Wxgz9I9KYNj80c=;
 b=DU4uq4d/UvJ22qhzFs3kUZKW3BCPqW1KcIjg7FfISGRiIlD0p0bA/vPgnKeWuVXNnm3HV/mRSGJ87AZFL/jIC/xQPJkKE0n4cAW+p4NbqmbYnMFiStJKyAL3d2n2JOk4tsu9eDeAiPvYRh7vpDqpooFf/1ff1A/JRYHgqLuC88Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BYAPR12MB2726.namprd12.prod.outlook.com (2603:10b6:a03:66::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Thu, 24 Feb
 2022 16:24:41 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 16:24:40 +0000
Message-ID: <48c207dc-cc7a-efda-a4a8-4f1f1a6511fe@amd.com>
Date: Thu, 24 Feb 2022 11:24:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is
 ready
Content-Language: en-US
To: JingWen Chen <jingwech@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-3-andrey.grodzovsky@amd.com>
 <d82ac1a0-d81d-9861-fc1b-8cc06017a2b5@gmail.com>
 <1d7cb471-c32c-416c-4336-317ee9f171ef@amd.com>
 <3752a89c-d468-8c39-03a9-37d592dae89f@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <3752a89c-d468-8c39-03a9-37d592dae89f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YTOPR0101CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::16) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95092c60-1c1b-423c-5545-08d9f7b22865
X-MS-TrafficTypeDiagnostic: BYAPR12MB2726:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB272623B3201F5AC31096E0B9EA3D9@BYAPR12MB2726.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GagUUmDKatTY2BOKurQ59kzw2TuF4AuRkxpBFdILBRkzekOI9HjDL/pYsm5shBHDk0EsgUbMVC5O5ugYOvDw6H+sUKF8We9YS+qU2LQopV+Ae+TgeLNiz5aTqSzoMhPL8ocxP74nxFtCQYVgAZY74L/T3QEPbpmihJl8nCNgpkuttfxQXPuXxuLxBnhxNcpIBeYAUeyqeloF7bWeeqAJYzFT7aEab1ie0bp/uBg3hNh0XZ5OrXkmvbBeS3VecC9Mb785E8o4CHpIR0Ndylka7Nc7GtRpPqjHaN9+X7b9ahQLqjSU2eDvmzfkw3yg8XKTLj920OCq1TGueY1U4EtQ6vF2IM7EDSxaE/K/dO5OuJpZfEvJLj9VPtS9jq484SvAg4plyV706Ftxpvto5hGIQfYM6ykWtK1aleYeXWLbCtf1VslaG7S6+nN7IIUtbz/cvTscfDul2sSw/4JEEHj3EC1/YK+O7zSgAYvcdmsE5Tw0Zr5SzHSLcQc9RiHHjfw7YixoJYaXYF05JhGSmSNEJogqbpySHx+S3SsFQecCuF27Yy6dhc4NHYct3k6OoSPyCm+AKkhhX265wHuSYBS14YGV/khBuNHVeJc1ii8FcsX5EWFpQ9Ab80U4ki5OKKTZeaF7etPKM12psw5vr5fP0Cf/vBz5nnZ9+hkyTrV8IjoptZP1N0brZ7uw+Xe6KojaIznV4MTfuEV+L+K8tR1dq7iSfiETNyQHz2CkWCy1W/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66556008)(110136005)(83380400001)(66476007)(316002)(508600001)(6486002)(66946007)(8676002)(31696002)(6512007)(8936002)(5660300002)(2616005)(2906002)(31686004)(186003)(36756003)(86362001)(6506007)(66574015)(44832011)(38100700002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0ZtUXhndEQ2NjVndnowYWhiNFFqbWg4Q1NUTEc2ZUJydVdFNnZsSWY1RDFJ?=
 =?utf-8?B?RENUTHhCNDhZWS9RTUR1bVo0NkRoV2xBUlRRdEluMm50VzZmTDVFOXFkSnM3?=
 =?utf-8?B?VU1vd3pncVMyNjRmRFEyTCtlNUhCbWlseGRodHk1ajFxQStMV2R6RzFOR2Zh?=
 =?utf-8?B?bklneFRKeGI1YUljMURSUWJTM3dzNW1KbFh0Vm16Sjlna2l6R015K3FxQ1BU?=
 =?utf-8?B?T2FVbXRxMEkwYVVHTGlFZ2tYbEpXekExV2RZZlBvUTNhMkpacTZaSGx2TVFW?=
 =?utf-8?B?TnRheUxpVkd6SGdZaWNROFpWUEtlUHFEcWs3SzRxQmpuTjhEbWpPdjJzUzIw?=
 =?utf-8?B?UVdsS0NOWlZLRVYvdkk5WVZ0SVVpSGdDODVIN1VkTDB6U1hrZmpvWHVmRUo2?=
 =?utf-8?B?UzRQTXRiajFIc2pycWgyd1hSRTZKbFI5S3pVSGY4c3pRL2psbGRaMmROcHJM?=
 =?utf-8?B?UWNKcU1zK2psM0dSQ0d5MVYvbG4weEJYeDM0K1ViMVlqMjJ2ZjltUDRXUmxz?=
 =?utf-8?B?N2xqUS9YR2hjV0VHV1lRaUdic0xDS2JpandIYU93bWJPTDQzc3VxVDVubWN1?=
 =?utf-8?B?dGt0ZG1xVmhMMTFiT1Z6L1haZUlOaG1zSkNZUkdGSGx3WEFSV0VCOXVnNTUx?=
 =?utf-8?B?VG12bW5CbUVkajY3dWZjNHZPQXovQkhQNkpyV1dxc016bzBnN0xjbStoU0N5?=
 =?utf-8?B?blhHRFp4M1A3Y0llTG5aanArYUUzL1p3bTlncm9uVUgwVnNicHhnMlV3d1BT?=
 =?utf-8?B?d0lLelJTVEUzZFRjTlhCTmRBcDVXTE5uVzgxR251WlJCS09oR29TS3M3OE5y?=
 =?utf-8?B?M2pYdGpRL1RJNTZXaVpDOXo3Sm9wa0xUU2V5dmFyeUlvdytLb1dOdFBlYVdn?=
 =?utf-8?B?U2hNQjM4MnlIRk1IRVhHYVBLMHppemcyMExwRmloRkFkWXYvMDZKaGJHQnMv?=
 =?utf-8?B?bHdGRDJOb1luZkpNL1lSMERBeiszYVVTTnF6d2ZLaERrazd0UEhYc2ZNWTI5?=
 =?utf-8?B?MlF3dTVFSUpYRkkyVkc0THRDYjlrSDYrTmZHUjVySFhIT2VLcTZxMTU0ZHc5?=
 =?utf-8?B?WFJJM2xnTkFpK05YZzBnQnRwb3NRK1NQdG1PMXNrTjlHaGRuWTY0eXVPczJy?=
 =?utf-8?B?S1FFdWRPbGplNC92YkhETUZxYjlDRGhITnFsck5DTFJWSUxIRFJPZG9GQjF3?=
 =?utf-8?B?S053bkVRejE5d3hwVDNWN3FEUlRpakNNZEpFWHFlUGZ3SlNVa0djU1NpbldN?=
 =?utf-8?B?TGpCc1p0N1JGMTJsTnBUSlFsalFlRFNuRWJmK1RjdFQ4NEowOEpwL0IyeVZM?=
 =?utf-8?B?NFZ2RTJIdVR4ODZmWUcyNFc3Ry9WbjVKVkZYN0c1M3JNOXZrNllkNUJWNndu?=
 =?utf-8?B?Y0tMckVTUURuU2VLS2FtdmRLaGhLS2FkOHdFRkFGL1RVQ3ByK3ZMbFNabUxx?=
 =?utf-8?B?QTNydUVSSmkyOEFyS2lraEh5bWR0QkFHd0JtVjlMNWl0LzU3R2xxTzBHRWor?=
 =?utf-8?B?Q3JwOTJKRzJsd3RmVktkWUV4dUJpdG9IRjhJbWowbnJXemQzNHp6OEdpa2hJ?=
 =?utf-8?B?bDNMc0FyUUViSU42Yi96d2p3Vk9DN0VrZTBWcXI5N3U5SFhXWm1QVFIrWTVo?=
 =?utf-8?B?WTMwVnNxZE15aDB3Rkx0TzBzUDYvRHNlYWRHM0V4WXJMMjJpNGs0cGJPWHY1?=
 =?utf-8?B?bHI3bW5kQVN3OTZnK2x0UGdGc01JZHNSd3VlVlF3SUx4ODREM1pPT3JlMm1w?=
 =?utf-8?B?S3hhSmVjVVlLYUVaczZ2UjQyTnVFclJBR1dOMTF0T3IwZXg4d29KUjV4bDRa?=
 =?utf-8?B?MW9tdTBuN1MxVUllRGxNU2ZWN1Y5R3NKRlJ1REtMQSt6RHd4MXlTanFTVmhR?=
 =?utf-8?B?LzRSOWYyVkhCZkJLSmZVSFNXZkdvTUp4RkwrV1ZSNXdLNTQ2TGpDU003WnNR?=
 =?utf-8?B?bi9ackxyZzB3engrMWRQTXplbWFiVi9mZlBnOWk0K3ZXSG4vbzlXYXJkeWI2?=
 =?utf-8?B?NU10UXFpZUhDakdMcDZiN1V2eHNRMHoyVGNPVDhoRnZnYXovUTlHdzY5bHV3?=
 =?utf-8?B?cnVvNG8wYm9BRlg4TGk1MHEvR2dPSXo4VGY2VHhlVE1YSElkS3N6T2Jvckly?=
 =?utf-8?B?cTd1Si8yNHE3YkZLSjZUTHpRd3FKT2hXbWFJUmVCaEJrUS8rbE4vY3hTdExP?=
 =?utf-8?B?NlpaSTJDemsveGs4a2JYd2l1NjRPZlRTOWZGc09MWmFoNHl3anJMOWJDcWIz?=
 =?utf-8?Q?r89qGHsfmmJwm3RogNqOsbENAjGCIyLHT+GFVTsxn0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95092c60-1c1b-423c-5545-08d9f7b22865
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 16:24:40.6885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hUmtouVMDGmBz2mCoNO96JcRc/zsV/PYNEl6/Lq7+UEa7BwTBF1wNSbgpNo5xn1E+tgYVvbOVGYReHwV+/i+Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2726
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

No because all the patch-set including this patch was landed into 
drm-misc-next and will reach amd-staging-drm-next on the next upstream 
rebase i guess.

Andrey

On 2022-02-24 01:47, JingWen Chen wrote:
> Hi Andrey,
>
> Will you port this patch into amd-staging-drm-next?
>
> on 2/10/22 2:06 AM, Andrey Grodzovsky wrote:
>> All comments are fixed and code pushed. Thanks for everyone
>> who helped reviewing.
>>
>> Andrey
>>
>> On 2022-02-09 02:53, Christian König wrote:
>>> Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
>>>> Before we initialize schedulers we must know which reset
>>>> domain are we in - for single device there iis a single
>>>> domain per device and so single wq per device. For XGMI
>>>> the reset domain spans the entire XGMI hive and so the
>>>> reset wq is per hive.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> One more comment below, with that fixed Reviewed-by: Christian König <christian.koenig@amd.com>.
>>>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>>>>    3 files changed, 51 insertions(+), 30 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 9704b0e1fd82..00123b0013d3 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -2287,6 +2287,47 @@ static int amdgpu_device_fw_loading(struct amdgpu_device *adev)
>>>>        return r;
>>>>    }
>>>>    +static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>> +{
>>>> +    long timeout;
>>>> +    int r, i;
>>>> +
>>>> +    for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>>> +        struct amdgpu_ring *ring = adev->rings[i];
>>>> +
>>>> +        /* No need to setup the GPU scheduler for rings that don't need it */
>>>> +        if (!ring || ring->no_scheduler)
>>>> +            continue;
>>>> +
>>>> +        switch (ring->funcs->type) {
>>>> +        case AMDGPU_RING_TYPE_GFX:
>>>> +            timeout = adev->gfx_timeout;
>>>> +            break;
>>>> +        case AMDGPU_RING_TYPE_COMPUTE:
>>>> +            timeout = adev->compute_timeout;
>>>> +            break;
>>>> +        case AMDGPU_RING_TYPE_SDMA:
>>>> +            timeout = adev->sdma_timeout;
>>>> +            break;
>>>> +        default:
>>>> +            timeout = adev->video_timeout;
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>>> +                   ring->num_hw_submission, amdgpu_job_hang_limit,
>>>> +                   timeout, adev->reset_domain.wq, ring->sched_score, ring->name);
>>>> +        if (r) {
>>>> +            DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>>> +                  ring->name);
>>>> +            return r;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +
>>>>    /**
>>>>     * amdgpu_device_ip_init - run init for hardware IPs
>>>>     *
>>>> @@ -2419,6 +2460,10 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
>>>>            }
>>>>        }
>>>>    +    r = amdgpu_device_init_schedulers(adev);
>>>> +    if (r)
>>>> +        goto init_failed;
>>>> +
>>>>        /* Don't init kfd if whole hive need to be reset during init */
>>>>        if (!adev->gmc.xgmi.pending_reset)
>>>>            amdgpu_amdkfd_device_init(adev);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> index 45977a72b5dd..fa302540c69a 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> @@ -457,8 +457,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>>>>                      atomic_t *sched_score)
>>>>    {
>>>>        struct amdgpu_device *adev = ring->adev;
>>>> -    long timeout;
>>>> -    int r;
>>>>          if (!adev)
>>>>            return -EINVAL;
>>>> @@ -478,36 +476,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring,
>>>>        spin_lock_init(&ring->fence_drv.lock);
>>>>        ring->fence_drv.fences = kcalloc(num_hw_submission * 2, sizeof(void *),
>>>>                         GFP_KERNEL);
>>>> -    if (!ring->fence_drv.fences)
>>>> -        return -ENOMEM;
>>>>    -    /* No need to setup the GPU scheduler for rings that don't need it */
>>>> -    if (ring->no_scheduler)
>>>> -        return 0;
>>>> +    ring->num_hw_submission = num_hw_submission;
>>>> +    ring->sched_score = sched_score;
>>> Let's move this into the caller and then use ring->num_hw_submission in the fence code as well.
>>>
>>> The maximum number of jobs on the ring is not really fence specific.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>    -    switch (ring->funcs->type) {
>>>> -    case AMDGPU_RING_TYPE_GFX:
>>>> -        timeout = adev->gfx_timeout;
>>>> -        break;
>>>> -    case AMDGPU_RING_TYPE_COMPUTE:
>>>> -        timeout = adev->compute_timeout;
>>>> -        break;
>>>> -    case AMDGPU_RING_TYPE_SDMA:
>>>> -        timeout = adev->sdma_timeout;
>>>> -        break;
>>>> -    default:
>>>> -        timeout = adev->video_timeout;
>>>> -        break;
>>>> -    }
>>>> -
>>>> -    r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>>> -               num_hw_submission, amdgpu_job_hang_limit,
>>>> -               timeout, NULL, sched_score, ring->name);
>>>> -    if (r) {
>>>> -        DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>>> -              ring->name);
>>>> -        return r;
>>>> -    }
>>>> +    if (!ring->fence_drv.fences)
>>>> +        return -ENOMEM;
>>>>          return 0;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> index fae7d185ad0d..7f20ce73a243 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> @@ -251,6 +251,8 @@ struct amdgpu_ring {
>>>>        bool            has_compute_vm_bug;
>>>>        bool            no_scheduler;
>>>>        int            hw_prio;
>>>> +    unsigned         num_hw_submission;
>>>> +    atomic_t        *sched_score;
>>>>    };
>>>>      #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), (ib)))
