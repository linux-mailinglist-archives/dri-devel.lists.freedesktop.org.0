Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A5A7840A6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCB810E33F;
	Tue, 22 Aug 2023 12:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F37F10E330;
 Tue, 22 Aug 2023 12:22:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNW+Z3jzxScxR8dr7duCErZftMRKhe3nGGB+b3z1h/j1+MoCoe1YrCk65XJqd1+80yU0edEIVTkOk0/VX1nhno/YlRKhgE1fOTHnbbEAXQl0o5EhMGUbB/4NhgHYJDuYlVjU4LbVvN9raFdSpBrGZUT7Bci0i+YuK8hasZyzYjMwqY+1IK/H/89gZfpc3VsON1l877dT9SYj5CwjosOQu92wpifkQiDj6Ii4Ok3S9jxjuE4mqQIurd+Iz6hCGGIQ9nLPKikT4D5VNv9mF851M8LI4nnVVsfc5VtSMqWZydECgSH6Hc+XbDVrZUn+AxNvGWXnlScVN+nKV9yMmw1vtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rQBHD4vuWUOlSYTazuiMi9fRz7x8rOVq7KC2i64QFk=;
 b=bfLPZOWEysRVSQ6hPjB0D8zjglxPoENlOZExqsD6P4yEtXxuXKYBHwCdqp+WiEHVzgh3G2fsr72oELq+mRwQFinJvL5tT9r/i/srvA1rVn/smpOfkbUo5Be0I6EKeRZU2IMyete9Pt16N4pp6+q8H3Rs3mEfo477ROll3m9VnZxaO/n/i3ImnwKeJ+lCGgFgPlMg3BaP2pGM8it1ZG6imEx78YHHR5EXcSus/T0qTDDROZ2SabQxMykq0Uj/EOY/CUjaJjhVGBl5UoBdVnhUXCB8n3ufXq8Vf0ZdQMkLrEJfV5XOZsC4xu3JtT/ui8zO4BeSbg2dlV03ldAmdbAyrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rQBHD4vuWUOlSYTazuiMi9fRz7x8rOVq7KC2i64QFk=;
 b=lkbrtoCfuPLm/BecBFJ2tha6xUvcxalH9SN5pnQQIkOX4HD5srnJRWX6GAcDtY8J+oVKkX/pi5hIERoIJOTcjO+4IF4/wDkPBMF/ttBrC9OYZnbJ4G/4oqXoyJQdtnCfAHhP1Ann2ofIVrakZi4ex1+iKKW0V501D3kVGsm6SVg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by PH8PR12MB6676.namprd12.prod.outlook.com (2603:10b6:510:1c3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 12:22:42 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Tue, 22 Aug 2023
 12:22:42 +0000
Message-ID: <d178212d-65ee-a1a0-323b-b9b91931db33@amd.com>
Date: Tue, 22 Aug 2023 17:52:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/7] drm/amdgpu: Add suspend function to clear the GPU
 power profile.
