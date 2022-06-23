Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89CD5572BE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 07:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD4F113DB8;
	Thu, 23 Jun 2022 05:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8D0113DB8;
 Thu, 23 Jun 2022 05:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxzEFoxhmF8IPrzk/ktfGf4w5zl5+HAe2d3/4aLhjSMroRznI+qVuDiEfjukdEmADlbwEoV8rqx53yhMQ5cDpGmIMEGmX0zr0Wf/hd2jUX9O+TTRf6q6ppIOyoPe+cKxWGysEEYdXMEjayI4lDetj3Dsa6VSXHgA9apdDcAdynvR2HqmpXQkUZ+18W02yR5olg3WPuYjfUAnA+dQkg2l7jiI9OgRiFnfSvVLOXdhxXcQ+L1sRCDQsyash7gnDVf4CSpQVzf85fBmxyoIgkPB3JYUSkTS9OP8GM6KvpRMpSMzORxTWpDJYfwl05gPt7QWU8CY6WCXJLgAkgJoVfCbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGfLkXJGwoLWOOfeM5JD+utaGfWd9rVIRlgme0Pmur4=;
 b=gBUB5MoD7Pbx36JywjbEN2F5PSKYE0j2C5s+Abl4ojGhqnQAuqgdkV6p8SbLdm+fjDUImRGTZeCBoBjZHaEYc8WXyoeYJsnkFfq/Twt3bCasrRGefr+d7pG6Xp/ip0KccuHm6x7OERXbVTWKoJUZI1e5QlFpC7ddewYjNVgL37Dq47I7GmaEnWM3mTWmONa0qw/8kLZavUrjctgSDHwIfUhWnc+Sm5TulqYMieIlRpYz7Zfls+nlS3G/kMbI6LoS357wAOsg771zbPvJnMap64P6TBEbLGaMnWXgkWtV2Ji6fmhcnJw9Vv8PhiRPh/idPO3b3oNrlJIKhjEAbn3+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGfLkXJGwoLWOOfeM5JD+utaGfWd9rVIRlgme0Pmur4=;
 b=WUnRctNPvN3N1PKmwSSMGOlCLHruvVIsVIZwpPZCKaB7WTa1FzvbREuQuUj9wTLwBm8lzDFDIfCccdZQQnu/m7IfdP3feQyh3lkFSuc/XKOTPIjAH4uY8Wz3J5bbridsNtkR9LTLfXQUlOA2ZRw1HNt69Gqdf0SUzPV4e2zjgBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB2844.namprd12.prod.outlook.com (2603:10b6:5:45::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Thu, 23 Jun
 2022 05:57:34 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 05:57:34 +0000
Message-ID: <8071f11e-e888-8c09-de53-f24f9942fc17@amd.com>
Date: Thu, 23 Jun 2022 07:57:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] drm/amdgpu: Prevent race between late signaled fences
 and GPU reset.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-4-andrey.grodzovsky@amd.com>
 <5b6b623b-9a6b-a615-d7ea-af436f1b4d92@gmail.com>
 <ad87356b-4018-ce95-317a-bfed07b7f745@amd.com>
 <d87567d3-b6a6-6f10-fa24-222a96525e36@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <d87567d3-b6a6-6f10-fa24-222a96525e36@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0502CA0061.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::38) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 289ce3ed-c52d-484a-765b-08da54dd4490
