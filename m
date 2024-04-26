Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537E18B3BB6
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 17:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57EA31124C5;
	Fri, 26 Apr 2024 15:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YMSPQWTO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0023A1124C1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 15:35:48 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3bbbc6b4ed1so1432873b6e.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714145743; x=1714750543;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3tPCtKmB8e7QI9Lq/uJ6hWU4RympZM66D1lrj8aR8o=;
 b=YMSPQWTOdB/UT+wn2hI6s9S3rnfW2JOz3kiWXwjYaKbX6ezDeB5MK3xDeZM9nMRJDw
 szCIM/F0Nzi7Pv/HGqHLHkWF8lzBaB4NzDvulXiXX6R0FpUSzp6kyeWL2OCP7W0NBWKt
 9esSs3v4Fjm8hOiykYxJW3hr7Lc0Wwg9SvYtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714145743; x=1714750543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y3tPCtKmB8e7QI9Lq/uJ6hWU4RympZM66D1lrj8aR8o=;
 b=RXqLxLcbHk34vA5WYVjenMQIVOcpfEbhO7sxayepzcMoXpdFEI9JiRRkjKDI+q/8qn
 3OWqL6+LW6AnwJSsxx8bHTl14Cyk8ko3UyVOeutjGv7BX4uGmMhDGE8aNIm9iOe77sPp
 q922MW139K2DvySX141gpQZFke2KTTML/06WaIareB82nKMcEQmURWpdIxojS9fvyKzo
 GgqjQsu7FZMglWvX7k1Tu8H1mfXzAlc/qvMHYLj4qIV0R6qVxJRGFaViieHBQxjFNCQE
 GWDniNw6qCc1u5IE4mfu0Rr/e7fxK/6MGt+you9gQ/DdbI40h9uv/2bwqyrqWaIbrCyY
 ImJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZXraUUxWy1V32lxYrPtgR2DHY9Lgu1cKGwXerMDC9WrfaI4PmBEMXmOmieafxfHVY2wtH2fIIvj/Qk+Rt6ktM1HrmigKKTCkpC/KX7vCU
X-Gm-Message-State: AOJu0YzrWGaBTT7ul8nJ+6WG31gh2qPnGj+KL3rAU2WXTYMt+TBSNz2+
 uBSvw4wlFqVln2yqdIeJwTMsPBWe5h6UefS6bM80+9gDZfxrVgVyO7I7jpyV5p4WKiyHTpTDYxo
 =
X-Google-Smtp-Source: AGHT+IESl4deNB+MihHZwMIHFOasSArpa4S9gl4Q+byN70mYfAIgZN0je0sG/dRxAJh/mRzAzmxd6g==
X-Received: by 2002:a05:6808:f06:b0:3c6:6ba:c3a1 with SMTP id
 m6-20020a0568080f0600b003c606bac3a1mr3849999oiw.54.1714145743025; 
 Fri, 26 Apr 2024 08:35:43 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 l22-20020a05620a0c1600b007907ef72e1dsm3724222qki.36.2024.04.26.08.35.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 08:35:40 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-434ffc2b520so195791cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 08:35:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVanl6lpglV50iZHgFLFnsvPY0768++GX5jjmOAtXm5C1GMruqa4yrowfJj3wivZlSL62nrZehQcMbj3KgrbrhswjgW3roVaroRZ5iA/MMH
X-Received: by 2002:ac8:6895:0:b0:437:7a02:d66c with SMTP id
 m21-20020ac86895000000b004377a02d66cmr225822qtq.25.1714145739600; Fri, 26 Apr
 2024 08:35:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
 <87pludq2g0.fsf@intel.com>
 <CAD=FV=W+Pcr+voBkcfeE_UC+ukN_hLXgoqMk0watROWRXe_2dg@mail.gmail.com>
 <beqsovvdkvn63prt3c6b3epb6tachff35vpaf62dfkwof7kwht@u3p7bkv7owro>
In-Reply-To: <beqsovvdkvn63prt3c6b3epb6tachff35vpaf62dfkwof7kwht@u3p7bkv7owro>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 Apr 2024 08:35:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WxYoFYefdZ4PQ=QF5aHpeWoC3qM1b5d2vf_qBH90ZMQw@mail.gmail.com>
Message-ID: <CAD=FV=WxYoFYefdZ4PQ=QF5aHpeWoC3qM1b5d2vf_qBH90ZMQw@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linus.walleij@linaro.org, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, Hsin-Yi Wang <hsinyi@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, 
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

On Thu, Apr 25, 2024 at 8:03=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, Apr 25, 2024 at 10:04:49AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Apr 25, 2024 at 1:19=E2=80=AFAM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> > >
> > > > @@ -279,6 +281,8 @@ enum mipi_dsi_dcs_tear_mode {
> > > >
> > > >  ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
> > > >                                 const void *data, size_t len);
> > > > +ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *d=
si,
> > > > +                                      const void *data, size_t len=
);
> > > >  ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
> > > >                          const void *data, size_t len);
> > > >  ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, voi=
d *data,
> > > > @@ -317,14 +321,10 @@ int mipi_dsi_dcs_get_display_brightness_large=
(struct mipi_dsi_device *dsi,
> > > >  #define mipi_dsi_generic_write_seq(dsi, seq...)                   =
             \
> > > >       do {                                                         =
          \
> > > >               static const u8 d[] =3D { seq };                     =
            \
> > > > -             struct device *dev =3D &dsi->dev;                    =
            \
> > > >               int ret;                                             =
          \
> > > > -             ret =3D mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d))=
;           \
> > > > -             if (ret < 0) {                                       =
          \
> > > > -                     dev_err_ratelimited(dev, "transmit data faile=
d: %d\n", \
> > > > -                                         ret);                    =
          \
> > > > +             ret =3D mipi_dsi_generic_write_chatty(dsi, d, ARRAY_S=
IZE(d));    \
> > > > +             if (ret < 0)                                         =
          \
> > > >                       return ret;                                  =
          \
> > > > -             }                                                    =
          \
> > > >       } while (0)
>
>
> Reading the thread makes me wonder whether we should be going into
> slightly other direction:
>
> Add __must_check() to mipi_dsi_ writing functions,
>
> #define mipi_dsi_dcs_whatever_write(dsi, cmd, seq...)   \
>         ({                                              \
>                 static const u8 d[] =3D { cmd, seq };     \
>                 mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
>         })
>
> Then in panel drivers we actually have to explicitly handle the return
> code (either by dropping to the error label or by just returning an
> error).

Given the sheer number of init commands needed by some panels (see
j606f_boe_init_sequence() for instance) I'm still convinced that we
want something that allows people to write their init code in a way
that's not quite so verbose. It sounds as if Jani is OK w/ the
proposal of using the "accumulated return value" (proposal #2 I had).
I'm hoping you're OK w/ that too...

-Doug
