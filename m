Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE16A2D9DE2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 18:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F187D6E092;
	Mon, 14 Dec 2020 17:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49246E088
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 17:39:25 +0000 (UTC)
Date: Mon, 14 Dec 2020 18:39:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607967565;
 bh=Wv22m3e5vY/d4EyJEr9V7KWrQ7JtOo53HMq/K4SIrTU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=kRr03x8RBFKEaywiFgHjpUDfznYfTu2/JlFGAePwaJrP2J+hCw/iyoryAy9cm0Adl
 x0Bf7O+QU94rgU+lu8QJ4IP/Ftjp8VfMYtyLIaOciLLK8TpygkNLtWsaRqQhTTDEF9
 383rZbwebVCjT/4C3JN4DAfkgzdEfP0kH3CytcP0Ha0kv+JfaY7z8rOubBUjkLRh+y
 tZM7l+vAAM+Zl8x1shUleJqDfn8Q5jOiix1ZFGqaVJyf1fNyttBA+vIgReZdx2L0Yj
 hfz0+lVTk6QSmmvSDV5cV6I7lFo3yJCUlcmaxRacolh7Kzpr/apnuuYk1avr1td6ge
 gl2uWr6zkBBhA==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 27/29] drm/omap: dsi: remove ulps support
Message-ID: <20201214173923.2plaloeowhxddbwe@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-28-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-28-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: multipart/mixed; boundary="===============0386122608=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0386122608==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7pgv5wfkze5xcptn"
Content-Disposition: inline


--7pgv5wfkze5xcptn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:53PM +0200, Tomi Valkeinen wrote:
> ULPS doesn't work, and I have been unable to get it to work. As ULPS
> is a minor power-saving feature which requires substantial amount of
> non-trivial code, and we have trouble just getting and
> keeping DSI working at all, remove ULPS support.
>
> When the DSI driver works reliably for command and video mode displays,
> someone interested can add it back.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---

Is it really 'minor power-saving'? If I search for DSI and ULPS among
the first results is a TI datasheet for SN65DSI84, which claims device
active current in the more than 100mA range and ULPS current in the
less than 10mA range.

