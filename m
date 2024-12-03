Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C7E9E12D2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 06:16:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4711A10E8DC;
	Tue,  3 Dec 2024 05:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Owu03Q2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205A810E8DC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 05:16:23 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53de79c2be4so6029478e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 21:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733202981; x=1733807781;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3UD667MqVjs2PSeQOCIMQ6RaQb2wmVHS4BrEZxWWZe4=;
 b=Owu03Q2M95Z99nlxq3nErEGu9nvNaPF+uoUYZe9ki7ZUuP9K4ZrA2R/AfAWALNiQoL
 y3jcOFbQdju7wpZ+tOYHcsgYXMP1yYMP2VUKVX02uog9bwDFgQ5gFtaUP4B1u/+5PBKo
 hX8VTAJnCLfxrVxDQnWtq2RdQ2hPWDVRgMtwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733202981; x=1733807781;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3UD667MqVjs2PSeQOCIMQ6RaQb2wmVHS4BrEZxWWZe4=;
 b=cBS0CMpA7jyyVcvipJIUkZOtRfJuHVWsA3SCkX7nmbRs/JUJ1eD2zWS/TK/pZEgTq/
 /GinPhdsXXeH2VTKuLSGVaYWjlY0fNZcIUrn6h63IlJqnzUFXtSbY4M0esed6qnmypS0
 i6bgX7qJPTM0ERdJxafzRN5eMWC7DLu4YSWzpiOEunKAMnAx74yHoXpsFZ5m/34LMLbS
 wi62RqOOTyhqdiJhwUjbacLRUM2jizxoMr8UnfZBsDSaijWgJaFClnUW3+P+H4wyluKA
 Lv0rF/trzxNWdXU1s0SrRVLRhDcoCeP8krVN++ym6I5X3wA7bk/STC4870o5o2pdgI4I
 E5fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcsot9vCvNHOf3drWZj/0UHXZP4d+mmN3JeOvtbCgF6UHtNvZynpEWrY7mSz9yz5uN9XrPtgk7MTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOOUsHr180/C/gJii/0mI9vC9elYKEcgwSTl+Z2WibMze/Blo9
 tJYi+GYbQpb4mW+fX5m3KOGmfNgzKokBQmrkToYauRj4Dh0VIl+fCsi1datcwMcDVkPy8mc2SBS
 Gm7HiToR609nnGzKIk4UGrjKmIQFgT73+cdAa
X-Gm-Gg: ASbGnctxhrHhYAQaUCw2TxIqucg6Jt9QL+/ZDbvwYQZ3D8MBx5WRMDvE7l24sUWvRpE
 nlOdo8XFbQSCmge/iw80h4VmVoK5Yf8y+fi/aYfAfVlz2fWQs/SIddtPajac=
X-Google-Smtp-Source: AGHT+IGm4FRj4d2L71/JkcWnh0KmpdTxb3WeZOy2aVhsku87ZrddGzpbk9L+0MSqJj7VAyzY1Vded+GyvFJFBZY/vh4=
X-Received: by 2002:a05:6512:2208:b0:53d:a292:92c with SMTP id
 2adb3069b0e04-53e12a264damr551253e87.43.1733202980809; Mon, 02 Dec 2024
 21:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20241202062449.65593-1-wenst@chromium.org>
 <h4nkbvwohp2izu4mzyv6nih42nqb4yspyxxqwyhojcgxvn5mj2@frar3tof42ds>
In-Reply-To: <h4nkbvwohp2izu4mzyv6nih42nqb4yspyxxqwyhojcgxvn5mj2@frar3tof42ds>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 3 Dec 2024 13:16:09 +0800
Message-ID: <CAGXv+5HNzr_aRLEei_O-XgixKUYDeCpZiymqLOa8ZwROY2gTyw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: visionox-rm69299: Remove redundant assignments
 of panel fields
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Mon, Dec 2, 2024 at 8:50=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Dec 02, 2024 at 02:24:48PM +0800, Chen-Yu Tsai wrote:
> > drm_panel_init() was made to initialize the fields in |struct drm_panel=
|.
> > There is no need to separately initialize them again.
> >
> > Drop the separate assignments that are redundant.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/g=
pu/drm/panel/panel-visionox-rm69299.c
> > index 272490b9565b..1df5303eb57c 100644
> > --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> > +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> > @@ -193,7 +193,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_d=
evice *dsi)
> >
> >       mipi_dsi_set_drvdata(dsi, ctx);
> >
> > -     ctx->panel.dev =3D dev;
>
> No, this will break one of the following function calls. Please refactor
> them too.

You're right. And it mixes usage of `ctx->panel.dev` and `dev`.
I'll send v2 getting rid of `ctx->panel.dev`.

ChenYu

> >       ctx->dsi =3D dsi;
> >
> >       ctx->supplies[0].supply =3D "vdda";
> > @@ -215,8 +214,6 @@ static int visionox_rm69299_probe(struct mipi_dsi_d=
evice *dsi)
> >
> >       drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
> >                      DRM_MODE_CONNECTOR_DSI);
> > -     ctx->panel.dev =3D dev;
> > -     ctx->panel.funcs =3D &visionox_rm69299_drm_funcs;
> >       drm_panel_add(&ctx->panel);
> >
> >       dsi->lanes =3D 4;
> > --
> > 2.47.0.338.g60cca15819-goog
> >
>
> --
> With best wishes
> Dmitry
