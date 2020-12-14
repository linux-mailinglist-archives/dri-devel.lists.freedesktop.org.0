Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B12F2D9AAF
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 16:18:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8088E6E23B;
	Mon, 14 Dec 2020 15:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343196E241
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 15:18:08 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:18:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607959088;
 bh=c3EwztsomAA9R1K3+h+r3J01PgQrxfEmzob44ubM9PQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=pNF8qTdRjQ72htA4YKdPFvTmOhDCVZ7QX0jJbZD47Thf1AXtB6PXfW3r1K0JZMZzQ
 wtucr3UJoY9ahEOZWzQWHKEaDCITbwQ83l1ztOaYiRl+BNwunHFazf/OdNXqZHB46S
 EP71Czh8ttARBNP0EfPYh/ksUzUes/fMCrLuix6UucSQ56MO8aPkZ0ne+rcKpi7pr0
 wl0r1bezbs78jA7pqaSTPNimqYjEoto05DgXaTUgIEs+PWiY9AkI1ePIO+t+pRAqE6
 l+VzmIEfgT06+roasgtnWgZcAF24osZuiq3p6dPxXloK9GVTq6BsqozO9U7GQqgNMe
 ooagUcjydCGEQ==
From: Sebastian Reichel <sre@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v5 10/29] drm/omap: dsi: rename 'channel' to 'vc'
Message-ID: <20201214151805.fexcfzuhat7g3j6c@earth.universe>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
 <20201208122855.254819-11-tomi.valkeinen@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201208122855.254819-11-tomi.valkeinen@ti.com>
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
Content-Type: multipart/mixed; boundary="===============1882053922=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1882053922==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dsral4cthmuwalrt"
Content-Disposition: inline


