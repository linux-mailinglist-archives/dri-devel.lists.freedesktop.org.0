Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4F37DCAE1
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9440510E465;
	Tue, 31 Oct 2023 10:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3D7810E464
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 10:31:22 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5a8628e54d4so48662947b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 03:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698748282; x=1699353082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/sHseqslpAHK7KgV7P/BcLuw8uc0JkMkTgTl4k752Ts=;
 b=xNf8eA0zwes1tLDzhwFcZA9j6Z/DE/FMRBCeoB1pEV1FHoba/DHT9lRpSIbD47d3U2
 EgczaHaIr1vsOa7UgqjMc1ayHXz1zWTlHH7bI4pX6NctHgwgiGjXtZfFRooPJQhqkECg
 Y5I3SI+C5luuZtf9RbRLUBfnU5OLIzx+IdVEyAPRhvm6MaX7++GtZ9Up0O1rU+/iYi2V
 9faKpKLblDPfbvIuzmSTCOJelmUT/qMIJ0Grh8cUgQWoP6BJlGFl61fbGGuBHdwio1Yb
 oCN2BB6m0LECtwFDRkXPCtEaRhax9OcHFyuETlaL8iijcCkNu6RM/qtBRLYpz+2jug8l
 xFQQ==
X-Gm-Message-State: AOJu0Yx1H+i5cFGlkpf8xOVagQwUz7NNFpxnNe+Zu5ciLIKkdMnLGyJP
 h30oTZqneMLe+bn0RkwliezOUfiVYwinmQ==
X-Google-Smtp-Source: AGHT+IHubE2jwPsxkHmSDWY+twZ0iuJRcZHTyHznPRvYy0iOCphoWKS0WxkUHTSN05scf//E09FxuA==
X-Received: by 2002:a81:4c58:0:b0:5a7:b4d1:c4dd with SMTP id
 z85-20020a814c58000000b005a7b4d1c4ddmr1493231ywa.5.1698748281731; 
 Tue, 31 Oct 2023 03:31:21 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 v18-20020a81a552000000b00592548b2c47sm595254ywg.80.2023.10.31.03.31.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 03:31:21 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-5b321286567so4839457b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 03:31:20 -0700 (PDT)
X-Received: by 2002:a5b:ec1:0:b0:da0:3a37:61d5 with SMTP id
 a1-20020a5b0ec1000000b00da03a3761d5mr1526353ybs.4.1698748280706; Tue, 31 Oct
 2023 03:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20231020225338.1686974-1-javierm@redhat.com>
 <b048247c-75e9-488e-a4f3-b227a38bca5e@redhat.com>
 <87v8aso1ha.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVLf=H7QWaUXrN17ABw9eE1MjBdzFEM0AhMNj8_ULSz+Q@mail.gmail.com>
 <87lebjksoj.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87lebjksoj.fsf@minerva.mail-host-address-is-not-set>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 31 Oct 2023 11:31:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdYm6Opyhgte7CaScs_jdPNUqrQTbPCMSQXqkKpKTd8w@mail.gmail.com>
Message-ID: <CAMuHMdXdYm6Opyhgte7CaScs_jdPNUqrQTbPCMSQXqkKpKTd8w@mail.gmail.com>
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

On Tue, Oct 31, 2023 at 11:11=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> > On Fri, Oct 27, 2023 at 11:33=E2=80=AFAM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:
> >> Jocelyn Falempe <jfalempe@redhat.com> writes:
> >> > On 21/10/2023 00:52, Javier Martinez Canillas wrote:
> >> >> Avoid a possible uninitialized use of the crtc_state variable in fu=
nction
> >> >> ssd132x_primary_plane_atomic_check() and avoid the following Smatch=
 warn:
> >> >>
> >> >>      drivers/gpu/drm/solomon/ssd130x.c:921 ssd132x_primary_plane_at=
omic_check()
> >> >>      error: uninitialized symbol 'crtc_state'.
> >> >
> >> > That looks trivial, so you can add:
> >> >
> >> > Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
> >> >
> >>
> >> Pushed to drm-misc (drm-misc-next). Thanks!
> >
> > Looks like you introduced an unintended
> >
> >     (cherry picked from commit 9e4db199e66d427c50458f4d72734cc4f0b92948=
)
> >
> > ?
> >
>
> No, that's intended. It's added by the `dim cherry-pick` command, since I
> had to cherry-pick to drm-misc-next-fixes the commit that was already in
> the drm-misc-next branch.
>
> You will find that message in many drm commits, i.e:
>
> $ git log --oneline --grep=3D"(cherry picked from commit" drivers/gpu/drm=
/ | wc -l
> 1708

Ah, so that's why it's (way too) common to have merge conflicts between
the fixes and non-fixes drm branches :-(

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
