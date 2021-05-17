Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4115D383DB9
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:46:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD3D6EA6C;
	Mon, 17 May 2021 19:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC9F6EA6C;
 Mon, 17 May 2021 19:46:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6GRn82YqNwIT2klW50p74HtKujweCwwDExVnkwsQy7KxbuYnlT+QI2T9tdN76VPP4gHSt+4bXt2TY9rBD64rwbCYlIohsKESInKDlrgNrltFrU8s1cllsiHurSKJoOnKTFbak5QONX2Ocnl7lnubGfjg7Fz6eiIOjH0+IPsfQUfsmffrycMn8RhSSha4KzVm7hx3jdP6I0yU62SkIu0sRIwdVA0oTPIS2VYe6ZMttglXx/dNUA948SBgVeefuEVyVu3NYmOmzlrgX6eCOkOPVNlw2tVW1GvGDIw0mJ3qfvA2IppuLtFtnQr2NZHDTCSdhBpO3Npwt36bA53ZV45hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U39TwFYbpNGYJoPfyPAkCxXOayqwb06iIFf+ZL/dzc=;
 b=fdui7V6Am/E/dezIgvKd47Z+whL+TDwmhEbwiESB8b6aSwzCcG+DZqgBNAAJ715aD3KYeCfavySUzEsq7P3FTAXeAgugSZv8666zamFKI3naVkdl3BqeAAH8+c8Q+G8uz+OYa2S1HTLoP+r/gH4P8w7IxA0a70UUY0R6mF5/Cw9dDeNboxgwbjPQD/35WW4lSmYhzs4JXwbZ6fnuO4WqvOpDaERsSDftzUNN7GKmQeTtxL86WyaHQG9Uev4QePJjh7TOntMJh54Sn+I4am5uam5y6GhTZgBKK4wN7+EiWnRB0/D6wW/4gFglUtN2ehAQO834fYwppZ9njI1MtN1PCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0U39TwFYbpNGYJoPfyPAkCxXOayqwb06iIFf+ZL/dzc=;
 b=ST87GIPR2aOtQOufQABspEXZZs+BVptigTYIZa9CUQA9iiATfYchvGGAW7u9Fw7O48iuc/tJOXk8tQo1Ig8XCfGQMb+VqOny+LhuzveH49cXDfVXOiLc9XH64p05cT8Ng5elytoDwYXOlfbdHYpXbWCNDY2dsJOggZf6Lm5B3h0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2495.namprd12.prod.outlook.com (2603:10b6:802:32::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 19:46:07 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 19:46:07 +0000
Subject: Re: [PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-13-andrey.grodzovsky@amd.com>
 <0e13e0fb-5cf8-30fa-6ed8-a0648f8fe50b@amd.com>
 <a589044b-8dac-e573-e864-4093e24574a3@amd.com>
 <356d03bf-e221-86b1-f133-83def9d956bd@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <8997d1b0-8f7a-e8dd-fabe-212fd181e24a@amd.com>
Date: Mon, 17 May 2021 15:46:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <356d03bf-e221-86b1-f133-83def9d956bd@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
X-ClientProxiedBy: YT2PR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::19) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:19e2:b915:59c1:4860]
 (2607:fea8:3edf:49b0:19e2:b915:59c1:4860) by
 YT2PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Mon, 17 May 2021 19:46:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e81759c8-17dc-47d6-ba36-08d9196c69a4