X-MS-TrafficTypeDiagnostic: DM6PR12MB2844:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2844ACD212659332412C996283B59@DM6PR12MB2844.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v+7FYLq06gLA7KQxlGMfTO9P+vAaE1Z31g9M6KrYQRmA78Og0ogvwGqQwsG/ZzaVVSP/zRO45MCORFZ+mKOpgL8OqIdxv4mXkUQlMja5SzxSNniSuoKHDoy9KqzgE9u75WQamPbzqdUgVuGmN1UKl4hSzl6AbvuRRm+gUTXnjbHoB9aH7nhm6Uynr7+7eV3Op7zaE0i0B7VAtcoeyhoRtoo3Aek7EHgUmaM2nmV3yF/8WIJ82gOlkgguWAIBWyQKTanW4TLL+DshZFLJlGPDcvcQVsu5rFCDeTgUlT8ys9UjFihQaf9BWfK0itfwvqN8LnP3VWvUviD71RVw6CRzHLgLa8gfJVGDZR+61SYsH57Kae82JFpxzqUPJhzQLWMjLkNK3Sk4R9gteiLOSX7lEn+nCN13isc18mljFqMiYLGFGCYpLb+tdwaaVbUPRqh9UUw/WZbGLg0jKjDBthxyYhWlNJ8pjpKXSrJUhuAglSlRq5PGPxoRuk0UnfzvVroU/jO6a18pz53gzGrKxX0Rn8nPnatC5mnYdI/UFXYuSt1x6Rl2HSgWWyIq/UourLmFo+68So5T/G6hFdnSTVLfm1WpIorTmR3/MBLyyiM6dhmXycRiw6/iXoqvH6crFWl0cBcxwuBPpRA0gs9IgyFbPmT54qiyG5QElahCqvFBXRqOYtf83loutUQ1Ab1wgZ7F8MKZ9gZfKuOq1fNB6Mgnxc91IYc4cfzGTMp5HQ1zMmdOnqcTcqSaRNACmbKo390Va4DhHRmQI4Js0q/jPl5DSTGa5TW10/8qK72El1kJeLg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(6512007)(38100700002)(31696002)(66574015)(26005)(5660300002)(83380400001)(186003)(41300700001)(2616005)(86362001)(2906002)(4326008)(36756003)(66556008)(31686004)(66946007)(66476007)(8676002)(6506007)(316002)(478600001)(8936002)(6486002)(6666004)(53546011)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXc0bjBNYTVZV3BCUFdENVROUVdzQmE0ZTdidXNGOFFkTDRsaVBLdW1VbmQ3?=
 =?utf-8?B?Q3BrVE9sYUFTdndyOTdBcFE1VW5VcFYyQ3hHeFJFd0NlRE1Pb1J4bGdLZkI1?=
 =?utf-8?B?Q1FGUVJuR1E1YzMzbEw5Q3RGZ1p6RHRXeXBSZ2VYK2pmSFg0dzd5NkNVRmxL?=
 =?utf-8?B?MmxoRjVHdEZPUmRnSi9KYXVpalVZWk9FeHZ6VXhwQk9waE1qWUJCNlJ6K3Rr?=
 =?utf-8?B?U2ZlTVZOTFVnZ2kxQWYzSDE3czRmNHlqK3JCU2M2eEs5ZExkc09oNTJZaC92?=
 =?utf-8?B?RUtTUHRHOCtXeVRDblZWR21PU0ZLcEdVTWxRbEdibmJxbHQrQzc1MXFYR09G?=
 =?utf-8?B?aC9TU3BQK2F0UE1iMDNxRm1YYkVIZXhPL1NNbXRmdW82MFdtY2Y5ZW5yTkhm?=
 =?utf-8?B?MjNtN3REcUJsSy9ya2xramZocjdSZjV4b3VWQTh1N295UytGQUxOMGpFSFNO?=
 =?utf-8?B?UDRpcUtRck1mclZ2V2p4K3dBVmRvVjRlWTA5QmVQVlVUWExoRXlZWUdEZzE5?=
 =?utf-8?B?M2dBMC8rRFVEZU16UDgyamMzSXVhSXVvUStyZ1hwaFNXaXQ5Y1gzQ0szaE1H?=
 =?utf-8?B?b0t4UHUra1RiRnNCYnR0c0hrVlhvUFlUR0JWV0Y3ZXJUOG1INjJ6VnJmUkxr?=
 =?utf-8?B?RXhJZFdMRk9YMkorTVA0SWxKS1RPLzc2U296b3M5RCtXUVVQTmVMelZuMTNX?=
 =?utf-8?B?VDNtUU1UTVJyU21SaEVRbkNMTkZkc2dQQzZYMG1oZEFUVGUyTUVhK2k0M2po?=
 =?utf-8?B?Q3RMK2tOcVJkOFUyL0xwWkRmVlFOOGdSQVlraVZwVzFWUk5yWE01cEZ4WW5T?=
 =?utf-8?B?OGl6WTRvK0VVZ2hyNFhsZGsycGJYTUNsbXZzR3RMNHZTd3BaZmtzQ25peW1J?=
 =?utf-8?B?TmJ5VXJac2JuSnk3dVVvMTVzL3VyWHlYZWZSWENvUjZKdWRISEJzd3d5djNh?=
 =?utf-8?B?Wi84Z090bGV1RmpsWlRCRHcxNEcwdGdZYUFEd29qcHhuaUVOR2tqZCtUOEVz?=
 =?utf-8?B?WFR2Y1VlNlRUWHlhTitvakhxdmNZR1laNCtxek1jSDcvOVYvb1JLWUZBZC8y?=
 =?utf-8?B?VUlJSkJwWFZtaXRDY0kwcEZpSXA3V3dPZkFYTG5JNUdPOThLakh0RlEwVVYr?=
 =?utf-8?B?dy8yTEJRVnRtdGlJZ0ZMWHZPYzBZd2owTjhFUHEwZ3RFM211bmVtbzVORERQ?=
 =?utf-8?B?YjhhRC81QUFrekJuRzBNZEkya2lFT0pPM2x5WEVXYnllekRTWmRBNVhpRnRU?=
 =?utf-8?B?cnQ3WXVZRm1VUjhVZzdkZXlqVTM3STVpQnV2TUNCTVZhMzgvRjFXdFBjK2RC?=
 =?utf-8?B?cUtjcFB5MFM1TUJSM2YwbXF1YVJPWFgwQlJYQnVnTUFqV1hzWk9heVlIeWE1?=
 =?utf-8?B?VVRHUnBwb1BiNDY5aCtETkJZWHlHVmtNUzQrWTVlMUZPZHdiL0ozcXNSVkVD?=
 =?utf-8?B?VFlna3dQck5TYjEzL2ZCMTU3RXhweCsvK25oRWZ4MTdoamlDOUJJbVVZV2xL?=
 =?utf-8?B?K2czbktJQ3dFMlhxQnFuem1XZ1hGQ1I3Z0ZPZTFMTW9VUnhZZWg3YTd6dTUz?=
 =?utf-8?B?Nk14Yk5KcVU0ek5VVHkwY2JUbmMxTGxYa0hIeVdsSUdkZU4zZURFMzRPZm5q?=
 =?utf-8?B?TkROa05HOXYzS2dIUElTVjhLV2ZiZkk2UUdiYUtyeTNwMXVwcTRYZjRFOFlR?=
 =?utf-8?B?ck9ubUlGa0hsT3RMRStReHdPc2h6NUJrWVAxc00yZW0vaklLNy9PRkQ4d3h6?=
 =?utf-8?B?dkxJQVdCbGQwVTE1QXFOVjNGcWl6cHlOV05YNlJ1M0E5ZWF2WTlpbmVHL0oy?=
 =?utf-8?B?UzFPWlFFNjNpdUhTb0lGaWVReXg0MFJzWURhdHFNUkdINHpTTGoyclVHMVpT?=
 =?utf-8?B?Q2FkVzBMcVdWczdRcEdFU1VKQllTOVlDc05SU3ZmTC8vaTBRdVN0ME05TnVM?=
 =?utf-8?B?ZVVoanZSKy9PWFVSeC90aW1jK0ltM3JCYmxjNmU1Uk5sY0Vvdjcwak1xSmlR?=
 =?utf-8?B?YUVBOTdPZjNwVlVqZWJBM1VFUnpOQ3dkYmZyN0dZUXlVSkZVMm4yWXV3cXl2?=
 =?utf-8?B?STlCcm5uSy9WV3dVdFlZOHY2VlFZbXBmSXJSN1JyUFV3MXpKUC84Z2M4RU54?=
 =?utf-8?B?OVpHRlV4bU8yeFUzTlF4Z1RranRwemhVMGY2MjNrUWp3c1FFdFQraTZHbWxi?=
 =?utf-8?B?Qmc5dEhNenZzUkhlNGFNWEZsSWVSc0R1T2ZnWGlTRTVRTGJIK1F6RWVvQ0ls?=
 =?utf-8?B?cFIyRFp0aEJEelh6R2NCdFhSRzNFYjB4WjFnQ2EvUzREQ2xFTldwaVN0Uk5z?=
 =?utf-8?B?dVhDZE8yWVVVOWNpaXJlT2MySnNSRzJlMFJMdVhER0x0aHc2MTV6dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 289ce3ed-c52d-484a-765b-08da54dd4490
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 05:57:34.3670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epVEuEB4Ag/bv4OX2wJH/k9mx/Ga7YZCE085RMYghltfxTiOSquDMto978lfoyeZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2844
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
Cc: jingwen.chen2@amd.com, monk.liu@amd.com, yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.22 um 19:31 schrieb Andrey Grodzovsky:
> Just a ping

