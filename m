Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5B7840F4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC22D10E345;
	Tue, 22 Aug 2023 12:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B578410E344;
 Tue, 22 Aug 2023 12:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLSjtaB2/w8HPNO7udTEVUd1ONGp+q/yEdMLPcxN67Stgc4xtUKG5o+ADxdif/Nz9M5M9pwRzCZs2i4yNpyi1357oyD0WeUWlF8zPrFTEEjvBrkBn+VpN+8OSny5ZECo4hk626FFr0nzF6owWaCbK+Nlu7hUWZeb2bMEftLDB1N9BLZSoMCpfnmMP7Gda09isLQE80OVMDcPVQTXXqjMkzU0JplHZc+Hp90baMEKYqyzkD9UOd27m+7LAjW9v6tCCQpNkLkelIP0DuwRLp8nO9KsmSSTEWYJbs/pmiec6o+cS3rnIGEWM3FyS4WZJeruCNPkSOKyFFeaDpLymyK03A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aq9ZzAAU3F4mt88wEm/Qt2brdCUJpLs5pz+wAADsW+4=;
 b=KObvLjfCNsxH9lEGBjIIrPFiAFtjw8n6NXd/JuJZQiKrGpcEmdhG8j70mEiaPx6td/yRa/s2bLweblyQkLPvQEFtYTpi2vhFtcGJjy1xFFuZ2J1KELO1i0BxWwgKlHhQMvqWZogikzJhkxiIe+Y1sKcj6F9Eeswfyk2HwSPgNHdlc3e7zIstu5CaL/oZt/P3EQfngZVuuJ42GYdCgEzojhq2DamDDntfYaMptwkpotQr7KpEpW3elDeu7r8j7bv5HybjGFUtpAzKhGXN5IJy608AwW7ziWKv1valjajGuQRCmvmIV9al9Z4g+D5IxjTMQkUHnwSykFb0jz6T8h30Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aq9ZzAAU3F4mt88wEm/Qt2brdCUJpLs5pz+wAADsW+4=;
 b=IcYDk55bLj2fKo9eg1rtDclaIZd0yX9ER5ygLlE4Iyw31WrujiQw7gjrOZ3E+TAneAMOLxaBTnd1C00Uy8MLBPHNHDfADtE7BwIf64XKpDaNr+HxdLPvjus6/AfVmeSksxHc9rTuR7NfWvd5Cyy3FcuTI2hbyHN/r+6Dw9zHEAg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 12:40:36 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 12:40:36 +0000
