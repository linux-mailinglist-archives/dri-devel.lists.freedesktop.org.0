Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854BE9E8FAD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 11:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1CE10E6B3;
	Mon,  9 Dec 2024 10:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDFB10E6B3
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 10:06:49 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tKaf5-0000iX-JL; Mon, 09 Dec 2024 11:06:43 +0100
Message-ID: <3fa8279a44649ed9a893e88f1a9c562349a9d393.camel@pengutronix.de>
Subject: Re: [PATCH v3] drm/etnaviv: add optional reset support
From: Lucas Stach <l.stach@pengutronix.de>
To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, LENAIN Simon
 <simon.lenain@thalesgroup.com>,  BARBEAU Etienne
 <etienne.barbeau@thalesgroup.com>, LEJEUNE Sebastien
 <sebastien.lejeune@thalesgroup.com>
Date: Mon, 09 Dec 2024 11:06:41 +0100
In-Reply-To: <afcb562602e54c969964a608e3b6494a@thalesgroup.com>
References: <afcb562602e54c969964a608e3b6494a@thalesgroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Philippe,

Am Freitag, dem 06.12.2024 um 17:00 +0000 schrieb LECOINTRE Philippe:
> Add optional reset support which is mentioned in vivante,gc.yaml to
> allow the driver to work on SoCs whose reset signal is asserted by defaul=
t
>=20
> Signed-off-by: Philippe Lecointre <philippe.lecointre@thalesgroup.com>
> Reviewed-by: Simon Lenain <simon.lenain@thalesgroup.com>

Upstream usually doesn't put much weight on such internal reviews. No
harm here, as the patch is simple enough and I do review it before
applying. Just as a hint for the future: if you want maintainers to
take such reviews into account for speeding up the adoption of a patch,
do the review on the public mailing lists.

> ---
> v3:
> - Rework to match initial feedback
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 37 +++++++++++++++++++++++++++
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  1 +
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.c
> index 2d4c112ce033..1961ebac315a 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> @@ -13,6 +13,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
>  #include <linux/thermal.h>
> =20
>  #include "etnaviv_cmdbuf.h"
> @@ -172,6 +173,25 @@ int etnaviv_gpu_get_param(struct etnaviv_gpu *gpu, u=
32 param, u64 *value)
>  	return 0;
>  }
> =20
> +static int etnaviv_gpu_reset_deassert(struct etnaviv_gpu *gpu)
> +{
> +	int ret;
> +
> +	/* 32 core clock cycles (slowest clock) required before deassertion */
> +	/* 1 microsecond might match all implementations without computation */

I missed to mention this before, as I was focused on the technical
side: this is not the multiline comment style used in the
kernel/etnaviv. Please use the same style as already found in this
file.

> +	usleep_range(1, 2);
> +
> +	ret =3D reset_control_deassert(gpu->rst);
> +	if (ret)
> +		return ret;
> +
> +	/* 128 core clock cycles (slowest clock) required before any activity o=
n AHB */
> +	/* 1 microsecond might match all implementations without computation */
> +	usleep_range(1, 2);
> +
> +	return 0;
> +}
> +
>  static inline bool etnaviv_is_model_rev(struct etnaviv_gpu *gpu, u32 mod=
el, u32 revision)
>  {
>  	return gpu->identity.model =3D=3D model &&
> @@ -799,6 +819,12 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>  		goto pm_put;
>  	}
> =20
> +	ret =3D etnaviv_gpu_reset_deassert(gpu);
> +	if (ret) {
> +		dev_err(gpu->dev, "GPU reset deassert failed\n");
> +		goto fail;
> +	}
> +
>  	etnaviv_hw_identify(gpu);
> =20
>  	if (gpu->identity.model =3D=3D 0) {
> @@ -1860,6 +1886,17 @@ static int etnaviv_gpu_platform_probe(struct platf=
orm_device *pdev)
>  	if (IS_ERR(gpu->mmio))
>  		return PTR_ERR(gpu->mmio);
> =20
> +
> +	/* Get Reset: */
> +	gpu->rst =3D devm_reset_control_get_optional_exclusive(&pdev->dev, NULL=
);
> +	if (IS_ERR(gpu->rst))
> +		return dev_err_probe(dev, PTR_ERR(gpu->rst),
> +				     "failed to get reset\n");
> +
> +	err =3D reset_control_assert(gpu->rst);
> +	if (err)
> +		return dev_err_probe(dev, err, "failed to assert reset\n");
> +
>  	/* Get Interrupt: */
>  	gpu->irq =3D platform_get_irq(pdev, 0);
>  	if (gpu->irq < 0)
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etna=
viv/etnaviv_gpu.h
> index 4d8a7d48ade3..0985ea548b82 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
> @@ -158,6 +158,7 @@ struct etnaviv_gpu {
>  	struct clk *clk_reg;
>  	struct clk *clk_core;
>  	struct clk *clk_shader;
> +	struct reset_control *rst;

This needs a forward declaration of struct reset_control in the header,
to avoid build failures if headers are included in a different order.
Please put them right next to the existing ones for regulator and clk.

Other than that, patch looks good to me.

Regards,
Lucas

> =20
>  	unsigned int freq_scale;
>  	unsigned int fe_waitcycles;

