Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CC48903E2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 16:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3AF1124BF;
	Thu, 28 Mar 2024 15:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zZnSysY9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C79310E576;
 Thu, 28 Mar 2024 15:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hn1ejF1W53MSg/H4ailo5c2ZHOUvHoIpg4iska78Jq7xjRRbPkc+JNMwDwdLl9I71pncPEoQtPlW786PRcVueANNansdlFBwP7KYq4QRAlk+fOE/v8YaF8+xUdKLbQHKZ3amO0jldqpH4+dmxVtNTwdlfUIDzkzGHFRTTkwPVbBhnWpG4ChcC5gBfdshKoDiEClrvLxdi7iKdHsBHa3yrz/1LAtmShdZZYhrUfDnYyID+ztwIEbAu4+IDJQR93vA+zX4IikqOhJuVv0EsZZUjxTll4HKZU5Kt1ybotkZnugXNFr8h0g/nWpIzpu221m0nkXothVxJV15mx5zF9lWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMWa0sVOJDkBkk7nj7U5h0cBo5ZB/7wLOeq3ra6+tH0=;
 b=E+AffxrLdTavwP0dLtxL5M2yuZRffyehIv2ZZ2Kp7dyFkmCey3xzg6xl+zWMDFYweMX8mejP+qTkZl7Xi4F9cHkZEbWeXgAkmi2bXhl7CmdKBosfeUK/OxxVog3qLFH5NtDEClEF8qe97Xym2xmd898L/773jN9IHILafgzOAyEEgu/JjP2Z2oHC2iMxz1/285ifYN5C8GhuzQQh6OmkOjLQH5HOOnhbWUA1IY1aR6RKSyDqj6CRbDt5FXpMaxdPD1FRIDsVWN59ct/MefXXRZVMrpQRGOW7YXKTPAma8a+etX9yWdPisaZ15iW8L5EjfNSoT9nVa9nKGBg+AHStRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMWa0sVOJDkBkk7nj7U5h0cBo5ZB/7wLOeq3ra6+tH0=;
 b=zZnSysY9iLgHBEyYaZf2x1QI5Pg4DNMY7lsxDUrAhyqQJ84qso9NZnXuB/niTsVaZA6yQCEAPwYW165a+gXAY3yIioO9X5DcJ36RmdVl6Je8xSjsyN2r7ex1O10GkI5AK3KzlUaBkQEwE7F5DqF/zktw3ctPU1GcTll0v3OUJ8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB5952.namprd12.prod.outlook.com (2603:10b6:510:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 15:52:22 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::8d12:60ee:8dfb:daef%4]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 15:52:22 +0000
Message-ID: <44b81511-ac1c-4104-812b-9cdc04e6bc83@amd.com>
Date: Thu, 28 Mar 2024 11:52:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/amd/display: Introduce overlay cursor mode
To: Robert Mader <robert.mader@posteo.de>, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: Joshua Ashton <joshua@froggi.es>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>, Chao Guo <chao.guo@nxp.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Vikas Korjani <Vikas.Korjani@amd.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Sean Paul <sean@poorly.run>,
 Simon Ser <contact@emersion.fr>, Shashank Sharma <shashank.sharma@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