Message-ID: <48aa2c2b-922f-0946-2e08-a85a64693246@amd.com>
Date: Tue, 22 Aug 2023 18:10:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Add new function to set GPU power
 profile
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-3-Arvind.Yadav@amd.com>
 <d57e6480-fd33-b05c-f3a8-cd6e6b87b3ac@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <d57e6480-fd33-b05c-f3a8-cd6e6b87b3ac@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::11) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: 26143606-d4a4-4e68-0772-08dba30cfba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UjoSUVq397U+1FCRhdILDYVjK/APmUe7y0uIvHuyX82YUxlHpS0h/FdZePJliJxu02Obfv63Tfm+pFBB6545TDLuy0NUfa/q9B+kd2QjQVfG/rKH31JFTrh5ZhGJmd/anMfP5MNCNJdR1q/8agXoIxVf64FXgwWB3W3zJtEHz+SDEdnII80wJArErR9ml6en81VqI4s9Jn11JrNds3MmNc6ulgeRhFA/hLNqT3QPvXKgVFagfj5bxtbFBxdvcelTNwrxyPBGY1ub9t2xJfdcKIg0h1iXzo0th86uOCPuCYkcFEoOKVozC6BgEilB7ndkjzwfwrF9+WKqphd2AXVE/prH6HlFN0b53z6vp47/5naJSb66q8PJRu7hjvrDoAI2hEEPqB/ZzuuPfV1gqDAsr2rznA4Em9ydTk+62JzxQY1Z+hXbvNGZr3xrKG2peMzaOVSTUIazyjdRy6yNs3a+534IldVJFRkd2Z2VWFV2cO/CC+pRp/ifyw228M6PHzl4c2gClg72qQaQmFdeVI2k+0QYj0+LPYAn3RI5uBt0qExoL9gIXYknZXFxwfUE9klOW0V3N+K/h7CzI0FWgh/fJyL4r0/63sb4YSH3Kxwp1p3rUDYpPb5MIbZNhJCVFFJNCc8ezPrxEq7fdrVXDUfL2Sx61uG8ah1lijTn2Wkyv50=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(186009)(1800799009)(451199024)(6666004)(6486002)(53546011)(6506007)(6512007)(38100700002)(31696002)(83380400001)(26005)(36756003)(921005)(2616005)(316002)(66476007)(2906002)(66556008)(66946007)(41300700001)(110136005)(5660300002)(4326008)(8676002)(478600001)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHlzbEJCVS9QSC9NMk03Q2tiVTJkTGxESGdiQ0JDbDJ2bzhDcFNLemwyZXJ6?=
 =?utf-8?B?NExNZ2lBcDMyM2QxQWZSNkFxZG5ybXVqT1B0NVExWXA5ZTVNb0plU29qVFBp?=
 =?utf-8?B?cTdWazBaUUI4bVdFeW9uaWlBTnpGcW1jODFkZmF4Z05KU2tPVUdYMnBGMHJq?=
 =?utf-8?B?cFloV2dMa0RjUEhLMndkU25rc0d3WjVXcWJXUG9QMGtEU3FWY21rblVKUGoy?=
 =?utf-8?B?Sld6N3NtV1IzZ1VvdDhWWFdXbGlIT0NOanZoOVd4QkF4ZG53a0xTdk1COCtX?=
 =?utf-8?B?QlVLYnJ1anphdzJObzcyVVU5ZWU0dE04SnJyamszYVkxcGpMQUpjaDV6VjQw?=
 =?utf-8?B?ZzlGMnozanpEZFEySjc3VXhCeDJEem1xZnVLYzF5VlFJL1FHNUVLNW1oTjlE?=
 =?utf-8?B?M0EralFoY2NzdHhyUmtjYnAzbm9CS2piYUJwNWNsblc0bWs5WVZCQnVIWnNh?=
 =?utf-8?B?QWxaanVVL3E5M2FmR2NjTzYrWCs2ampEbzdaTWp4Wm9JdjZXNFdMQy9NZXEz?=
 =?utf-8?B?K0FjajdxeXU5c3ZXZXJIaktxWGp3YUtzZTNtWk1HUU1Iak5scmxVQXhJN3pE?=
 =?utf-8?B?R3U5NFNLVTRtWDNZZ2s1NSthOHhKK2tDYWU3SEc1Ynd1RUtjbkFiakJPWUp4?=
 =?utf-8?B?UHlFZ3dqUUkvNkpvUFdYSWxoU0xlTWxLVGQ4ZjN1UTFvMEpmRTMwanRiQ2ky?=
 =?utf-8?B?SGNHV3JEYTQ4OXRiblFDTW4yVmZUVEtOMTRZMkEvRTR3TGVDOVQ3NHkxWFdo?=
 =?utf-8?B?a3ZGSE1SZGNTbDI1N2xHTWxBa2pFSUh5T2pCVmIzU1RkVHVvS2d5Q3gyUytJ?=
 =?utf-8?B?K01kbXRiR21hck12TC9UZFREMndrNnNiKzNsTkZIK1ZhS0M2WEh3Z1JhTXJP?=
 =?utf-8?B?N2dsRlpWOFJXeEtvcm5QVWE3QkxSeXAzSFpXOVdueWRFS1oxUlloa1pMTWtL?=
 =?utf-8?B?MXZCS2lnRWxsRGpkVUJvWnJCVmZjRG1Yc2I2cW9QQlozOG5FNFhhS1lyWkxT?=
 =?utf-8?B?bGp6cUdkNFBidzVWKyswdmVxdHNhYTY3VEpaU1FPNWwvQ21XQ1ZPQm1vOGFk?=
 =?utf-8?B?UWl1cUJadWxzRUtsaldQbXBCR2hNQ0F3cFFUbWlmOUxqSVBDWm9Rcll2Tm5J?=
 =?utf-8?B?azZPVnAxcnp5YVFVSmxLZVE3UG10aXl3VUdQb2hTbXY0R0V1N0pnT2tIRW9K?=
 =?utf-8?B?RUh2Z1p1N1krODI5M1ZyWmZhRVVOdFlYREk2SVNOTVlxd093Yi9JUmQ2cTVR?=
 =?utf-8?B?Zks1UjVWam9DcWZYZ2wvVGQ1QzlLK3ZZSncwSzFTdnYzb055OTFiRmltajMy?=
 =?utf-8?B?TmtXZkNYWCtJc1NIREtLQnZRZW5zS3E1Um5wUHpYZGtGYUVKN0lmOUlmQzZH?=
 =?utf-8?B?SUJycVNVaGJ1bUhES1g0enRMNGNSNjQ2UUZ1dnhiMm9ydExIWnBmdW1nNXJ1?=
 =?utf-8?B?VG92dUpJVDVXYlNBZGJLNlNWVGh5TTByOHBHVmV6L3JjZDRDUzhMVFE0V2J4?=
 =?utf-8?B?N05wWmdsTVh3QWh0M2wyS2hwaldOem9ZRCs0VFBmelY2eFRxN0pkOUd1OGYv?=
 =?utf-8?B?bXVORlhpRUtkU2ZWckFlR2hxVExIUFJ4dXFUbVVHQW1ZVkRsam5hV3dURTR2?=
 =?utf-8?B?WEs5TFRCRU9OeTZjTjRET1c1MStuVWI5N3ArZTNyeENxMHR3U0ZWck1Ganht?=
 =?utf-8?B?UWhQaFpnN2trS0FldHNOODhlamtGQXRmQWlFR3krc3V4dXBCT2tGSkl0WElp?=
 =?utf-8?B?VTNBOUFkcWlmeEdheFRoMll5Vk5LbFBoRUpOQlFDR0V3dXlGcFl3SmpGa3F0?=
 =?utf-8?B?enNpV0syY2tDVUVHNyt0ZVVEdnVoUTM2YjlqOWtnNnRvYTcrVWJ0QTlLY21w?=
 =?utf-8?B?MzBhZkYvUkN5RnBYZEdZcTJJV0RaTXF2N0lFcXhmTGJjSjZGaTNwaVpINThC?=
 =?utf-8?B?NytvWnpvaHdzVlR5RnRhdzZqaHR5YWMrYUFhTEVRNGliajRqU1NxZVZ6SVNV?=
 =?utf-8?B?cEZHUWp4aFdBWStoQVZCQ09SY0pQbDhPL21Eek5FbG13U01UK2k1TStzSitV?=
 =?utf-8?B?U25MM2p6Z2ZZeldGS0M3Vk4zblhnbVlTY3AveHBTbGI4bjRNLyt2QllUMndG?=
 =?utf-8?Q?rMeAZh/d2IZ/9b5Ir+3aM1LNn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26143606-d4a4-4e68-0772-08dba30cfba0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:40:36.3103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAebwq+Y/KDkyQ64vSz87cV1w8hOVZ6hCoIC8uM7rzOdEKWUypT3o7Fcuk35XykYFR1fV3e5u4ZXnMTO9B7zPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 8/22/2023 11:55 AM, Lazar, Lijo wrote:
