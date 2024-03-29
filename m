Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E489C8911F8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 04:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C0C10F755;
	Fri, 29 Mar 2024 03:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h5V2HxUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4A910F9A0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 03:26:13 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso1552402276.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 20:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711682713; x=1712287513; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nr/8twKi35UpzKCD9xLfs3GqmEy6CId1PaFPiyuBquw=;
 b=h5V2HxUsozODZOHInLBl8wlrxJY1+PdstkYMyj8PY2NYK45JYjmneScpbiq90zB46V
 5c27LTkwVn1KtHeH9XV6DqxhFuN0LfJ3ZOv8pxDEuRQEDZC4rO6TaltJdm7xl99mL1zZ
 VHhAQ07MS/KTCt/b9wXbq3wbTz898bAbK6s3pd46Z8jkUuUdGi5Lf2dGFY2vUCJAJNN2
 T8WsKtmvFZe5YaWAwxMBFu6fk9NUhvAMQvFBrwSjL7NQsm4riB6ixZmgqO8990j2yJwc
 EJCQ2ZhLeXthVuKiKzyRWj6XhdNg9opPRZUA4Caw6mZgwoBq8kqMwoS0emXH1nnEUkmK
 A6zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711682713; x=1712287513;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nr/8twKi35UpzKCD9xLfs3GqmEy6CId1PaFPiyuBquw=;
 b=cO8YNfACXCWPX2gp01p00155mW+6lQyTuk1iOwe8e2urP6WcJN7r7d4Gx8sJ5geY4F
 1g0BfUQXrsBaqUQThcoG1w6LHrRlWOJG4FRv82GFh6K52VdJUHp7521ag6Bt/7rRS5X6
 x+olkwced20FIUE/fE+Srv+TyCo56nP6ndyVuaIfI1tHFqVqgsiq+exNMDP9MReog2D4
 kDOIvBttbyLNYvz5kdKRdxmZIXt7pOEhU+qkDik7p9QpAPI5v66vdKU2ZUSOVKqpEoAN
 XjespgCqi/yucBmhaPfkhhdUb2l8cdgiqQ+CQEVU6HEu2JuzkrB9eQOWi7kPU76G8g4I
 hHQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXhaAQ6nF3chLJmGn0MCPnfbS7gfOxDBDeQXuVAYkQAniuSMZdiUVg4YV8IHqGHR59jo4XZStEeF8YG1OJLDBk1WRawMYKdL3xbxqctyWu
X-Gm-Message-State: AOJu0YzjDWl7Agq4zxMf/eaTT032FGCYUKe7rjA5zYuhD6dlJ9Bib2w1
 FH9nXnROahfDMxtP+1c9AWoYx6O8V3DfelF0Z4dH5jdhZgi7SE8Fxy6PgZbmFFQqXhjIYotXBnc
 5zSD4AkvGVAbBb7g/1eVocTll5VITSI4s27w9fw==
X-Google-Smtp-Source: AGHT+IEc/spMQTXZC1RG/WUE/vTwyFe2QySMsOuV3o7NaZ652TMmTA3iZU0xZDenXOK8OncbMvR0eeinZOf3A5JMVyc=
X-Received: by 2002:a5b:a08:0:b0:dcf:411a:3d22 with SMTP id
 k8-20020a5b0a08000000b00dcf411a3d22mr1249509ybq.60.1711682713054; Thu, 28 Mar
 2024 20:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240328111158.2074351-1-jun.nie@linaro.org>
 <CAA8EJpq7eHgryrNnnR=Yh46PdkAQA-YNzTz_0gaWbr_g9CWSxA@mail.gmail.com>
 <CABymUCOdZO7K1F3FMR_KD5sgCUCSKreSYr3BWbNdYMO==+AErA@mail.gmail.com>
In-Reply-To: <CABymUCOdZO7K1F3FMR_KD5sgCUCSKreSYr3BWbNdYMO==+AErA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 05:25:02 +0200
Message-ID: <CAA8EJprBAJj8kub0JOk4Dd+-bqgtsrYM15hOKocYbZwrFqOwyg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/msm/dpu: fix DSC for DSI video mode
To: Jun Nie <jun.nie@linaro.org>
Cc: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com, 
 daniel@ffwll.ch, quic_parellan@quicinc.com, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 marijn.suijten@somainline.org, sean@poorly.run
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

On Fri, 29 Mar 2024 at 04:47, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B43=E6=
=9C=8828=E6=97=A5=E5=91=A8=E5=9B=9B 23:05=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 28 Mar 2024 at 13:12, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Fix DSC timing and control configurations in DPU for DSI video mode.
> > > Only compression ratio 3:1 is handled and tested.
> > >
> > > This patch is modified from patchs of Jonathan Marek.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >
> > This almost looks like a joke, except it isn't the 1st of April yet.
> > The patch lacks proper Author / Sign-off tags from Jonathan.
> > This is pretty close to copyright infringement. I'm sorry, but I'd
> > have to ask you to abstain from sending patches w/o prior internal
> > review.
>
> Thanks for pointing me the previous version. I am not aware of it actuall=
y.
> The only version I knew is from internal repo. It is my fault. I see the =
slides
> says that Jonathan does not want to disturbed, so only his name is
> mentioned in the commit message.
>
> What's the patch set status? I do not see it in mainline yet. If it is
> in pipeline,
> I can just forget the DPU side change.

See https://patchwork.freedesktop.org/series/126430/

Jonathan posted the patches, but he didn't seem to be interested in
following up the review feedback.

>
> Thanks!
> Jun
>
> >
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
> > >  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  2 +-
> > >  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 12 +++++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 10 +++-
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 +
> > >  drivers/gpu/drm/msm/dsi/dsi.xml.h             |  1 +
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c            | 48 +++++++++++------=
--
> > >  include/drm/display/drm_dsc.h                 |  4 ++
> >
> > Ok. The feedback for the original patchset [1]  was that it should be
> > split logically. Instead you pile everything together into a single
> > patch. This is a complete no-go.
> >
> > Also, this patchset lacks changelog in comparison to the previous
> > patchseris. I don't think I'll continue the review of this patch.
> > Please rework it properly and add corresponding changelog.
> >
> > [1] https://patchwork.freedesktop.org/patch/567518/?series=3D126430&rev=
=3D1
> >
> > >  8 files changed, 56 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 6a4b489d44e5..c1b9da06dde2 100644
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry
