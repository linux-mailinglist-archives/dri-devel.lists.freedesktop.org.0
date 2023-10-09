Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F84C7BD6DB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CEF10E24D;
	Mon,  9 Oct 2023 09:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE4110E24D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696843457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SDDyWo1f7LALaeDYjdidYYxJrMnfDO+CI1lqzzRObkE=;
 b=g8qVEKQrWiphX9X+TkntlaqrDLOevO937gMmdhO6Ye73AM8WMpfdvkA/HGP6HU69ZXljrN
 JhcaEv9eVWQgIW3GljjrBaq3kpabLz/lC1m6T+gn8YPJCbQHmKqWwlPAMQu8V1wZkzYW1j
 gleHSqMzcuLBz8MP0GqFWnOjKQrW8yo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-wYlCsQf1MzivKM-zAGm8wQ-1; Mon, 09 Oct 2023 05:24:16 -0400
X-MC-Unique: wYlCsQf1MzivKM-zAGm8wQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40540179bcdso27924425e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696843455; x=1697448255;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SDDyWo1f7LALaeDYjdidYYxJrMnfDO+CI1lqzzRObkE=;
 b=JUXWYDZukGnn+0MTiYOcR3IK/dRtVd6gXiq12h1mCaq5GDfH+2qVg0kkSAZw+7QaOq
 K26wSFPVtlSlBBPgxcy05B7/VrvqV87SsAw/nn5kTU0EyLMWD//nx5tqvcBiNnSfOrpc
 /OXmk1Olxi+I3mnl0x0ZeKzNZJ6mrL37ExgbwKDj5N/cgIJUVlgsDLhC37FnqbsTqo/z
 +31qXkguNXa0+jvITUi7rrP1AAVU4fAgvLcfmypGzF+x9IZpVrJ6mWWVidcmbUGpEQ2E
 Z0SS5+Vu7KvUH6bsqRlOB/pAdUwUsvhKcz/HM+X5J62xqt7aDQdSLNLRq69sN4VzQPfm
 WF6Q==
X-Gm-Message-State: AOJu0YxRZ5h6ziHema6S2BS7P+OfbE5pwdZQTtfHgpXcusT5DPTAaPIl
 rINaQ5S00bIu43vKkAwv9Sorz/8Zs06yxdSXlsHEyUyJ0SxoOilHJ04onDUcvnXwZoPPxgFYBRd
 7Mj+BT9OQNuBq9DGk4fbVAtd2LCfa
X-Received: by 2002:a1c:ed17:0:b0:404:7480:d821 with SMTP id
 l23-20020a1ced17000000b004047480d821mr12961040wmh.37.1696843455127; 
 Mon, 09 Oct 2023 02:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4bx7CHncQjUFsRBonnxE6cBpws/aVdsy4fZQFYpSjdieyk8quadKVQjptn5TWRVmEByXRWw==
X-Received: by 2002:a1c:ed17:0:b0:404:7480:d821 with SMTP id
 l23-20020a1ced17000000b004047480d821mr12961022wmh.37.1696843454653; 
 Mon, 09 Oct 2023 02:24:14 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 11-20020a05600c230b00b004053a6b8c41sm10576639wmo.12.2023.10.09.02.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 02:24:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v4 5/7] drm/simpledrm: Preallocate format-conversion
 buffer in atomic_check
In-Reply-To: <8f501b5f-9541-425c-86b0-f3f267af6e6e@suse.de>
References: <20231005090520.16511-1-tzimmermann@suse.de>
 <20231005090520.16511-6-tzimmermann@suse.de>
 <87zg0xyysa.fsf@minerva.mail-host-address-is-not-set>
 <ae863124-17a9-44a7-9565-f8248e5d4317@suse.de>
 <874jj0rx3c.fsf@minerva.mail-host-address-is-not-set>
 <8f501b5f-9541-425c-86b0-f3f267af6e6e@suse.de>
Date: Mon, 09 Oct 2023 11:24:13 +0200
Message-ID: <871qe4rvwi.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javier
>
> Am 09.10.23 um 10:58 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>> Hello Thomas,
>> 
>>> Hi Javier
>>>
>>> Am 05.10.23 um 15:38 schrieb Javier Martinez Canillas:
>>>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>> [...]
>> 
>>>>> +static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
>>>>> +						       struct drm_atomic_state *state)
>>>>> +{
>>>>> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>>>>> +	struct drm_shadow_plane_state *new_shadow_plane_state =
>>>>> +		to_drm_shadow_plane_state(new_plane_state);
>>>>> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
>>>>> +	struct drm_crtc *new_crtc = new_plane_state->crtc;
>>>>> +	struct drm_crtc_state *new_crtc_state = NULL;
>>>>> +	struct drm_device *dev = plane->dev;
>>>>> +	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
>>>>> +	int ret;
>>>>> +
>>>>> +	if (new_crtc)
>>>>> +		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
>>>>> +
>>>>> +	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
>>>>> +						  DRM_PLANE_NO_SCALING,
>>>>> +						  DRM_PLANE_NO_SCALING,
>>>>> +						  false, false);
>>>>
>>>> Same comment that with the ssd130x driver. I think that we should use the
>>>> drm_plane_helper_atomic_check() helper instead of open coding it in each
>>>
>>> I'm going to replace the call in simpledrm.
>>> drm_plane_helper_atomic_check() is useful to remove the entire
>>> atomic_check function from the driver; it does nothing apart from that.
>>> I've been called out before for such do-nothing helpers; deservedly so. [1]
>>>
>> 
>> The argument then is that drivers should open code *exactly* the same code
>> that the helper function already has just because they implement their own
>> .atomic_check callback?
>> 
>> And that the helper should only be used when is the .atomic_check callback
>> but not as a helper function?
>
> My point (and I think that's what Christian was also referring to) is 
> that drm_plane_helper_atomic_check() does little more than pick a few 
> default values for the parameters. It doesn't do anything in terms of 
> algorithms. Hence there's no saving here that outweighs the cost of 
> using this helper.
>

Got it.

>> 
>> I don't understand that rationale to be honest, but if there is one then
>> it should be very clear in the kernel-doc what functions are supposed to
>> be used only as callbacks and what functions can also be used as helpers.
>
> There's no clear rule AFAIK. We have to decide case by case. TBH I don't 
> mind re-evaluating cases from time to time. At least, I'm going to 
> revert the open-coded helper in ssd130x, as you asked me to.
>

No, that's OK. If you are going to revert also in simpledrm and the only
user will be a driver that has it as a callback, then I'm fine with your
original patch to ssd130x that open codes it in its .atomic_check as well.

> Best regards
> Thomas
>
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

