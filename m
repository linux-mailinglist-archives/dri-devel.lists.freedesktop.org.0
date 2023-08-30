Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA478D557
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 12:59:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A96810E4F4;
	Wed, 30 Aug 2023 10:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A767410E4F3;
 Wed, 30 Aug 2023 10:59:33 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4RbLsB2lqxz9scy;
 Wed, 30 Aug 2023 12:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1693393166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bE/Bz/ONqO1u4Q/tC+3zmrw8kzMyB7RMj1Z30BMIazc=;
 b=SiJBLXy/JJiEg7Fi8lUlR0Ix6TwcphMBGQEyVKuhgq8LsCJCIbgxRQmo1q5iVwf1CJ98WO
 SJ+lTaogFh74qj0uGbI2odQsaV5Rrfgtr5PMnFrSG2WryCyFjNnp7ekc9S2cvty6vG5AH+
 NyW/53iIEfMzcKjHW3IZSxi+kVoDlDYnADAUgiVijFFbaIFmpxBoSg4wSdv36bBBDl5CZj
 p+ek09ugJIHmHqX1jESsCV3gVmLh09EpPfxZgv/ap6l8FgJgjmPXSxvleoxenTOrARFMSX
 H6lmNrrSU4qQXQP1fTftYFDOFw8Tg/2p1uN5r/+G4IlNS1gUMNRPzVydQG4PDw==
Message-ID: <1135faf0-a771-4651-ec40-4dff69b29218@mailbox.org>
Date: Wed, 30 Aug 2023 12:59:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 19/34] drm/amd/display: decouple steps for mapping CRTC
 degamma to DC plane
Content-Language: en-CA
To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Melissa Wen <mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
 <20230810160314.48225-20-mwen@igalia.com>
 <20230822151110.3107b745.pekka.paalanen@collabora.com>
 <20230825142944.3jkibtz54f4utwuq@mail.igalia.com>
 <20230828111726.0a39b73b.pekka.paalanen@collabora.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20230828111726.0a39b73b.pekka.paalanen@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: k4idbbjjmi9i3rr3557j8suqtmd4smks
X-MBO-RS-ID: eedbd625b3b49171d9c
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
 Shashank Sharma <Shashank.Sharma@amd.com>, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, Alex Hung <alex.hung@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/28/23 10:17, Pekka Paalanen wrote:
