Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 889EB4AF8FD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 19:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617A289F33;
	Wed,  9 Feb 2022 18:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B5189DE6;
 Wed,  9 Feb 2022 18:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hccYFJkTxKTe0TWs3V5qN/C02NL8YOPkWPCNSk7ctrQN9In5pbKnH9vqG2ncORhkgzA3AgjC+riwQ1oZGv10cYyqkyKWrnPMrmnKTg4+4iaYerOSkEnazQBVb/U5rX+3VGZh2LXUen54BQ0ymWUhpY6IL8XNV8CEZEsp+uJa7jID38FbkvePluhlciPnqaFMVZk7WeKcIlTX1s0DjtK2q65e51XY4FdXxKLF3xcAKl/wuT3U71vggZDPF+qgTduC7tklpzC1xupwhrxD2CXEePiKZS6gUyos0dmPYPdB8sxDGq2S3yumL67Ak1rIUsYP6xjHC0zpCfGY185Fr/p7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIFoWghBRb8ZrrJNyESDVLczPRKCNnuYM5aSzo2XWA8=;
 b=UeCW+f3pBv9zvpFOr+wuwAmdzuhbUiOubEsMgKNiVdb+XEKxHL0K63JQcJNa/gktozBLhFq0I+T+QYSQPsKFJilzA3bdo+pIjgoo5EpAWa6lJdHtWqVPhGnhp7FTZwoim4EFTFsBNFQJf77UE0kk9rZ/gG9VHrZWI9HYTDiDnoyxJlPA/L7DlcHVzw2POpAp/07nDALHCth5/ORGz6StKMOYfXKvDmKCN9C804RbmpJXw1c7VPBkZq25XyCTk8RrIScKDZ7DGvR5r0B/uwQJoylyR2t8I72hQEMG/kUBknZBUztCB4bH39KwT+35vl+JeIN6CckvWWPa3/Tq57oCSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIFoWghBRb8ZrrJNyESDVLczPRKCNnuYM5aSzo2XWA8=;
 b=RT97b3SCdU8Io+fEjPXuo5FCaYLzbVeCYCLz7RB9zZh09NGReG2nteJqHJInR2yXwDZfIN0UzIjJ7aEKDURc4ECnUA7sN2XkNLq3dlHPg7vV/afLLEa/qFhmLXRtYdyy72zBpZclfT884NxNfP1lpp2N0r1CxCGLCvFsz0ufUg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN6PR1201MB0241.namprd12.prod.outlook.com (2603:10b6:405:58::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 18:06:27 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 18:06:27 +0000
Message-ID: <1d7cb471-c32c-416c-4336-317ee9f171ef@amd.com>
Date: Wed, 9 Feb 2022 13:06:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is
 ready
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-3-andrey.grodzovsky@amd.com>
 <d82ac1a0-d81d-9861-fc1b-8cc06017a2b5@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <d82ac1a0-d81d-9861-fc1b-8cc06017a2b5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR19CA0003.namprd19.prod.outlook.com
 (2603:10b6:208:178::16) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b52ac85e-b1cb-4e46-0767-08d9ebf6e42d
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0241:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB0241CC824D26BA681011B679EA2E9@BN6PR1201MB0241.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iz26Czbo4N17geIKst+JLISV1BmHuddw2591eZS3wLgy0vI14aKRfKjDVArBLMjx/n4r+cbEhnayt91AsmKCRjJsL8IHfpRxwe+lgkFiU9TVUCxd3zGB/c1fJ2UKWEMQvFpM2VozD/UYaMEQdVuURhbJKprBjD9kNdiwTp6biwrRvrFMM1D+LBeXjTZq2VzWiWXfkYCa3MFNwls5KrO7ksrdfwm1rqXRfNVPX/iiA5fOnoqFqIc394l7Go/igd/GgBgbGgHcQubVkKUCcMG4IlCWaOGw812fH9ciwm9Xp1cUZWlRuXcXrhb8aP5thx7ATmytEL0J9WQiD3OmOADy1KPwpnXFFOsbsAO4Iq3z3q+/g2RA7nKHVfOB/fF+wZjBcl8+qvgk/3BRZWWtoFrN7B7cfwG6bJtfVIOOlpiqJCYndSW7VeZqkOz0UlkTPuDkCmZK4TIJ1dNYyhrx2DXn59eiuUuhJW2HUEfg+lniNniWv+28h/bzwmbrrJvfP5WzZnHOO/Z66JnadhU89o8H3XawY++FGSkD0UktiFoVJXZd+gT0T2CnvHU+rUtlu4N/codSle6WpOo/9cPAqmqWyG0T9EsDHkK+oqL6UW0zwYXOSqlpHGYeZqO+US6YfU2RiNpw4PBYlAZFv00nmwE7nRIDQczJT6kANl9+c675TdY6EfM95xK0/4q7NMCs/PfC63YdBwkdtCAIReP85IDB0F40YEnK8JeffU+5HhTMId2ey6+uMEYvcu6wtTAn94j9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66476007)(66556008)(8676002)(6486002)(6512007)(53546011)(508600001)(66946007)(316002)(6506007)(2616005)(2906002)(66574015)(36756003)(83380400001)(31686004)(186003)(38100700002)(86362001)(31696002)(44832011)(8936002)(6666004)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEIyRE5YVDN2OVc2SjVXeU5xNXJ3MExLRFFxUUQyRWMxclBBNFB5SDYvZmcw?=
 =?utf-8?B?UndZOVc3akdwd05uSzVwMkZ5U2piTDVnTXhKVGJweWhSRmJBSkVBKzAyY2N4?=
 =?utf-8?B?WFZUL0w5azZvK1lRaEhMamVvV0k5Vzh6ekNZdDJMblR2MU9XbE9kanZqTk9x?=
 =?utf-8?B?YXV3d1FyeGE3N2VqUmRNYWFDczluMzhhRW8zOXFKUWt2L3E0K1lzTWxXdkJl?=
 =?utf-8?B?T1Z0QjJVTGpmVmtmTUYyOTdURDk4N1I2dXJvOGNaRGNIOXlmbENGM2VjTGxG?=
 =?utf-8?B?SkJEUjhWQ0cwRXdSbzhNdFpZZlkyN2MxL1Q4VzhEYXlCVzNaUHBVSDZTV0VR?=
 =?utf-8?B?ZE5JcjNIRHQxdlA4dEJTWSs3MVc2SjdIaWFaTHRRa0RkTSs4emREQ2Qrcitw?=
 =?utf-8?B?OE02Y2VRdURxckNZL0tlUGk5cTQzR2thM01EK3NzNnZjbG41V1QvbXBDZ3pn?=
 =?utf-8?B?QVJ3SXRIK3dKSHF0eEJXTFpFVHEvb3U2TjF3RUhkeXM4Y0ZrV2RpdzZIM2h6?=
 =?utf-8?B?OUdibXhNa1FyelpIWWYxZHNhdzRubG1OWkRab1NYYlJ4N3FMTngvbTZtRnVY?=
 =?utf-8?B?am91cUNFMHhBU3JEdDcvOUNSWmhGK3NiMHVIUEtHSHNla1RvUEtyTmg4Y082?=
 =?utf-8?B?cEFxSmlxN3BxQ0IzNVMyV0hIM1VIWUhjOGJ3MWQ3Q0ZNODh0Wi85NlpGNTJX?=
 =?utf-8?B?ZjdvaE9IbXlmcTA5eThSSkJWRTJjSnhqWHBHZDNGNGRCdktIRERWMTcxLzlN?=
 =?utf-8?B?emg4SVV0TndSS3dGSmxaUEpYSEd2ei9lNHRxbHhzRUdWRFdHMGg4bXdMb3oz?=
 =?utf-8?B?bnQrYkV1UHJZYTVOVmVxL2FXbzJvb0dDQXd2Yi9yVjlsYlNXbkNQMjBna0ZL?=
 =?utf-8?B?NmRieGwxZlR5cHErU1MxZUUrZzRBaGlwSzNxRnpsMG00UEY1QlZRWWpkVDkw?=
 =?utf-8?B?Nm5oM21Ja1diNzdNcDVYZHhBZGNlZHFRMmV1eWllOE9wMHpqRXVINjlnZWQw?=
 =?utf-8?B?YkJ1dTMvc1ZJMStxbEFadEY1V1QzNnNTdXVGOUxxR3Q2Rit3VnBGNkgyY0Uv?=
 =?utf-8?B?cUE4ZWtobTNQYU5xNitsQTk2dmNqdjNEUXErZGxleDVRM1dWOVlMSUViend5?=
 =?utf-8?B?QTRqMDE1dEZLdExLcG9wMXY1VmUxeTRFdlBVNGdodm5sU1JHeTRnbUxabXlR?=
 =?utf-8?B?YXorYytmV2orNGptTEpSUExxbVBtdUc5MHQzbWRINzM4UG5XZmQ5YVM2Qkx1?=
 =?utf-8?B?Tmc4b3VIc0Ezd2lpUHhYelBUTTcxWmZVdkZWbEpoUW5mOUpJc1VKaXVySW5i?=
 =?utf-8?B?aHVnNE9yNzRNN0p1OFVCaVhST1cyOUZ0SWorQ2pCQi80Y2lwTXJKT1pSeGwz?=
 =?utf-8?B?WXRhdEJtTWdCQ0RDOThMWnhlMUgvSGlLV1p4MmY1L0VFVWp1aitlckU2WEto?=
 =?utf-8?B?RXZQVFA1R2lIblNyWDVPWTBRcjB3R3RhOU1HM1VGVjhpUWZkUTVmOU50UE9u?=
 =?utf-8?B?Q2tjWnlCWi9zcXJ1Q1FqYUYyNVpOOG45aDdNNHFkVVlMMUV5bWF1Qmt1UG54?=
 =?utf-8?B?c2VEVkRnYlR6eHFGNjhzL3ZHajNDcHN2TjBiakZqelR6VkJ1RXdPR2d3c2Fr?=
 =?utf-8?B?UStiSGppeFBVTTN0SjdhY2hnTGtoOFhJcjk5NVBzNEUrZUpESzlCd2hWWEpv?=
 =?utf-8?B?N0NWd3ZBaGVSa3oyWU1pZUtMVDdaYlhiOWZ6WHpNVXBuK0xnUG9SeFg2YU5H?=
 =?utf-8?B?VVZXUHVFNDZ5TVp6ZklqRHloZVFhVjZxeDVSaURnWHVaNnYzWDBHMEVwVEph?=
 =?utf-8?B?SEI2VGVxeE1BeVJmTlZvcEdNV2VUU3hQdnVLSGxWSEFaQ25UdzA5WG9DSzZk?=
 =?utf-8?B?WEJFK05FMEhCdXpuR1I2ZzM3TTYxU0NvWi8yejQwMk1jYWgybHd3aEZzVXlG?=
 =?utf-8?B?UW5nMTRQRXkySy9vcTNIL3JMMzlGZnFySFVMbHlDTHQ4ay96SWltSExiSDRR?=
 =?utf-8?B?TnFENGV0d0g5cG9GbjJQRXdHU3A1OTVUWGptVXdHTnZuMWc1TTdnS21ub2RF?=
 =?utf-8?B?Q1RUZ2RLdEFTMkY1WDc1ZzJpUlBOdW5QSHpZZVpvZEk5Nld3WHJmdWxOWUFu?=
 =?utf-8?B?YUxweUY3NlBQMGN3ZjU5OGIydkxVZXcrVkpxZy80SGRUWXlRZnBITUg2Q3hs?=
 =?utf-8?B?MHk2bTZ4MlF4WjBueGR0VlNjNUd4QTdpcFQvcndkVnBEVTRneW1HM1lMak04?=
 =?utf-8?Q?SSN+HBphu6xKgPrms/GlnCZ3aDD2R3CUUyJ13ihuq8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52ac85e-b1cb-4e46-0767-08d9ebf6e42d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 18:06:27.5242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vO/OykQn5Ugk772WzkGUZe0G3JsLjWKdNJ7hox+DBoVlAO1d7pxXWAmRr9ijzRU/lmce/nndjPzqVexZ9ylTYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0241
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All comments are fixed and code pushed. Thanks for everyone
who helped reviewing.