Content-Language: en-US
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-5-Arvind.Yadav@amd.com>
 <fdcfe7f2-05b9-c144-1b4a-74889bcb0555@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <fdcfe7f2-05b9-c144-1b4a-74889bcb0555@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::21) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|PH8PR12MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 71323ef6-66f4-4915-99c9-08dba30a7b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DIAhqkuW+it8zVFIvjrfvJ7Fbo9hnD8TlLRkvHC45+pZzZ2aSkIND4Jz30GjW2kT8mqYIpa/u711g8PZdsXDyHlgTLANpYmQVlVRtDqxCqPVoXAMTrHHVxb7W9kQfrVb49O1Ij4yxajQV0945sGFx9hGgIATa6PVGoIkgSUYXv/z/+9ru6e6Netsp5UHXOHoAyDOfyEPoR6DBJeSo4XB3sDcj1pLyOOSvQXXKu6Q6+P5Bf57Sfaq0I7Ud01yLno/LJ1xOZAWHDXRm+BjpVY6SBt6IxQSRw9LwY916ks9lQ5KP/86OG2zB1+w7qNDt5F14OEMBA9pwdELmmas1wzHdkfGFVrolownfUd+6rWmrupYZNvfrOfjtc3eu6H+FkbjE+eLS0PYCWWENBAmEqrhj71ZKDOewQqzP0xNR3kGDefe4FgVfDb3u5XdJP3zVkNjZXQwDvY/34kwDD14JYAmGrQk43ZssLvBfKpLGcwhpX6KixoMKbJkEc6IYfOru5zi1ce1Ow6xFkXPxSHoPmLdD6s74nm1ckJavF/yVzLLz/yKJh+D/BgGFX8fJWp0E7ewiiWDYvd0lAnizPeXku9KYvvi6xP1guyZ+cVbnWehlNV6eze3I7kspf9iR5gCSArnrJw3P9vU5rfPRlBe6GRCQkLoNi9ZhrLpOm+qxug9Gdg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(110136005)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(38100700002)(15650500001)(6486002)(53546011)(6506007)(83380400001)(2906002)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmR4Q3gzQ3QySmZBTVJWaTZUYnBTQTNEQS9acjU2WGZweHRWdEc0aE5kUXhh?=
 =?utf-8?B?TmZoZVI1SGw3cjNCL3ZCOU5XWWVRd3NNc3pQM3V0MkwxWkpJYjE2VkVYYnNk?=
 =?utf-8?B?R21EZG81b05nNkxZR21ZSlozNklZRUNiZTNyWjFxanZQWEpRNHg3NjZyR01v?=
 =?utf-8?B?d2ZGV3NDeUpYYWdMR1RoZUkzNVhYZFdqUVpmVitxTm5STHMxSEZBWCttOS9I?=
 =?utf-8?B?aEFXZXhJZ1B2QlVkT2RzN09QRW5jaGxMU3hGRmpWalEvMjhIRHdJTFNkb2dq?=
 =?utf-8?B?RjZMelV6cjNRc0dudFNKMmRhcDR0QTVtSzNkdjMxYW4xZDFlMEljRHk3T2ow?=
 =?utf-8?B?NFZBVGxJaWIrc1VGK1lMbUFLbjZLU3Q5dkJXY0NvbjZUNVpaMzIyS09oVGhP?=
 =?utf-8?B?emdoU25EMFhqdzZPaHFzU0lEOFBhRzM3QzRnUEFMcmlHeXFsOExzU0l6d2Fu?=
 =?utf-8?B?SGhvS0QwSXdIVXBDdnRUdXlxRUdMeGFZZGpPOFpwZ0Y2Q2xwZVBHdm9Zb043?=
 =?utf-8?B?OXE4SnNRa0lvdHNwaU9ISjdvYmsvc1hvZG9QZEpqa2MvcXFtS3VkeXJUNnFF?=
 =?utf-8?B?dkRVTXpycTNOeURteDlGOEhjcGdWQk8xYTNqRTQvejM5ZDJyZWM3dnVRY3Fo?=
 =?utf-8?B?cmdKY1NxODVIMXZ2Uks2SXVYQ0dkaytjcENTMXRNMUtudnZVR05kbDFoUzRk?=
 =?utf-8?B?d1VHVlJib2lvTlpLTy9RVWRsZVNhV2FEbUpERjgyQUI2S2pXdEpNVnV3elZu?=
 =?utf-8?B?dkNTZTJvOWtlUUhZTitYSTI4Z25HdzVvaHRhK2g2bjlBRXFuU1ZqcU9mNk1J?=
 =?utf-8?B?QkF0THYzRnkvTm16cFBjNStjNmFmQ0NTc2lnN0txWUF0ZFBKcUgyZkJiSE1Y?=
 =?utf-8?B?T09VVUNXaXZ3YjlqUTJzNU1UVG5POVNoYkFPZXJvTHlhUmFFa3ppMWE4b2Za?=
 =?utf-8?B?RFVHVUZTMVJveWcxZ0ttQ0lVUU82OGo3ck44MndyQ2lxSjNRUU04K2hrRDNY?=
 =?utf-8?B?RDJwNjlERTN4QWd0VXRpamp0Wk9McWJRU1JRY3RGZyt1alB4eDFGNGJ2N3Ax?=
 =?utf-8?B?NE1JM3pCR3JsMmhIb1hJdEhMeGNwa2wxYW9tbk5RQndCUDU5QkNndWxQSWRH?=
 =?utf-8?B?SnZtejJsZSs5bXp2ZGFZSExBR3FUbTVvckR3TnJuVHRSM1d4aVhBVXhQOTRv?=
 =?utf-8?B?YWp0dzFpYVdIS2o3VDFVMDFqazVWRDdwSUZFdCtETHhYL25RM3VRQnVLNitD?=
 =?utf-8?B?VFBNR3duNXNiU3lmS1VKZGdVQjJqRUErZWJNNTFTZVhkeDE5TTZVeFpHRjVV?=
 =?utf-8?B?YmF0a3FiTXp3Mzk0UThhWkk2Sm5DTWdRenU3K2FITlpQNWdVK1pXS0Y3TndU?=
 =?utf-8?B?bmRKQWpzeVNMY1NBVUZJTjhPUzlkT0hLWkQ1b1dSdWJwaDJjejh0a3RPWTdD?=
 =?utf-8?B?N3B4QS9UYzJ3TVZwQUdyTGVPbkxVbjNTUlpQbzE4V1d1ZEVkTGUvaGVkVVg1?=
 =?utf-8?B?Wmt2amI1WHJrK3IzamY5NG9BMTJQZ0k4WnA0MEcwZEpjSFV6VEtHdXlsS3NS?=
 =?utf-8?B?SGNnejVId3M2N1QwZ2RxdTlFcEZIZ2Q2QmoyNGhzbFhxdndtSFNYbExwOXo1?=
 =?utf-8?B?aTd2alZ0WVFmOFMxUExTVDdRejlSa3U5WGlSN21GNHFaeG1XMWtsOENPL1FM?=
 =?utf-8?B?T1MrOHFuNEFXWXNGeGRMcUNQMEhFOUV3dXBmclBYNkt3YjlqM1lJS3IvaGJR?=
 =?utf-8?B?dHpXYWY4TUhhMXZZUDYrUHl5SDJxSDI2cE1tYVlIcU1UNUZWd2MrRVZwaEZX?=
 =?utf-8?B?MWNYNUhteGhERFVYK2xHalk3dnZUTFBYQVQ2R0p6Q2RTYzFPaTZZTG1JczZK?=
 =?utf-8?B?ZXB6MVZyQ1dGanNKNTJYcXR3SnIwaFBiMXVWckpMb2R1OEJLajBocngzTlE3?=
 =?utf-8?B?VWowdWgwTzhFOGU4dnZVSDJyMkN1am1QdkFNRXpMOVh2aTJUUE1EVXp4UFBx?=
 =?utf-8?B?Tm9KQ3lvcW1ERk5oL2JMNzZ1UzZmT05sYUFKOTJuWGFOWjhuNXp1L2dRcEhs?=
 =?utf-8?B?aUszNkxaZ0tUdjdxdnNJaFBVT25OemxRYnlQOHZCaWxCVklxRDIyZ1BsTFQ2?=
 =?utf-8?Q?R+UQ1YyZarsqpqhmo8umr09wv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71323ef6-66f4-4915-99c9-08dba30a7b01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:22:42.0344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Yt+JBDNQ5Hr5Taua3T+C5eJXi9C8w1thjWQU7DfPNtZ7FFbcTkLI82Xii+zkYjYjfFFxFt7/2SeX4y7kQ8Dyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6676
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


