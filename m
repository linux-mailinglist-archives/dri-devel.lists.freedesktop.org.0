Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BDB7B05BF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E0B10E529;
	Wed, 27 Sep 2023 13:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC40A10E18D;
 Wed, 27 Sep 2023 13:47:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXq17ztJEGPncVuJ+ilr/25UpSGCBt2CJh/omYJLzyGMRveM+AccTkAmSQ9L3UDg2TkydWzg2fXH8fHdb5uN37L+tdljjRiETKS/tuBg7zQY16fZ4hKVB+5t/qyzM6J0d2+JtaJWg16vqVQUfQ6SaNhVUODs2jBo4wXoq5TKxLfANEQEIWdNtqN6DOnE2xFOzpd1Oin0eikUt31g3+OcNIrb9LCByTlZb06griysl/UwfmRCXdMeR5ppMbEIO1SFPH1ai/x9BI3WwLtKPCTqi1JklinpIOZr4DcTwk6QfYWzbMIma/dfF+UMHfQEbBVPb+vH5QtDY8aYusL3JYpg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hR4RxzJ+hftBm4fWWCle4nHhjEYyW4fwDmcRnZeCY8w=;
 b=Z/9CYHS4UF523wXZEO06lWqV443xM+NXxULw2pgHsGkd5Rc7VcHhsJIov5UmBhrUxbpd1JxmABUVPQMn8/S36PoEVKdkcZPyPenX1gTzxlbJ3dGRH/lq0iQBF/dEj3UF21HWn1Hckom9fvDRXkA4TmYOvp6MuQ/zVEyKPx7DuFyPVcA6HMm4j47Pg1r7x7ZB7IeU8DHhgd8ih2hgnk1xQrPVjiLlTW+YCovofFPzP7udx6CwweIAd1S/EYx6rqBGSoRjgWr49J1PfRpyJHUcpQZaqWBReb2H3P6/jQCwkoKpm1NFCUdMGJ5SkcKoqxm2CYvOYc06oGIPg700w73QiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hR4RxzJ+hftBm4fWWCle4nHhjEYyW4fwDmcRnZeCY8w=;
 b=33YR4lgvvkOSUfxjA5V6CCqYue1gPnQyu1W9SL4mPGBGsdNNJ1A37h97cuPWWCQfmAoMzhYHkuQjEA95xzSWGhAFt3ZGkPE7FJT2GdF2D4dpsbgpiIf/j8MhQkNLj47Qo36Zdd7jkWuX2zf4FZD4+r+cL23he2wottd/bMCX5Sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CH2PR12MB4150.namprd12.prod.outlook.com (2603:10b6:610:a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Wed, 27 Sep
 2023 13:47:32 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:47:32 +0000
Message-ID: <577ad880-17c8-46dc-9e89-f2d8d6530a81@amd.com>
Date: Wed, 27 Sep 2023 19:17:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 markgross@kernel.org, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <2e201a3b-d75f-916d-5135-b084ad5da23e@redhat.com>
 <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
 <6c047e17-66b0-c3ff-1b4e-4478663619a4@redhat.com>
 <4e79121f-01bb-729b-1e70-043e8911cb12@amd.com>
 <72f7d962-e6ee-274a-74ba-aa68adf5806a@redhat.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <72f7d962-e6ee-274a-74ba-aa68adf5806a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::18) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CH2PR12MB4150:EE_
