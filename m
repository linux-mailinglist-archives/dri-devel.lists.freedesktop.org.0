Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7258793F9A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 16:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD1F10E691;
	Wed,  6 Sep 2023 14:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F5010E68F;
 Wed,  6 Sep 2023 14:52:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lCWYm10G408WyVPdxaNq8dsJ1BGSJmGUhejQOxt9RCfTHzr3uF67iLhrpOXTNu2+phSD/9ff9qYZ/d+OCHCNAO4NBxHRyYR9lkKjbISzVTiKW1yhM/8ZOZqhDTzTkbFXDXNMCebrHmAqW3i9qBynIPM1MRCJN1EnJM4jRf1k9rCvXt3PaJdv2pvb0CWYDT0EaElvcOZZDOQsBHiOuEwGoSJfIod2ewV7PWHMHkaVAaBdnbf+bdJQ/ilSqUf6PGrHuCoout76TQ+nhs2k+8/41TM+VatJlB1b4BadMyojBZsnnVB2QLffD38tpQXnrzIGD8WM1Jpz4bhuqkF8nzUmOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OuCRs/+NzLyNQzsGQyGZrTSzxOrneomXe4cm7Ixr/WM=;
 b=gFPTkmzqEuQAGIXu03u8imufkElWTmp3MsIFCjm1cqkG1dMvueqMhpR4akicSbNzysUhJX8a3LVBa2dfwXd5k06Rqh15+z5jjPE6jPTJCvPDg5Pm+4XYvyeplPEHiD0ozhjfAZE8jCah6NVMnCLq66xbAfw5uAR2D29qaya+EJWQeacFYqE8qYCHXjyqRraFg3OSCKuxvfga/J6zjl3VgnMJimAq3mLf0DW3etwnriL2AgBjNvQqFqx3Adq5QZPuZDLkYMHxsa4A6Al+yizT4aAjVMzLN3x422N8bUcVSebIEgsEpkXoWvI0Y0/9ZmMCBUDRWVRaUX1uTr9UJ72F+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuCRs/+NzLyNQzsGQyGZrTSzxOrneomXe4cm7Ixr/WM=;
 b=mnRAVrknuD+nE9Q3C8iYGNJIg7IIsf4i7XongmHy2EGDYgps6wT6+XD+YkescfjRFccQcsZ3Tin77cqr3I+ie4YTd4kRZpwjs0Gc10ov/whDmsLXKuZn6E753vk1Km2edJjjosWzJzn3ne1elHLudXjih+yplm6EII2XGP8g0L0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB8027.namprd12.prod.outlook.com (2603:10b6:806:32a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 14:52:39 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6745.030; Wed, 6 Sep 2023
 14:52:39 +0000
Message-ID: <4564256a-198f-40be-b9f3-e7e6e4e60c88@amd.com>
Date: Wed, 6 Sep 2023 10:52:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping CRTC
 degamma to DC plane
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
 <20230822151110.3107b745.pekka.paalanen@collabora.com>
 <CAEZNXZCfvc909iFZQMdNEz=P_T=rYEYKq1Tdrt+8RNQpBSNt_g@mail.gmail.com>
 <20230828132355.21a8fd89.pekka.paalanen@collabora.com>
 <20230828135604.ixuwnyo6d3xqgtjp@mail.igalia.com>
 <20230829115113.7bba24b3.pekka.paalanen@collabora.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230829115113.7bba24b3.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0157.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::26) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 20225a5b-ca61-46f5-3df8-08dbaee8ea38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j00/c5mlIGv/xT8nivr4ipKbt40SGfPylp5AX+ixtmsDTTmbe/UqAZU9pDE9Z9hsEnhW8Z83Sobj+Ipo5clEGWQoBh1kbSsQ56kbXDS14j9moxJ04vldgGHE3Dw+g8Zve0D+6dHwJ/aHNlde9QLQfy5kDN7mmGAZZKbKixF9Wo+as0at/RyBKB3iuZ2vA8ZsarZ7hZxbuzinsmLOT+7byryvbLy76D23BG3vzaPJdv/5scXTbLuBq7NwJ44Y1uyMtFOQp/uLbvYrUzO9I7TXTO9dd7i2cwIikH2HpILEqBVLso3229pFO3vSgr+vKGGL2YbiW+k+pqvgIB255Hyd0vst6g8MRP2ANZ0YgUjaWfkgSfEN161zeu+HjESg+Ygy7TgxlsItAKZ1WaHX/CgsgFJUbvGQljVRM6dotmH/KaJebO5OsKzJBsGNDvtyC5GwX1S3THedZ1n4Fno17GSpFQ4H4PL2fKj93qe0WzkdC8EgVFEF7J4q5PQvui4VaGb2BhWMbok+ek6HLmoDJQAAPRd28p0v/z49b3q/0fb2c6uXZCg+2ZBjRjxfKtF7qiWfr4NvZeIHVoi9RhrSxWOy1ariksfKBZhbpNy9sGMPFJwqwdfNMAWmtaNp68MtNEPepdNjl6/bgl3nDn3WZNX6rKigukYN0lIIxyDm+s61d4Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(186009)(451199024)(1800799009)(2906002)(38100700002)(36756003)(31696002)(86362001)(110136005)(966005)(6512007)(6506007)(6486002)(53546011)(66556008)(54906003)(66476007)(316002)(4326008)(66946007)(8676002)(2616005)(8936002)(41300700001)(31686004)(6666004)(478600001)(44832011)(83380400001)(26005)(5660300002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1md0NQTTAxQmR2MFRHSDRqYzI0eWJaS3Z4Y3ZrUW1sWEt1NlIvZ0cxMTFr?=
 =?utf-8?B?VGJMM2VrOUZqMGRoUnZPSU8rQmdvRlRQMDJtWWIrQnV6aHY0Ty9sbFlRbU83?=
 =?utf-8?B?WkVqUmc0RW1VYjNQb05CZC8vVDNHckh1N1lQM3pScEpvMVJYM3J3QVBocHJo?=
 =?utf-8?B?MUZ3YmlFdkNaQ3A5eEN4SkRKYnFWdDcxV0Q4Z2tTbHBsa0FlTHZDSXU2UzNT?=
 =?utf-8?B?UmtJMW45U3dtcHhVRWVMQnlOQzdoVFV5VVdoVDJKRTN3YlU1MDdzNTVBNVdH?=
 =?utf-8?B?VEhxYm4ybERnMElneGNnSUdxQ05Nblpka1IvRSt4SUw5VEhYU2Uva1NkTTJT?=
 =?utf-8?B?dXBzT0dMSVhRVWR6R0JvazFoV1lKT2ZBN2syTmg4Y3FTY2RWWjlNMWJjMG80?=
 =?utf-8?B?MUlsWnlnbzJSWmZmeTV1b1h2YXRqRDRGRi9jdFhHdnVmcW4yTytWNXR2S2dD?=
 =?utf-8?B?SkdtWDBtdHYvM09QbkZjS2NBeDV3cjBrdjFxMEFqR25PL2ZLNGdrc3BybW5t?=
 =?utf-8?B?OTREZGhSb1h6c0J0K29neTVONnNOTW9yN0gvYldMUHFsVVNQLzc0QTFIQ01s?=
 =?utf-8?B?dmhIRy8rWkNCejNvU3JSTXlOamI1ZDJrWWl5MXVkWGh5S21xZDdOM1Z4ZVFm?=
 =?utf-8?B?Y20zYXRZMUxEb0pmTUwxL051K1lmWFNkRXJNaTVuVmMveXdOc3FqNkU4UWFl?=
 =?utf-8?B?QVZuZlRWVVlyQmYvejN5dkVXVVIxdjdVVVpWVUNGZjQybW01d0NoQ1kzSmIv?=
 =?utf-8?B?N3V3QjBNYVh1ZTVudFVpWkltdWwxa20wYWxyeTc2QWZKUDVNR1pRL0xyNHlp?=
 =?utf-8?B?NVNSajE1UXpBM09PRm5CMjNWSlRSNWd6NEJ0MWlIcW1xcmZoNExubTQ2aFIx?=
 =?utf-8?B?WDRYQWtZZjU5WXRQc29YWWNhWFMzVGFreW00eFd4Rjh4RjNjVXpwWmN3c2hP?=
 =?utf-8?B?ZDRDSU5WMlNqS25Yd0JKL2J6RDhXVGNsbFNCaHpOa1pDSTNZQzhQdFcva0tx?=
 =?utf-8?B?ejVvbmdCSDcvSmhLRk0xUXNhc2FOaEJBTXdDU3hpbU9ZTG9wbHp0OUM5MlVq?=
 =?utf-8?B?MkZ6MDQwb1JwZ0lEQnIveDZsQjJWR0hvcUJKNjB6VmVYZzgyeUhXN2MyTmZx?=
 =?utf-8?B?WExMR09aNXJad2xEVUF0UVlOWUFtQUk1a0tORE4zVUh6ejIwU0ovd2UxUHYx?=
 =?utf-8?B?R3gyUmJlNlRGNHhxeG5RV2g2UTFxZlRVdDhOcnNtR3ZIeFdBRU1jMmgxTklU?=
 =?utf-8?B?Z1laYVlDN3AwQS9nWXMya2t1Q1NYMFNXaEZoY1pCYkMzRlpwWXNIanFEMkpG?=
 =?utf-8?B?bWpWb214ZThqUmdWS0xJT1VVcEJ6RmM0bWNpT1dNUHltQzdhRTFPUloweDlm?=
 =?utf-8?B?THNaTms4bWIreVlCZTB4cG1GUHlCMENRVS9oZ2c5MDNZb1Y4Y3VLKzhRSHFR?=
 =?utf-8?B?UE54NnEzRUdyMENFYTlCZCswNmlkQm85cjYrMVpiY1pHVDBmdC9TWmlaZUZ3?=
 =?utf-8?B?cUJHTTB3Yzl6WHhHVkM3VU5vZHRETnA0R0RXekd0ZEJYWGFJNk03Vmh4cWJr?=
 =?utf-8?B?TkZXYVlrMnNNbm9SdXAyV2ZUanQ0MnBVbitkc0JMSjNVYlBDMXhuOFF6RjZZ?=
 =?utf-8?B?cGFKc2NPbHd3SkhsOFh3MC9jV0Q3ekF5OHI2b3BqUkpPOG84OXV4NVBoZm1l?=
 =?utf-8?B?Nlk5TkVqTi9LYzlodmkvbmVLY1RiWlBBUEl4dVR6V2FqRjV3UUFZTjFNR01B?=
 =?utf-8?B?VFh1ekFxb3IrVW5xME41L0puLzZBa1o0Z1IxOHVaU1ZzUTZnajFaS1NjQ0Rz?=
 =?utf-8?B?ajBob0NkRXB2eU5uWGsyRktUWmJqT3dsSkVtZVFacUMvdFlnelZSRldMUWVF?=
 =?utf-8?B?VnB0eSs0aVZnU3h2cGlJamw3U3hSQk1qSDhMRk9COXF5ak1Qcjk4WFJpbkxU?=
 =?utf-8?B?YjBPdjdYckVTbWZhZFBhTno4RzFzYndMSzZYWVAyZW5ydXZvZ04yeE1GMmls?=
 =?utf-8?B?am9yZVdtUUNxbW5LZXp4bmYycUZ0TXk5MVRxaFU1OW91eGhQck4zZUlDU3RM?=
 =?utf-8?B?SkVQOE85T2FQeUJxN2VzUWpCQnpqaythUEl1TjdUenBZWDhxZUgrTjRxYVNm?=
 =?utf-8?Q?TO8TEccxZDESpdhYRckML2jF4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20225a5b-ca61-46f5-3df8-08dbaee8ea38
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 14:52:39.0841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hSLXiYz44vcbSTbAS+fQqs9AiipsAQZrWJHr0o3xeMBa2UpgX1/lQ+EV/k9N0fF8OIfLqi7vD4DSyT6mxs5Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8027
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Hung <alex.hung@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>,
 "sungjoon.kim@amd.com" <sungjoon.kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-08-29 04:51, Pekka Paalanen wrote:
> On Mon, 28 Aug 2023 12:56:04 -0100
> Melissa Wen <mwen@igalia.com> wrote:
> 
>> On 08/28, Pekka Paalanen wrote:
>>> On Mon, 28 Aug 2023 09:45:44 +0100
>>> Joshua Ashton <joshua@froggi.es> wrote:
>>>   
>>>> Degamma has always been on the plane on AMD. CRTC DEGAMMA_LUT has actually
>>>> just been applying it to every plane pre-blend.  
>>>
>>> I've never seen that documented anywhere.
>>>
>>> It has seemed obvious, that since we have KMS objects for planes and
>>> CRTCs, stuff on the CRTC does not do plane stuff before blending. That
>>> also has not been documented in the past, but it seemed the most
>>> logical choice.
>>>
>>> Even today
>>> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#color-management-properties
>>> make no mention of whether they apply before or after blending.  
>>
>> It's mentioned in the next section:
>> https://dri.freedesktop.org/docs/drm/gpu/amdgpu/display/display-manager.html#dc-color-capabilities-between-dcn-generations
>> In hindsight, maybe it isn't the best place...
> 
> That is driver-specific documentation. As a userspace dev, I'd never
> look at driver-specific documentation, because I'm interested in the
> KMS UAPI which is supposed to be generic, and therefore documented with
> the DRM "core".
> 
> Maybe kernel reviewers also never look at driver-specific docs to find
> attempts at redefining common KMS properties?
> 
> (I still don't know which definition is prevalent.)
> 
>>>   
>>>> Degamma makes no sense after blending anyway.  
>>>
>>> If the goal is to allow blending in optical or other space, you are
>>> correct. However, APIs do not need to make sense to exist, like most of
>>> the options of "Colorspace" connector property.
>>>
>>> I have always thought the CRTC DEGAMMA only exists to allow the CRTC
>>> CTM to work in linear or other space.
>>>
>>> I have at times been puzzled by what the DEGAMMA and CTM are actually
>>> good for.
>>>   
>>>> The entire point is for it to happen before blending to blend in linear
>>>> space. Otherwise DEGAMMA_LUT and REGAMMA_LUT are the exact same thing...  
>>>
>>> The CRTC CTM is between CRTC DEGAMMA and CRTC GAMMA, meaning they are
>>> not interchangeable.
>>>
>>> I have literally believed that DRM KMS UAPI simply does not support
>>> blending in optical space, unless your framebuffers are in optical
>>> which no-one does, until the color management properties are added to

I think Mario Kleiner had a use-case that made use of that and introduced
FP16 format support in amdgpu.

>>> KMS planes. This never even seemed weird, because non-linear blending
>>> is so common.
>>>
>>> So I have been misunderstanding the CRTC DEGAMMA property forever. Am I
>>> the only one? Do all drivers agree today at what point does CRTC
>>> DEGAMMA apply, before blending on all planes or after blending?
>>>   
>>
>> I'd like to know current userspace cases on Linux of this CRTC DEGAMMA
>> LUT.
> 
> I don't know of any, but that doesn't mean anything.
> 
>>> Does anyone know of any doc about that?  
>>
>> From what I retrieved about the introduction of CRTC color props[1], it
>> seems the main concern at that point was getting a linear space for
>> CTM[2] and CRTC degamma property seems to have followed intel
>> requirements, but didn't find anything about the blending space.
> 
> Right. I've always thought CRTC props apply after blending.
> 
>> AFAIU, we have just interpreted that all CRTC color properties for DRM
>> interface are after blending[3]. Can this be seen in another way?
> 
> Joshua did, and he has a logical point.
> 
> I guess if we really want to know, someone would need review all
> drivers exposing these props, and even check if they changed in the
> past.
> 
> FWIW, the usefulness of (RE)GAMMA (not DEGAMMA) LUT is limited by the
> fact that attempting to represent 1/2.2 power function as a uniformly
> distributed LUT is infeasible due to the approximation errors near zero.
> 

IMO, CRTC should be post-blending. Blending is at the plane/crtc boundary
by design, therefore CRTC properties apply post-blending.

Though I can understand why DEGAMMA can be interpreted to be applied
pre-blending. Though, I think that's wrong for the DRM/KMS model and
should be fixed in amdgpu.

Harry

> 
> Thanks,
> pq
> 
>> [1] https://patchwork.freedesktop.org/series/2720/
>> [2] https://codereview.chromium.org/1182063002
>> [3] https://dri.freedesktop.org/docs/drm/_images/dcn3_cm_drm_current.svg
>>
>>>
>>> If drivers do not agree on the behaviour of a KMS property, then that
>>> property is useless for generic userspace.
>>>
>>>
>>> Thanks,
>>> pq
>>>
>>>   
>>>> On Tuesday, 22 August 2023, Pekka Paalanen <pekka.paalanen@collabora.com>
>>>> wrote:  
>>>>> On Thu, 10 Aug 2023 15:02:59 -0100
>>>>> Melissa Wen <mwen@igalia.com> wrote:
>>>>>    
>>>>>> The next patch adds pre-blending degamma to AMD color mgmt pipeline, but
>>>>>> pre-blending degamma caps (DPP) is currently in use to provide DRM CRTC
>>>>>> atomic degamma or implict degamma on legacy gamma. Detach degamma usage
>>>>>> regarging CRTC color properties to manage plane and CRTC color
>>>>>> correction combinations.
>>>>>>
>>>>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>>> ---
>>>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++------
>>>>>>  1 file changed, 41 insertions(+), 18 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    
>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  
>>>>>> index 68e9f2c62f2e..74eb02655d96 100644
>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>>>> @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct    
>>>> dm_crtc_state *crtc)  
>>>>>>       return 0;
>>>>>>  }
>>>>>>
>>>>>> -/**
>>>>>> - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC    
>>>> plane.  
>>>>>> - * @crtc: amdgpu_dm crtc state
>>>>>> - * @dc_plane_state: target DC surface
>>>>>> - *
>>>>>> - * Update the underlying dc_stream_state's input transfer function    
>>>> (ITF) in  
>>>>>> - * preparation for hardware commit. The transfer function used depends    
>>>> on  
>>>>>> - * the preparation done on the stream for color management.
>>>>>> - *
>>>>>> - * Returns:
>>>>>> - * 0 on success. -ENOMEM if mem allocation fails.
>>>>>> - */
>>>>>> -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>>>> -                                   struct dc_plane_state    
>>>> *dc_plane_state)  
>>>>>> +static int
>>>>>> +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>>>>>> +                          struct dc_plane_state *dc_plane_state)
>>>>>>  {
>>>>>>       const struct drm_color_lut *degamma_lut;
>>>>>>       enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
>>>>>> @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct    
>>>> dm_crtc_state *crtc,  
>>>>>>                                                &degamma_size);
>>>>>>               ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
>>>>>>
>>>>>> -             dc_plane_state->in_transfer_func->type =
>>>>>> -                     TF_TYPE_DISTRIBUTED_POINTS;
>>>>>> +             dc_plane_state->in_transfer_func->type =    
>>>> TF_TYPE_DISTRIBUTED_POINTS;  
>>>>>>
>>>>>>               /*
>>>>>>                * This case isn't fully correct, but also fairly
>>>>>> @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct    
>>>> dm_crtc_state *crtc,  
>>>>>>                                  degamma_lut, degamma_size);
>>>>>>               if (r)
>>>>>>                       return r;
>>>>>> -     } else if (crtc->cm_is_degamma_srgb) {
>>>>>> +     } else {
>>>>>>               /*
>>>>>>                * For legacy gamma support we need the regamma input
>>>>>>                * in linear space. Assume that the input is sRGB.
>>>>>> @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct    
>>>> dm_crtc_state *crtc,  
>>>>>>
>>>>>>               if (tf != TRANSFER_FUNCTION_SRGB &&
>>>>>>                   !mod_color_calculate_degamma_params(NULL,
>>>>>> -                         dc_plane_state->in_transfer_func, NULL, false))
>>>>>> +    
>>>>  dc_plane_state->in_transfer_func,  
>>>>>> +                                                     NULL, false))
>>>>>>                       return -ENOMEM;
>>>>>> +     }
>>>>>> +
>>>>>> +     return 0;
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC    
>>>> plane.  
>>>>>> + * @crtc: amdgpu_dm crtc state
>>>>>> + * @dc_plane_state: target DC surface
>>>>>> + *
>>>>>> + * Update the underlying dc_stream_state's input transfer function    
>>>> (ITF) in  
>>>>>> + * preparation for hardware commit. The transfer function used depends    
>>>> on  
>>>>>> + * the preparation done on the stream for color management.
>>>>>> + *
>>>>>> + * Returns:
>>>>>> + * 0 on success. -ENOMEM if mem allocation fails.
>>>>>> + */
>>>>>> +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>>>> +                                   struct dc_plane_state    
>>>> *dc_plane_state)  
>>>>>> +{
>>>>>> +     bool has_crtc_cm_degamma;
>>>>>> +     int ret;
>>>>>> +
>>>>>> +     has_crtc_cm_degamma = (crtc->cm_has_degamma ||    
>>>> crtc->cm_is_degamma_srgb);  
>>>>>> +     if (has_crtc_cm_degamma){
>>>>>> +             /* AMD HW doesn't have post-blending degamma caps. When DRM
>>>>>> +              * CRTC atomic degamma is set, we maps it to DPP degamma    
>>>> block  
>>>>>> +              * (pre-blending) or, on legacy gamma, we use DPP degamma    
>>>> to  
>>>>>> +              * linearize (implicit degamma) from sRGB/BT709 according    
>>>> to  
>>>>>> +              * the input space.    
>>>>>
>>>>> Uhh, you can't just move degamma before blending if KMS userspace
>>>>> wants it after blending. That would be incorrect behaviour. If you
>>>>> can't implement it correctly, reject it.
>>>>>
>>>>> I hope that magical unexpected linearization is not done with atomic,
>>>>> either.
>>>>>
>>>>> Or maybe this is all a lost cause, and only the new color-op pipeline
>>>>> UAPI will actually work across drivers.
>>>>>
>>>>>
>>>>> Thanks,
>>>>> pq
>>>>>    
>>>>>> +              */
>>>>>> +             ret = map_crtc_degamma_to_dc_plane(crtc, dc_plane_state);
>>>>>> +             if (ret)
>>>>>> +                     return ret;
>>>>>>       } else {
>>>>>>               /* ...Otherwise we can just bypass the DGM block. */
>>>>>>               dc_plane_state->in_transfer_func->type = TF_TYPE_BYPASS;    
>>>>>
>>>>>    
>>>   
> 

