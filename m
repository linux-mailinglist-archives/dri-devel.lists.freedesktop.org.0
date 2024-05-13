Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AAB8C4484
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9023B10E05D;
	Mon, 13 May 2024 15:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MMkj7nai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05E510E05D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:48:40 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3c9a0042e7dso649088b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 08:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715615317; x=1716220117;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3IRhSxtiuRG6Rrg6F2hEDkcNkh2AC1QxGibS7snE1k=;
 b=MMkj7naiWxoO/SRiBvEY0ba8yWzbfyitZYl3lvuNhgVgG8pvKqFCSdcQvQef4fnEPe
 5qSY3koxeSEOnCvZpuV+EZ4fFCoIjdiBxsi/0W168HuaKAtWJH6y+zxZAS47enAzM/aS
 JIJ/sVGwfJ0vYgdzPv0RKo8wedd8EwRcNAZus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715615317; x=1716220117;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3IRhSxtiuRG6Rrg6F2hEDkcNkh2AC1QxGibS7snE1k=;
 b=WTcLFqn7PGcnyARbp0cBqK6ejLsWZloqhcpfpviWoyh65mDPHmYaU8XSHIen8OUVKl
 rQyHQ56YsHXNCa3AE1QCGSkN/LtUfxCyLJCtXJu2SxK7j/AeHV1+PNj7+6S7CSLO9f4f
 ghaFXLkY1VxBf1fxFIMLjeMYGYNalB/xK1iOikZYaDSRtOEIGCNqAlVHn+Zwn0a80VNn
 d+ByjxEMZ/mWxYItshq22gkCK516uIWKXJywq2JNVzqLuJPhvnlhH/viCB9RrgjQyroC
 ZmR2W00QRXSjBZcSPODSL41yXkrkywsh0hXr+BsnZn9ZlEohxp7Keyw1aHdzls8rG3hz
 vz5g==
X-Gm-Message-State: AOJu0YyhgE2AXVXNHFkbIgE05N40upMezmfNP8v45u5plio2MNhw0VmK
 CItRK2Cm6nkGcXZJ9til6MO1+NMYN8Uq6/5XV2fOgt7sY/rPuImilDQvg3JYa5PjOZjKz4sE/QE
 =
X-Google-Smtp-Source: AGHT+IE2bZpTLM/e+Px+Q0GUzWHgmc+cYvFRDcIxYgyigc0yVINYxZGaE9Gh9twn0JBGc9RJhdPhpw==
X-Received: by 2002:a05:6808:1916:b0:3c9:95e2:b080 with SMTP id
 5614622812f47-3c997069950mr13509030b6e.25.1715615317045; 
 Mon, 13 May 2024 08:48:37 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com.
 [209.85.160.176]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1cd271sm44035726d6.101.2024.05.13.08.48.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 08:48:36 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-43df9ac3ebcso725231cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 08:48:35 -0700 (PDT)
X-Received: by 2002:a05:622a:2293:b0:43d:f77b:7aa2 with SMTP id
 d75a77b69052e-43e094b1f0bmr4810231cf.6.1715615314713; Mon, 13 May 2024
 08:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240508205222.2251854-1-dianders@chromium.org>
 <20240508135148.v4.4.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
 <20240513-solemn-yak-of-refinement-cb778a@penduick>
In-Reply-To: <20240513-solemn-yak-of-refinement-cb778a@penduick>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 May 2024 08:48:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWV7O-FkO56af5-ae5qdb40p_x_yUQ3NDuJKRKzF5BWA@mail.gmail.com>
Message-ID: <CAD=FV=UWV7O-FkO56af5-ae5qdb40p_x_yUQ3NDuJKRKzF5BWA@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, 
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Jani Nikula <jani.nikula@linux.intel.com>, Hsin-Yi Wang <hsinyi@google.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Brian Norris <briannorris@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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