X-MS-TrafficTypeDiagnostic: SN1PR12MB2495:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24951EF8240C826DC449427DEA2D9@SN1PR12MB2495.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2iEtMoBSRUkATrxAIY6iAp7rEEdMWX4xTp2wLVQTrWbT2fuRkF40Ix4D5YEzVKgDUZGiskz2Q9KurMelLuVDJIGdVMD/990EQ0Vfsk1njPYQtFdgnTs06aJF2MTY0YEeeA2PUBQdM63ze5satnyR1E+hdp6WVtAxmxQOrfR/APf6NgQN3NuMn9XqklqadaypoIVrIRLAJWhSN0JcQfHnNs9tTxzyVPxF+yKyhwPNfJR6qr46Dhh/yUcUspYlQkNYPqBaNFmJsendI2CPx+QptZJheIvnauviqxFVhn9/5fFhMCYu0hm5bgG3AecSg+yELi87zPqvMFsLnoqWrgVhSL/WgQja+P/PvwGt7y/7UlI/VxytnB1y2hg52rl9bj282cXr+zTTJdE9L7jlycgEck0gNTJ3qGAqcTOc7Gs18eYn1qa1fDED3qtlNCvrxW8gPmR3Ch/szYVsS/lIq5rdjdLZkoYH1HZ5tAVAd2L1stze5slCbMASqRGmUEPmjsOx6kJ/UCKwFkvP2u6swRqUapzeDerjq2A+V5jq0nkqojXagRHwojOSZ6mTl9tQjjOycUrv4Au9NYieHFNZKS38gaHJVtOJp/yg6x9McFM+BggW1qlb5OkZQ1zS5tVwDhetParjsnzZCmnq2N4bccXCEUw5fDfkHCykyP4pOSrcmXattrda+eoQofPObZP1qy6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(44832011)(478600001)(31686004)(66476007)(66556008)(4326008)(66946007)(8676002)(36756003)(6486002)(8936002)(5660300002)(2616005)(38100700002)(186003)(6636002)(16526019)(86362001)(83380400001)(31696002)(53546011)(2906002)(316002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SXVnOWdiT2hlc2Z4VE01aFMrM1lQVjBvU2t5MzhpNzJ1VzZVOWNLUGd3WCtz?=
 =?utf-8?B?ZzZEa1AyZFBGeWRmSnEwQkVJM0M1V25MNUZyem9jYkxHTnZzL0s1bmY3ZFBM?=
 =?utf-8?B?M25BeEFna3Z2M1h2RG5FSmVMelVXc1E1S0ZMcGJXM1BRZDVUREhNR1dJdGYr?=
 =?utf-8?B?MmNmampZR0ZiUjNpQzI2dWJ0eHl6cVZWOFY5MlA1VkhGVE9ZRWR3ek9uMXdT?=
 =?utf-8?B?MUlsdTZsN1YxdFdrbDM1RDA2MUZOdG43Tk1YL2ZhNE54VnVMZlRjd21oY1Jh?=
 =?utf-8?B?enp3RzZ4SXVhUHordk9IM1B5cnZab0REajBlZXdkSFFYUmdHbzc5anpOMTVO?=
 =?utf-8?B?M0FVOVZvOTR5RjM4ZFVzQ0FDcXROeUxNVFVIZFZaejNRVStIeHJ2MHZyeXlZ?=
 =?utf-8?B?WlhlOFJQUTgzYnpURkpxbDdjMTNoUGZiMGMvOXFSTU9pRVBsSi9JVHVnK3lN?=
 =?utf-8?B?YlJ0UGxyVDZMRFIzM3k2OWhzUm1lWjJmQ0F2UFpFSUxsYmJUaE13UVFqZDg4?=
 =?utf-8?B?ckdaUFpHYzN5VEo5TjZYUldhYlVZV3p0Ymd0SXFmaFRZeUd1clcyNTBtc1A2?=
 =?utf-8?B?NHN4VWVJODJDTHBNSXgzbnA0OTNXbjlCVXUzdkg4Z3Y5UzZsRlgzQnFuUC9h?=
 =?utf-8?B?eHJoQW53cG9ReGM4WEw2WndwZXlieDVCZ3pXMUJQSU1iOGFadW1mSUdZc20w?=
 =?utf-8?B?NEpHYkM2SlpDMytVVkdJNTVSS1dtL0FzZVp5WDJOREZEdFBPekdxbHVrZktq?=
 =?utf-8?B?MHR0ZG8vZHFmNHJETkowVHplNTg4UkFoSGU2QUVXM0hhMHhoUjFWeVhBRlJB?=
 =?utf-8?B?QkJtTVZEeG5tVnpKaHZRWFo1VHFKOW5ET0JiVG02UWRqMGQwN2J3YnFoQU03?=
 =?utf-8?B?bTlobXl0ZzlYaUExY0RVOEVjZjNLYStiMjJIN0hTelZjSUxxNnVudk9vNy81?=
 =?utf-8?B?RHBMTFVmZHJKTnVoaHhZbU1VL2xjZU9uUFl2RmpaVHg0Q1FWVzNmNU9DYVhi?=
 =?utf-8?B?OTNTWVk4bWduSU9DWm1WOXV1YzBULzlGNDZEalppRGV5K2RmNnRuamtZMndX?=
 =?utf-8?B?UW5YNWZYZ3BvWEh1MWFVM0owUyt3UWozS2VWV0dqdmhhMkY0NlcraERCRlBt?=
 =?utf-8?B?aEdpT1BUSFVvM0wrd3QzOThzUFlLLzg0K2RuZDIydjlXdWM2RjZmZEx4ZDJG?=
 =?utf-8?B?U2Z1dUdzVWZxalQvcjhKV1BNb3liSEQvOUdjR2I4M2VZZ3ZiYlZSaUVwRE9G?=
 =?utf-8?B?SElUZ2NoczkrOGxpMGNreGN3Q2hiWHVpM0pTeXlIdUhmTzBkM1BLdzczMGUr?=
 =?utf-8?B?b2tJOU1IQnN4SXdyd2xGZVdad3BtT1B1REMzWk55UElHc3RpWjV0MzNNczVj?=
 =?utf-8?B?Vmw3WTNDY2ZhZ3VXRmdQeVJlSXNiT0FqYjkwMVNqZTdxaHhGbXVyOTRYdDhy?=
 =?utf-8?B?Z2s4MFpJa2ZnNlNTQ1V2SWRRdEQxNktDOFZqK3JmaUo5SklnZkRXQW8yUjJT?=
 =?utf-8?B?dVRCQ0RCSjM2RHhNN1dYUzYrZmZZM0wwVmNLSFc3endMS2xuTGFLdm11MkRP?=
 =?utf-8?B?Z2F3SUVtbW9hRGE2MEZHcHVzZWg2S3hsZ3plRVNqRk56RWxNWXRRUVFldU1k?=
 =?utf-8?B?NGd6TERncVlwZ0dIa09SN0hRSW95R3dKb0RVYXFYK0FwZmJwU0FDNzBDanV1?=
 =?utf-8?B?T1BoYXhoN0ZBa2RPSHBVYXl3RzRCZ0U0TldXQ2ZiNjRpalVFMytoLzRKS3RJ?=
 =?utf-8?B?UmU3dFVYSmFhV1BlTUZHanBuWmZ0Sy9FclFCbDN2aDlmTDJpMDBnVEphM0hn?=
 =?utf-8?B?WjgreFlnNGVML1ZBQVlFdVJkYWpqZXZNWXloNHBLVGN2YjU2ckxHOWZBMnY4?=
 =?utf-8?Q?Ni+QFn6LjK8Xi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81759c8-17dc-47d6-ba36-08d9196c69a4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 19:46:07.1360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiRuSn7gDwgYLimVB1e2NP0sDjC/LhuUhISnfuLKLgt8JTVPJl9lL//Qk6eBGI5/7QMhJTPpctiz6zECaJVRPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2495
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yep, you can take a look.

Andrey

On 2021-05-17 3:39 p.m., Christian König wrote:
> You need to note who you are pinging here.
> 
> I'm still assuming you wait for feedback from Daniel. Or should I take a 
> look?
> 
> Christian.
> 
> Am 17.05.21 um 16:40 schrieb Andrey Grodzovsky:
>> Ping
>>
>> Andrey
>>
>> On 2021-05-14 10:42 a.m., Andrey Grodzovsky wrote:
>>> Ping
>>>
>>> Andrey
>>>
>>> On 2021-05-12 10:26 a.m., Andrey Grodzovsky wrote:
>>>> If removing while commands in flight you cannot wait to flush the
>>>> HW fences on a ring since the device is gone.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 16 ++++++++++------
>>>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> index 1ffb36bd0b19..fa03702ecbfb 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> @@ -36,6 +36,7 @@
>>>>   #include <linux/firmware.h>
>>>>   #include <linux/pm_runtime.h>
>>>> +#include <drm/drm_drv.h>
>>>>   #include "amdgpu.h"
>>>>   #include "amdgpu_trace.h"
>>>> @@ -525,8 +526,7 @@ int amdgpu_fence_driver_init(struct 
>>>> amdgpu_device *adev)
>>>>    */
>>>>   void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
>>>>   {
>>>> -    unsigned i, j;
>>>> -    int r;
>>>> +    int i, r;
>>>>       for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>>>>           struct amdgpu_ring *ring = adev->rings[i];
>>>> @@ -535,11 +535,15 @@ void amdgpu_fence_driver_fini_hw(struct 
>>>> amdgpu_device *adev)
>>>>               continue;
>>>>           if (!ring->no_scheduler)
>>>>               drm_sched_fini(&ring->sched);
>>>> -        r = amdgpu_fence_wait_empty(ring);
>>>> -        if (r) {
>>>> -            /* no need to trigger GPU reset as we are unloading */
>>>> +        /* You can't wait for HW to signal if it's gone */
>>>> +        if (!drm_dev_is_unplugged(&adev->ddev))
>>>> +            r = amdgpu_fence_wait_empty(ring);
>>>> +        else
>>>> +            r = -ENODEV;
>>>> +        /* no need to trigger GPU reset as we are unloading */
>>>> +        if (r)
>>>>               amdgpu_fence_driver_force_completion(ring);
>>>> -        }
>>>> +
>>>>           if (ring->fence_drv.irq_src)
>>>>               amdgpu_irq_put(adev, ring->fence_drv.irq_src,
>>>>                          ring->fence_drv.irq_type);
>>>>
> 
