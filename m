Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB768033A8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4966110E09F;
	Mon,  4 Dec 2023 12:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9C710E09F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:59:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 728DF61088
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3247C433CB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701694767;
 bh=Xuo/9Xw0T3ZL/f6gtSBDt9WLA8ftkplvVnNqlwQno80=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mu5y1HaGiumAJYSkoMa8sm8sgNk/d2dwR0a1klxnPNWno5YuvRRDn6XX7pD4Xn4XG
 FL4qZrE3nTOZh3kbEmz6hbzbZ1b2/OKu0QVAlheCHq+cQmQdaUwVxeFYYNXnVoIsvN
 3hKy4p376auFLD5o1vxzkJGAK/vN2IdB1/5OQuB0jPSMBe4GUFCq2tQh9sTZscGBG2
 ne/9bCGEmbpbgrKgO80sX+lgRdF+tZGWJVtZ24bW2CjvYYiSamsSmLbyjj3QdJEoPK
 6NTCmDYJxgEmiXMTVK3nttHYceuLNzrLCYA/m1EWmNbH+q6xn6d+/TsSwOu8xw6HEZ
 PzrqUoHyiPlZg==
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-5c68da9d639so442180a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 04:59:27 -0800 (PST)
X-Gm-Message-State: AOJu0YwRjpPHQi1k3gqu/9FNU8dLc8vFfbU8ylpX0YntyZQPV+ZKWPtg
 eAgmqabZAsiBEAZlC+HyUOpjjkh0XP6wANPzn/jmbg==
X-Google-Smtp-Source: AGHT+IHfJJRhmZSRmC6gb+uuZ6g8xOkDk5TCuCssAUr46HqkpCHlIvrNioDI7Di+SsbN+mnos/NpCMNHm5sQn1rytIk=
X-Received: by 2002:a17:90a:196:b0:286:71c6:6b69 with SMTP id
 22-20020a17090a019600b0028671c66b69mr1369762pjc.24.1701694767449; Mon, 04 Dec
 2023 04:59:27 -0800 (PST)
MIME-Version: 1.0
References: <20231115121338.22959-1-francesco@dolcini.it>
 <20231115121338.22959-2-francesco@dolcini.it>
In-Reply-To: <20231115121338.22959-2-francesco@dolcini.it>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 4 Dec 2023 13:59:16 +0100
X-Gmail-Original-Message-ID: <CAN6tsi7MNdG1Z3RW17gbOvUYbwc3=YrG4NnrW=XLF+GyvHk3MQ@mail.gmail.com>
Message-ID: <CAN6tsi7MNdG1Z3RW17gbOvUYbwc3=YrG4NnrW=XLF+GyvHk3MQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] drm/bridge: lt8912b: Add suspend/resume support
To: Francesco Dolcini <francesco@dolcini.it>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 15, 2023 at 1:14=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>
> Add support for suspend and resume. The lt8912b will power off when
> going into suspend and power on when resuming.
>
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 03532efb893b..097ab04234b7 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -634,6 +634,33 @@ static const struct drm_bridge_funcs lt8912_bridge_f=
uncs =3D {
>         .get_edid =3D lt8912_bridge_get_edid,
>  };
>
> +static int lt8912_bridge_resume(struct device *dev)
> +{
> +       struct lt8912 *lt =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D lt8912_hard_power_on(lt);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D lt8912_soft_power_on(lt);
> +       if (ret)
> +               return ret;
> +
> +       return lt8912_video_on(lt);
> +}
> +
> +static int lt8912_bridge_suspend(struct device *dev)
> +{
> +       struct lt8912 *lt =3D dev_get_drvdata(dev);
> +
> +       lt8912_hard_power_off(lt);
> +
> +       return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(lt8912_bridge_pm_ops, lt8912_bridge_susp=
end, lt8912_bridge_resume);
> +
>  static int lt8912_parse_dt(struct lt8912 *lt)
>  {
>         struct gpio_desc *gp_reset;
> @@ -770,6 +797,7 @@ static struct i2c_driver lt8912_i2c_driver =3D {
>         .driver =3D {
>                 .name =3D "lt8912",
>                 .of_match_table =3D lt8912_dt_match,
> +               .pm =3D pm_sleep_ptr(&lt8912_bridge_pm_ops),
>         },
>         .probe =3D lt8912_probe,
>         .remove =3D lt8912_remove,
> --
> 2.25.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