> On Fri, 25 Aug 2023 13:29:44 -0100
> Melissa Wen <mwen@igalia.com> wrote:
> 
>> On 08/22, Pekka Paalanen wrote:
>>> On Thu, 10 Aug 2023 15:02:59 -0100
>>> Melissa Wen <mwen@igalia.com> wrote:
>>>   
>>>> The next patch adds pre-blending degamma to AMD color mgmt pipeline, but
>>>> pre-blending degamma caps (DPP) is currently in use to provide DRM CRTC
>>>> atomic degamma or implict degamma on legacy gamma. Detach degamma usage
>>>> regarging CRTC color properties to manage plane and CRTC color
>>>> correction combinations.
>>>>
>>>> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>>  .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 59 +++++++++++++------
>>>>  1 file changed, 41 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>> index 68e9f2c62f2e..74eb02655d96 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
>>>> @@ -764,20 +764,9 @@ int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> -/**
>>>> - * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
>>>> - * @crtc: amdgpu_dm crtc state
>>>> - * @dc_plane_state: target DC surface
>>>> - *
>>>> - * Update the underlying dc_stream_state's input transfer function (ITF) in
>>>> - * preparation for hardware commit. The transfer function used depends on
>>>> - * the preparation done on the stream for color management.
>>>> - *
>>>> - * Returns:
>>>> - * 0 on success. -ENOMEM if mem allocation fails.
>>>> - */
>>>> -int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>> -				      struct dc_plane_state *dc_plane_state)
>>>> +static int
>>>> +map_crtc_degamma_to_dc_plane(struct dm_crtc_state *crtc,
>>>> +			     struct dc_plane_state *dc_plane_state)
>>>>  {
>>>>  	const struct drm_color_lut *degamma_lut;
>>>>  	enum dc_transfer_func_predefined tf = TRANSFER_FUNCTION_SRGB;
>>>> @@ -800,8 +789,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>>  						 &degamma_size);
>>>>  		ASSERT(degamma_size == MAX_COLOR_LUT_ENTRIES);
>>>>  
>>>> -		dc_plane_state->in_transfer_func->type =
>>>> -			TF_TYPE_DISTRIBUTED_POINTS;
>>>> +		dc_plane_state->in_transfer_func->type = TF_TYPE_DISTRIBUTED_POINTS;
>>>>  
>>>>  		/*
>>>>  		 * This case isn't fully correct, but also fairly
>>>> @@ -837,7 +825,7 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>>  				   degamma_lut, degamma_size);
>>>>  		if (r)
>>>>  			return r;
>>>> -	} else if (crtc->cm_is_degamma_srgb) {
>>>> +	} else {
>>>>  		/*
>>>>  		 * For legacy gamma support we need the regamma input
>>>>  		 * in linear space. Assume that the input is sRGB.
>>>> @@ -847,8 +835,43 @@ int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>>  
>>>>  		if (tf != TRANSFER_FUNCTION_SRGB &&
>>>>  		    !mod_color_calculate_degamma_params(NULL,
>>>> -			    dc_plane_state->in_transfer_func, NULL, false))
>>>> +							dc_plane_state->in_transfer_func,
>>>> +							NULL, false))
>>>>  			return -ENOMEM;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +/**
>>>> + * amdgpu_dm_update_plane_color_mgmt: Maps DRM color management to DC plane.
>>>> + * @crtc: amdgpu_dm crtc state
>>>> + * @dc_plane_state: target DC surface
>>>> + *
>>>> + * Update the underlying dc_stream_state's input transfer function (ITF) in
>>>> + * preparation for hardware commit. The transfer function used depends on
>>>> + * the preparation done on the stream for color management.
>>>> + *
>>>> + * Returns:
>>>> + * 0 on success. -ENOMEM if mem allocation fails.
>>>> + */
>>>> +int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
>>>> +				      struct dc_plane_state *dc_plane_state)
>>>> +{
>>>> +	bool has_crtc_cm_degamma;
>>>> +	int ret;
>>>> +
>>>> +	has_crtc_cm_degamma = (crtc->cm_has_degamma || crtc->cm_is_degamma_srgb);
>>>> +	if (has_crtc_cm_degamma){
>>>> +		/* AMD HW doesn't have post-blending degamma caps. When DRM
>>>> +		 * CRTC atomic degamma is set, we maps it to DPP degamma block
>>>> +		 * (pre-blending) or, on legacy gamma, we use DPP degamma to
>>>> +		 * linearize (implicit degamma) from sRGB/BT709 according to
>>>> +		 * the input space.  
>>>
>>> Uhh, you can't just move degamma before blending if KMS userspace
>>> wants it after blending. That would be incorrect behaviour. If you
>>> can't implement it correctly, reject it.
>>>
>>> I hope that magical unexpected linearization is not done with atomic,
>>> either.
>>>
>>> Or maybe this is all a lost cause, and only the new color-op pipeline
>>> UAPI will actually work across drivers.  
>>
>> I agree that crtc degamma is an optional property and should be not
>> exposed if not available.  I did something in this line for DCE that has
>> no degamma block[1].  Then, AMD DDX driver stopped to advertise atomic
>> API for DCE, that was not correct too[2].
> 
> Did AMD go through all the trouble of making their Xorg DDX use KMS
> atomic, even after the kernel took it away from X due to modesetting
> DDX screwing it up?

No, I think Melissa meant the KMS properties for advanced colour transforms, which xf86-video-amdgpu uses, not with atomic KMS though.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

