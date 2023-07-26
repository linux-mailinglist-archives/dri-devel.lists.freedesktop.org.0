Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B916D7638F1
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 16:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DC410E088;
	Wed, 26 Jul 2023 14:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A4B10E088
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 14:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690381369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XCmORRhwTSEI+3MwcMPtlwr1Cd6MltMc9emE/qHgjM0=;
 b=DFvNm9Kb4Ri8beD79pfHPA4hi0qI9wbVfcx+BuOAuZEh6S2Wi9AWSdAITW+81UvUukRMIz
 OImVtgxoY0cgY6IgymLolAJHs4CGeCUhlk8djutOIRPeo6JUW3yjT7xXaP+Ph5493pPytn
 qZjjNb+z+E/4Rh9QGQHuJ/+kHzEopjw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-N0Gt8xfKMeWOHW83ySX6Jw-1; Wed, 26 Jul 2023 10:22:48 -0400
X-MC-Unique: N0Gt8xfKMeWOHW83ySX6Jw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fbdf341934so40369325e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690381367; x=1690986167;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gyMSRcxy/2ogHzH4JMQXVtrL8+3uUTaWkvxjprHFoKs=;
 b=G2XpB5UqFrto1CgFPT2li1pe1Y3ypQMRv1em76bWa6b0JSw7YgetJZInEVi+0SHLML
 hQd435G6YLUvsMXDK86hiyLkxtKrNA8BDpLjwz21t3meJEb8b2AybkcaStOJudxGQJdi
 fHfN1r5lkq25XzWMz6vwO5o8wAxc79eZbOb+xyT7xMvWAnqI5lugC4r1U/soybJdsyjl
 JS9EyDW+0IosA720FW1mTqbLQznFL+eyfYDzpBluaNj3A/s+foAX0Jz4ReKYvegEioXX
 eE2W/7kg5oJUjArDn9MqI+G4oSwkHcFsG8cVk/aoov30s1Jy01BOP2oqySGwEKiAGg3X
 YxFA==
X-Gm-Message-State: ABy/qLZZ8lSt9UZHEGW0LNKtJxrRctm8R6q+chP/s231HQfPdNTydwtK
 z1NXjkwGYp4DuoLO+Z65kmaTvAoJlRp8XKqZDHDloZMrgKeoqCipM7tr/pSNRjelio90g5vXtYT
 idQxv0jiqfGaKdTv8DWid4wcLNbpOkB1ci5W1
X-Received: by 2002:a05:600c:2103:b0:3fb:424b:ef6e with SMTP id
 u3-20020a05600c210300b003fb424bef6emr1545555wml.23.1690381367203; 
 Wed, 26 Jul 2023 07:22:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHwlkw4QFA8DVFagB6nk6sE5O9bwZ9pUqXtBRJxlocFY1P40URvBe2tyo6KMa3n5l0r5SfjRw==
X-Received: by 2002:a05:600c:2103:b0:3fb:424b:ef6e with SMTP id
 u3-20020a05600c210300b003fb424bef6emr1545539wml.23.1690381366875; 
 Wed, 26 Jul 2023 07:22:46 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q8-20020a1ce908000000b003fba6709c68sm2174121wmc.47.2023.07.26.07.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 07:22:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <mripard@kernel.org>
Subject: Re: [PATCH v4] drm/ssd130x: Allocate buffers in the plane's
 .atomic_check callback
In-Reply-To: <CAMuHMdX54sYfv2HJQZxMD_O2XT_nmuoQEE2iTbWkJ9-QvfAWYQ@mail.gmail.com>
References: <20230721070955.1170974-1-javierm@redhat.com>
 <CAMuHMdVxF80mdTaiXA6Y8Gd59Z7pxkoEphB4ohpVcK1q-+Yy=g@mail.gmail.com>
 <n4fmda4zw4vuezvwva35tgma3yqhdvb253q2tfdyauoxbfqshx@s6fsa7de6g5s>
 <CAMuHMdXtOozswqujA1h2spL8J86n65Q6=+z=5Jbb0nSXaBwqzA@mail.gmail.com>
 <874jlqlv5v.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdX+J848ckG2JqsuDkRcWzRypw_Kv=0G+Hc329xstu_nqQ@mail.gmail.com>
 <g6bu3b26evk464x4cn77xnzjiuotsq7pfvyakfvwnir5e3ihnk@2jh4dd56fsza>
 <CAMuHMdX54sYfv2HJQZxMD_O2XT_nmuoQEE2iTbWkJ9-QvfAWYQ@mail.gmail.com>
Date: Wed, 26 Jul 2023 16:22:45 +0200
Message-ID: <87cz0e4uru.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> Hi Maxime,
>
> On Wed, Jul 26, 2023 at 3:54=E2=80=AFPM Maxime Ripard <mripard@kernel.org=
> wrote:
>> On Wed, Jul 26, 2023 at 02:33:06PM +0200, Geert Uytterhoeven wrote:
>> > > >> Also, Javier pointed me to a discussion you had on IRC about usin=
g devm
>> > > >> allocation here. We can't really do that. KMS devices are only fr=
eed
>> > > >> once the last userspace application closes its fd to the device f=
ile, so
>> > > >> you have an unbounded window during which the driver is still cal=
lable
>> > > >> by userspace (and thus can still trigger an atomic commit) but th=
e
>> > > >> buffer would have been freed for a while.
>> > > >
>> > > > It should still be safe for (at least) the data_array buffer. That
>> > > > buffer is only used to store pixels in hardware format, and immedi=
ately
>> > > > send them to the hardware.  If this can be called that late, it wi=
ll
>> > > > fail horribly, as you can no longer talk to the hardware at that p=
oint
>> > > > (as ssd130x is an i2c driver, it might actually work; but a DRM dr=
iver
>> > > >  that calls devm_platform_ioremap_resource() will crash when writi=
ng
>> > > >  to its MMIO registers)?!?
>> > >
>> > > At the very least the SPI driver will fail since the GPIO that is us=
ed to
>> > > toggle the D/C pin is allocated with devm_gpiod_get_optional(), but =
also
>> > > the regulator, backlight device, etc.
>> > >
>> > > But in any case, as mentioned it is only relevant if the data_array =
buffer
>> > > is allocated at probe time, and from Maxime's explanation is more co=
rrect
>> > > to do it in the .atomic_check handler.
>> >
>> > You need (at least) data_array for clear_screen, too, which is called
>> > from .atomic_disable().
>>
>> I'm not sure I get what your concern is?
>>
>> Even if we entirely disable the plane, the state will not have been
>> destroyed yet so you still have at least access to the data_array from
>> the old state.
>
> Currently, clearing the screen is done from the plane's .atomic_disable()
> callback, so the plane's state should be fine.
>
> But IIUIC, DRM allows the user to enable/disable the display without
> creating any plane first, so clearing should be handled in the CRTC's

But it's needed to be clared in this case? Currently the power on/off
is done in the encoder's .atomic_{en,dis}able() but the actual panel
clear is only done for the plane disable as you mentioned.

> .atomic_disable() callback instead? Then, would we still have access
> to valid plane state?
>

If the clear has to be moved to the CRTC atomic enable/disable, then
the driver should be reworked to not use the data_array and instead
just allocate a zero'ed buffer and pass that as you proposed.

But again that's something that could be done later as another patch.

> Thanks!
>
> Gr{oetje,eeting}s,
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

