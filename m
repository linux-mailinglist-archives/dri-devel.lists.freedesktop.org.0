Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D362405E7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 14:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7A66E423;
	Mon, 10 Aug 2020 12:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139B06E421;
 Mon, 10 Aug 2020 12:30:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y3so7990805wrl.4;
 Mon, 10 Aug 2020 05:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=F5fkpkTMjACBHMKnWA31OBgWrBFMdm/ztMFr41HN3Fk=;
 b=COQkIbiygkbVDV4rF53Pu/1UGSrDVI7rCXDIMdYAcUcaeX4PQ3Xhx0XRpIlLPMEQQc
 jwkp2/Hx2Gu2IzzXvFAkzYf+dPENbKtDS7I7MpyYup58vxnY9XYNkwZoMvFx4Lhiv6mx
 UMabrFidq3zv0rlUwPxQ2YTXQdaELf+68y7N1+XiwgFMswczRkNw7PjVHLlAj76fM/F5
 tr//Z9RDtiLltDIUTsr7WbDK4zN2NQlxXUoJ8jRBpXqqrSasyvtn+xyVMBFcIJEXAil/
 rIXeGJ/XMen0TbGdWfseuWzIQ6RoFNIO9N4Xzgc2yO0UzX7k6FVDaj4sDkKWiHIc8Py/
 uZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=F5fkpkTMjACBHMKnWA31OBgWrBFMdm/ztMFr41HN3Fk=;
 b=s8F8cWXTnVAxsGNG1TzqNvy/n7xiSdDz2yRQqtBjCBm0qn2fenyNJJ/wZi81zSFXVP
 WTq9O350dUFnoTOr1DF1KBEp9YV2ODJ6ZT9TBH+jYJX++zGer2wa1J73OFaDQAPzclwE
 RWJgdq/28q/j518pTkjYJP52Gej3/CFXlFjrrfyWzInol2viCEl2xBsqgotzBV0RLDek
 3WOScm9vy+5f/de6+j+yCPwevn8mY1yTNzMzBsacdhVVR16wbWhiE5IZLePxSIA6hEKd
 x+o0GgZuCqFaFN2Gtr0fr9B8dI9mWPYL6BnOZhtDmlK6a+AfwsEI3+nNAdB5fMgl+13p
 FSPw==
X-Gm-Message-State: AOAM533kUrX5Yka8llB1FlizNYDmuFo8o/pYZfZDFJaYyetJZKKfEe51
 UCy45JRPH/D4AWg83TlipDGP3JX0
X-Google-Smtp-Source: ABdhPJzZnvqWrK8QdxLKjvajs5uwmJI+L4i+INdbQG6F4jVVzGZnm/4FsfIHYgjj+oOsQz0IqUuq6Q==
X-Received: by 2002:adf:c981:: with SMTP id f1mr24126725wrh.14.1597062609347; 
 Mon, 10 Aug 2020 05:30:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 33sm21128487wri.16.2020.08.10.05.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2020 05:30:08 -0700 (PDT)
Subject: Re: [PATCH 3/7] drm/amd/display: Avoid using unvalidated tiling_flags
 and tmz_surface in prepare_planes
To: Daniel Vetter <daniel@ffwll.ch>,
 "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
 <20200807083041.GL6419@phenom.ffwll.local>
 <4117cdee-2f5d-a8bd-1e80-1c550c9d9af3@amd.com>
 <20200810122553.GI2352366@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9fc38b52-6b46-fec8-e511-3fc3e9d2c151@gmail.com>
Date: Mon, 10 Aug 2020 14:30:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200810122553.GI2352366@phenom.ffwll.local>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.08.20 um 14:25 schrieb Daniel Vetter:
> On Fri, Aug 07, 2020 at 10:29:09AM -0400, Kazlauskas, Nicholas wrote:
>> On 2020-08-07 4:30 a.m., daniel@ffwll.ch wrote:
>>> On Thu, Jul 30, 2020 at 04:36:38PM -0400, Nicholas Kazlauskas wrote:
>>>> [Why]
>>>> We're racing with userspace as the flags could potentially change
>>>> from when we acquired and validated them in commit_check.
>>> Uh ... I didn't know these could change. I think my comments on Bas'
>>> series are even more relevant now. I think long term would be best to bake
>>> these flags in at addfb time when modifiers aren't set. And otherwise
>>> always use the modifiers flag, and completely ignore the legacy flags
>>> here.
>>> -Daniel
>>>
>> There's a set tiling/mod flags IOCTL that can be called after addfb happens,
>> so unless there's some sort of driver magic preventing this from working
>> when it's already been pinned for scanout then I don't see anything stopping
>> this from happening.
>>
>> I still need to review the modifiers series in a little more detail but that
>> looks like a good approach to fixing these kind of issues.
> Yeah we had the same model for i915, but it's awkward and can surprise
> compositors (since the client could change the tiling mode from underneath
> the compositor). So freezing the tiling mode at addfb time is the right
> thing to do, and anyway how things work with modifiers.
>
> Ofc maybe good to audit the -amd driver, but hopefully it doesn't do
> anything silly with changed tiling. If it does, it's kinda sad day.

