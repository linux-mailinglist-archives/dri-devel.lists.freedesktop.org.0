Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF59E7AEB6A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 13:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABAE10E3B6;
	Tue, 26 Sep 2023 11:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C20710E3B4;
 Tue, 26 Sep 2023 11:24:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ISNvholLl0aEMqkBdnWh5xJuY4JDJwTjR/BjqcxIx2wHRtaoNDLke0/r18k3Z8+EwjWmI5nifw+dmnNHShfn5DsGEjIPPQMpPSUnDt0rObu7MmliLtGIRQi2Ws50Ur12F9eJLu0mfyBT3p3zhy45US/CRvnXoCFxch99+KJbVKKQnqHmC9lHTJsbSb7Sed99ORrD5+SCdxBG4TynzGtFewZmA2lvkT8aFPj/Yx28dVdmrdZlk1F1By5qMOiY3Z270DTDe0y0Z67PKW5k/14AmW+2EbKm4sVBd45Vf8XRqBzC194pOfYDGsbgDGz9Cta9olMMhVpnwm6Pw6f0ebzECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yt2MI0SA6Wafs62daeZeQUbdDDTAPInoe+sYBDha20=;
 b=NY00sEaH1P31JX7PlKHWBncDLm0hSTEe4KWDbsoOh2iNlLoi21TnqGxIXrpaY0QS+ej0gYitZ6lUndQ+h7uX/H+tHdf+WGA3B96V84KHHs/y75/VmNTDKhJInlXYKluMWbh+/Zp1imYltKhEZ2/U8QBySe/eqv+EWxLbSDQA2HURND3RAkmKuMqLKAg81++3ytn0Kq4foJ+p+jsSecT5RKapvL82jfYjnj/XyOmEqOxK5gMmyXrf/KWxJNmnNs7aZAeFByMURZGuPINjsifO1bTSbXVBDlwuyxl2nLfuYfPx49gEEsg/kvM1F1dCkyWZA4IB32cVfmp/xNjH/RCfxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/yt2MI0SA6Wafs62daeZeQUbdDDTAPInoe+sYBDha20=;
 b=1GSKOLLHSFDEsEy1zlM04bInFITEikqJEwCKOn5pTmK/JfoVnY099DLLIzDVK2wLGvvs+Q1o0PMGa7gaGGRmmlDQ6bBgZKnM8Tzt1wsoqhfJ5egf9GW9bu7irx0LocN7Kuuqn9nEVEY5ObZb2qX8+9tFrjfMPQbVyK+ug0wNRYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DS7PR12MB6045.namprd12.prod.outlook.com (2603:10b6:8:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 26 Sep
 2023 11:24:40 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 11:24:40 +0000
Message-ID: <437fbd5c-386f-4609-a350-77f61c8aaa0c@amd.com>
Date: Tue, 26 Sep 2023 16:54:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
 <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
 <2e201a3b-d75f-916d-5135-b084ad5da23e@redhat.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <2e201a3b-d75f-916d-5135-b084ad5da23e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::22) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DS7PR12MB6045:EE_
