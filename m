Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 406207EB628
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 19:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4174D10E490;
	Tue, 14 Nov 2023 18:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3558710E490
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699985390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7C7wW8Bb55AP5fqpBh20EWuPiJ+kxnmpZ3Q7RhkSlhM=;
 b=KuqA7FCzhR/TFC+eNN+B5klyS8AkwLIadbZ08AGo82ayKwPDXexwDKnFLJlW0c7A988jLp
 3mrlrjWJmWkX0ibdmgao4IG/uGoEBX6dengzbx1D14rsdIXNX1JQfknwupOFNqIhDMcwLY
 pke6uJoXXkDStPITau29CRs0uttKXAc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-SgySVI5MPrWlWazuOk-ifQ-1; Tue, 14 Nov 2023 13:09:48 -0500
X-MC-Unique: SgySVI5MPrWlWazuOk-ifQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-32d9602824dso2753722f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 10:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699985386; x=1700590186;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7C7wW8Bb55AP5fqpBh20EWuPiJ+kxnmpZ3Q7RhkSlhM=;
 b=e5GXF7mLyakkfO8nKZW8XGRFvw2LSWyUnTNubNrysXfbM5usT/xiHHRD8HzKw3W2i4
 trNbR1S1gk3lbf8qvvRA7chLUV3PD6mdwYq97T7kZnwFcojjdCMAnD/Lstc1IoZrTn89
 FABPdJwztVq/P9CfpmUWhfnyP1Dii3pTHgCfAZa3DqQZ7eJ8GYLQT1o1/qqmvw0ox/0U
 ZXfnzHq0cFx9rXgeiPj0TyHoY+S8LGffLQhjDeJbDm3vQdPEBYspDZx3ECeLqRNsBGo8
 F0T2b7R8TnHO0cpjaWHYwB80zIVd3wVOf0VweU4826QlLq8TbrmH9TaGpZhqjSybxm+9
 82lA==
X-Gm-Message-State: AOJu0Yze/EUDp+REcakm2iE/5Ud0vM2mV45p/wlGq2Dtx9GcmRlWgdSL
 it5rGmeh6oOVqj1FkziMOTtz5sviBjs/8QT7smyUrsVytN4sYEEWW39nvvRXv1jgnk7nCsV+1d2
 w1Z2znLpgli5ZlgPt/24vITiXNu7w
X-Received: by 2002:a05:6000:1567:b0:319:867e:97d7 with SMTP id
 7-20020a056000156700b00319867e97d7mr9247564wrz.52.1699985386717; 
 Tue, 14 Nov 2023 10:09:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQK+7LGbBm9NWV35d1R+NImBNQNggBVsNQ2twsZUsBZR8uiQcCCjKalWkzse4WmlZcEOZ58Q==
X-Received: by 2002:a05:6000:1567:b0:319:867e:97d7 with SMTP id
 7-20020a056000156700b00319867e97d7mr9247549wrz.52.1699985386363; 
 Tue, 14 Nov 2023 10:09:46 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n7-20020a5d4847000000b0032d88e370basm8419537wrs.34.2023.11.14.10.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 10:09:46 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] drm: Add
 drm_atomic_helper_buffer_damage_{iter_init,merged}() helpers
In-Reply-To: <a8731f9f-3652-4efd-b40e-06a792d0fccf@suse.de>
References: <20231109172449.1599262-1-javierm@redhat.com>
 <20231109172449.1599262-3-javierm@redhat.com>
 <c4fdfec8-aa9a-4a09-94c4-114595cf5596@suse.de>
 <8734x872dy.fsf@minerva.mail-host-address-is-not-set>
 <a8731f9f-3652-4efd-b40e-06a792d0fccf@suse.de>
Date: Tue, 14 Nov 2023 19:09:45 +0100
Message-ID: <87r0ks5hqu.fsf@minerva.mail-host-address-is-not-set>
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
Cc: nerdopolis <bluescreen_avenger@verizon.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 14.11.23 um 16:58 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>> 
>> Hello Thomas,
>> 
>> Thanks a lot for your feedback.
>> 
>>> Hi
>>>
>>> Am 09.11.23 um 18:24 schrieb Javier Martinez Canillas:
>>>> To be used by drivers that do per-buffer (e.g: virtio-gpu) uploads (rather
>>>> than per-plane uploads), since these type of drivers need to handle buffer
>>>> damages instead of frame damages.
>>>>
>>>> The drm_atomic_helper_buffer_damage_iter_init() has the same logic than
>>>> drm_atomic_helper_damage_iter_init() but it also takes into account if the
>>>> framebuffer attached to plane's state has changed since the last update.
>>>>
>>>> And the drm_atomic_helper_buffer_damage_merged() is just a version of the
>>>> drm_atomic_helper_damage_merged() helper, but it uses the iter_init helper
>>>> that is mentioned above.
>>>>
>>>> Fixes: 01f05940a9a7 ("drm/virtio: Enable fb damage clips property for the primary plane")
>>>> Cc: <stable@vger.kernel.org> # v6.4+
>>>> Reported-by: nerdopolis <bluescreen_avenger@verizon.net>
>>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218115
>>>> Suggested-by: Sima Vetter <daniel.vetter@ffwll.ch>
>>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>>> ---
>>>>
>>>>    drivers/gpu/drm/drm_damage_helper.c | 79 ++++++++++++++++++++++++++---
>>>>    include/drm/drm_damage_helper.h     |  7 +++
>>>>    2 files changed, 80 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
>>>> index aa2325567918..b72062c9d31c 100644
>>>> --- a/drivers/gpu/drm/drm_damage_helper.c
>>>> +++ b/drivers/gpu/drm/drm_damage_helper.c
>>>> @@ -204,7 +204,8 @@ EXPORT_SYMBOL(drm_atomic_helper_dirtyfb);
>>>>    static void
>>>>    __drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
>>>>    				     const struct drm_plane_state *old_state,
>>>> -				     const struct drm_plane_state *state)
>>>> +				     const struct drm_plane_state *state,
>>>> +				     bool buffer_damage)
>>>
>>> I think it would be preferable to drop patches one and two and instead
>>> add this parameter directly to drm_atomic_helper_damage_iter_init() and
>>> drm_atomic_helper_damage_merged().  That's a bit of churn, but more
>>> readable code.
>>>
>> 
>> Makes sense. I'll do that in v2.
>
> Instead of modifying these function interfaces, it might be even better 
> to introduce a state flag in struct drm_plane_state that you can modify 
> in the plane's atomic_check helper. Something simple like this:
>
>    if (old_fb != new_fb)
>      plane_state->ignore_damage_clips = true;
>
> in the affected drivers/planes. In drm_atomic_helper_damage_iter_init() 
> you can use it to generate a full update. This avoids the churn and is 
> in line with the overall check/commit design of the DRM framework.
>

Thanks. That indeed seems more aligned with the rest of the DRM framework.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

