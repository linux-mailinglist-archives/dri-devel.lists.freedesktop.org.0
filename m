Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A593BE547B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B096710EA7C;
	Thu, 16 Oct 2025 19:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=0la.ch header.i=@0la.ch header.b="Dam8LnIx";
	dkim=permerror (0-bit key) header.d=0la.ch header.i=@0la.ch header.b="wE6pQ6aU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.0la.ch (mail.0la.ch [78.47.82.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183A610EA59;
 Thu, 16 Oct 2025 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202502r; d=0la.ch; c=relaxed/relaxed;
 h=From:To:Subject:Date:Message-ID; t=1760635365; bh=W2hO6H2WvXcWahkquOaGCjT
 a90qL1JlfgvTKZcNf2YE=; b=Dam8LnIxLaEwS+QfK9MVi5v3jjEFtCyUOqNhNiTwKO8B0JouO8
 rr/DqoK2X6ArRoCzz963fJ+E2cv/Qh9fBk+kMKLEZA5Cln9MqBZ84zseQ4p5XeIzO++P5Z/HfFc
 vBKqqLkHL4NASJuauQpdT98KVrkXK7iHV8usINto/McsHMone3IDm3BOYVzzUWR7pMCdpNoPXjf
 ltOSxiEbJJiXBjpAa4C5EObH5CtFaxK7r22otGZBnZvpf0FrJZ12sxeb6aZADYy4Cnd59cTuju+
 +YmyNWTJte5cCO+UexVMTkWewmH5kx9v0FX0me6j/vFZzb8Zv78jCH7Q7xhtiP7HFFg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202502e; d=0la.ch; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1760635365;
 bh=W2hO6H2WvXcWahkquOaGCjT
 a90qL1JlfgvTKZcNf2YE=; b=wE6pQ6aUMwzjuVaS1ZLxuoJ+NgRncNgSvWdIVX3ighke5zo4nn
 Ek1O9cPR3TzNOakZ2dXjxuxgE7TxY0ky/tBA==;
Message-ID: <9c469725-acaf-4450-aff2-4b5d03f8d947@0la.ch>
Date: Thu, 16 Oct 2025 19:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/amd: use fixed dsc bits-per-pixel from edid
To: Jani Nikula <jani.nikula@linux.intel.com>, Yaroslav Bolyukin
 <iam@lach.pw>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251016001038.13611-2-iam@lach.pw>
 <20251016001038.13611-6-iam@lach.pw>
 <34407e8d423f0d00e949ba8c6b209cb88e8f5414@intel.com>
Content-Language: en-US
From: Yaroslav <iam@0la.ch>
In-Reply-To: <34407e8d423f0d00e949ba8c6b209cb88e8f5414@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 16 Oct 2025 19:49:41 +0000
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

On 2025-10-16 18:39, Jani Nikula wrote:
> On Thu, 16 Oct 2025, Yaroslav Bolyukin <iam@lach.pw> wrote:
>> VESA vendor header from DisplayID spec may contain fixed bit per pixel
>> rate, it should be respected by drm driver
>>
>> Signed-off-by: Yaroslav Bolyukin <iam@lach.pw>
>> ---
>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++++++++-
>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 0d03e324d5b9..ebe5bb4eecf8 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -6521,6 +6521,11 @@ static void fill_stream_properties_from_drm_display_mode(
>>   
>>   	stream->output_color_space = get_output_color_space(timing_out, connector_state);
>>   	stream->content_type = get_output_content_type(connector_state);
>> +
>> +	/* DisplayID Type VII pass-through timings. */
>> +	if (mode_in->dsc_passthrough_timings_support && info->dp_dsc_bpp != 0) {
>> +		stream->timing.dsc_fixed_bits_per_pixel_x16 = info->dp_dsc_bpp;
>> +	}
> 
> If we had mode->dp_dsc_bpp_x16 directly, or something better named, this
> would be simpler. This will eventually be replicated in a bunch of
> drivers.
> 
> BR,
> Jani.

Unfortunately, that won't solve the problem that there is no good way to 
pass this value from display_modes created from e.g 
DRM_IOCTL_MODE_SETCRTC. I believe it would be better if there was a 
syscall to inherit from a native mode instead of creating a new one, but 
this is too far fetched.

I'll check how this was implemented by nvidia open driver, as they have 
added support for this value in their driver somehow.
  >>   }
>>   
>>   static void fill_audio_info(struct audio_info *audio_info,
>> @@ -7067,6 +7072,13 @@ create_stream_for_sink(struct drm_connector *connector,
>>   					&mode, preferred_mode, scale);
>>   
>>   			preferred_refresh = drm_mode_vrefresh(preferred_mode);
>> +
>> +			/*
>> +			 * HACK: In case of multiple supported modes, we should look at the matching mode to decide this flag.
>> +			 * But what is matching mode, how should it be decided?
>> +			 * Assuming that only preferred mode would have this flag.
>> +			 */
>> +			mode.dsc_passthrough_timings_support = preferred_mode->dsc_passthrough_timings_support;
>>   		}
>>   	}
>>   
>> @@ -7756,7 +7768,7 @@ create_validate_stream_for_sink(struct drm_connector *connector,
>>   			drm_dbg_kms(connector->dev, "%s:%d Validation failed with %d, retrying w/ YUV420\n",
>>   				    __func__, __LINE__, dc_result);
>>   			aconnector->force_yuv420_output = true;
>> -		}
>> +}>>   		stream = create_validate_stream_for_sink(connector, drm_mode,
>>   							 dm_state, old_stream);
>>   		aconnector->force_yuv422_output = false;
> 

Regards,

Lach
