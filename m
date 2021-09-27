Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB4419EE7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 21:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A63F89CBA;
	Mon, 27 Sep 2021 19:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E0489CBA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 19:08:05 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id f18so19374511vsp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 12:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aBiZqfMPEKQeW++P21a0L5A3lhWRRuA/vpVJez/zbvk=;
 b=Yjh//I3KiQcgAghhoRvDxeqYQAQ5uM5OwT4cKCd1j5H+FA+QTAljo/fEs5HsMSsHMZ
 KoR3onuC7CjAiPquvOIEQw6lpYBNCjeYUSHRIOY174ZYChVa6u7lLZYvNw40w0JQGgXq
 yamhqGhuEaZT2DW5FEpAFztookGG5yE7w99xELtWG/lmyAVcC72NCO1J1r8HRRo9b7ix
 DbjuMWRkVKCInTWIsiCDt/TJLRLkyh6GzUJEQ3MgGsrBVK/ErdX8bpWJ2uwSL3jVjG6b
 ACK4sGG6aNc+/nOAgExpmozwwW2HSrXC/sIeaoQFDpj3UUSBenY80B9c7BdQbMbZJG1D
 fEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aBiZqfMPEKQeW++P21a0L5A3lhWRRuA/vpVJez/zbvk=;
 b=gY/FJhOvN1VQpRxDJIA3+50DVXh4RvWMXzmrbvldSATJ43I7yQQGxIBQwkmKrK0L0a
 Up9mqonOYijcjcn2BygYnuYY2ep81mR22wkERTlaDZY0kIccNKxC//6Uy/9apNpzC2nh
 MzR4g7puHnQ6AAAkMXpz5WtBZhBiEYHOVutnYKCPqrNdgYX9aXm19lGeyUsmBo7xGWCm
 5ysi5xNlvBTTVsgzIap22sqVgSiXS9nXuwCCKkg5zW8O7TSvlWTxowsWzXwgM7nVrDTp
 IJq9MeCj8huW0msQ48f9WHRauP4a4/y6ouraqFHIG5hcO2YzuSYpzgo7xsaKYopYdsEt
 kBrg==
X-Gm-Message-State: AOAM530IQaQwsVwEooSoUJWUIRFMzA9rz3Nbd5f/Yf8sP/rSgy25B08t
 kdOwjvBOgs777GNOPdiaOdtP8x4J/zii5Ywij5Y=
X-Google-Smtp-Source: ABdhPJzVEpUJi0JkzV+Zc8bLAfAtjd4m9sH5Amixd7fdQ52yAo8QNi94GWUL2Vu/kLQ/QTHym48EKe84AZyZFL76yhU=
X-Received: by 2002:a67:fd07:: with SMTP id f7mr1516354vsr.43.1632769679671;
 Mon, 27 Sep 2021 12:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210927175944.3381314-1-briannorris@chromium.org>
 <20210927105928.v2.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
In-Reply-To: <20210927105928.v2.1.Ic2904d37f30013a7f3d8476203ad3733c186827e@changeid>
From: Tom Hebb <tommyhebb@gmail.com>
Date: Mon, 27 Sep 2021 12:07:49 -0700
Message-ID: <CAMcCCgQVw21HM1EfEHmqpyLHkYLXDB=bD-AAG=R1gK9KzGr7vQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm/rockchip: dsi: Hold pm-runtime across
 bind/unbind
To: Brian Norris <briannorris@chromium.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>, 
 linux-rockchip@lists.infradead.org, Sandy Huang <hjc@rock-chips.com>, 
 linux-kernel@vger.kernel.org, aleksandr.o.makarov@gmail.com, 
 stable@vger.kernel.org, 
 =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: multipart/alternative; boundary="000000000000c2230105ccfed015"
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

--000000000000c2230105ccfed015
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Thomas Hebb <tommyhebb@gmail.com>

Thank you for catching this, and sorry that my original fix broke things.
There had actually been a report of this breakage from my patch, but I
missed that email until it had already been merged and then didn't have
time to follow up on it. Totally my bad.

On Mon, Sep 27, 2021 at 11:00 AM Brian Norris <briannorris@chromium.org>
wrote:

