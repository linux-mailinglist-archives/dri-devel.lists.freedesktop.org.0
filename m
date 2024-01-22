Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3631836831
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 16:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C73610F423;
	Mon, 22 Jan 2024 15:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9E310F423
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:29:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 51B1BCE2B2D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:29:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603CAC43601
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 15:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705937383;
 bh=iO8t2uvf8zKn2pqUIDEeeUGE84Y6SbECB0tNbeiWYzM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=C+MnRZ6kGvr+BXdFvyVitkA9XOIvtUbvwNce6ihU2x7vntqpIlXbY+OGnlqAJ8yUa
 U3hU197FCZSGcGg18ABnbM1rzlMx8mIuflY5F2Rq78Lt0+0ejtx3GlA6WGll1wjHy2
 1Ejaoo0pC6Q52OoMEdCaq/0MgAs7NW/VUiP6KmdUrk7QBd/M7ZFh6E4n8M5kzS0mgV
 VSzl3NUyxPL3kKH0RLieipsM9wc7LG9DcDW2wIGzEy1eAMrLWM4hyxhSguX8ol/dCv
 Vm7RzDVAGghigNHngtiPHjPnTuXSauoRk26ZaFZhJHDoUTIV/DxZCv8aA+V/ieQ+Wa
 KfqtLIGLUdxOg==
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc261316b0dso2336638276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 07:29:43 -0800 (PST)
X-Gm-Message-State: AOJu0YwKsvvh8hTPyhxfGKTw4m7rdSe2OrAmvgmDPuAxPjKoeyAiy0W3
 5Tgu34DC1hc9WhK4HLvWpSGw+xTl14+PmPhrH0aQOqQKPjcluaa/Xvka30yyJ9D2oU0D0L+1QRg
 S4G0SUAGP0DVrbzk13V6m9xyVFwL1lxkNqtgeDQ==
X-Google-Smtp-Source: AGHT+IGDkPjXY6J55Up3eaXCoYwi4eRPD2F77zONKwnvklSeSI87uRBe8/O3SRG5gesV0F61grq0PuKpZH3k4Uhs7Bw=
X-Received: by 2002:a25:d0cf:0:b0:dc2:2b05:4ab1 with SMTP id
 h198-20020a25d0cf000000b00dc22b054ab1mr2175479ybg.18.1705937382611; Mon, 22
 Jan 2024 07:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20231124-adv7511-cec-edid-v2-0-f0e5eeafdfc2@bang-olufsen.dk>
 <20231124-adv7511-cec-edid-v2-2-f0e5eeafdfc2@bang-olufsen.dk>
In-Reply-To: <20231124-adv7511-cec-edid-v2-2-f0e5eeafdfc2@bang-olufsen.dk>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 22 Jan 2024 16:29:31 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4wxfTdG+qMr2fcwkou5F1xpxeh5S7CoAUzwi4jMFP_kw@mail.gmail.com>
Message-ID: <CAN6tsi4wxfTdG+qMr2fcwkou5F1xpxeh5S7CoAUzwi4jMFP_kw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: adv7511: get edid in hpd_work to
 update CEC phys address
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 24, 2023 at 4:20=E2=80=AFPM Alvin =C5=A0ipraga <alvin@pqrs.dk> =
wrote:
>
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> The adv7511 driver is solely responsible for setting the physical
> address of its CEC adapter. To do this, it must read the EDID. However,
> EDID is only read when either the drm_bridge_funcs :: get_edid or
> drm_connector_helper_funcs :: get_modes ops are called. Without loss of
> generality, it cannot be assumed that these ops are called when a sink
> gets attached. Therefore there exist scenarios in which the CEC physical
> address will be invalid (f.f.f.f), rendering the CEC adapter inoperable.
>
> Address this problem by always fetching the EDID in the HPD work when we
> detect a connection. The CEC physical address is set in the process.
> This is done by moving the EDID DRM helper into an internal helper
> function so that it can be cleanly called from an earlier section of
> the code. The EDID getter has not changed in practice.
>
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 74 ++++++++++++++++++----=
------
>  1 file changed, 48 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/d=
rm/bridge/adv7511/adv7511_drv.c
> index 5ffc5904bd59..1f1d3a440895 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -542,6 +542,36 @@ static int adv7511_get_edid_block(void *data, u8 *bu=
f, unsigned int block,
>         return 0;
>  }
>
> +static struct edid *__adv7511_get_edid(struct adv7511 *adv7511,
> +                                      struct drm_connector *connector)
> +{
> +       struct edid *edid;
> +
> +       /* Reading the EDID only works if the device is powered */
> +       if (!adv7511->powered) {
> +               unsigned int edid_i2c_addr =3D
> +                                       (adv7511->i2c_edid->addr << 1);
> +
> +               __adv7511_power_on(adv7511);
> +
> +               /* Reset the EDID_I2C_ADDR register as it might be cleare=
d */
> +               regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
> +                            edid_i2c_addr);
> +       }
> +
> +       edid =3D drm_do_get_edid(connector, adv7511_get_edid_block, adv75=
11);
> +
> +       if (!adv7511->powered)
> +               __adv7511_power_off(adv7511);
> +
> +       adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
> +                              drm_detect_hdmi_monitor(edid));
> +
> +       cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
> +
> +       return edid;
> +}
> +
>  /* ---------------------------------------------------------------------=
--------
>   * Hotplug handling
>   */
> @@ -595,8 +625,24 @@ static void adv7511_hpd_work(struct work_struct *wor=
k)
>                 adv7511->connector.status =3D status;
>
>                 if (adv7511->connector.dev) {
> -                       if (status =3D=3D connector_status_disconnected)
> +                       if (status =3D=3D connector_status_disconnected) =
{
>                                 cec_phys_addr_invalidate(adv7511->cec_ada=
p);
> +                       } else {
> +                               struct edid *edid;
> +
> +                               /*
> +                                * Get the updated EDID so that the CEC
> +                                * subsystem gets informed of any change =
in CEC
> +                                * address. The helper returns a newly al=
located
> +                                * edid structure, so free it to prevent
> +                                * leakage.
> +                                */
> +                               edid =3D __adv7511_get_edid(adv7511,
> +                                                         &adv7511->conne=
ctor);
> +                               if (edid)
> +                                       kfree(edid);

kfree(NULL) is safe, so the if statement can be removed.

With this fixed, feel free to add my r-b to this full series.

Reviewed-by: Robert Foss <rfoss@kernel.org>
