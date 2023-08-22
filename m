Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD2478411E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 14:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994F110E347;
	Tue, 22 Aug 2023 12:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E3A10E347;
 Tue, 22 Aug 2023 12:46:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik/WahPdY86RcUmP815Upx7U294cPS5PvKurMpStzYEylfQIi11pI+AYJ2Djhj9+UMjlgT8S76IQaiOkHt16oM3rZbF0fyeWN/MTG8zgfOsXB5xsWKth15l/rARBcJJF+LExEQB2V+QVqRb9Ds/gj1BJPwm0R3+HjgUrrjD+3f7DEBtPFm5qxzzwKiEmgl0b/NMMUlXKaHa6Uf7aByQY4pd9C3E3dHHp1Iv9L3HbbSWIOdOmmw0Lu5mpx29UAY992xvBF2yXV3mfe5Vh2vZ6A0lpA/mgQ6+8YSVDmoLO/LkqfAHCGvLR/QcBuxeRiRSzj9yFU9xd7ABQST8r2cf+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8jed5Dd18h6rIPJ8rsXCywc6LdlT9Of5XwLGpiNY2w=;
 b=exYLg5D0Od3R/bp3SG/icynjKPRuTeMA1fK0qZvG/n1DDpMHM///tB9PsV0pCD6+tmDv28+SN+8bs+mVaM2/sLlA6hDzTXtCyyur3fZxCyV/zeZnHuJhkyl5NoI23zjl1I1ExEtRGfuZxEuOdD6MoKyEdx1+Tr35/tMqwG676WehAU/eyU+VtO+XiJ/VwS6NLO0okniLLfgGlq7dctQ5d6c4i3KW5W45fo28zpC6ZqElJM04vIgZYLTVj+Sv4xL1RYwgJ0uJRKHb1aKyPN1X+6cK0TNOKFvAGbMAUnbN/URT/gfRR4mjDucpoozqhQ08y+sDhkBNv1P4MMWlfa8O7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8jed5Dd18h6rIPJ8rsXCywc6LdlT9Of5XwLGpiNY2w=;
 b=FlFq1fCAoHKrIRQYkTYOSFU4vjblP1xRHRDp+bZoCVogfyPoCCuCY0FGisDqZrrE3/3McKr1AwyUmSsM20s3NIEzLg1vEKLJpifNY2ouUIZ4lN0FKz48+qMtkQEdrh+QW8Q1HYYfo0y3gJ3nC0ipZYICmfCaV+0tijsj5gMyrqs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 12:46:20 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::af11:a0ea:b4e4:d1e0%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 12:46:20 +0000
Message-ID: <7a60130d-d398-862e-e9da-2685284eff95@amd.com>
Date: Tue, 22 Aug 2023 18:16:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 3/7] drm/amdgpu: Add new function to put GPU power
 profile
