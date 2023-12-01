Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50659800E79
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 16:21:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372F910E8BB;
	Fri,  1 Dec 2023 15:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D500810E8C4;
 Fri,  1 Dec 2023 15:20:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eNse+a25sq9SoZbzws0mP3F5ZMoBjBfMK3HAed1aYN5EgT4bM4YROmOvn2kjmiPTDEuxNAxrlbGaIIIBhqNm9G3xTNsa9HkA3Eosv+kbB9LnkaIrfKhPcXo3Z0t+IokIY9DqRUdhpDe5GmkZi0cVdfF3JKxYgLJkB0HAVUhZU/7cxHEi40WivTylCXCz8optbxj8WmGJxHFnfQ6YMIeKJsPKCJ/efpL6789iQgrzPNEOrQSe8qqO3XB4qH0H94p5dV/AYlFM1q+zTQ/XqQGcVeJQEXcUJOIr8Lc0iJIsdKl8cG+1bGARvjnkBIb74Pp+gO+wuNKgsxHBNGGcqvr4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlnZZwchHsIV9TYeS30fZQ+DHSnhlpiMmBcQfyaX1KM=;
 b=AeVy0+lahoDhNlvjcXbOd5DSpYNBzfObi1GJ3+Xc6HNHQ2cHauaZKApSHO8Ey6Jm9oBUjoh8joCp/6uitaVtvbnTQ5XIKqlx3Zk/2GkJtOFiQ3twOsu6C9amQJG5Zhl4UBdTPeuR1bTqh1BeufYq+3cmTIx9Olf4uv5jNWGuHwxN8yK6td+hM+tqHV5Yz37Zy5KahIhUdtRwha1rnXbf2eerY7DiQ1rNVC6GTpejRQupeFpg/Oq9wNZV9ZXHKIuQ00ylhfuPCEV76Tl4BZ3VRRfHUMPq70JHWEzlTCmdeOd26TL5KOdfhBt5CYSKtubIujzkjk3yWoxV0U4zuUY1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlnZZwchHsIV9TYeS30fZQ+DHSnhlpiMmBcQfyaX1KM=;
 b=YunptKiIWOAjZoF11UaCGg94lhXqyll9FGcxxJcsmkuvdw6cRQy/Kkh7D2dX8ltspTMc2hA22Gjvx8UJwduTwkpA+C4CfLBJNEnMf3OJsutvLi0iTANekkogaCGG5+Cxq/Ed7y3f8oZiQJJ44Ji/HkBWZfpWgUylSr2uk6XGN3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB9005.namprd12.prod.outlook.com (2603:10b6:a03:53d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 15:20:46 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::3a35:139f:8361:ab66%6]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 15:20:45 +0000
