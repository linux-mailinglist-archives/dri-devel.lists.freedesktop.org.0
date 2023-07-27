Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB97657FC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE40E10E138;
	Thu, 27 Jul 2023 15:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C36C10E138
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690472857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tQK975Q3UCxrDp8lGcKZZKIqwI2vHYZMtaPHzBySI8Y=;
 b=XTN+irqSHGwdv7jmCnEqdd+6u18KF5QekODX5nl32HROkADC0uNzZzqQNBq/G/uwy30pi0
 hV0wY3whWE7g44qJE2yHKU/YSOAxM3eSm0OYn0VHTdwITwk7Yci2eCiUfKDa0YGYUJcxqi
 AdXMog4GVSHVDNmzLUkMLBk27guwU7M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-NQyw2epoPq6AgkX56cYdFA-1; Thu, 27 Jul 2023 11:47:36 -0400
X-MC-Unique: NQyw2epoPq6AgkX56cYdFA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-31775a8546fso610264f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690472855; x=1691077655;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tQK975Q3UCxrDp8lGcKZZKIqwI2vHYZMtaPHzBySI8Y=;
 b=JC3bW3WNp0GxdgB/bi23PAEX9yPdx8OE2ohTaKnjkeIvz0eBVyTpCz7Cq2ymBRhKuz
 fWkzXmo9UJI2zqmvZ39Q928NGnIGkqHbfXq6c7rmYGX4ZXIA+03zBwhvf2HGV4aQNpjZ
 kAEiYY5JrihBIyX5FxdgILmlJNx0vRnobML/+C/vVUyKQde4miS3xxMEkEm2bzuvBRlm
 B4baLTNMMPccX0myIxKmqGT52V65YufhLL7NjLJwpULPoq4d5gxLp+9gS27iE40HnFwm
 jWpVhzEV5XhoTbosEv+oZdzQEUio/FCSjhXNAfKir0YOB20BdCCNtYvIDxR6cBChCoP+
 aqLw==
X-Gm-Message-State: ABy/qLaOOxXydczrUe5VsT5KoHxsA9Gi1jVtatfcEjHue8tUNSUizsHY
 2wBRpj4X70IpyckCgMk75NtniJlF707Df6/86w6L0P0H2V0x2a2151UurcM4RVBy1odajBwc2Sd
 4rmIGde85SslOboQk9J4g9knqJWGAKk792Dxa
X-Received: by 2002:a05:6000:1111:b0:313:f61c:42ab with SMTP id
 z17-20020a056000111100b00313f61c42abmr2259821wrw.56.1690472854992; 
 Thu, 27 Jul 2023 08:47:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG60W7O9hB86VxOl6UThIIW1lacXUNHxKNHaxiNPNwewm5qhXaPHuBBkzmkEyFN9uiAy2MS3g==
X-Received: by 2002:a05:6000:1111:b0:313:f61c:42ab with SMTP id
 z17-20020a056000111100b00313f61c42abmr2259806wrw.56.1690472854640; 
 Thu, 27 Jul 2023 08:47:34 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f14-20020adffcce000000b00316eb7770b8sm2456191wrs.5.2023.07.27.08.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:47:34 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/ssd130x: Use shadow-buffer helpers when managing
 plane's state
In-Reply-To: <87y1j1tme2.fsf@minerva.mail-host-address-is-not-set>
References: <20230727140453.577445-1-javierm@redhat.com>
 <0ce32153-cfc0-e701-3863-803fcdb897ff@suse.de>
 <87y1j1tme2.fsf@minerva.mail-host-address-is-not-set>
Date: Thu, 27 Jul 2023 17:47:33 +0200
Message-ID: <87o7jxs6ei.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Thomas Zimmermann <tzimmermann@suse.de> writes:
>
> Hello Thomas,
>
>> Hi Javier
>>
>> Am 27.07.23 um 16:04 schrieb Javier Martinez Canillas:
>>> The commit 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's
>>> .atomic_check() callback") moved the buffers allocation to be done in
>>> the primary plane's .atomic_check() callback.
>>> 
>>> But it missed that since the driver uses a shadow-buffered plane, the
>>> __drm_gem_{reset,duplicate,destroy}_shadow_plane() helper functions
>>> must be used in the struct drm_plane_funcs handlers.
>>> 
>>> This was missed because the mentioned commit did not remove the macro
>>> DRM_GEM_SHADOW_PLANE_FUNCS, which leads to the custom plane's atomic
>>> state management handlers to not be used.
>>> 
>>> Fixes: 45b58669e532 ("drm/ssd130x: Allocate buffer in the plane's .atomic_check() callback")
>>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>>
>> Reported-by needs to be followed by
>>
>> Closes: <url>
>>
>> where <url> would point to Arnd's bug report on dri-devel.
>>
>
> Ah, I thought checkpatch complaining about it but since we already add a
> Link: with dim, didn't know what to add there. Makes sense to add Arnd's
> report indeed.
>
> I can include it when applying instead of posting a v2 if you don't mind.
>

Pushed to drm-misc (drm-misc-next), adding:

Closes: https://lore.kernel.org/dri-devel/20230727122412.2464210-1-arnd@kernel.org

Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

