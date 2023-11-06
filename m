Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115807E2E47
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 21:39:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B9610E091;
	Mon,  6 Nov 2023 20:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE8410E091
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 20:38:53 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6ce291b5df9so3133969a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 12:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699303132; x=1699907932;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWHeQJn6b5QGJ2aLzpvGAlFnz6fZ5+dr6mLoVmK8xZY=;
 b=TzPtTd4aMXzBFYXSXdgu28B+ci2KtTvSycUl9oP2KFnJozXzKV8/WZtLmPWBFZgTlC
 AVE7LHQW8DemJBhzkslVwlr4XwA2asfmcxlXQ6DARZu5AePZ8nu4sZA/UKUd/+5+IZDy
 HeUMautphi+jqd8NVi7lmbNYHMrzGchIL+JfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699303132; x=1699907932;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DWHeQJn6b5QGJ2aLzpvGAlFnz6fZ5+dr6mLoVmK8xZY=;
 b=eVqaiBn2vlzfDjb4nVh/Tq1YC9bFescWydx2God0a/ZRimYuUUt7UHpXZDNpy/JLw3
 +G+p+gKJJ7Bo9a8+M4mFNPw7CUXIuN6863JG7K44zE7L53KAgpuvwJf02Faadbf+LKL+
 3qugl0zcNGuwk3bqoZ6+tD7KjazI5VEvN4hmXDtmTWvHBrsDbHICnf0x8Vm+ueslg5H7
 SHIOdJTZF2RMWObSQalVvH3uT7W9H+BKrrhGYSMWX/AFuMwzVu/cYCvk7Zihts12Kfel
 hu/ll+7wQHkbeuf/NtJJvhVC1wD3h34pMCptue7AJwuHFj/3uKPFLpu696RPayOlWZRC
 UYSA==
X-Gm-Message-State: AOJu0YzQmZBGLZgPOwqJ6beFDI9NKMiFrSyfkBVImCN2TzKQih1I3EWy
 L/SlFrQH6egkJwtIBdLORg/pqOtBgUCvnxvRRPlqjg==
X-Google-Smtp-Source: AGHT+IFqrf+5iybuubxTs0TinjyxKuo+fHf9DhrkjYerZ24qeAd6518K5hcdcrjXkEixbQq221w/0z4sR+6TLpiMYu0=
X-Received: by 2002:a05:6830:20c5:b0:6c0:a95b:44e4 with SMTP id
 z5-20020a05683020c500b006c0a95b44e4mr30185671otq.38.1699303132688; Mon, 06
 Nov 2023 12:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20231106202718.2770821-1-hsinyi@chromium.org>
 <20231106202718.2770821-4-hsinyi@chromium.org>
 <CAD=FV=WZS0ADX+0MyK3W75BkJ6qcohbj0ZC5CvnT0gedx0z0gg@mail.gmail.com>
In-Reply-To: <CAD=FV=WZS0ADX+0MyK3W75BkJ6qcohbj0ZC5CvnT0gedx0z0gg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Nov 2023 12:38:26 -0800
Message-ID: <CAJMQK-gmu71-s_RoiWUAd_HHtJm_yN1YQ6+p+aQyKWKz1ACDsQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/panel-edp: Avoid adding multiple preferred
 modes
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

On Mon, Nov 6, 2023 at 12:33=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Nov 6, 2023 at 12:27=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org=
> wrote:
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index 0fb439b5efb1..54dbbdf62ec0 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -594,8 +594,20 @@ static int panel_edp_get_modes(struct drm_panel *p=
anel,
> >                                       p->detected_panel !=3D ERR_PTR(-E=
INVAL) &&
> >                                       p->detected_panel->override_edid_=
mode;
> >
> > -       /* probe EDID if a DDC bus is available */
> > -       if (p->ddc) {
> > +       /*
> > +        * If both edid and hard-coded modes exists, only add hard-code=
d modes
> > +        * to avoid multiple preferred modes.
> > +        */
> > +       if (p->desc->num_timings || p->desc->num_modes) {
> > +               /*
> > +                * Add hard-coded panel modes. Don't call this if there=
 are no
> > +                * timings and no modes (the generic edp-panel case) be=
cause it
> > +                * will clobber the display_info that was already set b=
y
> > +                * drm_add_edid_modes().
> > +                */
> > +               num +=3D panel_edp_get_non_edid_modes(p, connector);
> > +       } else if (p->ddc) {
> > +               /* probe EDID if a DDC bus is available */
>
> As per discussion in v2, I think if you have the "ddc" you still want
> to fetch the EDID, you just don't want to add the modes from the EDID.
> This will mean that the EDID is present in sysfs if userspace wants to
> look at it for whatever reason.
>
Ack. Will update this.

> -Doug