Message-ID: <96f1293f-ca82-4cdb-8838-38a31af37feb@amd.com>
Date: Fri, 1 Dec 2023 10:20:40 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/32] drm/amd/display: add AMD driver-specific
 properties for color mgmt
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20231116195812.906115-1-mwen@igalia.com>
 <bc60a7fd-8de7-4856-b5ed-e1172b9b79f7@amd.com>
 <CAKMK7uH1BPhEm8vM=rFfAho06T-f+osjKX4ofOkjMazrhSouKw@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAKMK7uH1BPhEm8vM=rFfAho06T-f+osjKX4ofOkjMazrhSouKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0117.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d7::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB9005:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5fb786-99d3-413a-f7ae-08dbf2811727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XNCGlXYLw/RWD82K76pULledBJUjg2IyWw/RlLI599+AiEVHwxS78AmtLRDcNYKtPAIosgMd1C//ms91hTRj9hcOtODK4azYLBe7yl2nIJr87n98xpA0cHlfIEATypklosvhCPyMk9r6RgJWFF3SyRwOhAgoG8GmXDDhPTKnHOADz2U1DPNjnfsuWnfdddZxA8+69raRs9Km43UzF5EN1NJZbIm9TdBeK14u+JgC7hlxrsJhCrEvqp94q1L04GSfLJU3TsvQ4vserKV89iNLKyUwMAJrubmsGtLiMMJfFAWL3t8z+HSTcjDbwjz1BddGFGOMydLheL1Hx8duS5Yjm/oa8z+5KYCyur5YVzyQLabmTxrZmemGzac4yi5+3nZj/nj3OL0nWESHoJ7b7vtW57yFFl3UVnH5AI8RXqrmo/KXu3ok4mt+oTERmX2SfO5V3axgbi1TN4uaFbXYkENcvlw1Znh9do31awnXHxzHGZJp5F7//lcF8QuyVhL4gncIv/YCpkF4TdrsiMjjXuM5SrVFDiuyRyZzQu75nvzYHykLl3sGEhrRD0TurU4yzwf+biqyZPp6Hv72qukVrzsjjd5yAt9D1aAraFJ27Z9wFYclsKgqW1wJrovfvRJkYKe4MUakaANaP+U03csRboFzDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(4001150100001)(7416002)(5660300002)(2906002)(8676002)(4326008)(8936002)(66476007)(6916009)(54906003)(316002)(66556008)(66946007)(26005)(41300700001)(6506007)(6666004)(6486002)(478600001)(6512007)(44832011)(53546011)(31686004)(2616005)(83380400001)(38100700002)(31696002)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmsvREpPUFVTa2ZoZWVobTJMaUozSDRQUllvRjd5OE1VUkFkanlIeEhnczNx?=
 =?utf-8?B?cDErUkhPTThWRkJURHJGRmZzNjBXajdNOU5HZE1aUlczS1ZRZlk3S3pRakhr?=
 =?utf-8?B?cXFIazdDbTMyWTJQaWFtdW4rTlJjUk85Ymo0L3gyOXlzaFJ0UHc0UExodExF?=
 =?utf-8?B?VW1LL0ZKZnp1UHMrMDV2THF3MjdpYXNqNkdPR29Fd0JwdjZnaldveDE5T05G?=
 =?utf-8?B?cGRXTWFmQ1ZpSEp4UUEzcm14SUcvMElRTmx0ZnJ4RUFRQWYxcmVpTWp0V3Vh?=
 =?utf-8?B?dW1nYXROUHFsWFUvMGQxRk1LQU0xVG9FZ3ltZFR5NUFnTlZtenVaR05IRFhj?=
 =?utf-8?B?TVFPKzkxaGlYcitZMHhYTnN6WHc1Qk5RaWJqTlJ0eFo4SVlPR3pXVW5BVjB2?=
 =?utf-8?B?YmFSRjArSVBUOWlVR0xxYWVZS0pKbEdZYldIcGhpMDh4dy9OdXNpQWFsVFEv?=
 =?utf-8?B?MFg5NkNZcDhMU3AyQVVRd1FzZVJKZFNXbHVVSmpiL2NQRTl4ZEFsMUhLRVds?=
 =?utf-8?B?U1h0T0JrQW1ReGZ1K1BPNDNqR1lQZEp4b3d6VVU1V1Rqa0FpUTB3eXJqV2V6?=
 =?utf-8?B?TlRJcE4vZlBRMHFhMUg4Y2dTa29rM2szaTk5QWIxeVdyT0FHRTJIR0xUUEkz?=
 =?utf-8?B?alROb2txcys0TG1DZElQR0U1VnQxaERGc1orbkJQODVEazhLaitCQUVxOTJQ?=
 =?utf-8?B?NlBQODI4d0xYZkF1YThheEJaK2dkKzYxL3BwTUx0Zy9yd3pZYkNORE1SaVpH?=
 =?utf-8?B?Qmd5UXNuMUs2YVN0aTZldFRDcGJZaGtoTzQrR0QzVUI1S2N4RmdGUzFTTzdk?=
 =?utf-8?B?bmRqYnNvR2ZCbEdjUzY5b2w4b1VQaVZLVDRJeXhKeWd4cjVWcWJMZCtic09l?=
 =?utf-8?B?M0dIbitVNjJSYW5XeFdCTXlsaEhrMjlvTDJPVDNGclZza3hpNUxpNm9nS1pz?=
 =?utf-8?B?Wk5tWW1jazQ4ZDRkT1JZczhQOUw4UGxybTNBRHNaQjBQb3VVeitWUm5xTExa?=
 =?utf-8?B?b0dTTHA0Z3l0WVZUb3YyU29vUk85QS9TRldTMjJQYzUzajcrdCs5Z0V5MU12?=
 =?utf-8?B?d1c3amVLZXNhWUFaY0FCNjlEbHkzSmI2QlBrRVhBd2JWaHdtbWltTHhGVGxQ?=
 =?utf-8?B?RHZMVzhYTVJyMW5na3RTZXhCMHR1VFQ0elhMWmFpK0ZnWXlMenpkNy9PdE52?=
 =?utf-8?B?MEdjbG1sVWxPNGNjK2IyQmU1THFHQmM5eEN5SGhVQkJxMXhpVTNvVzlzNytk?=
 =?utf-8?B?RUZRRmJpa3o0ejNRT0FtL1pHWUNBQ3BsU1RyNFo0ZHhqdk9mWTVmMlBtbGJE?=
 =?utf-8?B?QzYwTGRINGU5bTE5dFdlelFLbGVJajIrWU5rbms5MHh3VEYxNWZqN2o5V1Ix?=
 =?utf-8?B?Y1IvRjZnQ3g3NGkxYVRBbEIzRmloNm5hanpZVVVwUG9MMTQxdEdEak9YN2tQ?=
 =?utf-8?B?b254a1IveWlyVkl1OGo4Tm9XTmZhWGlMTlR4K3NsQWdTMjRHOTNCWmZ0M3lp?=
 =?utf-8?B?NVFtcXFsbHRlT3NxaDRCcHhEYUpnN2VKNGU0VlBjQStibHFCNm1mcUhTNWM5?=
 =?utf-8?B?R0RReUl5YUNWZlNHci9ibXowKzdCSnRWRGdCN0pwa0VPMk9iVUVJcTZTSk5D?=
 =?utf-8?B?MUxuZzNMcWhFREhsR2NKaFVheGZEa1hWR3YvRk1ySGNiOE84b0h6MWtlbEJP?=
 =?utf-8?B?QjNQREFhUnlmcWFyemZqVmdJWmpmb3g1VUt0K0Jsb3lQR2NUeXR3bXh2Ni9i?=
 =?utf-8?B?eEh2WGp4Yi9OcDQ1OTI5aEhuNzgzcU9rU3RrSzhTb3BkQWcraVFXaGRBN3dt?=
 =?utf-8?B?OTgyZWlvTWlHak0yNCtBdEpCdUhDK2hUL05EU1I0SDRiYWpEZG4rRnJhNFNF?=
 =?utf-8?B?Y0JYa3czbWlzTnRpa2VoQVhHWGV2amgwMjFXa0IxZEJQQjZRZUkzQ3U4ejBH?=
 =?utf-8?B?M2JKd0VDbmxPaUVZb2wveUMyblcvRlZHaXA2UjNreCtqRHBqSDB3eWJlTHhw?=
 =?utf-8?B?UU1rMnE3V2RuVU1RQ0g1YnIzMk9lTnkrY01OK1MzUlhFQlBYUjZiYzFhSm9H?=
 =?utf-8?B?VUhIcHVwVVZKWTl4c0tPMVdIK2dNYnpLUHhFL0c4RzVmVVhSbldVK1B0NE44?=
 =?utf-8?Q?503xgNuMVTlY+TMO0/DHRkRd6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5fb786-99d3-413a-f7ae-08dbf2811727
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 15:20:45.8007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lST7+A7HxdPPmDfGGn51rkrIiF/mVsCYhN73cTrA1mvedc4UWQfVHWsZxDoS5oSMCrpWSn5om0NOHxArocPSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9005
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
Cc: liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, kernel-dev@igalia.com, sunpeng.li@amd.com,
 mripard@kernel.org, Melissa Wen <mwen@igalia.com>, sungjoon.kim@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, tzimmermann@suse.de,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-30 06:34, Daniel Vetter wrote:
