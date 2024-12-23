Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441649FB414
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2024 19:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F6810E13B;
	Mon, 23 Dec 2024 18:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QYbBocMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63ECF10E0BF;
 Mon, 23 Dec 2024 18:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C7faHnKzpcrdmltoKj01TZJKcgzwe+Z/ODhLEoV7gEc=; b=QYbBocMR8LfG1mGEymIBKL4hFG
 DPCK+wjVp+C7lCDOI2Bt1EqE5VHkBprB0o1mHSi/zYRhNrED0W/0Jydpb/OlyE750DaUi9bNxIonn
 YPd92EUB+oYLWwbzvDYm1YGsw24bCqeu//pKxC0bC5WUdJxNVpkaM6ewP5M2UbSj8zkOxrXR/Tx0U
 57vNztOuF6KlaDLPTq4bLRw5RFppKaR11Gqm3fDTTQGn7RmAUuWsAbMzooCTUcr/CHXEh0iSJrHTr
 CXtSJHzYn68dSXa2e6WpwICOB8x3uHNsNccr5bSsTWlMZACbA0noi0iYlChKf4E9ZQgWM3MXHtWKQ
 We0U1vgA==;
Received: from [179.214.71.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tPnLa-006vfE-Aq; Mon, 23 Dec 2024 19:40:06 +0100
Message-ID: <8d9003b2-b141-4cef-991d-aaac65aa1aac@igalia.com>
Date: Mon, 23 Dec 2024 15:39:57 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/amd/display: fixes for kernel crashes since
 cursor overlay mode
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 harry.wentland@amd.com, pekka.paalanen@collabora.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, zaeem.mohamed@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Timur Kristof <timur.kristof@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fabio Scaccabarozzi <fsvm88@gmail.com>,
 Matthew Schwartz <mattschwartz@gwmail.gwu.edu>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20241217205029.39850-1-mwen@igalia.com>
 <bfbe55e8-77c1-42c8-a00b-6e72ede3ab22@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <bfbe55e8-77c1-42c8-a00b-6e72ede3ab22@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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




On 19/12/2024 18:23, Rodrigo Siqueira Jordao wrote:
>
>
> On 12/17/24 1:45 PM, Melissa Wen wrote:
>> Hi,
>>
>> Some issues have been found by Cosmic users of AMD display since the
>> introduction of cursor overlay mode: page fault and divide errors
>> causing interface freezes. Both are 100% reproducible and affects
>> multiple HW versions.
>>
>> Patch 1 addresses the page fault error by resolving the definition
>> mismatch around the number of surfaces supported by the hw, where two
>> different values (MAX_SURFACES and MAX_SURFACE_NUM) would be taken
>> through the DC surface updates flow. The regular flow take MAX_SURFACES
>> == 3 into account and commit_minimal_transition_state uses
>> MAX_SURFACE_NUM == 6. I noticed that Leo Li has proposed this change in
>> a previous discussion [1], so I added a Suggested-by tag.
>>
>> Patch 2 expands the maximum number of surfaces to four, since it's
>> supported by the hw. Also, this amount accomodates current needs,
>> avoiding `dc_state_add_plane` complaints of not enough resource. Note
>> that it somehow reverts the change proposed by [2].
>>
>> Related AMD issues:
>> - https://gitlab.freedesktop.org/drm/amd/-/issues/3693
>> - https://gitlab.freedesktop.org/drm/amd/-/issues/3594
>>
>> Patch 3 fixes a kernel oops due to division by zero error by checking if
>> the destination scale size is zero, avoiding calculation and just
>> setting the out-scale size to zero, similar to what is  done by
>> drm_calc_scale(). Even though the missing check in dm_get_plane_scale()
>> wasn't introduced by cursor overlay mode, AFAIU the cursor mode
>> assessment happens before plane state checks, so
>> amdgpu_dm_plane_helper_check_state() can't prevent
>> dm_crtc_get_cursor_mode() taking an invisible plane into account.
>>
>> Related AMD issue:
>> - https://gitlab.freedesktop.org/drm/amd/-/issues/3729
>>
>> Other previous discussions can be found at:
>> - 
>> https://lore.kernel.org/amd-gfx/20241114143741.627128-1-zaeem.mohamed@amd.com/
>> - 
>> https://lore.kernel.org/amd-gfx/20240925154324.348774-1-mwen@igalia.com/
>>
>> Thanks in advance for any feedback.
>>
>> Melissa
>>
>> [1] 
>> https://lore.kernel.org/amd-gfx/20241025193727.765195-2-zaeem.mohamed@amd.com/
>> [2] https://gitlab.freedesktop.org/agd5f/linux/-/commit/3cfd03b79425c
>>
>> Melissa Wen (3):
>>    drm/amd/display: fix page fault due to max surface definition 
>> mismatch
>>    drm/amd/display: increase MAX_SURFACES to the value supported by hw
>>    drm/amd/display: fix divide error in DM plane scale calcs
>>
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 4 ++--
>>   drivers/gpu/drm/amd/display/dc/core/dc.c                | 2 +-
>>   drivers/gpu/drm/amd/display/dc/core/dc_state.c          | 8 ++++----
>>   drivers/gpu/drm/amd/display/dc/dc.h                     | 4 ++--
>>   drivers/gpu/drm/amd/display/dc/dc_stream.h              | 2 +-
>>   drivers/gpu/drm/amd/display/dc/dc_types.h               | 1 -
>>   drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c | 2 +-
>>   7 files changed, 11 insertions(+), 12 deletions(-)
>>
>
> Hi Melissa,
>
> Thanks a lot for your series. I tested it on a couple of hardware 
> devices, and I think everything is alright.
>
> Series is
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>
> and your series was merged into the amd-staging-drm-next.

Hi Siqueira,

Nice! Thanks!

Melissa
>
> Thanks
> Siqueira
>
>

