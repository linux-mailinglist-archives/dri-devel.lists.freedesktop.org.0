Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C09B413AF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 06:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6AD10E0D5;
	Wed,  3 Sep 2025 04:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tVpUk7x8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DFD10E0D5;
 Wed,  3 Sep 2025 04:52:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D0C6C6013B;
 Wed,  3 Sep 2025 04:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D852C4CEF0;
 Wed,  3 Sep 2025 04:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756875152;
 bh=BCKzT7TXRkg20i227c4L6NJrd8ors1F/jJQkzbZEMoY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tVpUk7x8TMvHeqDGBZb3l6GYd6jNpNDxicfYPVhISAMZ6L11ocOSrJcxDT+FrFMCS
 sPlgPpHG12BO1uKIt8+1SzpNhJdKufGMhqvqbEbZhnn50nZL53UNQaHfgfqbf/vPBB
 OPAcFKDG/xaj9oXS3i03gUho4vHcH2vaFbWu991TODMNA7jVvWxGg9nuCL6F0IIAzk
 URxzG/vGtbY3qFzGAyxD/YvzXZnItGNcy/U4EMvnQ6C3n5VGgjXQTgNDgJebCmYSxh
 OLW4XMz6zrF2UIUDi1YLR6R62081Gfynb2InIV2jYsSORqD2/cSCRkDhyxwz0eMBBq
 UOwhPj8L7zI3g==
Message-ID: <588626d9-eb27-4376-8741-a1cc2e2e17cf@kernel.org>
Date: Tue, 2 Sep 2025 23:52:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm: panel-backlight-quirks: Log applied panel
 brightness quirks
To: Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>
References: <20250829145541.512671-1-lkml@antheas.dev>
 <20250829145541.512671-7-lkml@antheas.dev>
 <CAGwozwHaWPwy6_LTvTy4ybdrN27fEXc-GbhYEt4_cM88_VGYPA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAGwozwHaWPwy6_LTvTy4ybdrN27fEXc-GbhYEt4_cM88_VGYPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 8/29/2025 10:01 AM, Antheas Kapenekakis wrote:
> On Fri, 29 Aug 2025 at 16:57, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>>
>> Currently, when a panel brightness quirk is applied, there is no log
>> indicating that a quirk was applied. Unwrap the drm device on its own
>> and use drm_info() to log when a quirk is applied.
>>
>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 +++++++++++++---
>>   1 file changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 263f15f6fdea..2a3e17d83d6e 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -3617,13 +3617,15 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>>          struct drm_connector *conn_base;
>>          struct amdgpu_device *adev;
>>          struct drm_luminance_range_info *luminance_range;
>> +       struct drm_device *drm;
>>
>>          if (aconnector->bl_idx == -1 ||
>>              aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
>>                  return;
>>
>>          conn_base = &aconnector->base;
>> -       adev = drm_to_adev(conn_base->dev);
>> +       drm = conn_base->dev;
>> +       adev = drm_to_adev(drm);
>>
>>          caps = &adev->dm.backlight_caps[aconnector->bl_idx];
>>          caps->ext_caps = &aconnector->dc_link->dpcd_sink_ext_caps;
>> @@ -3659,12 +3661,20 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>>          panel_backlight_quirk =
>>                  drm_get_panel_backlight_quirk(aconnector->drm_edid);
>>          if (!IS_ERR_OR_NULL(panel_backlight_quirk)) {
>> -               if (panel_backlight_quirk->min_brightness)
>> +               if (panel_backlight_quirk->min_brightness) {
>> +                       drm_info(drm,
>> +                                "Applying panel backlight quirk, min_brightness: %d\n",
>> +                                panel_backlight_quirk->min_brightness);
> 
> mmm, needs a -1 here
> 

You may as well re-order it too so that you set caps->min_input_signal 
and access it in this message.

>>                          caps->min_input_signal =
>>                                  panel_backlight_quirk->min_brightness - 1;
>> -               if (panel_backlight_quirk->brightness_mask)
>> +               }
>> +               if (panel_backlight_quirk->brightness_mask) {
>> +                       drm_info(drm,
>> +                                "Applying panel backlight quirk, brightness_mask: 0x%X\n",
>> +                                panel_backlight_quirk->brightness_mask);
>>                          caps->brightness_mask =
>>                                  panel_backlight_quirk->brightness_mask;
>> +               }
>>          }
>>   }
>>
>> --
>> 2.51.0
>>
>>
> 

