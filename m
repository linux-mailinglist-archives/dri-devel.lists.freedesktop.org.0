Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2437E75DF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD6D10E38F;
	Fri, 10 Nov 2023 00:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F68510E38F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:19:27 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-53e70b0a218so2424883a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699575564; x=1700180364;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mrwEGwvAYg6tlhnlsOoqbubdC8uRYqTrfQGGYbxS8Nc=;
 b=W5QCadNUPA3CcS28kJ1tgeWskbLPZTNXUeA+81ICfqWwGqReufkukUeL+PnV+TaX8l
 NfX5GLDpP6Cz59kh8X2fE2vdSTBhNno4EY5DkcJ2OwP334oZK+yR5ux4xce70wZDRBbx
 jRCL/sARESmycPdKv5VsaczOXETLGOL3T2woA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699575564; x=1700180364;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrwEGwvAYg6tlhnlsOoqbubdC8uRYqTrfQGGYbxS8Nc=;
 b=u/gCJx3ZzMq/b82yeSJ3wrdheJK3b1gMa712+Jh13nbgxRxuYy+VoGo4jVJ/0v3WBB
 VNlx3sj587LwgqWgDLHzAaqLouCAOlGjrgkGGC2Jsv8Y6Reosuo1EY3YWfr1jjDovoWB
 i6lSANLjZpow9WAE1b+lPEInu3YU3n9+EGg4KilRSSl1Rd1lh1cEsNIPDZdD+MnccODw
 0R9IUdJuHpQ8TFSzpjXf0mwu6YwuuXH+zmMt1SexSjRi36B868zoNnl9/Zc1MM01CV53
 B2xH/xRG65wSuM9Hgvx9NMG473q9jASp8PMTv2JkNF1d74W1gT7cT6ZjFO8Ah2Vu1v9y
 O2hA==
X-Gm-Message-State: AOJu0YwZO4ymMuPzq6ZbRUsqLrViXG5QBw1rpB+zoYXdj/w54OR03Pkm
 fAmhw4uItnw2FNGSQR6UuavFzVzldr+11IKdDg40yA==
X-Google-Smtp-Source: AGHT+IE9Fatwgun8GYN3zkA/iUdv8GXVV456y9FutGkKy4P7UeLXE++p7A2q/pC8NhBUWRoPJUxRcw==
X-Received: by 2002:a50:a68b:0:b0:53e:4dc6:a2e8 with SMTP id
 e11-20020a50a68b000000b0053e4dc6a2e8mr5940902edc.19.1699575564086; 
 Thu, 09 Nov 2023 16:19:24 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45]) by smtp.gmail.com with ESMTPSA id
 1-20020a508741000000b0053e5f67d637sm455582edv.9.2023.11.09.16.19.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 16:19:23 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40a426872c6so66215e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 16:19:23 -0800 (PST)
X-Received: by 2002:a05:600c:a45:b0:405:320a:44f9 with SMTP id
 c5-20020a05600c0a4500b00405320a44f9mr286238wmq.5.1699575563245; Thu, 09 Nov
 2023 16:19:23 -0800 (PST)
MIME-Version: 1.0
References: <20231107204611.3082200-1-hsinyi@chromium.org>
 <20231107204611.3082200-5-hsinyi@chromium.org>
 <xnyf3ul7pwsgrmxgbareh5lhhmpfuvfksj3nyd4zmup7khaer2@fbwgbrq4vywb>
 <CAD=FV=WuwJGsDraFt=i0NbN-HkocsYgL=kCrZTxqVN+Oo1u8pg@mail.gmail.com>
In-Reply-To: <CAD=FV=WuwJGsDraFt=i0NbN-HkocsYgL=kCrZTxqVN+Oo1u8pg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Nov 2023 16:19:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vq4eMh0sKZn4qwT4vtxvKjZ48xkEZ7QUbBybDRyVdMVw@mail.gmail.com>
Message-ID: <CAD=FV=Vq4eMh0sKZn4qwT4vtxvKjZ48xkEZ7QUbBybDRyVdMVw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] drm/panel-edp: Add override_edid_mode quirk for
 generic edp
To: Maxime Ripard <mripard@kernel.org>
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 8, 2023 at 9:04=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Wed, Nov 8, 2023 at 7:45=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> >
> > > @@ -575,9 +599,18 @@ static int panel_edp_get_modes(struct drm_panel =
*panel,
> > >
> > >               if (!p->edid)
> > >                       p->edid =3D drm_get_edid(connector, p->ddc);
> > > -
> > > -             if (p->edid)
> > > -                     num +=3D drm_add_edid_modes(connector, p->edid)=
;
> > > +             if (p->edid) {
> > > +                     if (has_override_edid_mode) {
> >
> > It's not clear to me why the override mechanism is only there when
> > there's a ddc bus?
>
> I think you're confusing the two different (but related) issues
> addressed by this series. One is when you're using the generic
> "edp-panel" compatible string. In that case the mode comes from the
> EDID and only the EDID since there's no hardcoded mode. We need a mode
> override there since some EDIDs shipped with a bad mode. That's the
> subject of ${SUBJECT} patch.
>
> The second issue is what to do with a hardcoded mode. That's the
> subject of the next patch in the series (patch #5). Previously we
> merged the hardcoded and EDID modes. Now (in the next patch) we use
> only the hardcoded mode. There's no need for a fixup because the mode
> is hardcoded in the kernel.
>
>
> > You mentioned before that you were following panel-simple,
>
> As of the newest version of the patch, it's no longer following
> panel-simple in response to your feedback on previous versions.
>
> > but that's a
> > clear deviation from what I can see. If there's a reason for that
> > deviation, that's fine by me, but it should at least be documented in
> > the commit log.
>
> I think the commit log is OK. I suspect the confusion is only because
> you've reviewed previous versions of the series. Please shout if
> things still look confusing.
>
>
> > > @@ -950,6 +983,19 @@ static const struct panel_desc auo_b101ean01 =3D=
 {
> > >       },
> > >  };
> > >
> > > +static const struct drm_display_mode auo_b116xa3_mode =3D {
> > > +     .clock =3D 70589,
> > > +     .hdisplay =3D 1366,
> > > +     .hsync_start =3D 1366 + 40,
> > > +     .hsync_end =3D 1366 + 40 + 40,
> > > +     .htotal =3D 1366 + 40 + 40 + 32,
> > > +     .vdisplay =3D 768,
> > > +     .vsync_start =3D 768 + 10,
> > > +     .vsync_end =3D 768 + 10 + 12,
> > > +     .vtotal =3D 768 + 10 + 12 + 6,
> > > +     .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > > +};
> >
> > That should be a separate patch
>
> That's fair. I didn't think it was a huge deal, but I agree that it's
> slightly cleaner.

I've pushed the first 3 patches but not this patch nor the next one.
It wouldn't hurt to split patch #4 as Maxime requests and then send
the split patch #4 plus patch #5 as a v7. It's probably worth holding
off until either some time passes or Maxime responds and says that his
other concerns are addressed.


-Doug
