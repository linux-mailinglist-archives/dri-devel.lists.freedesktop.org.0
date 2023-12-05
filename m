Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18379805CD6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 19:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E3F10E5E4;
	Tue,  5 Dec 2023 18:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2CD10E5DC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 18:05:29 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a0029289b1bso769517966b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1701799526; x=1702404326;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VQY0vlSpKcmwWyHOVhQ8rGvlB1TLuij1Tr7g/xZpQa4=;
 b=bdDiYAfCOHdDBkvo8sGOlVCzfwQ1GBp2rhokgjQR+5AjO6T/J/RgEYivyFoWKpcG9z
 wFsjHYmrifdHhbqccC/hH6fmkxXEpDd3xsqXw1C7T5HvBIpI0XpW17p1KbJ9V236OvCw
 TQp4nqJSM9XX8U6IPg+3ibpS2baeIygimr8p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701799526; x=1702404326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VQY0vlSpKcmwWyHOVhQ8rGvlB1TLuij1Tr7g/xZpQa4=;
 b=WHWtSajaORyCOQCtvRY8lKkdzihV4ax585ExZZzc0aeia2Y9BCOQT6wr/M/jEp+Kni
 64Mo3doDPpESD+IvpzHyrjzLUDJKUT0ihASxISUqyH405XFLvl1o7UNAeagrfHOl0k5X
 Zgsc/GAH2VDS3il0Aoz1QAZsS9V5h9SShyyXK9Xxoa+meJ7kM9eHFv6W1Wabq6M21mW9
 BfaXPda6tBN6H2wyklHzogn9PUr+J0eRu8ZmhYorjTxWQ1OBXkoz75mH/PXDe0X2S50a
 Tr/wzZMeuO9Y0/XIup9M8HUZ2hER5Qoc/7TNHJNgNSP/ZZnh8XgNHLDe0nJfKmX/YLSE
 9U1g==
X-Gm-Message-State: AOJu0YxvMuAAI5XJCfXXrj8x4Pt1qo2C5xWWgOhtV+ezpBlFyrF9pZWS
 MBRr4pcXUURyfLR6znvZKHTRYAoIqhTpV0NJocckUXid
X-Google-Smtp-Source: AGHT+IE3t/ddpXjrBmhrfRFVxZGnzD+yLi8GKhFUKwmloGrc4lg/qBqgfdNqpfFBPOOYYUO6PcOb3w==
X-Received: by 2002:a17:906:d4:b0:a19:a1ba:8cbb with SMTP id
 20-20020a17090600d400b00a19a1ba8cbbmr4223132eji.89.1701799526473; 
 Tue, 05 Dec 2023 10:05:26 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 uz14-20020a170907118e00b00a0104d5758dsm7004694ejb.50.2023.12.05.10.05.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 10:05:25 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-40b422a274dso2975e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 10:05:25 -0800 (PST)
X-Received: by 2002:a05:600c:5247:b0:405:320a:44f9 with SMTP id
 fc7-20020a05600c524700b00405320a44f9mr573795wmb.5.1701799525559; Tue, 05 Dec
 2023 10:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20231201-x1e80100-drm-panel-edp-v2-1-b0173484631a@linaro.org>
 <CAD=FV=Wx_W-Jspx4S4k-Jze8eBm5zGanzqt0-fWjYZhHB_=1qQ@mail.gmail.com>
In-Reply-To: <CAD=FV=Wx_W-Jspx4S4k-Jze8eBm5zGanzqt0-fWjYZhHB_=1qQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 5 Dec 2023 10:05:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VmY8OPfW9awuikUdL8h=vphoeGLwfKmsyZjvQou9MCGA@mail.gmail.com>
Message-ID: <CAD=FV=VmY8OPfW9awuikUdL8h=vphoeGLwfKmsyZjvQou9MCGA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: Add SDC ATNA45AF01
To: Abel Vesa <abel.vesa@linaro.org>
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

Hi,

On Mon, Dec 4, 2023 at 8:46=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Mon, Dec 4, 2023 at 12:54=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> =
wrote:
> >
> > Add support for the SDC ATNA45AF01 panel.
> >
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> > - moved the panel entry in the proper place, as suggested by Doug
> > - Link to v1: https://lore.kernel.org/r/20231201-x1e80100-drm-panel-edp=
-v1-1-ef9def711d8a@linaro.org
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index 825fa2a0d8a5..78565c99b54d 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -1983,6 +1983,8 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
> >         EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD1=
16N2930A15"),
> >         EDP_PANEL_ENTRY('K', 'D', 'B', 0x1120, &delay_200_500_e80_d50, =
"116N29-30NK-C007"),
> >
> > +       EDP_PANEL_ENTRY('S', 'D', 'C', 0x416d, &delay_100_500_e200, "AT=
NA45AF01"),
> > +
>
> Looks fine to me now. I will note that e200 is pretty long and I
> wonder if you've got this because of a requirement of T3+T4+T5+T6+T8
> being more than 200ms. If so, I wonder if Pin-yen's patch [1] would
> help you optimize things?
>
> In any case, this looks fine to me.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ...I'll wait a day in case you say this would be better atop Pin-yen's
> patch and want me to wait, but I also have no objections to landing
> this now and later optimizing the delays.
>
> [1] https://crrev.com/c/5052150

Pushed to drm-misc-next.

8ebb1fc2e69a drm/panel-edp: Add SDC ATNA45AF01

If you can optimize this after Pin-yen's patch, feel free to send another p=
atch.

-Doug