>
>
> On 8/21/2023 12:17 PM, Arvind Yadav wrote:
>> This patch adds a function which will change the GPU
>> power profile based on a submitted job. This can optimize
>> the power performance when the workload is on.
>>
>> v2:
>> - Splitting workload_profile_set and workload_profile_put
>>    into two separate patches.
>> - Addressed review comment.
>>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 56 +++++++++++++++++++
>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>>   2 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> index 32166f482f77..e661cc5b3d92 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> @@ -24,6 +24,62 @@
>>     #include "amdgpu.h"
>>   +static enum PP_SMC_POWER_PROFILE
>> +ring_to_power_profile(uint32_t ring_type)
>> +{
>> +    switch (ring_type) {
>> +    case AMDGPU_RING_TYPE_GFX:
>> +        return PP_SMC_POWER_PROFILE_FULLSCREEN3D;
>> +    case AMDGPU_RING_TYPE_COMPUTE:
>> +        return PP_SMC_POWER_PROFILE_COMPUTE;
>> +    case AMDGPU_RING_TYPE_UVD:
>> +    case AMDGPU_RING_TYPE_VCE:
>> +    case AMDGPU_RING_TYPE_UVD_ENC:
>> +    case AMDGPU_RING_TYPE_VCN_DEC:
>> +    case AMDGPU_RING_TYPE_VCN_ENC:
>> +    case AMDGPU_RING_TYPE_VCN_JPEG:
>> +        return PP_SMC_POWER_PROFILE_VIDEO;
>> +    default:
>> +        return PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT;
>> +    }
>> +}
>> +
>> +static int
>> +amdgpu_power_profile_set(struct amdgpu_device *adev,
>> +             enum PP_SMC_POWER_PROFILE profile)
>> +{
>> +    int ret = amdgpu_dpm_switch_power_profile(adev, profile, true);
>> +
>
> You don't need to interact with FW for every set() call. Only send the 
> message if workload_status doesn't have the profile set or refcount is 
> zero. Otherwise, only need to increment the refcount.
Noted.
Thank You,
~Arvind
>
> Thanks,
> Lijo
>
>> +    if (!ret) {
>> +        /* Set the bit for the submitted workload profile */
>> +        adev->smu_workload.submit_workload_status |= (1 << profile);
>> + atomic_inc(&adev->smu_workload.power_profile_ref[profile]);
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>> +                 uint32_t ring_type)
>> +{
>> +    struct amdgpu_smu_workload *workload = &adev->smu_workload;
>> +    enum PP_SMC_POWER_PROFILE profile = 
>> ring_to_power_profile(ring_type);
>> +    int ret;
>> +
>> +    if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>> +        return;
>> +
>> +    mutex_lock(&workload->workload_lock);
>> +
>> +    ret = amdgpu_power_profile_set(adev, profile);
>> +    if (ret) {
>> +        DRM_WARN("Failed to set workload profile to %s, error = %d\n",
>> +             amdgpu_workload_mode_name[profile], ret);
>> +    }
>> +
>> +    mutex_unlock(&workload->workload_lock);
>> +}
>> +
>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>>   {
>>       adev->smu_workload.adev = adev;
>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> index 5d0f068422d4..5022f28fc2f9 100644
>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> @@ -46,6 +46,9 @@ static const char * const 
>> amdgpu_workload_mode_name[] = {
>>       "Window3D"
>>   };
>>   +void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>> +                 uint32_t ring_type);
>> +
>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>>     void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