Andrey

On 2022-02-09 02:53, Christian König wrote:
> Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
>> Before we initialize schedulers we must know which reset
>> domain are we in - for single device there iis a single
>> domain per device and so single wq per device. For XGMI
>> the reset domain spans the entire XGMI hive and so the
>> reset wq is per hive.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>
> One more comment below, with that fixed Reviewed-by: Christian König 
> <christian.koenig@amd.com>.
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 ++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>>   3 files changed, 51 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 9704b0e1fd82..00123b0013d3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2287,6 +2287,47 @@ static int amdgpu_device_fw_loading(struct 
>> amdgpu_device *adev)
>>       return r;
>>   }
>>   +static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>> +{
>> +    long timeout;
>> +    int r, i;
>> +
>> +    for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>> +        struct amdgpu_ring *ring = adev->rings[i];
>> +
>> +        /* No need to setup the GPU scheduler for rings that don't 
>> need it */
>> +        if (!ring || ring->no_scheduler)
>> +            continue;
>> +
>> +        switch (ring->funcs->type) {
>> +        case AMDGPU_RING_TYPE_GFX:
>> +            timeout = adev->gfx_timeout;
>> +            break;
>> +        case AMDGPU_RING_TYPE_COMPUTE:
>> +            timeout = adev->compute_timeout;
>> +            break;
>> +        case AMDGPU_RING_TYPE_SDMA:
>> +            timeout = adev->sdma_timeout;
>> +            break;
>> +        default:
>> +            timeout = adev->video_timeout;
>> +            break;
>> +        }
>> +
>> +        r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>> +                   ring->num_hw_submission, amdgpu_job_hang_limit,
>> +                   timeout, adev->reset_domain.wq, 
>> ring->sched_score, ring->name);
>> +        if (r) {
>> +            DRM_ERROR("Failed to create scheduler on ring %s.\n",
>> +                  ring->name);
>> +            return r;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +
>>   /**
>>    * amdgpu_device_ip_init - run init for hardware IPs
>>    *
>> @@ -2419,6 +2460,10 @@ static int amdgpu_device_ip_init(struct 
>> amdgpu_device *adev)
>>           }
>>       }
>>   +    r = amdgpu_device_init_schedulers(adev);
>> +    if (r)
>> +        goto init_failed;
>> +
>>       /* Don't init kfd if whole hive need to be reset during init */
>>       if (!adev->gmc.xgmi.pending_reset)
>>           amdgpu_amdkfd_device_init(adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> index 45977a72b5dd..fa302540c69a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> @@ -457,8 +457,6 @@ int amdgpu_fence_driver_init_ring(struct 
>> amdgpu_ring *ring,
>>                     atomic_t *sched_score)
>>   {
>>       struct amdgpu_device *adev = ring->adev;
>> -    long timeout;
>> -    int r;
>>         if (!adev)
>>           return -EINVAL;
>> @@ -478,36 +476,12 @@ int amdgpu_fence_driver_init_ring(struct 
>> amdgpu_ring *ring,
>>       spin_lock_init(&ring->fence_drv.lock);
>>       ring->fence_drv.fences = kcalloc(num_hw_submission * 2, 
>> sizeof(void *),
>>                        GFP_KERNEL);
>> -    if (!ring->fence_drv.fences)
>> -        return -ENOMEM;
>>   -    /* No need to setup the GPU scheduler for rings that don't 
>> need it */
>> -    if (ring->no_scheduler)
>> -        return 0;
>> +    ring->num_hw_submission = num_hw_submission;
>> +    ring->sched_score = sched_score;
>
> Let's move this into the caller and then use ring->num_hw_submission 
> in the fence code as well.
>
> The maximum number of jobs on the ring is not really fence specific.
>
> Regards,
> Christian.
>
>>   -    switch (ring->funcs->type) {
>> -    case AMDGPU_RING_TYPE_GFX:
>> -        timeout = adev->gfx_timeout;
>> -        break;
>> -    case AMDGPU_RING_TYPE_COMPUTE:
>> -        timeout = adev->compute_timeout;
>> -        break;
>> -    case AMDGPU_RING_TYPE_SDMA:
>> -        timeout = adev->sdma_timeout;
>> -        break;
>> -    default:
>> -        timeout = adev->video_timeout;
>> -        break;
>> -    }
>> -
>> -    r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>> -               num_hw_submission, amdgpu_job_hang_limit,
>> -               timeout, NULL, sched_score, ring->name);
>> -    if (r) {
>> -        DRM_ERROR("Failed to create scheduler on ring %s.\n",
>> -              ring->name);
>> -        return r;
>> -    }
>> +    if (!ring->fence_drv.fences)
>> +        return -ENOMEM;
>>         return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> index fae7d185ad0d..7f20ce73a243 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> @@ -251,6 +251,8 @@ struct amdgpu_ring {
>>       bool            has_compute_vm_bug;
>>       bool            no_scheduler;
>>       int            hw_prio;
>> +    unsigned         num_hw_submission;
>> +    atomic_t        *sched_score;
>>   };
>>     #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p), 
>> (ib)))
>
