Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6175386BCB9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 01:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A62C210E02C;
	Thu, 29 Feb 2024 00:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JHKHR3lq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0506010E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 00:21:54 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so530273a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709166110; x=1709770910;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QMYd+3PehQzWrhjo72mtYlH8CA55wcaPeIXXwpZd4Nk=;
 b=JHKHR3lqQ4V8jz4/pUpCmxZ4yKfCiFg4mKaQYe00qhsWK1/UzUBhCc7lvXBXbcc9gY
 K0iR/BFTb/9nWckQj5FavWoOnLOGkx68s70mJO09KDTn4w84JWnwrXbcUzyJaSwV29Jd
 VR/boUa3TUztgxmgd54fNDHdfiAc8Uc6ypK+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709166110; x=1709770910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QMYd+3PehQzWrhjo72mtYlH8CA55wcaPeIXXwpZd4Nk=;
 b=fEWhi9ls3rTq16DhA4NUsAXkRfTEvC66wWevr8MOxMWFKOcnqdLj9m2mWeyBB9AasU
 rW2djeeDgdvSLxuxXu25eFNCKql0BjG7soWjME/8vCmqszLwyw87JsMWzwWrrOZOWxzP
 c3DfvsZXwRJ0/RW5zUJBmH41n5eZw4RXWtDsWTYGbobN1oXSF+jDopsxZ810cDqH1MGM
 fZ10dkKYZm+QqV5ZU3P3G6wZxkw94Ub7CIb8b/nVScTY76Y5oDmY/uEyoTbk7bV+XpWP
 bj8PoOG6gtE9UxBojTpEfs8WG4bEvcpJ/5CmBz4ZPog7mJUEXU0JhnbPSCERI77mpckQ
 hCWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5VUrcyyjR2E66kbtIBXzgxNm+KggZ2cA+ix5ipNCUz4x+brwngRSBlsHzdFymwKHewfcb1422qkLkqG9bya5kLGKWZgz3jygP54BI14GL
X-Gm-Message-State: AOJu0YyxhCRTauQwPJAbEWDkT22ki3cJc5o5QCkLVeecYc4Zq4BZah2Y
 yvU4uu6SBPsD04QypfD5miqDnbGhj+jfvHR0TH31+bfFVztt1xFLbYXvfJXhp4yE8ta28rxg85t
 NE7PS
X-Google-Smtp-Source: AGHT+IENj/6O+aGjqUMdqIGlXg+ok+8g+aMX0e2cbPTDISwgK0ZBJMqJkrNGbH3kZBOWxRfRewL3aQ==
X-Received: by 2002:a17:906:f1cc:b0:a3f:7d84:4d2e with SMTP id
 gx12-20020a170906f1cc00b00a3f7d844d2emr293322ejb.30.1709166110292; 
 Wed, 28 Feb 2024 16:21:50 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 a21-20020a170906245500b00a442299199esm71558ejb.86.2024.02.28.16.21.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 16:21:50 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4129a5f7b54so15575e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:21:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW62pNof2f2rNQy1/Oe2h78zqEnzoqrLTDaH+M2MfbIKhVDbAbcDHG8VtsZq4ZF9/0jzLvXgYHDU2tW5fc1q5RAyHRLKzqhQFFDyqAfGYBO
X-Received: by 2002:a05:600c:a386:b0:412:aa80:bdd9 with SMTP id
 hn6-20020a05600ca38600b00412aa80bdd9mr37037wmb.2.1709166108715; Wed, 28 Feb
 2024 16:21:48 -0800 (PST)
MIME-Version: 1.0
References: <20240228011133.1238439-1-hsinyi@chromium.org>
 <20240228011133.1238439-3-hsinyi@chromium.org>
In-Reply-To: <20240228011133.1238439-3-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Feb 2024 16:21:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VMVr+eJ7eyuLGa671fMgH6ZX9zPOkbKzYJ0H79MZ2k9A@mail.gmail.com>
Message-ID: <CAD=FV=VMVr+eJ7eyuLGa671fMgH6ZX9zPOkbKzYJ0H79MZ2k9A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panel: panel-edp: Match edp_panels with panel
 name
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

On Tue, Feb 27, 2024 at 5:11=E2=80=AFPM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> @@ -2107,13 +2113,41 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         { /* sentinal */ }
>  };
>
> -static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
> +static bool edid_has_name(struct edid *edid, const char *panel_name)
> +{
> +       int i, j;
> +       char buf[13];
> +

Should have some comment about why this can't use
drm_edid_get_monitor_name(). AKA because panels seem to be storing the
monitor name tagged as raw strings instead of as the name. Should
probably also have some of the other checks from
is_display_descriptor() like checking for clock of 0 and pad1 of 0.


> +       for (i =3D 0; i < 4; i++) {

Instead of 4, I think this can be ARRAY_SIZE(edid->detailed_timings), right=
?


> +               strncpy(buf, edid->detailed_timings[i].data.other_data.da=
ta.str.str,
> +                       sizeof(buf));

I can never quite remember which of the strXcpy() routines are frowned
upon and which are the golden children at the moment. ...but I don't
think we really need the copy nor the local buffer anyway, right?
You're already going through this thing 1 byte at a time so just
compare it straight away.


> +               for (j =3D 0; j < 13; j++) {
> +                       if (buf[j] =3D=3D 0x0a) {

Instead of hardcoding 0x0a, I think you want '\n', no?


> +                               buf[j] =3D '\0';
> +                               break;
> +                       }
> +               }
> +               buf[12] =3D '\0';
> +               if (strncmp(panel_name, buf, strlen(panel_name)) =3D=3D 0=
)
> +                       return true;

Untested, but I think with my suggestions above the function becomes this:

static bool edid_has_name(struct edid *edid, const char *panel_name)
{
    int i, j;

    /*
     * We can't use drm_edid_get_monitor_name() since many eDP panels store
     * their name as a raw string. We'll accept either a string or name
     * match as long as the panel ID also matches.
     */
    for (i =3D 0; i < ARRAY_SIZE(edid->detailed_timings); i++) {
        struct detailed_timing *timing =3D &edid->detailed_timings[i];

        if (timing->pixel_clock !=3D 0 ||
            timing->data.other_data.pad1 !=3D 0 ||
            (timing->data.other_data.type !=3D EDID_DETAIL_MONITOR_NAME &&
             timing->data.other_data.type !=3D EDID_DETAIL_MONITOR_STRING))
                continue;

        for (j =3D 0; j < ARRAY_SIZE(timing->data.other_data.data.str.str);=
 j++) {
            const char *str =3D timing->data.other_data.data.str.str;

            if (panel_name[j] =3D=3D '\0') {
                if (str[j] =3D=3D '\0' || str[j] =3D=3D '\n')
                    return true;
                break;
            }
        }
        if (j =3D=3D ARRAY_SIZE(timing->data.other_data.data.str.str) &&
            panel_name[j] =3D=3D '\0')
            return true;
    }

    return false;
}
