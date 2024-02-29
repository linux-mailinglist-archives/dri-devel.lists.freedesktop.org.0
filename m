Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BCF86BE18
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 02:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989B710E1EB;
	Thu, 29 Feb 2024 01:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pZ4I4+M2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB8010E1EB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 01:13:08 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6084e809788so12691947b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 17:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709169187; x=1709773987; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e6MGGAumrxRXV1Gl26nEoiePX3KShp1oKjTHnhKmtSY=;
 b=pZ4I4+M2eMDBhtCAMd9Q51v/XuMKNMs8u89IUwKjYXU1rZ0fk9loqpXZlg4Ts0WEYa
 C4SK/Xc//JpCPxp3inbvqznNyuPrg5foJoc/UZ0ROYkgAHgUVuNt9uPl2IbAGiTMU2cn
 bTCwdmGEkXPL3ulDv0K0fJnnITpdgvYp+Qc1sT1xu8moLxKAEeNIKpdw9AnT3ZPb+mQ8
 U/+23Msgny82+ZrH5Lluch+ZfX8K2afYkFF4I80PjmUnU93QrOKmYffJ4YT8j/pwOXj0
 9KwLu9K38NzR5+t2q26VpIaT5YB7BHqbjkECZANc+WXGJIMA34qU5SAluBfCzqUzwqj9
 1IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709169187; x=1709773987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e6MGGAumrxRXV1Gl26nEoiePX3KShp1oKjTHnhKmtSY=;
 b=e0m47DkFXVSEv1tyrr08JBhJ0nKX2yi24m/oss0SctXbhlLF6qLMgYZs0MQZyyXQnP
 lzh51tb2wVDHVLqplRGObadwB8iplDCZUrFvXTt3JS8lLCn7/odGN23fM9dU+SIr96Gc
 p0gRpibV+d/+w/O+eSZeB+DfFz1txkLr3dVcixbGHu2vcDL0A73mzmTxiLyYIAJPz/Be
 TyyEYsNpRUdrtpxTDtGtgTP/lLi7FnCSBOJW5TQ8Elvwr+Mvyif+5f8JQ9WtEJNsxSK6
 mLxMn1Nk2juasoIql4noxF4WEQic0tjaKtFrAqGUoP+Fzhe7Q4OaPqw+MHyjE34dQ+qR
 Vg4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqO12DuB1E/JV/Us5z3man5riEJ7mTBUHj1yvFWC+dDuK96vHwyIcionh3YuIiMePP4770bmq2MI9mOQuq8WLatqoMfpU+5Bu/74vuqNKE
X-Gm-Message-State: AOJu0YxmHxH9w2s8OH5a1UXzOg8SAE5qCLAaiaD+mQ0vyWKm113sTdVd
 mzxHuQSjm7MxvqwKEBTj1VfGtCSFCkm/DYhqDjdpEfcjaeSnE5wAuzDZQdnMKd9U3+mCHDFhCPM
 Mjf74bYcs0j6rx14VKGed36FZ3Dq283g0m9Jgzg==
X-Google-Smtp-Source: AGHT+IEFJ7xKJ1yrUDbA9KTBjQB2oqRAl32r9mwdzugC5/qL3JiMFQ1HljV22KhztWAIckKawWgmC4zG3YYAOHipqQs=
X-Received: by 2002:a25:e0d4:0:b0:dc7:46fd:4998 with SMTP id
 x203-20020a25e0d4000000b00dc746fd4998mr303378ybg.13.1709169187453; Wed, 28
 Feb 2024 17:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-4-hsinyi@chromium.org>
 <CAD=FV=VV6fprky=v9koiVGmWcXKL3V4F2LOu7FriPbT_zT6xyA@mail.gmail.com>
 <CAJMQK-gmWHXNmxk4fWM0DEDN0kdUxVJF_D8pU_8CYCpBnd3-Ag@mail.gmail.com>
In-Reply-To: <CAJMQK-gmWHXNmxk4fWM0DEDN0kdUxVJF_D8pU_8CYCpBnd3-Ag@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Feb 2024 03:12:56 +0200
Message-ID: <CAA8EJpr7LHvqeGXhbFQ8KNn0LGDuv19cw0i04qVUz51TJeSQrA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: panel-edp: Fix AUO 0x405c panel naming
 and add a variant
To: Hsin-Yi Wang <hsinyi@chromium.org>
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

On Thu, 29 Feb 2024 at 03:05, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Wed, Feb 28, 2024 at 4:22=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Feb 27, 2024 at 5:11=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.o=
rg> wrote:
> > >
> > > There are 2 different AUO panels using the same panel id. One of the
> > > variants requires using overridden modes to resolve glitching issue a=
s
> > > described in commit 70e0d5550f5c ("drm/panel-edp: Add auo_b116xa3_mod=
e").
> > > Other variants should use the modes parsed from EDID.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > > v2: new
> > > ---
> > >  drivers/gpu/drm/panel/panel-edp.c | 17 ++++++++++++++++-
> > >  1 file changed, 16 insertions(+), 1 deletion(-)
> >
> > The previous version of this patch that we reverted also had an
> > override for AUO 0x615c. Is that one no longer needed?
> >
> >
> > > @@ -1990,7 +2003,9 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> > >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B=
116XAN06.1"),
> > >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B=
116XTN02.5"),
> > >         EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B=
140HAN04.0"),
> > > -       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, =
"B116XAK01.0"),
> > > +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, =
"B116XAN04.0 "),
> > > +       EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay,=
 "B116XAK01.0 ",
> > > +                        &auo_b116xa3_mode),
> >
> > The name string now has a space at the end of it. I _guess_ that's OK.
> > Hmmm, but I guess you should update the kernel doc for "struct
> > edp_panel_entry". The name field is described as "Name of this panel
> > (for printing to logs)". Now it should include that it's also used for
> > matching EDIDs in some cases too.
>
> The space here is because in the EDID, there is space at the end,
> before 0x0a (\n).
> Okay I will update the kernel doc to mention that the same should be
> exactly the same as the panel name.

Maybe it would be better to strip all the whitespace on the right?

--=20
With best wishes
Dmitry
