Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E5F8B271F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 19:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF45A11A666;
	Thu, 25 Apr 2024 17:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="eDJBWLBJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11E011A666
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 17:05:09 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-436ffd27871so7890611cf.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 10:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714064708; x=1714669508;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V8rNWf+tVRhhxpwmfSTwyL/s0CV48BkTtOb2pzwR4zM=;
 b=eDJBWLBJ6YQEwXZP9NcMdyzK5R/UauCgUSrgmbmyPmgytAlHArBhZ5po15/5WKcZIQ
 GNyUaW38d0ZyYiGuqi8TqdU3hqN75MK/3MV8N/nKFHIx6YtixlDGyKsSuSYhovbFoz5T
 82l1Xarkpx2PHcc5v637EEyPrqmbxZg1J8WLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714064708; x=1714669508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V8rNWf+tVRhhxpwmfSTwyL/s0CV48BkTtOb2pzwR4zM=;
 b=reaRNmZVCL7ku9K4noC0XfWu0oXO5vx6+RJSozpAKExWsO8qYO0S4/CKF35aA9qJWU
 0cNCV3hiWzl02VfA2iUGetM9L88bzqBoHioswJNKzbwJuxHETOVJOdjz86k2c/vI3Um3
 dMxI7TVPg+YD0w20bFUKARrn+Pn1D2FrY4sQF+K+0i8UuswAAh10cx83kw+oy2RdcsqD
 NWPUiJzKZXZVthm9Eypdgxet6OhXJBbPxe2H+V7pHcQA7s8CvXWh3pNkT8jT+bk72nbw
 7x5st7078HjCPfELOG2LbEawY7tT5qNsamJgWT57FvMyFti6d6X7HkxBO1sO1Bq5tcys
 MDXg==
X-Gm-Message-State: AOJu0YyGLS2L8rYim0iIrBkg209Bgh9y4UdnbCJdfh/JurciygiAr1FZ
 7c72JPotMCxHjzJ+g51hVKqI/xL9VNIEvq4ncBPOLHMih2TaTNo1ZyoHOVTbFivkgXgBJWb2GTs
 =
X-Google-Smtp-Source: AGHT+IEh3vmAfRfn2+OJYiZS22ZsrqwU5v5o+8RH9cc2x/3klbMNr/hM/85/NzFJrrcBATR6dmiQ3g==
X-Received: by 2002:ac8:5f90:0:b0:437:8f7b:e3f0 with SMTP id
 j16-20020ac85f90000000b004378f7be3f0mr173825qta.59.1714064707919; 
 Thu, 25 Apr 2024 10:05:07 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com.
 [209.85.160.174]) by smtp.gmail.com with ESMTPSA id
 d19-20020ac86693000000b004349bb95e01sm7136168qtp.26.2024.04.25.10.05.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 10:05:07 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-439b1c72676so15981cf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 10:05:06 -0700 (PDT)
X-Received: by 2002:a05:622a:30d:b0:43a:5c5e:2e49 with SMTP id
 q13-20020a05622a030d00b0043a5c5e2e49mr174171qtw.8.1714064706366; Thu, 25 Apr
 2024 10:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
 <87pludq2g0.fsf@intel.com>
In-Reply-To: <87pludq2g0.fsf@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Apr 2024 10:04:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+Pcr+voBkcfeE_UC+ukN_hLXgoqMk0watROWRXe_2dg@mail.gmail.com>
Message-ID: <CAD=FV=W+Pcr+voBkcfeE_UC+ukN_hLXgoqMk0watROWRXe_2dg@mail.gmail.com>
Subject: Re: [PATCH] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linus.walleij@linaro.org, 
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

On Thu, Apr 25, 2024 at 1:19=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> > @@ -279,6 +281,8 @@ enum mipi_dsi_dcs_tear_mode {
> >
> >  ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
> >                                 const void *data, size_t len);
> > +ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
> > +                                      const void *data, size_t len);
> >  ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
> >                          const void *data, size_t len);
> >  ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *d=
ata,
> > @@ -317,14 +321,10 @@ int mipi_dsi_dcs_get_display_brightness_large(str=
uct mipi_dsi_device *dsi,
> >  #define mipi_dsi_generic_write_seq(dsi, seq...)                       =
         \
> >       do {                                                             =
      \
> >               static const u8 d[] =3D { seq };                         =
        \
> > -             struct device *dev =3D &dsi->dev;                        =
        \
> >               int ret;                                                 =
      \
> > -             ret =3D mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));   =
        \
> > -             if (ret < 0) {                                           =
      \
> > -                     dev_err_ratelimited(dev, "transmit data failed: %=
d\n", \
> > -                                         ret);                        =
      \
> > +             ret =3D mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(=
d));    \
> > +             if (ret < 0)                                             =
      \
> >                       return ret;                                      =
      \
> > -             }                                                        =
      \
> >       } while (0)
>
> The one thing that I've always disliked about these macros (even if I've
> never actually used them myself) is that they hide control flow from the
> caller, i.e. return directly. You don't see that in the code, it's not
> documented, and if you wanted to do better error handling yourself,
> you're out of luck.

Yeah, I agree that it's not the cleanest. That being said, it is
existing code and making the existing code less bloated seems worth
doing.