On Mon, May 13, 2024 at 2:30=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Wed, May 08, 2024 at 01:51:46PM -0700, Douglas Anderson wrote:
> > Through a cooperative effort between Hsin-Yi Wang and Dmitry
> > Baryshkov, we have realized the dev_err() in the
> > mipi_dsi_*_write_seq() macros was causing quite a bit of bloat to the
> > kernel. Let's hoist this call into drm_mipi_dsi.c by adding a "chatty"
> > version of the functions that includes the print. While doing this,
> > add a bit more comments to these macros making it clear that they
> > print errors and also that they return out of _the caller's_ function.
> >
> > Without any changes to clients this gives a nice savings. Specifically
> > the macro was inlined and thus the error report call was inlined into
> > every call to mipi_dsi_dcs_write_seq() and
> > mipi_dsi_generic_write_seq(). By using a call to a "chatty" function,
> > the usage is reduced to one call in the chatty function and a function
> > call at the invoking site.
> >
> > Building with my build system shows one example:
> >
> > $ scripts/bloat-o-meter \
> >   .../before/panel-novatek-nt36672e.ko \
> >   .../after/panel-novatek-nt36672e.ko
> > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-4404 (-4404)
> > Function                                     old     new   delta
> > nt36672e_1080x2408_60hz_init               10640    6236   -4404
> > Total: Before=3D15055, After=3D10651, chg -29.25%
> >
> > Note that given the change in location of the print it's harder to
> > include the "cmd" in the printout for mipi_dsi_dcs_write_seq() since,
> > theoretically, someone could call the new chatty function with a
> > zero-size array and it would be illegal to dereference data[0].
> > There's a printk format to print the whole buffer and this is probably
> > more useful for debugging anyway. Given that we're doing this for
> > mipi_dsi_dcs_write_seq(), let's also print the buffer for
> > mipi_dsi_generic_write_seq() in the error case.
> >
> > It should be noted that the current consensus of DRM folks is that the
> > mipi_dsi_*_write_seq() should be deprecated due to the non-intuitive
> > return behavior. A future patch will formally mark them as deprecated
> > and provide an alternative.
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v4:
> > - Update wording as per Linus W.
> >
> > Changes in v3:
> > - Rebased upon patch to remove ratelimit of prints.
> >
> > Changes in v2:
> > - Add some comments to the macros about printing and returning.
> > - Change the way err value is handled in prep for next patch.
> > - Modify commit message now that this is part of a series.
> > - Rebased upon patches to avoid theoretical int overflow.
> >
> >  drivers/gpu/drm/drm_mipi_dsi.c | 56 ++++++++++++++++++++++++++++++++++
> >  include/drm/drm_mipi_dsi.h     | 47 +++++++++++++++-------------
> >  2 files changed, 82 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_=
dsi.c
> > index 795001bb7ff1..8593d9ed5891 100644
> > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > @@ -764,6 +764,34 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_dev=
ice *dsi, const void *payload,
> >  }
> >  EXPORT_SYMBOL(mipi_dsi_generic_write);
> >
> > +/**
> > + * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an er=
ror log
> > + * @dsi: DSI peripheral device
> > + * @payload: buffer containing the payload
> > + * @size: size of payload buffer
> > + *
> > + * Like mipi_dsi_generic_write() but includes a dev_err_ratelimited()
>
> You mention in both functions that it's calling dev_err_ratelimited() ...
>
> > + * call for you and returns 0 upon success, not the number of bytes se=
nt.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
> > +                               const void *payload, size_t size)
> > +{
> > +     struct device *dev =3D &dsi->dev;
> > +     ssize_t ret;
> > +
> > +     ret =3D mipi_dsi_generic_write(dsi, payload, size);
> > +     if (ret < 0) {
> > +             dev_err(dev, "sending generic data %*ph failed: %zd\n",
> > +                     (int)size, payload, ret);
>
> ... but it doesn't.

Whoops, thanks for catching this! I'll plan to send a v5 tomorrow to
fix this and then I'll still plan to land the series on Thursday
unless anything major comes up.

-Doug
