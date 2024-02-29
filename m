Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69886BE2A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 02:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C10C10E1F0;
	Thu, 29 Feb 2024 01:17:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VXpkxfdR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB9610E1F0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 01:17:56 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-6ddf26eba3cso268058a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 17:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709169475; x=1709774275;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HZQ76DkW7h4NA/X0r/CH+mLXIOYFICqmMAZUC0ZaMd0=;
 b=VXpkxfdRGxI/+HBmi/uCAtYCV1OPtqkllKYnLG6wVeHXJ4xMLeFqCoNpMrlTSVi5Ab
 zpiSJzjvt+bFaKE6ztFa6sihY/lZRoN7L9VUbmBTQOVgl17GQF5v4f0h/IhrwAZLxK83
 KT4leQN1vZt7y6YNnV2jiZrCfgMcvYBYnaWNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709169475; x=1709774275;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZQ76DkW7h4NA/X0r/CH+mLXIOYFICqmMAZUC0ZaMd0=;
 b=R88HkZeMl0pgIlPf+mdVZx6bRX/zuvTG74f6kTq1DQi21yfEj8N+NYkGDc7VBi7UQl
 wSkGcS3SteIgEP+fGlE0mV+dcGcyT29d8zGU4aQtQgjSVbXVdS0B0YJNgA1rHLqFZwKZ
 hFNC3QKKBv8G3qW/T+p2EDMYTuNhpBfIKzsIJBIgVdIVWYNIutucuc32IVaZv1RzjsV5
 GthIbiqZf3dK3Ge8M4DwLmKRhdpKkYtzkmTe7r9wAui38W2xwmmNYwFWVXdCoG2dBTer
 OfCkMDDV3iPtjPBZliVQOES+fT8fK8F//y+eA3E2K823PDo6HgGbNH1mAj+bqPKhoKFY
 GAyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUONjwM76sFtHK6QO+JNQbY2TQcl/akriSEIxAzEjpy0CSxyx1irKJRLYuhxFJ3lC3YHnqmv+cuRbdDeRFyNXmjSPlvekISWHb7pgGxfO8t
X-Gm-Message-State: AOJu0YxEbbotNmW11zhyxXFk1fKGq8RQsPQ1qSOx4U6ltNal3nJ8hJWe
 S1ZYDiRidbBQmsdb4xPCJf+RrQ/Ofih/j13QtDbR+JW9rtVncLPdWZP+b0wJjd5m84e60DTSprl
 O08X2jkCgHEwuP2muhsLAf/AzJA5v6GFoYg9W
X-Google-Smtp-Source: AGHT+IHkb5TkeWTwPZcxuU3wBYJG29QOvSIqFciiMx+ydxhcAZAzMmWHvJsOvayKQsE18cYrwAxT2GSgQ+Di9rVejP0=
X-Received: by 2002:a05:6830:4da:b0:6e4:7371:33c5 with SMTP id
 s26-20020a05683004da00b006e4737133c5mr668472otd.37.1709169475655; Wed, 28 Feb
 2024 17:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-4-hsinyi@chromium.org>
 <CAD=FV=VV6fprky=v9koiVGmWcXKL3V4F2LOu7FriPbT_zT6xyA@mail.gmail.com>
 <CAJMQK-gmWHXNmxk4fWM0DEDN0kdUxVJF_D8pU_8CYCpBnd3-Ag@mail.gmail.com>
 <CAA8EJpr7LHvqeGXhbFQ8KNn0LGDuv19cw0i04qVUz51TJeSQrA@mail.gmail.com>
In-Reply-To: <CAA8EJpr7LHvqeGXhbFQ8KNn0LGDuv19cw0i04qVUz51TJeSQrA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 28 Feb 2024 17:17:29 -0800
Message-ID: <CAJMQK-i-zvLdVRyCe=cNhsXoXASr__32Cm-xgYPw0w3F2-XaWA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: panel-edp: Fix AUO 0x405c panel naming
 and add a variant
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

On Wed, Feb 28, 2024 at 5:13=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 29 Feb 2024 at 03:05, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > On Wed, Feb 28, 2024 at 4:22=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Tue, Feb 27, 2024 at 5:11=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium=
.org> wrote:
> > > >
> > > > There are 2 different AUO panels using the same panel id. One of th=
e
> > > > variants requires using overridden modes to resolve glitching issue=
 as
> > > > described in commit 70e0d5550f5c ("drm/panel-edp: Add auo_b116xa3_m=
ode").
> > > > Other variants should use the modes parsed from EDID.
> > > >
> > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > ---
> > > > v2: new
> > > > ---
> > > >  drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++++++++-
> > > >  1 file changed, 16 insertions(+), 1 deletion(-)
> > >
> > > The previous version of this patch that we reverted also had an
> > > override for AUO 0x615c. Is that one no longer needed?
> > >
> > >
> > > > @@ -1990,7 +2003,9 @@ static const struct edp_panel_entry edp_panel=
s[] =3D {
> > > >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, =
"B116XAN06.1"),
> > > >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, =
"B116XTN02.5"),
> > > >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, =
"B140HAN04.0"),
> > > > -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay=
, "B116XAK01.0"),
> > > > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay=
, "B116XAN04.0 "),
> > > > +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.dela=
y, "B116XAK01.0 ",
> > > > +                        &auo_b116xa3_mode),
> > >
> > > The name string now has a space at the end of it. I _guess_ that's OK=
.
> > > Hmmm, but I guess you should update the kernel doc for "struct
> > > edp_panel_entry". The name field is described as "Name of this panel
> > > (for printing to logs)". Now it should include that it's also used fo=
r
> > > matching EDIDs in some cases too.
> >
> > The space here is because in the EDID, there is space at the end,
> > before 0x0a (\n).
> > Okay I will update the kernel doc to mention that the same should be
> > exactly the same as the panel name.
>
> Maybe it would be better to strip all the whitespace on the right?
>

Sounds good too.

> --
> With best wishes
> Dmitry
