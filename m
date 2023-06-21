Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E500737BE8
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 09:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EF110E05C;
	Wed, 21 Jun 2023 07:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D2E10E3CA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687331432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4IzdJnOqnbz+jm3gy2ygXTeJwqOQ2NYlfby/NkiUSlg=;
 b=EiGxAjuRiOzyfM/KMJeGj2Bw2Ltt9qQBmyx0DkYBhTmR4mO6VyuSgbmJktKOMjZLDFtnf5
 jcCDYg7MelruJqRKaetJTbJjlP5BurbaZxVwSI0L2kb9dBjIErInteTx9pg+HKI2xDXTwL
 Mis8BbKRid+o5Y4X3OE4BtRhk3q1cuo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-_gkdXYZtONyCJvm9Qjno_g-1; Wed, 21 Jun 2023 03:10:29 -0400
X-MC-Unique: _gkdXYZtONyCJvm9Qjno_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f81f4a7596so32966715e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 00:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687331427; x=1689923427;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4IzdJnOqnbz+jm3gy2ygXTeJwqOQ2NYlfby/NkiUSlg=;
 b=WzNvawJbIWwaVnv66ZjmSz8j8xDTQJiUM2wvx4E2Mqni1IoPYAq2p0sH7zJNSJjE44
 959LfZUlRM22L6opAYiPG7Y/qL50A7LjP7+PqTwb8F/nRyzsiGQ+2TY5/sShAhAKrcRJ
 ELmvkaeJXBrjh0CiivVe5Lngnn1e6teooa4JMCnl9vLSK3pss6MAlggDZrFT7aywwz+Q
 tligz1UDdW6cU9lJH+dZelBuiNKJlrjQ6fzMTlQMNeI5lQ7u8nj02ELJchwh3Lue0IWn
 D39MfAKHVBgGtyYQJvugEl+hpMDYsWzC5tK+Mu402IVrHcKNuJfkxBWzWkIymy+WiFfC
 LEOg==
X-Gm-Message-State: AC+VfDyz4V/wB+Tm6/p5tT5oC4yMikP0ZlRyNDxlyuaO8jtR4w4X0RIK
 pg3Oa9f6Ahjz8L5FmkYo7VtFeu5AzxHTdF4kKpJJzhkWFZqgTkQOZhMAkpt/CUT3O/I8Y3xvapj
 tftQa4EqmiUEj0EuPYPfP498CR37U
X-Received: by 2002:a7b:cc99:0:b0:3f9:b88a:f9aa with SMTP id
 p25-20020a7bcc99000000b003f9b88af9aamr2976515wma.11.1687331427420; 
 Wed, 21 Jun 2023 00:10:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7HHV0W3xsiJ06KkrWf0MHNmtB8p9G4FFaVMkD5QmXsEOvIbgpOMgKC+yysB9aEfNF4ZFhuQw==
X-Received: by 2002:a7b:cc99:0:b0:3f9:b88a:f9aa with SMTP id
 p25-20020a7bcc99000000b003f9b88af9aamr2976488wma.11.1687331426934; 
 Wed, 21 Jun 2023 00:10:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 hn10-20020a05600ca38a00b003f60eb72cf5sm15442397wmb.2.2023.06.21.00.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 00:10:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
In-Reply-To: <3ef205a7-f418-e22d-6bae-7be08f60d2f8@redhat.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <YqMDoSMOL2rsfJj/@phenom.ffwll.local>
 <YqMH14MEqGZtujfk@phenom.ffwll.local>
 <3ef205a7-f418-e22d-6bae-7be08f60d2f8@redhat.com>
Date: Wed, 21 Jun 2023 09:10:24 +0200
Message-ID: <87legdi93z.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, krastevm@vmware.com,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


[adding Zack Rusin again who seems to have fallen from the Cc list]

Albert Esteve <aesteve@redhat.com> writes:
> On 6/10/22 10:59, Daniel Vetter wrote:
>> On Fri, Jun 10, 2022 at 10:41:05AM +0200, Daniel Vetter wrote:

[...]

>>> - third issue: These special virtual display properties arent documented.
>>>    Aside from hotspot there's also suggested X/Y and maybe other stuff. I
>>>    have no idea what suggested X/Y does and what userspace should do with
>>>    it. I think we need a new section for virtualized drivers which:
>>>    - documents all the properties involved
>>>    - documents the new cap for enabling virtual cursor planes
>>>    - documents some of the key flows that compositors should implement for
>>>      best experience
>>>    - documents how exactly the user experience will degrade if compositors
>>>      pretend it's just a normal kms driver (maybe put that into each of the
>>>      special flows that a compositor ideally supports)
>>>    - whatever other comments and gaps I've missed, I'm sure
>>>      Simon/Pekka/others will chime in once the patch exists.

What is missing for these patches to land? If I understood correctly is
just these properties documentation that Sima asked above ?

>> Great bonus would be an igt which demonstrates these flows. With the
>> interactive debug breakpoints to wait for resizing or whatever this should
>> be all neatly possible.
>> -Daniel
>
> Hi all,
>
> We have been testing the v2 of this patch and it works correctly for us.
>
> First we tested with a patched Mutter, the mouse clicks were correct, 
> and behavior was as expected.
>
> But I've also added an IGT test as suggested above: 
> https://gitlab.freedesktop.org/aesteve/igt-gpu-tools/-/compare/master...modeset-cursor-hotspot-test?from_project_id=1274
>
> I could post the IGT patch upstream once Zack's patches land.
>

Zack, are you planning to re-spin the series soon? Otherwise Albert could
continue working on that if you prefer.

> Hope that helps!
>
> -Albert
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