Marek should know this right away, but I think we only set the tilling 
flags once while exporting the BO and then never change them.

Regards,
Christian.

>
> Btw for i915 we even went a step further, and made the set_tiling ioctl
> return an error if a framebuffer for that gem_bo existed. Just to make
> sure we don't ever accidentally break this.
>
> Cheers, Daniel
>
>> Regards,
>> Nicholas Kazlauskas
>>
>>>> [How]
>>>> We unfortunately can't drop this function in its entirety from
>>>> prepare_planes since we don't know the afb->address at commit_check
>>>> time yet.
>>>>
>>>> So instead of querying new tiling_flags and tmz_surface use the ones
>>>> from the plane_state directly.
>>>>
>>>> While we're at it, also update the force_disable_dcc option based
>>>> on the state from atomic check.
>>>>
>>>> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>>>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>>>> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>>>> ---
>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++---------
>>>>    1 file changed, 19 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index bf1881bd492c..f78c09c9585e 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -5794,14 +5794,8 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>>>>    	struct list_head list;
>>>>    	struct ttm_validate_buffer tv;
>>>>    	struct ww_acquire_ctx ticket;
>>>> -	uint64_t tiling_flags;
>>>>    	uint32_t domain;
>>>>    	int r;
>>>> -	bool tmz_surface = false;
>>>> -	bool force_disable_dcc = false;
>>>> -
>>>> -	dm_plane_state_old = to_dm_plane_state(plane->state);
>>>> -	dm_plane_state_new = to_dm_plane_state(new_state);
>>>>    	if (!new_state->fb) {
>>>>    		DRM_DEBUG_DRIVER("No FB bound\n");
>>>> @@ -5845,27 +5839,35 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
>>>>    		return r;
>>>>    	}
>>>> -	amdgpu_bo_get_tiling_flags(rbo, &tiling_flags);
>>>> -
>>>> -	tmz_surface = amdgpu_bo_encrypted(rbo);
>>>> -
>>>>    	ttm_eu_backoff_reservation(&ticket, &list);
>>>>    	afb->address = amdgpu_bo_gpu_offset(rbo);
>>>>    	amdgpu_bo_ref(rbo);
>>>> +	/**
>>>> +	 * We don't do surface updates on planes that have been newly created,
>>>> +	 * but we also don't have the afb->address during atomic check.
>>>> +	 *
>>>> +	 * Fill in buffer attributes depending on the address here, but only on
>>>> +	 * newly created planes since they're not being used by DC yet and this
>>>> +	 * won't modify global state.
>>>> +	 */
>>>> +	dm_plane_state_old = to_dm_plane_state(plane->state);
>>>> +	dm_plane_state_new = to_dm_plane_state(new_state);
>>>> +
>>>>    	if (dm_plane_state_new->dc_state &&
>>>> -			dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
>>>> -		struct dc_plane_state *plane_state = dm_plane_state_new->dc_state;
>>>> +	    dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
>>>> +		struct dc_plane_state *plane_state =
>>>> +			dm_plane_state_new->dc_state;
>>>> +		bool force_disable_dcc = !plane_state->dcc.enable;
>>>> -		force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
>>>>    		fill_plane_buffer_attributes(
>>>>    			adev, afb, plane_state->format, plane_state->rotation,
>>>> -			tiling_flags, &plane_state->tiling_info,
>>>> -			&plane_state->plane_size, &plane_state->dcc,
>>>> -			&plane_state->address, tmz_surface,
>>>> -			force_disable_dcc);
>>>> +			dm_plane_state_new->tiling_flags,
>>>> +			&plane_state->tiling_info, &plane_state->plane_size,
>>>> +			&plane_state->dcc, &plane_state->address,
>>>> +			dm_plane_state_new->tmz_surface, force_disable_dcc);
>>>>    	}
>>>>    	return 0;
>>>> -- 
>>>> 2.25.1
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
