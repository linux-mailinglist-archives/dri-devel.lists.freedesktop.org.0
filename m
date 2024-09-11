Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F16975B54
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 22:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72F10EA88;
	Wed, 11 Sep 2024 20:07:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bU1NWxTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8457B10EA82
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 20:07:15 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-4581e7f31eeso1009311cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 13:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726085233; x=1726690033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZEn5VtcIx0UfHxk1R69xjZ7686TsPVIV/uPXWmkBAA=;
 b=bU1NWxTuWyQY287gqNNt4RY4GDq1l+edW9hk/mw/XxuXC4xsiwMDd2ibwzODGscJ+K
 cWKMjkjibDFkFxz8MFbBiCkiayLs27TM9SNfq3AdzgfiZmzmpbQZMCOtvDWMHnFq47cg
 cZAeSIlB9SVzBFnMzaS1QuO9rmmrTVijq9svc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726085233; x=1726690033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZEn5VtcIx0UfHxk1R69xjZ7686TsPVIV/uPXWmkBAA=;
 b=gKChd1DgRpgms1mB8M+EqMOFmI9xSof3c3wvK0BI0r0xxaXXTEf67btzTh/6bP2L+p
 M89nJmU9MXaa7rAmpVOfdg5aRRWD7sP65Gf1lyY/fiem1Br47qJ4uoKto+Kdq8mCRyb7
 rlSbKxTSPPGvwgjEq85g7bzJ8GiGiAJJ7oRiX3sNPZRwDsfFuj5GhAmo0/ldIgaF+In/
 V9DieSmU18pjmnvV7nxCh9/dSJgTkQ6dNEO3+s3V6KVdMz0Z1bUCNQ8wkewgir7lG3yx
 hj1M4yGHUOhFVZE3Bn3ERBIxqOwkO/lvVrV7Xl5PRp0aeQAuUTI+Y4qsC5P9bWLldXnN
 +Tzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ1f01kQKJ2vEoBsrbS6FajU/2wtmlKkzFO1U3bBd1C9WU32v5RCEiItrCKBdzO3snUSkDLv67kOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdVNsHLh6dIcxDS1aoDqMTCrTcuH3TGWJXa4rOYK6ANc2qv9YR
 J38JyYwEmGQ84m9YKghbckXOCddzZz9AMcDO73uqwZWqfU8s79mkAjnOGcPLIQZGXIVb4SI2b38
 =
X-Google-Smtp-Source: AGHT+IG/kQAgMyJtFLKW7w8YZ+i5STnEQVInUxIl3sOzE+bzs4ELdmzq97iAG9Blf9oyMt6T08Xnlw==
X-Received: by 2002:a05:622a:ce:b0:458:3a9e:4a0 with SMTP id
 d75a77b69052e-458603e10a4mr5675881cf.41.1726085233022; 
 Wed, 11 Sep 2024 13:07:13 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com.
 [209.85.219.50]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-45822f95895sm44798601cf.89.2024.09.11.13.07.12
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 13:07:12 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6c53bc6f9faso1307116d6.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 13:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXiRhtK+6KvmY3cxNeKd75k8OZUvqYoHmyhp1Kt0Ene3MBhynGBv8+7u2islA7fT9kPqjMFv24uyuw=@lists.freedesktop.org
X-Received: by 2002:a05:6214:5d85:b0:6c1:6a57:e7ee with SMTP id
 6a1803df08f44-6c57351a691mr8511636d6.16.1726085231567; Wed, 11 Sep 2024
 13:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240904141521.554451-1-tejasvipin76@gmail.com>
 <0bb94cc0-dd72-4da7-b0b6-9e1fe712709b@quicinc.com>
 <0e3bf87b-7d82-44eb-88d2-fddc8e33dd25@quicinc.com>
 <330174f9-bead-4411-b05e-ea9c009f765c@gmail.com>
 <CAD=FV=XsHuhprN-ijw8-ZmOKV6CnCrR=s4X4L57p9J8e02MTBg@mail.gmail.com>
 <8f0227fb-1457-4464-810a-c6b915d9349a@linaro.org>
In-Reply-To: <8f0227fb-1457-4464-810a-c6b915d9349a@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Sep 2024 13:07:00 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WW4TCKY6-XGnGbf+x4T39OBAcUtaRo_WVzd=HTJpCkxg@mail.gmail.com>
Message-ID: <CAD=FV=WW4TCKY6-XGnGbf+x4T39OBAcUtaRo_WVzd=HTJpCkxg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83112a: transition to mipi_dsi wrapped
 functions
