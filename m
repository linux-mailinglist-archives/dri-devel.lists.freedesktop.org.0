Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39477E5BEF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 18:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E304E10E7F7;
	Wed,  8 Nov 2023 17:04:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4999810E7F7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 17:04:26 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9d242846194so1078647566b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 09:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1699463063; x=1700067863;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LDcupbe+5qAO0hhDSEHW5GSzZCVe/uaRnl7TSsp+HAs=;
 b=UTvYTEXAW8wAPmbGREi0Tmn3zDfPPEb8/dbXPIoILJhJoYybOd1Smu525/dyRWy168
 0lrts5b8PQcepZHJRoF5M68ssqIxIQN1PqJh+VLjrdSypsmLdhmTkszaizfwdj85VsRb
 6vm6hLTfIAGLXZw93HNvxjKBhMH46opWwiOAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699463063; x=1700067863;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDcupbe+5qAO0hhDSEHW5GSzZCVe/uaRnl7TSsp+HAs=;
 b=Tk6PNQJQhD+1URHsJKyJlwzIQMi40Ns3xfcReCLCWTwQU+kamjAAnq4ij0pNcNa9CN
 ssyHtlqRIzg1p/oYVncjZ2S57piKYflKjGAdHUp2/pbElQn3QNhI9ybYGBRByP5s9R5A
 pBDMtL6Eoa03WtigrXOU++/ZiaX0H+OnJR8qDlSXdmUWlsZBYWXd4jvu9tTX+Z3VAOW2
 kqv495L5yIiBEoJ6iIOcfRYR39+eLEtVonll5iHTCx4e/HUcgoB++IG4J9FWBzhUh3gI
 r3ZNmhKXWF2jcdcSu9yG73RAv9UQyb79i14sY+24rPrFsHBSKVGVmNm7mk6DPHcw0blJ
 kHEQ==
X-Gm-Message-State: AOJu0YwTEpVHANkdbVBJNthkDIymulBKQ+BO+R+4bsxw1mcHGhF/dnwL
 g5V5TJljzGUsVBuv1MYLAh0Xf6I/UR/pJoM66AkWb+T6
X-Google-Smtp-Source: AGHT+IHmCsFFNpUQhhYHgH3deU7tk/TrOFnX7PKRxMb75z92b6anE1xUYBon2/D3iAtmI9QfE+AWQw==
X-Received: by 2002:a17:907:26c4:b0:9e0:727a:e491 with SMTP id
 bp4-20020a17090726c400b009e0727ae491mr1871441ejc.35.1699463063267; 
 Wed, 08 Nov 2023 09:04:23 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 l22-20020a170906645600b009c921a8aae2sm1299676ejn.7.2023.11.08.09.04.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 09:04:23 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40853f2e93eso96405e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 09:04:22 -0800 (PST)
X-Received: by 2002:a05:600c:3110:b0:405:320a:44f9 with SMTP id
 g16-20020a05600c311000b00405320a44f9mr219580wmo.5.1699463062323; Wed, 08 Nov
 2023 09:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20231107204611.3082200-1-hsinyi@chromium.org>
 <20231107204611.3082200-5-hsinyi@chromium.org>
 <xnyf3ul7pwsgrmxgbareh5lhhmpfuvfksj3nyd4zmup7khaer2@fbwgbrq4vywb>
In-Reply-To: <xnyf3ul7pwsgrmxgbareh5lhhmpfuvfksj3nyd4zmup7khaer2@fbwgbrq4vywb>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Nov 2023 09:04:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WuwJGsDraFt=i0NbN-HkocsYgL=kCrZTxqVN+Oo1u8pg@mail.gmail.com>
Message-ID: <CAD=FV=WuwJGsDraFt=i0NbN-HkocsYgL=kCrZTxqVN+Oo1u8pg@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Nov 8, 2023 at 7:45=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> > @@ -575,9 +599,18 @@ static int panel_edp_get_modes(struct drm_panel *p=
anel,
> >
> >               if (!p->edid)
> >                       p->edid =3D drm_get_edid(connector, p->ddc);
> > -
> > -             if (p->edid)
> > -                     num +=3D drm_add_edid_modes(connector, p->edid);
> > +             if (p->edid) {
> > +                     if (has_override_edid_mode) {
>
> It's not clear to me why the override mechanism is only there when
> there's a ddc bus?

I think you're confusing the two different (but related) issues
addressed by this series. One is when you're using the generic
"edp-panel" compatible string. In that case the mode comes from the
EDID and only the EDID since there's no hardcoded mode. We need a mode
override there since some EDIDs shipped with a bad mode. That's the
subject of ${SUBJECT} patch.

The second issue is what to do with a hardcoded mode. That's the
subject of the next patch in the series (patch #5). Previously we
merged the hardcoded and EDID modes. Now (in the next patch) we use
only the hardcoded mode. There's no need for a fixup because the mode
is hardcoded in the kernel.


> You mentioned before that you were following panel-simple,

As of the newest version of the patch, it's no longer following
panel-simple in response to your feedback on previous versions.

> but that's a
> clear deviation from what I can see. If there's a reason for that
> deviation, that's fine by me, but it should at least be documented in
> the commit log.

I think the commit log is OK. I suspect the confusion is only because
you've reviewed previous versions of the series. Please shout if
things still look confusing.


> > @@ -950,6 +983,19 @@ static const struct panel_desc auo_b101ean01 =3D {
> >       },
> >  };
> >
> > +static const struct drm_display_mode auo_b116xa3_mode =3D {
> > +     .clock =3D 70589,
> > +     .hdisplay =3D 1366,
> > +     .hsync_start =3D 1366 + 40,
> > +     .hsync_end =3D 1366 + 40 + 40,
> > +     .htotal =3D 1366 + 40 + 40 + 32,
> > +     .vdisplay =3D 768,
> > +     .vsync_start =3D 768 + 10,
> > +     .vsync_end =3D 768 + 10 + 12,
> > +     .vtotal =3D 768 + 10 + 12 + 6,
> > +     .flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> > +};
>
> That should be a separate patch

That's fair. I didn't think it was a huge deal, but I agree that it's
slightly cleaner.

-Doug
