Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F69744B7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 23:20:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E8AE10E926;
	Tue, 10 Sep 2024 21:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="lmxIP6aD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92A810E926
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 21:20:16 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7a99d23e036so341961385a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1726003213; x=1726608013;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qLUmgdzEq+2+OB6qY0gPHsSbUC+SX5+BHRNu1RdMAF0=;
 b=lmxIP6aDm0RdTKyFqgxGZnO93Wc1zjIGdWDqPPIhbJ3XeRqUet+AEkTBVaeh+4ku3P
 5Y4QgVkX+nBbaeS9lVsAlBZujESYWOwbgmaUMpLPQ3D3joVHiCrgTr8ttSY4dQU8AzUl
 VVD2rfO3AKUFTkmzV+4TofSqhilz+6/X+rsY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726003213; x=1726608013;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qLUmgdzEq+2+OB6qY0gPHsSbUC+SX5+BHRNu1RdMAF0=;
 b=jxD8lCKEXGXXWcNQA7HjNfZMoE9wXK7jSSpAyh1wWg/fcyErEEESNEDSt6U8IRkSJu
 IM7ER1O70IYpsTr9J5I/JIS3LiPe1F6of8sTKnVu8PTv+O3duYBb/lnyGTcX8FIf49x5
 vLpf8nXxo/5bmohsylUMg/7gTBh7on+mijkk8bde1NA0eVGSkr5qxs2fqXFeqh64M8z3
 v5sfZVUwU9bFEdDJOmDpaqPYnc7WeNow9d3F9BEoWUfDg+dhD+4//Ns1qvWIpDfRRnWS
 /F1GHPyyfxVcgxdf5V/djv2/Njsu1JGF//uLm2n+LPD/vfcKePJXVu+7IwGWV9gosuWb
 /mqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcyWV0O5s8tsoo42mWEqQjIK72asQum9MF5wFg/7e1KxB/UNU6axFyDSygmYoTosW3Ayewww7+pYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysCOY7bHMAP1SLT0vULjJhwGCnQXpDm6TjRri+bd1xFz1EfBtr
 DButLQ5rYIbha30ttmf37YSnN7off22fVbYA3COBmoC0kbCM6/gZDeDEkKvSDSHfKUwmuJlg99Q
 =
X-Google-Smtp-Source: AGHT+IFPB4KQLfJ5oTcBTuwkfolpVTkrbP9mW+L7V+B+F9n39lzjb0pxG3Ks1pwnCLsEqjfEY/9a7g==
X-Received: by 2002:a05:6214:2b95:b0:6bf:8f95:6a81 with SMTP id
 6a1803df08f44-6c5282fd2fdmr182304766d6.11.1726003213009; 
 Tue, 10 Sep 2024 14:20:13 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com.
 [209.85.219.53]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c53433b69dsm33808916d6.53.2024.09.10.14.20.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 14:20:12 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6c3567a143eso38506926d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 14:20:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXF+QZvNdobHMnBfI+1BDKVT7v0Gi1BAJfSlHwzd44Mklv9aX7TjsQd3sUd/HUIXgPRk2ihKE4Q0Ck=@lists.freedesktop.org
X-Received: by 2002:a05:6214:3213:b0:6bf:6ef6:22d5 with SMTP id
 6a1803df08f44-6c5283f8ecdmr222283746d6.17.1726003211375; Tue, 10 Sep 2024
 14:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240904141521.554451-1-tejasvipin76@gmail.com>
 <0bb94cc0-dd72-4da7-b0b6-9e1fe712709b@quicinc.com>
 <0e3bf87b-7d82-44eb-88d2-fddc8e33dd25@quicinc.com>
 <330174f9-bead-4411-b05e-ea9c009f765c@gmail.com>
In-Reply-To: <330174f9-bead-4411-b05e-ea9c009f765c@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Sep 2024 14:19:53 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XsHuhprN-ijw8-ZmOKV6CnCrR=s4X4L57p9J8e02MTBg@mail.gmail.com>
Message-ID: <CAD=FV=XsHuhprN-ijw8-ZmOKV6CnCrR=s4X4L57p9J8e02MTBg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83112a: transition to mipi_dsi wrapped
 functions
To: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
 Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>,
 maarten.lankhorst@linux.intel.com, 
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

On Sat, Sep 7, 2024 at 1:32=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail.com>=
 wrote:
>
> On 9/7/24 3:53 AM, Jessica Zhang wrote:
> >
> >
> > On 9/6/2024 3:14 PM, Jessica Zhang wrote:
> >>
> >>
> >> On 9/4/2024 7:15 AM, Tejas Vipin wrote:
> >>> Changes the himax-hx83112a panel to use multi style functions for
> >>> improved error handling.
> >>>
> >>> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> >>
> >> Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >
> > Hi Tejas,
> >
> > Just a heads up, it seems that this might be a duplicate of this change=
 [1]?
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> > [1] https://patchwork.freedesktop.org/patch/612367/?series=3D138155&rev=
=3D1
>
> Ah, thanks for letting me know. I hadn't realized someone else had
> started working on this too.
>
> However, I would argue that my patch [2] is a better candidate for mergin=
g
> because of the following reasons:
>
> 1) Removes unnecessary error printing:
> The mipi_dsi_*_multi() functions all have inbuilt error printing which
> makes printing errors after hx83112a_on unnecessary as is addressed in
> [2] like so:
>
> > -     ret =3D hx83112a_on(ctx);
> > +     ret =3D hx83112a_on(ctx->dsi);
> >       if (ret < 0) {
> > -             dev_err(dev, "Failed to initialize panel: %d\n", ret);
> >               gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> >               regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->su=
pplies);
> > -             return ret;
> >       }
>
> [2] also removes the unnecessary dev_err after regulator_bulk_enable as w=
as
> addressed in [3] like so:
>
> >       ret =3D regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->sup=
plies);
> > -     if (ret < 0) {
> > -             dev_err(dev, "Failed to enable regulators: %d\n", ret);
> > +     if (ret < 0)
> >               return ret;
> > -     }
>
> 2) Better formatting
>
> The mipi_dsi_dcs_write_seq_multi statements in [1] aren't formatted
> quite right according to what has been done so far. They are written as
> such in [1]:
>
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
> >                              0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, =
0x0e);
>
> Where they should be written as such in [2]:
>
> > +     mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
> > +                                  0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, =
0xa4, 0x0e);
>
> All in all, the module generated using my patch ends up being a teensy
> bit smaller (1% smaller). But if chronology is what is important, then
> it would at least be nice to see the above changes as part of Abhishek's
> patch too. And I'll be sure to look at the mail in the drm inbox now
> onwards :p
>
> [1] https://patchwork.freedesktop.org/patch/612367/?series=3D138155&rev=
=3D1
> [2] https://lore.kernel.org/all/20240904141521.554451-1-tejasvipin76@gmai=
l.com/
> [3] https://lore.kernel.org/all/CAD=3DFV=3DXRZKL_ppjUKDK61fQkWhHiQCJLfmVB=
S7wSo4sUux2g8Q@mail.gmail.com/

I would tend to agree that Tejas's patch looks slightly better, but
Abhishek's patch appears to have been posted first.

Neil: any idea what to do here? Maybe a Co-Developed-by or something?
...or we could land Abhishek and Tejas could post a followup for the
extra cleanup?

Abhishek: are you planning to post more _multi cleanups? If so, please
make sure to CC Tejas (who has been posting a bunch of them) and
perhaps me since I've been helping to review them a bit.

-Doug