On 8/22/2023 12:01 PM, Lazar, Lijo wrote:
>
>
> On 8/21/2023 12:17 PM, Arvind Yadav wrote:
>> This patch adds a suspend function that will clear the GPU
>> power profile before going into suspend state.
>>
>> v2:
>> - Add the new suspend function based on review comment.
>>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Christian Koenig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 23 +++++++++++++++++++
>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  2 ++
>>   3 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index cd3bf641b630..3b70e657b439 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4212,6 +4212,8 @@ int amdgpu_device_suspend(struct drm_device 
>> *dev, bool fbcon)
>>         amdgpu_ras_suspend(adev);
>>   +    amdgpu_workload_profile_suspend(adev);
>> +
>>       amdgpu_device_ip_suspend_phase1(adev);
>>         if (!adev->in_s0ix)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> index 6367eb88a44d..44ca8e986984 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>> @@ -174,6 +174,29 @@ void amdgpu_workload_profile_set(struct 
>> amdgpu_device *adev,
>>       mutex_unlock(&workload->workload_lock);
>>   }
>>   +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev)
>> +{
>> +    struct amdgpu_smu_workload *workload = &adev->smu_workload;
>> +    int ret;
>> +
>> +    mutex_lock(&workload->workload_lock);
>> + cancel_delayed_work_sync(&workload->smu_delayed_work);
>
> Another deadlock candidate. Between fini() and suspend(), the only 
> difference probably could be initialization status. If so, just use a 
> helper that is used during fini() and suspend().
>
Before going to suspend(), we need to cancel the work and clear all the 
profiles but in fini() we are destroying the mutex. also it will be 
called when we are unloading everything.

~Arvind

> Thanks,
> Lijo
>
>> +
>> +    /* Clear all the set GPU power profile*/
>> +    for (int index = fls(workload->submit_workload_status);
>> +         index > 0; index--) {
>> +        if (workload->submit_workload_status & (1 << index)) {
>> + atomic_set(&workload->power_profile_ref[index], 0);
>> +            ret = amdgpu_power_profile_clear(adev, index);
>> +            if (ret)
>> +                DRM_WARN("Failed to clear power profile %s, err = 
>> %d\n",
>> +                     amdgpu_workload_mode_name[index], ret);
>> +        }
>> +    }
>> +    workload->submit_workload_status = 0;
>> +    mutex_unlock(&workload->workload_lock);
>> +}
>> +
>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev)
>>   {
>>       adev->smu_workload.adev = adev;
>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> index ee1f87257f2d..0acd8769ec52 100644
>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>> @@ -52,6 +52,8 @@ void amdgpu_workload_profile_put(struct 
>> amdgpu_device *adev,
>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>                    uint32_t ring_type);
>>   +void amdgpu_workload_profile_suspend(struct amdgpu_device *adev);
>> +
>>   void amdgpu_workload_profile_init(struct amdgpu_device *adev);
>>     void amdgpu_workload_profile_fini(struct amdgpu_device *adev);
