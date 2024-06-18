Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3390D0E2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 15:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA3110E129;
	Tue, 18 Jun 2024 13:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jO9Sxi5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BC610E129
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 13:37:17 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-796df041d73so384833985a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718717836; x=1719322636;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQlUnRddyv5Ix+rCUJ5MBByRljWGE0pbXOEFTO2x3Ug=;
 b=jO9Sxi5+E1NcVcuucmS7TkiFyT6ylzQ0Rkz1G7anfs3XgtcOdmmfZaS3dd3tClf480
 /W6zDtXY6KLhEpuUxmEHKxxzbGFFozjy77Y63N0zUl1CkQCyYlk2VKy62l7D2408fCLH
 6k0DU6PbuXbN7LyNWlWbapbQ7ytoEUFvMi8lU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718717836; x=1719322636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uQlUnRddyv5Ix+rCUJ5MBByRljWGE0pbXOEFTO2x3Ug=;
 b=cWvp4ggRYZ5PezOBEmnSYx0G9bZOi9XoBoZqWKOOLwKzLhFrPJPqWouZAWkBGstY80
 agVgSDZzYnxhsiOmwUfICeBtNk7vvfvbZAPe48JYXcb6nVcfRbfxDBCE1prBaeBJ6z3t
 jgAGGHrwOKFLGLSB4+kQAFEdi4CGupy7CWeliDTauCCEYJKLR7mEc7eYIhI0z+laxym0
 ZawHt6TgS4A2/3KJY8VxJ3DkBvES0qB774nl5bXDgbeUfu/kXvM7qLFH0WCGUOGBuCSd
 +TrTVnhJgbd1l8jYXu1+RGEhHCeojv4Epgb6nk11zogPZuRHCNTjvcHuktKCQEu/qely
 kjZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaS0mmDSg4eAdelOB7uTj+/rGg18NLP9JtVu6zIo1exdI5MLGwkJ6oGryo44A0vyUvzIsJ73xkKKbglhuvAxRuAjEgJ9ll18VRnNdmXmmL
X-Gm-Message-State: AOJu0YzyYiiBHY4Aj/afxw/KnBLKcF+mLJq2JQtzBIZ6YaO+r99Cv1ye
 oaLbXyxPbPPZQtrIuCXOD4VTGLDiH/+DPoMNAtlFIjjvFpmF8KaZ5lop5mSj3QCixkMz4zLSyMM
 =
X-Google-Smtp-Source: AGHT+IEiK9PzUmjwZlYCqcJNhIC0ozqLCnQAKuo3sd0wdX7SiatxLrqE3TpaRdRzGuaKmqQ+j8+l4g==
X-Received: by 2002:a05:620a:404a:b0:795:597f:6447 with SMTP id
 af79cd13be357-798d241cf62mr1452103985a.28.1718717835827; 
 Tue, 18 Jun 2024 06:37:15 -0700 (PDT)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-798ab4c1841sm519894385a.60.2024.06.18.06.37.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 06:37:15 -0700 (PDT)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-44056f72257so356371cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:37:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUMbZH3yPLbhO51A1UOWHGBtMi7nhWcVVcP5ExlptLceHl7UmPq8WZFkvvlczHheu3o8VPfsIAXzOw35XNVFTh6W6mkxMUtkDnAKu/NfYUd
X-Received: by 2002:ac8:7d0b:0:b0:442:1504:c264 with SMTP id
 d75a77b69052e-4449dca56b6mr3233511cf.23.1718717834474; Tue, 18 Jun 2024
 06:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240615093758.65431-1-tejasvipin76@gmail.com>
 <CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com>
 <aa757abb-9883-4a46-a5e1-a7d4d5b044eb@gmail.com>
In-Reply-To: <aa757abb-9883-4a46-a5e1-a7d4d5b044eb@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jun 2024 06:36:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XX-_YA6ZjiwfqttL5y4i+QRLJn=BQUM2ugSa8HNkEUtg@mail.gmail.com>
Message-ID: <CAD=FV=XX-_YA6ZjiwfqttL5y4i+QRLJn=BQUM2ugSa8HNkEUtg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Jun 18, 2024 at 5:25=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> >>         rm692e5_reset(ctx);
> >>
> >> -       ret =3D rm692e5_on(ctx);
> >> -       if (ret < 0) {
> >> -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> >> +       dsi_ctx.accum_err =3D rm692e5_on(ctx);
> >> +       if (dsi_ctx.accum_err) {
> >> +               dev_err(dev, "Failed to initialize panel: %d\n", dsi_c=
tx.accum_err);
> >
> > I'd probably change rm692e5_on() to take the "dsi_ctx" as a parameter
> > and then you don't need to declare a new one there.
> >
> > ...also, you don't need to add an error message since rm692e5_on()
> > will have already printed one (since the "multi" style functions
> > always print error messages for you).
>
> I'm guessing that the change about regulator_bulk_enable and
> rm692e5 should also be applied to all the other panels where
> similar behavior occurs?

Yeah, I'd say so.


> >>                 gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> >>                 regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx-=
>supplies);
> >> -               return ret;
> >> +               return dsi_ctx.accum_err;
> >
> > Not new for your patch, but it seems odd that we don't do this error
> > handling (re-assert reset and disable the regulator) for errors later
> > in the function. Shouldn't it do that? It feels like the error
> > handling should be in an "err" label and we should end up doing that
> > any time we return an error code... What do you think?
>
> Personally I don't think this is necessary because imo labels
> only get useful when there's a couple of them and/or they're
> jumped to multiple times. I don't think either would happen in
> this particular function. But I guess if you have some convention
> in mind, then it could be done?

I think mostly my suggestion was just that we should also do the
gpiod_set_value_cansleep() and regulator_bulk_disable() at the end of
rm692e5_prepare() if `dsi_ctx.accum_err` is non-zero. Then you've got
two places doing the same thing: here and at the end of the function.

...oh, but everything below here is already a no-op if the error is
set. ...so I guess looking at it closer, my suggestion wouldn't be a
"goto" but would instead be to just move the gpio/regulator call to
the end. What do you think?

-Doug
