Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE56A744D32
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 12:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF1110E142;
	Sun,  2 Jul 2023 10:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4037410E142
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jul 2023 10:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688293054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Rc7GObebSLsl0SfAjmT8VMbjzHyCrfzHw94P9chOzQ=;
 b=Ve8/Q9+uRrvxBt5ZtoetZjCzXCQfwWqo/Z4ZuXxIew4cCw2kXzGDaUFsL7Q0vt6XeRjQ7B
 vzmRRWXcCiTdcI6xFPj1XU3ptSaBWrttCNtv7CREKbv+LMv1u6d45X79LPwl1oiuzQg66A
 ux4ccF6GG+wOjWSw/zlOjSmZmBXuLN8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-YpGE89XEPS2TkfGPf97T3Q-1; Sun, 02 Jul 2023 06:17:33 -0400
X-MC-Unique: YpGE89XEPS2TkfGPf97T3Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-31273e0507dso1945910f8f.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Jul 2023 03:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688293052; x=1690885052;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Rc7GObebSLsl0SfAjmT8VMbjzHyCrfzHw94P9chOzQ=;
 b=h5ozId68cNnuLwp8Qet6UTZkIH+XsSmSCUslxLtCveGB2JdLQX/T9SklkMSeZG8tXG
 l1zqPwtVQ11C4lN3ilADCkSjkbikm6V13vPWdLtlmccpOqzYwBcmwlA5ZKHvMi5zYZ8p
 760G4q3JAVWh5R9yeBB9ZrH2nfwKOhgKozcGTBPoK0w99+mc1Cd0S4tHph6kWUqesdMU
 g5YjDSyuN+DbJwzyoGER10SYka0ZavsdFZLaawRiWxLOT6soIYledUFfNLATGw4MEFy7
 bPPhAaRcFJp+OICGGgsU08m51XSPWRXYxWKEN4qrXUv/N4znCa1Yx2uPIW26/SpIUgvU
 lM5Q==
X-Gm-Message-State: ABy/qLbgQgWvGXyI1jTWGx/3MoDQJXj4MI4pbaAcHa4DNklGEwhB831r
 zLQgYbB489hcrvo9ejNym6SrAPD7e8xdttt9T/kk23prr/mq4SedeUpm7gplIQCi7rr9bomW8VB
 eaAJ6iYqEKyLQxBCBbW/yOjHDvPLT
X-Received: by 2002:a5d:4241:0:b0:314:824:3788 with SMTP id
 s1-20020a5d4241000000b0031408243788mr5810507wrr.27.1688293052281; 
 Sun, 02 Jul 2023 03:17:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFBCAOu7OFCNVzqZx1EnJFwPsYWJLgCib6uWdV2rObYQHRV8UfoOTb9ppNV4eEbFaDED779ww==
X-Received: by 2002:a5d:4241:0:b0:314:824:3788 with SMTP id
 s1-20020a5d4241000000b0031408243788mr5810498wrr.27.1688293051928; 
 Sun, 02 Jul 2023 03:17:31 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d9-20020a5d6dc9000000b0030ae53550f5sm22677128wrz.51.2023.07.02.03.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 03:17:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 2/2] drm: Make fbdev emulation select FB_CORE instead
 of depends on FB
In-Reply-To: <CAMuHMdWQ3FcmyCd-mWOWVAXzgoOX8wBD8-LbRwjNkC=sz3y27g@mail.gmail.com>
References: <20230701214503.550549-1-javierm@redhat.com>
 <20230701214503.550549-3-javierm@redhat.com>
 <2e1af219-a31c-4284-b50a-662f65c8a736@app.fastmail.com>
 <CAMuHMdWQ3FcmyCd-mWOWVAXzgoOX8wBD8-LbRwjNkC=sz3y27g@mail.gmail.com>
Date: Sun, 02 Jul 2023 12:17:30 +0200
Message-ID: <87sfa6aa85.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Arnd,
>
> On Sun, Jul 2, 2023 at 12:07=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wro=
te:
>> On Sat, Jul 1, 2023, at 23:44, Javier Martinez Canillas wrote:
>> > Now that the fbdev core has been split in FB_CORE and FB, make DRM fbd=
ev
>> > emulation layer to just select the former.
>> >
>> > This allows to disable the CONFIG_FB option if is not needed, which wi=
ll
>> > avoid the need to explicitly disable each of the legacy fbdev drivers.
>> >
>> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> > ---
>> >
>> > Changes in v2:
>> > - Make CONFIG_DRM_FBDEV_EMULATION to select FB_CORE (Thomas Zimmermann=
).
>> >
>> >  drivers/gpu/drm/Kconfig | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> > index afb3b2f5f425..d9b1710e3ad0 100644
>> > --- a/drivers/gpu/drm/Kconfig
>> > +++ b/drivers/gpu/drm/Kconfig
>> > @@ -132,7 +132,7 @@ config DRM_DEBUG_MODESET_LOCK
>> >  config DRM_FBDEV_EMULATION
>> >       bool "Enable legacy fbdev support for your modesetting driver"
>> >       depends on DRM_KMS_HELPER
>> > -     depends on FB=3Dy || FB=3DDRM_KMS_HELPER
>> > +     select FB_CORE
>>
>> This will unfortunately force FB_CORE=3Dy even with DRM=3Dm, it would be=
 nice
>> to allow both to be loadable modules. Any of these should work:
>>

Right, I missed that. Thanks for pointing that out.

>> a) Add another hidden symbol like
>>
>> config DRM_FB_CORE
>>       def_tristate DRM && DRM_FBDEV_EMULATION
>>       select FB_CORE
>
> More complexity to keep track of...
>

Yes, I would avoid this option as well.

>>
>> b) move the 'select' to DRM
>>
>> config DRM
>>       tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI s=
upport)"
>>       select FB_CORE if DRM_FBDEV_EMULATION
>
> I prefer this one, as it keeps the select close to the user.
>

Agreed with Geert that this is the best option.

> BTW, the tristate help text can use some overhaul ;-)
>

Indeed :) I will add a preparatory patch to this series improving that
prompt text.

>> c) Remove the 'select' and instead use the default
>>
>> config FB_CORE
>>      def_tristate FB || (DRM && DRM_FBDEV_EMULATION)
>
> Adding it here means this patch would touch two subsystems.
>

Yeah. Even when in practice we push changes for drivers/video and
drivers/gpu/drm in drm-misc, I agree that option (b) is better.

> Gr{oetje,eeting}s,
>
>                         Geert
>
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

