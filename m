Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D508814AC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 16:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1DC10E260;
	Wed, 20 Mar 2024 15:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="CXoD/OwO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31D610E260
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 15:33:49 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-788598094c4so336385a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 08:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710948826; x=1711553626;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pCH7549YteOOW6HeX4A3z5hOw7RsA+5n+WLyWoVNDYw=;
 b=CXoD/OwO87DlyTS2+LYVkMfGSqrIxjfNSM8vthA74KixBaE6sInKHH8QAmyEX08KzR
 6jiD0jxOl+NO5kqzlGJR3Xp+aM68bWnqeX4AsSowFed0wHUSzmT36IUeDJVnULREUb5C
 YK1zhGwdV/QBteWoCw643UWdnz0cBIfvCAS3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710948826; x=1711553626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pCH7549YteOOW6HeX4A3z5hOw7RsA+5n+WLyWoVNDYw=;
 b=vFtTSc+nvfV/NB6UKFVitXb1I17dJExrL8mo2iRCz6PMGafpqJe6EUmFO40519UzCU
 hot476tkPwrkMuPJt6bAMXrB3HTBCMJQ6LC2Of+nFXztCxbubC/HzO+bwihdOJEzYgfU
 1axsCDJm9LeXf0SjWfArTN+3lxR16zP39KCxPVFuXS4F/OvnqQ6aeCMJDaFJQf1b17qf
 tVqV16R/NkQZKn/WhGDyeGjwAqSdENqNsYH31VQe20w+UCs9roNSPlcTfEyxNc5Rw8wb
 jw64MmDUzcRJlT1JO9LWNRXSCQhvz8qddP1Nudnf3bBA5XaMmnBZBiGqTG8JiR+pRg8G
 V3+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg4DIPFYgx6s4frJvT/B+i5EMSd59DLSylL0sonkOhRlF4ViFN4ckSUZDgbLdtGKWN0slyyZ6+j2hSJhsSPmwqUuA7vHsxR/YemQFCo8rS
X-Gm-Message-State: AOJu0YwB3fOPTQknsg7zNHs8WCPMIJeIcJ0Q/HncpQWk3MzPw4ujA9nf
 vPR8UOv7oKOKYnAEPete5K6ebBhzwbe+OHEE3bK+I+ZX/VWPCtV5WHQKFOv1FKvygicl22bTdrj
 2TX9N
X-Google-Smtp-Source: AGHT+IEkolBAyxX01ScACXbbYH7uF9iowV9x4Eeo9OIH72zcbuwEhyNMZQ7ergFoAsvweTL+Bm+V4A==
X-Received: by 2002:a05:620a:40d0:b0:78a:f5b:ed05 with SMTP id
 g16-20020a05620a40d000b0078a0f5bed05mr7465561qko.22.1710948826270; 
 Wed, 20 Mar 2024 08:33:46 -0700 (PDT)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com.
 [209.85.160.177]) by smtp.gmail.com with ESMTPSA id
 de35-20020a05620a372300b0078835bfddb8sm6669045qkb.84.2024.03.20.08.33.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 08:33:45 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-430e1e06e75so400581cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 08:33:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzr62I2+loaS8vzKLXZMdbPRDYh5Km+dfqRauiANFtvNvAJaWcOxtRpGh7Qlhb9S8UbXBpz9vuAYAPvYGli3F+yYmnhH1JNRN1kyfeaAIb
X-Received: by 2002:a05:622a:1115:b0:430:e423:240b with SMTP id
 e21-20020a05622a111500b00430e423240bmr254318qty.9.1710948824786; Wed, 20 Mar
 2024 08:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240313-homestarpanel-regulator-v1-1-b8e3a336da12@chromium.org>
 <098d8dda-75fe-45b8-ad36-a21ed44c4555@quicinc.com>
In-Reply-To: <098d8dda-75fe-45b8-ad36-a21ed44c4555@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 20 Mar 2024 08:33:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WE4Y1Nk8UL+z7fLsU=zr-Y_2vQe0xuBSbg8_1CLRQjYQ@mail.gmail.com>
Message-ID: <CAD=FV=WE4Y1Nk8UL+z7fLsU=zr-Y_2vQe0xuBSbg8_1CLRQjYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: atna33xc20: Fix unbalanced regulator in the
 case HPD doesn't assert
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
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

On Thu, Mar 14, 2024 at 3:32=E2=80=AFPM Jessica Zhang <quic_jesszhan@quicin=
c.com> wrote:
>
> On 3/13/2024 2:12 PM, Douglas Anderson via B4 Relay wrote:
> > From: Douglas Anderson <dianders@chromium.org>
> >
> > When the atna33xc20 driver was first written the resume code never
> > returned an error. If there was a problem waiting for HPD it just
> > printed a warning and moved on. This changed in response to review
> > feedback [1] on a future patch but I accidentally didn't account for
> > rolling back the regulator enable in the error cases. Do so now.
> >
> > [1] https://lore.kernel.org/all/5f3cf3a6-1cc2-63e4-f76b-4ee686764705@li=
naro.org/
> >
> > Fixes: 3b5765df375c ("drm/panel: atna33xc20: Take advantage of wait_hpd=
_asserted() in struct drm_dp_aux")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >   drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 22 +++++++++++++--=
-------
> >   1 file changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers=
/gpu/drm/panel/panel-samsung-atna33xc20.c
> > index 76c2a8f6718c..9c336c71562b 100644
> > --- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> > +++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
> > @@ -109,19 +109,17 @@ static int atana33xc20_resume(struct device *dev)
> >               if (hpd_asserted < 0)
> >                       ret =3D hpd_asserted;
> >
> > -             if (ret)
> > +             if (ret) {
> >                       dev_warn(dev, "Error waiting for HPD GPIO: %d\n",=
 ret);
> > -
> > -             return ret;
> > -     }
> > -
> > -     if (p->aux->wait_hpd_asserted) {
> > +                     goto error;
> > +             }
> > +     } else if (p->aux->wait_hpd_asserted) {
>
> Hi Doug,
>
> Acked-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Pushed with Jessica's Ack to drm-misc-next.

5e842d55bad7 drm/panel: atna33xc20: Fix unbalanced regulator in the
case HPD doesn't assert

I chose drm-misc-next instead of drm-misc-fixes because this isn't
super urgent and the patch would have to be modified on drm-misc-fixes
because we don't have commit 8df1ddb5bf11 ("drm/dp: Don't attempt AUX
transfers when eDP panels are not powered") there.
