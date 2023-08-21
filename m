Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01BA782AF3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 15:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A41E10E264;
	Mon, 21 Aug 2023 13:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2059.outbound.protection.outlook.com [40.107.102.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0033B10E264;
 Mon, 21 Aug 2023 13:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiKz3eZkHEnQddB/9K4XG/cbphtAj8dkYr3m52DtNQtsAFk//zDwspgbRj29WobZLXIKp6YpjavbV+XzDz8MaryK9oV6C+uRIXkFTv+9z70yhf0k9tikJ1uVY2FJyUco/Z7E2SUQFXJTyghIZhLke5LAwTVJPdaKM+Rctr590pb/KVh26qJ/wqref2WeZyNEDdfzF8IOcDLOcxq2vZFmz0krb6TdlIo6CS5r4kBQUMzwnO/Ir733E5E2UTgLraYGgQhRemkG925oOwQ6sAFtWh6eRq4Nh2yERfX+UCjS8LBO5NqjKg9tbdGr7OT/5vrHspqY+mZ5LxgNFH+0vQDc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9CTl149D1VOHF1Oojo4EDp05BNsgn22FD0jdLu1LUs=;
 b=jkcFoYhAueeaDG2orzr+qveF+rYOF6UaxDcD6i0ZrPU4xptYLEqw8MDLa/cFaKIVeCeYOoBLf6d+AGzDsFHegwRMhIHbLcfZjouQeaJbMnHbdAm1oL3ZKQKOrqY3xV8oqc+gxf60NnAVsa2OMP+QnmCIE5xh8P6CLjVYSW6tXm3KQbJIQZfCzMUPEq5jCH7vHyu8uArikcJOY2l2KAopBAZa8BkETxVpBNoyDMS1fjHH4R0VxVTDAgJIAQ3Rsf0OsWbj0T7n43Hw8NCSxGvYJ475nkAZNvVsRK0eWwM+aL+Ch5HPLHCwPoURkcQzUOJNaoNoJzTryUFsDqN/Pxhp0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9CTl149D1VOHF1Oojo4EDp05BNsgn22FD0jdLu1LUs=;
 b=Rty+YU57He0GnIG/V4ImLKT/08/zTo6bY+DEYB090pfdzpHvB403XPsq3WENs02WS5oDJdC31xS6raADMmjSAi6nllrmKJfp7NY1RsHCwMQ6rZdu59HXfuegb67d+pNTJVUc5KYGZznTLa9BfBexElZdJ4BHZJwv9AvxtSoweSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 by LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Mon, 21 Aug
 2023 13:52:24 +0000
Received: from PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4]) by PH7PR12MB6000.namprd12.prod.outlook.com
 ([fe80::f78e:33f4:56d2:1ef4%7]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 13:52:24 +0000
Message-ID: <6be29845-2f40-f5c0-1a7d-892605ce58df@amd.com>
Date: Mon, 21 Aug 2023 19:22:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/7] drm/amdgpu: Add suspend function to clear the GPU
 power profile.
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>, Christian.Koenig@amd.com,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-5-Arvind.Yadav@amd.com>
 <b3c5f921-f518-d3e4-29fb-693a549877b8@amd.com>
