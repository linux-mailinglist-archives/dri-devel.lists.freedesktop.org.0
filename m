Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B1710FA8
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 17:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E9D10E187;
	Thu, 25 May 2023 15:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0709B10E187;
 Thu, 25 May 2023 15:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6c6ZQb3K4qe9pbfil+RTZNiWM8kC1M+sVH/pE7tL2aChBbL1P4RhN0MxuP2VccG74MIVEQnqQNJS6fpJcb4YhFCqaGK0w8sqytFfkXtHSuKk6RsqmCpOx1Ml+dcaA4RwEggHRMweOMfl/aNjJPpWhD/sR7U/ERHzvmWKZ404oihjgtqoJlm5luO2g08AORRVHysjMRZswP1onYeFncKMEhphCgtecsFeVLh6jPE8vMj2H+iSzSHwTyXyK+vI0FVjB9HfbKIAVedX0KlFr9WPRIaO/mqiE07CYwSEwC5zGMq1vt8EQYuuZqUGFSQtZN8t+7+vcxBNh3rlpxff6z6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aEg5cKP06EblbA3oqblPXSF/wHWlWB/jqFN39R1DJM=;
 b=f7QG1jjsd4esmCGFkNMU4oQMbxdX0+vx4jRjCzJruOHUialruep+3+c9gInjWDSlEqXymZNOiaAFfzO0yx2CeSFwiY1Tn+87b7+TebQvYNRKJm6//HkqFQ+LcMpTvBVHzD+Zjbxey9NbYHIWVzIz3zC2SKWq9hA8h0F/L4sMTK0gTcxQa6CUTitrj89MSj9GkdOYdI0CtUF2zNBzhmeciu4QfuzEFuGeiaIAMZjLNy8+HM63AVFuVk5OcxPQ7UTiWqDRYM9PU/wA0ye/zPMue0EH4PRkxSh+HvQ6PuyO8vJzYlszF+fHKJ0vG1qEjWbtCFuj+70PrM7Z6kFfjAZQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aEg5cKP06EblbA3oqblPXSF/wHWlWB/jqFN39R1DJM=;
 b=Z580p9D5Id5Y2ZUCGvdjMFLLR/rQwNo1uV6D5f+q3EN4KLcblsLXwJgrM2QSy+iK6XGBdw5uIALxOwEMwYTDkBNFsCuDnQq2Freqbl/71oIwBA6CaZT9zFTRfllqRyL7c62AkFUGj87fqNTWIzl1uEoUJraRR2oQBq0eqropk8U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY5PR12MB6456.namprd12.prod.outlook.com (2603:10b6:930:34::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Thu, 25 May
 2023 15:32:41 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::4666:2db3:db1e:810c%7]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 15:32:40 +0000