--dsral4cthmuwalrt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Dec 08, 2020 at 02:28:36PM +0200, Tomi Valkeinen wrote:
> The "channel" usage in omap dsi driver is confusing. We have three
> different "channels":
>=20
> 1) DSI virtual channel ID. This is a number from 0 to 3, included in the
> packet payload.
>=20
> 2) VC. This is a register block in the DSI IP. There are four of those
> blocks. A VC is a DSI "pipeline", with defined fifo settings, data
> source (cpu or dispc), and some other settings. It has no relation to
> the 1).
>=20
> 3) dispc channel. It's the "pipeline" number dispc uses to send pixel
> data.
>=20
> The previous patch handled the third case.
>=20
>  To start fixing 1) and 2), we first rename all uses of 'channel' to
> 'vc', as in most of the cases that is the correct thing to use.
>=20
> However, in some places 1) and 2) have gotten mixed up (i.e. the code
> uses msg->channel when it should use vc), which will be fixed in the
> following patch.
>=20
> Note that mixing 1) and 2) currently is "fine", as at the moment we only
> support DSI peripherals with DSI virtual channel 0, and we always use
> VC0 to send data. So both 1) and 2) are always 0.
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/gpu/drm/omapdrm/dss/dsi.c | 220 +++++++++++++++---------------
>  1 file changed, 110 insertions(+), 110 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index cf0dc4872d14..273159e8f992 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -214,7 +214,7 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, b=
ool enable);
>  static int dsi_display_init_dispc(struct dsi_data *dsi);
>  static void dsi_display_uninit_dispc(struct dsi_data *dsi);
> =20
> -static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc);
> =20
>  static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
>  				       const struct mipi_dsi_msg *msg);
> @@ -376,7 +376,7 @@ struct dsi_data {
>  	/* space for a copy used by the interrupt handler */
>  	struct dsi_isr_tables isr_tables_copy;
> =20
> -	int update_channel;
> +	int update_vc;
>  #ifdef DSI_PERF_MEASURE
>  	unsigned int update_bytes;
>  #endif
> @@ -639,7 +639,7 @@ static void print_irq_status(u32 status)
>  #undef PIS
>  }
> =20
> -static void print_irq_status_vc(int channel, u32 status)
> +static void print_irq_status_vc(int vc, u32 status)
>  {
>  	if (status =3D=3D 0)
>  		return;
> @@ -650,7 +650,7 @@ static void print_irq_status_vc(int channel, u32 stat=
us)
>  #define PIS(x) (status & DSI_VC_IRQ_##x) ? (#x " ") : ""
> =20
>  	pr_debug("DSI VC(%d) IRQ 0x%x: %s%s%s%s%s%s%s%s%s\n",
> -		channel,
> +		vc,
>  		status,
>  		PIS(CS),
>  		PIS(ECC_CORR),
> @@ -1031,7 +1031,7 @@ static int dsi_unregister_isr(struct dsi_data *dsi,=
 omap_dsi_isr_t isr,
>  	return r;
>  }
> =20
> -static int dsi_register_isr_vc(struct dsi_data *dsi, int channel,
> +static int dsi_register_isr_vc(struct dsi_data *dsi, int vc,
>  			       omap_dsi_isr_t isr, void *arg, u32 mask)
>  {
>  	unsigned long flags;
> @@ -1040,18 +1040,18 @@ static int dsi_register_isr_vc(struct dsi_data *d=
si, int channel,
>  	spin_lock_irqsave(&dsi->irq_lock, flags);
> =20
>  	r =3D _dsi_register_isr(isr, arg, mask,
> -			dsi->isr_tables.isr_table_vc[channel],
> -			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[channel]));
> +			dsi->isr_tables.isr_table_vc[vc],
> +			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[vc]));
> =20
>  	if (r =3D=3D 0)
> -		_omap_dsi_set_irqs_vc(dsi, channel);
> +		_omap_dsi_set_irqs_vc(dsi, vc);
> =20
>  	spin_unlock_irqrestore(&dsi->irq_lock, flags);
> =20
>  	return r;
>  }
> =20
> -static int dsi_unregister_isr_vc(struct dsi_data *dsi, int channel,
> +static int dsi_unregister_isr_vc(struct dsi_data *dsi, int vc,
>  				 omap_dsi_isr_t isr, void *arg, u32 mask)
>  {
>  	unsigned long flags;
> @@ -1060,11 +1060,11 @@ static int dsi_unregister_isr_vc(struct dsi_data =
*dsi, int channel,
>  	spin_lock_irqsave(&dsi->irq_lock, flags);
> =20
>  	r =3D _dsi_unregister_isr(isr, arg, mask,
> -			dsi->isr_tables.isr_table_vc[channel],
> -			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[channel]));
> +			dsi->isr_tables.isr_table_vc[vc],
> +			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[vc]));
> =20
>  	if (r =3D=3D 0)
> -		_omap_dsi_set_irqs_vc(dsi, channel);
> +		_omap_dsi_set_irqs_vc(dsi, vc);
> =20
>  	spin_unlock_irqrestore(&dsi->irq_lock, flags);
> =20
> @@ -2232,9 +2232,9 @@ static int dsi_force_tx_stop_mode_io(struct dsi_dat=
a *dsi)
>  	return 0;
>  }
> =20
> -static bool dsi_vc_is_enabled(struct dsi_data *dsi, int channel)
> +static bool dsi_vc_is_enabled(struct dsi_data *dsi, int vc)
>  {
> -	return REG_GET(dsi, DSI_VC_CTRL(channel), 0, 0);
> +	return REG_GET(dsi, DSI_VC_CTRL(vc), 0, 0);
>  }
> =20
>  static void dsi_packet_sent_handler_vp(void *data, u32 mask)
> @@ -2242,14 +2242,14 @@ static void dsi_packet_sent_handler_vp(void *data=
, u32 mask)
>  	struct dsi_packet_sent_handler_data *vp_data =3D
>  		(struct dsi_packet_sent_handler_data *) data;
>  	struct dsi_data *dsi =3D vp_data->dsi;
> -	const int channel =3D dsi->update_channel;
> +	const int vc =3D dsi->update_vc;
>  	u8 bit =3D dsi->te_enabled ? 30 : 31;
> =20
> -	if (REG_GET(dsi, DSI_VC_TE(channel), bit, bit) =3D=3D 0)
> +	if (REG_GET(dsi, DSI_VC_TE(vc), bit, bit) =3D=3D 0)
>  		complete(vp_data->completion);
>  }
> =20
> -static int dsi_sync_vc_vp(struct dsi_data *dsi, int channel)
> +static int dsi_sync_vc_vp(struct dsi_data *dsi, int vc)
>  {
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	struct dsi_packet_sent_handler_data vp_data =3D {
> @@ -2261,13 +2261,13 @@ static int dsi_sync_vc_vp(struct dsi_data *dsi, i=
nt channel)
> =20
>  	bit =3D dsi->te_enabled ? 30 : 31;
> =20
> -	r =3D dsi_register_isr_vc(dsi, channel, dsi_packet_sent_handler_vp,
> +	r =3D dsi_register_isr_vc(dsi, vc, dsi_packet_sent_handler_vp,
>  		&vp_data, DSI_VC_IRQ_PACKET_SENT);
>  	if (r)
>  		goto err0;
> =20
>  	/* Wait for completion only if TE_EN/TE_START is still set */
> -	if (REG_GET(dsi, DSI_VC_TE(channel), bit, bit)) {
> +	if (REG_GET(dsi, DSI_VC_TE(vc), bit, bit)) {
>  		if (wait_for_completion_timeout(&completion,
>  				msecs_to_jiffies(10)) =3D=3D 0) {
>  			DSSERR("Failed to complete previous frame transfer\n");
> @@ -2276,12 +2276,12 @@ static int dsi_sync_vc_vp(struct dsi_data *dsi, i=
nt channel)
>  		}
>  	}
> =20
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_vp,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_vp,
>  		&vp_data, DSI_VC_IRQ_PACKET_SENT);
> =20
>  	return 0;
>  err1:
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_vp,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_vp,
>  		&vp_data, DSI_VC_IRQ_PACKET_SENT);
>  err0:
>  	return r;
> @@ -2292,13 +2292,13 @@ static void dsi_packet_sent_handler_l4(void *data=
, u32 mask)
>  	struct dsi_packet_sent_handler_data *l4_data =3D
>  		(struct dsi_packet_sent_handler_data *) data;
>  	struct dsi_data *dsi =3D l4_data->dsi;
> -	const int channel =3D dsi->update_channel;
> +	const int vc =3D dsi->update_vc;
> =20
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 5, 5) =3D=3D 0)
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 5, 5) =3D=3D 0)
>  		complete(l4_data->completion);
>  }
> =20
> -static int dsi_sync_vc_l4(struct dsi_data *dsi, int channel)
> +static int dsi_sync_vc_l4(struct dsi_data *dsi, int vc)
>  {
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	struct dsi_packet_sent_handler_data l4_data =3D {
> @@ -2307,13 +2307,13 @@ static int dsi_sync_vc_l4(struct dsi_data *dsi, i=
nt channel)
>  	};
>  	int r =3D 0;
> =20
> -	r =3D dsi_register_isr_vc(dsi, channel, dsi_packet_sent_handler_l4,
> +	r =3D dsi_register_isr_vc(dsi, vc, dsi_packet_sent_handler_l4,
>  		&l4_data, DSI_VC_IRQ_PACKET_SENT);
>  	if (r)
>  		goto err0;
> =20
>  	/* Wait for completion only if TX_FIFO_NOT_EMPTY is still set */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 5, 5)) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 5, 5)) {
>  		if (wait_for_completion_timeout(&completion,
>  				msecs_to_jiffies(10)) =3D=3D 0) {
>  			DSSERR("Failed to complete previous l4 transfer\n");
> @@ -2322,47 +2322,47 @@ static int dsi_sync_vc_l4(struct dsi_data *dsi, i=
nt channel)
>  		}
>  	}
> =20
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_l4,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_l4,
>  		&l4_data, DSI_VC_IRQ_PACKET_SENT);
> =20
>  	return 0;
>  err1:
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_l4,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_l4,
>  		&l4_data, DSI_VC_IRQ_PACKET_SENT);
>  err0:
>  	return r;
>  }
> =20
> -static int dsi_sync_vc(struct dsi_data *dsi, int channel)
> +static int dsi_sync_vc(struct dsi_data *dsi, int vc)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
>  	WARN_ON(in_interrupt());
> =20
> -	if (!dsi_vc_is_enabled(dsi, channel))
> +	if (!dsi_vc_is_enabled(dsi, vc))
>  		return 0;
> =20
> -	switch (dsi->vc[channel].source) {
> +	switch (dsi->vc[vc].source) {
>  	case DSI_VC_SOURCE_VP:
> -		return dsi_sync_vc_vp(dsi, channel);
> +		return dsi_sync_vc_vp(dsi, vc);
>  	case DSI_VC_SOURCE_L4:
> -		return dsi_sync_vc_l4(dsi, channel);
> +		return dsi_sync_vc_l4(dsi, vc);
>  	default:
>  		BUG();
>  		return -EINVAL;
>  	}
>  }
> =20
> -static int dsi_vc_enable(struct dsi_data *dsi, int channel, bool enable)
> +static int dsi_vc_enable(struct dsi_data *dsi, int vc, bool enable)
>  {
> -	DSSDBG("dsi_vc_enable channel %d, enable %d\n",
> -			channel, enable);
> +	DSSDBG("dsi_vc_enable vc %d, enable %d\n",
> +			vc, enable);
> =20
>  	enable =3D enable ? 1 : 0;
> =20
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), enable, 0, 0);
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 0, 0);
> =20
> -	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(channel), 0, enable)) {
> +	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(vc), 0, enable)) {
>  		DSSERR("Failed to set dsi_vc_enable to %d\n", enable);
>  		return -EIO;
>  	}
> @@ -2370,17 +2370,17 @@ static int dsi_vc_enable(struct dsi_data *dsi, in=
t channel, bool enable)
>  	return 0;
>  }
> =20
> -static void dsi_vc_initial_config(struct dsi_data *dsi, int channel)
> +static void dsi_vc_initial_config(struct dsi_data *dsi, int vc)
>  {
>  	u32 r;
> =20
> -	DSSDBG("Initial config of virtual channel %d", channel);
> +	DSSDBG("Initial config of VC %d", vc);
> =20
> -	r =3D dsi_read_reg(dsi, DSI_VC_CTRL(channel));
> +	r =3D dsi_read_reg(dsi, DSI_VC_CTRL(vc));
> =20
>  	if (FLD_GET(r, 15, 15)) /* VC_BUSY */
>  		DSSERR("VC(%d) busy when trying to configure it!\n",
> -				channel);
> +				vc);
> =20
>  	r =3D FLD_MOD(r, 0, 1, 1); /* SOURCE, 0 =3D L4 */
>  	r =3D FLD_MOD(r, 0, 2, 2); /* BTA_SHORT_EN  */
> @@ -2395,76 +2395,76 @@ static void dsi_vc_initial_config(struct dsi_data=
 *dsi, int channel)
