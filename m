Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B592C7E0955
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 20:18:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B38ED10EA7C;
	Fri,  3 Nov 2023 19:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A7D10EA7C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Nov 2023 19:18:33 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6d2de704f53so1440823a34.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Nov 2023 12:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699039113; x=1699643913;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uXnGRlRT6UDgUW63xKhU+4algxK/8pXZcAoscYXgMrU=;
 b=R8qfNhibTUm9GDCR9AqNGObiJtw0co4Zs30H7empPoV1pX8YNUbOPlnXJikJtJNY+B
 JatEVLgZFG3tkvKMPqcD7v/MHJVS+QWZFQyOLRBVnQe7gXVSYA3vPa2x5DoVcjnGJ+8Y
 d7YL6KpU6cfvQWZUYRizjOPRCxZFcXDGfWGng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699039113; x=1699643913;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXnGRlRT6UDgUW63xKhU+4algxK/8pXZcAoscYXgMrU=;
 b=AYPPb1SyoWH90yGlj26l26yb2ZvRtfidRBMlEUFv7QckHeiVibajv1CYWocTL742OT
 4N96irK0b8hwdCnvFPvtDHS5VQyzsgziGaVLkLlDbnHaiAu57b15Vg605whALOe2Hzc2
 SLYPrIBnm2WxUczDe8W3wuaiHz0Qbi26czFf5fi006+fE4m1jy6wNmxKW+Fjk+7kBrlb
 E/ypBjlb+YU8LN4Mtjzrgljl7p327tH2NspsDCrzO1/iaKNWnT1l6HcVtyGf32u+UbjI
 SO1TsNGjI9lJ7x9JeoULpqtI2oXQup6f4FjdUTDTYXiWo8VJoUCKiouiZUmfGjwzaTOO
 9AVA==
X-Gm-Message-State: AOJu0YwC5tUZ2PrylCWBl+QFDxrUFzgsqt384QGfztSMyuQorVbkdDmZ
 1vZg+nDet7V39iEKpTA91C/DBFgjU4AQ42WbJt187A==
X-Google-Smtp-Source: AGHT+IHBqvIZeW8h2w6MoYxUP6Q+AETTRg33Ap1XVHSWkyuPX/JGNntllDnfUVVTZGZ0cTtuPSVpssYNlfORukcvaZk=
X-Received: by 2002:a05:6830:2b29:b0:6d3:2d45:3b46 with SMTP id
 l41-20020a0568302b2900b006d32d453b46mr5613777otv.31.1699039113156; Fri, 03
 Nov 2023 12:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231102221309.1971910-1-hsinyi@chromium.org>
 <20231102221309.1971910-5-hsinyi@chromium.org>
 <CAD=FV=XEnk1TuWsJB6W5PGisg3_0A3HZMGpxEUrtcDxXK=Z+Eg@mail.gmail.com>
In-Reply-To: <CAD=FV=XEnk1TuWsJB6W5PGisg3_0A3HZMGpxEUrtcDxXK=Z+Eg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 3 Nov 2023 12:18:07 -0700
Message-ID: <CAJMQK-iuDrLhpviSOXqhUvjRuzh6q=ENvtmoX_2LXv1=X8g+XA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/panel-edp: Choose correct preferred mode
To: Doug Anderson <dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 3, 2023 at 9:03=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 2, 2023 at 3:13=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org>=
 wrote:
> >
> > If a non generic edp-panel is under aux-bus, the mode read from edid wo=
uld
> > still be selected as preferred and results in multiple preferred modes,
> > which is ambiguous.
> >
> > If a hard-coded mode is present, unset the preferred bit of the modes r=
ead
> > from edid.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v1->v2: split patches from drm_modes.
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Do you think this should have a "Fixes?" As per discussion on V1 [1],
> this has probably been a bit broken from the beginning, though I guess
> it only became a big deal after the AUX bus made it so that the panel
> driver commonly had the EDID...
>
If this patch needs to apply Fixes, then the previous patch might also have=
 to?

Fixes: 280921de7241 ("drm/panel: Add simple panel support")


> [1] https://lore.kernel.org/r/CAD=3DFV=3DWHzCdiYumsxUm_am+ALqq9SOOrjf=3DJ=
YHqJuiKFB+Dnsw@mail.gmail.com
