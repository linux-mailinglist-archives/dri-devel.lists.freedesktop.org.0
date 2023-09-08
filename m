Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE8979890C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 16:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF7C10E8DB;
	Fri,  8 Sep 2023 14:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BFE10E8DA;
 Fri,  8 Sep 2023 14:43:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcNXpyn8diHzAVC7B6XS4heNQWKnHGdVntgqs1Z2Z1CFR4Vur9dQQKHLGJbojhMviob0v6mY+EkweKaCRVhFps0mZ7ujRXQAcwyXtopUBwcJDrxjhWcxjMVjO6hpKfwwz6frW930b4QUpV08kTiYQsoAZbDQw+6cxdqd+AWo+hS/7P7WqswftuWoOUr3gQIruHwnDQ8ee8lUd+kO419HDgPRRaebFCmiXwjsEHj+xEqorY+d/6yPja0lp6nvuqfMn++oYe9fSUP3xyfhD2g0BIR0BDv6Z4U4vFTAsjUX+q2AEMIi6/GfKeKHJ5yUXGVU8AV45eTNN19ltwP6mW0ufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FB14lOo5qxh/2YL7IHyvTQTRZHXOGUihv8E1pEK3VRA=;
 b=NioB+y+9GglEpDUZQYBGVP74xeTUxQrSAKiKiayaf7Y6uCklPkNBkUPmTxvpo5Kemmv8H6VyCX0EYmMR8B2hfvGjyNIB1QbqLmtsHdG68RagwrjKnznVAIuydw0OBDcw7P1FKFZB9baEP5+9BxX61y5xUYeQQKN5kcJkTFjddnMR27b7HqIUMeUdbUQRJ/kaj1GuxiPt4WIHLB7QVICJfR96jIcfx9KV0gDAm/ZNNvpB1ty7QsXs/uWBh7qw0Fkhy0Rxh9ZWkHnG5RCsgBN6VxjztWYshit/Xb3qHthFpFpWzdV/McPh/2mmuGFFwAD1MJjjMtrHOMu7kZszcoK8qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FB14lOo5qxh/2YL7IHyvTQTRZHXOGUihv8E1pEK3VRA=;
 b=dUeKQqhIpM6psPOO6LlCzIaJz4PM6kt3SGWGGKmqD2sXy0ohke9w+guDbYwb8hahm2JksBB7UDlgDLDPOkqrnt2MPCxCmUwApemFZfEjQt/7mVSdX6TV6BLYw4Hyvg592h67eZsAuoNtsH3MQMyBw1pXZiOd+ZlDqAwnZiUo9bk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5103.namprd12.prod.outlook.com (2603:10b6:5:392::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 14:43:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 14:43:03 +0000
Message-ID: <1acac9eb-681b-4de1-bb22-a998bdfb95a2@amd.com>
Date: Fri, 8 Sep 2023 10:42:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/34] drm/amd/display: add plane CTM driver-specific
 property
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-33-mwen@igalia.com>
 <d50e07fe-4e8e-4e18-ae75-ba351c3c95ad@amd.com>
 <20230908144129.o2rtvyydy5lhggre@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230908144129.o2rtvyydy5lhggre@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB5103:EE_