>  	r =3D FLD_MOD(r, 4, 29, 27); /* DMA_RX_REQ_NB =3D no dma */
>  	r =3D FLD_MOD(r, 4, 23, 21); /* DMA_TX_REQ_NB =3D no dma */
> =20
> -	dsi_write_reg(dsi, DSI_VC_CTRL(channel), r);
> +	dsi_write_reg(dsi, DSI_VC_CTRL(vc), r);
> =20
> -	dsi->vc[channel].source =3D DSI_VC_SOURCE_L4;
> +	dsi->vc[vc].source =3D DSI_VC_SOURCE_L4;
>  }
> =20
> -static int dsi_vc_config_source(struct dsi_data *dsi, int channel,
> +static int dsi_vc_config_source(struct dsi_data *dsi, int vc,
>  				enum dsi_vc_source source)
>  {
> -	if (dsi->vc[channel].source =3D=3D source)
> +	if (dsi->vc[vc].source =3D=3D source)
>  		return 0;
> =20
> -	DSSDBG("Source config of virtual channel %d", channel);
> +	DSSDBG("Source config of VC %d", vc);
> =20
> -	dsi_sync_vc(dsi, channel);
> +	dsi_sync_vc(dsi, vc);
> =20
> -	dsi_vc_enable(dsi, channel, 0);
> +	dsi_vc_enable(dsi, vc, 0);
> =20
>  	/* VC_BUSY */
> -	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(channel), 15, 0)) {
> -		DSSERR("vc(%d) busy when trying to config for VP\n", channel);
> +	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(vc), 15, 0)) {
> +		DSSERR("vc(%d) busy when trying to config for VP\n", vc);
>  		return -EIO;
>  	}
> =20
>  	/* SOURCE, 0 =3D L4, 1 =3D video port */
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), source, 1, 1);
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), source, 1, 1);
> =20
>  	/* DCS_CMD_ENABLE */
>  	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) {
>  		bool enable =3D source =3D=3D DSI_VC_SOURCE_VP;
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), enable, 30, 30);
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 30, 30);
>  	}
> =20
> -	dsi_vc_enable(dsi, channel, 1);
> +	dsi_vc_enable(dsi, vc, 1);
> =20
> -	dsi->vc[channel].source =3D source;
> +	dsi->vc[vc].source =3D source;
> =20
>  	return 0;
>  }
> =20
> -static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int channel,
> +static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
>  		bool enable)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> =20
> -	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", channel, enable);
> +	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", vc, enable);
> =20
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
> -	dsi_vc_enable(dsi, channel, 0);
> +	dsi_vc_enable(dsi, vc, 0);
>  	dsi_if_enable(dsi, 0);
> =20
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), enable, 9, 9);
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 9, 9);
> =20
> -	dsi_vc_enable(dsi, channel, 1);
> +	dsi_vc_enable(dsi, vc, 1);
>  	dsi_if_enable(dsi, 1);
> =20
>  	dsi_force_tx_stop_mode_io(dsi);
> =20
>  	/* start the DDR clock by sending a NULL packet */
>  	if (dsi->vm_timings.ddr_clk_always_on && enable)
> -		dsi_vc_send_null(dsi, channel);
> +		dsi_vc_send_null(dsi, vc);
> =20
>  	dsi->in_lp_mode =3D !enable;
>  }
> =20
> -static void dsi_vc_flush_long_data(struct dsi_data *dsi, int channel)
> +static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
>  {
> -	while (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	while (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		u32 val;
> -		val =3D dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel));
> +		val =3D dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc));
>  		DSSDBG("\t\tb1 %#02x b2 %#02x b3 %#02x b4 %#02x\n",
>  				(val >> 0) & 0xff,
>  				(val >> 8) & 0xff,
> @@ -2510,13 +2510,13 @@ static void dsi_show_rx_ack_with_err(u16 err)
>  		DSSERR("\t\tDSI Protocol Violation\n");
>  }
> =20
> -static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int channel)
> +static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int vc)
>  {
>  	/* RX_FIFO_NOT_EMPTY */
> -	while (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	while (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		u32 val;
>  		u8 dt;
> -		val =3D dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel));
> +		val =3D dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc));
>  		DSSERR("\trawval %#08x\n", val);
>  		dt =3D FLD_GET(val, 5, 0);
>  		if (dt =3D=3D MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT) {
> @@ -2531,7 +2531,7 @@ static u16 dsi_vc_flush_receive_data(struct dsi_dat=
a *dsi, int channel)
>  		} else if (dt =3D=3D MIPI_DSI_RX_DCS_LONG_READ_RESPONSE) {
>  			DSSERR("\tDCS long response, len %d\n",
>  					FLD_GET(val, 23, 8));
> -			dsi_vc_flush_long_data(dsi, channel);
> +			dsi_vc_flush_long_data(dsi, vc);
>  		} else {
>  			DSSERR("\tunknown datatype 0x%02x\n", dt);
>  		}
> @@ -2539,35 +2539,35 @@ static u16 dsi_vc_flush_receive_data(struct dsi_d=
ata *dsi, int channel)
>  	return 0;
>  }
> =20
> -static int dsi_vc_send_bta(struct dsi_data *dsi, int channel)
> +static int dsi_vc_send_bta(struct dsi_data *dsi, int vc)
>  {
>  	if (dsi->debug_write || dsi->debug_read)
> -		DSSDBG("dsi_vc_send_bta %d\n", channel);
> +		DSSDBG("dsi_vc_send_bta %d\n", vc);
> =20
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
>  	/* RX_FIFO_NOT_EMPTY */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		DSSERR("rx fifo not empty when sending BTA, dumping data:\n");
> -		dsi_vc_flush_receive_data(dsi, channel);
> +		dsi_vc_flush_receive_data(dsi, vc);
>  	}
> =20
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), 1, 6, 6); /* BTA_EN */
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 6, 6); /* BTA_EN */
> =20
>  	/* flush posted write */
> -	dsi_read_reg(dsi, DSI_VC_CTRL(channel));
> +	dsi_read_reg(dsi, DSI_VC_CTRL(vc));
> =20
>  	return 0;
>  }
> =20
> -static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int chan=
nel)
> +static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	int r =3D 0;
>  	u32 err;
> =20
> -	r =3D dsi_register_isr_vc(dsi, channel, dsi_completion_handler,
> +	r =3D dsi_register_isr_vc(dsi, vc, dsi_completion_handler,
>  			&completion, DSI_VC_IRQ_BTA);
>  	if (r)
>  		goto err0;
> @@ -2577,7 +2577,7 @@ static int dsi_vc_send_bta_sync(struct omap_dss_dev=
ice *dssdev, int channel)
>  	if (r)
>  		goto err1;
> =20
> -	r =3D dsi_vc_send_bta(dsi, channel);
> +	r =3D dsi_vc_send_bta(dsi, vc);
>  	if (r)
>  		goto err2;
> =20
> @@ -2598,13 +2598,13 @@ static int dsi_vc_send_bta_sync(struct omap_dss_d=
evice *dssdev, int channel)
>  	dsi_unregister_isr(dsi, dsi_completion_handler, &completion,
>  			DSI_IRQ_ERROR_MASK);
>  err1:
> -	dsi_unregister_isr_vc(dsi, channel, dsi_completion_handler,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_completion_handler,
>  			&completion, DSI_VC_IRQ_BTA);
>  err0:
>  	return r;
>  }
> =20
> -static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int ch=
annel,
> +static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int vc,
>  					    u8 data_type, u16 len, u8 ecc)
>  {
>  	u32 val;
> @@ -2612,15 +2612,15 @@ static inline void dsi_vc_write_long_header(struc=
t dsi_data *dsi, int channel,
> =20
>  	WARN_ON(!dsi_bus_is_locked(dsi));
> =20
> -	data_id =3D data_type | channel << 6;
> +	data_id =3D data_type | vc << 6;
> =20
>  	val =3D FLD_VAL(data_id, 7, 0) | FLD_VAL(len, 23, 8) |
>  		FLD_VAL(ecc, 31, 24);
> =20
> -	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_HEADER(channel), val);
> +	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_HEADER(vc), val);
>  }
> =20
> -static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int c=
hannel,
> +static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int v=
c,
>  					     u8 b1, u8 b2, u8 b3, u8 b4)
>  {
>  	u32 val;
> @@ -2630,7 +2630,7 @@ static inline void dsi_vc_write_long_payload(struct=
 dsi_data *dsi, int channel,
>  /*	DSSDBG("\twriting %02x, %02x, %02x, %02x (%#010x)\n",
>  			b1, b2, b3, b4, val); */
> =20
> -	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(channel), val);
> +	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(vc), val);
>  }
> =20
>  static int dsi_vc_send_long(struct dsi_data *dsi,
> @@ -2727,10 +2727,10 @@ static int dsi_vc_send_short(struct dsi_data *dsi,
>  	return 0;
>  }
> =20
> -static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc)
>  {
>  	const struct mipi_dsi_msg msg =3D {
> -		.channel =3D channel,
> +		.channel =3D vc,
>  		.type =3D MIPI_DSI_NULL_PACKET,
>  	};
> =20
> @@ -2774,7 +2774,7 @@ static int dsi_vc_write_common(struct omap_dss_devi=
ce *dssdev,
>  	return 0;
>  }
> =20
> -static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *bu=
f,
> +static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int vc, u8 *buf,
>  			       int buflen, enum dss_dsi_content_type type)
>  {
>  	u32 val;
> @@ -2782,13 +2782,13 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *d=
si, int channel, u8 *buf,
>  	int r;
> =20
>  	/* RX_FIFO_NOT_EMPTY */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20) =3D=3D 0) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20) =3D=3D 0) {
>  		DSSERR("RX fifo empty when trying to read.\n");
>  		r =3D -EIO;
>  		goto err;
>  	}
> =20
> -	val =3D dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel));
> +	val =3D dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc));
>  	if (dsi->debug_read)
>  		DSSDBG("\theader: %08x\n", val);
>  	dt =3D FLD_GET(val, 5, 0);
> @@ -2852,7 +2852,7 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi=
, int channel, u8 *buf,
>  		for (w =3D 0; w < len + 2;) {
>  			int b;
>  			val =3D dsi_read_reg(dsi,
> -				DSI_VC_SHORT_PACKET_HEADER(channel));
> +				DSI_VC_SHORT_PACKET_HEADER(vc));
>  			if (dsi->debug_read)
>  				DSSDBG("\t\t%02x %02x %02x %02x\n",
>  						(val >> 0) & 0xff,
> @@ -2876,7 +2876,7 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi=
, int channel, u8 *buf,
>  	}
> =20
>  err:
> -	DSSERR("dsi_vc_read_rx_fifo(ch %d type %s) failed\n", channel,
> +	DSSERR("dsi_vc_read_rx_fifo(vc %d type %s) failed\n", vc,
>  		type =3D=3D DSS_DSI_CONTENT_GENERIC ? "GENERIC" : "DCS");
> =20
>  	return r;
> @@ -3631,7 +3631,7 @@ static int dsi_configure_pins(struct dsi_data *dsi,
>  	return 0;
>  }
> =20
> -static void dsi_enable_video_output(struct omap_dss_device *dssdev, int =
channel)
> +static void dsi_enable_video_output(struct omap_dss_device *dssdev, int =
vc)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
>  	int bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
> @@ -3665,17 +3665,17 @@ static void dsi_enable_video_output(struct omap_d=
ss_device *dssdev, int channel)
>  		}
> =20
>  		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, channel, false);
> +		dsi_vc_enable(dsi, vc, false);
> =20
>  		/* MODE, 1 =3D video mode */
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), 1, 4, 4);
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 4, 4);
> =20
>  		word_count =3D DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
> =20
> -		dsi_vc_write_long_header(dsi, channel, data_type,
> +		dsi_vc_write_long_header(dsi, vc, data_type,
>  				word_count, 0);
> =20
> -		dsi_vc_enable(dsi, channel, true);
> +		dsi_vc_enable(dsi, vc, true);
>  		dsi_if_enable(dsi, true);
>  	}
> =20
> @@ -3688,7 +3688,7 @@ static void dsi_enable_video_output(struct omap_dss=
_device *dssdev, int channel)
>  err_mgr_enable:
>  	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE) {
>  		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, channel, false);
> +		dsi_vc_enable(dsi, vc, false);
>  	}
>  err_pix_fmt:
>  	dsi_display_uninit_dispc(dsi);
> @@ -3696,18 +3696,18 @@ static void dsi_enable_video_output(struct omap_d=
ss_device *dssdev, int channel)
>  	return;
>  }
> =20
> -static void dsi_disable_video_output(struct omap_dss_device *dssdev, int=
 channel)
