Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC43A17942
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 09:27:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63DB110E1D2;
	Tue, 21 Jan 2025 08:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1FB10E1D2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 08:27:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ta9Z6-0008Ps-UH; Tue, 21 Jan 2025 09:24:52 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1ta9Z3-0014lS-0a;
 Tue, 21 Jan 2025 09:24:49 +0100
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1ta9Z3-0001U4-0B;
 Tue, 21 Jan 2025 09:24:49 +0100
Message-ID: <518c440a74b592099b1f5dddd95dbc23615dd034.camel@pengutronix.de>
Subject: Re: [RFC v3 09/18] drm/imagination: Add reset controller support
 for GPU initialization
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
 jassisinghbrar@gmail.com,  paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu,  frank.binns@imgtec.com, matt.coster@imgtec.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org,  m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Date: Tue, 21 Jan 2025 09:24:48 +0100
In-Reply-To: <20250120172111.3492708-10-m.wilczynski@samsung.com>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172131eucas1p1ed7fc14a96c66b1dc9e14e9fc7cbb2b7@eucas1p1.samsung.com>
 <20250120172111.3492708-10-m.wilczynski@samsung.com>
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

On Mo, 2025-01-20 at 18:21 +0100, Michal Wilczynski wrote:
> Certain platforms, such as the T-Head TH1520 and Banana Pi BPI-F3,
> require a controlled GPU reset sequence during the power-up procedure
> to ensure proper initialization. Without this reset, the GPU may remain
> in an undefined state, potentially leading to stability or performance
> issues.
>=20
> This commit integrates a dedicated reset controller within the
> drm/imagination driver. By doing so, the driver can coordinate the
> necessary reset operations as part of the normal GPU bring-up process,
> improving reliability and ensuring that the hardware is ready for
> operation.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/pvr_device.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/imagination/pvr_device.h |  9 +++++++++
>  drivers/gpu/drm/imagination/pvr_power.c  | 15 ++++++++++++++-
>  3 files changed, 44 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/i=
magination/pvr_device.c
> index 1704c0268589..7ae9875d8d74 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -25,6 +25,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/stddef.h>
>  #include <linux/types.h>
> @@ -120,6 +121,21 @@ static int pvr_device_clk_init(struct pvr_device *pv=
r_dev)
>  	return 0;
>  }
> =20
> +static int pvr_device_reset_init(struct pvr_device *pvr_dev)
> +{
> +	struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> +	struct reset_control *reset;
> +
> +	reset =3D devm_reset_control_get_exclusive_by_index(drm_dev->dev, 0);

The dt-bindings only specify a single reset. No need to request by
index. Please use:

	reset =3D devm_reset_control_get_exclusive(drm_dev->dev, NULL);

instead. Or devm_reset_control_get_optional_exclusive(), perhaps? See
below.

> +	if (IS_ERR(reset))
> +		return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
> +				     "failed to get gpu reset line\n");
> +
> +	pvr_dev->reset =3D reset;
> +
> +	return 0;
> +}
> +
>  /**
>   * pvr_device_process_active_queues() - Process all queue related events=
.
>   * @pvr_dev: PowerVR device to check
> @@ -509,6 +525,11 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	if (err)
>  		return err;
> =20
> +	/* Get the reset line for the GPU */
> +	err =3D pvr_device_reset_init(pvr_dev);
> +	if (err)
> +		return err;
> +
>  	/* Explicitly power the GPU so we can access control registers before t=
he FW is booted. */
>  	err =3D pm_runtime_resume_and_get(dev);
>  	if (err)
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/i=
magination/pvr_device.h
> index 6d0dfacb677b..f6576c08111c 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -131,6 +131,15 @@ struct pvr_device {
>  	 */
>  	struct clk *mem_clk;
> =20
> +	/**
> +	 * @reset: Optional reset line.

This looks like the reset control really should be made optional in
pvr_device_reset_init().

> +	 *
> +	 * This may be used on some platforms to provide a reset line that need=
s to be de-asserted
> +	 * after power-up procedure. It would also need to be asserted after th=
e power-down
> +	 * procedure.
> +	 */
> +	struct reset_control *reset;
> +
>  	/** @irq: IRQ number. */
>  	int irq;
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/im=
agination/pvr_power.c
> index ba7816fd28ec..87a955600d8b 100644
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
> +	if (pvr_dev->reset)
> +		err =3D reset_control_assert(pvr_dev->reset);

No need for conditional assert, reset_control_assert(NULL) is a no-op.
Just use:

	err =3D reset_control_assert(pvr_dev->reset);

> +
>  err_drm_dev_exit:
>  	drm_dev_exit(idx);
> =20
> @@ -282,16 +286,25 @@ pvr_power_device_resume(struct device *dev)
>  	if (err)
>  		goto err_sys_clk_disable;
> =20
> +	if (pvr_dev->reset) {
> +		err =3D reset_control_deassert(pvr_dev->reset);
> +		if (err)
> +			goto err_mem_clk_disable;
> +	}

Same as above, reset_control_deassert(NULL) returns 0:

	err =3D reset_control_deassert(pvr_dev->reset);
	if (err)
		goto err_mem_clk_disable;

regards
Philipp
