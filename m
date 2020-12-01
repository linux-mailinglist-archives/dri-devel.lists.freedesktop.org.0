Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED23A2C93C0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:17:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD50D89D99;
	Tue,  1 Dec 2020 00:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D7889D99
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:17:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18A0345D;
 Tue,  1 Dec 2020 01:17:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606781841;
 bh=NClNGpHAj8+eKrKPzjWK9F2YlEUwQxmlsd336zrKHB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qB5vPi+2SAjLwcJD/G/5Yy0Rf/x0uC8XaA98i29h1sh/AwBg+jiq6u8o2Rt6VD6Ld
 vOSH9FhMaTMIVYu1wd6yS33L03KbXh+3gb6ExW9s5bhIicfev7leiocQj9rBcCil1p
 6vC9PCFhULrZ3u2P9ZIIF+ZjymhosOThwaaze74E=
Date: Tue, 1 Dec 2020 02:17:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 64/80] drm/omap: dsi: cleanup channel usages
Message-ID: <20201201001712.GI25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-65-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-65-tomi.valkeinen@ti.com>
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
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:22PM +0200, Tomi Valkeinen wrote:
> The "channel" usage in omap dsi driver is super confusing. We have three
> different "channels":
> 
> 1) DSI virtual channel ID. This is a number from 0 to 3, included in the
> packet payload.
> 
> 2) VC. This is a register block in the DSI IP. There are four of those
> blocks. A VC is a DSI "pipeline", with defined fifo settings, data
> source (cpu or dispc), and some other settings. It has no relation to
> the 1).

Lovely that it's called VC :-)

> 3) dispc channel. It's the "pipeline" number dispc uses to send pixel
> data.
> 
> To clean this up use the following names for each of the above: 1)
> "channel" 2) "vc" 3) "dispc_channel"

1) and 2) will still be prone to confusion :-S Would it help to name 2)
hw_vc or something similar ?

> This patch is mostly about renaming things, but as in some places 1) and
> 2) have gotten mixed up, additional changes were needed to untangle
> them. This is mostly just adding a new parameter to some functions so
> that we pass both the vc and the channel.