> On Tue, 28 Nov 2023 at 23:11, Harry Wentland <harry.wentland@amd.com> wrote:
>>
>> On 2023-11-16 14:57, Melissa Wen wrote:
>>> Hello,
>>>
>>> This series extends the current KMS color management API with AMD
>>> driver-specific properties to enhance the color management support on
>>> AMD Steam Deck. The key additions to the color pipeline include:
>>>
>>
>> snip
>>
>>> Melissa Wen (18):
>>>   drm/drm_mode_object: increase max objects to accommodate new color
>>>     props
>>>   drm/drm_property: make replace_property_blob_from_id a DRM helper
>>>   drm/drm_plane: track color mgmt changes per plane
>>
>> If all patches are merged through amd-staging-drm-next I worry that
>> conflicts creep in if any code around replace_property_blob_from_id
>> changes in DRM.
>>
>> My plan is to merge DRM patches through drm-misc-next, as well
>> as include them in the amd-staging-drm-next merge. They should then
>> fall out at the next amd-staging-drm-next pull and (hopefully)
>> ensure that there is no conflict.
>>
>> If no objections I'll go ahead with that later this week.
> 
> Double-merging tends to be the worst because git doesn't realize the
> commits match, which actually makes the conflicts worse when they
> happen (because the 3-way merge diff gets absolute confused by all the
> changed context and misplaces everything to the max). So please don't,
> _only_ every cherry-pick when a patch in -next is also needed in
> -fixes, and we didn't put it into the right tree. But even that is a
> bit tricky and should only be done by maintainers (using dim
> cherry-pick if it's drm-misc) because the conflicts tend to be bad and
> need to be sorted out with backmerges sooner than later.
> 
> For this case merge everything through one tree with the right acks,
> pull to drm-next asap and then backmerge into the other tree. Here
> probably amdgpu-next with drm-misc maintainer acks for the 3 core
> patches. Or if amdgpu-next pull won't come for a while, put them into
> drm-misc-next and just wait a week until it's in drm-next, then
> forward amdgpu-next.
> 

Maxime, Maarten, Thomas, could I get an ACK from you for the three
DRM core patches and an ACK for pulling them through the AMD tree?

Thanks,
Harry

> Cheers, Sima
> 
>> Harry
>>
>>>   drm/amd/display: add driver-specific property for plane degamma LUT
>>>   drm/amd/display: explicitly define EOTF and inverse EOTF
>>>   drm/amd/display: document AMDGPU pre-defined transfer functions
>>>   drm/amd/display: add plane 3D LUT driver-specific properties
>>>   drm/amd/display: add plane shaper LUT and TF driver-specific
>>>     properties
>>>   drm/amd/display: add CRTC gamma TF driver-specific property
>>>   drm/amd/display: add comments to describe DM crtc color mgmt behavior
>>>   drm/amd/display: encapsulate atomic regamma operation
>>>   drm/amd/display: decouple steps for mapping CRTC degamma to DC plane
>>>   drm/amd/display: reject atomic commit if setting both plane and CRTC
>>>     degamma
>>>   drm/amd/display: add plane shaper LUT support
>>>   drm/amd/display: add plane shaper TF support
>>>   drm/amd/display: add plane 3D LUT support
>>>   drm/amd/display: add plane CTM driver-specific property
>>>   drm/amd/display: add plane CTM support
>>>
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  91 ++
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  34 +-
>>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 108 +++
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 818 ++++++++++++++++--
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  72 ++
>>>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 232 ++++-
>>>  .../gpu/drm/amd/display/include/fixed31_32.h  |  12 +
>>>  drivers/gpu/drm/arm/malidp_crtc.c             |   2 +-
>>>  drivers/gpu/drm/drm_atomic.c                  |   1 +
>>>  drivers/gpu/drm/drm_atomic_state_helper.c     |   1 +
>>>  drivers/gpu/drm/drm_atomic_uapi.c             |  43 +-
>>>  drivers/gpu/drm/drm_property.c                |  49 ++
>>>  include/drm/drm_mode_object.h                 |   2 +-
>>>  include/drm/drm_plane.h                       |   7 +
>>>  include/drm/drm_property.h                    |   6 +
>>>  include/uapi/drm/drm_mode.h                   |   8 +
>>>  16 files changed, 1377 insertions(+), 109 deletions(-)
>>>
>>
> 
> 

