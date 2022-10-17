Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24475601135
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 16:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142B410E516;
	Mon, 17 Oct 2022 14:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3326410E0A2;
 Mon, 17 Oct 2022 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l1cE3d3Vd5VdDWCztqYjwRmjL7vyJBsSHh4D3EvX4V4=; b=Bw5Fxplj2V8diQirR+sz4NVLSV
 uF34e0lL3UsB32WeH8RMxJ7okIOpPcHKaOVUKchDtMtUkfJCQZaf85XMMQARBDVXvKq67Q5n61n13
 Dd5S9G3pKm8j+OiEbTVgte0uMTGya9kbzuO3t/GoNsin7iTxuvC9cP25VvnId/7dVRjvDxKqtNaDt
 7BGjfD+D3DgNCyz58mqcA8FOAqCer/sH1yDO6K7qIYMISLTx7BMqeWZyL3NrjBdwpgQW46OOXFhaa
 b94xj3BDnIyjdzU9XF/aGXgBb/jL3h9081c4QZesRHGbNLqhLiH450WFh5NgSZP2T/34eG22TGn0y
 EwGbH0CA==;
Received: from [177.139.44.8] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1okRDA-000Psq-3Q; Mon, 17 Oct 2022 16:35:23 +0200
Message-ID: <12c35cea-3837-9919-589f-0065c9180545@igalia.com>
Date: Mon, 17 Oct 2022 11:35:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 0/6] Add support for atomic async page-flips
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20220929184307.258331-1-contact@emersion.fr>
 <Yzb0uNjB5FpjCIjq@intel.com> <Yzb6203nHF8fVH/W@intel.com>
 <YzcGw9myJotLRTVl@intel.com>
 <PJIfCPDOH8tzwE1mwv58g4ICBZbEgW44vwzW-JdUde6PjLDUeF_JNT0kUZ_Z8hZWqii_DTdDFfAYpRbO_T1Tu28wpjiwYlQpRdsrHJXLF58=@emersion.fr>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <PJIfCPDOH8tzwE1mwv58g4ICBZbEgW44vwzW-JdUde6PjLDUeF_JNT0kUZ_Z8hZWqii_DTdDFfAYpRbO_T1Tu28wpjiwYlQpRdsrHJXLF58=@emersion.fr>
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
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com, joshua@froggi.es,
 hwentlan@amd.com, nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/13/22 13:02, Simon Ser wrote:
>>>> So no tests that actually verify that the kernel properly rejects
>>>> stuff stuff like modesets, gamma LUT updates, plane movement,
>>>> etc.?
>>>
>>> Pondering this a bit more, it just occurred to me the current driver
>>> level checks might easily lead to confusing behaviour. Eg. is
>>> the ioctl going to succeed if you ask for an async change of some
>>> random property while the crtc disabled, but fails if you ask for
>>> the same async property change when the crtc is active?
>>>
>>> So another reason why rejecting most properties already at
>>> the uapi level might be a good idea.
>>
>> And just to be clear this is pretty much what I suggest:
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 79730fa1dd8e..471a2c703847 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -1392,6 +1392,13 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   				goto out;
>>   			}
>>
>> +			if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC &&
>> +			    prop != dev->mode_config.prop_fb_id) {
>> +				drm_mode_object_put(obj);
>> +				ret = -EINVAL;
>> +				goto out;
>> +			}
>> +
>>   			if (copy_from_user(&prop_value,
>>   					   prop_values_ptr + copied_props,
>>   					   sizeof(prop_value))) {
>>
>>
>> That would actively discourage people from even attempting the
>> "just dump all the state into the ioctl" approach with async flips
>> since even the props whose value isn't even changing would be rejected.
> 
> How does this sound?
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 945761968428..ffd16bdc7b83 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -972,14 +972,26 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
>   			    struct drm_file *file_priv,
>   			    struct drm_mode_object *obj,
>   			    struct drm_property *prop,
> -			    uint64_t prop_value)
> +			    uint64_t prop_value,
> +			    bool async_flip)
>   {
>   	struct drm_mode_object *ref;
>   	int ret;
> +	uint64_t old_val;
>   
>   	if (!drm_property_change_valid_get(prop, prop_value, &ref))
>   		return -EINVAL;
>   
> +	if (async_flip && prop != prop->dev->mode_config.prop_fb_id) {
> +		ret = drm_atomic_get_property(obj, prop, &old_val);
> +		if (ret != 0 || old_val != prop_value) {
> +			drm_dbg_atomic(prop->dev,
> +				       "[PROP:%d:%s] cannot be changed during async flip\n",
> +				       prop->base.id, prop->name);

I would write this as "[PROP:%d:%s] No prop can be changed during async 
flips" to make it clear that it's not just this prop that can't, but any.

> +			return -EINVAL;
> +		}
> +	}
> +
>   	switch (obj->type) {
>   	case DRM_MODE_OBJECT_CONNECTOR: {
>   		struct drm_connector *connector = obj_to_connector(obj);