It would ease review if this could be split in two patches.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 315 +++++++++++++++---------------
>  1 file changed, 158 insertions(+), 157 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index fbf05097612f..4ac82166edc3 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -214,9 +214,9 @@ static void dsi_set_ulps_auto(struct dsi_data *dsi, bool enable);
>  static int dsi_display_init_dispc(struct dsi_data *dsi);
>  static void dsi_display_uninit_dispc(struct dsi_data *dsi);
>  
> -static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel);
>  
> -static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
> +static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
>  				       const struct mipi_dsi_msg *msg);
>  
>  static void dsi_display_disable(struct omap_dss_device *dssdev);
> @@ -376,7 +376,7 @@ struct dsi_data {
>  	/* space for a copy used by the interrupt handler */
>  	struct dsi_isr_tables isr_tables_copy;
>  
> -	int update_channel;
> +	int update_vc;
>  #ifdef DSI_PERF_MEASURE
>  	unsigned int update_bytes;
>  #endif
> @@ -639,7 +639,7 @@ static void print_irq_status(u32 status)
>  #undef PIS
>  }
>  
> -static void print_irq_status_vc(int channel, u32 status)
> +static void print_irq_status_vc(int vc, u32 status)
>  {
>  	if (status == 0)
>  		return;
> @@ -650,7 +650,7 @@ static void print_irq_status_vc(int channel, u32 status)
>  #define PIS(x) (status & DSI_VC_IRQ_##x) ? (#x " ") : ""
>  
>  	pr_debug("DSI VC(%d) IRQ 0x%x: %s%s%s%s%s%s%s%s%s\n",
> -		channel,
> +		vc,
>  		status,
>  		PIS(CS),
>  		PIS(ECC_CORR),
> @@ -1031,7 +1031,7 @@ static int dsi_unregister_isr(struct dsi_data *dsi, omap_dsi_isr_t isr,
>  	return r;
>  }
>  
> -static int dsi_register_isr_vc(struct dsi_data *dsi, int channel,
> +static int dsi_register_isr_vc(struct dsi_data *dsi, int vc,
>  			       omap_dsi_isr_t isr, void *arg, u32 mask)
>  {
>  	unsigned long flags;
> @@ -1040,18 +1040,18 @@ static int dsi_register_isr_vc(struct dsi_data *dsi, int channel,
>  	spin_lock_irqsave(&dsi->irq_lock, flags);
>  
>  	r = _dsi_register_isr(isr, arg, mask,
> -			dsi->isr_tables.isr_table_vc[channel],
> -			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[channel]));
> +			dsi->isr_tables.isr_table_vc[vc],
> +			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[vc]));
>  
>  	if (r == 0)
> -		_omap_dsi_set_irqs_vc(dsi, channel);
> +		_omap_dsi_set_irqs_vc(dsi, vc);
>  
>  	spin_unlock_irqrestore(&dsi->irq_lock, flags);
>  
>  	return r;
>  }
>  
> -static int dsi_unregister_isr_vc(struct dsi_data *dsi, int channel,
> +static int dsi_unregister_isr_vc(struct dsi_data *dsi, int vc,
>  				 omap_dsi_isr_t isr, void *arg, u32 mask)
>  {
>  	unsigned long flags;
> @@ -1060,11 +1060,11 @@ static int dsi_unregister_isr_vc(struct dsi_data *dsi, int channel,
>  	spin_lock_irqsave(&dsi->irq_lock, flags);
>  
>  	r = _dsi_unregister_isr(isr, arg, mask,
> -			dsi->isr_tables.isr_table_vc[channel],
> -			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[channel]));
> +			dsi->isr_tables.isr_table_vc[vc],
> +			ARRAY_SIZE(dsi->isr_tables.isr_table_vc[vc]));
>  
>  	if (r == 0)
> -		_omap_dsi_set_irqs_vc(dsi, channel);
> +		_omap_dsi_set_irqs_vc(dsi, vc);
>  
>  	spin_unlock_irqrestore(&dsi->irq_lock, flags);
>  
> @@ -2232,9 +2232,9 @@ static int dsi_force_tx_stop_mode_io(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static bool dsi_vc_is_enabled(struct dsi_data *dsi, int channel)
> +static bool dsi_vc_is_enabled(struct dsi_data *dsi, int vc)
>  {
> -	return REG_GET(dsi, DSI_VC_CTRL(channel), 0, 0);
> +	return REG_GET(dsi, DSI_VC_CTRL(vc), 0, 0);
>  }
>  
>  static void dsi_packet_sent_handler_vp(void *data, u32 mask)
> @@ -2242,14 +2242,14 @@ static void dsi_packet_sent_handler_vp(void *data, u32 mask)
>  	struct dsi_packet_sent_handler_data *vp_data =
>  		(struct dsi_packet_sent_handler_data *) data;
>  	struct dsi_data *dsi = vp_data->dsi;
> -	const int channel = dsi->update_channel;
> +	const int vc = dsi->update_vc;
>  	u8 bit = dsi->te_enabled ? 30 : 31;
>  
> -	if (REG_GET(dsi, DSI_VC_TE(channel), bit, bit) == 0)
> +	if (REG_GET(dsi, DSI_VC_TE(vc), bit, bit) == 0)
>  		complete(vp_data->completion);
>  }
>  
> -static int dsi_sync_vc_vp(struct dsi_data *dsi, int channel)
> +static int dsi_sync_vc_vp(struct dsi_data *dsi, int vc)
>  {
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	struct dsi_packet_sent_handler_data vp_data = {
> @@ -2261,13 +2261,13 @@ static int dsi_sync_vc_vp(struct dsi_data *dsi, int channel)
>  
>  	bit = dsi->te_enabled ? 30 : 31;
>  
> -	r = dsi_register_isr_vc(dsi, channel, dsi_packet_sent_handler_vp,
> +	r = dsi_register_isr_vc(dsi, vc, dsi_packet_sent_handler_vp,
>  		&vp_data, DSI_VC_IRQ_PACKET_SENT);
>  	if (r)
>  		goto err0;
>  
>  	/* Wait for completion only if TE_EN/TE_START is still set */
> -	if (REG_GET(dsi, DSI_VC_TE(channel), bit, bit)) {
> +	if (REG_GET(dsi, DSI_VC_TE(vc), bit, bit)) {
>  		if (wait_for_completion_timeout(&completion,
>  				msecs_to_jiffies(10)) == 0) {
>  			DSSERR("Failed to complete previous frame transfer\n");
> @@ -2276,12 +2276,12 @@ static int dsi_sync_vc_vp(struct dsi_data *dsi, int channel)
>  		}
>  	}
>  
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_vp,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_vp,
>  		&vp_data, DSI_VC_IRQ_PACKET_SENT);
>  
>  	return 0;
>  err1:
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_vp,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_vp,
>  		&vp_data, DSI_VC_IRQ_PACKET_SENT);
>  err0:
>  	return r;
> @@ -2292,13 +2292,13 @@ static void dsi_packet_sent_handler_l4(void *data, u32 mask)
>  	struct dsi_packet_sent_handler_data *l4_data =
>  		(struct dsi_packet_sent_handler_data *) data;
>  	struct dsi_data *dsi = l4_data->dsi;
> -	const int channel = dsi->update_channel;
> +	const int vc = dsi->update_vc;
>  
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 5, 5) == 0)
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 5, 5) == 0)
>  		complete(l4_data->completion);
>  }
>  
> -static int dsi_sync_vc_l4(struct dsi_data *dsi, int channel)
> +static int dsi_sync_vc_l4(struct dsi_data *dsi, int vc)
>  {
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	struct dsi_packet_sent_handler_data l4_data = {
> @@ -2307,13 +2307,13 @@ static int dsi_sync_vc_l4(struct dsi_data *dsi, int channel)
>  	};
>  	int r = 0;
>  
> -	r = dsi_register_isr_vc(dsi, channel, dsi_packet_sent_handler_l4,
> +	r = dsi_register_isr_vc(dsi, vc, dsi_packet_sent_handler_l4,
>  		&l4_data, DSI_VC_IRQ_PACKET_SENT);
>  	if (r)
>  		goto err0;
>  
>  	/* Wait for completion only if TX_FIFO_NOT_EMPTY is still set */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 5, 5)) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 5, 5)) {
>  		if (wait_for_completion_timeout(&completion,
>  				msecs_to_jiffies(10)) == 0) {
>  			DSSERR("Failed to complete previous l4 transfer\n");
> @@ -2322,47 +2322,47 @@ static int dsi_sync_vc_l4(struct dsi_data *dsi, int channel)
>  		}
>  	}
>  
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_l4,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_l4,
>  		&l4_data, DSI_VC_IRQ_PACKET_SENT);
>  
>  	return 0;
>  err1:
> -	dsi_unregister_isr_vc(dsi, channel, dsi_packet_sent_handler_l4,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_packet_sent_handler_l4,
>  		&l4_data, DSI_VC_IRQ_PACKET_SENT);
>  err0:
>  	return r;
>  }
>  
> -static int dsi_sync_vc(struct dsi_data *dsi, int channel)
> +static int dsi_sync_vc(struct dsi_data *dsi, int vc)
>  {
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
>  	WARN_ON(in_interrupt());
>  
> -	if (!dsi_vc_is_enabled(dsi, channel))
> +	if (!dsi_vc_is_enabled(dsi, vc))
>  		return 0;
>  
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
>  
> -static int dsi_vc_enable(struct dsi_data *dsi, int channel, bool enable)
> +static int dsi_vc_enable(struct dsi_data *dsi, int vc, bool enable)
>  {
> -	DSSDBG("dsi_vc_enable channel %d, enable %d\n",
> -			channel, enable);
> +	DSSDBG("dsi_vc_enable vc %d, enable %d\n",
> +			vc, enable);
>  
>  	enable = enable ? 1 : 0;
>  
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), enable, 0, 0);
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 0, 0);
>  
> -	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(channel), 0, enable)) {
> +	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(vc), 0, enable)) {
>  		DSSERR("Failed to set dsi_vc_enable to %d\n", enable);
>  		return -EIO;
>  	}
> @@ -2370,17 +2370,17 @@ static int dsi_vc_enable(struct dsi_data *dsi, int channel, bool enable)
>  	return 0;
>  }
>  
> -static void dsi_vc_initial_config(struct dsi_data *dsi, int channel)
> +static void dsi_vc_initial_config(struct dsi_data *dsi, int vc)
>  {
>  	u32 r;
>  
> -	DSSDBG("Initial config of virtual channel %d", channel);
> +	DSSDBG("Initial config of VC %d", vc);
>  
> -	r = dsi_read_reg(dsi, DSI_VC_CTRL(channel));
> +	r = dsi_read_reg(dsi, DSI_VC_CTRL(vc));
>  
>  	if (FLD_GET(r, 15, 15)) /* VC_BUSY */
>  		DSSERR("VC(%d) busy when trying to configure it!\n",
> -				channel);
> +				vc);
>  
>  	r = FLD_MOD(r, 0, 1, 1); /* SOURCE, 0 = L4 */
>  	r = FLD_MOD(r, 0, 2, 2); /* BTA_SHORT_EN  */
> @@ -2395,76 +2395,76 @@ static void dsi_vc_initial_config(struct dsi_data *dsi, int channel)
>  	r = FLD_MOD(r, 4, 29, 27); /* DMA_RX_REQ_NB = no dma */
>  	r = FLD_MOD(r, 4, 23, 21); /* DMA_TX_REQ_NB = no dma */
>  
> -	dsi_write_reg(dsi, DSI_VC_CTRL(channel), r);
> +	dsi_write_reg(dsi, DSI_VC_CTRL(vc), r);
>  
> -	dsi->vc[channel].source = DSI_VC_SOURCE_L4;
> +	dsi->vc[vc].source = DSI_VC_SOURCE_L4;
>  }
>  
> -static int dsi_vc_config_source(struct dsi_data *dsi, int channel,
> +static int dsi_vc_config_source(struct dsi_data *dsi, int vc,
>  				enum dsi_vc_source source)
>  {
> -	if (dsi->vc[channel].source == source)
> +	if (dsi->vc[vc].source == source)
>  		return 0;
>  
> -	DSSDBG("Source config of virtual channel %d", channel);
> +	DSSDBG("Source config of VC %d", vc);
>  
> -	dsi_sync_vc(dsi, channel);
> +	dsi_sync_vc(dsi, vc);
>  
> -	dsi_vc_enable(dsi, channel, 0);
> +	dsi_vc_enable(dsi, vc, 0);
>  
>  	/* VC_BUSY */
> -	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(channel), 15, 0)) {
> -		DSSERR("vc(%d) busy when trying to config for VP\n", channel);
> +	if (!wait_for_bit_change(dsi, DSI_VC_CTRL(vc), 15, 0)) {
> +		DSSERR("vc(%d) busy when trying to config for VP\n", vc);
>  		return -EIO;
>  	}
>  
>  	/* SOURCE, 0 = L4, 1 = video port */
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), source, 1, 1);
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), source, 1, 1);
>  
>  	/* DCS_CMD_ENABLE */
>  	if (dsi->data->quirks & DSI_QUIRK_DCS_CMD_CONFIG_VC) {
>  		bool enable = source == DSI_VC_SOURCE_VP;
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), enable, 30, 30);
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 30, 30);
>  	}
>  
> -	dsi_vc_enable(dsi, channel, 1);
> +	dsi_vc_enable(dsi, vc, 1);
>  
> -	dsi->vc[channel].source = source;
> +	dsi->vc[vc].source = source;
>  
>  	return 0;
>  }
>  
> -static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int channel,
> +static void dsi_vc_enable_hs(struct omap_dss_device *dssdev, int vc,
>  		bool enable)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  
> -	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", channel, enable);
> +	DSSDBG("dsi_vc_enable_hs(%d, %d)\n", vc, enable);
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> -	dsi_vc_enable(dsi, channel, 0);
> +	dsi_vc_enable(dsi, vc, 0);
>  	dsi_if_enable(dsi, 0);
>  
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), enable, 9, 9);
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), enable, 9, 9);
>  
> -	dsi_vc_enable(dsi, channel, 1);
> +	dsi_vc_enable(dsi, vc, 1);
>  	dsi_if_enable(dsi, 1);
>  
>  	dsi_force_tx_stop_mode_io(dsi);
>  
>  	/* start the DDR clock by sending a NULL packet */
>  	if (dsi->vm_timings.ddr_clk_always_on && enable)
> -		dsi_vc_send_null(dsi, channel);
> +		dsi_vc_send_null(dsi, vc, dsi->dsidev->channel);
>  
>  	dsi->in_lp_mode = !enable;
>  }
>  
> -static void dsi_vc_flush_long_data(struct dsi_data *dsi, int channel)
> +static void dsi_vc_flush_long_data(struct dsi_data *dsi, int vc)
>  {
> -	while (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	while (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		u32 val;
> -		val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel));
> +		val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc));
>  		DSSDBG("\t\tb1 %#02x b2 %#02x b3 %#02x b4 %#02x\n",
>  				(val >> 0) & 0xff,
>  				(val >> 8) & 0xff,
> @@ -2510,13 +2510,13 @@ static void dsi_show_rx_ack_with_err(u16 err)
>  		DSSERR("\t\tDSI Protocol Violation\n");
>  }
>  
> -static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int channel)
> +static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int vc)
>  {
>  	/* RX_FIFO_NOT_EMPTY */
> -	while (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	while (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		u32 val;
>  		u8 dt;
> -		val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel));
> +		val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc));
>  		DSSERR("\trawval %#08x\n", val);
>  		dt = FLD_GET(val, 5, 0);
>  		if (dt == MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT) {
> @@ -2531,7 +2531,7 @@ static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int channel)
>  		} else if (dt == MIPI_DSI_RX_DCS_LONG_READ_RESPONSE) {
>  			DSSERR("\tDCS long response, len %d\n",
>  					FLD_GET(val, 23, 8));
> -			dsi_vc_flush_long_data(dsi, channel);
> +			dsi_vc_flush_long_data(dsi, vc);
>  		} else {
>  			DSSERR("\tunknown datatype 0x%02x\n", dt);
>  		}
> @@ -2539,35 +2539,35 @@ static u16 dsi_vc_flush_receive_data(struct dsi_data *dsi, int channel)
>  	return 0;
>  }
>  
> -static int dsi_vc_send_bta(struct dsi_data *dsi, int channel)
> +static int dsi_vc_send_bta(struct dsi_data *dsi, int vc)
>  {
>  	if (dsi->debug_write || dsi->debug_read)
> -		DSSDBG("dsi_vc_send_bta %d\n", channel);
> +		DSSDBG("dsi_vc_send_bta %d\n", vc);
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
>  	/* RX_FIFO_NOT_EMPTY */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20)) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		DSSERR("rx fifo not empty when sending BTA, dumping data:\n");
> -		dsi_vc_flush_receive_data(dsi, channel);
> +		dsi_vc_flush_receive_data(dsi, vc);
>  	}
>  
> -	REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), 1, 6, 6); /* BTA_EN */
> +	REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 6, 6); /* BTA_EN */
>  
>  	/* flush posted write */
> -	dsi_read_reg(dsi, DSI_VC_CTRL(channel));
> +	dsi_read_reg(dsi, DSI_VC_CTRL(vc));
>  
>  	return 0;
>  }
>  
> -static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int channel)
> +static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	DECLARE_COMPLETION_ONSTACK(completion);
>  	int r = 0;
>  	u32 err;
>  
> -	r = dsi_register_isr_vc(dsi, channel, dsi_completion_handler,
> +	r = dsi_register_isr_vc(dsi, vc, dsi_completion_handler,
>  			&completion, DSI_VC_IRQ_BTA);
>  	if (r)
>  		goto err0;
> @@ -2577,7 +2577,7 @@ static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int channel)
>  	if (r)
>  		goto err1;
>  
> -	r = dsi_vc_send_bta(dsi, channel);
> +	r = dsi_vc_send_bta(dsi, vc);
>  	if (r)
>  		goto err2;
>  
> @@ -2598,14 +2598,15 @@ static int dsi_vc_send_bta_sync(struct omap_dss_device *dssdev, int channel)
>  	dsi_unregister_isr(dsi, dsi_completion_handler, &completion,
>  			DSI_IRQ_ERROR_MASK);
>  err1:
> -	dsi_unregister_isr_vc(dsi, channel, dsi_completion_handler,
> +	dsi_unregister_isr_vc(dsi, vc, dsi_completion_handler,
>  			&completion, DSI_VC_IRQ_BTA);
>  err0:
>  	return r;
>  }
>  
> -static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int channel,
> -					    u8 data_type, u16 len, u8 ecc)
> +static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int vc,
> +					    int channel, u8 data_type, u16 len,
> +					    u8 ecc)
>  {
>  	u32 val;
>  	u8 data_id;
> @@ -2615,12 +2616,12 @@ static inline void dsi_vc_write_long_header(struct dsi_data *dsi, int channel,
>  	data_id = data_type | channel << 6;
>  
>  	val = FLD_VAL(data_id, 7, 0) | FLD_VAL(len, 23, 8) |
> -		FLD_VAL(ecc, 31, 24);
> +	      FLD_VAL(ecc, 31, 24);
>  
> -	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_HEADER(channel), val);
> +	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_HEADER(vc), val);
>  }
>  
> -static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
> +static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int vc,
>  					     u8 b1, u8 b2, u8 b3, u8 b4)
>  {
>  	u32 val;
> @@ -2630,10 +2631,10 @@ static inline void dsi_vc_write_long_payload(struct dsi_data *dsi, int channel,
>  /*	DSSDBG("\twriting %02x, %02x, %02x, %02x (%#010x)\n",
>  			b1, b2, b3, b4, val); */
>  
> -	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(channel), val);
> +	dsi_write_reg(dsi, DSI_VC_LONG_PACKET_PAYLOAD(vc), val);
>  }
>  
> -static int dsi_vc_send_long(struct dsi_data *dsi,
> +static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
>  			    const struct mipi_dsi_msg *msg)
>  {
>  	/*u32 val; */
> @@ -2646,14 +2647,14 @@ static int dsi_vc_send_long(struct dsi_data *dsi,
>  		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
>  
>  	/* len + header */
> -	if (dsi->vc[msg->channel].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
> +	if (dsi->vc[vc].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
>  		DSSERR("unable to send long packet: packet too long.\n");
>  		return -EINVAL;
>  	}
>  
> -	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
> +	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
>  
> -	dsi_vc_write_long_header(dsi, msg->channel, msg->type, msg->tx_len, 0);
> +	dsi_vc_write_long_header(dsi, vc, msg->channel, msg->type, msg->tx_len, 0);
>  
>  	p = msg->tx_buf;
>  	for (i = 0; i < msg->tx_len >> 2; i++) {
> @@ -2665,7 +2666,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi,
>  		b3 = *p++;
>  		b4 = *p++;
>  
> -		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, b4);
> +		dsi_vc_write_long_payload(dsi, vc, b1, b2, b3, b4);
>  	}
>  
>  	i = msg->tx_len % 4;
> @@ -2690,13 +2691,13 @@ static int dsi_vc_send_long(struct dsi_data *dsi,
>  			break;
>  		}
>  
> -		dsi_vc_write_long_payload(dsi, msg->channel, b1, b2, b3, 0);
> +		dsi_vc_write_long_payload(dsi, vc, b1, b2, b3, 0);
>  	}
>  
>  	return r;
>  }
>  
> -static int dsi_vc_send_short(struct dsi_data *dsi,
> +static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
>  			     const struct mipi_dsi_msg *msg)
>  {
>  	struct mipi_dsi_packet pkt;
> @@ -2710,11 +2711,11 @@ static int dsi_vc_send_short(struct dsi_data *dsi,
>  
>  	if (dsi->debug_write)
>  		DSSDBG("dsi_vc_send_short(ch%d, dt %#x, b1 %#x, b2 %#x)\n",
> -		       msg->channel, msg->type, pkt.header[1], pkt.header[2]);
> +		       vc, msg->type, pkt.header[1], pkt.header[2]);
>  
> -	dsi_vc_config_source(dsi, msg->channel, DSI_VC_SOURCE_L4);
> +	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_L4);
>  
> -	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(msg->channel)), 16, 16)) {
> +	if (FLD_GET(dsi_read_reg(dsi, DSI_VC_CTRL(vc)), 16, 16)) {
>  		DSSERR("ERROR FIFO FULL, aborting transfer\n");
>  		return -EINVAL;
>  	}
> @@ -2722,31 +2723,31 @@ static int dsi_vc_send_short(struct dsi_data *dsi,
>  	r = pkt.header[3] << 24 | pkt.header[2] << 16 | pkt.header[1] << 8 |
>  	    pkt.header[0];
>  
> -	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(msg->channel), r);
> +	dsi_write_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc), r);
>  
>  	return 0;
>  }
>  
> -static int dsi_vc_send_null(struct dsi_data *dsi, int channel)
> +static int dsi_vc_send_null(struct dsi_data *dsi, int vc, int channel)
>  {
>  	const struct mipi_dsi_msg msg = {
>  		.channel = channel,
>  		.type = MIPI_DSI_NULL_PACKET,
>  	};
>  
> -	return dsi_vc_send_long(dsi, &msg);
> +	return dsi_vc_send_long(dsi, vc, &msg);
>  }
>  
> -static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> +static int dsi_vc_write_common(struct omap_dss_device *dssdev, int vc,
>  			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
>  
>  	if (mipi_dsi_packet_format_is_short(msg->type))
> -		r = dsi_vc_send_short(dsi, msg);
> +		r = dsi_vc_send_short(dsi, vc, msg);
>  	else
> -		r = dsi_vc_send_long(dsi, msg);
> +		r = dsi_vc_send_long(dsi, vc, msg);
>  
>  	if (r < 0)
>  		return r;
> @@ -2758,23 +2759,23 @@ static int dsi_vc_write_common(struct omap_dss_device *dssdev,
>  	 * In that case we can return early.
>  	 */
>  
> -	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
> +	r = dsi_vc_send_bta_sync(dssdev, vc);
>  	if (r) {
>  		DSSERR("bta sync failed\n");
>  		return r;
>  	}
>  
>  	/* RX_FIFO_NOT_EMPTY */
> -	if (REG_GET(dsi, DSI_VC_CTRL(msg->channel), 20, 20)) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20)) {
>  		DSSERR("rx fifo not empty after write, dumping data:\n");
> -		dsi_vc_flush_receive_data(dsi, msg->channel);
> +		dsi_vc_flush_receive_data(dsi, vc);
>  		return -EIO;
>  	}
>  
>  	return 0;
>  }
>  
> -static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
> +static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int vc, u8 *buf,
>  			       int buflen, enum dss_dsi_content_type type)
>  {
>  	u32 val;
> @@ -2782,13 +2783,13 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
>  	int r;
>  
>  	/* RX_FIFO_NOT_EMPTY */
> -	if (REG_GET(dsi, DSI_VC_CTRL(channel), 20, 20) == 0) {
> +	if (REG_GET(dsi, DSI_VC_CTRL(vc), 20, 20) == 0) {
>  		DSSERR("RX fifo empty when trying to read.\n");
>  		r = -EIO;
>  		goto err;
>  	}
>  
> -	val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(channel));
> +	val = dsi_read_reg(dsi, DSI_VC_SHORT_PACKET_HEADER(vc));
>  	if (dsi->debug_read)
>  		DSSDBG("\theader: %08x\n", val);
>  	dt = FLD_GET(val, 5, 0);
> @@ -2852,7 +2853,7 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
>  		for (w = 0; w < len + 2;) {
>  			int b;
>  			val = dsi_read_reg(dsi,
> -				DSI_VC_SHORT_PACKET_HEADER(channel));
> +				DSI_VC_SHORT_PACKET_HEADER(vc));
>  			if (dsi->debug_read)
>  				DSSDBG("\t\t%02x %02x %02x %02x\n",
>  						(val >> 0) & 0xff,
> @@ -2876,32 +2877,31 @@ static int dsi_vc_read_rx_fifo(struct dsi_data *dsi, int channel, u8 *buf,
>  	}
>  
>  err:
> -	DSSERR("dsi_vc_read_rx_fifo(ch %d type %s) failed\n", channel,
> +	DSSERR("dsi_vc_read_rx_fifo(vc %d type %s) failed\n", vc,
>  		type == DSS_DSI_CONTENT_GENERIC ? "GENERIC" : "DCS");
>  
>  	return r;
>  }
>  
> -static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
> +static int dsi_vc_dcs_read(struct omap_dss_device *dssdev, int vc,
>  			   const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	u8 cmd = ((u8 *)msg->tx_buf)[0];
> -	u8 channel = msg->channel;
>  	int r;
>  
>  	if (dsi->debug_read)
> -		DSSDBG("%s(ch %d, cmd %x)\n", __func__, channel, cmd);
> +		DSSDBG("%s(ch %d, cmd %x)\n", __func__, vc, cmd);
>  
> -	r = dsi_vc_send_short(dsi, msg);
> +	r = dsi_vc_send_short(dsi, vc, msg);
>  	if (r)
>  		goto err;
>  
> -	r = dsi_vc_send_bta_sync(dssdev, channel);
> +	r = dsi_vc_send_bta_sync(dssdev, vc);
>  	if (r)
>  		goto err;
>  
> -	r = dsi_vc_read_rx_fifo(dsi, channel, msg->rx_buf, msg->rx_len,
> +	r = dsi_vc_read_rx_fifo(dsi, vc, msg->rx_buf, msg->rx_len,
>  		DSS_DSI_CONTENT_DCS);
>  	if (r < 0)
>  		goto err;
> @@ -2913,25 +2913,25 @@ static int dsi_vc_dcs_read(struct omap_dss_device *dssdev,
>  
>  	return 0;
>  err:
> -	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__,  msg->channel, cmd);
> +	DSSERR("%s(ch %d, cmd 0x%02x) failed\n", __func__,  vc, cmd);
>  	return r;
>  }
>  
> -static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
> +static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int vc,
>  			       const struct mipi_dsi_msg *msg)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
>  
> -	r = dsi_vc_send_short(dsi, msg);
> +	r = dsi_vc_send_short(dsi, vc, msg);
>  	if (r)
>  		goto err;
>  
> -	r = dsi_vc_send_bta_sync(dssdev, msg->channel);
> +	r = dsi_vc_send_bta_sync(dssdev, vc);
>  	if (r)
>  		goto err;
>  
> -	r = dsi_vc_read_rx_fifo(dsi, msg->channel, msg->rx_buf, msg->rx_len,
> +	r = dsi_vc_read_rx_fifo(dsi, vc, msg->rx_buf, msg->rx_len,
>  		DSS_DSI_CONTENT_GENERIC);
>  	if (r < 0)
>  		goto err;
> @@ -2943,7 +2943,7 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev,
>  
>  	return 0;
>  err:
> -	DSSERR("%s(ch %d, reqlen %d) failed\n", __func__,  msg->channel, msg->tx_len);
> +	DSSERR("%s(ch %d, reqlen %d) failed\n", __func__,  vc, msg->tx_len);
>  	return r;
>  }
>  
> @@ -3631,7 +3631,7 @@ static int dsi_configure_pins(struct dsi_data *dsi,
>  	return 0;
>  }
>  
> -static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
> +static void dsi_enable_video_output(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
> @@ -3665,17 +3665,17 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>  		}
>  
>  		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, channel, false);
> +		dsi_vc_enable(dsi, vc, false);
>  
>  		/* MODE, 1 = video mode */
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), 1, 4, 4);
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 1, 4, 4);
>  
>  		word_count = DIV_ROUND_UP(dsi->vm.hactive * bpp, 8);
>  
> -		dsi_vc_write_long_header(dsi, channel, data_type,
> +		dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, data_type,
>  				word_count, 0);
>  
> -		dsi_vc_enable(dsi, channel, true);
> +		dsi_vc_enable(dsi, vc, true);
>  		dsi_if_enable(dsi, true);
>  	}
>  
> @@ -3688,7 +3688,7 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>  err_mgr_enable:
>  	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
>  		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, channel, false);
> +		dsi_vc_enable(dsi, vc, false);
>  	}
>  err_pix_fmt:
>  	dsi_display_uninit_dispc(dsi);
> @@ -3696,18 +3696,18 @@ static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>  	return;
>  }
>  
> -static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel)
> +static void dsi_disable_video_output(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  
>  	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
>  		dsi_if_enable(dsi, false);
> -		dsi_vc_enable(dsi, channel, false);
> +		dsi_vc_enable(dsi, vc, false);
>  
>  		/* MODE, 0 = command mode */
> -		REG_FLD_MOD(dsi, DSI_VC_CTRL(channel), 0, 4, 4);
> +		REG_FLD_MOD(dsi, DSI_VC_CTRL(vc), 0, 4, 4);
>  
> -		dsi_vc_enable(dsi, channel, true);
> +		dsi_vc_enable(dsi, vc, true);
>  		dsi_if_enable(dsi, true);
>  	}
>  
> @@ -3740,14 +3740,14 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
>  	unsigned int packet_len;
>  	u32 l;
>  	int r;
> -	const unsigned channel = dsi->update_channel;
> +	const unsigned vc = dsi->update_vc;
>  	const unsigned int line_buf_size = dsi->line_buffer_size;
>  	u16 w = dsi->vm.hactive;
>  	u16 h = dsi->vm.vactive;
>  
>  	DSSDBG("dsi_update_screen_dispc(%dx%d)\n", w, h);
>  
> -	dsi_vc_config_source(dsi, channel, DSI_VC_SOURCE_VP);
> +	dsi_vc_config_source(dsi, vc, DSI_VC_SOURCE_VP);
>  
>  	bytespp	= mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt) / 8;
>  	bytespl = w * bytespp;
> @@ -3768,16 +3768,16 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
>  		total_len += (bytespf % packet_payload) + 1;
>  
>  	l = FLD_VAL(total_len, 23, 0); /* TE_SIZE */
> -	dsi_write_reg(dsi, DSI_VC_TE(channel), l);
> +	dsi_write_reg(dsi, DSI_VC_TE(vc), l);
>  
> -	dsi_vc_write_long_header(dsi, channel, MIPI_DSI_DCS_LONG_WRITE,
> +	dsi_vc_write_long_header(dsi, vc, dsi->dsidev->channel, MIPI_DSI_DCS_LONG_WRITE,
>  		packet_len, 0);
>  
>  	if (dsi->te_enabled)
>  		l = FLD_MOD(l, 1, 30, 30); /* TE_EN */
>  	else
>  		l = FLD_MOD(l, 1, 31, 31); /* TE_START */
> -	dsi_write_reg(dsi, DSI_VC_TE(channel), l);
> +	dsi_write_reg(dsi, DSI_VC_TE(vc), l);
>  
>  	/* We put SIDLEMODE to no-idle for the duration of the transfer,
>  	 * because DSS interrupts are not capable of waking up the CPU and the
> @@ -3800,7 +3800,7 @@ static void dsi_update_screen_dispc(struct dsi_data *dsi)
>  		 * for TE is longer than the timer allows */
>  		REG_FLD_MOD(dsi, DSI_TIMING2, 0, 15, 15); /* LP_RX_TO */
>  
> -		dsi_vc_send_bta(dsi, channel);
> +		dsi_vc_send_bta(dsi, vc);
>  
>  #ifdef DSI_CATCH_MISSING_TE
>  		mod_timer(&dsi->te_timer, jiffies + msecs_to_jiffies(250));
> @@ -3882,7 +3882,7 @@ static int _dsi_update(struct dsi_data *dsi)
>  	return 0;
>  }
>  
> -static int _dsi_send_nop(struct dsi_data *dsi, int channel)
> +static int _dsi_send_nop(struct dsi_data *dsi, int vc, int channel)
>  {
>  	const u8 payload[] = { MIPI_DCS_NOP };
>  	const struct mipi_dsi_msg msg = {
> @@ -3894,10 +3894,10 @@ static int _dsi_send_nop(struct dsi_data *dsi, int channel)
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  
> -	return _omap_dsi_host_transfer(dsi, &msg);
> +	return _omap_dsi_host_transfer(dsi, vc, &msg);
>  }
>  
> -static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
> +static int dsi_update_channel(struct omap_dss_device *dssdev, int vc)
>  {
>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>  	int r;
> @@ -3914,17 +3914,17 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>  		goto err;
>  	}
>  
> -	DSSDBG("dsi_update_channel: %d", channel);
> +	DSSDBG("dsi_update_channel: %d", vc);
>  
>  	dsi_set_ulps_auto(dsi, false);
>  
> -	r = _dsi_send_nop(dsi, channel);
> +	r = _dsi_send_nop(dsi, vc, dsi->dsidev->channel);
>  	if (r < 0) {
>  		DSSWARN("failed to send nop between frames: %d\n", r);
>  		goto err;
>  	}
>  
> -	dsi->update_channel = channel;
> +	dsi->update_vc = vc;
>  
>  	if (dsi->te_enabled && dsi->te_gpio) {
>  		schedule_delayed_work(&dsi->te_timeout_work,
> @@ -3973,10 +3973,10 @@ static int dsi_configure_dispc_clocks(struct dsi_data *dsi)
>  
>  static int dsi_display_init_dispc(struct dsi_data *dsi)
>  {
> -	enum omap_channel channel = dsi->output.dispc_channel;
> +	enum omap_channel dispc_channel = dsi->output.dispc_channel;
>  	int r;
>  
> -	dss_select_lcd_clk_source(dsi->dss, channel, dsi->module_id == 0 ?
> +	dss_select_lcd_clk_source(dsi->dss, dispc_channel, dsi->module_id == 0 ?
>  			DSS_CLK_SRC_PLL1_1 :
>  			DSS_CLK_SRC_PLL2_1);
>  
> @@ -4012,19 +4012,19 @@ static int dsi_display_init_dispc(struct dsi_data *dsi)
>  		dss_mgr_unregister_framedone_handler(&dsi->output,
>  				dsi_framedone_irq_callback, dsi);
>  err:
> -	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
> +	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
>  	return r;
>  }
>  
>  static void dsi_display_uninit_dispc(struct dsi_data *dsi)
>  {
> -	enum omap_channel channel = dsi->output.dispc_channel;
> +	enum omap_channel dispc_channel = dsi->output.dispc_channel;
>  
>  	if (dsi->mode == OMAP_DSS_DSI_CMD_MODE)
>  		dss_mgr_unregister_framedone_handler(&dsi->output,
>  				dsi_framedone_irq_callback, dsi);
>  
> -	dss_select_lcd_clk_source(dsi->dss, channel, DSS_CLK_SRC_FCK);
> +	dss_select_lcd_clk_source(dsi->dss, dispc_channel, DSS_CLK_SRC_FCK);
>  }
>  
>  static int dsi_configure_dsi_clocks(struct dsi_data *dsi)
> @@ -4841,12 +4841,12 @@ static int dsi_set_config(struct omap_dss_device *dssdev,
>  }
>  
>  /*
> - * Return a hardcoded channel for the DSI output. This should work for
> + * Return a hardcoded dispc channel for the DSI output. This should work for
>   * current use cases, but this can be later expanded to either resolve
>   * the channel in some more dynamic manner, or get the channel as a user
>   * parameter.
>   */
> -static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
> +static enum omap_channel dsi_get_dispc_channel(struct dsi_data *dsi)
>  {
>  	switch (dsi->data->model) {
>  	case DSI_MODEL_OMAP3:
> @@ -4880,14 +4880,14 @@ static enum omap_channel dsi_get_channel(struct dsi_data *dsi)
>  	}
>  }
>  
> -static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
> +static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi, int vc,
>  				       const struct mipi_dsi_msg *msg)
>  {
>  	struct omap_dss_device *dssdev = &dsi->output;
>  	int r;
>  
>  	if (!!(msg->flags & MIPI_DSI_MSG_USE_LPM) != dsi->in_lp_mode)
> -		dsi_vc_enable_hs(dssdev, msg->channel,
> +		dsi_vc_enable_hs(dssdev, vc,
>  				 !(msg->flags & MIPI_DSI_MSG_USE_LPM));
>  
>  	switch (msg->type) {
> @@ -4900,15 +4900,15 @@ static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
>  	case MIPI_DSI_DCS_LONG_WRITE:
>  	case MIPI_DSI_SET_MAXIMUM_RETURN_PACKET_SIZE:
>  	case MIPI_DSI_NULL_PACKET:
> -		r = dsi_vc_write_common(dssdev, msg);
> +		r = dsi_vc_write_common(dssdev, vc, msg);
>  		break;
>  	case MIPI_DSI_GENERIC_READ_REQUEST_0_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM:
>  	case MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM:
> -		r = dsi_vc_generic_read(dssdev, msg);
> +		r = dsi_vc_generic_read(dssdev, vc, msg);
>  		break;
>  	case MIPI_DSI_DCS_READ:
> -		r = dsi_vc_dcs_read(dssdev, msg);
> +		r = dsi_vc_dcs_read(dssdev, vc, msg);
>  		break;
>  	default:
>  		r = -EINVAL;
> @@ -4936,12 +4936,13 @@ static ssize_t omap_dsi_host_transfer(struct mipi_dsi_host *host,
>  {
>  	struct dsi_data *dsi = host_to_omap(host);
>  	int r;
> +	int vc = VC_DEFAULT;
>  
>  	dsi_bus_lock(dsi);
>  
>  	if (dsi->video_enabled) {
>  		dsi_set_ulps_auto(dsi, false);
> -		r = _omap_dsi_host_transfer(dsi, msg);
> +		r = _omap_dsi_host_transfer(dsi, vc, msg);
>  		dsi_set_ulps_auto(dsi, true);
>  	} else {
>  		r = -EIO;
> @@ -5398,7 +5399,7 @@ static int dsi_init_output(struct dsi_data *dsi)
>  
>  	out->type = OMAP_DISPLAY_TYPE_DSI;
>  	out->name = dsi->module_id == 0 ? "dsi.0" : "dsi.1";
> -	out->dispc_channel = dsi_get_channel(dsi);
> +	out->dispc_channel = dsi_get_dispc_channel(dsi);
>  	out->dsi_ops = &dsi_ops;
>  	out->of_port = 0;
>  	out->bus_flags = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