> In commit 43c2de1002d2, we moved most HW configuration to bind(), but we
> didn't move the runtime PM management. Therefore, depending on initial
> boot state, runtime-PM workqueue delays, and other timing factors, we
> may disable our power domain in between the hardware configuration
> (bind()) and when we enable the display. This can cause us to lose
> hardware state and fail to configure our display. For example:
>
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-innolux-p079zca ff960000.mipi.0: failed to write command 0
>
> or:
>
>   dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO
>   panel-kingdisplay-kd097d04 ff960000.mipi.0: failed write init cmds: -11=
0
>
> We should match the runtime PM to the lifetime of the bind()/unbind()
> cycle.
>
> Tested on Acer Chrometab 10 (RK3399 Gru-Scarlet), with panel drivers
> built either as modules or built-in.
>
> Side notes: it seems one is more likely to see this problem when the
> panel driver is built into the kernel. I've also seen this problem
> bisect down to commits that simply changed Kconfig dependencies, because
> it changed the order in which driver init functions were compiled into
> the kernel, and therefore the ordering and timing of built-in device
> probe.
>
> Fixes: 43c2de1002d2 ("drm/rockchip: dsi: move all lane config except LCDC
> mux to bind()")
> Link:
> https://lore.kernel.org/linux-rockchip/9aedfb528600ecf871885f7293ca4207c8=
4d16c1.camel@gmail.com/
> Reported-by
> <https://lore.kernel.org/linux-rockchip/9aedfb528600ecf871885f7293ca4207c=
84d16c1.camel@gmail.com/Reported-by>:
> <aleksandr.o.makarov@gmail.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Tested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>
> Changes in v2:
> - Clean up pm-runtime state in error cases.
> - Correct git hash for Fixes.
>
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 37 ++++++++++---------
>  1 file changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index a2262bee5aa4..45676b23c019 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -773,10 +773,6 @@ static void dw_mipi_dsi_encoder_enable(struct
> drm_encoder *encoder)
>         if (mux < 0)
>                 return;
>
> -       pm_runtime_get_sync(dsi->dev);
> -       if (dsi->slave)
> -               pm_runtime_get_sync(dsi->slave->dev);
> -
>         /*
>          * For the RK3399, the clk of grf must be enabled before writing
> grf
>          * register. And for RK3288 or other soc, this grf_clk must be
> NULL,
> @@ -795,20 +791,10 @@ static void dw_mipi_dsi_encoder_enable(struct
> drm_encoder *encoder)
>         clk_disable_unprepare(dsi->grf_clk);
>  }
>
> -static void dw_mipi_dsi_encoder_disable(struct drm_encoder *encoder)
> -{
> -       struct dw_mipi_dsi_rockchip *dsi =3D to_dsi(encoder);
> -
> -       if (dsi->slave)
> -               pm_runtime_put(dsi->slave->dev);
> -       pm_runtime_put(dsi->dev);
> -}
> -
>  static const struct drm_encoder_helper_funcs
>  dw_mipi_dsi_encoder_helper_funcs =3D {
>         .atomic_check =3D dw_mipi_dsi_encoder_atomic_check,
>         .enable =3D dw_mipi_dsi_encoder_enable,
> -       .disable =3D dw_mipi_dsi_encoder_disable,
>  };
>
>  static int rockchip_dsi_drm_create_encoder(struct dw_mipi_dsi_rockchip
> *dsi,
> @@ -938,10 +924,14 @@ static int dw_mipi_dsi_rockchip_bind(struct device
> *dev,
>                 put_device(second);
>         }
>
> +       pm_runtime_get_sync(dsi->dev);
> +       if (dsi->slave)
> +               pm_runtime_get_sync(dsi->slave->dev);
> +
>         ret =3D clk_prepare_enable(dsi->pllref_clk);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "Failed to enable pllref_clk: %d\n",
> ret);
> -               return ret;
> +               goto out_pm_runtime;
>         }
>
>         /*
> @@ -953,7 +943,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device
> *dev,
>         ret =3D clk_prepare_enable(dsi->grf_clk);
>         if (ret) {
>                 DRM_DEV_ERROR(dsi->dev, "Failed to enable grf_clk: %d\n",
> ret);
> -               return ret;
> +               goto out_pm_runtime;
>         }
>
>         dw_mipi_dsi_rockchip_config(dsi);
> @@ -965,16 +955,23 @@ static int dw_mipi_dsi_rockchip_bind(struct device
> *dev,
>         ret =3D rockchip_dsi_drm_create_encoder(dsi, drm_dev);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "Failed to create drm encoder\n");
> -               return ret;
> +               goto out_pm_runtime;
>         }
>
>         ret =3D dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
> -               return ret;
> +               goto out_pm_runtime;
>         }
>
>         return 0;
> +
> +out_pm_runtime:
> +       pm_runtime_put(dsi->dev);
> +       if (dsi->slave)
> +               pm_runtime_put(dsi->slave->dev);
> +
> +       return ret;
>  }
>
>  static void dw_mipi_dsi_rockchip_unbind(struct device *dev,
> @@ -989,6 +986,10 @@ static void dw_mipi_dsi_rockchip_unbind(struct devic=
e
> *dev,
>         dw_mipi_dsi_unbind(dsi->dmd);
>
>         clk_disable_unprepare(dsi->pllref_clk);
> +
> +       pm_runtime_put(dsi->dev);
> +       if (dsi->slave)
> +               pm_runtime_put(dsi->slave->dev);
>  }
>
>  static const struct component_ops dw_mipi_dsi_rockchip_ops =3D {
> --
> 2.33.0.685.g46640cef36-goog
>
>

--000000000000c2230105ccfed015
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Thomas Hebb &lt;<a href=3D"mailto:tommyh=
ebb@gmail.com">tommyhebb@gmail.com</a>&gt;</div><div><br></div><div>Thank y=
ou for catching this, and sorry that my original fix broke things.</div><di=
v>There had actually been a report of this breakage from my patch, but I</d=
iv><div>missed that email until it had already been merged and then didn&#3=
9;t have</div><div>time to follow up on it. Totally my bad.</div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 27, =
2021 at 11:00 AM Brian Norris &lt;<a href=3D"mailto:briannorris@chromium.or=
g">briannorris@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">In commit 43c2de1002d2, we moved most HW configu=
ration to bind(), but we<br>
didn&#39;t move the runtime PM management. Therefore, depending on initial<=
br>
boot state, runtime-PM workqueue delays, and other timing factors, we<br>
may disable our power domain in between the hardware configuration<br>
(bind()) and when we enable the display. This can cause us to lose<br>
hardware state and fail to configure our display. For example:<br>
<br>
=C2=A0 dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO<br>
=C2=A0 panel-innolux-p079zca ff960000.mipi.0: failed to write command 0<br>
<br>
or:<br>
<br>
=C2=A0 dw-mipi-dsi-rockchip ff968000.mipi: failed to write command FIFO<br>
=C2=A0 panel-kingdisplay-kd097d04 ff960000.mipi.0: failed write init cmds: =
-110<br>
<br>
We should match the runtime PM to the lifetime of the bind()/unbind()<br>
cycle.<br>
<br>
Tested on Acer Chrometab 10 (RK3399 Gru-Scarlet), with panel drivers<br>
built either as modules or built-in.<br>
<br>
Side notes: it seems one is more likely to see this problem when the<br>
panel driver is built into the kernel. I&#39;ve also seen this problem<br>
bisect down to commits that simply changed Kconfig dependencies, because<br=
>
it changed the order in which driver init functions were compiled into<br>
the kernel, and therefore the ordering and timing of built-in device<br>
probe.<br>
<br>
Fixes: 43c2de1002d2 (&quot;drm/rockchip: dsi: move all lane config except L=
CDC mux to bind()&quot;)<br>
Link: <a href=3D"https://lore.kernel.org/linux-rockchip/9aedfb528600ecf8718=
85f7293ca4207c84d16c1.camel@gmail.com/Reported-by" rel=3D"noreferrer" targe=
t=3D"_blank">https://lore.kernel.org/linux-rockchip/9aedfb528600ecf871885f7=
293ca4207c84d16c1.camel@gmail.com/<br>
Reported-by</a>: &lt;<a href=3D"mailto:aleksandr.o.makarov@gmail.com" targe=
t=3D"_blank">aleksandr.o.makarov@gmail.com</a>&gt;<br>
Cc: &lt;<a href=3D"mailto:stable@vger.kernel.org" target=3D"_blank">stable@=
vger.kernel.org</a>&gt;<br>
Signed-off-by: Brian Norris &lt;<a href=3D"mailto:briannorris@chromium.org"=
 target=3D"_blank">briannorris@chromium.org</a>&gt;<br>
Tested-by: N=C3=ADcolas F. R. A. Prado &lt;<a href=3D"mailto:nfraprado@coll=
abora.com" target=3D"_blank">nfraprado@collabora.com</a>&gt;<br>
---<br>
<br>
Changes in v2:<br>
- Clean up pm-runtime state in error cases.<br>
- Correct git hash for Fixes.<br>
<br>
=C2=A0.../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c=C2=A0 =C2=A0| 37 ++++++++=
++---------<br>
=C2=A01 file changed, 19 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/=
drm/rockchip/dw-mipi-dsi-rockchip.c<br>
index a2262bee5aa4..45676b23c019 100644<br>
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c<br>
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c<br>
@@ -773,10 +773,6 @@ static void dw_mipi_dsi_encoder_enable(struct drm_enco=
der *encoder)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mux &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync(dsi-&gt;dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi-&gt;slave)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync=
(dsi-&gt;slave-&gt;dev);<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* For the RK3399, the clk of grf must be =
enabled before writing grf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* register. And for RK3288 or other soc, =
this grf_clk must be NULL,<br>
@@ -795,20 +791,10 @@ static void dw_mipi_dsi_encoder_enable(struct drm_enc=
oder *encoder)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepare(dsi-&gt;grf_clk);<br>
=C2=A0}<br>
<br>
-static void dw_mipi_dsi_encoder_disable(struct drm_encoder *encoder)<br>
-{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dw_mipi_dsi_rockchip *dsi =3D to_dsi(enc=
oder);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi-&gt;slave)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put(dsi-=
&gt;slave-&gt;dev);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put(dsi-&gt;dev);<br>
-}<br>
-<br>
=C2=A0static const struct drm_encoder_helper_funcs<br>
=C2=A0dw_mipi_dsi_encoder_helper_funcs =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .atomic_check =3D dw_mipi_dsi_encoder_atomic_ch=
eck,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .enable =3D dw_mipi_dsi_encoder_enable,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.disable =3D dw_mipi_dsi_encoder_disable,<br>
=C2=A0};<br>
<br>
=C2=A0static int rockchip_dsi_drm_create_encoder(struct dw_mipi_dsi_rockchi=
p *dsi,<br>
@@ -938,10 +924,14 @@ static int dw_mipi_dsi_rockchip_bind(struct device *d=
ev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 put_device(second);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync(dsi-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi-&gt;slave)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_get_sync=
(dsi-&gt;slave-&gt;dev);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D clk_prepare_enable(dsi-&gt;pllref_clk);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEV_ERROR(dev, =
&quot;Failed to enable pllref_clk: %d\n&quot;, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_pm_runtime=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
@@ -953,7 +943,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D clk_prepare_enable(dsi-&gt;grf_clk);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEV_ERROR(dsi-&=
gt;dev, &quot;Failed to enable grf_clk: %d\n&quot;, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_pm_runtime=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dw_mipi_dsi_rockchip_config(dsi);<br>
@@ -965,16 +955,23 @@ static int dw_mipi_dsi_rockchip_bind(struct device *d=
ev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D rockchip_dsi_drm_create_encoder(dsi, dr=
m_dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEV_ERROR(dev, =
&quot;Failed to create drm encoder\n&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_pm_runtime=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dw_mipi_dsi_bind(dsi-&gt;dmd, &amp;dsi-=
&gt;encoder);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEV_ERROR(dev, =
&quot;Failed to bind: %d\n&quot;, ret);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_pm_runtime=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+<br>
+out_pm_runtime:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put(dsi-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi-&gt;slave)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put(dsi-=
&gt;slave-&gt;dev);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0}<br>
<br>
=C2=A0static void dw_mipi_dsi_rockchip_unbind(struct device *dev,<br>
@@ -989,6 +986,10 @@ static void dw_mipi_dsi_rockchip_unbind(struct device =
*dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dw_mipi_dsi_unbind(dsi-&gt;dmd);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 clk_disable_unprepare(dsi-&gt;pllref_clk);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put(dsi-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dsi-&gt;slave)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put(dsi-=
&gt;slave-&gt;dev);<br>
=C2=A0}<br>
<br>
=C2=A0static const struct component_ops dw_mipi_dsi_rockchip_ops =3D {<br>
-- <br>
2.33.0.685.g46640cef36-goog<br>
<br>
</blockquote></div></div>

--000000000000c2230105ccfed015--