Content-Language: en-US
To: "Yadav, Arvind" <arvyadav@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>,
 Christian.Koenig@amd.com, alexander.deucher@amd.com,
 shashank.sharma@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
 <20230821064759.94223-4-Arvind.Yadav@amd.com>
 <c72a7412-a95a-1a99-f337-f64a789e81bf@amd.com>
 <443129d5-4d40-c777-e488-78393bd35397@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <443129d5-4d40-c777-e488-78393bd35397@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::13) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 5913c9f3-7d4b-466e-aba7-08dba30dc899
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QvsUEV3zs6B07VfjccArnhk8qAfRm2sdJDQmLNxUhPW34Ns8wUZLgYy/tkIBfWmuOrL33nsxZ2GKfkFfj72hdEMt8HdfsYKXOxmgmTL5ExEWObUThWlk5cfyM/r9LMW8UqrrzhvLTv+QvwU9kSDiEK0j1+2+u9+tjZVNhNfaGwOzPCdxNakHFM4oWw3mTr9nCk/8HCdul0ZfI2A1IadOvsQTwIlLNe9A0ql7OLB3hH9EcqcdLwxH8enlwNAgF6b08wzF+PTDeHR3LdBAWcG81tChD3qC62OD4T/n6xcKoFF2tW7zaK8LYzKIUCiBRpJX1ZqCqV3aZ0kxjw6dKYWp5KzU1V6Pg/sS9lOeRyuOvaNxrw+sZqn7ffPhGKxTqWWqZyMS5hPPB2zn6VuiWkEPLzY4X3AzAC8uftvCT5B2uenn+6QRD2LRMW9M6AC87aKsUfm7pOZAPEvUEkvOiyOWtd9KOcFZL6MHrbpWWn7NITyEo1kLeQK7x8uyAbJJoKAs/WAe/kmAeDBJpZ9MUKtSBwrbRCKxMsUtPB3vyUQaIfX5k4+UC/lvH4ShIopJABxuYh2pcuZtIhUVSQv9ZE7qTELj1BC0nDFt7PPoqkhMMwhq+GOdrNHew59QyXsdZq7S/avwXmnoti1hvN1DKqQ+89pPrLbHbG1EeJlx0XTndAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(396003)(376002)(136003)(1800799009)(451199024)(186009)(2906002)(30864003)(83380400001)(53546011)(6486002)(6506007)(5660300002)(26005)(31696002)(86362001)(31686004)(38100700002)(8676002)(8936002)(4326008)(2616005)(110136005)(316002)(66476007)(66946007)(66556008)(66899024)(6512007)(478600001)(921005)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE5sTVJVRDNicS96Ny9hWXhSaVZVS2hMUlhIcVgxYlhZbjQzcHhTeFlYSUNa?=
 =?utf-8?B?aytvNjZRaDEwZmFTK1BwdGY1NFNtaEs5aDZUZ1ZIajBLaStvZG4rb0pLaFpI?=
 =?utf-8?B?d0xaTW9ic0VOU1ZMckp3RU5CNFVLK2hBM1hCckQwaldBdlFNbU50dzN0Qk5v?=
 =?utf-8?B?Qk5LK2ZKMVZVVVU1RlRJVlJIVVcrZk92OHpndGpoN2cvSlZIMG8vVUtHTGhL?=
 =?utf-8?B?bGNuRTlYaEREYjZmdENHRDhRWnN6MFZsL0R5Y2o5bVRnMlpTZ0VPbFVoRFhG?=
 =?utf-8?B?YWZHZ1NSSkt1ZW45OHUrakNzbGJteDRETUkyVlFTSXVFMmo1WGRQbDEvRW84?=
 =?utf-8?B?NEN6Q0s1SmJRcFV5MkZ6SnN3UlJVdnI1NUZFZzJnR3FhUW1YbFdQVmI3cnhG?=
 =?utf-8?B?a3YrRVVlRGtia2FMcUxodlRrdEg5ZWowa2NVbTN0dDdXdWkrZDI5eVlnN1JS?=
 =?utf-8?B?N3V6ZFREL1V1TW5OVTFzcnk4anNZU0lhVGJqZmo5Ry8rc1phRUVTZVFWcnpz?=
 =?utf-8?B?MzZLU3ExNjd3VUg1NzNHTFIxcDBsaWgzRnJ2WVRpV25YV3FGQ0laOUNLQyts?=
 =?utf-8?B?WWlnQldnT2IycTByQ3ZVaCt6em9jNUFMM0dNSTlBWnJvTFYvTWpVUDBFVzBM?=
 =?utf-8?B?WXUvWUF2bDBoQzFBUUFlc2dKdmFnZ3B6a0RabDE5T0ZsU3JpbTdKWnlBbWEw?=
 =?utf-8?B?ZXNiL0xqRVJCa3VLb1BwTThDWm9kK3NaUURqZkdGQ3VFRWE2YXI2WXQ4QTBk?=
 =?utf-8?B?NTc5UXZBKzdUSlNsL1k0a0hlYW9INW5tNGdqMFFiQUs4RXNFVndoYmJkWWNy?=
 =?utf-8?B?Mnc2MkRmYWNCbUxUeEdFeEI5ZFk4T0ZxKzhjVUdOd1pHV29MQ1N5LzdZR1dU?=
 =?utf-8?B?ajdDR01UUUNQZlNMbVkzRzlkK1lJalZVYUttVHN4Unl5R0hodXd2WXJkem5a?=
 =?utf-8?B?MlRURDNLSEQrNU9EN0NHVmw1Z3VPYUVmakROT0o4UlVqUGVuT010ZkhqMCtP?=
 =?utf-8?B?UnppOXFaNWdYMW5ncm5DdHErbTlBb3l5b0c2WDBVNytUOHhVakV5b2dvalVF?=
 =?utf-8?B?WWVQa29kTUJXTHRXVmRZaG5NSzdWT1RyME5ZYlk2MmpVS3dhYS9EMlpTWGs2?=
 =?utf-8?B?eHY2T2FPKzR0MFRQSm92TjhIRUo2TlNxVVN5cjlkaUZUeHlLZ01QZmV1SmZh?=
 =?utf-8?B?cm50VTFMRDZmbFNjSFdXTk5TSG93ZVFHZnJTQXFtV0ZWU3AvTDAyeEF1UWtv?=
 =?utf-8?B?ZWt6VlNaWkp1eXRPcGVaYmR5dWg5dGVFOFB1MVpzSU9wcEZMRG5OYVcvaFA3?=
 =?utf-8?B?WEFvSUVPL1RxSWdGQUs1bkRpTUxWWDN2dUppK2VtSGdJd1dhaXVTbXpEWVlk?=
 =?utf-8?B?QW03TUEzUFUwcHZJNU9uSEt6L3NmcWhvUTBXenlrUXFmK0crNmsrK0l6ZCsx?=
 =?utf-8?B?TUtzSHJxRXg4ekExVFFXendYaGhnaWZiNEJnZUxxUmd1UGEvdUp6WlNpUnUr?=
 =?utf-8?B?Rk1iaGVBeWorRG1lOTZkVFg1RXR4UWpORHYyRmRDcUxhdDh0UHYrWDFUNjlq?=
 =?utf-8?B?VDdsWFhXZFhCdlljOFBNNm94OURPNDNjV0VqSEM3ZUNBZCtwbGFoQkR1NE9y?=
 =?utf-8?B?eER4c2crZTMxZUkxb1REQmZQdVozL3Z3U3owUDljQ3lDaHFyTkNlUXRKQUNs?=
 =?utf-8?B?ekRGeVdaNW5ZMDI3UFNHL1ZMVjlSL2NsRzJQdkYwa2tkdEZseEFxV2lodnYy?=
 =?utf-8?B?aW50L0I4L0ZJWjNKNm05K1hxeEhpSUR0bktyWGdETHFUTkIzK1V3OU1xeVhP?=
 =?utf-8?B?a0hxM0pSU2xWektLN1hoRTZkT3lmMHgzdXgvMTNzRFcraDk3cEF5eG12VWUy?=
 =?utf-8?B?VFA4K3N1TlE0ZmVHRVM0YUg1eHNIZGx3ajdtZnB5L2lERHprZXJCck5IcEky?=
 =?utf-8?B?Qm5LcmZHZS9EYldkNEQxTCtzY0lpMzBRMUc0VnkzQ1drWDZHVVhlQW5naHVa?=
 =?utf-8?B?TFM3T3dVK01URG44c25WeTZxL0lsWWxMMStVRGdZU24wYkt1dFk3TDlxNW9z?=
 =?utf-8?B?blgvaThjc210cGptN2gyOUIxRGxhOG0wZ3lBbzRkaDdxeTlTVHlXUmdETXdY?=
 =?utf-8?Q?SBVgT2SZfhN3leRnmjDSQg1Op?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5913c9f3-7d4b-466e-aba7-08dba30dc899
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 12:46:20.2699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZkLAnzFTbQVON55k+RMv+0aDp0GbCZYtuX/HFNySYbbBLANaPi/WgZ0Td5gUGjK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693
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



