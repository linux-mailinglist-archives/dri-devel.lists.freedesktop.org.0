Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D05D90462B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 23:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFAF10E091;
	Tue, 11 Jun 2024 21:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="VXc6ZdVr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C3810E091
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 21:13:15 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dfa727cde2dso6516174276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718140393; x=1718745193;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bnsIoTs1uwuDmQ5vPMUGoGCQwLbqdaM9DFuaa81UGRo=;
 b=VXc6ZdVrvW8podja40tQ3CcZ+gBIyquuctFVmFzE8pjLPWT9gNR7yaVcq8KFhdvxhv
 1pseKgu6czHMHK9gyIvnm0Cy2IbhkpoKBOnopxVUYnCHk+0UdGJNOQvemGBN4IKhWMtp
 aidTEmz/XSPfXX5S5UMfDZk+z8GLD826p1jiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718140393; x=1718745193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bnsIoTs1uwuDmQ5vPMUGoGCQwLbqdaM9DFuaa81UGRo=;
 b=n03SGBcXNrStfZdsYOVdWQMvpNZqoSkiEy0uXMlJ/Ee6gzGKaB+r/XXWSoS6QSZg3j
 ES9QeElQteXy04NzsElmVxvyRQGvlAdYk92AJOPtbLT9hUPmK1CIFVvE5tSHP9AXct9W
 0WFiMso0SQAR/AAd4lcclSFjPd818Vr/rGUipWgA++M1za42xgezpQ0gJRfxRs8jeryP
 qGmFTIKE6pyNIXvR7nizK0Wo6SfrKpr8qSxDWjgQJo0zMA7nTiZK3BmL3+CgutlQDXXz
 0qclk4ZV53QF/tqTJwc1EVfqkw6wSZ7l8NPJZvz/scHsNVgGQoCJEVPGwdhX8Lep7ELF
 IUcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVETNkxS6CC1zoMiTfywcmEcxJmynhL0cy7ejPaM8ZhHJQ0NxnPFxmT03c51I0/rjlf9Tw8HlurkvrayWw9nL7o/fayJ+Izwux/lgflsvqX
X-Gm-Message-State: AOJu0Yw4WTpTPgjyNj4bINkEaQEWsHBzcP2/r8c38UngmIcbXL9GSzCw
 OAACC4mVOz1R8Gaj9QSzuqHUo9pgpeGB0ckmMJWIXv2Ljd594N6VoFuNj4wsel101WeAUv67REQ
 =
X-Google-Smtp-Source: AGHT+IHzvVwR/BRkwcjlI0ZPLW6Hd4WQwwFoeOAMySwr7YPgXy8FZsbxVmcyKE4iVhmq1ubOpO8M4w==
X-Received: by 2002:a25:ab68:0:b0:df4:db52:c909 with SMTP id
 3f1490d57ef6-dfaf64ebd21mr12935314276.19.1718140393280; 
 Tue, 11 Jun 2024 14:13:13 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com.
 [209.85.160.175]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b07937725dsm28126056d6.102.2024.06.11.14.13.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 14:13:12 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4405dffca81so14771cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:13:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWUsXuBM6otpXb7At81zqOHx4bfHmsGVpmoQH8gL7oR7pJiip0Lu9MmYhVSTs3R9qrD+ESpLgRoLdpqQwZrxe8K1ybLMKYNVB1eTQdEYPga
X-Received: by 2002:ac8:6f16:0:b0:43f:f227:8df7 with SMTP id
 d75a77b69052e-44159ce374amr122811cf.3.1718140391298; Tue, 11 Jun 2024
 14:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <3288287d-8344-4b37-a333-722cf12fef13@gmail.com>
 <CAD=FV=XRuU=eh0HzbDCwFrr5h9s-rOdB5dbANAd-BmMhiHR6Ww@mail.gmail.com>
 <uhnjrzii3ydzdsnhc54sbglpy46drzwg2m6if5ymid7gjabcvd@ppzdg6xz4xx7>
In-Reply-To: <uhnjrzii3ydzdsnhc54sbglpy46drzwg2m6if5ymid7gjabcvd@ppzdg6xz4xx7>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Jun 2024 14:12:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJdp0btifYjGLN5_bfGSEwcEM5nPv8M7872190T3uMRA@mail.gmail.com>
Message-ID: <CAD=FV=WJdp0btifYjGLN5_bfGSEwcEM5nPv8M7872190T3uMRA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel : truly-nt35521: transition to mipi_dsi
 wrapped functions
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
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

Hi,

On Tue, Jun 11, 2024 at 2:10=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Jun 11, 2024 at 08:57:48AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Jun 11, 2024 at 7:44=E2=80=AFAM Tejas Vipin <tejasvipin76@gmail=
.com> wrote:
> > >
> > > Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Intro=
duce
> > > mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> > > ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> > > sony tulip truly nt35521 panel.
> > >
> > > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > > ---
> > >
> > > Changes in v2:
> > >     - Fix patch format
> > >     - Fix code style
> > >
> > > v1: https://lore.kernel.org/all/485eef24-ddad-466a-a89f-f9f226801bb7@=
gmail.com/
> > >
> > > ---
> > >  .../panel/panel-sony-tulip-truly-nt35521.c    | 435 +++++++++-------=
--
> > >  1 file changed, 209 insertions(+), 226 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b=
/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> > > index 6d44970dccd9..5a050352c207 100644
> > > --- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> > > +++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> > > @@ -44,248 +44,231 @@ static void truly_nt35521_reset(struct truly_nt=
35521 *ctx)
> > >  static int truly_nt35521_on(struct truly_nt35521 *ctx)
> > >  {
> > >         struct mipi_dsi_device *dsi =3D ctx->dsi;
> > > -       struct device *dev =3D &dsi->dev;
> > > -       int ret;
> > > +
> > > +       struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D dsi };
> >
> > It's not a huge deal, but normally in the kernel all the variable
> > declarations are cuddled together. AKA no blank line between the
> > declaration of "dsi" and the declaration of "dsi_ctx". It would be
> > awesome if you could send a v3 fixing that. When you send v3, feel
> > free to add this above your own Signed-off-by:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...with that, the patch will probably sit on the mailing lists for a
> > week or two and then get applied. Neil may want to apply it, but if
> > he's busy I can do it too.
> >
> > I believe you were planning on tackling some more of the panels. Since
> > you're still getting started sending patches, maybe keep it to a
> > smaller batch for now and send another 10 or so? Probably best to keep
> > it as one panel driver per patch.
> >
> > -Doug
>
> Do we want to delay this until the mipi_dsi_msleep() is fixed?

Yeah, that's a good point. I saw the mipi_dsi_msleep() problem after I
reviewed this patch, but you're right that it should be fixed first.

-Doug