To: neil.armstrong@linaro.org
Cc: Tejas Vipin <tejasvipin76@gmail.com>,
 Abhishek Tamboli <abhishektamboli9@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Javier Martinez Canillas <javierm@redhat.com>
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

On Wed, Sep 11, 2024 at 12:41=E2=80=AFAM <neil.armstrong@linaro.org> wrote:
>
> On 10/09/2024 23:19, Doug Anderson wrote:
> > Hi,
> >
> > On Sat, Sep 7, 2024 at 1:32=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.=
com> wrote:
> >>
> >> On 9/7/24 3:53 AM, Jessica Zhang wrote:
> >>>
> >>>
> >>> On 9/6/2024 3:14 PM, Jessica Zhang wrote:
> >>>>
> >>>>
> >>>> On 9/4/2024 7:15 AM, Tejas Vipin wrote:
> >>>>> Changes the himax-hx83112a panel to use multi style functions for
> >>>>> improved error handling.
> >>>>>
> >>>>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> >>>>
> >>>> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>>
> >>> Hi Tejas,
> >>>
> >>> Just a heads up, it seems that this might be a duplicate of this chan=
ge [1]?
> >>>
> >>> Thanks,
> >>>
> >>> Jessica Zhang
> >>>
> >>> [1] https://patchwork.freedesktop.org/patch/612367/?series=3D138155&r=
ev=3D1
> >>
> >> Ah, thanks for letting me know. I hadn't realized someone else had
> >> started working on this too.
> >>
> >> However, I would argue that my patch [2] is a better candidate for mer=
ging
> >> because of the following reasons:
> >>
> >> 1) Removes unnecessary error printing:
> >> The mipi_dsi_*_multi() functions all have inbuilt error printing which
> >> makes printing errors after hx83112a_on unnecessary as is addressed in
> >> [2] like so:
> >>
> >>> -     ret =3D hx83112a_on(ctx);
> >>> +     ret =3D hx83112a_on(ctx->dsi);
> >>>        if (ret < 0) {
> >>> -             dev_err(dev, "Failed to initialize panel: %d\n", ret);
> >>>                gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> >>>                regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx-=
>supplies);
> >>> -             return ret;
> >>>        }
> >>
> >> [2] also removes the unnecessary dev_err after regulator_bulk_enable a=
s was
> >> addressed in [3] like so:
> >>
> >>>        ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->=
supplies);
> >>> -     if (ret < 0) {
> >>> -             dev_err(dev, "Failed to enable regulators: %d\n", ret);
> >>> +     if (ret < 0)
> >>>                return ret;
> >>> -     }
> >>
> >> 2) Better formatting
> >>
> >> The mipi_dsi_dcs_write_seq_multi statements in [1] aren't formatted
> >> quite right according to what has been done so far. They are written a=
s
> >> such in [1]:
> >>
> >>> +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
> >>>                               0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa=
4, 0x0e);
> >>
> >> Where they should be written as such in [2]:
> >>
> >>> +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
> >>> +                                  0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d=
, 0xa4, 0x0e);
> >>
> >> All in all, the module generated using my patch ends up being a teensy
> >> bit smaller (1% smaller). But if chronology is what is important, then
> >> it would at least be nice to see the above changes as part of Abhishek=
's
> >> patch too. And I'll be sure to look at the mail in the drm inbox now
> >> onwards :p
> >>
> >> [1] https://patchwork.freedesktop.org/patch/612367/?series=3D138155&re=
v=3D1
> >> [2] https://lore.kernel.org/all/20240904141521.554451-1-tejasvipin76@g=
mail.com/
> >> [3] https://lore.kernel.org/all/CAD=3DFV=3DXRZKL_ppjUKDK61fQkWhHiQCJLf=
mVBS7wSo4sUux2g8Q@mail.gmail.com/
> >
> > I would tend to agree that Tejas's patch looks slightly better, but
> > Abhishek's patch appears to have been posted first.
> >
> > Neil: any idea what to do here? Maybe a Co-Developed-by or something?
> > ...or we could land Abhishek and Tejas could post a followup for the
> > extra cleanup?
>
> Yeah usually I take the first one when they are equal, but indeed Tejas
> cleanup up a little further and better aligned the parameters so I think
> Tejas's one is a better looking version.
>
> In this case we should apply Teja's one, nothing personal Abhishek!

Pushed to drm-misc-next:

[1/1] drm/panel: himax-hx83112a: transition to mipi_dsi wrapped functions
      commit: 32e5666b8a4d0f2aee39a0b2f8386cf9f86a8225