X-MS-Office365-Filtering-Correlation-Id: 59b5593f-ca4d-40e1-5918-08dbbf604c75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z5QJe4ukv/sI6Y+lQyOARF9fcyNQtNMnSdU5WOh//P0a/7n5VuQLj5kgWlufzzu3uKw9lvzfxz7XnrvBUGu0rLucyMlyHPSmu+pL2UvVFNoNhpveoa8jLsGZCX3A595CZ7NXCP0/kzinzrF4ljmNg66siYLUUUKFxu79RUiUwF8tDKaL8G4dhzEpBPyN+g/X1Z3xee3HTTPm+U62pNqL6dVUpm1bstIYcieiIa+UCPkP/RIJ63VdsdHBQKlhsRCTPjTwYaC6Mgfz160Qaly0RCvA7TIsG06VS4iurlCgsGhogn3rQQVVUEEftqorIRrqzRsbEv84Eyr3bJGAfdrDE8HwByICb5SiFTIw2TR3AV18cM8SrKmi6L4F27HRu3ZLyYXGLgXnJXepzP8g4p/UVDrRhNd+SVE/2seqm/PhrXKMo6JHwpDyigSeht9Nn3zB5l+lkIe9iulqpH7LwKW1yx8ZgfDaK1u85SkyyqU7G8IrRMQy0N4Q7euXSx/ObnrL1dDHQtbQkDmQR7GSEW12nS0DxCRBowDhL/g1lpPcE5/h9y6UHJv5nX7nygBrRQk6qCbq9qPosTaqoCHQZoNo4bdb1hnObMuZIvxQ/WMpYmrincBqygz/TMLe0w+3ap0SPIXAH3aQT3YhV8aI3KPB+ndgKzvrF+bnoLCLtd6VjIlg/Oe768Bn0E3LryUCWviu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(396003)(366004)(230922051799003)(186009)(1800799009)(451199024)(2906002)(83380400001)(38100700002)(6506007)(86362001)(36756003)(53546011)(6512007)(6666004)(31696002)(2616005)(6486002)(478600001)(66574015)(26005)(41300700001)(31686004)(8936002)(8676002)(4326008)(5660300002)(66556008)(66476007)(110136005)(66946007)(7416002)(316002)(921005)(87944015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGl5MDdrODc3dEZKU1Q2eWVGdms3bWJHL3ozOTI3M0s2c05FSEZNc21uNWNo?=
 =?utf-8?B?YXdoNXhRZ01VMWRRNENLc1ZZTXNIZElzWTl6NXJNblhEN2ZOMlZRQ3BWV0lx?=
 =?utf-8?B?ekNPeUh3bldZMU42aTRoTGwybkp2SmRhUk5nSVk1RUxhcm5FWnJta1NiOUNU?=
 =?utf-8?B?Rys2MUtRTWJmaTAxNHFuZEdZR0NaVHowUFpQaDRaUlVkRDh0YkJEVXVaVCtO?=
 =?utf-8?B?eXNOZjFCN2tEY2t2TS9CcGVHWGZyNmxsdmdNbys1M1ZGTUsvWHhvS1Fsc2R4?=
 =?utf-8?B?akpUNC9SVDQxK05tYVhuU0pRMm9RaENrSVlQemw2V3E2R2FrcFh4VTlBcjZz?=
 =?utf-8?B?MUNROWJ3b0NJK3ozekR6R2NvUDZSeUVPSXFiL2xBVFJzSTk4bk5QSGNwUjh2?=
 =?utf-8?B?Mlhwbm1LMk9mSEtuaG1ONlUwb1h2dlNaVlp5UzJRTmRrMUlva2N5UHR5UFli?=
 =?utf-8?B?MkdyWWdLU1NseHl6L1M2bXNMbUdVTk96N0M0ZmdxQ2dZejBQaHZEdHB6MGJX?=
 =?utf-8?B?Y0lLbm1YTnlXUDNLWGszb0tMVzIwV3lmbXBETXJCVGFWOXVNaHhtN3YxbUpY?=
 =?utf-8?B?UmxNNnhraytIZFJadVdsVzVaWXVDY3pGblF3NngvZU0raXdrM0IveGNkcnJY?=
 =?utf-8?B?S2oyd0dFaXJLQmxZc05JbExMYk5DT1l3a1hSN2oyTktSeWtPZmlCeFJOWHVG?=
 =?utf-8?B?VEdFUk9aZ3pYWndyS1FMcmdHcGlCWnNkWmsxRVU3ZUZsbFFXbzZwRXQybHB3?=
 =?utf-8?B?QkcrZzNnR0FqQjZOVXR5VVFpd1FaMjJOTnc0WEc5a2VKZjZ3S3VPYm03RWN0?=
 =?utf-8?B?U1JRM24zSnF3b0tzalo4Rm9saFJ0QVFKdTcrclQxQVZaVXRyT1UrbzcwSTVB?=
 =?utf-8?B?Y0l5N0JrVjdvNVJQWUQrTUhROWpJT0xtK0hweGlzNlY0YUZJaitTVkFyMlJV?=
 =?utf-8?B?V2lnd29sRmZzUFN5Z1RSWURyUDZZaWJtNUtlc2Q4aWZ4SVAxd2g3aXUwajJX?=
 =?utf-8?B?V2JsRXFqeHFoVGdGV1gyN1RKYmd2dlUvUDJna2NVWTNicy81K0o5Szh6RzBC?=
 =?utf-8?B?YndXNkJFS2RZRHZiSFVQUUFNOWhmc0xhTFVyd0o2bEVVY1FsRHBoSGpnbHQw?=
 =?utf-8?B?d1ZFdFlxQS85WGRYeGg5emNUekRBcDM2dWYxRUpRTlhRODJ4aXA0Q2JvRmNx?=
 =?utf-8?B?cjRpMnZISGo2c0laQ3JtNTFsYzN4akZOVWlGLy9iK2MxUlBNMDFybDVONVg1?=
 =?utf-8?B?SEFLZTJPcDg2aGFpSW4xQ0ZTZS9uUlJIdXZ6WStZZUQ5aUl3bkpoYmZ0SXBv?=
 =?utf-8?B?a1c2M3RkRmxORU1XOTE4RFordGcwbFhFWjJyazlXN3EzY1RsV3NOc1RhNlhV?=
 =?utf-8?B?cWlrMUlXN0I5UUs0WlBhUDBWNGlyOU45K1JGeXVyUnpqMUxUNGk4dGVzbUhN?=
 =?utf-8?B?Y3AyVFVOM1Jwajh3b0JXY3psT3pOSHZBaFYxalhpZ2xPa1JiUU5zbDZuV0Nj?=
 =?utf-8?B?VU5CQzBDZ1ptbExhTGFYendjUndWR0lJNkZZelFjWEE5ejFQYmtPMk1iY0F3?=
 =?utf-8?B?VStGaWFZdndINkVIei9abDJhS244ZU9jMXJHNmsvVXdWdE9wYkdKV0tpQzlO?=
 =?utf-8?B?Z2ZjVGFCeG5ra0RtWDBzSDlhejN6ZWxuKzJBQjQ1R2tTR1JzdWZaR2ZEWS9O?=
 =?utf-8?B?R2ZZdWdXT1lPc3pTOGlOTGFNemV3MFZNTE9zR1Jya1ZYMkFYbWN4RnRLazVq?=
 =?utf-8?B?ZVpERFpQRVFJdzVKTndhdjFibkIvQWdZV2lyZXQzK2pMUDREUjJ2b0lRMlNP?=
 =?utf-8?B?MWw1am1pdUdrbWlGN0FSSWFxUmRhU3pIemUyWWZtWTR2dGNOOERScEJtdGQw?=
 =?utf-8?B?YUc4eW96dVoyYWpWM3RoTk9rVm5IVWpkZjhOVnpWaCtTT2xjQkpmbVAzdHdo?=
 =?utf-8?B?dm5KeGxySFV1eHd6ZFVQcHZmL2dIdnVJSTM0V2RWSHJMOGF2YVdmeHB4NmdL?=
 =?utf-8?B?Z0dTL3VJUXdnazU1cy8yNXdFUElnQy9rWDI4RlFDekV1TmdDVTlrb085MllR?=
 =?utf-8?B?NG5pdndEVExSNVlVQnZmWFN5ZEVtdDFtWVFIUUw3OHkxK2Eya2RRVXZ2QjhI?=
 =?utf-8?Q?SRWMX2sQFyaqAegqN6LQ8G6hU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b5593f-ca4d-40e1-5918-08dbbf604c75
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:47:32.7108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bm3XXFSOv32XKkanVeJ1LfeT0uW+qYKIyd0RXHah28+PtDVl8I32k9jxA+8eVPUXk+XEuQP005lozYJlxifpeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On 9/27/2023 6:34 PM, Hans de Goede wrote:
> HI,
> 
> On 9/26/23 15:17, Christian König wrote:
>> Am 26.09.23 um 14:56 schrieb Hans de Goede:
>>> Hi,
>>>
>>> On 9/26/23 13:24, Shyam Sundar S K wrote:
>>>> Hi Hans,
>>>>
>>>> On 9/26/2023 4:05 PM, Hans de Goede wrote:
>>>>> Hi,
>>>>>
>>>>> On 9/22/23 19:50, Shyam Sundar S K wrote:
>>>>>> For the Smart PC Solution to fully work, it has to enact to the actions
>>>>>> coming from TA. Add the initial code path for set interface to AMDGPU.
>>>>>>
>>>>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>>>>> ---
>>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>>>>>>   drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>>>>>   drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>>>>>   include/linux/amd-pmf-io.h              |  1 +
>>>>>>   4 files changed, 41 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>> index 232d11833ddc..5c567bff0548 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>>>>>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>>>       return 0;
>>>>>>   }
>>>>>>   EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>>>>>> +
>>>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
>>>>>> +{
>>>>>> +    struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>>>>>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>>>>> +    struct backlight_device *bd;
>>>>>> +
>>>>>> +    if (!(adev->flags & AMD_IS_APU)) {
>>>>>> +        DRM_ERROR("PMF-AMDGPU interface not supported\n");
>>>>>> +        return -ENODEV;
>>>>>> +    }
>>>>>> +
>>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>>> +    if (!bd)
>>>>>> +        return -ENODEV;
>>>>> This assumes that the backlight is always controller by the amdgpu's
>>>>> native backlight driver, but it might e.g. also be handled by
>>>>> eacpi-video or by nvidia_wmi_ec_backlight (when using an AMD APU +
>>>>> nvidia dgpu).
>>>> PMF is meant for AMD APUs(atleast for now) and the _HID will only be
>>>> made visible if its AMD laptop. So using amdgpu's native BACKLIGHT_RAW
>>>> should be safe, right?
>>> Users can pass say acpi_backlight=video and use the acpi_video
>>> driver for backlight control instead of the native GPU backlight
>>> control.
>>>
>>>>> For now what should be done here is to call acpi_video_get_backlight_type()
>>>>> and then translate the return value from this into a backlight-type:
>>>>>
>>>>>          acpi_backlight_video        -> BACKLIGHT_FIRMWARE
>>>>>          acpi_backlight_vendor,        -> BACKLIGHT_PLATFORM
>>>>>          acpi_backlight_native,        -> BACKLIGHT_RAW
>>>>>          acpi_backlight_nvidia_wmi_ec,    -> BACKLIGHT_FIRMWARE
>>>>>          acpi_backlight_apple_gmux,    -> BACKLIGHT_PLATFORM
>>>>>
>>>> I can add this change in the v2, do you insist on this?
>>> Insist is a strong word, but I think that it is a good idea to have
>>> this. Evenutally it looks like this code will need to either integrate with
>>> the drm drivers lot more; or the drm core needs to export some special
>>> hooks for this which the PMF code can then call.
>>>
>>> Actually thinking more about this, I think that the right thing to do
>>> here is make some code register brightness control as a cooling device
>>> (which I think is already done in some cases) and then have the PMF
>>> code use the cooling-device APIs for this.
>>>
>>> IMHO that would be a much cleaner solution then this hack.
>>
>> Yeah, fully agree with Hans. This looks like a rather extreme hack to me.
> 
> Shyam, the cooling device interface is defined in:
> 
> include/linux/thermal.h
> 
> And then look for cooling_device .
> 
> An example of code registering a cooling_device for backlight control is:
> 
> drivers/acpi/acpi_video.c
> 
> and then specifically the code starting around line 257 with:
> 
> video_get_max_state()
> 
> until
> 
> static const struct thermal_cooling_device_ops video_cooling_ops = {
> ...
> 
> And the code around line 1750 for actually registering the cooling-dev.
> 
> To use the cooling_device interface witt amdgpu's native backlight control
> you will need to make the amdgpu backlight control register a cooling-device
> for this in a similar manner.
> 

Thank you for pointing to the references. I will address the remarks
from Ilpo and respin a new version soon.

Thanks,
Shyam

> Regards,
> 
> Hans
> 
> 
> 
> 
>>
>> Apart from that what exactly is this thing supposed to do? Prevent overheating by reducing the brightness?
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>>
>>>> Thanks,
>>>> Shyam
>>>>
>>>>> Also I'm worried about probe order here, this code currently assumes
>>>>> that the GPU or other backlight driver has loaded before this runs,
>>>>> which is not necessarily the case.
>>>>>
>>>>> I think that if the backlight_device_get_by_type() fails this
>>>>> should be retried say every 10 seconds from some delayed workqueue
>>>>> for at least a couple of minutes after boot.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Hans
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>> +
>>>>>> +    backlight_device_set_brightness(bd, pmf->brightness);
>>>>>> +
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> index 9032df4ba48a..ce89cc0daa5a 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>>>>> @@ -73,6 +73,7 @@
>>>>>>   #define PMF_POLICY_STT_SKINTEMP_APU                7
>>>>>>   #define PMF_POLICY_STT_SKINTEMP_HS2                8
>>>>>>   #define PMF_POLICY_SYSTEM_STATE                    9
>>>>>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS                12
>>>>>>   #define PMF_POLICY_P3T                        38
>>>>>>     /* TA macros */
>>>>>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>>>>>>   };
>>>>>>     struct pmf_action_table {
>>>>>> +    unsigned long display_brightness;
>>>>>>       enum system_state system_state;
>>>>>>       unsigned long spl; /* in mW */
>>>>>>       unsigned long sppt; /* in mW */
>>>>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> index 1608996654e8..eefffff83a4c 100644
>>>>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>>>>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>>>>>>       return 0;
>>>>>>   }
>>>>>>   -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>>>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>>>>>   {
>>>>>>       u32 val, event = 0;
>>>>>> -    int idx;
>>>>>> +    int idx, ret;
>>>>>>         for (idx = 0; idx < out->actions_count; idx++) {
>>>>>>           val = out->actions_list[idx].value;
>>>>>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>>>>>                   dev->prev_data->system_state = 0;
>>>>>>               }
>>>>>>               break;
>>>>>> +
>>>>>> +        case PMF_POLICY_DISPLAY_BRIGHTNESS:
>>>>>> +            ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>>>>>> +            if (ret)
>>>>>> +                return ret;
>>>>>> +
>>>>>> +            dev->prev_data->display_brightness = dev->gfx_data.brightness;
>>>>>> +            if (dev->prev_data->display_brightness != val) {
>>>>>> +                dev->gfx_data.brightness = val;
>>>>>> +                amd_pmf_set_gfx_data(&dev->gfx_data);
>>>>>> +                dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
>>>>>> +            }
>>>>>> +            break;
>>>>>>           }
>>>>>>       }
>>>>>> +
>>>>>> +    return 0;
>>>>>>   }
>>>>>>     static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>>>>>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>>>>>> index a2d4af231362..ecae387ddaa6 100644
>>>>>> --- a/include/linux/amd-pmf-io.h
>>>>>> +++ b/include/linux/amd-pmf-io.h
>>>>>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>>>>>>   };
>>>>>>     int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>>>>>   #endif
>>
> 
