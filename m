Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B0583CA60
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 18:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33C910E4A1;
	Thu, 25 Jan 2024 17:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B875E10E354
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 17:57:37 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-55c2cf644f3so4946650a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1706205396; x=1706810196;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QQ5xywaldx4inPhMAC8V1N2G9UQEtEowfFIay8eCsg=;
 b=P/SFxNl7ZEyn75oQRM+BvoeruIrU3SVlD1YxbitCnkXUCC7N9UPLBY8jeyBwe/6+H9
 1Ce4PI9z17StYmfFnox0vhKK3844A0H1wSNCfedTg8Up+qOm1sot4C/XinK/yeLOd3sE
 YlfhQM5CeAbRB9tjaLeMORM5bx5fl8HAsMJII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706205396; x=1706810196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7QQ5xywaldx4inPhMAC8V1N2G9UQEtEowfFIay8eCsg=;
 b=DjFrYETo3qwdxDZPTiAR2Puzsf9vd7qSiGLcWG+ZrVIzxgPiNaHswdCyyCd4T5w0xp
 qsB8772XRipZyR0TYL68nW2v2rS0bychAvuhKaUayiR1RxjPecdLTLyXb7McJ116QeL6
 0MhAcOvzxP9eoNxEdTN2fxO0h/MrA03vti3KWHFe/plUvBSI11tyNGQgQRDCm/JIcVYi
 TAPogQcG9Kbp6ymhIFkuvoeZRuV+aRfMOgGu9NlR+TxOppugn1PhrU9XKcSqMz1QC/eg
 TFE5RqERLJGgpKH/RCviGkPwMjHaqp1BsHn5nsFp4QBo22sJDunTpv+x90uJ5oR63myE
 /S5g==
X-Gm-Message-State: AOJu0YzL+8WEipmH1W7DTFH0PUxCst6e2BcdmWTqLr0SNnpHmrezCyeW
 FMzq/COLqRc0deIObijMIyttBuySiWsE2jpkKKVweJFWGjnoNTCVRJL2H2QK6+NrXPwQPy/M9rZ
 xUEpA
X-Google-Smtp-Source: AGHT+IGf1T4oaAT8X5PfGnpNoDzbl6rh0QLqqvatl+N737VSGZ3mwXHgQ9KODpO9NQ86cwWvT73iPw==
X-Received: by 2002:a17:906:eb45:b0:a30:d4a8:d05c with SMTP id
 mc5-20020a170906eb4500b00a30d4a8d05cmr657110ejb.80.1706205396035; 
 Thu, 25 Jan 2024 09:56:36 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 n13-20020a170906840d00b00a2a61b9c166sm1257484ejx.33.2024.01.25.09.56.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 09:56:35 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-55c89dbef80so149a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 09:56:35 -0800 (PST)
X-Received: by 2002:a05:600c:3b1c:b0:40e:61cf:af91 with SMTP id
 m28-20020a05600c3b1c00b0040e61cfaf91mr160203wms.7.1706204901267; Thu, 25 Jan
 2024 09:48:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <0316aaec9dbfc0c73788bcd3ee532ae7ecadb180.1706182805.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <0316aaec9dbfc0c73788bcd3ee532ae7ecadb180.1706182805.git.u.kleine-koenig@pengutronix.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 25 Jan 2024 09:48:04 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xscb2kv6drrqBBT2MOA0cSO3=oVZ4Hw3sKTo-uUuqQ-w@mail.gmail.com>
Message-ID: <CAD=FV=Xscb2kv6drrqBBT2MOA0cSO3=oVZ4Hw3sKTo-uUuqQ-w@mail.gmail.com>
Subject: Re: [PATCH v5 104/111] drm/bridge: ti-sn65dsi86: Make use of
 devm_pwmchip_alloc() function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-pwm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 25, 2024 at 4:11=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> This prepares the pwm driver of the ti-sn65dsi86 to further changes of
> the pwm core outlined in the commit introducing devm_pwmchip_alloc().
> There is no intended semantical change and the driver should behave as
> before.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index f1fffbef3324..7fbc307cc025 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -197,7 +197,7 @@ struct ti_sn65dsi86 {
>         DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
>  #if defined(CONFIG_PWM)
> -       struct pwm_chip                 pchip;
> +       struct pwm_chip                 *pchip;
>         bool                            pwm_enabled;
>         atomic_t                        pwm_pin_busy;
>  #endif
> @@ -1374,7 +1374,7 @@ static void ti_sn_pwm_pin_release(struct ti_sn65dsi=
86 *pdata)
>
>  static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *ch=
ip)
>  {
> -       return container_of(chip, struct ti_sn65dsi86, pchip);
> +       return pwmchip_get_drvdata(chip);
>  }

nit: given Linux conventions that I'm aware of, a reader of the code
would see the name "pwm_chip_to_ti_sn_bridge" and assume it's doing a
container_of operation. It no longer is, so the name doesn't make as
much sense. ...and, in fact, the function itself doesn't make as much
sense. Maybe just have all callers call pwmchip_get_drvdata()
directly?

In any case, this seems fine to me. I haven't done lots to analyze
your full plans to fix lifetime issues, but this patch itself looks
benign and I wouldn't object to it landing. Thus I'm OK with:

Acked-by: Douglas Anderson <dianders@chromium.org>

Similar to the other ti-sn65dsi86 patch in this series, unless someone
more senior in the drm-misc community contradicts me I think it's safe
to assume you could land this through your tree.


-Doug
