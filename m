Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D4724DA6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 22:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7348A10E3A9;
	Tue,  6 Jun 2023 20:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A686C10E3A2;
 Tue,  6 Jun 2023 20:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nYXcL/sHHzlyqQA0KGjzafU2N9UkMCZYFGmcGlJeNdX+juGp6IVw79OEyVpBOlIyJySwA3Wz0EpEs0IUzmur/kpjFqd0xMwPskUSo2Vyx4BU9mmad+oNB2PLWYuPleNltm2Vaouth7qa2IUBm8oO9aOm9EBfuRFwBZj2W+5lMXA8cqyizlvtAw0/kKv8uW8lrz+rUlj4jF3fj2/rBf0FaJmx/4tP9nTKZ/Tv8V5RA91qF+MGXPZrOs3Z0klg5gHOl7nbVbzp3SFKAGrx5ylhQFKn39KMrPRgA52PJuvIZ3fx+xjy4lS+gIyL152T2r01qARmKBsu3o+UJX8Aq6g5zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOcSLEC1IUKFXX+otmf47SpoYtsk0z43EDfMV+EMDNA=;
 b=FbiBlbo1MJV5wmjl2bD+B9GFdl8h8w/EBO+ySNcnuiU4tF+cyIkoNbGFFxiKRGH1BNaw5VwECIXGx+5b/VyXvlfsCGW3ugFDAMhTQg5Ic3c+KV13btjWyOiQGYo9/DrnZNIAJvmH5cvDXAyUwJqYJL2ZpLxgTDApnNXIpFlnh0Z0ElwhJlaprM348oeazEJLYGw3nbLC/pCsKoqwo/A6abcbS3oqgr5YibXmn3uZ2y2mO4l7Po7+OY0nfFbCjlFe2SwrVIVWQUsGDQ/6/KfSu9eAY3vgA9vRh54GGKAv7JrJZrEIqHDoMIPNdx4CwjaiBLSLoD4Qh4VXnmeYancIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOcSLEC1IUKFXX+otmf47SpoYtsk0z43EDfMV+EMDNA=;
 b=HuARnKIq99MKs0VsvrlP20zinN+AokHegJLlLhKbA7IQGzpWdVWXURoelM3xR1cB5TrqwHUPaDeOHxgdPCzz7CGX5ZaEON/n4a8cBBA3vNuDFaXvzDzVtr7qdCMLDT7dfRlEAd0n0WoOy/lWd0KAVQ4Fvdz1hpTB21wGqEx86iY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB9101.namprd12.prod.outlook.com (2603:10b6:510:2f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 20:03:13 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 20:03:13 +0000
Message-ID: <773a639d-5207-2879-35df-34b6cf81e3cd@amd.com>
Date: Tue, 6 Jun 2023 16:03:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 06/36] drm/amd/display: add CRTC driver-specific property
 for gamma TF
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, Sebastian Wick <sebastian.wick@redhat.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-7-mwen@igalia.com>
 <5ea0146c-19a2-58d9-4cc9-29af6d433915@amd.com>
 <47442442-794b-09da-4c70-1393344ce837@froggi.es>
 <CA+hFU4w3gwAaqvsiQW1Ns4ygi43ihn=iL7Y-Du_nH1RtKNP0sw@mail.gmail.com>
 <20230606165753.dr3xxcdfx7zcn6oe@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230606165753.dr3xxcdfx7zcn6oe@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:1::28) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: e895bbfe-a852-41db-2e9a-08db66c90f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6inYw3KQH/3dMpeMN4AWKflbb7Pzk86DIfc4dVRurEt4+zMQJmiJqKQZp8Kytv4DqH2Vuw8qL89upinydsMZY04a4OY1AzzdXuFFxHvCjIKHPLo3aXRlrO1ewGV1755gEB2uX4H/bVsOEHupKYRN0Ryd7m1x9sAGWIYd2KBptRnrsIaY/Ij24UhYO+I1lkGrdVhzy9C4OGzq9KJfKA76T17qDMcTeaAPBUFg0/FfXaZzmKdjp6H/JAWCuFdttf7hxaktuj397OaxC0VFzDBOz8F0HczC9dVsjWOP1UISbY1PQhofLc4Dk9ped5NvfB9koAC2ebI/k0T7HMsNhl5/NoxY7JTh9sdfII/GTVPmEXopjs5os3xwH9fifflwhZ8x72n/v6nUQnBZnkOj+SjF3SpI8ihh7SMO+VwDZyFH+DRsuZKn8LtgNsbavH90Rd5I4NS3bjrPNGBTCbfcWqNRFghg0oAveZY9KZZf2z5Zl0YVcmTNInpZrdSu/4GX149fLERccBjmEU1V+QsPo6CM/DuYCborht+GuKYUW9DrQhzWkXabU1wAw0tanM0KYZKL1q4H5zoXHfOXTxbLTrEFLzvCcvfZLMBmSaJitLnRksO3vCQ7+LZIFYwfLdcPpQcgXcN7Dq/eESD+Ip2vgk35tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199021)(83380400001)(7416002)(110136005)(478600001)(44832011)(8676002)(8936002)(41300700001)(66476007)(66946007)(66556008)(31696002)(316002)(5660300002)(4326008)(38100700002)(86362001)(6666004)(6486002)(36756003)(30864003)(2906002)(54906003)(26005)(6512007)(186003)(6506007)(31686004)(53546011)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUxkOVpaaGJHZVN1NWlSZldWUGhQZmtyOXBTOWRTWnRoMTdoZWJmWGtaTkVi?=
 =?utf-8?B?bGRub3V6SnhncmRZeGt0NFF3c3k2U3lwWWpWaU15eDdQdXBobGVQZ1krZVdP?=
 =?utf-8?B?aTJkdFdiTHRyU2NpTE9tbnNQNzk0QXJuMWt3bnNFZURyV1B1WWFLVWVoQ0d0?=
 =?utf-8?B?ZFN1VWJGc09obFdRbFZoVWt4aitzejhkZkhIVGV6d2Y1ME5MYUs4QXFXSGdk?=
 =?utf-8?B?cGRJV2hweGJpcDFPTHNsTEdXcmFuMUxxUitvK0NpR0xHZHc1TEpnM2JFMWpK?=
 =?utf-8?B?TnJIWFJJd1RQZktUblVMVzE5QisvcHhIVUhZbjF1cHRqUTB3dndTNVZRZHJ0?=
 =?utf-8?B?eGJOMmx0UEplbStOdndXQ0xVSGlTQlBjRVdzK3A4TXh3VFo5Tmh5VERSVm1P?=
 =?utf-8?B?QXRNYnJDT3ZabEhrTkRka2Vyd1BPSnVUYVRpWWsrSnJxZHhLS1Z6YUtzMEYx?=
 =?utf-8?B?bDJFRUQ4KzlZcjdscENoSkFDZ2d0NHRURDNDTWd1c0xtcExzYWFJdlhnUXB6?=
 =?utf-8?B?T3JJY0w5Z1IxMDVabzZIQWFranAyaUt4YnU5R2F1YWxqUFhjV0lNN0JRU0hw?=
 =?utf-8?B?K0pZZUJiTmhDUm56VG5EQmdoaEhqUVVLelRmYmcvOU9OaG1nb0tGVzlIdTcy?=
 =?utf-8?B?V1NCdlR0eEF2UWx1akkzaWJSWlVxTTVMQzJ3dDVjRVRmektBa2hucFRlNVBu?=
 =?utf-8?B?dVR3Ulk1d09hWFpncGY3SmFiWG8xQUxSbjh0MHVTM1RCdmxEemhGa0JOdWor?=
 =?utf-8?B?eWRkek9GZWtmTHMzSEdBRUdJUUNrMk1YZi9MSEZjVXdkeUorSlllMXFRWFVY?=
 =?utf-8?B?NU81TitNZ0tBNW5xTkFWVnRyMmtuTXhDVlA2clRncnN3RFJ0NUsvT01RdGpD?=
 =?utf-8?B?cVQ5djZidnlOdHNEMDF5RXFDWXJBWUZtVmFtTW51TnM3WEcyUzdDeDNPNi96?=
 =?utf-8?B?VEJaYURvZ2NFcVNZYVh1ZzNqRWU4SUNnVy9IMk5MMmd1S0toMlNVNkh2dk82?=
 =?utf-8?B?SUsvVTBzQmtJekIwT0NVbWFhTXc1MjNuR3orVlBsN0t1aDhjVmpWeVR6Y0dB?=
 =?utf-8?B?ZDNIamlyZmhXQmc0bS8ydEZkMjc2YWxGditzTFZDTkdzdGxnN3B4aXBaUFI1?=
 =?utf-8?B?MDhrK3pTam9jeWdFWjZ6a2xXamZKS1l1SFRLMGJvSUJ4NFY0eVVsZ09JQkdJ?=
 =?utf-8?B?UHJ6TGFsWEprVW1xN0Y5UFZBNWdNYk80R2xrSmJQaGtRcVUvcE1YN2IzY2JM?=
 =?utf-8?B?dERPcWxibzFma0VHUmdCaWVsOXZtcVJQcU51UDhCTStmM2x3QUl4WllsWllV?=
 =?utf-8?B?VlNEZUYvMDVIRytzQmdBRG9lZk9KQ3lsQmVxNStqbGlUc0tLOG9kZWVxSWgz?=
 =?utf-8?B?T21RZnJaNDYxRDNPWldOTHA5aHhvcXJneVhlWVF5bHBOdDlqWDIrMXlla1Zt?=
 =?utf-8?B?RC9RcWlmajIxek1WUmI3TTNCZHNWeFNrSTExQVZJcW16bXRHZUM3TDVCWXVE?=
 =?utf-8?B?OFZxTW93ajludTVidEE3ZllVVHFHNjc5MlRHenoxZ055a1AvVDU0NXZ2RWt1?=
 =?utf-8?B?VE9HNGh1WlN1bnpleG5SYUdsQStvN1NuV0FGUVlLTnJDZitydnc5MWpNU0NF?=
 =?utf-8?B?dnhRdGsrN1BiaVd6SU95RFVMcFpqNlJwMmo5dGljZG5GVFlWY21IVVFRR1ZD?=
 =?utf-8?B?RXc4NHZEc3p0aHVBVk5xcXpNVkw2blBCVi8yK1VhZ0VPMmxwNHF6TWxtbWVO?=
 =?utf-8?B?djU1TXNRUVVsd2FhejY4ejB2YWd5bGVpOE4zYm9LbHNBdEo5Y1dITXQwWHJI?=
 =?utf-8?B?enloYkNuK09ZTk53Q25WVjZZaUVNaGJ6U2kwZjJ1dmpneW9pOXl1UzBDb2pP?=
 =?utf-8?B?bXNQKzlEQStkSXdYVlBaVXMwRGdpakJiNUZMU01aMnY2R2M2UXJlM1lFemhF?=
 =?utf-8?B?dUl3aVR4SUxFTVJMRXJhaFZ2cGJNSVJ2TUMydjN2akJNckRUbDY3UVJobnEz?=
 =?utf-8?B?NENXRTRMc0J6am5vV2cwTlhuSVF1N0VCUWtPTExhSWhmYUZ6RWdqRXFVZFBh?=
 =?utf-8?B?cjUwV01lVk0vVC9VYjEwVHRMRkVJTUtJcSsrSlhnRTN1VWZoQThLaU5UV0tl?=
 =?utf-8?Q?K0s3AO/IvlvDvgD7NUTpdY918?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e895bbfe-a852-41db-2e9a-08db66c90f32
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:03:13.4383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKYxN8hDzez8xBJMnlaSKF6qtpEsakMKA5PPolq0COH/l0kJLRQycEcMreNojmdRSo4VkYEqqH7cyZkegcpCXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9101
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/6/23 12:57, Melissa Wen wrote:
> On 06/06, Sebastian Wick wrote:
>> On Tue, Jun 6, 2023 at 6:19 PM Joshua Ashton <joshua@froggi.es> wrote:
>>>
>>>
>>>
>>> On 6/1/23 20:17, Harry Wentland wrote:
>>>>
>>>>
>>>> On 5/23/23 18:14, Melissa Wen wrote:
>>>>> Hook up driver-specific atomic operations for managing AMD color
>>>>> properties and create AMD driver-specific color management properties
>>>>> and attach them according to HW capabilities defined by `struct
>>>>> dc_color_caps`. Add enumerated transfer function property to DRM CRTC
>>>>> gamma to convert to wire encoding with or without a user gamma LUT.
>>>>> Enumerated TFs are not supported yet by the DRM color pipeline,
>>>>> therefore, create a DRM enum list with the predefined TFs supported by
>>>>> the AMD display driver.
>>>>>
>>>>> Co-developed-by: Joshua Ashton <joshua@froggi.es>
>>>>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 36 ++++++++++
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 +++
>>>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 22 ++++++
>>>>>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 72 ++++++++++++++++++-
>>>>>   4 files changed, 137 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>> index 389396eac222..88af075e6c18 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>>>>> @@ -1247,6 +1247,38 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>>>>>      return &amdgpu_fb->base;
>>>>>   }
>>>>>
>>>>> +static const struct drm_prop_enum_list drm_transfer_function_enum_list[] = {
>>>>> +    { DRM_TRANSFER_FUNCTION_DEFAULT, "Default" },
>>>>> +    { DRM_TRANSFER_FUNCTION_SRGB, "sRGB" },
>>>>> +    { DRM_TRANSFER_FUNCTION_BT709, "BT.709" },
>>>>> +    { DRM_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
>>>>> +    { DRM_TRANSFER_FUNCTION_LINEAR, "Linear" },
>>>>> +    { DRM_TRANSFER_FUNCTION_UNITY, "Unity" },
>>>>> +    { DRM_TRANSFER_FUNCTION_HLG, "HLG (Hybrid Log Gamma)" },
>>>>> +    { DRM_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
>>>>> +    { DRM_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
>>>>> +    { DRM_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
>>>>> +};
>>>>
>>>> Let's not use the DRM_/drm_ prefix here. It might clash later when
>>>> we introduce DRM_ core interfaces for enumerated transfer functions.
>>>>
>>>> We'll want to specify whether something is an EOTF or an inverse EOTF,
>>>> or possibly an OETF. Of course that wouldn't apply to "Linear" or
>>>> "Unity" (I'm assuming the two are the same?).
>>>>
>>>> EOTF = electro-optical transfer function
>>>> This is the transfer function to go from the encoded value to an
>>>> optical (linear) value.
>>>>
>>>> Inverse EOTF = simply the inverse of the EOTF
>>>> This is usually intended to go from an optical/linear space (which
>>>> might have been used for blending) back to the encoded values.
>>>>
>>>> OETF = opto-electronic transfer function
>>>> This is usually used for converting optical signals into encoded
>>>> values. Usually that's done on the camera side but I think HLG might
>>>> define the OETF instead of the EOTF. A bit fuzzy on that. If you're
>>>> unclear about HLG I recommend we don't include it yet.
>>>>
>>>> It would also be good to document a bit more what each of the TFs
>>>> mean, but I'm fine if that comes later with a "driver-agnostic"
>>>> API. The key thing to clarify is whether we have an EOTF or inv_EOTF,
>>>> i.e. whether we use the TF to go from encoded to optical or vice
>>>> versa.
>>>
>>> Whether we use the inverse or not is just determined per-block though.
>>>
>>> I think we should definitely document it per-block very explicitly
>>> (whether it is EOTF or inv EOTF) but I don't think we need to touch the
>>> enums here.
>>
>> Either the drm prefix has to be removed or the enum variant names have
>> to be explicitly be the EOTF, OETF, inverse EOTF or inverse OETF.
> 
> I'm okay on using `AMD_` prefix instead of `DRM_` for this
> driver-specific implementation. I think the position of each block in
> the pipeline already describe the conversion type, since we only
> implemented one conversion type per-block. So, I agree we can keep it
> simple as Joshua suggested (don't extend enum, just document blocks -
> should it be a kernel doc?).
> 

I would still prefer if we can make the enum be explicit about whether
an EOTF or inv_EOTF is intended. In theory many of these blocks in HW
could support either.

Harry

> Melissa
> 
>>
>>> - Joshie 🐸✨
>>>
>>>>
>>>> I know DC is sloppy and doesn't define those but it will still use
>>>> them as either EOTF or inv_EOTF, based on which block they're being
>>>> programmed, if I'm not mistaken.
>>>>
>>>>> +
>>>>> +#ifdef AMD_PRIVATE_COLOR
>>>>> +static int
>>>>> +amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>>>>> +{
>>>>> +    struct drm_property *prop;
>>>>> +
>>>>> +    prop = drm_property_create_enum(adev_to_drm(adev),
>>>>> +                                    DRM_MODE_PROP_ENUM,
>>>>> +                                    "AMD_REGAMMA_TF",
>>>>> +                                    drm_transfer_function_enum_list,
>>>>> +                                    ARRAY_SIZE(drm_transfer_function_enum_list));
>>>>> +    if (!prop)
>>>>> +            return -ENOMEM;
>>>>> +    adev->mode_info.regamma_tf_property = prop;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +#endif
>>>>> +
>>>>
>>>> It'd be nice if we have this function and the above enum_list
>>>> in amdgpu_dm, possibly in amdgpu_dm_color.c. You could call it
>>>> directly after the amdgpu_display_modeset_create_prop() call in
>>>> amdgpu_dm_mode_config_init().
>>>>
>>>>>   const struct drm_mode_config_funcs amdgpu_mode_funcs = {
>>>>>      .fb_create = amdgpu_display_user_framebuffer_create,
>>>>>   };
>>>>> @@ -1323,6 +1355,10 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>>>>>                      return -ENOMEM;
>>>>>      }
>>>>>
>>>>> +#ifdef AMD_PRIVATE_COLOR
>>>>> +    if (amdgpu_display_create_color_properties(adev))
>>>>> +            return -ENOMEM;
>>>>> +#endif
>>>>>      return 0;
>>>>>   }
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>>>> index b8633df418d4..881446c51b36 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>>>> @@ -344,6 +344,14 @@ struct amdgpu_mode_info {
>>>>>      int                     disp_priority;
>>>>>      const struct amdgpu_display_funcs *funcs;
>>>>>      const enum drm_plane_type *plane_type;
>>>>> +
>>>>> +    /* Driver-private color mgmt props */
>>>>> +
>>>>> +    /* @regamma_tf_property: Transfer function for CRTC regamma
>>>>> +     * (post-blending). Possible values are defined by `enum
>>>>> +     * drm_transfer_function`.
>>>>> +     */
>>>>> +    struct drm_property *regamma_tf_property;
>>>>>   };
>>>>>
>>>>>   #define AMDGPU_MAX_BL_LEVEL 0xFF
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>> index 2e2413fd73a4..ad5ee28b83dc 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>>>> @@ -699,6 +699,20 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
>>>>>
>>>>>   extern const struct amdgpu_ip_block_version dm_ip_block;
>>>>>
>>>>> +enum drm_transfer_function {
>>>>> +    DRM_TRANSFER_FUNCTION_DEFAULT,
>>>>> +    DRM_TRANSFER_FUNCTION_SRGB,
>>>>> +    DRM_TRANSFER_FUNCTION_BT709,
>>>>> +    DRM_TRANSFER_FUNCTION_PQ,
>>>>> +    DRM_TRANSFER_FUNCTION_LINEAR,
>>>>> +    DRM_TRANSFER_FUNCTION_UNITY,
>>>>> +    DRM_TRANSFER_FUNCTION_HLG,
>>>>> +    DRM_TRANSFER_FUNCTION_GAMMA22,
>>>>> +    DRM_TRANSFER_FUNCTION_GAMMA24,
>>>>> +    DRM_TRANSFER_FUNCTION_GAMMA26,
>>>>> +    DRM_TRANSFER_FUNCTION_MAX,
>>>>> +};
>>>>> +
>>>>>   struct dm_plane_state {
>>>>>      struct drm_plane_state base;
>>>>>      struct dc_plane_state *dc_state;
>>>>> @@ -726,6 +740,14 @@ struct dm_crtc_state {
>>>>>      struct dc_info_packet vrr_infopacket;
>>>>>
>>>>>      int abm_level;
>>>>> +
>>>>> +        /**
>>>>> +     * @regamma_tf:
>>>>> +     *
>>>>> +     * Pre-defined transfer function for converting internal FB -> wire
>>>>> +     * encoding.
>>>>> +     */
>>>>> +    enum drm_transfer_function regamma_tf;
>>>>
>>>> Again, let's avoid a drm_ prefix. Maybe name all this amdgpu_ instead.
>>>>
>>>>>   };
>>>>>
>>>>>   #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>>>> index e3762e806617..1eb279d341c5 100644
>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>>>>> @@ -229,7 +229,6 @@ static void dm_crtc_destroy_state(struct drm_crtc *crtc,
>>>>>      if (cur->stream)
>>>>>              dc_stream_release(cur->stream);
>>>>>
>>>>> -
>>>>
>>>> nit: stray newline
>>>>
>>>> Harry
>>>>
>>>>>      __drm_atomic_helper_crtc_destroy_state(state);
>>>>>
>>>>>
>>>>> @@ -263,6 +262,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
>>>>>      state->freesync_config = cur->freesync_config;
>>>>>      state->cm_has_degamma = cur->cm_has_degamma;
>>>>>      state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
>>>>> +    state->regamma_tf = cur->regamma_tf;
>>>>>      state->crc_skip_count = cur->crc_skip_count;
>>>>>      state->mpo_requested = cur->mpo_requested;
>>>>>      /* TODO Duplicate dc_stream after objects are stream object is flattened */
>>>>> @@ -299,6 +299,69 @@ static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>>>>>   }
>>>>>   #endif
>>>>>
>>>>> +#ifdef AMD_PRIVATE_COLOR
>>>>> +/**
>>>>> + * drm_crtc_additional_color_mgmt - enable additional color properties
>>>>> + * @crtc: DRM CRTC
>>>>> + *
>>>>> + * This function lets the driver enable the 3D LUT color correction property
>>>>> + * on a CRTC. This includes shaper LUT, 3D LUT and regamma TF. The shaper
>>>>> + * LUT and 3D LUT property is only attached if its size is not 0.
>>>>> + */
>>>>> +static void
>>>>> +dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
>>>>> +{
>>>>> +    struct amdgpu_device *adev = drm_to_adev(crtc->dev);
>>>>> +
>>>>> +    if(adev->dm.dc->caps.color.mpc.ogam_ram)
>>>>> +            drm_object_attach_property(&crtc->base,
>>>>> +                                       adev->mode_info.regamma_tf_property,
>>>>> +                                       DRM_TRANSFER_FUNCTION_DEFAULT);
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
>>>>> +                               struct drm_crtc_state *state,
>>>>> +                               struct drm_property *property,
>>>>> +                               uint64_t val)
>>>>> +{
>>>>> +    struct amdgpu_device *adev = drm_to_adev(crtc->dev);
>>>>> +    struct dm_crtc_state *acrtc_state = to_dm_crtc_state(state);
>>>>> +
>>>>> +    if (property == adev->mode_info.regamma_tf_property) {
>>>>> +            if (acrtc_state->regamma_tf != val) {
>>>>> +                    acrtc_state->regamma_tf = val;
>>>>> +                    acrtc_state->base.color_mgmt_changed |= 1;
>>>>> +            }
>>>>> +    } else {
>>>>> +            drm_dbg_atomic(crtc->dev,
>>>>> +                           "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
>>>>> +                           crtc->base.id, crtc->name,
>>>>> +                           property->base.id, property->name);
>>>>> +            return -EINVAL;
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int
>>>>> +amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
>>>>> +                               const struct drm_crtc_state *state,
>>>>> +                               struct drm_property *property,
>>>>> +                               uint64_t *val)
>>>>> +{
>>>>> +    struct amdgpu_device *adev = drm_to_adev(crtc->dev);
>>>>> +    struct dm_crtc_state *acrtc_state = to_dm_crtc_state(state);
>>>>> +
>>>>> +    if (property == adev->mode_info.regamma_tf_property)
>>>>> +            *val = acrtc_state->regamma_tf;
>>>>> +    else
>>>>> +            return -EINVAL;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +#endif
>>>>> +
>>>>>   /* Implemented only the options currently available for the driver */
>>>>>   static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>>>>>      .reset = dm_crtc_reset_state,
>>>>> @@ -317,6 +380,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>>>>>   #if defined(CONFIG_DEBUG_FS)
>>>>>      .late_register = amdgpu_dm_crtc_late_register,
>>>>>   #endif
>>>>> +#ifdef AMD_PRIVATE_COLOR
>>>>> +    .atomic_set_property = amdgpu_dm_atomic_crtc_set_property,
>>>>> +    .atomic_get_property = amdgpu_dm_atomic_crtc_get_property,
>>>>> +#endif
>>>>>   };
>>>>>
>>>>>   static void dm_crtc_helper_disable(struct drm_crtc *crtc)
>>>>> @@ -480,6 +547,9 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>>>>>
>>>>>      drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
>>>>>
>>>>> +#ifdef AMD_PRIVATE_COLOR
>>>>> +    dm_crtc_additional_color_mgmt(&acrtc->base);
>>>>> +#endif
>>>>>      return 0;
>>>>>
>>>>>   fail:
>>>>
>>>
>>

