Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC41755F97
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 11:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A567C10E213;
	Mon, 17 Jul 2023 09:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FD610E214
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689586945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ceQGhU3Q6lPXE1UkwKN4clGf/gwccYZAeCnjr8dMuvU=;
 b=HZxvYAdKKO25qauQ9EfgZrF+G+5x9ymtoD6OPwo6nVcAG6ioFlkRh7kHTdviucEP82VqbS
 HZa1nrLOpGJ2d0AixP47P43+3FiymB7HeBkRUOFEbJFQ2ayI9slnyEN0gWCxrT0GvnmJ+9
 gE9Xv6KBAu4hw2qdzUBKCYbtJDo3wiw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-6lz2-_8UOvyiPT8e3wXFww-1; Mon, 17 Jul 2023 05:42:23 -0400
X-MC-Unique: 6lz2-_8UOvyiPT8e3wXFww-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3fbdf341934so24523425e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 02:42:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689586940; x=1692178940;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ceQGhU3Q6lPXE1UkwKN4clGf/gwccYZAeCnjr8dMuvU=;
 b=PdRijqC7TExHAXYyKDOJaKKJPvrJSBvMsrYg/ZurTUR+IhGKHzNPjMO0wYf43Vh4U+
 4N38FGUhsAahITBWLXB9JyHTg92i+AqfdE6cVl+SVNX7Gewj3fIQ/1wyi8IgjKx9uRXf
 xovMVHUU1oy+0JCPC2LUrHPdty3w9b3iYWG2jcBx6RTZigIPr1x9B8nHuA4Wb+fbFw9p
 3SIgLgmsQ7sVBn9VeS5znQ1n4iheQTbqgYAetf6vx1CDt7NuU/fgqEgSHJNUwuuBRnDy
 GjZTGKtxO9Eq5EUbDL27ZcQLON0ZaqY8kW23cSuH9NR8PG5MQc+ngfK/KWvdJLqh+qGJ
 kmCA==
X-Gm-Message-State: ABy/qLY+KveG7v6osCKEOgPPpvN/VOvPILLzFGYVOLN7fTTHHsP5Qq68
 RNEPtqdJwu9+dRtxpvMXnCfvDa5FNezHzejqB+M9lK+txloWu0C8KaWWPs1ofxW1AV28TZbl7/a
 A9AuZ61upO4rxR5Vy8SK47Olq551a
X-Received: by 2002:a05:600c:28c:b0:3fb:ff8f:2db0 with SMTP id
 12-20020a05600c028c00b003fbff8f2db0mr10562562wmk.39.1689586940620; 
 Mon, 17 Jul 2023 02:42:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHTJJG5upVMicqzpVz8fvJdGooqvgGRv53FMhG+ent1E5fHJyLuOsJImrX+EIolD7UCawPm2Q==
X-Received: by 2002:a05:600c:28c:b0:3fb:ff8f:2db0 with SMTP id
 12-20020a05600c028c00b003fbff8f2db0mr10562552wmk.39.1689586940260; 
 Mon, 17 Jul 2023 02:42:20 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 2-20020a05600c248200b003faef96ee78sm7662349wms.33.2023.07.17.02.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 02:42:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
In-Reply-To: <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>
References: <20230713163213.1028952-1-javierm@redhat.com>
 <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
 <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>
Date: Mon, 17 Jul 2023 11:42:19 +0200
Message-ID: <87h6q2kh6s.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert and Thomas,

> Hi Thomas,
>
> On Mon, Jul 17, 2023 at 10:48=E2=80=AFAM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:

[...]

>>
>> After some discussion on IRC, I'd suggest to allocate the buffer
>> somewhere within probe. So it will always be there when the plane code r=
uns.
>>
>> A full fix would be to allocate the buffer memory as part of the plane
>> state and/or the plane's atomic_check. That's a bit more complicated if
>> you want to shared the buffer memory across plane updates.
>
> Note that actually two buffers are involved: data_array (monochrome,
> needed for each update), and buffer (R8, only needed when converting
> from XR24 to R1).
>
> For the former, I agree, as it's always needed.
> For the latter, I'm afraid it would set a bad example: while allocating
> a possibly-unused buffer doesn't hurt for small displays, it would
> mean wasting 1 MiB in e.g. the repaper driver (once it has gained
> support for R1 ;^).
>

Maybe another option is to allocate on the struct drm_mode_config_funcs
.fb_create callback? That way, we can get the mode_cmd->pixel_format and
determine if only "data_array" buffer must be allocated or also "buffer".

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --=20
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