Message-ID: <c9df7633-651e-439f-c71a-4bf0c3e3c514@amd.com>
Date: Thu, 25 May 2023 11:32:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH 06/36] drm/amd/display: add CRTC driver-specific property
 for gamma TF
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230523221520.3115570-1-mwen@igalia.com>
 <20230523221520.3115570-7-mwen@igalia.com>
 <20230524112443.356e8e0d.pekka.paalanen@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230524112443.356e8e0d.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0278.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY5PR12MB6456:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d3cd24-c79c-4a27-a7ac-08db5d3546ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pUivwOCzXDStpT9PTsi4HtUKCcnamqfvacwX6a5dTybQQpGELcG9rrQlgt3CFfBV5EqDKC/AkS69QHUR0DOXL4NkVK542XejqDQpxocWDdquX7HkEJL6ZfwZQqgGe6LT/ewfpC5XJWUjb0KuMwINVwt3uVgMtpXzLMa3IDAj5SloiOVEVQBicb/gs4ON0JI+bE0pVN+hQjLoY6Z6w5uXZCa/cHwhrO3DGe0WEPL+GSFgwwnSeSK394IzOdF213yqVPI2HPvBhSUuHLqvv74vXYctsk1uIDpURXfiFUTAqhiGg9KE5ThfF0F+W1d867ul+ZK38BGqlJiIWuSPXiYuiZOz1LAZKZhUtyBAgiphWJV2+DvXs5gWaqWmsJ7MwNBn1Q/PEfMm5u4Eb64nETt9jEMQQs0IFZrBzHLPI6UpL7jRlw5YUcGAUIz68TL1zLImn1g8XzhSvC15rc2vD0lCsq8q1qwel1pvxzJ8lePFNKbUbY+HoelL2THTYnozGYXi5DHu0VgvbbT2qh8F87zxyhC40DgLIAEWQ9atXbh+vDWVMcjUQ5Qz1FrYjCURdDpyylo2H3IkkVryqRfZWFGAu2oKldboiu270d7eosfHfxfO/cOqRiqosrS23HRRJ6nWYIi4Fjck7jCtaPtQSEsnRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(31686004)(83380400001)(478600001)(7416002)(6486002)(54906003)(66946007)(6666004)(110136005)(66556008)(66476007)(4326008)(316002)(38100700002)(41300700001)(44832011)(5660300002)(26005)(86362001)(30864003)(6506007)(2616005)(186003)(53546011)(6512007)(36756003)(8936002)(8676002)(31696002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFR6dkNxd25oTENLUjd1bzBQeXh2dGFWUUUrNjVURlZhcXR5RWV0VTNqdmJL?=
 =?utf-8?B?SmN5WWdNQlFESmN2MnBUSFNVSlV6MFNYUk5sZ0R3bTlIQkVIL2JtV3RwMTBx?=
 =?utf-8?B?U3EyRzlvOURJWTMrVTYyVC84a3U2M3o3MGdERVkrRFNZRWttRmZST3lXSWtP?=
 =?utf-8?B?bkpxdWRHYWNRdmJhTm1nZnArZitacktrSkl1UkVMbXkvb1J6U3c3VzVuNC9L?=
 =?utf-8?B?b1VZRWk3VWhTVmVlUExuRFo0bGY5YW5qS1lPcWEvejNpYVdTeVlhUTBqU0tE?=
 =?utf-8?B?c2psQjI2OXp1REV5Wnp5NmlQVmU1SnptZmZoYnNtTHFtejhhemFZck9QNFIz?=
 =?utf-8?B?eE9MdC9taXp2NXlseThnTkMxR2JDeTZWRWFYMWp2cE5IblV5QUJCRVJwZnVq?=
 =?utf-8?B?UW56MTNIT1gyMnRGZjJFV0k2emd0ckNiOXcxcHZocGZOVS9LcVBtN0xvYjds?=
 =?utf-8?B?OWNyb0N2UWdGSTcxWjY0T3JCU20wZEJwTmJzTXMvYkpBUGx6L1lzWndvWlM2?=
 =?utf-8?B?WUtXNXhPQVp5S0sxUzBlTFY0eTFqWmdwbE10SlltMElzbjdKZ1lrZGNqNjRM?=
 =?utf-8?B?bXgvaUxOUjN6S2RHNlR2ZTVBb05XRHpBc3RHTnd6NFFKckdBNHRTNVljY0xL?=
 =?utf-8?B?Mng3ZXJHRktFRTdPaTJ5NUxsa1p5VEcxZ09QWGlDOFFiVkllUTZXeHlUMFhQ?=
 =?utf-8?B?MmF5K3NYQ2o2QmV0SmpkQkJRU251L1ByVTdaMzZWOEdKUmpvclllcXRaR3Fy?=
 =?utf-8?B?UW1rK0dOZFI3ZW9NaldmYUtadDBmZngyL0VoY3hEU3RSbUlxWTBVRG9OYy9n?=
 =?utf-8?B?cjRrSi9tQ2RDeDZ2TkdVVWtxQkZHTkNFaE8xNDg3aGVXdHdZV054WGtLTWht?=
 =?utf-8?B?Z21mZFlFZFllWlIzQ1F6aVl0UzhVTEp4VlN1T1djRG5ic0ZoTVNaQ3VQU0JS?=
 =?utf-8?B?R3BFYld3QzRoVzhJVGwzSThTc3dNSjBQNjk2MVhTaWREaXpxOHRiUER3NWov?=
 =?utf-8?B?NUV0SUJ1WWNDSkJiVndsRzY4VzBiMVBQYkZUNUNXRjdlNTBNeVZLM1o4Mm05?=
 =?utf-8?B?UktjdlFkdjQ2MTJJYUk5ZFJvSUVMcVB2eFlhdEgzNzVZMHU1VVppS3pmejdC?=
 =?utf-8?B?TjB3UzlYemRjSUt4RlRYa0NJZEJVTEh1V1Bzd3NONUF5dHVQeFIzRE9HeVgz?=
 =?utf-8?B?VVQyeGRybjlxekdOdXFWb3pKSmNNQk9jdzNCTlByaEE0cncrUlI1QTJzTi9Y?=
 =?utf-8?B?K0tRNXBWTEQveEk0djkzZTQzMUY0ZE5NYjZFK1NMS2hCVHFGVEExSTRIM2xE?=
 =?utf-8?B?THEyVmxlVUJZYnJsTGFrNmVGbGVmQ0djNk5Kc3p5KzVVc3dMY2lJWjBtdDNr?=
 =?utf-8?B?VjgrVDlZUVZnTDdkODRuK1NlclJaYzVaU2ptNjhXdVR0c2VDTDZEdTFDOVlj?=
 =?utf-8?B?cHM5Rk1tT3JTMzh1dWF3STY1L2ZPenhiN0NjTTdNQVg2WGZ1cTdEbHgrYXly?=
 =?utf-8?B?cXE4bDdDZXI0Rzhjem5TUG9HVFd2QXV6ZERhVHN3N2cyVk9KUFg5UXpEeXpl?=
 =?utf-8?B?L3ZLYXdyVVdyYVU3TjRTaGVnOFZjeVJoYStlWXNqRUVpVEYxZkpXYnEvRXpF?=
 =?utf-8?B?RkhEaEczUVdCU1NkTEpsalpzUHZUK0V6bE4zOUIxcmc5Q3lTM0s5V0hZdTRR?=
 =?utf-8?B?QTFwdkJuc2dmeXlUQnN5dUl5V0M0NmVMazB5NDVYWEFxOVFKRENvajUwd2NQ?=
 =?utf-8?B?c0syY1hiWnE2TlBjQXZ5Wm1qbEdSMytBTDM1a2dyVk9KWFROclk0R2hiais5?=
 =?utf-8?B?dWFYb3ZXRktPWjBLd25lY2RjZ1JtRXdYZm9iVGR0Z3I5VjBMS2FVdUIvOXJl?=
 =?utf-8?B?b0dUUjZaTDBiVmJ4Rml3bFU5MU9xS1BrK1FVbWhsNnNocFBQNFM4RnRQYTF2?=
 =?utf-8?B?Z0dIQjJESUJnRlNhazc2RHp6aTd0Z0FUNmdibVJtTVhZNkM0R1hkU1daNFFz?=
 =?utf-8?B?Tk8xamtnQ0ZFZ0doR2dUSUg3R0ZWTnJxTy9wWlZkQTY2T1dXVjhHazVOY3Ni?=
 =?utf-8?B?enhOUitqN1EwQTdaaFZqdjAxQ1ZPemo1MnpqcFdmUFZVcWIwTHBTalpXN0tm?=
 =?utf-8?Q?oWxveAeWEfWwBXWNR0nXso5t2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d3cd24-c79c-4a27-a7ac-08db5d3546ca
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 15:32:40.7327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZZrLOa8u7GG7IaCcaxAVFc2DCwN7Zi+NdQvSzoH5mfi5/wVfL6gtKBPiQbOtLBmu61jb5kTr0cYplrSZ3U+pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6456
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/24/23 04:24, Pekka Paalanen wrote:
> On Tue, 23 May 2023 21:14:50 -0100
> Melissa Wen <mwen@igalia.com> wrote:
> 
>> Hook up driver-specific atomic operations for managing AMD color
>> properties and create AMD driver-specific color management properties
>> and attach them according to HW capabilities defined by `struct
>> dc_color_caps`. Add enumerated transfer function property to DRM CRTC
>> gamma to convert to wire encoding with or without a user gamma LUT.
>> Enumerated TFs are not supported yet by the DRM color pipeline,
>> therefore, create a DRM enum list with the predefined TFs supported by
>> the AMD display driver.
>>
>> Co-developed-by: Joshua Ashton <joshua@froggi.es>
>> Signed-off-by: Joshua Ashton <joshua@froggi.es>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 36 ++++++++++
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  8 +++
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 22 ++++++
>>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 72 ++++++++++++++++++-
>>  4 files changed, 137 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> index 389396eac222..88af075e6c18 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -1247,6 +1247,38 @@ amdgpu_display_user_framebuffer_create(struct drm_device *dev,
>>  	return &amdgpu_fb->base;
>>  }
>>  
>> +static const struct drm_prop_enum_list drm_transfer_function_enum_list[] = {
>> +	{ DRM_TRANSFER_FUNCTION_DEFAULT, "Default" },
>> +	{ DRM_TRANSFER_FUNCTION_SRGB, "sRGB" },
>> +	{ DRM_TRANSFER_FUNCTION_BT709, "BT.709" },
>> +	{ DRM_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
>> +	{ DRM_TRANSFER_FUNCTION_LINEAR, "Linear" },
>> +	{ DRM_TRANSFER_FUNCTION_UNITY, "Unity" },
>> +	{ DRM_TRANSFER_FUNCTION_HLG, "HLG (Hybrid Log Gamma)" },
>> +	{ DRM_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
>> +	{ DRM_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
>> +	{ DRM_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
>> +};
>> +
>> +#ifdef AMD_PRIVATE_COLOR
>> +static int
>> +amdgpu_display_create_color_properties(struct amdgpu_device *adev)
>> +{
>> +	struct drm_property *prop;
>> +
>> +	prop = drm_property_create_enum(adev_to_drm(adev),
>> +					DRM_MODE_PROP_ENUM,
>> +					"AMD_REGAMMA_TF",
> 
> Hi,
> 
> is this REGAMMA element capable of applying only optical-to-electrical
> direction of the listed TFs?
> 
> I was expecting that the listed TF names would include an explanation
> of the direction, for example "PQ EOTF" vs. "inverse PQ EOTF".
> 
> Very specifically "inverse EOTF" and not "OETF" because they
> generally are not the same concept.
> 
> PQ defines only EOTF while HLG for example defines OETF (HLG defines
> its EOTF as a combination of inverse HLG OETF and a parameterised HLG
> OOTF). So if you say "PQ TF" I will assume it means
> electrical-to-optical and if you say HLG TF I might assume
> optical-to-electrical. I think these enum names should be more explicit
> about what they refer to, to avoid any ambiguity.
> 
> What kind of TF is "Unity"?
> 
> This patch is not adding any docs for any of these. Is there another
> patch that does?
> 
> I'm still confused about how this "private" API should be thought of.
> Should it be documented at all? Is it free to use for userspace?
> Was the expectation that only the Steam Deck distribution would enable
> these in the kernel, and no-one else? And if anyone builds their own
> kernel with these enabled? So my ask for docs may or may not be
> warranted.
> 

The current plan is to put the API bits behind a #ifdef AMD_PRIVATE_COLOR
(or a similar name) and not making it configurable via KConfig. Anyone
that wants them would have to build the kernel with -DAMD_PRIVATE_COLOR.

Thanks for re-iterating your naming and documentation concerns. It would
be good to still fix that up, even if this doesn't become upstream API
as-is.

Harry

> I don't like the names degamma/regamma/gamma at all. I don't like
> calling something a LUT when it can have a parametric or enumerated
> curve. I don't like calling an element a transfer function if it could
> be a shaper or a combination of TF and shaper and maybe something else
> (i.e. a LUT).
> 
> But that's nothing new. If the expectation is that no-one should use
> these, then it's fine, and you don't need to CC me. You know I will
> always respond with similar comments about documenting things, having
> good names, etc. that is important for generic userspace, which is just
> not needed for "no-users UAPI". ;-)
> 
> 
> Thanks,
> pq
> 
>> +					drm_transfer_function_enum_list,
>> +					ARRAY_SIZE(drm_transfer_function_enum_list));
>> +	if (!prop)
>> +		return -ENOMEM;
>> +	adev->mode_info.regamma_tf_property = prop;
>> +
>> +	return 0;
>> +}
>> +#endif
>> +
>>  const struct drm_mode_config_funcs amdgpu_mode_funcs = {
>>  	.fb_create = amdgpu_display_user_framebuffer_create,
>>  };
>> @@ -1323,6 +1355,10 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>>  			return -ENOMEM;
>>  	}
>>  
>> +#ifdef AMD_PRIVATE_COLOR
>> +	if (amdgpu_display_create_color_properties(adev))
>> +		return -ENOMEM;
>> +#endif
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> index b8633df418d4..881446c51b36 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>> @@ -344,6 +344,14 @@ struct amdgpu_mode_info {
>>  	int			disp_priority;
>>  	const struct amdgpu_display_funcs *funcs;
>>  	const enum drm_plane_type *plane_type;
>> +
>> +	/* Driver-private color mgmt props */
>> +
>> +	/* @regamma_tf_property: Transfer function for CRTC regamma
>> +	 * (post-blending). Possible values are defined by `enum
>> +	 * drm_transfer_function`.
>> +	 */
>> +	struct drm_property *regamma_tf_property;
>>  };
>>  
>>  #define AMDGPU_MAX_BL_LEVEL 0xFF
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> index 2e2413fd73a4..ad5ee28b83dc 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> @@ -699,6 +699,20 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
>>  
>>  extern const struct amdgpu_ip_block_version dm_ip_block;
>>  
>> +enum drm_transfer_function {
>> +	DRM_TRANSFER_FUNCTION_DEFAULT,
>> +	DRM_TRANSFER_FUNCTION_SRGB,
>> +	DRM_TRANSFER_FUNCTION_BT709,
>> +	DRM_TRANSFER_FUNCTION_PQ,
>> +	DRM_TRANSFER_FUNCTION_LINEAR,
>> +	DRM_TRANSFER_FUNCTION_UNITY,
>> +	DRM_TRANSFER_FUNCTION_HLG,
>> +	DRM_TRANSFER_FUNCTION_GAMMA22,
>> +	DRM_TRANSFER_FUNCTION_GAMMA24,
>> +	DRM_TRANSFER_FUNCTION_GAMMA26,
>> +	DRM_TRANSFER_FUNCTION_MAX,
>> +};
>> +
>>  struct dm_plane_state {
>>  	struct drm_plane_state base;
>>  	struct dc_plane_state *dc_state;
>> @@ -726,6 +740,14 @@ struct dm_crtc_state {
>>  	struct dc_info_packet vrr_infopacket;
>>  
>>  	int abm_level;
>> +
>> +        /**
>> +	 * @regamma_tf:
>> +	 *
>> +	 * Pre-defined transfer function for converting internal FB -> wire
>> +	 * encoding.
>> +	 */
>> +	enum drm_transfer_function regamma_tf;
>>  };
>>  
>>  #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>> index e3762e806617..1eb279d341c5 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>> @@ -229,7 +229,6 @@ static void dm_crtc_destroy_state(struct drm_crtc *crtc,
>>  	if (cur->stream)
>>  		dc_stream_release(cur->stream);
>>  
>> -
>>  	__drm_atomic_helper_crtc_destroy_state(state);
>>  
>>  
>> @@ -263,6 +262,7 @@ static struct drm_crtc_state *dm_crtc_duplicate_state(struct drm_crtc *crtc)
>>  	state->freesync_config = cur->freesync_config;
>>  	state->cm_has_degamma = cur->cm_has_degamma;
>>  	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
>> +	state->regamma_tf = cur->regamma_tf;
>>  	state->crc_skip_count = cur->crc_skip_count;
>>  	state->mpo_requested = cur->mpo_requested;
>>  	/* TODO Duplicate dc_stream after objects are stream object is flattened */
>> @@ -299,6 +299,69 @@ static int amdgpu_dm_crtc_late_register(struct drm_crtc *crtc)
>>  }
>>  #endif
>>  
>> +#ifdef AMD_PRIVATE_COLOR
>> +/**
>> + * drm_crtc_additional_color_mgmt - enable additional color properties
>> + * @crtc: DRM CRTC
>> + *
>> + * This function lets the driver enable the 3D LUT color correction property
>> + * on a CRTC. This includes shaper LUT, 3D LUT and regamma TF. The shaper
>> + * LUT and 3D LUT property is only attached if its size is not 0.
>> + */
>> +static void
>> +dm_crtc_additional_color_mgmt(struct drm_crtc *crtc)
>> +{
>> +	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
>> +
>> +	if(adev->dm.dc->caps.color.mpc.ogam_ram)
>> +		drm_object_attach_property(&crtc->base,
>> +					   adev->mode_info.regamma_tf_property,
>> +					   DRM_TRANSFER_FUNCTION_DEFAULT);
>> +}
>> +
>> +static int
>> +amdgpu_dm_atomic_crtc_set_property(struct drm_crtc *crtc,
>> +				   struct drm_crtc_state *state,
>> +				   struct drm_property *property,
>> +				   uint64_t val)
>> +{
>> +	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
>> +	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(state);
>> +
>> +	if (property == adev->mode_info.regamma_tf_property) {
>> +		if (acrtc_state->regamma_tf != val) {
>> +			acrtc_state->regamma_tf = val;
>> +			acrtc_state->base.color_mgmt_changed |= 1;
>> +		}
>> +	} else {
>> +		drm_dbg_atomic(crtc->dev,
>> +			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
>> +			       crtc->base.id, crtc->name,
>> +			       property->base.id, property->name);
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +amdgpu_dm_atomic_crtc_get_property(struct drm_crtc *crtc,
>> +				   const struct drm_crtc_state *state,
>> +				   struct drm_property *property,
>> +				   uint64_t *val)
>> +{
>> +	struct amdgpu_device *adev = drm_to_adev(crtc->dev);
>> +	struct dm_crtc_state *acrtc_state = to_dm_crtc_state(state);
>> +
>> +	if (property == adev->mode_info.regamma_tf_property)
>> +		*val = acrtc_state->regamma_tf;
>> +	else
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
>> +#endif
>> +
>>  /* Implemented only the options currently available for the driver */
>>  static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>>  	.reset = dm_crtc_reset_state,
>> @@ -317,6 +380,10 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
>>  #if defined(CONFIG_DEBUG_FS)
>>  	.late_register = amdgpu_dm_crtc_late_register,
>>  #endif
>> +#ifdef AMD_PRIVATE_COLOR
>> +	.atomic_set_property = amdgpu_dm_atomic_crtc_set_property,
>> +	.atomic_get_property = amdgpu_dm_atomic_crtc_get_property,
>> +#endif
>>  };
>>  
>>  static void dm_crtc_helper_disable(struct drm_crtc *crtc)
>> @@ -480,6 +547,9 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>>  
>>  	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
>>  
>> +#ifdef AMD_PRIVATE_COLOR
>> +	dm_crtc_additional_color_mgmt(&acrtc->base);
>> +#endif
>>  	return 0;
>>  
>>  fail:
> 

