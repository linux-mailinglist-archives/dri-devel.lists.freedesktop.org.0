Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F279445A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 22:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B67410E1F2;
	Wed,  6 Sep 2023 20:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC19210E1EE;
 Wed,  6 Sep 2023 20:15:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8MyPM/CxWRCnv/ORE1dQZ5DmNlgSESNEie2NN2E2PXRe+7z8kXDe1hHasQBmbAjO+6GuQCAXtKQGzpMWuqAMMBTGZ2V4xtEephNtDg/7wBNN+whqJe16B5evZlpDKQkqteMK8orB6dOmHmusJezl1I/UsJca/GVM0gEsdYfXceOssE4sy3DpzAxUEMzbxpiNeuveQX6BfGpZX3tUH6few/F+LDqRDlD/qH+OEUL1s325L5aEQC9PGpFOeEAHnMml487YFCQVceUY07HQj5frEJyJXqO3o8drz5UvXOU84659FIk6cSJdxyl0GEYgO9WbfpAajmBp7NXLD4lzitIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLuYr/RJCQ4bkCos+3TukBxF82fdbF9uiCp5Dy7eiSI=;
 b=CuWvqKOn4ORTqJmjf6PhgrXzrKSqBQxbEK1z9sR8IhMicgzgrZ8vQQ4zis6einZh/ezk9nZGyQQsp6yw4ELhtuNb/jTgOaiJ9k3BbhxHwr3wZ3WX3QHsJr3QSnJrdqrHs8W5UYZvxu4WUHy9dtkPjO5LbMJQtgAh4QYXetuxg4rAexthUP0083gMGgwLDtPoArhNty1kc6XueOlFWfrfhBff/d1ELoRccnHMy3q9SlfD7Ez1ZXb99Rxyeoi0VechX2t5Twq6ExLDCAcpkAd0qfpJYlHM7/UmX0RlhT3Cy3IMaZttZZ1c855z6vnYO1xtCi/wrdypK3HFUQhQrINagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLuYr/RJCQ4bkCos+3TukBxF82fdbF9uiCp5Dy7eiSI=;
 b=BFB3wbNfZuVZzW3cj7py/5RCPPwQdr0RK5yexy9nu7MLcvCzuAUd0S5sWWmv+JFfD92Od/JVBC6gCAZj/fM05FZhn3goFwGhEHS9GKkd9CjswMB50ErXSrcdy44erq+/dmKkecw+7RqUOa0e7VNtix2qE7RT9CLAQXw914ZA2AI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB7733.namprd12.prod.outlook.com (2603:10b6:208:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 20:15:15 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 20:15:15 +0000
Message-ID: <40f1fabe-69ce-4b23-aed8-9f0837fe9988@amd.com>
Date: Wed, 6 Sep 2023 16:15:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/34] drm/amd/display: explicitly define EOTF and
 inverse EOTF
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-8-mwen@igalia.com>
 <20230822140242.162a843a.pekka.paalanen@collabora.com>
 <20230825141639.vurga52ysal37n2m@mail.igalia.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230825141639.vurga52ysal37n2m@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0312.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6c::17) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 23c5f8ed-3d79-4da6-f5db-08dbaf15fb5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: byyuxkdp0EJf9imbxUgJb7vsYSdRvsd1ciSCx4BNQY1vzVsHBhcEmo06XRRmseYYJOpLo2lpXPxjlKOWtI61/za6eTWTb0IkOelX6yrdR2ZI3YGNHHL2BmJvUBLFZlOuwFoxcYor+xMo1N49EJxw5Wc/u5u7B0mVJ1nhBdz4kUldbqdzYs8wzctJxv+gS6jUtfag/jZmr9Hs773i2BA+iyxfwizBYLAOP2vdcgKGRtU15XXOsSBZileQEtNc3YVrf/JIvbS4Ah5P5UeWUhW+IxPyPhgYn5Y+Kn0LMiVOaDH2o59CalZalNWwP1OjbYBQKNkv1uq30xv726MqCpYL+O6bLQ0N9lM7+oW4jhnDCTW8Wo89Ea0w7SwL14OTrtqOeFX+Kkh28DqCel17FSUOT7ny1H40QE0VX2gk7aYDq/pr1EBzwjaHrMLN+ZqeNd7+S2SRDYC381ijEOD1VRfrcenpRrIK6z1RJjt953S+H+NuSX2bMwfCsixXevstGrwW2DFN9QzJ0bd/G99fkAtBQL2VtexPGkQcMw62MeiNeY1TVxoBjCtka/Bde24KCtxuylego6uSj72VjT4zDjIpaFo8g/G/Crfmt3j1vsZmTBJIasCQBymjZYDs7gYXsvTwdCAB1RTTvAa+1eFDypT79Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(1800799009)(186009)(451199024)(31686004)(53546011)(6486002)(6666004)(6506007)(31696002)(36756003)(86362001)(38100700002)(2616005)(2906002)(26005)(478600001)(6512007)(966005)(83380400001)(110136005)(41300700001)(4326008)(8936002)(8676002)(5660300002)(316002)(7416002)(54906003)(66946007)(66556008)(66476007)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TG1xUm9uNjRROU92bkh5R25pZGFVR3pEbHlESXhTdjdVSzZQMFRmN1JNR1Nj?=
 =?utf-8?B?RFJQQk52UjNwYXlLa0FjTFI2T2h1R0JUNThzRjV2bGdtdXVTRDlEUkdBbWd6?=
 =?utf-8?B?dU50Rzc4M0k1MUFYWm1kRUJLOWNsTFR3VGZ3U1RzUWtCWHdKb1JRNVRoZ1ZG?=
 =?utf-8?B?QmpFZGJVWndNWlRTZzN0Q1NZbWFKNFZEZVdWMlVFNmZjTjVKOC9qNXE0NWR0?=
 =?utf-8?B?UVE2ZTFvL254K0VuTUM4OFpmaXlmYTlUSjBBUXJPNnZMTDUrNGlQcUQwblpE?=
 =?utf-8?B?eGsza01hZVR4aW85alo4dzEvQzFQRnRHeitzT1o3dlpRU1FVMkVSU21GSFht?=
 =?utf-8?B?bVp0SmN2cVdQdmpYdjJOSGhUN2g3WkZRWFdxVDVhTkJydUNvNGIzeiswNUVn?=
 =?utf-8?B?eGZBOGRKaSs0TVd5TkNNVWZkVzVjNEtoZ3c4Q1ErdzhNWG9XdzAxT0xhSEsv?=
 =?utf-8?B?WkhkT1pubngyZ0xUUlRxNVFPYVBabjkyVE9mYXlLaVJTdlR6YzRCZFZoQWNG?=
 =?utf-8?B?Tm03L0o4RTQ0d213a0ZBQmRVUUhudFJZQzR3azllNHZYQzBLQjhHTzNNN1ll?=
 =?utf-8?B?NERmVU9NME0xcDRLZEYvQzhQVFYxVHpVQmRXQkVVNXJkVTlwdzdJVVRLWEQy?=
 =?utf-8?B?RGV0WmxjVXNTdUpYTXlMNDd3NFpoZkJEUnR1UVJWbEtRaUV5QS9UdVA3QWVx?=
 =?utf-8?B?a3E0NmNyYmM1T08ydzRLN0x5b0EwOHlYQXM0dU11eU5QM2s1Qk9JUndrelVT?=
 =?utf-8?B?c2RKTVJ4eCtKTWhncmpyR0drN25jQ0RPd0c1ZUFWYm5wN2toTDdDV3ZSUUtC?=
 =?utf-8?B?eUUzTU1iUGxhT2g2T3loMkRrZnhpTHgzekVkZVJFWTRWWEUwQXZTTnpnRW9r?=
 =?utf-8?B?azR1dDM3eEpDbG8xengya09xaDg0MEoyLzhVK0NjODczM0JOeVhWSHNOa0pP?=
 =?utf-8?B?TnBWWWFqWGJXV2pucTBpR2JzKzFrdVlSM0hta0VCNTFTVnZaaHl6aDNkU0Z5?=
 =?utf-8?B?eFBXUVNFVmU5bTQ4U1JROU1TQ25qcm9tZ1BxL2FBeVVGSzdHQzlZaDI0YU9k?=
 =?utf-8?B?c0ZXKzdUV1MxYkV6T09xU2lOTTRod1FkOTVOb1J4ajZZemJyTUc3Y2JsRzR5?=
 =?utf-8?B?dWhiZVM5U3hPY0Q2YXdIWERhWVQ3QStWWkNaZm5Ua21iL2NSekdxcG9iaWk4?=
 =?utf-8?B?NW1nRWdvd3F2aDRZZHVUWFBWS1FtQmFmMy8wUUc4czFnY09zQjFNaTZqNmJo?=
 =?utf-8?B?c21kMVFzWXVpYzgvczFwdytReTBKZWI4eXQ4QTVHQUJza1RzYlVCMFhtazY5?=
 =?utf-8?B?U1RKaC9JaHFodDlwenVGWkVEeFpLMklCRHVIRHNiL2k4QkJMN0ZWTndUMWxz?=
 =?utf-8?B?UXZtTU85N0tUQ2MzUktsb0hSRzQ0VXBlYkdZaHhhVHg5Q0l1eTJ0T1lQNkFG?=
 =?utf-8?B?Y1hpOXB5MnV3eUo5V0lwNGUyOFYrVUtCUFVoUVR5eUJDQ3ErUUJzNFp5Qm9l?=
 =?utf-8?B?Rko1Y3hUL2lCL0YvcmIvNzFVcjA4dUhhRWJUMmRBdHVTNHF1VGUzNXBCYkR1?=
 =?utf-8?B?bWpFOTBOTkMyRUZkWlI3ZFNPS0VTY1BYTXhqdkU5SGplM0I1d0MvUkpBN1Fh?=
 =?utf-8?B?VFczWUlnN0QrN21oWEwyb2JjNFA3ZE4vdlBvWG9lN2JzMkx6LzRnTkdhV2Ni?=
 =?utf-8?B?c3hZZ1g5QjhrOEdTdG9XZjJyS0tEZWVOZ2RyYjMyaGZNck1za3JueEFZbmNF?=
 =?utf-8?B?b20yd1c1SXhzN0RrcWR6UWwrTGhpSVg2OGZpekxCY2F1YU4zNWJWNEQ2cGV2?=
 =?utf-8?B?SUxjakRIZmJqMnkvczV2T3Q3Y1VHOE5oY3k4dnJqSmNrcFQzTVVuemFYa01U?=
 =?utf-8?B?dU5MUkhiY3FTZXpreExIdktaTnJidUR2OGcrR1NCeGhvNTREY3NsUG5tL1ZP?=
 =?utf-8?B?SXQ2KzN2S1VGekh3aXkvSkprQkVzM1FqMXl6WCtLcnFPUythbTd3d3VMSy9z?=
 =?utf-8?B?dzNIdHYvbzhDT1dwTkkxeXlTbVQzbGxhY3UxcUVjNFNNek1JQjNIeTRyckVP?=
 =?utf-8?B?cW9BNmg2akdzNHFzMEFXVFhQV3RITStNUnBkb0hOQVp6YnA4L09ZaUZmQ3Rk?=
 =?utf-8?Q?oZDB3G/kSFEGTHaYHZuYVRRl4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23c5f8ed-3d79-4da6-f5db-08dbaf15fb5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 20:15:15.2309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKj4CtCD+TVoKJl5iN0+OvrjVYbKOV4+J8yw3beLtdktY/at1wLODBCtw1Nga3n0IzfQk6bCa1U8tiIP45RnOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7733
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Shashank Sharma <Shashank.Sharma@amd.com>,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-25 10:18, Melissa Wen wrote:
> On 08/22, Pekka Paalanen wrote:
>> On Thu, 10 Aug 2023 15:02:47 -0100
>> Melissa Wen <mwen@igalia.com> wrote:
>>
>>> Instead of relying on color block names to get the transfer function
>>> intention regarding encoding pixel's luminance, define supported
>>> Electro-Optical Transfer Functions (EOTFs) and inverse EOTFs, that
>>> includes pure gamma or standardized transfer functions.
>>>
>>> Suggested-by: Harry Wentland <harry.wentland@amd.com>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>> ---
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 19 +++--
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 69 +++++++++++++++----
>>>  2 files changed, 67 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> index c749c9cb3d94..f6251ed89684 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>>> @@ -718,14 +718,21 @@ extern const struct amdgpu_ip_block_version dm_ip_block;
>>>  
>>>  enum amdgpu_transfer_function {
>>>  	AMDGPU_TRANSFER_FUNCTION_DEFAULT,
>>> -	AMDGPU_TRANSFER_FUNCTION_SRGB,
>>> -	AMDGPU_TRANSFER_FUNCTION_BT709,
>>> -	AMDGPU_TRANSFER_FUNCTION_PQ,
>>> +	AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_BT709_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_PQ_EOTF,
>>>  	AMDGPU_TRANSFER_FUNCTION_LINEAR,
>>>  	AMDGPU_TRANSFER_FUNCTION_UNITY,
>>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA22,
>>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA24,
>>> -	AMDGPU_TRANSFER_FUNCTION_GAMMA26,
>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF,
>>> +	AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF,
>>> +        AMDGPU_TRANSFER_FUNCTION_COUNT
>>>  };
>>>  
>>>  struct dm_plane_state {
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> index 56ce008b9095..cc2187c0879a 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>> @@ -85,18 +85,59 @@ void amdgpu_dm_init_color_mod(void)
>>>  }
>>>  
>>>  #ifdef AMD_PRIVATE_COLOR
>>> -static const struct drm_prop_enum_list amdgpu_transfer_function_enum_list[] = {
>>> -	{ AMDGPU_TRANSFER_FUNCTION_DEFAULT, "Default" },
>>> -	{ AMDGPU_TRANSFER_FUNCTION_SRGB, "sRGB" },
>>> -	{ AMDGPU_TRANSFER_FUNCTION_BT709, "BT.709" },
>>> -	{ AMDGPU_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
>>> -	{ AMDGPU_TRANSFER_FUNCTION_LINEAR, "Linear" },
>>> -	{ AMDGPU_TRANSFER_FUNCTION_UNITY, "Unity" },
>>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
>>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
>>> -	{ AMDGPU_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
>>> +static const char * const
>>> +amdgpu_transfer_function_names[] = {
>>> +	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		= "Default",
>>> +	[AMDGPU_TRANSFER_FUNCTION_LINEAR]		= "Linear",
>>
>> Hi,
>>
>> if the below is identity, then what is linear? Is there a coefficient
>> (multiplier) somewhere? Offset?
>>
>>> +	[AMDGPU_TRANSFER_FUNCTION_UNITY]		= "Unity",
>>
>> Should "Unity" be called "Identity"?
> 
> AFAIU, AMD treats Linear and Unity as the same: Identity. So, IIUC,
> indeed merging both as identity sounds the best approach.   

Agreed.

>>
>> Doesn't unity mean that the output is always 1.0 regardless of input?
>>
>>> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF]		= "sRGB EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_BT709_EOTF]		= "BT.709 EOTF",
>>
>> BT.709 says about "Overall opto-electronic transfer characteristics at
>> source":
>>
>> 	In typical production practice the encoding function of image
>> 	sources is adjusted so that the final picture has the desired
>> 	look, as viewed on a reference monitor having the reference
>> 	decoding function of Recommendation ITU-R BT.1886, in the
>> 	reference viewing environment defined in Recommendation ITU-R
>> 	BT.2035.
>>
>> IOW, typically people tweak the encoding function instead of using
>> BT.709 OETF as is, which means that inverting the BT.709 OETF produces
>> something slightly unknown. The note about BT.1886 means that that
>> something is also not quite how it's supposed to be turned into light.
>>
>> Should this enum item be "BT.709 inverse OETF" and respectively below a
>> "BT.709 OETF"?
>>
>> What curve does the hardware actually implement?
> 
> Hmmmm.. I think I got confused in using OETF here since it's done within
> a camera. Looking at the coefficients used by AMD color module when not
> using ROM but build encoding and decoding curves[1] on pre-defined TF
> setup, I understand it's using OETF parameters for building both sRGB
> and BT 709:
> 
> ```
> /*sRGB     709     2.2 2.4 P3*/
> static const int32_t numerator01[] = { 31308,   180000, 0,  0,  0};
> static const int32_t numerator02[] = { 12920,   4500,   0,  0,  0};
> static const int32_t numerator03[] = { 55,      99,     0,  0,  0};
> static const int32_t numerator04[] = { 55,      99,     0,  0,  0};
> static const int32_t numerator05[] = { 2400,    2222,   2200, 2400, 2600};
> ```
> 

The first column here looks like the sRGB coefficients in Skia:
https://skia.googlesource.com/skia/+/19936eb1b23fef5187b07fb2e0e67dcf605c0672/include/core/SkColorSpace.h#46

The color module uses the same coefficients to calculate the transform
to linear space and from linear space. So it would support a TF and its
inverse.

From what I understand for sRGB and PQ its the EOTF and its inverse.

For BT.709 we should probably call it BT.709 inverse OETF (instead of
EOTF) and BT.709 OETF (instead of inverse EOTF).

While I'm okay to move ahead with these AMD driver-specific properties
without IGT tests (since they're not enabled and not UABI) we really
need IGT tests once they become UABI with the Color Pipeline API. And we
need more than just CRC testing. We'll need to do pixel-by-pixel comparison
so we can verify that the KMS driver behaves exactly how we expect for a
large range of values.

Harry

> Then EOTF and inverse EOTF for PQ [2], and OETF and it seems an inverse
> OETF but called EOTF for HLG[3]. But I'm an external dev, better if
> Harry can confirm.
> 
> Thank you for pointing it out.
> 
> [1] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/display/modules/color/color_gamma.c#n55
> [2] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/display/modules/color/color_gamma.c#n106
> [3] https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/amd/display/modules/color/color_gamma.c#n174
> 
>>
>> The others seem fine to me.
>>
>>
>> Thanks,
>> pq
>>
>>> +	[AMDGPU_TRANSFER_FUNCTION_PQ_EOTF]		= "PQ EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF]		= "Gamma 2.2 EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF]		= "Gamma 2.4 EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF]		= "Gamma 2.6 EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF]	= "sRGB inv_EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_BT709_INV_EOTF]	= "BT.709 inv_EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF]		= "PQ inv_EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF]	= "Gamma 2.2 inv_EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF]	= "Gamma 2.4 inv_EOTF",
>>> +	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF]	= "Gamma 2.6 inv_EOTF",
>>>  };
>>>  
>>> +static const u32 amdgpu_eotf =
>>> +	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF) |
>>> +	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_EOTF) |
>>> +	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_EOTF) |
>>> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF) |
>>> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
>>> +	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
>>> +
>>> +static struct drm_property *
>>> +amdgpu_create_tf_property(struct drm_device *dev,
>>> +			  const char *name,
>>> +			  u32 supported_tf)
>>> +{
>>> +	u32 transfer_functions = supported_tf |
>>> +				 BIT(AMDGPU_TRANSFER_FUNCTION_DEFAULT) |
>>> +				 BIT(AMDGPU_TRANSFER_FUNCTION_LINEAR) |
>>> +				 BIT(AMDGPU_TRANSFER_FUNCTION_UNITY);
>>> +	struct drm_prop_enum_list enum_list[AMDGPU_TRANSFER_FUNCTION_COUNT];
>>> +	int i, len;
>>> +
>>> +	len = 0;
>>> +	for (i = 0; i < AMDGPU_TRANSFER_FUNCTION_COUNT; i++) {
>>> +		if ((transfer_functions & BIT(i)) == 0)
>>> +			continue;
>>> +
>>> +		enum_list[len].type = i;
>>> +		enum_list[len].name = amdgpu_transfer_function_names[i];
>>> +		len++;
>>> +	}
>>> +
>>> +	return drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
>>> +					name, enum_list, len);
>>> +}
>>> +
>>>  int
>>>  amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>>>  {
>>> @@ -116,11 +157,9 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
>>>  		return -ENOMEM;
>>>  	adev->mode_info.plane_degamma_lut_size_property = prop;
>>>  
>>> -	prop = drm_property_create_enum(adev_to_drm(adev),
>>> -					DRM_MODE_PROP_ENUM,
>>> -					"AMD_PLANE_DEGAMMA_TF",
>>> -					amdgpu_transfer_function_enum_list,
>>> -					ARRAY_SIZE(amdgpu_transfer_function_enum_list));
>>> +	prop = amdgpu_create_tf_property(adev_to_drm(adev),
>>> +					 "AMD_PLANE_DEGAMMA_TF",
>>> +					 amdgpu_eotf);
>>>  	if (!prop)
>>>  		return -ENOMEM;
>>>  	adev->mode_info.plane_degamma_tf_property = prop;
>>
> 
> 

