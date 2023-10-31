Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232957DCA43
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 10:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFFC10E447;
	Tue, 31 Oct 2023 09:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCC210E447
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 09:56:29 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-5a7d9d357faso53435897b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 02:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698746188; x=1699350988;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YNZBHyiLRY+gCpq29CudcvsFOdjkuZ4E9FiQic5rKGY=;
 b=T2Enh0NmIgbZHGJTt4uqcHiFMY8YAUGLB8g88WLj6AVpxX/hiIb3MklT3jchds+/Qz
 8MFxbTWH2CxGpSTgnwbqWNgC57xCK4S9xG1ZEHO+nXsEzAb1iKfdI5fckVwtZGvkzxL6
 DXpp5r4EdmhjbHMcUwJmxte6NbjQ6magQeF+y0W8LtR38Q7mBw2PUUB0CcsYM3otLlg3
 Lwt3Phzidm0SJl6gy/LlM3Lv0vU3jGrQ7jfQqJL3RS89YVdkRiUIjNVWT3EpdERJubM8
 +JlqwDpgLGYl9BwzBeGzTfFf+g7cB7IkiGzPpHCSpcpA7nvXdSlUF4SqoVQQ4G9f0bu+
 XSvw==
X-Gm-Message-State: AOJu0YypJeSk3UEuGCzP/4gDtKxoIUguJygFCRaQCWvgtyCB8L1MDYsg
 oQgRcmKM3Vm0ftmsl9vbyX9DnhyzAZnWHA==
X-Google-Smtp-Source: AGHT+IEzS8bBHfgqvW5DTF0/Ofr2/SPyHGXZHjxUnhtNhQ3G7oPwJEhsk9/BjkJL4eMqXdNhesw8OA==
X-Received: by 2002:a81:c80a:0:b0:5a7:b918:26be with SMTP id
 n10-20020a81c80a000000b005a7b91826bemr11275722ywi.15.1698746188183; 
 Tue, 31 Oct 2023 02:56:28 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 f129-20020a0dc387000000b005a8c392f498sm577699ywd.82.2023.10.31.02.56.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 02:56:27 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-d852b28ec3bso4846966276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 02:56:27 -0700 (PDT)
X-Received: by 2002:a25:cb47:0:b0:d9a:6855:14cd with SMTP id
 b68-20020a25cb47000000b00d9a685514cdmr11085901ybg.39.1698746187360; Tue, 31
 Oct 2023 02:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231020225338.1686974-1-javierm@redhat.com>
 <b048247c-75e9-488e-a4f3-b227a38bca5e@redhat.com>
 <87v8aso1ha.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87v8aso1ha.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Oct 2023 10:56:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLf=H7QWaUXrN17ABw9eE1MjBdzFEM0AhMNj8_ULSz+Q@mail.gmail.com>
Message-ID: <CAMuHMdVLf=H7QWaUXrN17ABw9eE1MjBdzFEM0AhMNj8_ULSz+Q@mail.gmail.com>
Subject: Re: [PATCH] drm/ssd130x: Fix possible uninitialized usage of
 crtc_state variable
To: Javier Martinez Canillas <javierm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Fri, Oct 27, 2023 at 11:33=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> > On 21/10/2023 00:52, Javier Martinez Canillas wrote:
> >> Avoid a possible uninitialized use of the crtc_state variable in funct=
ion
> >> ssd132x_primary_plane_atomic_check() and avoid the following Smatch wa=
rn:
> >>
> >>      drivers/gpu/drm/solomon/ssd130x.c:921 ssd132x_primary_plane_atomi=
c_check()
> >>      error: uninitialized symbol 'crtc_state'.
> >
> > That looks trivial, so you can add:
> >
> > Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
> >
>
> Pushed to drm-misc (drm-misc-next). Thanks!

Looks like you introduced an unintended

    (cherry picked from commit 9e4db199e66d427c50458f4d72734cc4f0b92948)

?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
