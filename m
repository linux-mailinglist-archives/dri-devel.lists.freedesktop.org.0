Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E8880AB8D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 19:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67B710E2C1;
	Fri,  8 Dec 2023 18:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C3310EB10
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 18:03:06 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso31329925e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 10:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702058582; x=1702663382;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x3YRss47xnMGqZS9eyxF6Bb3QwsBBbhLuc27vQZjpGQ=;
 b=hXh2H0ttVjB91x+oEldHXy8bEJ8yr86FQyBWj9MkaG9zcIGDx71a2034CaxXC0KIL5
 pzxz663h5yahJmkLvvvl3fUhawxxRtiME9Jc8+6/aGFQ5H+GZo7YkrmQcXS7a/+kRcIQ
 UZmf4MtyFXr3e6SzalrcuBgMBLgHeI2KjqWFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702058582; x=1702663382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x3YRss47xnMGqZS9eyxF6Bb3QwsBBbhLuc27vQZjpGQ=;
 b=id0b8POBmJCgQgZnVEynfQ6zP+1+CidRFMQ+9J1jDd9sJWIBBEVkfG/IgjKr9vuNw9
 lCmN4yF2eMONdUdG+9d1PSjKrI+jl2uunfnHIYL68t/1Kh++KLfz42EBYfHF1Lnc2SSD
 /HEx7LaAE79U/3sNgByHcY/Bh93EH8fPKlDWILRHbcpar2S2kobjQ6S0xHqJOQ/Ksy+X
 FLqZZN0oYVy/Oc3gxgq/0O4RWMRoPbKSJ51MQ63qMemZU734h4lNreki1LEflYiIhkeq
 LzV++Xw960KJHYWpP8y05BwFdO5xZw/e1J9zoLCM5Fjca1Sji4tUtN/V2pGSJ5sYX+Ow
 INGA==
X-Gm-Message-State: AOJu0YzaqpQs/HARKrL2axIhunh3i1QQsIJzn0PW3cMuIlReJsDxmhi1
 uGhQvaFs9Xvb1EYiHsIFY1vSHge+WfdPNxJbXtMhkA7K
X-Google-Smtp-Source: AGHT+IHasH7Wg8IyrbmdhQs56POnUdkorNIKzKbEqgvgiFYDXXTTqCjtAMiFC6enaQJUT12wCT3pnw==
X-Received: by 2002:a05:600c:1705:b0:40c:36ed:c5c6 with SMTP id
 c5-20020a05600c170500b0040c36edc5c6mr224339wmn.29.1702058582536; 
 Fri, 08 Dec 2023 10:03:02 -0800 (PST)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 vh9-20020a170907d38900b00a1d18c142eesm1267364ejc.59.2023.12.08.10.03.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 10:03:02 -0800 (PST)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-40c3963f9fcso2045e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 10:03:01 -0800 (PST)
X-Received: by 2002:a05:600c:5113:b0:40b:4221:4085 with SMTP id
 o19-20020a05600c511300b0040b42214085mr78894wms.1.1702058581585; Fri, 08 Dec
 2023 10:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20231127101547.734061-2-u.kleine-koenig@pengutronix.de>
 <d50daa43b4f7a21245bef144e1c6d810@trvn.ru>
In-Reply-To: <d50daa43b4f7a21245bef144e1c6d810@trvn.ru>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Dec 2023 10:02:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WE_x8Q=xoMbiC6cmKKe+HAivzxfF1GCKwiLxX52CYnxw@mail.gmail.com>
Message-ID: <CAD=FV=WE_x8Q=xoMbiC6cmKKe+HAivzxfF1GCKwiLxX52CYnxw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Associate PWM device to
 auxiliary device
To: Nikita Travkin <nikita@trvn.ru>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Bjorn Andersson <andersson@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 kernel@pengutronix.de, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Dec 8, 2023 at 9:30=E2=80=AFAM Nikita Travkin <nikita@trvn.ru> wrot=
e:
>
> Uwe Kleine-K=C3=B6nig =D0=BF=D0=B8=D1=81=D0=B0=D0=BB(=D0=B0) 27.11.2023 1=
5:15:
> > It's the ti_sn65dsi86.pwm auxiliary driver that creates the pwmchip, so
> > let the auxiliary device be the parent of the pwm device.
> >
> > Note that getting a reference to the ti-sn65dsi86's pwm using pwm_get()
> > isn't affected by this change as ti_sn65dsi86_add_aux_device() sets the
> > auxiliary device's of_node to that of the main device.
> >
> > Also change PM runtime tracking and diagnostic messages to use that one=
.
> > As the PM runtime functions also handle parent devices this should work
> > fine, too.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >
> > this patch has an (easy to resolve) conflict with a patch I sent earlie=
r
> > "drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()"
> > (https://lore.kernel.org/dri-devel/20231123175425.496956-2-u.kleine-koe=
nig@pengutronix.de).
> > I was unsure if I should base this new patch on that older one.
> >
> > While I think the patch is fine, I'd have a better feeling about it if
> > someone could give feedback that the PWM still works as intended with
> > this change.
> >
>
> Hi, with this patch applied, pwm backlight fails to
> probe on sc7180-acer-aspire1:
>
> [    0.377853] pwm-backlight backlight: failed to apply initial PWM state=
: -13
> [    0.378349] pwm-backlight: probe of backlight failed with error -13
>
> Seems like the pwmchip device should get runtime_pm enabled?

Glad you checked. Thanks!


> The following patch seem to fix it.
>
> Nikita
>
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 254f0039dad2..b6813f9f6a8f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1593,6 +1593,8 @@ static int ti_sn_pwm_probe(struct auxiliary_device =
*adev,
>         pdata->pchip.of_xlate =3D of_pwm_single_xlate;
>         pdata->pchip.of_pwm_n_cells =3D 1;
>
> +       pm_runtime_enable(&adev->dev);
> +

I think you'd want devm_pm_runtime_enable(), which looks safe in this case.

-Doug
