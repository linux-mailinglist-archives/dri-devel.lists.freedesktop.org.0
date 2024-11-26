Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1960D9D9479
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 10:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F68210E116;
	Tue, 26 Nov 2024 09:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C01B10E116
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 09:29:49 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1tFrsv-0007BB-JZ; Tue, 26 Nov 2024 10:29:29 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tFrst-000E0I-18;
 Tue, 26 Nov 2024 10:29:28 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1tFrsu-0001mR-09;
 Tue, 26 Nov 2024 10:29:28 +0100
Message-ID: <74d4fc4c6f08fde2d6759633cb2280ecb18cbd91.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/imagination: add reset control support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Parthiban Nallathambi <parthiban@linumiz.com>, Frank Binns
 <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 26 Nov 2024 10:29:27 +0100
In-Reply-To: <20241125-pvr-reset-v1-2-b437b8052948@linumiz.com>
References: <20241125-pvr-reset-v1-0-b437b8052948@linumiz.com>
 <20241125-pvr-reset-v1-2-b437b8052948@linumiz.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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

On Mo, 2024-11-25 at 22:07 +0530, Parthiban Nallathambi wrote:
> On some platforms like Allwinner A133 with GE8300 includes
> reset control from reset control unit. Add reset control
> optionally from the devicetree.
>=20
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/gpu/drm/imagination/pvr_device.h |  8 ++++++++
>  drivers/gpu/drm/imagination/pvr_drv.c    |  5 +++++
>  drivers/gpu/drm/imagination/pvr_power.c  | 16 +++++++++++++++-
>  3 files changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/i=
magination/pvr_device.h
> index 6d0dfacb677b..21ec7dd64415 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -23,6 +23,7 @@
>  #include <linux/kernel.h>
>  #include <linux/math.h>
>  #include <linux/mutex.h>
> +#include <linux/reset.h>
>  #include <linux/spinlock_types.h>
>  #include <linux/timer.h>
>  #include <linux/types.h>
> @@ -131,6 +132,13 @@ struct pvr_device {
>  	 */
>  	struct clk *mem_clk;
> =20
> +	/**
> +	 * @reset: Optional reset control
> +	 *
> +	 * This may be used on some platforms to reset the GPU module/IP.
> +	 */
> +	struct reset_control *reset;
> +
>  	/** @irq: IRQ number. */
>  	int irq;
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imag=
ination/pvr_drv.c
> index fb17196e05f4..d9b918410ea9 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -36,6 +36,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/xarray.h>
> =20
>  /**
> @@ -1427,6 +1428,10 @@ pvr_probe(struct platform_device *plat_dev)
>  	pm_runtime_use_autosuspend(&plat_dev->dev);
>  	pvr_watchdog_init(pvr_dev);
> =20
> +	pvr_dev->reset =3D devm_reset_control_get_optional_exclusive(&plat_dev-=
>dev, "ahb");
> +	if (PTR_ERR(pvr_dev->reset) =3D=3D -EPROBE_DEFER)
> +		return PTR_ERR(pvr_dev->reset);

	pvr_dev->reset =3D devm_reset_control_get_optional_exclusive(&plat_dev->de=
v, "ahb");
	if (IS_ERR(pvr_dev->reset))
		return PTR_ERR(pvr_dev->reset);

Please don't ignore errors. devm_reset_control_get_optional_exclusive()
returns NULL if the "ahb" reset control isn't specified in the device
tree, and the reset_control_assert/deassert() functions accept that as
a non-existing reset, see [1].

[1] https://docs.kernel.org/driver-api/reset.html#optional-resets

> +
>  	err =3D pvr_device_init(pvr_dev);
>  	if (err)
>  		goto err_watchdog_fini;
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/im=
agination/pvr_power.c
> index ba7816fd28ec..a24ed85f36c7 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -15,6 +15,7 @@
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/timer.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
> @@ -252,6 +253,9 @@ pvr_power_device_suspend(struct device *dev)
>  	clk_disable_unprepare(pvr_dev->sys_clk);
>  	clk_disable_unprepare(pvr_dev->core_clk);
> =20
> +	if (!IS_ERR(pvr_dev->reset))
> +		reset_control_assert(pvr_dev->reset);

	reset_control_assert(pvr_dev->reset);

This just returns 0 if pvr_dev->reset =3D=3D NULL.

> +
>  err_drm_dev_exit:
>  	drm_dev_exit(idx);
> =20
> @@ -270,9 +274,15 @@ pvr_power_device_resume(struct device *dev)
>  	if (!drm_dev_enter(drm_dev, &idx))
>  		return -EIO;
> =20
> +	if (!IS_ERR(pvr_dev->reset)) {
> +		err =3D reset_control_reset(pvr_dev->reset);
> +		if (err)
> +			goto err_drm_dev_exit;
> +	}

	err =3D reset_control_reset(pvr_dev->reset);
	if (err)
		goto err_drm_dev_exit;

> +
>  	err =3D clk_prepare_enable(pvr_dev->core_clk);
>  	if (err)
> -		goto err_drm_dev_exit;
> +		goto err_reset_exit;
> =20
>  	err =3D clk_prepare_enable(pvr_dev->sys_clk);
>  	if (err)
> @@ -301,6 +311,10 @@ pvr_power_device_resume(struct device *dev)
>  err_core_clk_disable:
>  	clk_disable_unprepare(pvr_dev->core_clk);
> =20
> +err_reset_exit:
> +	if (!IS_ERR(pvr_dev->reset))
> +		reset_control_assert(pvr_dev->reset);

err_reset_exit:
	reset_control_assert(pvr_dev->reset);

> +
>  err_drm_dev_exit:
>  	drm_dev_exit(idx);
> =20
>=20

regards
Philipp