> +static void dsi_disable_video_output(struct omap_dss_device *dssdev, int=
 vc)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> =20
>  	if (dsi->mode =3D=3D OMAP_DSS_DSI_VIDEO_MODE) {
>  		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, channel, false);
> +		dsi_vc_enable(dsi, vc, false);
> =20
>  		/* MODE, 0 =3D command mode */
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), 0, 4, 4);
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 0, 4, 4);
> =20
> -		dsi_vc_enable(dsi, channel, true);
> +		dsi_vc_enable(dsi, vc, true);
>  		dsi_if_enable(dsi, true);
>  	}
> =20
> @@ -3740,14 +3740,14 @@ static void dsi_update_screen_dispc(struct dsi_da=
ta *dsi)
>  	unsigned int packet_len;
>  	u32 l;
>  	int r;
> -	const unsigned channel =3D dsi->update_channel;
> +	const unsigned vc =3D dsi->update_vc;
>  	const unsigned int line_buf_size =3D dsi->line_buffer_size;
>  	u16 w =3D dsi->vm.hactive;
>  	u16 h =3D dsi->vm.vactive;
> =20
>  	DSSDBG("dsi_update_screen_dispc(%dx%d)\n", w, h);
> =20
> -	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_VP);
> +	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_VP);
> =20
>  	bytespp	=3D mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
>  	bytespl =3D w * bytespp;
> @@ -3768,16 +3768,16 @@ static void dsi_update_screen_dispc(struct dsi_da=
ta *dsi)
>  		total_len +=3D (bytespf % packet_payload) + 1;
> =20
>  	l =3D FLD_VAL(total_len, 23, 0); /* TE_SIZE */
> -	dsi_write_reg(dsi, DSI_VC_TE(channel), l);
> +	dsi_write_reg(dsi, DSI_VC_TE(vc), l);
> =20
> -	dsi_vc_write_long_header(dsi, channel, MIPI_DSI_DCS_LONG_WRITE,
> +	dsi_vc_write_long_header(dsi, vc, MIPI_DSI_DCS_LONG_WRITE,
>  		packet_len, 0);
> =20
>  	if (dsi->te_enabled)
>  		l =3D FLD_MOD(l, 1, 30, 30); /* TE_EN */
>  	else
>  		l =3D FLD_MOD(l, 1, 31, 31); /* TE_START */
> -	dsi_write_reg(dsi, DSI_VC_TE(channel), l);
> +	dsi_write_reg(dsi, DSI_VC_TE(vc), l);
> =20
>  	/* We put SIDLEMODE to no-idle for the duration of the transfer,
>  	 * because DSS interrupts are not capable of waking up the CPU and the
> @@ -3800,7 +3800,7 @@ static void dsi_update_screen_dispc(struct dsi_data=
 *dsi)
>  		 * for TE is longer than the timer allows */
>  		REG_FLD_MOD(dsi, DSI_TIMING2, 0, 15, 15); /* LP_RX_TO */
> =20
> -		dsi_vc_send_bta(dsi, channel);
> +		dsi_vc_send_bta(dsi, vc);
> =20
>  #ifdef DSI_CATCH_MISSING_TE
>  		mod_timer(&dsi->te_timer, jiffies + msecs_to_jiffies(250));
> @@ -3897,7 +3897,7 @@ static int _dsi_send_nop(struct dsi_data *dsi, int =
channel)
>  	return _omap_dsi_host_transfer(dsi, &msg);
>  }
> =20
> -static int dsi_update_channel(struct omap_dss_device *dssdev, int channe=
l)
> +static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi =3D to_dsi_data(dssdev);
>  	int r;
> @@ -3914,7 +3914,7 @@ static int dsi_update_channel(struct omap_dss_devic=
e *dssdev, int channel)
>  		goto err;
>  	}
> =20
> -	DSSDBG("dsi_update_channel: %d", channel);
> +	DSSDBG("dsi_update_channel: %d", vc);
> =20
>  	dsi_set_ulps_auto(dsi, false);
> =20
> @@ -3923,13 +3923,13 @@ static int dsi_update_channel(struct omap_dss_dev=
ice *dssdev, int channel)
>  	 * updates stop working. This is probably related to DSI spec stating
>  	 * that the DSI host should transition to LP at least once per frame.
>  	 */
> -	r =3D _dsi_send_nop(dsi, channel);
> +	r =3D _dsi_send_nop(dsi, vc);
>  	if (r < 0) {
>  		DSSWARN("failed to send nop between frames: %d\n", r);
>  		goto err;
>  	}
> =20
> -	dsi->update_channel =3D channel;
> +	dsi->update_vc =3D vc;
> =20
>  	if (dsi->te_enabled && dsi->te_gpio) {
>  		schedule_delayed_work(&dsi->te_timeout_work,
> --=20
> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>=20

--dsral4cthmuwalrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl/XgigACgkQ2O7X88g7
+pqNaxAAkAJFsfKMDQedVLRc8HPyru0ZD/6P7pmPb6ebeDUh5Pb1FouTWY0pt/VK
qJlaKfYu+1FhzliJ4VRgzhXq9toksoefd3go1Mb8iCfbQpmzBLMc0AyqhXBbkkzT
5wKYtATrOfKZy+yieYjaoL1nRveP2XodSIxA+BHOjyMX4nop4TjgqhORlXsUc5AJ
4w81Sz/+/Zju54x2AospZZJq9Jz3Ui483bjeBR3HPcWEg+2NQTs0BipR22DuGhP+
RzfzYJBdMgVqMvC7koTHRw+xMLr7mXjMXUWcLM6tZuh1rm3bJ87IoKMfa2RbJy82
3oIxKqHwankuTEW5xqE/yRkaKHS8WnPfjjgZM1XMLDuGwrzVFV/hu7P/gYKFMPDX
4rJbxjXfWYvPPYhMAa17iGI77BR0bKGk3Ic3cHwrGn0buVqBqaom6LDECF8rRAOL
vdmfJnUlWW5S8m9qdlV8yQB+qQxxUaKzTrunW0OB3WTyq1wDxw+NIzWbMxmivA7K
0YesFRHtbv8GUDexOdZZakZiUS/CfKET0dUrZ4kXqLbB6CTWfo50ilvOm+nVz77A
mhSdv505WJ6dxpeXFJpmHs0G2r3nqYtCLQp2sRYH+SAItbalLc6avXyu2QyOVLKb
IZqO+3pLEVp6FX3gqqbRCOyTRdJO4R6h8PBC9Nc0izC5MYHwfWQ=
=DVG4
-----END PGP SIGNATURE-----

--dsral4cthmuwalrt--

--===============1882053922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1882053922==--