References: <20240315170959.165505-1-sunpeng.li@amd.com>
 <20240315170959.165505-2-sunpeng.li@amd.com>
 <a7ea3f24-6e21-4a7d-8f53-42a12a8d8be8@posteo.de>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <a7ea3f24-6e21-4a7d-8f53-42a12a8d8be8@posteo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::35) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2c03d9-fc6b-4c1d-f8db-08dc4f3f0e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pc3kIfBcXkCORp7CgWpRRSrfKE7+wSIzkzPG0xDLA5WdnShFWMgcEUHeHKJpeOGHQ73aKXwPqQHjmvbUz1TlxjdxzAOab6skJ1Hx09MRcyTmw3RRBG41t50efrJYekwA2XfhiLK7auAhSpIRUpKVUx5aeZGMZNuMl+DXCQIJ/t1A2w5SHfMZcNvG5QOluXuRbgUoDsLuw29DpdUORPOFyFxyJKg5EhXQuMW+Crvtt6d0cS5d2XPSN8O5wTIHxhNcimIEZL/FZ1kO/n5gVk5+ST6sEOAL7DqKp77Wr5l59icnuBjA7cF7Pez9+rwGdMl2CRym1rAGSnRH0f7WG+xRegDOtub+hGp944mIcfUeRtCGaL+Z1z3le0cMQSGAqq1V1t0XpdRUHPVUNFXXn19LiNG4OpFIeJEd+puA2QTisyPluyReYYm+pW2XeXJJnoltkrujyTg+TLEOAWeEgAasBzxCmZCnj+IT8EmLZJuDVbg8U5Rv9vRVmrfh/SViGITJxLTtEfnz/koV1stHZ0Hz8NOU/blyGjMTPHBHiRCtuevT9PYbBmAqE/A5WFvCtVdv0GoR9oK7YMXDfFudclMImHFtmDZRICsO+s45zYwOsO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnR2QmlsVzZOVmVXUU00WmlJUUhwNURmaUplMCtLR2pvS2dpcytzWTVLK2VS?=
 =?utf-8?B?YU9mSUJJak1GOUFmN2Myb3F5djNsYnVxaXV3VmtmcXhGZHZQb01za1pla0ZW?=
 =?utf-8?B?T1h0am9LZHptSkpINm9WanMwMXJhSjlBT0pHcmxuWklUZTJ3dE93SHNsZ0tP?=
 =?utf-8?B?b2NzTkJDdWc0eGZyaXhIQ0tNTWpPM2Y5dC8xeDdBWHU3bkZEK0hCajU0N015?=
 =?utf-8?B?d2tMSENKdDZtMWdJVWJLTVdjUUY3YUVwcnZxWmZ5U1FNWWd2Zi9ZbDFVZWZN?=
 =?utf-8?B?U29CYi9kd3ovNHB0Qi9oZUJ6MHNSMENQM1JxWkJIdlo5V1NZOENVMTFTTS8x?=
 =?utf-8?B?Ujc4TzNha21kaGh3d0M4dnRCSEkvZ0FmK0ljdmZyVGVKRDhtYUtQb2V4L3Vs?=
 =?utf-8?B?T3ZSYTJjSERUK2VDcHd4WE45VXRySVhKRzNVRlRjWTNBMW40Y0RIb0hYTFN2?=
 =?utf-8?B?cjY5c2FSSFBuckNsVElaS2Iva0tFVlE2R1g1SFdxMzdsTzJ5VzZKWGZEQTdz?=
 =?utf-8?B?RGhaRUFKS0VnUDQ3czFwRmRRZXhqT3Fya01qZm80Yk9KOXR6MDZoOStDZ0pz?=
 =?utf-8?B?d1dVU1BIeTNBSlJPbWRjVDFJVnl6NFVkR2U3SFR3VlhVUFJXWlppMldzM0tV?=
 =?utf-8?B?Wk5LUjFaVUhhZnA1c2Q0eUNDa0UwdEhZZDU0YVgwQnp1ZnpLTkNyWjJkbThy?=
 =?utf-8?B?MG9ZNEYvMitKSWpLekdIY0Q0SE1NQ05rb0pMM0lqcDNGUzBXaXpDRERvb0JS?=
 =?utf-8?B?dEpFZTNmc1hDa2pvWjdHcUVqdG55SElsTFphQS9sZDYvd1JUNE1oQUhJb3RW?=
 =?utf-8?B?UWs4bXhNeGlqWkpwYnhuMnBRNlBjc0FMMGRRVHhCU09oQzkyU3RwNENlK3dG?=
 =?utf-8?B?bnBjMUtyV3hBMWNndDhUZGtrUkd1Z09scGU1cm95MmtyNTV6NWNEdDFWbDYw?=
 =?utf-8?B?dTY4RlRJcStDZ3pXM3BQZzBoUGNoOXEzbG5TYm1GWTcxdkFrOXVaRk5pekN5?=
 =?utf-8?B?S0xJdHRhMmZkYVlQVmxLYlYxc1cvSmtzZ3ZtU2NIT1htWVFoUlFVY3NCbHVu?=
 =?utf-8?B?emhlRlJ4ZC9CUjdNYjdWUHpkOFNTckQ4NUxITWRyZjVrc2xSUEI1aU1aK1lY?=
 =?utf-8?B?M3dtZnNHSElNVjVxY2duS05RQWFVZDJkMXZFb0FTVHJVR3QwZUxMcWQrZUxE?=
 =?utf-8?B?WktRUXcxbjc5eUtCRnJFQW1sTFE1TVpmWThibHlMbDNEbWRkSXFnV2tDRExx?=
 =?utf-8?B?QXdGWGhOWFpuMDliOUFlMHJkd0ZVTzZqdGMyT2VMM09wWlFOallHK1lZNUNz?=
 =?utf-8?B?bzVnWmNiTHM0a3RpcHZwblpsVllEVEROd1JqdVpZUWtPR0lzY0s3dXltTkln?=
 =?utf-8?B?QVhMY21vNmphdmRqWWtzbUhoa1pTMHhUWmdqOHJLcEJQUW84aHZDckN1R0pC?=
 =?utf-8?B?dUJVSThYdlcrdll2Zm54akhWMGRSdVdOTEUrc3UzN2traU9YemdBK2xLbEsr?=
 =?utf-8?B?QituQTIyUStMVzlVajA1Q0tKT3hkdWZCVjh6WjdreXVvQUYzclcySkovSVcr?=
 =?utf-8?B?VXpPTXhQS0JOZ1N1dG95NVRGVmxRTUU3cGpOVHd4MlBLQUxCaXR0MkZONkZt?=
 =?utf-8?B?cHJ6STNCMHVUVU1vQ1RBR1VkLy9ZbS9RZDI2K1lpRWx4bHBTR0xETFpmalc2?=
 =?utf-8?B?RjNKemk2UXowcG1heXhXcElRZEZ2UVdjQWlibWJvNDNjb2U5ZWhaQmV1SWVI?=
 =?utf-8?B?NlF2ZEJoVlM2MXRXQWVkZ291eU50SVVDa3Q0ZmFRTTV3VlZtbG9ucU05WWd5?=
 =?utf-8?B?RlhCaXNZd2lRTDh0S1ZEbkZUd05INUhCNk51bk83cUNuWTlPWDRZWEJveS9z?=
 =?utf-8?B?K1dxNDNYNEl5cmtYY0JIYUJ1b2t1ZXlRdDhSaTZOOFZVMmVCTDhmR3lJU1kx?=
 =?utf-8?B?REJJdzNSZHZ3UmVMdTQyMWFORStqMXN3UGhnbVY2OXBrSG1nZE1zcGN5YUZx?=
 =?utf-8?B?Z2tOcVNxSWpPWHp3SjNlcUxudkVWVTlCWndxTDVNNUFKNEE4cWs2Z0xCa0pB?=
 =?utf-8?B?VlphQ0RMbUVCYnJ1a3NCTmRWVVh0VVN6RFBOcldoaDlMbXVVVVJTY2MvTCty?=
 =?utf-8?Q?H8mQMBFBFdeDXTFuHeOOzfp+Q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2c03d9-fc6b-4c1d-f8db-08dc4f3f0e9a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 15:52:22.7951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8PQrvIUCeTJw1agND3nNUCL7cGSCxsK4wBUtfQQyLDafoXP973U/zAo2ObpbthA4A76h5xewpEST/+RbekGJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5952
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2024-03-28 11:48, Robert Mader wrote:
> Hi,
> 
> On 15.03.24 18:09, sunpeng.li@amd.com wrote:
>> From: Leo Li <sunpeng.li@amd.com>
>>
>> [Why]
>>
>> DCN is the display hardware for amdgpu. DRM planes are backed by DCN
>> hardware pipes, which carry pixel data from one end (memory), to the
>> other (output encoder).
>>
>> Each DCN pipe has the ability to blend in a cursor early on in the
>> pipeline. In other words, there are no dedicated cursor planes in DCN,
>> which makes cursor behavior somewhat unintuitive for compositors.
>>
>> For example, if the cursor is in RGB format, but the top-most DRM plane
>> is in YUV format, DCN will not be able to blend them. Because of this,
>> amdgpu_dm rejects all configurations where a cursor needs to be enabled
>> on top of a YUV formatted plane.
>>
>>  From a compositor's perspective, when computing an allocation for
>> hardware plane offloading, this cursor-on-yuv configuration result in an
>> atomic test failure. Since the failure reason is not obvious at all,
>> compositors will likely fall back to full rendering, which is not ideal.
>>
>> Instead, amdgpu_dm can try to accommodate the cursor-on-yuv
>> configuration by opportunistically reserving a separate DCN pipe just
>> for the cursor. We can refer to this as "overlay cursor mode". It is
>> contrasted with "native cursor mode", where the native DCN per-pipe
>> cursor is used.
>>
>> [How]
>>
>> On each crtc, compute whether the cursor plane should be enabled in
>> overlay mode (which currently, is iff the immediate plane below has a
>> YUV format). If it is, mark the CRTC as requesting overlay cursor mode.
> 
> iff -> if
> 
> IIRC another case where this would be needed is when the scale of the 
> plane below doesn't match the cursor scale. This is especially common 
> for videos and thus implicitly covered by the YUV check in most cases, 
> but should probably be made explicit. Michel Dänzer might be able to 
> comment here.
> 
> Another possible case that could be covered here is when some area is 
> not covered by any plane and just shows a black background. This happens 
> e.g. if a compositor puts a YUV surface on the primary plane that has a 
> different width/high ratio than the display. The compositor can add 
> black bars by just leaving the area uncovered and thus require only a 
> single hardware plane for video playback ("Unless explicitly specified 
> (..), the active area of a CRTC will be black by default." 
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#plane-abstraction). If the cursor is visible over this black bars, AMD currently refuses the commit IIUC (see also Michel Dänzers comment at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3177#note_1924544)
> 

Thanks for mentioning both of these scenarios. I agree it would be
good if we can expand the use of the overlay cursor to these cases.

Harry

> Thanks,
> 
> Robert Mader
> 
>>
>> During DC validation, attempt to enable a separate DCN pipe for the
>> cursor if it's in overlay mode. If that fails, or if no overlay mode is
>> requested, then fallback to native mode.
>>
>> Signed-off-by: Leo Li <sunpeng.li@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 309 +++++++++++++++---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   7 +
>>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |   1 +
>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  13 +-
>>   4 files changed, 288 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 21a61454c878..09ab330aed17 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -8359,8 +8359,19 @@ static void amdgpu_dm_commit_planes(struct 
>> drm_atomic_state *state,
>>        * Disable the cursor first if we're disabling all the planes.
>>        * It'll remain on the screen after the planes are re-enabled
>>        * if we don't.
>> +     *
>> +     * If the cursor is transitioning from native to overlay mode, the
>> +     * native cursor needs to be disabled first.
>>        */
>> -    if (acrtc_state->active_planes == 0)
>> +    if (acrtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE &&
>> +        dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE) {
>> +        struct dc_cursor_position cursor_position = {0};
>> +        dc_stream_set_cursor_position(acrtc_state->stream,
>> +                          &cursor_position);
>> +    }
>> +
>> +    if (acrtc_state->active_planes == 0 &&
>> +        dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE)
>>           amdgpu_dm_commit_cursors(state);
>>       /* update planes when needed */
>> @@ -8374,7 +8385,8 @@ static void amdgpu_dm_commit_planes(struct 
>> drm_atomic_state *state,
>>           struct dm_plane_state *dm_new_plane_state = 
>> to_dm_plane_state(new_plane_state);
>>           /* Cursor plane is handled after stream updates */
>> -        if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>> +        if (plane->type == DRM_PLANE_TYPE_CURSOR &&
>> +            acrtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE) {
>>               if ((fb && crtc == pcrtc) ||
>>                   (old_plane_state->fb && old_plane_state->crtc == 
>> pcrtc))
>>                   cursor_update = true;
>> @@ -8727,7 +8739,8 @@ static void amdgpu_dm_commit_planes(struct 
>> drm_atomic_state *state,
>>        * This avoids redundant programming in the case where we're going
>>        * to be disabling a single plane - those pipes are being disabled.
>>        */
>> -    if (acrtc_state->active_planes)
>> +    if (acrtc_state->active_planes &&
>> +        acrtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE)
>>           amdgpu_dm_commit_cursors(state);
>>   cleanup:
>> @@ -10039,7 +10052,8 @@ static bool should_reset_plane(struct 
>> drm_atomic_state *state,
>>   {
>>       struct drm_plane *other;
>>       struct drm_plane_state *old_other_state, *new_other_state;
>> -    struct drm_crtc_state *new_crtc_state;
>> +    struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>> +    struct dm_crtc_state *old_dm_crtc_state, *new_dm_crtc_state;
>>       struct amdgpu_device *adev = drm_to_adev(plane->dev);
>>       int i;
>> @@ -10061,10 +10075,24 @@ static bool should_reset_plane(struct 
>> drm_atomic_state *state,
>>       new_crtc_state =
>>           drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
>> +    old_crtc_state =
>> +        drm_atomic_get_old_crtc_state(state, old_plane_state->crtc);
>>       if (!new_crtc_state)
>>           return true;
>> +    /*
>> +     * A change in cursor mode means a new dc pipe needs to be 
>> acquired or
>> +     * released from the state
>> +     */
>> +    old_dm_crtc_state = to_dm_crtc_state(old_crtc_state);
>> +    new_dm_crtc_state = to_dm_crtc_state(new_crtc_state);
>> +    if (plane->type == DRM_PLANE_TYPE_CURSOR &&
>> +        old_dm_crtc_state != NULL &&
>> +        old_dm_crtc_state->cursor_mode != 
>> new_dm_crtc_state->cursor_mode) {
>> +        return true;
>> +    }
>> +
>>       /* CRTC Degamma changes currently require us to recreate planes. */
>>       if (new_crtc_state->color_mgmt_changed)
>>           return true;
>> @@ -10216,6 +10244,68 @@ static int dm_check_cursor_fb(struct 
>> amdgpu_crtc *new_acrtc,
>>       return 0;
>>   }
>> +/*
>> + * Helper function for checking the cursor in native mode
>> + */
>> +static int dm_check_native_cursor_state(struct drm_crtc *new_plane_crtc,
>> +                    struct drm_plane *plane,
>> +                    struct drm_plane_state *new_plane_state,
>> +                    bool enable)
>> +{
>> +
>> +    struct amdgpu_crtc *new_acrtc;
>> +    int ret;
>> +
>> +    if (!enable || !new_plane_crtc ||
>> +        drm_atomic_plane_disabling(plane->state, new_plane_state))
>> +        return 0;
>> +
>> +    new_acrtc = to_amdgpu_crtc(new_plane_crtc);
>> +
>> +    if (new_plane_state->src_x != 0 || new_plane_state->src_y != 0) {
>> +        DRM_DEBUG_ATOMIC("Cropping not supported for cursor plane\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    if (new_plane_state->fb) {
>> +        ret = dm_check_cursor_fb(new_acrtc, new_plane_state,
>> +                        new_plane_state->fb);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static bool dm_should_update_native_cursor(struct drm_atomic_state 
>> *state,
>> +                       struct drm_crtc *old_plane_crtc,
>> +                       struct drm_crtc *new_plane_crtc,
>> +                       bool enable)
>> +{
>> +    struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>> +    struct dm_crtc_state *dm_old_crtc_state, *dm_new_crtc_state;
>> +
>> +    if (!enable) {
>> +        if (old_plane_crtc == NULL)
>> +            return true;
>> +
>> +        old_crtc_state = drm_atomic_get_old_crtc_state(
>> +            state, old_plane_crtc);
>> +        dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
>> +
>> +        return dm_old_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE;
>> +    } else {
>> +        if (new_plane_crtc == NULL)
>> +            return true;
>> +
>> +        new_crtc_state = drm_atomic_get_new_crtc_state(
>> +            state, new_plane_crtc);
>> +        dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>> +
>> +        return dm_new_crtc_state->cursor_mode == DM_CURSOR_NATIVE_MODE;
>> +    }
>> +}
>> +
>>   static int dm_update_plane_state(struct dc *dc,
>>                    struct drm_atomic_state *state,
>>                    struct drm_plane *plane,
>> @@ -10231,8 +10321,7 @@ static int dm_update_plane_state(struct dc *dc,
>>       struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>>       struct dm_crtc_state *dm_new_crtc_state, *dm_old_crtc_state;
>>       struct dm_plane_state *dm_new_plane_state, *dm_old_plane_state;
>> -    struct amdgpu_crtc *new_acrtc;
>> -    bool needs_reset;
>> +    bool needs_reset, update_native_cursor;
>>       int ret = 0;
>> @@ -10241,24 +10330,16 @@ static int dm_update_plane_state(struct dc *dc,
>>       dm_new_plane_state = to_dm_plane_state(new_plane_state);
>>       dm_old_plane_state = to_dm_plane_state(old_plane_state);
>> -    if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>> -        if (!enable || !new_plane_crtc ||
>> -            drm_atomic_plane_disabling(plane->state, new_plane_state))
>> -            return 0;
>> -
>> -        new_acrtc = to_amdgpu_crtc(new_plane_crtc);
>> -
>> -        if (new_plane_state->src_x != 0 || new_plane_state->src_y != 
>> 0) {
>> -            DRM_DEBUG_ATOMIC("Cropping not supported for cursor 
>> plane\n");
>> -            return -EINVAL;
>> -        }
>> +    update_native_cursor = dm_should_update_native_cursor(state,
>> +                                  old_plane_crtc,
>> +                                  new_plane_crtc,
>> +                                  enable);
>> -        if (new_plane_state->fb) {
>> -            ret = dm_check_cursor_fb(new_acrtc, new_plane_state,
>> -                         new_plane_state->fb);
>> -            if (ret)
>> -                return ret;
>> -        }
>> +    if (plane->type == DRM_PLANE_TYPE_CURSOR && update_native_cursor) {
>> +        ret = dm_check_native_cursor_state(new_plane_crtc, plane,
>> +                                new_plane_state, enable);
>> +        if (ret)
>> +            return ret;
>>           return 0;
>>       }
>> @@ -10285,16 +10366,17 @@ static int dm_update_plane_state(struct dc *dc,
>>                   plane->base.id, old_plane_crtc->base.id);
>>           ret = dm_atomic_get_state(state, &dm_state);
>> -        if (ret)
>> -            return ret;
>> +        if (ret) {
>> +            goto out;
>> +        }
>>           if (!dc_state_remove_plane(
>>                   dc,
>>                   dm_old_crtc_state->stream,
>>                   dm_old_plane_state->dc_state,
>>                   dm_state->context)) {
>> -
>> -            return -EINVAL;
>> +            ret = -EINVAL;
>> +            goto out;
>>           }
>>           if (dm_old_plane_state->dc_state)
>> @@ -10323,21 +10405,16 @@ static int dm_update_plane_state(struct dc *dc,
>>               return 0;
>>           ret = amdgpu_dm_plane_helper_check_state(new_plane_state, 
>> new_crtc_state);
>> -        if (ret)
>> -            return ret;
>> +        if (ret) {
>> +            goto out;
>> +        }
>>           WARN_ON(dm_new_plane_state->dc_state);
>>           dc_new_plane_state = dc_create_plane_state(dc);
>> -        if (!dc_new_plane_state)
>> -            return -ENOMEM;
>> -
>> -        /* Block top most plane from being a video plane */
>> -        if (plane->type == DRM_PLANE_TYPE_OVERLAY) {
>> -            if 
>> (amdgpu_dm_plane_is_video_format(new_plane_state->fb->format->format) 
>> && *is_top_most_overlay)
>> -                return -EINVAL;
>> -
>> -            *is_top_most_overlay = false;
>> +        if (!dc_new_plane_state) {
>> +            ret = -ENOMEM;
>> +            goto out;
>>           }
>>           DRM_DEBUG_ATOMIC("Enabling DRM plane: %d on DRM crtc %d\n",
>> @@ -10350,13 +10427,13 @@ static int dm_update_plane_state(struct dc *dc,
>>               new_crtc_state);
>>           if (ret) {
>>               dc_plane_state_release(dc_new_plane_state);
>> -            return ret;
>> +            goto out;
>>           }
>>           ret = dm_atomic_get_state(state, &dm_state);
>>           if (ret) {
>>               dc_plane_state_release(dc_new_plane_state);
>> -            return ret;
>> +            goto out;
>>           }
>>           /*
>> @@ -10373,7 +10450,8 @@ static int dm_update_plane_state(struct dc *dc,
>>                   dm_state->context)) {
>>               dc_plane_state_release(dc_new_plane_state);
>> -            return -EINVAL;
>> +            ret = -EINVAL;
>> +            goto out;
>>           }
>>           dm_new_plane_state->dc_state = dc_new_plane_state;
>> @@ -10388,6 +10466,16 @@ static int dm_update_plane_state(struct dc *dc,
>>           *lock_and_validation_needed = true;
>>       }
>> +out:
>> +    /* If cursor overlay failed, attempt fallback to native mode */
>> +    if (ret == -EINVAL && plane->type == DRM_PLANE_TYPE_CURSOR) {
>> +        ret = dm_check_native_cursor_state(new_plane_crtc, plane,
>> +                            new_plane_state, enable);
>> +        if (ret) {
>> +            return ret;
>> +        }
>> +        dm_new_crtc_state->cursor_mode = DM_CURSOR_NATIVE_MODE;
>> +    }
>>       return ret;
>>   }
>> @@ -10544,6 +10632,126 @@ static int add_affected_mst_dsc_crtcs(struct 
>> drm_atomic_state *state, struct drm
>>       return drm_dp_mst_add_affected_dsc_crtcs(state, 
>> &aconnector->mst_root->mst_mgr);
>>   }
>> +/**
>> + * DOC: Cursor Modes - Native vs Overlay
>> + *
>> + * In native mode, the cursor uses a integrated cursor pipe within 
>> each DCN hw
>> + * plane. It does not require a dedicated hw plane to enable, but it is
>> + * subjected to the same z-order and scaling as the hw plane. It also 
>> has format
>> + * restrictions, a RGB cursor in native mode cannot be enabled within 
>> a non-RGB
>> + * hw plane.
>> + *
>> + * In overlay mode, the cursor uses a separate DCN hw plane, and thus 
>> has its
>> + * own scaling and z-pos. It also has no blending restrictions. It 
>> lends to a
>> + * cursor behavior more akin to a DRM client's expectations. However, 
>> it does
>> + * occupy an extra DCN plane, and therefore will only be used if a 
>> DCN plane is
>> + * available.
>> +*/
>> +
>> +/**
>> + * Set whether the cursor should be enabled in native mode, or 
>> overlay mode, on
>> + * the dm_crtc_state.
>> + *
>> + * The cursor should be enabled in overlay mode if the immediate 
>> underlying
>> + * plane contains a video format.
>> + *
>> + * Since zpos info is required, drm_atomic_normalize_zpos must be 
>> called before
>> + * calling this function.
>> +*/
>> +static int dm_crtc_set_cursor_mode(struct drm_atomic_state *state,
>> +                    struct dm_crtc_state *dm_crtc_state)
>> +{
>> +    struct drm_plane_state *plane_state, *old_plane_state, 
>> *target_plane_state;
>> +    struct drm_crtc_state *crtc_state = &dm_crtc_state->base;
>> +    struct drm_plane *plane;
>> +    bool consider_mode_change = false;
>> +    bool cursor_changed = false;
>> +    unsigned int target_zpos;
>> +    unsigned int cursor_zpos;
>> +    int i;
>> +
>> +    /*
>> +     * Cursor mode can change if a plane's format changes, is
>> +     * enabled/disabled, or z-order changes.
>> +     */
>> +    for_each_oldnew_plane_in_state(state, plane, old_plane_state, 
>> plane_state, i) {
>> +
>> +        /* Only care about planes on this CRTC */
>> +        if ((drm_plane_mask(plane) & crtc_state->plane_mask) == 0)
>> +            continue;
>> +
>> +        if (plane->type == DRM_PLANE_TYPE_CURSOR)
>> +            cursor_changed = true;
>> +
>> +        if (drm_atomic_plane_enabling(old_plane_state, plane_state) ||
>> +            drm_atomic_plane_disabling(old_plane_state, plane_state) ||
>> +            old_plane_state->fb->format != plane_state->fb->format) {
>> +            consider_mode_change = true;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (!consider_mode_change && !crtc_state->zpos_changed) {
>> +        return 0;
>> +    }
>> +
>> +    /*
>> +     * If no cursor change on this CRTC, and not enabled on this 
>> CRTC, then
>> +     * no need to set cursor mode. This avoids needlessly locking the 
>> cursor
>> +     * state.
>> +     */
>> +    if (!cursor_changed &&
>> +        !(drm_plane_mask(crtc_state->crtc->cursor) & 
>> crtc_state->plane_mask)) {
>> +        return 0;
>> +    }
>> +
>> +    plane_state = drm_atomic_get_plane_state(state,
>> +                         crtc_state->crtc->cursor);
>> +    if (IS_ERR(plane_state))
>> +        return PTR_ERR(plane_state);
>> +
>> +    /* Cursor is disabled */
>> +    if (!plane_state->fb)
>> +        return 0;
>> +
>> +    cursor_zpos = plane_state->normalized_zpos;
>> +
>> +    /* Get enabled plane immediately below cursor. */
>> +    target_plane_state = NULL;
>> +    target_zpos = 0;
>> +    drm_for_each_plane_mask(plane, state->dev, crtc_state->plane_mask) {
>> +        if (plane->type == DRM_PLANE_TYPE_CURSOR)
>> +            continue;
>> +
>> +        plane_state = drm_atomic_get_plane_state(state, plane);
>> +        if (IS_ERR(plane_state))
>> +            return PTR_ERR(plane_state);
>> +
>> +        if (!plane_state->fb ||
>> +            plane_state->normalized_zpos >= cursor_zpos)
>> +            continue;
>> +
>> +        if (plane_state->normalized_zpos >= target_zpos) {
>> +            target_zpos = plane_state->normalized_zpos;
>> +            target_plane_state = plane_state;
>> +        }
>> +    }
>> +
>> +    /* Nothing below cursor - use overlay mode */
>> +    if (target_plane_state == NULL) {
>> +        dm_crtc_state->cursor_mode = DM_CURSOR_OVERLAY_MODE;
>> +        return 0;
>> +    }
>> +
>> +    if 
>> (amdgpu_dm_plane_is_video_format(target_plane_state->fb->format->format)) {
>> +        dm_crtc_state->cursor_mode = DM_CURSOR_OVERLAY_MODE;
>> +    } else {
>> +        dm_crtc_state->cursor_mode = DM_CURSOR_NATIVE_MODE;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * amdgpu_dm_atomic_check() - Atomic check implementation for AMDgpu 
>> DM.
>>    *
>> @@ -10713,6 +10921,20 @@ static int amdgpu_dm_atomic_check(struct 
>> drm_device *dev,
>>           goto fail;
>>       }
>> +    /*
>> +     * Determine whether cursors on each CRTC should be enabled in 
>> native or
>> +     * overlay mode.
>> +     */
>> +    for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>> +        dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>> +
>> +        ret = dm_crtc_set_cursor_mode(state, dm_new_crtc_state);
>> +        if (ret) {
>> +            drm_dbg(dev, "Failed to determine cursor mode\n");
>> +            goto fail;
>> +        }
>> +    }
>> +
>>       /* Remove exiting planes if they are modified */
>>       for_each_oldnew_plane_in_state_reverse(state, plane, 
>> old_plane_state, new_plane_state, i) {
>>           if (old_plane_state->fb && new_plane_state->fb &&
>> @@ -10793,6 +11015,11 @@ static int amdgpu_dm_atomic_check(struct 
>> drm_device *dev,
>>       /* Check cursor planes scaling */
>>       for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>> +        /* Overlay cusor does not need scaling check */
>> +        dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>> +        if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
>> +            continue;
>> +
>>           ret = dm_check_crtc_cursor(state, crtc, new_crtc_state);
>>           if (ret) {
>>               DRM_DEBUG_DRIVER("dm_check_crtc_cursor() failed\n");
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> index 09519b7abf67..b8d39fdd1e09 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
>> @@ -822,6 +822,11 @@ struct dm_plane_state {
>>       enum amdgpu_transfer_function blend_tf;
>>   };
>> +enum amdgpu_dm_cursor_mode {
>> +    DM_CURSOR_NATIVE_MODE = 0,
>> +    DM_CURSOR_OVERLAY_MODE,
>> +};
>> +
>>   struct dm_crtc_state {
>>       struct drm_crtc_state base;
>>       struct dc_stream_state *stream;
>> @@ -852,6 +857,8 @@ struct dm_crtc_state {
>>        * encoding.
>>        */
>>       enum amdgpu_transfer_function regamma_tf;
>> +
>> +    enum amdgpu_dm_cursor_mode cursor_mode;
>>   };
>>   #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>> index e23a0a276e33..67aea1d2feb9 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>> @@ -304,6 +304,7 @@ static struct drm_crtc_state 
>> *amdgpu_dm_crtc_duplicate_state(struct drm_crtc *cr
>>       state->regamma_tf = cur->regamma_tf;
>>       state->crc_skip_count = cur->crc_skip_count;
>>       state->mpo_requested = cur->mpo_requested;
>> +    state->cursor_mode = cur->cursor_mode;
>>       /* TODO Duplicate dc_stream after objects are stream object is 
>> flattened */
>>       return &state->base;
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> index 8a4c40b4c27e..ed1fc01f1649 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>> @@ -104,7 +104,7 @@ void 
>> amdgpu_dm_plane_fill_blending_from_plane_state(const struct 
>> drm_plane_state
>>       *global_alpha = false;
>>       *global_alpha_value = 0xff;
>> -    if (plane_state->plane->type != DRM_PLANE_TYPE_OVERLAY)
>> +    if (plane_state->plane->type == DRM_PLANE_TYPE_PRIMARY)
>>           return;
>>       if (plane_state->pixel_blend_mode == DRM_MODE_BLEND_PREMULTI ||
>> @@ -1175,10 +1175,21 @@ static int amdgpu_dm_plane_atomic_check(struct 
>> drm_plane *plane,
>>   static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
>>                             struct drm_atomic_state *state)
>>   {
>> +    struct drm_crtc_state *new_crtc_state;
>> +    struct drm_plane_state *new_plane_state;
>> +    struct dm_crtc_state *dm_new_crtc_state;
>> +
>>       /* Only support async updates on cursor planes. */
>>       if (plane->type != DRM_PLANE_TYPE_CURSOR)
>>           return -EINVAL;
>> +    new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>> +    new_crtc_state = drm_atomic_get_new_crtc_state(state, 
>> new_plane_state->crtc);
>> +    dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>> +    /* Reject overlay cursors for now*/
>> +    if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
>> +        return -EINVAL;
>> +
>>       return 0;
>>   }