I'd also say that it feels worth it to have _some_ solution so that
the caller doesn't need to write error handling after every single cmd
sent. If we get rid of / discourage these macros that's either going
to end us up with ugly/verbose code or it's going to encourage people
to totally skip error handling. IMO neither of those are wonderful
solutions.

While thinking about this there were a few ideas I came up with. None
of them are amazing, but probably they are better than the hidden
"return" like this. Perhaps we could mark the current function as
"deprecated" and pick one of these depending on what others opinions
are:

1. Use "goto" and force the caller to give a goto target for error handling=
.

This is based on an idea that Dmitry came up with, but made a little
more explicit. Example usage:

int ret;

ret =3D 0;
mipi_dsi_dcs_write_seq_goto(dsi, &ret, HX83102_SETSPCCMD, 0xcd,
                            some_cmd_failed);
mipi_dsi_dcs_write_seq_goto(dsi, &ret, HX83102_SETMIPI, 0x84,
                            some_cmd_failed);
mipi_dsi_dcs_write_seq_goto(dsi, &ret, HX83102_SETSPCCMD, 0x3f,
                            some_cmd_failed);
mipi_dsi_dcs_write_seq_goto(dsi, &ret, HX83102_SETVDC, 0x1b, 0x04,
                            some_cmd_failed);

...

some_cmd_failed:
  pr_err("Commands failed to write: %d", ret);
  return ret;
}

One downside here is that you can't easily tell which command failed
to put it in the error message. A variant of this idea (1a?) could be
to hoist the print back into the write command. I'd want to pick one
or the other. I guess my preference would be to hoist the print into
the write command and if someone really doesn't want the print then
they call mipi_dsi_dcs_write_buffer() directly.

---

2. Accept that a slightly less efficient handling of the error case
and perhaps a less intuitive API, but avoid the goto.

Essentially you could pass in "ret" and have the function be a no-op
if an error is already present. Something like this:

void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_device *dsi,
const void *data, size_t len, int *accum_ret)
{
  if (*accum_ret)
    return;

  *accum_ret =3D mipi_dsi_dcs_write_buffer(dsi, data, len);
}

...and then the caller:

int ret;

ret =3D 0;
mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETSPCCMD, 0xcd, &ret);
mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETMIPI, 0x84, &ret);
mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETSPCCMD, 0x3f, &ret);
mipi_dsi_dcs_write_seq_multi(dsi, HX83102_SETVDC, 0x1b, 0x04, &ret);
if (ret)
  goto some_cmd_failed;

This has similar properties to solution #1.

---

3. Accept that callers don't want to error handling but just need a print.

I'm not 100% sure we want to encourage this. On the one hand it's
unlikely anyone is really going to be able to reliably recover super
properly from an error midway through a big long command sequence. On
the other hand, this means we can't pass the error back to the caller.
In theory the caller _could_ try to handle errors by resetting / power
cycling things, so that's a real downside.

Example usage:

mipi_dsi_dcs_write_seq_chatty(dsi, HX83102_SETSPCCMD, 0xcd);
mipi_dsi_dcs_write_seq_chatty(dsi, HX83102_SETMIPI, 0x84);
mipi_dsi_dcs_write_seq_chatty(dsi, HX83102_SETSPCCMD, 0x3f);
mipi_dsi_dcs_write_seq_chatty(dsi, HX83102_SETVDC, 0x1b, 0x04);

---

I think I'd lean towards #1a (user passes goto label and we include
the error print in the helper), but I'd personally be happy with any
of #1 or #2. I don't love #3.

> Be that as it may, the combo of ratelimited error printing and return on
> errors does not make much sense to me. If there's something to print,
> you bail out, that's it. I suspect we never hit the ratelimit.

Yeah, I'm in favor of removing the ratelimit.


> You might even want to try *only* changing the ratelimited printing to a
> regular error message, and see if the compiler can combine the logging
> to a single exit point in the callers. Ratelimited it obviously can't
> because every single one of them is unique.

It wasn't quite as good. Comparing the "after" solution (AKA applying
$SUBJECT patch) vs. _not_ taking $SUBJECT patch and instead changing
dev_err_ratelimited() to dev_err().

$ scripts/bloat-o-meter \
   .../after/panel-novatek-nt36672e.ko \
  .../noratelimit/panel-novatek-nt36672e.ko
add/remove: 0/0 grow/shrink: 1/0 up/down: 3404/0 (3404)
Function                                     old     new   delta
nt36672e_1080x2408_60hz_init                7260   10664   +3404
Total: Before=3D11669, After=3D15073, chg +29.17%

...so $SUBJECT patch is still better.

---

Where does that leave us? IMO:

a) If others agree, we should land $SUBJECT patch. It doesn't change
the behavior at all and gives big savings. It adds an extra function
hop, but presumably the fact that we have to fetch _a lot_ less stuff
from RAM might mean we still get better performance (likely it doesn't
matter anyway since this is not hotpath code).

b) Atop this patch, we should consider changing dev_err_ratelimited()
to dev_err(). It doesn't seem to make lots of sense to me to ratelimit
this error.

c) Atop this patch, we should consider making the two existing macros
"deprecated" in favor of a new macro that makes the control flow more
obvious.

How does that sound to folks?

-Doug
