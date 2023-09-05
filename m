Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 184A0792EC6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 21:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2524910E1A4;
	Tue,  5 Sep 2023 19:20:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A9810E1A4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 19:20:44 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99c93638322so36985266b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 12:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693941642; x=1694546442;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MsWRVBFEL3St6TG3Dmm9kVxN1Ow0LMYu4TSTEd74xWc=;
 b=ofHuahPrY/Qebbx5H+C20cR1P5M7+z1kxCjK1UQM2dI+8vo4zpD+8VXhgKn44EMp88
 e3hxcMK2cARdu9jV5u8SPxDFwnZK/4oAC7rPSU6QVHpcrLaHx+kutbq5UG/6aQVuHznh
 dvdH1UilL8iU39Q07MKkELkrQPBHcp7Ag6pJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693941642; x=1694546442;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MsWRVBFEL3St6TG3Dmm9kVxN1Ow0LMYu4TSTEd74xWc=;
 b=IY/qL+wP49VvbxIXW0H/0s4JT2UteLhAUJhKAk+uw8aQ2UFSBvyCkc5bO0X7evNhOj
 Mlku9nxaSm7bejAOKVICy5dGnZXo/t78G8uiQdOnHrw3b8iBn9+pjDlylHtRhtw1r438
 +yv75tMkumh8IjzONDezW/I15PiboH6v+O413wr+f0plhpvBZt9aVioOybc+mjzmYfI0
 dcL9NP7i/U215hGYk1zXEdwfk/gxLNxOo+2nGOsfPip1UMyMmwIhN5dnpwsN8UrXuDZT
 k1mQvN6TMy0DoE8n70HYgNJT8fRjYH77MVsuDbe3T5fNa281TSicL3Lj/W44UKW0Oy9r
 AW4Q==
X-Gm-Message-State: AOJu0Yxik4DnnYtX0SlyYdoBUh0JZ1azA7llbdiqk605q2hyNNTmGAmK
 omp0FnWZUvpQpcE+uY3RYbmFRD+oqkDyX2mk18J8HATd
X-Google-Smtp-Source: AGHT+IEocsoidtG6bEBGLIUk6T6SINT5skaRYE5kinjV4HTaKtl363240sdS9yZ6DCX8BRif+6i98w==
X-Received: by 2002:a17:907:2d14:b0:9a1:c69c:9388 with SMTP id
 gs20-20020a1709072d1400b009a1c69c9388mr657257ejc.37.1693941642100; 
 Tue, 05 Sep 2023 12:20:42 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 z17-20020a170906241100b0099cf91fe297sm8143692eja.13.2023.09.05.12.20.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Sep 2023 12:20:42 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-402c80b71ecso20115e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 12:20:42 -0700 (PDT)
X-Received: by 2002:a05:600c:4fd1:b0:3fe:ef25:8b86 with SMTP id
 o17-20020a05600c4fd100b003feef258b86mr26556wmq.4.1693941331939; Tue, 05 Sep
 2023 12:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230804210644.1862287-1-dianders@chromium.org>
 <CACRpkdaF4GqHtdJeBed0JGVXNkpA9dvbPgGMK=Qy0_RZyvOtNQ@mail.gmail.com>
In-Reply-To: <CACRpkdaF4GqHtdJeBed0JGVXNkpA9dvbPgGMK=Qy0_RZyvOtNQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Sep 2023 12:15:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UFuUsrrZmkL8_RL5WLvkJryDwRSAy_PWTa-hX_p0dF+Q@mail.gmail.com>
Message-ID: <CAD=FV=UFuUsrrZmkL8_RL5WLvkJryDwRSAy_PWTa-hX_p0dF+Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Ondrej Jirman <megous@megous.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Purism Kernel Team <kernel@puri.sm>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org,
 Stefan Mavrodiev <stefan@olimex.com>, Jianhua Lu <lujianhua000@gmail.com>,
 dri-devel@lists.freedesktop.org, Robert Chiras <robert.chiras@nxp.com>,
 Ondrej Jirman <megi@xff.cz>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Aug 10, 2023 at 1:23=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, Aug 4, 2023 at 11:07=E2=80=AFPM Douglas Anderson <dianders@chromi=
um.org> wrote:
>
> > As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> > prepared/enabled in drm_panel"), we want to remove needless code from
> > panel drivers that was storing and double-checking the
> > prepared/enabled state. Even if someone was relying on the
> > double-check before, that double-check is now in the core and not
> > needed in individual drivers.
> >
> > This series attempts to do just that. While the original grep, AKA:
> >   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
> >   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> > ...still produces a few hits after my series, they are _mostly_ all
> > gone. The ones that are left are less trivial to fix.
> >
> > One of the main reasons that many panels probably needed to store and
> > double-check their prepared/enabled appears to have been to handle
> > shutdown and/or remove. Panels drivers often wanted to force the power
> > off for panels in these cases and this was a good reason for the
> > double-check. As part of this series a new helper is added that uses
> > the state tracking that the drm_panel core is doing so each individual
> > panel driver doesn't need to do it.
> >
> > This series changes a lot of drivers and obviously the author can't
> > test on all of them. The changes here are also not completely trivial
> > in all cases. Please double-check your drivers carefully to make sure
> > something wasn't missed. After looking at over 40 drivers I'll admit
> > that my eyes glazed over a little.
> >
> > I've attempted to organize these patches like to group together panels
> > that needed similar handling. Panels that had code that didn't seem to
> > match anyone else got their own patch. I made judgement calls on what
> > I considered "similar".
> >
> > As noted in individual patches, there are some cases here where I
> > expect behavior to change a little bit. I'm hoping these changes are
> > for the better and don't cause any problems. Fingers crossed.
> >
> > I have at least confirmed that "allmodconfig" for arm64 doesn't fall
> > on its face with this series. I haven't done a ton of other testing.
>
> The series:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Please send out a non-RFC version, this is clearly the right thing to
> do.

As per the long discussion in response to patch #4, I think there are
still open questions about the later patches in this series. However,
I could land patches #1 - #3 if there are no concerns. Would anyone
object if I just landed them straight from this series with Linus's
review, or would I need to repost just patches #1 - #3 without the
"RFC" tag?

Thanks!

-Doug
