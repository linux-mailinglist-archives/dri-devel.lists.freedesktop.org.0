Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D116C8B5B33
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 16:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22CC10FEF5;
	Mon, 29 Apr 2024 14:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VUOdq5mY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4484610FEF5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 14:26:59 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-43ae9962c17so2896701cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714400816; x=1715005616;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqDQQoT9vxUaIMkwbyFExGHs1F5iC7Nw1z6NMheJx1s=;
 b=VUOdq5mYpLywzp3WMHeXEsEsEZYskurzbQH8TrqZ06J9h1x+txdUphRlgKYeg9gvrY
 9oPnOuGY73NmRRApY6nN1HTt+lYmEYxIrtEfuUFH3peO+yOceXUCCIKOf7mL3lBtn7bg
 Wd9OTieQ2eGd/ZBF0FHfb0NSQNPlQdkvQTcoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714400816; x=1715005616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NqDQQoT9vxUaIMkwbyFExGHs1F5iC7Nw1z6NMheJx1s=;
 b=ngO+METVIcFppmwBErSqZ54nMwAqBGameBvXOP6eayBgPmx8+RuJ7ba1Ba22PWYtgl
 N93Fc52LM6vOi1mdlbmYCljUIEUIcKW1WwbURazLYaOlpA76tZjlYkuY7e3TebxrxqOS
 T07VNsL3XLlfqOwKFXEEj0hp1AgWhqaq2a12sF94Wf2ZbS9dlc3B15TkI3cP2x2Joecn
 8QTu6lgR7K8ozZMTobxWoBgcf8LhwYsCWYzjxVF+supJDwjuus4dLiNmhXaQnLJ/yDk6
 rdMdJfZD8gD6y6JGslCRFbvfPLq4lfCVsGsfYrhu9yOmTuGGaqXPFlzIrzlrLhLvhuFf
 PzxQ==
X-Gm-Message-State: AOJu0YzGiDrA/I2LcymaDzaXF0UQmD9aOSB1g9Dw5m33QNT6nsjFllGI
 /kyN8GCwj1T9krSVNSJsJsbF2zzHHJC5x9oR5HQeC65G+zkKIxYeLNVjRqVq30WGvR/aK++U1XM
 =
X-Google-Smtp-Source: AGHT+IHqewhOTnnajzLI81g1wBSVD3Ib9rdUaAXr1y1u2kbmu+QVzXDnbHEU+0PyKvhpmiN51iEbfw==
X-Received: by 2002:ac8:59d5:0:b0:43a:a82d:4fa with SMTP id
 f21-20020ac859d5000000b0043aa82d04famr7600810qtf.15.1714400815880; 
 Mon, 29 Apr 2024 07:26:55 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 dn16-20020a05622a471000b00436cd19d996sm10415828qtb.87.2024.04.29.07.26.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 07:26:54 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-436ed871225so511271cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 07:26:53 -0700 (PDT)
X-Received: by 2002:a05:622a:14d:b0:439:a979:ccb2 with SMTP id
 v13-20020a05622a014d00b00439a979ccb2mr546226qtw.16.1714400812823; Mon, 29 Apr
 2024 07:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240426235857.3870424-1-dianders@chromium.org>
 <20240426165839.v2.4.Ie94246c30fe95101e0e26dd5f96e976dbeb8f242@changeid>
 <2af446d3-7834-4a6b-897b-b14c6bccff65@linaro.org>
In-Reply-To: <2af446d3-7834-4a6b-897b-b14c6bccff65@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Apr 2024 07:26:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V=EvEGp4tGDd-UQ1R=XkAwDn04ftd8oWU=UE=3Gi7SLQ@mail.gmail.com>
Message-ID: <CAD=FV=V=EvEGp4tGDd-UQ1R=XkAwDn04ftd8oWU=UE=3Gi7SLQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/mipi-dsi: Introduce
 mipi_dsi_*_write_seq_multi()
To: neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>, 
 lvzhaoxiong@huaqin.corp-partner.google.com, 
 Jani Nikula <jani.nikula@linux.intel.com>, Hsin-Yi Wang <hsinyi@google.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, Joel Selvaraj <jo@jsfamily.in>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
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

On Mon, Apr 29, 2024 at 2:38=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> > +/**
> > + * struct mipi_dsi_multi_context - Context to call multiple MIPI DSI f=
uncs in a row
> > + * @dsi: Pointer to the MIPI DSI device
> > + * @accum_err: Storage for the accumulated error over the multiple cal=
ls. Init
> > + *   to 0. If a function encounters an error then the error code will =
be
> > + *   stored here. If you call a function and this points to a non-zero
> > + *   value then the function will be a noop. This allows calling a fun=
ction
> > + *   many times in a row and just checking the error at the end to see=
 if
> > + *   any of them failed.
> > + */
> > +
> > +struct mipi_dsi_multi_context {
> > +     struct mipi_dsi_device *dsi;
> > +     int accum_err;
> > +};
>
> I like the design, but having a context struct seems over-engineered whil=
e we could pass
> a single int over without encapsulating it with mipi_dsi_multi_context.
>
> void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
>                                      const void *data, size_t len);
> vs
> void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_device *dsi, int *ac=
cum_err,
>                                      const void *data, size_t len);
>
> is the same, and it avoids having to declare a mipi_dsi_multi_context and=
 set ctx->dsi,
> and I'll find it much easier to migrate, just add a &ret and make sure re=
t is initialized to 0.

Yeah, I had the same reaction when Jani suggested the context style
[1] and I actually coded it up exactly as you suggest above. I then
changed my mind and went with the context. My motivation was that when
I tested it I found that using the context produced smaller code.
Specifically, from the description of this patch we see we end up
with:

Total: Before=3D10651, After=3D9663, chg -9.28%

...when I didn't have the context and I had the accum_err then instead
of getting ~9% smaller I believe it actually got ~0.5% bigger. This
makes some sense as the caller has to pass 4 parameters to each call
instead of 3.

It's not a giant size difference but it was at least some motivation
that helped push me in this direction. I'd also say that when I looked
at the code in the end the style grew on me. It's really not too
terrible to have one line in your functions that looks like:

struct mipi_dsi_multi_context ctx =3D { .dsi =3D boe->dsi };

...and if that becomes the canonical way to do it then it's really
hard to accidentally forget to initialize the error value. With the
other API it's _very_ easy to forget to initialize the error value and
the compiler won't yell at you. It also makes it very obvious to the
caller that this function is doing something a little different than
most Linux APIs with that error return.

So I guess I'd say that I ended up being pretty happy with the
"context" even if it does feel a little over engineered and I'd argue
to keep it that way. That being said, if you feel strongly about it
then we can perhaps get others to chime in to see which style they
prefer? Let me know what you think.


[1] https://lore.kernel.org/r/8734r85tcf.fsf@intel.com
