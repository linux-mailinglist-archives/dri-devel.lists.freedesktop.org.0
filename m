Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E7763959
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 16:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA9610E483;
	Wed, 26 Jul 2023 14:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1308310E483
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690382310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ye7hRekV//CCkfLEQj+FAJgEacfN7JP6fBvi36p+I3o=;
 b=KIfHVf8AOVRuFTMD3BQHiF+U3Wz31WNUPJQY9ClSFy2iW9/ObDWBUidb5QN5GbJ+tEhpoe
 zywv9g2rJcKdGYpS6CeZDlpDWX9dSZ8tz34JXE7PAgg7p9T6i70I0zHbLjqnf8CUYsZV3o
 m2D9knyDfGIEvd9YKgIB5vnMMxW7ziE=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-tLNvgIESO0mVWD6AtSyD9A-1; Wed, 26 Jul 2023 10:38:28 -0400
X-MC-Unique: tLNvgIESO0mVWD6AtSyD9A-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b70bfc97e4so64217771fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690382307; x=1690987107;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bkeaL9XjDhpA8ZoKIDSlYWZH67zFgnFmAVvVA6vDvLc=;
 b=VKgiirW20k2WkC7/LTmB7a5fbIjbAQMZZjp3ojlOGbGp3698MxOdThdKnCDwMP4zR7
 TmCvoyadlpCcr3nGI3Mli+XwDUprcWJqOwqQHT9T+r0yCCqRJs+QAr2eyPuVhxWyGXY0
 j4oM5vF9pwKAb0rrtCKqJSDWjTwlLVle3dayPiiNtn09tg3/hDFwUlxmTih47nMzN35Y
 GGrtzadHIMNu71cPBi7Ob9xVqrf3C2nGd7xMYLtzsacLZAayoqls5C1AHqakki4ufpl4
 QSR7gsWNlYG8jkjCLuz0wWC5E7Y12Uk+yzynx1bendLZY/ihDUBP4E5KTLIoN4b6SANk
 YLwA==
X-Gm-Message-State: ABy/qLaHQm710q003ylyuXngd82JOLmS3I9u4ptSdglVtOY0ztJotFVm
 8+3I/I2wuioGTmKhKk1+qCm4o1G+eaEB97qqa5nSZ+W3yIilVjyyzweh94ZcktZ66yHCFLRGNHx
 Jx3NNOI2Ep9JrVRWAyAFcvfYu99Ho
X-Received: by 2002:a2e:8810:0:b0:2b6:e2c1:6cda with SMTP id
 x16-20020a2e8810000000b002b6e2c16cdamr1575391ljh.46.1690382307310; 
 Wed, 26 Jul 2023 07:38:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGOuyT1UUU626piEDgoGBZcB6J7nJcxqWYnLsqj2xprB+BOzJ2DO5S92UP5O+CzqhCxOwR+Kg==
X-Received: by 2002:a2e:8810:0:b0:2b6:e2c1:6cda with SMTP id
 x16-20020a2e8810000000b002b6e2c16cdamr1575370ljh.46.1690382306936; 
 Wed, 26 Jul 2023 07:38:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m25-20020a7bce19000000b003fbe36a4ce6sm2233242wmc.10.2023.07.26.07.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 07:38:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 1/2] drm/ssd130x: Inline the
 ssd130x_buf_{alloc,free}() function helpers
In-Reply-To: <CAMuHMdUbOJ5_iEcV=G9ogZJ36T2qj8=tnutXcVZ=Sn-0=dqGug@mail.gmail.com>
References: <20230726105433.389740-1-javierm@redhat.com>
 <CAMuHMdUbOJ5_iEcV=G9ogZJ36T2qj8=tnutXcVZ=Sn-0=dqGug@mail.gmail.com>
Date: Wed, 26 Jul 2023 16:38:25 +0200
Message-ID: <87a5vi4u1q.fsf@minerva.mail-host-address-is-not-set>
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
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Wed, Jul 26, 2023 at 12:55=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> There is only a single caller for both helper functions and these don't =
do
>> much other than allocate and free two buffers, so let's just inline them=
.
>>
>> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>

Pushed to drm-misc (drm-misc-next). Thanks!

> Gr{oetje,eeting}s,
>
>                         Geert

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

