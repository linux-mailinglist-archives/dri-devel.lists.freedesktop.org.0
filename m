Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FB183676F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB7410F3CC;
	Mon, 22 Jan 2024 15:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C3210F3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:14:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DDD7C61475
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8CDC433B2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705936464;
 bh=DCZ1yeweHK2ZD0/uXdu9bE6/Jcq3FK7B2WmAhGZfcIk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DN2Lis9/iFq5QR+6FC0X0SvlTktEklejUr/3e8HjykOk7Lsgc5bcKpMhYCkKC2iYD
 T9steyNhvyHKhP4TsWHn/tZVpG1aKTBC4aqYvUFH2qo3usH51KhwMJ3ITdVxk7WPh0
 AT5lC3YybaCAjFgZ/W38LDMrYgcYIasm707zfrq8ym/UHiBVgrOzI9ThYmMREjR9rV
 X3+PwJTc8vNyo3M14CCZxCQ3+W7LpOppSTBMVkgH4Zoinln+2WB8zQpUcBmdx8z1L9
 qUmh0p79qbxe2HemO3pdqBS9D4ie34AJKgcrPlT9JyyH8DMAuhKN0x6qUXlhx5g0FW
 pkC9is7+/O5YA==
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-dc223f3dd5eso2589276276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 07:14:24 -0800 (PST)
X-Gm-Message-State: AOJu0YwQCUqDPs+TmTPokruAxR6ze+YdNnjbe1vNameq338ENqGDarkJ
 NZG8Qbm78L2wCtIrDjEy04hj7qyIg4oGrKkJoGe53m72cv+MXe+4hhAykICXkOV1abb5yygEqcM
 p3agA49lHzIReiY6wZMb2b0WEkmp0QLl0g6mHCg==
X-Google-Smtp-Source: AGHT+IELeqUZHcuEi6czSy6GxZtZYY24kkEpIurvFbFmTxvGFQUNqb3M5tKbk3ha+xCzPOeAwzOOrlbwEjoG5Tvhq/U=
X-Received: by 2002:a25:8049:0:b0:dbe:aab1:b0e3 with SMTP id
 a9-20020a258049000000b00dbeaab1b0e3mr2553106ybn.98.1705936463808; Mon, 22 Jan
 2024 07:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20231214123205.v2.1.I9d1afcaad76a3e2c0ca046dc4adbc2b632c22eda@changeid>
 <20231214123205.v2.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
In-Reply-To: <20231214123205.v2.2.I7b83c0f31aeedc6b1dc98c7c741d3e1f94f040f8@changeid>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 22 Jan 2024 16:14:12 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4LtcSK0vc7oWn_H2Mk=pHj9kxTnk1aB5FZi2varHox=g@mail.gmail.com>
Message-ID: <CAN6tsi4LtcSK0vc7oWn_H2Mk=pHj9kxTnk1aB5FZi2varHox=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Never store more than
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Guenter Roeck <groeck@chromium.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 9:32=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
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
> ---
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
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