You need to give me at least some time to look into this.

>
> Andrey
>
> On 2022-06-21 15:45, Andrey Grodzovsky wrote:
>>
>> On 2022-06-21 03:25, Christian König wrote:
>>> Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
>>>> Problem:
>>>> After we start handling timed out jobs we assume there fences won't be
>>>> signaled but we cannot be sure and sometimes they fire late. We need
>>>> to prevent concurrent accesses to fence array from
>>>> amdgpu_fence_driver_clear_job_fences during GPU reset and 
>>>> amdgpu_fence_process
>>>> from a late EOP interrupt.
>>>>
>>>> Fix:
>>>> Before accessing fence array in GPU disable EOP interrupt and flush
>>>> all pending interrupt handlers for amdgpu device's interrupt line.
>>>
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 26 
>>>> ++++++++++++++++++++++
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  1 +
>>>>   3 files changed, 31 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> index 2b92281dd0c1..c99541685804 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -4605,6 +4605,8 @@ int amdgpu_device_pre_asic_reset(struct 
>>>> amdgpu_device *adev,
>>>>           amdgpu_virt_fini_data_exchange(adev);
>>>>       }
>>>>   +    amdgpu_fence_driver_isr_toggle(adev, true);
>>>> +
>>>>       /* block all schedulers and reset given job's ring */
>>>>       for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>>>>           struct amdgpu_ring *ring = adev->rings[i];
>>>> @@ -4620,6 +4622,8 @@ int amdgpu_device_pre_asic_reset(struct 
>>>> amdgpu_device *adev,
>>>>           amdgpu_fence_driver_force_completion(ring);
>>>>       }
>>>>   +    amdgpu_fence_driver_isr_toggle(adev, false);
>>>> +
>>>>       if (job && job->vm)
>>>>           drm_sched_increase_karma(&job->base);
>>>>   diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> index a9ae3beaa1d3..d6d54ba4c185 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> @@ -532,6 +532,32 @@ void amdgpu_fence_driver_hw_fini(struct 
>>>> amdgpu_device *adev)
>>>>       }
>>>>   }
>>>>   +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, 
>>>> bool stop)
>>>> +{
>>>> +    int i;
>>>> +
>>>> +    for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>>>> +        struct amdgpu_ring *ring = adev->rings[i];
>>>> +
>>>> +        if (!ring || !ring->fence_drv.initialized || 
>>>> !ring->fence_drv.irq_src)
>>>> +            continue;
>>>> +
>>>> +        if (stop)
>>>> +            amdgpu_irq_put(adev, ring->fence_drv.irq_src,
>>>> +                           ring->fence_drv.irq_type);
>>>> +        else
>>>> +            amdgpu_irq_get(adev, ring->fence_drv.irq_src,
>>>> +                    ring->fence_drv.irq_type);
>>>
>>> That won't work like this. This increments/decrements the reference 
>>> count for the IRQ, but doesn't guarantee in any way that they are 
>>> stopped/started.
>>
>>
>> I understand that, i just assumed that the fence driver is the only 
>> holder of this interrupt source (e.g. regCP_INT_CNTL_RING0) ?

I'm not 100% sure of that. The original idea was to enable/disable 
interrupt sources as they came along.

>> I can disable amdgpu interrupt line totally using disable_irq - would 
>> this be better ?

Yes, that's what I thought as well.

>>
>>
>>>
>>>
>>>> +    }
>>>> +
>>>> +    /* TODO Only waits for irq handlers on other CPUs, maybe 
>>>> local_irq_save
>>>> +     * local_irq_local_irq_restore are needed here for local 
>>>> interrupts ?
>>>> +     *
>>>> +     */
>>>
>>> Well that comment made me smile. Think for a moment what the local 
>>> CPU would be doing if an interrupt would run :)
>>
>>
>> No, I understand this of course, I am ok to be interrupted by 
>> interrupt handler at this point, what i am trying to do
>> is to prevent amdgpu_fence_process to run concurrently with 
>> amdgpu_fence_driver_clear_job_fences - that is what this
>> function is trying to prevent - i disable and flush pending EOP ISR 
>> handlers before the call to clear fences and re-enable after.

That should be sufficient. When a local interrupt would run the code 
here wouldn't be executing.

>> I guess we can also introduce a spinlock to serialize them ? Yiqing 
>> reported seeing a race between them so we have to do something.

A spinlock would be an absolute NAK because we have been working quite 
hard to remove them (for multiple reasons).

Christian.

>>
>> Andrey
>>
>>
>>>
>>> Cheers,
>>> Christian.
>>>
>>>> +    if (stop)
>>>> +        synchronize_irq(adev->irq.irq);
>>>> +}
>>>> +
>>>>   void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>>>>   {
>>>>       unsigned int i, j;
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> index 7d89a52091c0..82c178a9033a 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> @@ -143,6 +143,7 @@ signed long amdgpu_fence_wait_polling(struct 
>>>> amdgpu_ring *ring,
>>>>                         uint32_t wait_seq,
>>>>                         signed long timeout);
>>>>   unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring);
>>>> +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, 
>>>> bool stop);
>>>>     /*
>>>>    * Rings.
>>>

