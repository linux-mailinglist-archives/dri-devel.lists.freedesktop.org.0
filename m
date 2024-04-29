Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603EE8B64BE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 23:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61A110E01F;
	Mon, 29 Apr 2024 21:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hO3OeuB/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E9510E01F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 21:42:59 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3c86f066256so420153b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 14:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714426975; x=1715031775;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqnFNN8zPFgAcPpgK4V26OF8GBtrp6I1yBRCL/sHKGw=;
 b=hO3OeuB/sLxPNzXaIXiUA33Nq4J6HuX+xnAt+wQj0VQUN/fBOg/bowELLQux08Ld7c
 sk/2ydFhnUMLkhLXMwiHl+s7wouJCeAg+gONty2pyxQh7jugTFRkGvDOx+PIjMfLQ+X2
 WE4CeZdSx2uVo2xFJLxmTLcy3Ob99dR/lOHpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714426975; x=1715031775;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqnFNN8zPFgAcPpgK4V26OF8GBtrp6I1yBRCL/sHKGw=;
 b=tI04ssrB4lEs/+bS4sP6Dj1McYEO7FvGb85X10eCEVFNvKzJFyv3CAipC1u32gjIB8
 bTSfAPfkmzXwYEiJYnEQvBIX5T+02lZC9hkLNohscK9lAdbNMGzejkuVagmDnedaKTeB
 DNG20//f+qJ8GAuHO1wvBREF+834udQc8bTwTF7RBFNhe7CFUYq9uXZ1RudfFaTJ8uzX
 v9g/nWV6V4t4JacevO6v5kJoUJuaqynLCP5fyQsx/i9U2aDRXjq9g0QY+Jv6Hmx0YFRE
 I+IMjGqXZX18f2iv4Z8Ys6fOIkObhu5s7uAARmlb4sTOZgSDIjfxHTIW/N7zCJNHLN9o
 ujug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl0l8IP3tjRAM+yzSTHVPpmzMp6v4CxR813cWcfyuC3JjZ5TWpaLTikqMxw6glzut/eB3ZR8HXFqjxW0JmeE3U4jkGZ6hLaLTYHnBBkrBe
X-Gm-Message-State: AOJu0YxuGnvGYobP50muH+tmGOAe3jozjGkSNabEWcxNa2dU0deL4g9E
 Sf/4VWdnqyeq2dcRD6LFd3Z3eSiq6tdLc8wwjVDcCeaOAJHOWbwBS1izwIDGqnMcriidhLEyXOI
 =
X-Google-Smtp-Source: AGHT+IHtrU89YDBY/QEFuynvhVyzy2bmPGk/hxyPNtOMPVrOVQSPfXWQpZ1i/2oPjjpRNjZBWythoQ==
X-Received: by 2002:a05:6808:1912:b0:3c7:3cc:4401 with SMTP id
 bf18-20020a056808191200b003c703cc4401mr1323621oib.7.1714426975258; 
 Mon, 29 Apr 2024 14:42:55 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180]) by smtp.gmail.com with ESMTPSA id
 q7-20020ad44027000000b006a0cc2b29d9sm1542211qvp.11.2024.04.29.14.42.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 14:42:54 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-43989e6ca42so44831cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 14:42:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7tGP4DtWLzuMJ9d4U3CpuILvIKnm4nbonGQ1esHJJBsUF8lFw1er+MZZjuXP9NH100wbTqUTc+2btserepD/KLV0l2WqGvuIjBsdie1Dn
X-Received: by 2002:a05:622a:1886:b0:43a:bcee:5b7f with SMTP id
 v6-20020a05622a188600b0043abcee5b7fmr79306qtc.24.1714426973449; Mon, 29 Apr
 2024 14:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.1.I30fa4c8348ea316c886ef8a522a52fed617f930d@changeid>
 <CAA8EJpog5yn5kiabJOZRipTx--onH9cepPe0dD4nA=Hm0aZS+g@mail.gmail.com>
 <20240427062202.GA1137299@ravnborg.org>
In-Reply-To: <20240427062202.GA1137299@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Apr 2024 14:42:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLoz1S+iQG6qowEGUV_oSF7tcHuXhsw3_0sn30byC0ZA@mail.gmail.com>
Message-ID: <CAD=FV=XLoz1S+iQG6qowEGUV_oSF7tcHuXhsw3_0sn30byC0ZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm/mipi-dsi: Fix theoretical int overflow in
 mipi_dsi_dcs_write_seq()
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>,
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Jani Nikula <jani.nikula@linux.intel.com>, Hsin-Yi Wang <hsinyi@google.com>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Joel Selvaraj <jo@jsfamily.in>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 26, 2024 at 11:22=E2=80=AFPM Sam Ravnborg <sam@ravnborg.org> wr=
ote:
>
> On Sat, Apr 27, 2024 at 04:44:33AM +0300, Dmitry Baryshkov wrote:
> > On Sat, 27 Apr 2024 at 02:59, Douglas Anderson <dianders@chromium.org> =
wrote:
> > >
> > > The mipi_dsi_dcs_write_seq() macro makes a call to
> > > mipi_dsi_dcs_write_buffer() which returns a type ssize_t. The macro
> > > then stores it in an int and checks to see if it's negative. This
> > > could theoretically be a problem if "ssize_t" is larger than "int".
> > >
> > > To see the issue, imagine that "ssize_t" is 32-bits and "int" is
> > > 16-bits, you could see a problem if there was some code out there tha=
t
> > > looked like:
> > >
> > >   mipi_dsi_dcs_write_seq(dsi, cmd, <32767 bytes as arguments>);
> > >
> > > ...since we'd get back that 32768 bytes were transferred and 32768
> > > stored in a 16-bit int would look negative.
> > >
> > > Though there are no callsites where we'd actually hit this (even if
> > > "int" was only 16-bit), it's cleaner to make the types match so let's
> > > fix it.
> > >
> > > Fixes: 2a9e9daf7523 ("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq =
macro")
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > > Changes in v2:
> > > - New
> > >
> > >  include/drm/drm_mipi_dsi.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > > index 82b1cc434ea3..b3576be22bfa 100644
> > > --- a/include/drm/drm_mipi_dsi.h
> > > +++ b/include/drm/drm_mipi_dsi.h
> > > @@ -337,12 +337,12 @@ int mipi_dsi_dcs_get_display_brightness_large(s=
truct mipi_dsi_device *dsi,
> > >         do {                                                         =
      \
> > >                 static const u8 d[] =3D { cmd, seq };                =
        \
> > >                 struct device *dev =3D &dsi->dev;                    =
        \
> > > -               int ret;                                             =
      \
> > > +               ssize_t ret;                                         =
      \
> > >                 ret =3D mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(=
d));    \
> > >                 if (ret < 0) {                                       =
      \
> > >                         dev_err_ratelimited(                         =
      \
> > >                                 dev, "sending command %#02x failed: %=
d\n", \
> > > -                               cmd, ret);                           =
      \
> > > +                               cmd, (int)ret);                      =
      \
> >
> > Please consider using %zd instead
>
> Hi Douglas,
> please consider the above for all the pathces, there are more places
> where a cast can be dropped.

Sure, I'll change in the next version. I personally prefer the %d with
an "int" type because technically we're printing an error code and
errors are int-sized. ...but I don't feel strongly and I guess there's
a tiny chance some bug in the code could lead to a negative value
that's more useful as 64-bits than 32-bits. ;-)

I will note that I will still need a cast in some of the later patches
for "%*ph" since, I believe, the size passed for the "*" in a printf
format string is defined to be an int, not a size_t or ssize_t.

-Doug
