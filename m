Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5A9813C9D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 22:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66B610E262;
	Thu, 14 Dec 2023 21:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B39D10E262
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 21:28:59 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-425928c24easo88951cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 13:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702589338; x=1703194138;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ah2gK9Uj0gVfSzL+u/hE078nNe1nFkMMAMYpMKEH2ZU=;
 b=yfJ1PUo7DRoBeD+IYW7auH398u4LEA13FdsvTRvKywB+jcRJb2HxN0wJNp7T2vcar7
 zwWRfLMgvPfPoAxNM/8RHEtNfw0Ay0QZtaPTUubrnaf3c+zXCh7F5rC9+Bm6FKe0KIcg
 kt3QRmFTwZllLfj7uA+CcJKK8/GqTtuOOzhbIDtMZWuMU6x/TLaq2LUDsXbUlfvAXDbY
 BInz3yxQdaQ5sy8SESbxwu1ICrEu5yv8LpaXvz8iIQK6rf5Vvojd+FYZAf1CuZrwcZdU
 ESt1fZbkS48xyDbcDT5W71CAxxmcTQVxjbCdFef17WR4MgZ9BlsOETxQm73Dz0kFeIIt
 W74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702589338; x=1703194138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ah2gK9Uj0gVfSzL+u/hE078nNe1nFkMMAMYpMKEH2ZU=;
 b=JI7o85N2AJ2hom4pl5hDZBRdTyLAfx9ZXSSqyuKt0Y//ObHdnsCzpn7RMNTF7jvasq
 CUow3ia2hgGxSKqIdj2JzqKtTP6Sv4XpquMlVqzu4QCR8hUQImYzfKGNrZ1+QwuadPoI
 WjEfZ7h7NZnYjO+Ts8wdjVHrXp7gT6ph03hzd1Q/IU4n4RGGcfZ3q2xs+zKKr7QTdrFj
 0Xe9b8h4jJOukzEMGpT8BTusn2FVz/3Mo6JVWAM8esX1OSdEPIybJc7i3C2W6MGze68F
 0B+9WgQ6b32LbhBRXDNFQtAUdYcgOEDETq6tvaVYm2boVbRvN2X3gHWi/5xx6JeOg2AJ
 zFDA==
X-Gm-Message-State: AOJu0YyQKY+MN7oBcNI4ovG5VqN4QVtJAyVuzLEIakrDTBriSPB2UAgq
 DcGZKUyJdfzGzHEhecj9rTaVcCqO1iB5NGmtBLQMcg==
X-Google-Smtp-Source: AGHT+IGsgqscYuF5hH9ltzFa1Bxwwapx6LhlySDEegatFrOZV15dVK4icP+0aT/U3BK3Vw6AJOZGGmMq7pwL8YnU/oU=
X-Received: by 2002:a05:622a:19a9:b0:425:9771:a5f3 with SMTP id
 u41-20020a05622a19a900b004259771a5f3mr1882119qtc.10.1702589338237; Thu, 14
 Dec 2023 13:28:58 -0800 (PST)
MIME-Version: 1.0
References: <20231214123752.v3.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
 <20231214123752.v3.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
In-Reply-To: <20231214123752.v3.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 14 Dec 2023 13:28:47 -0800
Message-ID: <CABXOdTdfuw5e4QKb07-yuTAwx0JxLDJKmVVg3pfpoLi2sWq0-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: ti-sn65dsi86: Never store more than
 msg->size bytes in AUX xfer
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 12:38=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> For aux reads, the value `msg->size` indicates the size of the buffer
> provided by `msg->buffer`. We should never in any circumstances write
> more bytes to the buffer since it may overflow the buffer.
>
> In the ti-sn65dsi86 driver there is one code path that reads the
> transfer length from hardware. Even though it's never been seen to be
> a problem, we should make extra sure that the hardware isn't
> increasing the length since doing so would cause us to overrun the
> buffer.
>
> Fixes: 982f589bde7a ("drm/bridge: ti-sn65dsi86: Update reply on aux failu=
res")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Updated patch subject to match ps8640 patch.
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 9095d1453710..62cc3893dca5 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -527,6 +527,7 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *=
aux,
>         u32 request_val =3D AUX_CMD_REQ(msg->request);
>         u8 *buf =3D msg->buffer;
>         unsigned int len =3D msg->size;
> +       unsigned int short_len;
>         unsigned int val;
>         int ret;
>         u8 addr_len[SN_AUX_LENGTH_REG + 1 - SN_AUX_ADDR_19_16_REG];
> @@ -600,7 +601,8 @@ static ssize_t ti_sn_aux_transfer(struct drm_dp_aux *=
aux,
>         }
>
>         if (val & AUX_IRQ_STATUS_AUX_SHORT) {
> -               ret =3D regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &le=
n);
> +               ret =3D regmap_read(pdata->regmap, SN_AUX_LENGTH_REG, &sh=
ort_len);
> +               len =3D min(len, short_len);
>                 if (ret)
>                         goto exit;
>         } else if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {
> --
> 2.43.0.472.g3155946c3a-goog
>
