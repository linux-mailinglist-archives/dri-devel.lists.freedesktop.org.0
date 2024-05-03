Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9614F8BB168
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 19:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B4E10F883;
	Fri,  3 May 2024 17:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="dnw0x6GO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06D910F883
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 17:03:57 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-69b5ece41dfso37425006d6.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714755834; x=1715360634;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TVSe7pluKfDVQULV/YyS5WvGtcPrWiyKGEQwMLGF11s=;
 b=dnw0x6GOJqAjfJ/1hfx8OKG0xTugZbAa1HWVHby+nqDWyk9LLdk2+vTMRl++oNYUvY
 /cACDAgAjoYDujARxHn/fuwqTOl3Zs1rcy/kcRR0sMtfhCDmlAQzGyA/xd7CQvkFj1tl
 8hM45DMxmhONfA2JfkjupW3O8MvEwJ5M5/oaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714755834; x=1715360634;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TVSe7pluKfDVQULV/YyS5WvGtcPrWiyKGEQwMLGF11s=;
 b=NEjLtTaMFN228OUKjHWW2Qd1/nx8UNoeOJfWqgEk6IN5UQh9xk7pIp3MednhWCgHME
 FxqSnlkN+GrxiVmkLdvIfNULzn985MRqivjcRZ88Z6y8Dd19dk24oPWXhaMtPitYpzib
 dZgsjY75ur87puqvXm/IN5i/m5vCchlZWJBTcfSby1BZ0mQUAdgJbJFmL9WPtGp3sfjS
 APp297zzyrk5O48NwBxKHpWKODy+SQvi5FCD9Hxov8ZBgoRk+o+wTHR7k3xzhQ+gPHQb
 d+KPOHKTet8gWc6G0pxBKm+zf1nG/iBoMfnrw/HGzTJLIN48ULE11qP5/1+asFjpK/8+
 tAHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFxmSKe+65/IqZMJ+b5Ii42RuYKZS3gw9Om66BghzBSxsZA5Rhn6U06+/uUxlP4Xjv+JZ55oG/3WmrFggn1Aa04te9FfaLCS1KbUates33
X-Gm-Message-State: AOJu0YzI8z+3j0clnMZe1p5Ks0EMRpU2C1qoeHWAJdpgKI5PM8Cb06er
 b9vj4R6e/KEPvHBCnMf0dGUi2BItoUzovxkmODnSdyp0iBaZZwOaBaMCAqXz8AqzyXAOoQqEWdv
 CIg==
X-Google-Smtp-Source: AGHT+IGnlCdQDyWDjoQ5ieDko2K1YaXJmOhD9/uvm00JHd5BhJCAjbMCWnynvMKcwdCaNSEdVQQRzQ==
X-Received: by 2002:a05:6214:411:b0:6a0:d6c1:b795 with SMTP id
 z17-20020a056214041100b006a0d6c1b795mr3752742qvx.5.1714755834059; 
 Fri, 03 May 2024 10:03:54 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182]) by smtp.gmail.com with ESMTPSA id
 a5-20020a0cefc5000000b006a0edf4f67bsm1358757qvt.39.2024.05.03.10.03.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 10:03:53 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-439b1c72676so764851cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 10:03:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXvO8DdccP35vN/gsenbc2FcybXf5+PfrmsbFf1RW50skPNjKzbHITB5NEz4qlx5L3HvuEidTP0cs3QCZ9I5m8TXc5rbDYVBAt3Lv73P7NR
X-Received: by 2002:a05:622a:1a91:b0:43a:c278:83f9 with SMTP id
 d75a77b69052e-43cdbebd9ebmr3461811cf.3.1714755831481; Fri, 03 May 2024
 10:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
 <20240404-drop-panel-unregister-v1-5-9f56953c5fb9@linaro.org>
In-Reply-To: <20240404-drop-panel-unregister-v1-5-9f56953c5fb9@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 May 2024 10:03:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVyRGevshhkhzuXht+ePm3BXVyMhDOPOkFs72wZS_s_A@mail.gmail.com>
Message-ID: <CAD=FV=WVyRGevshhkhzuXht+ePm3BXVyMhDOPOkFs72wZS_s_A@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/panel: novatek-nt36672a: stop calling
 regulator_set_load manually
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, Harigovindan P <harigovi@codeaurora.org>,
 Ritesh Kumar <quic_riteshk@quicinc.com>, Sumit Semwal <sumit.semwal@linaro.org>,
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

On Thu, Apr 4, 2024 at 3:08=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Use .init_load_uA part of the bulk regulator API instead of calling
> register_set_load() manually.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu=
/drm/panel/panel-novatek-nt36672a.c
> index 33fb3d715e54..3886372415c2 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> @@ -605,21 +605,16 @@ static int nt36672a_panel_add(struct nt36672a_panel=
 *pinfo)
>         struct device *dev =3D &pinfo->link->dev;
>         int i, ret;
>
> -       for (i =3D 0; i < ARRAY_SIZE(pinfo->supplies); i++)
> +       for (i =3D 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
>                 pinfo->supplies[i].supply =3D nt36672a_regulator_names[i]=
;
> +               pinfo->supplies[i].init_load_uA =3D nt36672a_regulator_en=
able_loads[i];
> +       }
>
>         ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
>                                       pinfo->supplies);
>         if (ret < 0)
>                 return dev_err_probe(dev, ret, "failed to get regulators\=
n");
>
> -       for (i =3D 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
> -               ret =3D regulator_set_load(pinfo->supplies[i].consumer,
> -                                        nt36672a_regulator_enable_loads[=
i]);
> -               if (ret)
> -                       return dev_err_probe(dev, ret, "failed to set reg=
ulator enable loads\n");
> -       }

Thanks for the cleanup! I happened to notice this commit and I'm
curious why you didn't take the next step and move to
devm_regulator_bulk_get_const(). That would have allowed you to avoid
the "for" loop above that copies the data ;-)

-Doug