On 8/22/2023 5:41 PM, Yadav, Arvind wrote:
> Hi Lijo,
> 
> The *_set function will set the GPU power profile and the *_put function 
> will  schedule the
> smu_delayed_work task after 100ms delay. This smu_delayed_work task will 
> clear a GPU
> power profile if any new jobs are not scheduled within 100 ms. But if 
> any new job  comes within 100ms
> then the *_workload_profile_set function  will cancel this work and set 
> the GPU power profile based on
> preferences.
> 
> Please see the below case.
> 
> case 1 - only same profile jobs run. It will take 100ms to clear the 
> profile once all jobs complete.
> 
>                                             wl = VIDEO <100ms>
> workload     _________|`````````````````````````````````````|____
> 
> Jobs (VIDEO) ________|```|__|```|___|````|___________
> 
> 
> Case2 - two jobs of two different profile. job1 profile will be set but 
> when job2 will arrive it will be moved
>          to higher profile.
> 
>                                   wl = VIDEO  ->    wl = COMPUTE   <100ms>
> workload 
> ___|``````````````````````````````````````````````````````````````````|____
> 
> Jobs (VIDEO) ___|```|__|```|___|````|___|````|_______
> 
> Jobs (COMPUTE) ______________|```|___|````|___|````|_________
> 
> 
> 
> Case3 - two jobs of two different profile. job1 profile will be set but 
> when job2 will arrive it will not be moved
> to lower profile. When compute job2 will complete then only it will move 
> to lower profile.
> 
>                                               wl = COMPUTE 
> ->               wl = VIDEO  <100ms>
> workload 
> _________|``````````````````````````````````````````````````````````````````|____ 
> 
> 
> Jobs (COMPUTE)    ____|```|__|```|___|````|___|````|_______
> 
> Jobs (VIDEO) ___________________|```|___|````|___|````|___|````|___________
> 

swsmu layer maintains a workload mask based on priority. So once you 
have set the mask, until you unset it (i.e when refcount = 0), the mask 
will be set in the lower layer. swsmu layer will take care of requesting 
FW the highest priority. I don't think that needs to be repeated at this 
level.

At this layer, all you need is to refcount the requests and make the 
request.

When refcount of a profile becomes non-zero (only one-time), place one 
request for that profile. As swsmu layer maintains the workload mask, it 
will take the new profile also into consideration while requesting for 
the one  with the highest priority.

When refcount of a profile becomes zero, place a request to clear it. 
This is controlled by your idle work. As I see, it keeps an additional 
100ms tolerance before placing a clear request. In that way, there is no 
need to cancel that work.

Inside idle work handler -
Loop through the profiles that are set and clear those profiles whose 
refcount is zero.

Thus if a job starts during the 100ms delay, idle work won't see the ref 
count as zero and then it won't place a request to clear out that profile.

> On 8/22/2023 10:21 AM, Lazar, Lijo wrote:
>>
>>
>> On 8/21/2023 12:17 PM, Arvind Yadav wrote:
>>> This patch adds a function which will clear the GPU
>>> power profile after job finished.
>>>
>>> This is how it works:
>>> - schedular will set the GPU power profile based on ring_type.
>>> - Schedular will clear the GPU Power profile once job finished.
>>> - Here, the *_workload_profile_set function will set the GPU
>>>    power profile and the *_workload_profile_put function will
>>>    schedule the smu_delayed_work task after 100ms delay. This
>>>    smu_delayed_work task will clear a GPU power profile if any
>>>    new jobs are not scheduled within 100 ms. But if any new job
>>>    comes within 100ms then the *_workload_profile_set function
>>>    will cancel this work and set the GPU power profile based on
>>>    preferences.
>>>
>>> v2:
>>> - Splitting workload_profile_set and workload_profile_put
>>>    into two separate patches.
>>> - Addressed review comment.
>>>
>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 97 +++++++++++++++++++
>>>   drivers/gpu/drm/amd/include/amdgpu_workload.h |  3 +
>>>   2 files changed, 100 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>> index e661cc5b3d92..6367eb88a44d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
>>> @@ -24,6 +24,9 @@
>>>     #include "amdgpu.h"
>>>   +/* 100 millsecond timeout */
>>> +#define SMU_IDLE_TIMEOUT    msecs_to_jiffies(100)
>>> +
>>>   static enum PP_SMC_POWER_PROFILE
>>>   ring_to_power_profile(uint32_t ring_type)
>>>   {
>>> @@ -59,6 +62,80 @@ amdgpu_power_profile_set(struct amdgpu_device *adev,
>>>       return ret;
>>>   }
>>>   +static int
>>> +amdgpu_power_profile_clear(struct amdgpu_device *adev,
>>> +               enum PP_SMC_POWER_PROFILE profile)
>>> +{
>>> +    int ret = amdgpu_dpm_switch_power_profile(adev, profile, false);
>>> +
>>> +    if (!ret) {
>>> +        /* Clear the bit for the submitted workload profile */
>>> +        adev->smu_workload.submit_workload_status &= ~(1 << profile);
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static void
>>> +amdgpu_power_profile_idle_work_handler(struct work_struct *work)
>>> +{
>>> +
>>> +    struct amdgpu_smu_workload *workload = container_of(work,
>>> +                              struct amdgpu_smu_workload,
>>> +                              smu_delayed_work.work);
>>> +    struct amdgpu_device *adev = workload->adev;
>>> +    bool reschedule = false;
>>> +    int index  = fls(workload->submit_workload_status);
>>> +    int ret;
>>> +
>>> +    mutex_lock(&workload->workload_lock);
>>> +    for (; index > 0; index--) {
>>
>> Why not use for_each_set_bit?
> 
> We are clearing which we have only set it. We will clear first higher 
> profile then lower.
> 

You don't need to do take care of this. swsmu layer will take care of 
the priority. It is not the job of this layer to take care of priority. 
swsmu is the layer that could be altered specific to each SOC, and that 
can take care of any priority changes accordingly. This layer only needs 
to ref count the requests and place accordingly.

> 
>>
>>> +        int val = atomic_read(&workload->power_profile_ref[index]);
>>> +
>>> +        if (val) {
>>> +            reschedule = true;
>>
>> Why do you need to do reschedule? For each put(), a schedule is 
>> called. If refcount is not zero, that means some other job has already 
>> set the profile. It is supposed to call put() and at that time, this 
>> job will be run to clear it anyway, right?
>>
> Yes, I have got the comment for this I am going to remove this.
> Noted.
> 
>>> +        } else {
>>> +            if (workload->submit_workload_status &
>>> +                (1 << index)) {
>>> +                ret = amdgpu_power_profile_clear(adev, index);
>>> +                if (ret) {
>>> +                    DRM_WARN("Failed to clear workload %s,error = 
>>> %d\n",
>>> +                         amdgpu_workload_mode_name[index], ret);
>>> +                    goto exit;
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +    if (reschedule)
>>> + schedule_delayed_work(&workload->smu_delayed_work,
>>> +                      SMU_IDLE_TIMEOUT);
>>> +exit:
>>> +    mutex_unlock(&workload->workload_lock);
>>> +}
>>> +
>>> +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>>> +                 uint32_t ring_type)
>>> +{
>>> +    struct amdgpu_smu_workload *workload = &adev->smu_workload;
>>> +    enum PP_SMC_POWER_PROFILE profile = 
>>> ring_to_power_profile(ring_type);
>>> +
>>> +    if (profile == PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT)
>>> +        return;
>>> +
>>> +    mutex_lock(&workload->workload_lock);
>>> +
>>> +    if (!atomic_read(&workload->power_profile_ref[profile])) {
>>> +        DRM_WARN("Power profile %s ref. count error\n",
>>> +             amdgpu_workload_mode_name[profile]);
>>> +    } else {
>>> + atomic_dec(&workload->power_profile_ref[profile]);
>>> + schedule_delayed_work(&workload->smu_delayed_work,
>>> +                      SMU_IDLE_TIMEOUT);
>>> +    }
>>> +
>>> +    mutex_unlock(&workload->workload_lock);
>>> +}
>>> +
>>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>                    uint32_t ring_type)
>>>   {
>>> @@ -70,13 +147,30 @@ void amdgpu_workload_profile_set(struct 
>>> amdgpu_device *adev,
>>>           return;
>>>         mutex_lock(&workload->workload_lock);
>>> + cancel_delayed_work_sync(&workload->smu_delayed_work);
>>
>> This is a potential deadlock. You already hold the mutex and then 
>> waiting for idle work to finish. Idle work could now be at the point 
>> where it is waiting for the same mutex. Suggest not to call cancel 
>> here and let the mutex take care of the sequence.
> We cannot cancel if idle work is running. So we have to wait until ideal 
> work is complete. If *put function arrived before ideal work is not 
> stated then we can cancel it. but if it is running work thread we should 
> wait.

No need to wait, because you already have a mutex. So you will be 
waiting naturally for the mutex lock to be released (if at all idle work 
already grabbed it). If a request comes in at the time while idle work 
is running it is only a timing issue.

Also you have a deadlock here. Here you acquired the mutex first and 
then waiting for the idle work to finish. The idle work function would 
have just started at that point and reached to the place where it is 
going to grab mutex. That is a deadlock. This function is waiting for 
idle work to finish and idle work is waiting to get the mutex.

Nevertheless, this function doesn't even need to take care of such fancy 
things. It only grabs the mutex and increases the refcount, places a 
request if refcount became non-zero.

At whatever point, idle work runs, it will see that the refcount is not 
zero and skips placing a request to clear that profile.

>>
>>>         ret = amdgpu_power_profile_set(adev, profile);
>>>       if (ret) {
>>>           DRM_WARN("Failed to set workload profile to %s, error = %d\n",
>>>                amdgpu_workload_mode_name[profile], ret);
>>> +        goto exit;
>>> +    }
>>> +
>>> +    /* Clear the already finished jobs of higher power profile*/
>>> +    for (int index = fls(workload->submit_workload_status);
>>> +         index > profile; index--) {
>>> +        if (!atomic_read(&workload->power_profile_ref[index]) &&
>>> +            workload->submit_workload_status & (1 << index)) {
>>> +            ret = amdgpu_power_profile_clear(adev, index);
>>> +            if (ret) {
>>> +                DRM_WARN("Failed to clear workload %s, err = %d\n",
>>> +                     amdgpu_workload_mode_name[profile], ret);
>>> +                goto exit;
>>> +            }
>>> +        }
>>
>> If you follow the earlier comment, that will keep this logic only at 
>> one place - i.e, at idle work handler. Basically just let the idle 
>> work handle its duty. If some job starts running during the clear 
>> call, it's just unfortunate timing and let the next set() take the 
>> lock and request profile again.
> 
> So basically for every millisecond  new jobs are coming and completing 
> it to the same or different profile . Suppose we are running higher 
> profile jobs and  before it completes if a lower job arrives, this check 
> will help to move the higher profile to lower profile once higher 
> profile finishes it. If we are not checking here then it will stuck on 
> higher profile until then other jobs will also not complete. Please 
> refer case3 scenario.
> 

As mentioned before, this is not the place to take care of SOC specific 
power profile priorities. We already have swsmu layer doing that job. 
This layer just needs to do a ref count and place requests accordingly.

Thanks,
Lijo

> 
>> Thanks,
>> Lijo
>>
>>>       }
>>>   +exit:
>>>       mutex_unlock(&workload->workload_lock);
>>>   }
>>>   @@ -87,6 +181,8 @@ void amdgpu_workload_profile_init(struct 
>>> amdgpu_device *adev)
>>>       adev->smu_workload.initialized = true;
>>>         mutex_init(&adev->smu_workload.workload_lock);
>>> + INIT_DELAYED_WORK(&adev->smu_workload.smu_delayed_work,
>>> +              amdgpu_power_profile_idle_work_handler);
>>>   }
>>>     void amdgpu_workload_profile_fini(struct amdgpu_device *adev)
>>> @@ -94,6 +190,7 @@ void amdgpu_workload_profile_fini(struct 
>>> amdgpu_device *adev)
>>>       if (!adev->smu_workload.initialized)
>>>           return;
>>>   + cancel_delayed_work_sync(&adev->smu_workload.smu_delayed_work);
>>>       adev->smu_workload.submit_workload_status = 0;
>>>       adev->smu_workload.initialized = false;
>>>       mutex_destroy(&adev->smu_workload.workload_lock);
>>> diff --git a/drivers/gpu/drm/amd/include/amdgpu_workload.h 
>>> b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>> index 5022f28fc2f9..ee1f87257f2d 100644
>>> --- a/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>> +++ b/drivers/gpu/drm/amd/include/amdgpu_workload.h
>>> @@ -46,6 +46,9 @@ static const char * const 
>>> amdgpu_workload_mode_name[] = {
>>>       "Window3D"
>>>   };
>>>   +void amdgpu_workload_profile_put(struct amdgpu_device *adev,
>>> +                 uint32_t ring_type);
>>> +
>>>   void amdgpu_workload_profile_set(struct amdgpu_device *adev,
>>>                    uint32_t ring_type);