X-MS-Office365-Filtering-Correlation-Id: 806e9f40-53be-4495-db4b-08dbbe832ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7vU+ILFg23zl2wA7lBt2qgpmW4bEjB4bxeg7uZqa598cUXhjeCRfrk5hk2qhvZkQ9YtQ+nOXqDKMbV6jPr2NUHTOT8BYuWT3+XGCYFmwnMUrjBAdLMRkRE20HRFfLCTE3hF1dhzgKjdmY40uFtYr3mK+EzRksRdAEmBh8F0cEC4lWQVr30SF1hgLvIJIgrDkv/xjPrxpj9+0GqttiNJbFhHtOehdttctTwJE/UFt3c/uvTudxJSBqCNQg7nBM+zS2vK2G4L+/EGYu7Q0AlDTeOZuxJkh7V5nHeZolYAgft26vhJOorJYwPn8wV3nSeMLHoP2NJ1vDYCcqJgJsCqgeONTkT2oTB4DiFG4LWAQDtvmBWEAFFSv6lOg0Tnoa9TJgnSepuSN5QGAI61ku6HYsMFAv63BLCjpaSWQYhM+vqOFsnxX5iiVS60JHxau4Cm8q45EuCYSI8fNpwhzLQF4DjQFN2AkO4lWinWqf6iU6cAh2axvTLr2dvAaWjcwkMcNWHsbihcxdeoroGfkR+mZ3troDFCBBvP6lyEDFGg5ACwzyTCxUyIXRf+4spWN7aupJGJoZggYig/v4sKUsoP+wNMaX763+PX0dfDQRsPpXIjxvWihHz0MP22UtsUAgEqOojq+5dAHzPq/ZV4IVrI9gcE/mHstR/op4mefOzqNnMP+B6k0Y7hFIv3zgNXP5R0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(230922051799003)(1800799009)(451199024)(186009)(31686004)(36756003)(5660300002)(4326008)(8936002)(83380400001)(2906002)(31696002)(478600001)(86362001)(8676002)(7416002)(38100700002)(6512007)(41300700001)(316002)(6486002)(66556008)(66476007)(6666004)(6506007)(26005)(921005)(2616005)(66946007)(53546011)(87944015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ampVTGYrQmJ2dHozYVFaWVpuSlVVaFpNUDFKK0JVeGNCMjZSdXNSenZCTkY3?=
 =?utf-8?B?ZjFRSHVkaWFxSkZtWTZDNlN3djlJYVBhTkRRakNPNHZJbGtXNWtPMkp6TzdC?=
 =?utf-8?B?cjI2a0p3NW9XUElkMEdGNXZveVVocE01UEZFOW9aMWFhM2RVb3N3Z1pvN1pp?=
 =?utf-8?B?OFZVeTlWckg1NWtOSXhxdW5wTzlacDVuRTY1MHNvUWU5Q05VVXhTV3NTMElE?=
 =?utf-8?B?eVQ1UmJWZ0FIcU5wTDZNMGhydzFRTFZYUC8wTUdoY3JUUFhiMFZWaWhPVG81?=
 =?utf-8?B?QUV6bXY5R2ZJekx2aFEvVDByM3ZFMlRYTnFhM2NYTzQwVGM0Skl6WERtd1lS?=
 =?utf-8?B?ZHVaQmJtVFVGNzBJTzBJQllERUk1VnMrdmY3ZWVFY1JpTGlnUTM4NkZvLzZR?=
 =?utf-8?B?eU01ak43clYyR0Z0ZGhSNUhJeXBOQldra2VuZnkxYVMrT1ZhNGpHaEdzcjFD?=
 =?utf-8?B?VHlZYzFzTXBhblR4dWNJRGZQMjdJRFVUZlNRcVEwb2xIMWFBU1VzZHQ3dE1W?=
 =?utf-8?B?MnNQV2ZGMHdMMlppamJHb3c1cTFuQzR1Y1dXVzB4MUNia3ZLNFdZNzBCMnhy?=
 =?utf-8?B?ekJoSUdrZ0JBSFZOQmFqOGc2azVUaW95M0xsaitVUU5JcTBNZ1Z0MXIxY2RO?=
 =?utf-8?B?L203aTJhenBYRE1BTWVpL1A3bHhoVUNlazRNblV2TVhpellUdzlsOHVjaTRG?=
 =?utf-8?B?MFZweTlQbTN3aEdLTjFuVHo2TzVXWWt0YjBNOFZsK1l5TURoamhUTDRRZ3Y5?=
 =?utf-8?B?MkpnUUZZRzZISmdjdjdwdU5USi9UdEJRNWk1anJULytRYmFyMU9vK3kwQmFU?=
 =?utf-8?B?UUdSL24xNmJDbE9TU0tKZkFEVmhib3N3MlZ3cGI2TWwwWUJxZHlWZURCdXcy?=
 =?utf-8?B?VmtVSDBxWE1lZEtBK2p2Nm1FVHQ0OVk5dHhLTG42cHZ4K1RnK0RPeFZmblR6?=
 =?utf-8?B?MTF2d1A1ZHpBS2FCem0xUmh6cXRYc09ZVWI2bWFhcHBsdHlzeFZTNEttcGM5?=
 =?utf-8?B?QjFjenMwdkJzcXpuNnlHaWlaSVV5Mjl1ei8ya2ZNRUxGQ2R1Rk5kK3hsMktC?=
 =?utf-8?B?VFdOTHJrcjdyaWNBR0dwKytZbGxFa2lZWDNpaUo5SDc1WldVRFRrclluUjZW?=
 =?utf-8?B?Nk4wN1FKaEZ2ZzEwNEJRMWJQOTRyN2I4NWdZb3FpazlrUzBkUWFVNXhxZm1x?=
 =?utf-8?B?Y0V1WmZudk1CcGREbGtUc1hMb3hpSFpYMXRhRDFhbXR0UzM4b0lTOTg4NVNB?=
 =?utf-8?B?R2V4S0xvM1FzNnphSFdLMUE4QmQydFZrZzJJSnI3NDdGSVRlelM4MHhTYUdw?=
 =?utf-8?B?Q3l2VnBabFFPdkxqTHRsRmdkTThEMWtrbk9tVzR0d1JsZ0R5RWJrRlQyQnIy?=
 =?utf-8?B?MEZnOSthbDlNZWplMkdqeGY4eHlaUFNVdm9RWU8rNjZQOFFsZ1psdmZQUmhw?=
 =?utf-8?B?V3pxVko2TVBhRjBEY3J2Y3BwSVd1OEhqejAzckcvWkpQR09rZU5oeDcvd1hH?=
 =?utf-8?B?YzdWRFBCOGYyelZUcFhyQks5cnlHVGVoMGxZSUZRNkx6QmlsalZqUWdVM0lF?=
 =?utf-8?B?d0RoOENkZ1V3YVlTM0tkamFheHdjQWNHbTJwdEh5SUh4cXRScW5CSkk1NUFE?=
 =?utf-8?B?Y0cxbmNpVUo4WEp6ZytpZ3N4Um9xNHh4TFNwTnoxaFBSK20xNkNPZmk2dmRO?=
 =?utf-8?B?L2s5ZG1yaUdrSlh2TjlwTjk2MFM5SXJQYm1GeGV3djJUOXB5eGFlTnJ0VS9l?=
 =?utf-8?B?V3ArWEd3YnhQYWFvZzhTUzRRcEsyZEhmd1hOcy9IMklmVVRCWk1PMGhOQU8y?=
 =?utf-8?B?aFVwdFJFanQvcVY5cWExV2xKSE5ESmJDVE9ZMEkwR2I0bFpzY3VXUlZMZ25i?=
 =?utf-8?B?YmNBSHQyMGZseVNGajdCYi93S3ZMYlF3aEZBeG5BVHZkd0dreDZ0b3p0UU4y?=
 =?utf-8?B?RW5IYzhhb0RmSWxGZFVLNGhmVDVROXpuZGtUNzVSYUwzYVVRdXZaMTdIOUZ4?=
 =?utf-8?B?ZjNUWHFkUld2Z1RJWUdZb3lFRWVobGV3bzdyYlhmWFFqU0M2bkJlNFNYQTFB?=
 =?utf-8?B?OHpMMGJKNmxQaVZJOGZBcXpNc0VkcFlRaTBNOVJWK0hSVEErK3ExNnU0U1pW?=
 =?utf-8?Q?qo2+0Q2bwoFoyhWzKKvfrOKVj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806e9f40-53be-4495-db4b-08dbbe832ca1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 11:24:40.5142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOivKQJx0bmBzCqHIxyWvaEIL0GZM9DZxte0b+baIsWSXzlAKQLkmO+OheqEYyxz9nztRfQ5Zm3JLXNqd/85fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6045
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
Cc: amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patil.Reddy@amd.com,
 linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On 9/26/2023 4:05 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/22/23 19:50, Shyam Sundar S K wrote:
>> For the Smart PC Solution to fully work, it has to enact to the actions
>> coming from TA. Add the initial code path for set interface to AMDGPU.
>>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
>>  drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
>>  include/linux/amd-pmf-io.h              |  1 +
>>  4 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> index 232d11833ddc..5c567bff0548 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
>> @@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
>>  	return 0;
>>  }
>>  EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
>> +
>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
>> +{
>> +	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
>> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>> +	struct backlight_device *bd;
>> +
>> +	if (!(adev->flags & AMD_IS_APU)) {
>> +		DRM_ERROR("PMF-AMDGPU interface not supported\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>> +	if (!bd)
>> +		return -ENODEV;
> 
> This assumes that the backlight is always controller by the amdgpu's
> native backlight driver, but it might e.g. also be handled by
> eacpi-video or by nvidia_wmi_ec_backlight (when using an AMD APU +
> nvidia dgpu).

PMF is meant for AMD APUs(atleast for now) and the _HID will only be
made visible if its AMD laptop. So using amdgpu's native BACKLIGHT_RAW
should be safe, right?

> 
> For now what should be done here is to call acpi_video_get_backlight_type()
> and then translate the return value from this into a backlight-type:
> 
>         acpi_backlight_video		-> BACKLIGHT_FIRMWARE
>         acpi_backlight_vendor,		-> BACKLIGHT_PLATFORM
>         acpi_backlight_native,		-> BACKLIGHT_RAW
>         acpi_backlight_nvidia_wmi_ec,	-> BACKLIGHT_FIRMWARE
>         acpi_backlight_apple_gmux,	-> BACKLIGHT_PLATFORM
> 

I can add this change in the v2, do you insist on this?

Thanks,
Shyam

> Also I'm worried about probe order here, this code currently assumes
> that the GPU or other backlight driver has loaded before this runs,
> which is not necessarily the case.
> 
> I think that if the backlight_device_get_by_type() fails this
> should be retried say every 10 seconds from some delayed workqueue
> for at least a couple of minutes after boot.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> +
>> +	backlight_device_set_brightness(bd, pmf->brightness);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 9032df4ba48a..ce89cc0daa5a 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -73,6 +73,7 @@
>>  #define PMF_POLICY_STT_SKINTEMP_APU				7
>>  #define PMF_POLICY_STT_SKINTEMP_HS2				8
>>  #define PMF_POLICY_SYSTEM_STATE					9
>> +#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
>>  #define PMF_POLICY_P3T						38
>>  
>>  /* TA macros */
>> @@ -480,6 +481,7 @@ enum ta_pmf_error_type {
>>  };
>>  
>>  struct pmf_action_table {
>> +	unsigned long display_brightness;
>>  	enum system_state system_state;
>>  	unsigned long spl; /* in mW */
>>  	unsigned long sppt; /* in mW */
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 1608996654e8..eefffff83a4c 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
>>  	return 0;
>>  }
>>  
>> -static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>> +static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
>>  {
>>  	u32 val, event = 0;
>> -	int idx;
>> +	int idx, ret;
>>  
>>  	for (idx = 0; idx < out->actions_count; idx++) {
>>  		val = out->actions_list[idx].value;
>> @@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>>  				dev->prev_data->system_state = 0;
>>  			}
>>  			break;
>> +
>> +		case PMF_POLICY_DISPLAY_BRIGHTNESS:
>> +			ret = amd_pmf_get_gfx_data(&dev->gfx_data);
>> +			if (ret)
>> +				return ret;
>> +
>> +			dev->prev_data->display_brightness = dev->gfx_data.brightness;
>> +			if (dev->prev_data->display_brightness != val) {
>> +				dev->gfx_data.brightness = val;
>> +				amd_pmf_set_gfx_data(&dev->gfx_data);
>> +				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
>> +			}
>> +			break;
>>  		}
>>  	}
>> +
>> +	return 0;
>>  }
>>  
>>  static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
>> diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
>> index a2d4af231362..ecae387ddaa6 100644
>> --- a/include/linux/amd-pmf-io.h
>> +++ b/include/linux/amd-pmf-io.h
>> @@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
>>  };
>>  
>>  int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
>> +int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
>>  #endif
> 