X-MS-Office365-Filtering-Correlation-Id: d4abc67c-f408-485c-10f8-08dbb079e802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: emWmgoPC8UMbsoOYWmdJuxwI0L8vpW3R22NGk9w79Cdjup2auvauHKjBLbg4ChGM/HgNU9bHR8vGEpEXQPOo68Xck7rGlp8Nr1l+7LWGrEK3eMTBZ9AI3XNDX6bPcXZVtNNWgouH6WbkYuLwNpz2UjpSDw5WaHodPxZARYZ8CtkysOMDI2gprSQBX6bwq0R9neDsPymSCJUgDU2JpIRij90mccNVMwyfIRznxjkKKOeQ3Q7ADjNOpEPKQ0Sp4cs1zs5QnLoVTzOujNRZZ5bZt08TzQDJdsILia9PjAw30XPvIoRmlfe3yOMED0V9Il3cPXxXdiGocSgsrsBnQpkzOiT8faWS3+zihOSaft3XUcvNuSEXwfYP0iGXBr/g/R3CDncOm/wn9SdE88YwpjsFt9LzfJm5N2dN1bvnlyWh6EpiIlNh/sw4b0dFq1x71oPWmRSrqLuC5my/awleuSBD5Yoa6ZpRW2CJC5Ybkl7RWAwOciuivc/0Y17i28fekKqOaadhCkkLXSKDFQPszaYJdSzFRAdOA9yrEOuYvXR8+KBdgF4efhGmChM0vAD2u2sH+8b3UnTcUBY6rXS5i8WBfMRfyfGRshXaBoIlAb1AlhepRHYu55Q/UxQpBTofA4BRqZxb2Caa2Ws8PP+LoJfcRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(1800799009)(451199024)(186009)(31686004)(6666004)(53546011)(6506007)(6486002)(36756003)(31696002)(86362001)(38100700002)(2616005)(26005)(478600001)(6512007)(2906002)(8936002)(8676002)(66476007)(41300700001)(4326008)(5660300002)(7416002)(54906003)(44832011)(316002)(66946007)(66556008)(6916009)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q29yRE84Qm9yVlR0cGtHQjh0d2FFd01CTk1lNHdwTlRNWFNkUXR0UTE3Z0g0?=
 =?utf-8?B?ck9iRlFaQzlxbmF6UW5yT2lPNThxdUZrWnVYZlFyOVB6cU9VaTRLYjA3SDZU?=
 =?utf-8?B?WHBENmRDMGtCYlNoek5NSWZXNzU3NGt3a3loeitIbWxqOG45VjgvSUZjR2Yv?=
 =?utf-8?B?OFJUVUF1ajdXUUZJQVFGb21xN0lvdTBUU0NtVEhiWUxiQmNnWDF6SWlYekxN?=
 =?utf-8?B?Z3cwZmxHNlhHZUJBWW1tOGkvcGRUdWljNWFSYW9uM255WjdNc0VqTWkvWWE4?=
 =?utf-8?B?UGdtZ2MzMGtpYXVJWDRiMWxOU1FUUmVHWURJMFBSQUhMenJjWmJIKzVUd00y?=
 =?utf-8?B?MGZNYmVCQnJ5SC9BMXV6ZWloYmtLYlV1SFdzUjlwWEtKZXNncmFGSWVkM0x2?=
 =?utf-8?B?SHJXam5aODlONElxZFBwenNhMnBRYy8rcU9LOHRqR25iTEVuVFlnemxCUEtC?=
 =?utf-8?B?L3dtWkdkaEZZWWJoeHI5a0kxOFNobWE2R0l2R2NOTmVPT3hmaFh6aTNuS1Jw?=
 =?utf-8?B?c2gvY1hQU3FoRzdja2dvUi92Wit2RnpiRjYwNDZnSHM1ZUdTMm5ZTlRkZVJX?=
 =?utf-8?B?cjRpeWNmY1JialZRa0Z1eTJGSDRNb2tkQzlONmg1K3pjOEEzOWN4eXFQM3Y1?=
 =?utf-8?B?ZDBJQ3RLODhwMGlJRlFXS01NQjBnVzBUUm9ZdlF4a1p1d25laUFzOUI3UGN5?=
 =?utf-8?B?eDZjNDl0QWlwU2JCTGdlei9ZYU5XQ2RQeUpTc1ZOQkJOSXJ3aE4zZnVUSXll?=
 =?utf-8?B?bXE0OWVXQmhjL01qdGV3UzF1YThHOU1Kc2NYTi9TTlFXKzRNWnBwcGo1Q3JF?=
 =?utf-8?B?aktuWVRtWFdmNTV1MU5sb0V1NEFNVm0rL0tXb1FIa2ZwMVR4a2lTYnJvck1R?=
 =?utf-8?B?ZE01emlhdmlqenhtR0FGTy9ZT3NHMjN2MkN3ak03MUwyc1hsY2FzRE5ISk5G?=
 =?utf-8?B?ZGJNR3hIWmlTejRieGxteVMvVUFkZjZFb0dybVZhQ296MGJUcHJiclM5Wjkx?=
 =?utf-8?B?VkhUNHIvWUEzV3BkOHJ2eFNqMm53WHZaYmwrVnYvbGpzKythVmRRUFVJZ0Ix?=
 =?utf-8?B?VGRjaGRCY2R4a1FhNHJUMGVhd2RCbWdtQjBQL0lpK2IvUW1hVDIxMU95eEti?=
 =?utf-8?B?c0d4MzdBSGYrZDYvbFFpdTdSdGlJOHg3cmRkRFdiY0tRSG90cytmRkowaTJw?=
 =?utf-8?B?d0VLRHhxdzB6NE1UTFFWVTk4ZW9sZFBKVmoxS1BkU1o0OC9PNjNia2prK0RP?=
 =?utf-8?B?bFVOQTVtYUYrMHlXdGd1cEdNZGNVQm14cnJsQ1BsMWRUL3dOZEhVOSt2TkZX?=
 =?utf-8?B?VHBUZWRYSFpxeEoxMU1EZnZRVm1GVlV1aHRaYVBzbHZVeWVVdEpsK29sVkYx?=
 =?utf-8?B?cklYMnFaZWJWM0VOcGtBTU54ZWtBdTBySWkzNXVkQVhWY0pYM014bUxSRzhZ?=
 =?utf-8?B?dEVNeW5ia29qc3VUNC9iYktmamJXRnltUEFudjFnM1Qyc2YrMnhTYi9UaHVk?=
 =?utf-8?B?MlVWMFRBdm92R2trT2VndU5qSW4vK3YxY09kNGNGaSs4TjlnWnhoTUlMU0Jn?=
 =?utf-8?B?SE8vWGYwTDI3bUZPNWpENVNPb3QxS3pVOUIxMTNtZUVJT2hRc0JhQWgyNW42?=
 =?utf-8?B?Z3MyNjlQeWZFZDZybG50TTVBWHFKeUVzZzNVcFJuYzEwTm9aKzhCNFduS1Vk?=
 =?utf-8?B?aEtnb1RncVphMlFVWGJyTGN5b2lXcWVoa3V1NUNpS2R5cUxXMHZUa2RSaWpY?=
 =?utf-8?B?QXNTY1FQQTQveGZBVjJhR3dvS1RPL2VFRldyYkhsOHRJZW94MkdCQ0hxMXp4?=
 =?utf-8?B?UERnZ0kxbTFQWG45L0tZbzlONFNRTHhyWFUvajBIUjBwRzBrb2VHUnFyRDh5?=
 =?utf-8?B?R1NwVDd3aUhLSFNBV3pQWGROZ1RRazNaMC8rL2t4YldWUDZaZEJoMXY4cFlj?=
 =?utf-8?B?NXFXNGY0TncwSks0Sm1DSGQvM0MzeEIxTW9jcUswbklXaHFNYS9EcUxDR0hh?=
 =?utf-8?B?QmY5OXc1WWUxTFNmdGdHQ3lEVngyM0FwWHZvWUtKRm0vcUFrMXJROUo2YzhT?=
 =?utf-8?B?Y3RRcFFWMVFnWkovZTMwMkJHRmtMbitDYlVlUWcxTkkwNFNUMlAvYmJSOEFv?=
 =?utf-8?Q?rQA0iC5aufdh/I1wM68yJNOQ7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4abc67c-f408-485c-10f8-08dbb079e802
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 14:43:03.5300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /9eSLXfSVhqMVrIeQQMQ5NtiSPQ8GAMAIsTaY1Xj/t8pt1mLHkqFUHrtPiebccV4FeFpdjw/h64sEVgtYzJKIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5103
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, kernel-dev@igalia.com,
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-08 10:41, Melissa Wen wrote:
> On 09/06, Harry Wentland wrote:
>>
>>
>> On 2023-08-10 12:03, Melissa Wen wrote:
>>> Plane CTM for pre-blending color space conversion. Only enable
>>> driver-specific plane CTM property on drivers that support both pre- and
>>> post-blending gamut remap matrix, i.e., DCN3+ family. Otherwise it
>>> conflits with DRM CRTC CTM property.
>>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  2 ++
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  7 +++++++
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  7 +++++++
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++++++++++++++++++
>>>   4 files changed, 36 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>> index abb871a912d7..84bf501b02f4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
>>> @@ -363,6 +363,8 @@ struct amdgpu_mode_info {
>>>   	 * @plane_hdr_mult_property:
>>>   	 */
>>>   	struct drm_property *plane_hdr_mult_property;
>>> +
>>> +	struct drm_property *plane_ctm_property;
>>>   	/**
>>>   	 * @shaper_lut_property: Plane property to set pre-blending shaper LUT
>>>   	 * that converts color content before 3D LUT.
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> index 095f39f04210..6252ee912a63 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> @@ -769,6 +769,13 @@ struct dm_plane_state {
>>>   	 * S31.32 sign-magnitude.
>>>   	 */
>>>   	__u64 hdr_mult;
>>> +	/**
>>> +	 * @ctm:
>>> +	 *
>>> +	 * Color transformation matrix. See drm_crtc_enable_color_mgmt(). The
>>> +	 * blob (if not NULL) is a &struct drm_color_ctm.
>>> +	 */
>>> +	struct drm_property_blob *ctm;
>>>   	/**
>>>   	 * @shaper_lut: shaper lookup table blob. The blob (if not NULL) is an
>>>   	 * array of &struct drm_color_lut.
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> index 4356846a2bce..86a918ab82be 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> @@ -218,6 +218,13 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>>>   		return -ENOMEM;
>>>   	adev->mode_info.plane_hdr_mult_property = prop;
>>>   
>>> +	prop = drm_property_create(adev_to_drm(adev),
>>> +				   DRM_MODE_PROP_BLOB,
>>> +				   "AMD_PLANE_CTM", 0);
>>
>> We'll want to wrap the property creation/attachment with
>> #ifdef AMD_PRIVATE_COLOR here as well.
> 
> yeah, it's already wrapped because it's created and attached together
> with the other properties.
> 

Ah, I missed that. All good then.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>>
>> Harry
>>
>>> +	if (!prop)
>>> +		return -ENOMEM;
>>> +	adev->mode_info.plane_ctm_property = prop;
>>> +
>>>   	prop = drm_property_create(adev_to_drm(adev),
>>>   				   DRM_MODE_PROP_BLOB,
>>>   				   "AMD_PLANE_SHAPER_LUT", 0);
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> index 3fd57de7c5be..0b1081c690cb 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>> @@ -1355,6 +1355,8 @@ dm_drm_plane_duplicate_state(struct drm_plane *plane)
>>>   
>>>   	if (dm_plane_state->degamma_lut)
>>>   		drm_property_blob_get(dm_plane_state->degamma_lut);
>>> +	if (dm_plane_state->ctm)
>>> +		drm_property_blob_get(dm_plane_state->ctm);
>>>   	if (dm_plane_state->shaper_lut)
>>>   		drm_property_blob_get(dm_plane_state->shaper_lut);
>>>   	if (dm_plane_state->lut3d)
>>> @@ -1436,6 +1438,8 @@ static void dm_drm_plane_destroy_state(struct drm_plane *plane,
>>>   
>>>   	if (dm_plane_state->degamma_lut)
>>>   		drm_property_blob_put(dm_plane_state->degamma_lut);
>>> +	if (dm_plane_state->ctm)
>>> +		drm_property_blob_put(dm_plane_state->ctm);
>>>   	if (dm_plane_state->lut3d)
>>>   		drm_property_blob_put(dm_plane_state->lut3d);
>>>   	if (dm_plane_state->shaper_lut)
>>> @@ -1473,6 +1477,11 @@ dm_atomic_plane_attach_color_mgmt_properties(struct amdgpu_display_manager *dm,
>>>   				   dm->adev->mode_info.plane_hdr_mult_property,
>>>   				   AMDGPU_HDR_MULT_DEFAULT);
>>>   
>>> +	/* Only enable plane CTM if both DPP and MPC gamut remap is available. */
>>> +	if (dm->dc->caps.color.mpc.gamut_remap)
>>> +		drm_object_attach_property(&plane->base,
>>> +					   dm->adev->mode_info.plane_ctm_property, 0);
>>> +
>>>   	if (dpp_color_caps.hw_3d_lut) {
>>>   		drm_object_attach_property(&plane->base,
>>>   					   mode_info.plane_shaper_lut_property, 0);
>>> @@ -1530,6 +1539,14 @@ dm_atomic_plane_set_property(struct drm_plane *plane,
>>>   			dm_plane_state->hdr_mult = val;
>>>   			dm_plane_state->base.color_mgmt_changed = 1;
>>>   		}
>>> +	} else if (property == adev->mode_info.plane_ctm_property) {
>>> +		ret = drm_property_replace_blob_from_id(plane->dev,
>>> +							&dm_plane_state->ctm,
>>> +							val,
>>> +							sizeof(struct drm_color_ctm), -1,
>>> +							&replaced);
>>> +		dm_plane_state->base.color_mgmt_changed |= replaced;
>>> +		return ret;
>>>   	} else if (property == adev->mode_info.plane_shaper_lut_property) {
>>>   		ret = drm_property_replace_blob_from_id(plane->dev,
>>>   							&dm_plane_state->shaper_lut,
>>> @@ -1591,6 +1608,9 @@ dm_atomic_plane_get_property(struct drm_plane *plane,
>>>   		*val = dm_plane_state->degamma_tf;
>>>   	} else if (property == adev->mode_info.plane_hdr_mult_property) {
>>>   		*val = dm_plane_state->hdr_mult;
>>> +	} else if (property == adev->mode_info.plane_ctm_property) {
>>> +		*val = (dm_plane_state->ctm) ?
>>> +			dm_plane_state->ctm->base.id : 0;
>>>   	} else 	if (property == adev->mode_info.plane_shaper_lut_property) {
>>>   		*val = (dm_plane_state->shaper_lut) ?
>>>   			dm_plane_state->shaper_lut->base.id : 0;
>>