From: "Yadav, Arvind" <arvyadav@amd.com>
In-Reply-To: <b3c5f921-f518-d3e4-29fb-693a549877b8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::15) To PH7PR12MB6000.namprd12.prod.outlook.com
 (2603:10b6:510:1dc::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6000:EE_|LV8PR12MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b4622d-1281-4745-79ff-08dba24dd91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qhodX2nU0Lq69SDAY6n033+RWaFZ0Y6htINa9fh+OztBbHFkYje7gOlpeem3IvXOkNRjQifzZDyibpaKSMBNdc8zsLSNva0CI6URNoDlh2b4EER17rnTuUDWOLBfDsG4pSzjJ6Kwjcf5qcbizFWpCxvavsRHRsJ4fdh1nUZZWmdtqa9JOzii4Nbp+2vYgPuZLpzKIY3VDK/0BjIHH08yYiUOQsofS5XuutXp9L8rxVge9XMtJEL5/lnuhAwljzjNIOCAplm1DnZpEXKedAqBgK4GqC5oYOqV4aAk4EC282DLppUTOiint8J5ebhKp5cP5o7DWhUJHcqrqC4e3B/EIjFgUREuyECNT1WE5Qcb6LnCdkK8vnzcueBosvcCra9s6NfUnZqNnovTCSqD4yuzEZSeQHVDEYI3JY8Mrhfsir6n6jEs5NZKlywGNULHdlmyWEP+lsc22/+xIlgM76nnTdSfcZz0S+lkHPT98fC5BZ5DNuz8xOWwJdA6loCHyOG4Cyb8zZ59mVqRfh/w1T9+/j9/nZfoWdPoIukxXeoAlPs4JZusloNJneRngtIxBDzbCA5PovV4vZCYvWHFsOxR/ISg7F0G7HCkk7mjWU2aOnlfkWTWsRxkK0cQzLyzKsoD2yoUXmZry/dhWWqANwC8DA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6000.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199024)(186009)(1800799009)(36756003)(31696002)(31686004)(83380400001)(6486002)(4326008)(5660300002)(2906002)(41300700001)(53546011)(8936002)(26005)(6506007)(2616005)(6666004)(6512007)(8676002)(110136005)(478600001)(316002)(66946007)(38100700002)(66476007)(66556008)(15650500001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3dYTXRUcVBEYndWZWx5TVF4MmJhMHJvaGZyeHdPeG5qUUp0OER0UWw2V2M0?=
 =?utf-8?B?VEFTNm9mMWhkSXFpeWIyUkM5N2FyUjh3RVRoR0ZxaWIvNTAwZ0hiYmRJMmh4?=
 =?utf-8?B?T2xzT2g3UTZXK0tRYnhtVGZqUlhkVnZYNkpna1p2VDNWRTc4OGthUm9GVEVL?=
 =?utf-8?B?eDcyRnlyOHhHdDZLZk04NUNzZThaL2NGSW9RTnZKTTM1R05qb0dESlo0QTk2?=
 =?utf-8?B?Q1VaYm1IWHoxbnFBSmEyOVdZRllXajRnWDFwQjRNZG1QNWdaNFpOSXdaL1JF?=
 =?utf-8?B?QlY4T0NZQVNuL1BsWnYvUHVIRURIeFpFcTVvOUJYbXl4TlBETVBmbmhjQ1JB?=
 =?utf-8?B?MjVPWjRkb1J6amV2U051MFpFRWpndmQ0NWtPSlEwOHJPUHdKSGtCUmxPTjRY?=
 =?utf-8?B?THp3bVdMT0ZOcFh5TEVDMWFLMWhsL3h1N1pvRDJjam91VVAwbml2Z1hxTG9o?=
 =?utf-8?B?RTJGREJ2a2h6aHFrM2RwTWpaalIxejJXOU9PdlRkc2R1V1lHaDB4ZVY1VlFv?=
 =?utf-8?B?UDBCYkVYUS9WOVJrL3QzYnVkelU4alYvMEduL2VaTmJDZGU0elpjWFhobGxR?=
 =?utf-8?B?VFhaNWIxdkFUQllFWW5DTnZqbnlxZFV0WkZYbGJNY1lDckVNNmd6T2czSFdR?=
 =?utf-8?B?eTlYT3VmWGhQOGpmQTZUQVBJSWt1ekYzTUFlYndvdGNZUFkwRFRQVGV0aEE3?=
 =?utf-8?B?R25xYlB2bkVTMjBYUWZLQU9IcVhEek9JRUR3R0s0ckk0cTJ3QXo5a2pEVDFF?=
 =?utf-8?B?bzlUbjZDOStFSWNPMTk3eU9GN0pBWnNhT0d0Q3R1d0pqSHE5VDBLOCtjc1pV?=
 =?utf-8?B?WC9NZUdjZ0VFY3FJZkFCWFhYYVZZUHhHZWNlZlQraTFXWXZFQjJ3anNHbUl6?=
 =?utf-8?B?a3drSjYxeE1UdXU5QTNOY0lGeEFmdkdHNXFGVzFydUp6ZTVhdUpDbDVIT2xQ?=
 =?utf-8?B?V0svTHp3bmdBMjVSMGI2QzV3WEI4WWUwbllkNHBPbW9EQkdtazBLb3BwWXlK?=
 =?utf-8?B?TlRtUkpOQjdXVGliWmVvQVlnUmc3S25abTFJOE9tVkd1K01MTWlGTC9zaDZh?=
 =?utf-8?B?MU9XWCthK21NWCtFcTVaNUpKYk5BaVdrQkxBa2ZOQmorTnZXNW9Tc3NWcXZs?=
 =?utf-8?B?WkxRWVQ4TWVDN2tJbVhNclllS2pTWmdyR2hETzdDSHV3cGRkejJHekg4Q0pt?=
 =?utf-8?B?VkJCdXAyT3gwVEIwZk1EbUJuUlVxcXk3ak8rS2x3YVNXOXVneFZMeE4rMWJw?=
 =?utf-8?B?TUhjck9IQUFUMWFKbkZQMU5mRDN5dG9wWGgzVlVyNGZvMW8yZFVVRUQ5andN?=
 =?utf-8?B?Ty9UM0p1RVZiekRVU2kzV2x3dHFGaTJUM2hzNFIrc2ZTRE9CekhNeVhKVVkx?=
 =?utf-8?B?YlQxSERKcXpVSmx6dFY1bVhQVElZdGZtSnZuaGZjNUh5eS83Y0NLUWtNZTUr?=
 =?utf-8?B?V0wrYk1vQXdvSHArcXZISDlkem11cFpidkpOWS8wbHd2N0FLWlowNlZ2bk05?=
 =?utf-8?B?SEdFVnp4RTA2WE9waGdpY3VyR0d2blZBVlZ5emZONTl5UUlEbXZMTCtYMWp1?=
 =?utf-8?B?T2lQdTNRKzZLVWpocVRoNEc2a2dUTFZUVlF4Y2V2YW8yUHlnUks5K3B0VHJP?=
 =?utf-8?B?MTJCazhrUDROUVhPUTl0Smw1cWlWU3ZrV1FmN2pMV2ozNUpIYXJUaVo5NXV5?=
 =?utf-8?B?bmJnc1cvK0Y3Q0FzeFZ2V0VTNXpuUUp4RVBmWEFaVGxQT0lqQ3JJczRPYlJq?=
 =?utf-8?B?YUhvL3lqeEpkNmNWMGVVVEgzUFRmVjVPOTErazNIc1orOHl2ZnZ1alN6SWZv?=
 =?utf-8?B?a29DL1FETHVqK2ZZeGlaQjZ0cklkS3JtbDdES0Z2c09Cc3Yram0yVWR6OHpx?=
 =?utf-8?B?VTZ1cXgyN3M0WlhRMXA3dXkxcnBqM3J3M0xtWmwrcXY0dmxmdjEzRW1lNjJF?=
 =?utf-8?B?Uy9hcUxaOUpKR3NRMlVSVVpEQkRUVXRoK2xLcmZtaHdVNFBXc1JPL2JXOHpP?=
 =?utf-8?B?L0FYNmlPV3pKekZLMm9Bcjh1M0xXY0JkZ2xKR0JoZGFBU0trV25sVEFoYWFt?=
 =?utf-8?B?V3lXSUx1R3hnNm5pd1hlMnl6R1dmK1dRQTU1M0IwZVY0TVVrem8xSVhNNDV0?=
 =?utf-8?Q?HV5C8qI98PHKqEoV4HhptgrRz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b4622d-1281-4745-79ff-08dba24dd91a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6000.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 13:52:24.5926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hZqVp8jnlJmROAb2CNgaQFwFKDXJRyq1T+S44nbiDl0FK9DAunz4ngkcakgmUSzd6CsXILfjJbwGMUYmDL2Byw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359
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


On 8/21/2023 7:13 PM, Shashank Sharma wrote:
>
> On 21/08/2023 08:47, Arvind Yadav wrote:
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
>> +
>> +    /* Clear all the set GPU power profile*/
>> +    for (int index = fls(workload->submit_workload_status);
>> +         index > 0; index--) {
>> +        if (workload->submit_workload_status & (1 << index)) {
>> + atomic_set(&workload->power_profile_ref[index], 0);
>> +            ret = amdgpu_power_profile_clear(adev, index);
>
> Why do we need the checks here ? can't we simply set call 
> power_profile_clear() for all profiles ?

Hi Shashank,

  If we use only one profile then why to clear others. But I can remove 
the check and clear for all the profiles as per your suggestion.

ThankYou,
~Arvind
>
> - Shashank
>
>> +            if (ret)
>> +                DRM_WARN("Failed to clear power profile %s, err = 
>> %d\n",
>> +                     amdgpu_workload_mode_name[index], ret);
>> +        }
>> +    }
>
>
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