Considering all known omapdrm DSI users are battery powered devices
caring for saving as much power as possible, it might be good to just
keep this until it is being fixed considering this is very close to
the end of the series anyways?

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 297 +-----------------------------
>  drivers/gpu/drm/omapdrm/dss/dsi.h |   4 -
>  2 files changed, 8 insertions(+), 293 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index cc8b169b2223..b2aa07a09dcd 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -53,8 +53,6 @@
>  #define REG_FLD_MOD(dsi, idx, val, start, end) \
>  	dsi_write_reg(dsi, idx, FLD_MOD(dsi_read_reg(dsi, idx), val, start, end=
))
> =20
> -static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
> -
>  static int dsi_init_dispc(struct dsi_data *dsi);
>  static void dsi_uninit_dispc(struct dsi_data *dsi);
> =20
> @@ -688,44 +686,6 @@ static int dsi_unregister_isr_vc(struct dsi_data *ds=
i, int vc,
>  	return r;
>  }
> =20
> -static int dsi_register_isr_cio(struct dsi_data *dsi, omap_dsi_isr_t isr,
> -				void *arg, u32 mask)
> -{
> -	unsigned long flags;
> -	int r;
> -
> -	spin_lock_irqsave(&dsi->irq_lock, flags);
> -
> -	r =3D _dsi_register_isr(isr, arg, mask, dsi->isr_tables.isr_table_cio,
> -			ARRAY_SIZE(dsi->isr_tables.isr_table_cio));
> -
> -	if (r =3D=3D 0)
> -		_omap_dsi_set_irqs_cio(dsi);
> -
> -	spin_unlock_irqrestore(&dsi->irq_lock, flags);
> -
> -	return r;
> -}
> -
> -static int dsi_unregister_isr_cio(struct dsi_data *dsi, omap_dsi_isr_t i=
sr,
> -				  void *arg, u32 mask)
> -{
> -	unsigned long flags;
> -	int r;
> -
> -	spin_lock_irqsave(&dsi->irq_lock, flags);
> -
> -	r =3D _dsi_unregister_isr(isr, arg, mask, dsi->isr_tables.isr_table_cio,
> -			ARRAY_SIZE(dsi->isr_tables.isr_table_cio));
> -
> -	if (r =3D=3D 0)
> -		_omap_dsi_set_irqs_cio(dsi);
> -
> -	spin_unlock_irqrestore(&dsi->irq_lock, flags);
> -
> -	return r;
> -}
> -
>  static u32 dsi_get_errors(struct dsi_data *dsi)
>  {
>  	unsigned long flags;
> @@ -1450,56 +1410,6 @@ static void dsi_cio_timings(struct dsi_data *dsi)
>  	dsi_write_reg(dsi, DSI_DSIPHY_CFG2, r);
>  }
> =20
> -/* lane masks have lane 0 at lsb. mask_p for positive lines, n for negat=
ive */
> -static void dsi_cio_enable_lane_override(struct dsi_data *dsi,
> -					 unsigned int mask_p,
> -					 unsigned int mask_n)
> -{
> -	int i;
> -	u32 l;
> -	u8 lptxscp_start =3D dsi->num_lanes_supported =3D=3D 3 ? 22 : 26;
> -
> -	l =3D 0;
> -
> -	for (i =3D 0; i < dsi->num_lanes_supported; ++i) {
> -		unsigned int p =3D dsi->lanes[i].polarity;
> -
> -		if (mask_p & (1 << i))
> -			l |=3D 1 << (i * 2 + (p ? 0 : 1));
> -
> -		if (mask_n & (1 << i))
> -			l |=3D 1 << (i * 2 + (p ? 1 : 0));
> -	}
> -
> -	/*
> -	 * Bits in REGLPTXSCPDAT4TO0DXDY:
> -	 * 17: DY0 18: DX0
> -	 * 19: DY1 20: DX1
> -	 * 21: DY2 22: DX2
> -	 * 23: DY3 24: DX3
> -	 * 25: DY4 26: DX4
> -	 */
> -
> -	/* Set the lane override configuration */
> -
> -	/* REGLPTXSCPDAT4TO0DXDY */
> -	REG_FLD_MOD(dsi, DSI_DSIPHY_CFG10, l, lptxscp_start, 17);
> -
> -	/* Enable lane override */
> -
> -	/* ENLPTXSCPDAT */
> -	REG_FLD_MOD(dsi, DSI_DSIPHY_CFG10, 1, 27, 27);
> -}
> -
> -static void dsi_cio_disable_lane_override(struct dsi_data *dsi)
> -{
> -	/* Disable lane override */
> -	REG_FLD_MOD(dsi, DSI_DSIPHY_CFG10, 0, 27, 27); /* ENLPTXSCPDAT */
> -	/* Reset the lane override configuration */
> -	/* REGLPTXSCPDAT4TO0DXDY */
> -	REG_FLD_MOD(dsi, DSI_DSIPHY_CFG10, 0, 22, 17);
> -}
> -
>  static int dsi_cio_wait_tx_clk_esc_reset(struct dsi_data *dsi)
>  {
>  	int t, i;
> @@ -1674,32 +1584,6 @@ static int dsi_cio_init(struct dsi_data *dsi)
>  	l =3D FLD_MOD(l, 0x1fff, 12, 0);	/* STOP_STATE_COUNTER_IO */
>  	dsi_write_reg(dsi, DSI_TIMING1, l);
> =20
> -	if (dsi->ulps_enabled) {
> -		unsigned int mask_p;
> -		int i;
> -
> -		DSSDBG("manual ulps exit\n");
> -
> -		/* ULPS is exited by Mark-1 state for 1ms, followed by
> -		 * stop state. DSS HW cannot do this via the normal
> -		 * ULPS exit sequence, as after reset the DSS HW thinks
> -		 * that we are not in ULPS mode, and refuses to send the
> -		 * sequence. So we need to send the ULPS exit sequence
> -		 * manually by setting positive lines high and negative lines
> -		 * low for 1ms.
> -		 */
> -
> -		mask_p =3D 0;
> -
> -		for (i =3D 0; i < dsi->num_lanes_supported; ++i) {
> -			if (dsi->lanes[i].function =3D=3D DSI_LANE_UNUSED)
> -				continue;
> -			mask_p |=3D 1 << i;
> -		}
> -
> -		dsi_cio_enable_lane_override(dsi, mask_p, 0);
> -	}
> -
>  	r =3D dsi_cio_power(dsi, DSI_COMPLEXIO_POWER_ON);
>  	if (r)
>  		goto err_cio_pwr;
> @@ -1718,17 +1602,6 @@ static int dsi_cio_init(struct dsi_data *dsi)
>  	if (r)
>  		goto err_tx_clk_esc_rst;
> =20
> -	if (dsi->ulps_enabled) {
> -		/* Keep Mark-1 state for 1ms (as per DSI spec) */
> -		ktime_t wait =3D ns_to_ktime(1000 * 1000);
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_hrtimeout(&wait, HRTIMER_MODE_REL);
> -
> -		/* Disable the override. The lanes should be set to Mark-11
> -		 * state by the HW */
> -		dsi_cio_disable_lane_override(dsi);
> -	}
> -
>  	/* FORCE_TX_STOP_MODE_IO */
>  	REG_FLD_MOD(dsi, DSI_TIMING1, 0, 15, 15);
> =20
> @@ -1739,8 +1612,6 @@ static int dsi_cio_init(struct dsi_data *dsi)
>  		    !(dsi->dsidev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS),
>  		    13, 13);
> =20
> -	dsi->ulps_enabled =3D false;
> -
>  	DSSDBG("CIO init done\n");
> =20
>  	return 0;
> @@ -1750,8 +1621,6 @@ static int dsi_cio_init(struct dsi_data *dsi)
>  err_cio_pwr_dom:
>  	dsi_cio_power(dsi, DSI_COMPLEXIO_POWER_OFF);
>  err_cio_pwr:
> -	if (dsi->ulps_enabled)
> -		dsi_cio_disable_lane_override(dsi);
>  err_scp_clk_dom:
>  	dsi_disable_scp_clk(dsi);
>  	dsi_disable_pads(dsi);
> @@ -2522,99 +2391,6 @@ static int dsi_vc_generic_read(struct omap_dss_dev=
ice *dssdev, int vc,
>  	return r;
>  }
> =20
> -static int dsi_enter_ulps(struct dsi_data *dsi)
> -{
> -	DECLARE_COMPLETION_ONSTACK(completion);
> -	int r, i;
> -	unsigned int mask;
> -
> -	DSSDBG("Entering ULPS");
> -
> -	WARN_ON(!dsi_bus_is_locked(dsi));
> -
> -	WARN_ON(dsi->ulps_enabled);
> -
> -	if (dsi->ulps_enabled)
> -		return 0;
> -
> -	/* DDR_CLK_ALWAYS_ON */
> -	if (REG_GET(dsi, DSI_CLK_CTRL, 13, 13)) {
> -		dsi_if_enable(dsi, 0);
> -		REG_FLD_MOD(dsi, DSI_CLK_CTRL, 0, 13, 13);
> -		dsi_if_enable(dsi, 1);
> -	}
> -
> -	dsi_sync_vc(dsi, 0);
> -	dsi_sync_vc(dsi, 1);
> -	dsi_sync_vc(dsi, 2);
> -	dsi_sync_vc(dsi, 3);
> -
> -	dsi_force_tx_stop_mode_io(dsi);
> -
> -	dsi_vc_enable(dsi, 0, false);
> -	dsi_vc_enable(dsi, 1, false);
> -	dsi_vc_enable(dsi, 2, false);
> -	dsi_vc_enable(dsi, 3, false);
> -
> -	if (REG_GET(dsi, DSI_COMPLEXIO_CFG2, 16, 16)) {	/* HS_BUSY */
> -		DSSERR("HS busy when enabling ULPS\n");
> -		return -EIO;
> -	}
> -
> -	if (REG_GET(dsi, DSI_COMPLEXIO_CFG2, 17, 17)) {	/* LP_BUSY */
> -		DSSERR("LP busy when enabling ULPS\n");
> -		return -EIO;
> -	}
> -
> -	r =3D dsi_register_isr_cio(dsi, dsi_completion_handler, &completion,
> -			DSI_CIO_IRQ_ULPSACTIVENOT_ALL0);
> -	if (r)
> -		return r;
> -
> -	mask =3D 0;
> -
> -	for (i =3D 0; i < dsi->num_lanes_supported; ++i) {
> -		if (dsi->lanes[i].function =3D=3D DSI_LANE_UNUSED)
> -			continue;
> -		mask |=3D 1 << i;
> -	}
> -	/* Assert TxRequestEsc for data lanes and TxUlpsClk for clk lane */
> -	/* LANEx_ULPS_SIG2 */
> -	REG_FLD_MOD(dsi, DSI_COMPLEXIO_CFG2, mask, 9, 5);
> -
> -	/* flush posted write and wait for SCP interface to finish the write */
> -	dsi_read_reg(dsi, DSI_COMPLEXIO_CFG2);
> -
> -	if (wait_for_completion_timeout(&completion,
> -				msecs_to_jiffies(1000)) =3D=3D 0) {
> -		DSSERR("ULPS enable timeout\n");
> -		r =3D -EIO;
> -		goto err;
> -	}
> -
> -	dsi_unregister_isr_cio(dsi, dsi_completion_handler, &completion,
> -			DSI_CIO_IRQ_ULPSACTIVENOT_ALL0);
> -
> -	/* Reset LANEx_ULPS_SIG2 */
> -	REG_FLD_MOD(dsi, DSI_COMPLEXIO_CFG2, 0, 9, 5);
> -
> -	/* flush posted write and wait for SCP interface to finish the write */
> -	dsi_read_reg(dsi, DSI_COMPLEXIO_CFG2);
> -
> -	dsi_cio_power(dsi, DSI_COMPLEXIO_POWER_ULPS);
> -
> -	dsi_if_enable(dsi, false);
> -
> -	dsi->ulps_enabled =3D true;
> -
> -	return 0;
> -
> -err:
> -	dsi_unregister_isr_cio(dsi, dsi_completion_handler, &completion,
> -			DSI_CIO_IRQ_ULPSACTIVENOT_ALL0);
> -	return r;
> -}
> -
>  static void dsi_set_lp_rx_timeout(struct dsi_data *dsi, unsigned int tic=
ks,
>  				  bool x4, bool x16)
>  {
> @@ -3397,7 +3173,6 @@ static void dsi_handle_framedone(struct dsi_data *d=
si, int error)
>  		REG_FLD_MOD(dsi, DSI_TIMING2, 1, 15, 15); /* LP_RX_TO */
>  	}
> =20
> -	dsi_set_ulps_auto(dsi, true);
>  	dsi_bus_unlock(dsi);
> =20
>  	if (!error)
> @@ -3488,8 +3263,6 @@ static int dsi_update_channel(struct omap_dss_devic=
e *dssdev, int vc)
> =20
>  	DSSDBG("dsi_update_channel: %d", vc);
> =20
> -	dsi_set_ulps_auto(dsi, false);
> -
>  	/*
>  	 * Send NOP between the frames. If we don't send something here, the
>  	 * updates stop working. This is probably related to DSI spec stating
> @@ -3514,7 +3287,6 @@ static int dsi_update_channel(struct omap_dss_devic=
e *dssdev, int vc)
>  	return 0;
> =20
>  err:
> -	dsi_set_ulps_auto(dsi, true);
>  	dsi_bus_unlock(dsi);
>  	return r;
>  }
> @@ -3707,12 +3479,8 @@ static int dsi_init_dsi(struct dsi_data *dsi)
>  	return r;
>  }
> =20
> -static void dsi_uninit_dsi(struct dsi_data *dsi, bool disconnect_lanes,
> -				   bool enter_ulps)
> +static void dsi_uninit_dsi(struct dsi_data *dsi)
>  {
> -	if (enter_ulps && !dsi->ulps_enabled)
> -		dsi_enter_ulps(dsi);
> -
>  	/* disable interface */
>  	dsi_if_enable(dsi, 0);
>  	dsi_vc_enable(dsi, 0, 0);
> @@ -3724,10 +3492,8 @@ static void dsi_uninit_dsi(struct dsi_data *dsi, b=
ool disconnect_lanes,
>  	dsi_cio_uninit(dsi);
>  	dss_pll_disable(&dsi->pll);
> =20
> -	if (disconnect_lanes) {
> -		regulator_disable(dsi->vdds_dsi_reg);
> -		dsi->vdds_dsi_enabled =3D false;
> -	}
> +	regulator_disable(dsi->vdds_dsi_reg);
> +	dsi->vdds_dsi_enabled =3D false;
>  }
> =20
>  static void dsi_enable(struct dsi_data *dsi)
> @@ -3759,8 +3525,7 @@ static void dsi_enable(struct dsi_data *dsi)
>  	DSSDBG("dsi_enable FAILED\n");
>  }
> =20
> -static void dsi_disable(struct dsi_data *dsi,
> -		bool disconnect_lanes, bool enter_ulps)
> +static void dsi_disable(struct dsi_data *dsi)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
> @@ -3771,7 +3536,7 @@ static void dsi_disable(struct dsi_data *dsi,
>  	dsi_sync_vc(dsi, 2);
>  	dsi_sync_vc(dsi, 3);
> =20
> -	dsi_uninit_dsi(dsi, disconnect_lanes, enter_ulps);
> +	dsi_uninit_dsi(dsi);
> =20
>  	dsi_runtime_put(dsi);
> =20
> @@ -3792,42 +3557,6 @@ static int dsi_enable_te(struct dsi_data *dsi, boo=
l enable)
>  	return 0;
>  }
> =20
> -static void omap_dsi_ulps_work_callback(struct work_struct *work)
> -{
> -	struct dsi_data *dsi =3D container_of(work, struct dsi_data,
> -					    ulps_work.work);
> -
> -	dsi_bus_lock(dsi);
> -
> -	dsi_enable_te(dsi, false);
> -
> -	dsi_disable(dsi, false, true);
> -
> -	dsi_bus_unlock(dsi);
> -}
> -
> -static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable)
> -{
> -	WARN_ON(!dsi_bus_is_locked(dsi));
> -
> -	if (!dsi->ulps_auto_idle)
> -		return;
> -
> -	if (enable) {
> -		schedule_delayed_work(&dsi->ulps_work, msecs_to_jiffies(250));
> -	} else {
> -		cancel_delayed_work_sync(&dsi->ulps_work);
> -
> -		if (!dsi->ulps_enabled)
> -			return;
> -
> -		dsi_bus_lock(dsi);
> -		dsi_enable(dsi);
> -		dsi_enable_te(dsi, true);
> -		dsi_bus_unlock(dsi);
> -	}
> -}
> -
>  #ifdef PRINT_VERBOSE_VM_TIMINGS
>  static void print_dsi_vm(const char *str,
>  		const struct omap_dss_dsi_videomode_timings *t)
> @@ -4499,13 +4228,10 @@ static ssize_t omap_dsi_host_transfer(struct mipi=
_dsi_host *host,
> =20
>  	dsi_bus_lock(dsi);
> =20
> -	if (dsi->video_enabled) {
> -		dsi_set_ulps_auto(dsi, false);
> +	if (dsi->video_enabled)
>  		r =3D _omap_dsi_host_transfer(dsi, vc, msg);
> -		dsi_set_ulps_auto(dsi, true);
> -	} else {
> +	else
>  		r =3D -EIO;
> -	}
> =20
>  	dsi_bus_unlock(dsi);
> =20
> @@ -4647,9 +4373,6 @@ static int omap_dsi_host_attach(struct mipi_dsi_hos=
t *host,
>  	dsi->dsidev =3D client;
>  	dsi->pix_fmt =3D client->format;
> =20
> -	INIT_DEFERRABLE_WORK(&dsi->ulps_work,
> -			     omap_dsi_ulps_work_callback);
> -
>  	dsi->config.hs_clk_min =3D 150000000; // TODO: get from client?
>  	dsi->config.hs_clk_max =3D client->hs_rate;
>  	dsi->config.lp_clk_min =3D 7000000; // TODO: get from client?
> @@ -4662,8 +4385,6 @@ static int omap_dsi_host_attach(struct mipi_dsi_hos=
t *host,
>  	else
>  		dsi->config.trans_mode =3D OMAP_DSS_DSI_EVENT_MODE;
> =20
> -	dsi->ulps_auto_idle =3D false;
> -
>  	return 0;
>  }
> =20
> @@ -4918,8 +4639,6 @@ static void dsi_bridge_enable(struct drm_bridge *br=
idge)
> =20
>  	dsi->video_enabled =3D true;
> =20
> -	dsi_set_ulps_auto(dsi, true);
> -
>  	dsi_bus_unlock(dsi);
>  }
> =20
> @@ -4934,7 +4653,7 @@ static void dsi_bridge_disable(struct drm_bridge *b=
ridge)
> =20
>  	dsi_disable_video_output(dssdev, VC_VIDEO);
> =20
> -	dsi_disable(dsi, true, false);
> +	dsi_disable(dsi);
> =20
>  	dsi_bus_unlock(dsi);
>  }
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.h b/drivers/gpu/drm/omapdrm/=
dss/dsi.h
> index 476069fda082..de9411067ba2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.h
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.h
> @@ -394,12 +394,8 @@ struct dsi_data {
>  	atomic_t do_ext_te_update;
> =20
>  	bool te_enabled;
> -	bool ulps_enabled;
> -	bool ulps_auto_idle;
>  	bool video_enabled;
> =20
> -	struct delayed_work ulps_work;
> -
>  	struct delayed_work framedone_timeout_work;
> =20
>  #ifdef DSI_CATCH_MISSING_TE
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--7pgv5wfkze5xcptn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/Xoz8ACgkQ2O7X88g7
+pq5JhAAi0Wvp6t4ayhxwoVIn+N+HH2A1Hjxr5VEvKNKgwSH27F9/5WwSCAxEiZk
6lBRO1d5A7OLfgNUkJQqUITSu/3y14ARSQ3n1TrnIxaulkIsoHgcUedfVYVP4ItX
yCsICMSB6XPIh01CPOxEsrmpsGoPnvMYSGZU1mCJubzPnd07Wh/eHDJbaZAyFDBm
r/ykl/i6GZBm0G26cE56wyPqMtrL5VZIPiQdc7qH9S+atQOsg2iJsVMZZnhLNqSU
M2sKLGxRGjFeqv1q/McGE1pAI9mlhpOmOeWFyUsnhuh+efsFjUFzUguNNvaQvxzl
mJOnclWVa5FA/fbNujm5RxENy8MGR50SDO2MHvUOkAndtMJ1d0eNjvaOYvMxPDjJ
KeENcByod3s0w6V7iRjheIag7iC/glH6cwds0Fzfqj1bYLe11O7r+PY4GS/5S7Dt
hvdNhQP+pGbFDtDVMD/xbMFf9Q7NnBkDmQUkoGWsihjLmiZ+xRHXgvX0vvYHeO1i
Z0DXRHvpS3KipZJiodf+ozMjKWv/rFZGDtF52FwMH3G33a5UaEJ5TmG2IkrQgK/K
O7g32zurjurAxXKUTlOgFLXHSkKrungV8fQP3GnVhaEMTkfN6o2T5bzIwcWofVEm
CKnMXswwPxRNocrn+d73RYHBR4+lt/bcj4pqqjcxqo/d/kNSLqg=
=oPW2
-----END PGP SIGNATURE-----

--7pgv5wfkze5xcptn--

--===============0386122608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0386122608==--
