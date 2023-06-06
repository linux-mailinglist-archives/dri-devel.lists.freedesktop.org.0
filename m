Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ADF7247BA
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 17:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ACBC10E372;
	Tue,  6 Jun 2023 15:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B0A10E373
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 15:29:12 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-774867fd6f7so200824039f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686065351; x=1688657351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FicGEFlUfAYOIaGezdZ6xTGOhAj3FNMamu1kcWTnkk0=;
 b=A7LgQ6PthT+SBbAIObzLUORX8Q5cq4LZxoNHVH/jcDuM718fCWYlzNIGiF1/YU3jW3
 sL44MJMVpWS8gf7HEImdGYIBEXLhrq+PCGB/jm3VP+3Qdtk7QQ527lYD5eMu2iQ0A18i
 7VR2tVfpxnsXNUoIY/hYBlfOLfiz7kWV59j0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686065351; x=1688657351;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FicGEFlUfAYOIaGezdZ6xTGOhAj3FNMamu1kcWTnkk0=;
 b=LuzT8Q7ChCOzWBKljSNbuKV1aCv0exuE4IxLpSwy/tXtqNpBPQXIjJtydaxQ7141Xs
 htIBmNh0m74MedzVPAHWM3YYpzxsWxe/9eVV89hc8agFxzGT/BQpe51+ULWuIgZB5QC0
 0NGXJsdiYHK/slc6tidx4yXLQUBp+9FUeuT7M6M3ETWy6Ag/8Xu26UHH2kvmPLr8o9tm
 EyR1UsA1i600o+aHVjAr6VethSJYL21mTAgDLLUEFvtbMjZA1OvCRSgXV+3B7pZsV26Q
 wZJLdigRStdC3741sKHBuBGuSVazCfQBjVlTmY3Zg6H0YNmSLSJYkaRZ+AUyiigYQQTv
 USiA==
X-Gm-Message-State: AC+VfDw0n+un0H/EmTCEho+OKoRd/nKei6h/aVBFZhNlDyfXcHLNvSKk
 NZ/eMDIJw7viMkMfooSAtChaLUNYuQDTFmMquXo=
X-Google-Smtp-Source: ACHHUZ54fZ00TL1HpgfVViXOkBHORVFMEmrgcUvE7rFKEfXwU0nXCpNLoQCMSoAPkdlNthXxs3oKcA==
X-Received: by 2002:a6b:7a0c:0:b0:776:f992:78cf with SMTP id
 h12-20020a6b7a0c000000b00776f99278cfmr3096895iom.12.1686065351300; 
 Tue, 06 Jun 2023 08:29:11 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169]) by smtp.gmail.com with ESMTPSA id
 r4-20020a5e9504000000b0076c70f8c4d1sm1339626ioj.45.2023.06.06.08.29.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 08:29:08 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-33dea7d5424so148145ab.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 08:29:08 -0700 (PDT)
X-Received: by 2002:a05:6e02:1a02:b0:33d:67c9:a486 with SMTP id
 s2-20020a056e021a0200b0033d67c9a486mr229492ild.26.1686065347967; Tue, 06 Jun
 2023 08:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230606075527.155346-1-suhui@nfschina.com>
In-Reply-To: <20230606075527.155346-1-suhui@nfschina.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 6 Jun 2023 08:28:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X_n4Si3k4iQ0yRJZRqX2DuhGF2pjPqEzbiKqBY3ZCNHg@mail.gmail.com>
Message-ID: <CAD=FV=X_n4Si3k4iQ0yRJZRqX2DuhGF2pjPqEzbiKqBY3ZCNHg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Avoid possible buffer overflow
To: Su Hui <suhui@nfschina.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, u.kleine-koenig@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 6, 2023 at 12:56=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> Smatch error:buffer overflow 'ti_sn_bridge_refclk_lut' 5 <=3D 5.
>
> Fixes: cea86c5bb442 ("drm/bridge: ti-sn65dsi86: Implement the pwm_chip")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 7a748785c545..952aae4221e7 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -305,7 +305,8 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn=
65dsi86 *pdata)
>          * The PWM refclk is based on the value written to SN_DPPLL_SRC_R=
EG,
>          * regardless of its actual sourcing.
>          */
> -       pdata->pwm_refclk_freq =3D ti_sn_bridge_refclk_lut[i];
> +       if (i < refclk_lut_size)
> +               pdata->pwm_refclk_freq =3D ti_sn_bridge_refclk_lut[i];

I don't think this is quite the right fix. I don't think we can just
skip assigning "pdata->pwm_refclk_freq". In general I think we're in
pretty bad shape if we ever fail to match a refclk from the table and
I'm not quite sure how the bridge chip could work at all in this case.
Probably that at least deserves a warning message in the logs. There's
no place to return an error though, so I guess the warning is the best
we can do and then we can do our best to do something reasonable.

In this case, I think "reasonable" might be that if the for loop exits
and "i =3D=3D refclk_lut_size" that we should set "i" to 1. According to
the datasheet [1] setting a value of 5 (which the existing code does)
is the same as setting a value of 1 (the default) and if it's 1 then
we'll be able to look this up in the table.


[1] https://www.ti.com/lit/gpn/sn65dsi86

-Doug
