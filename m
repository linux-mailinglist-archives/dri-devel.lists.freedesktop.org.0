Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE2FB22AB4
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 16:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74F310E339;
	Tue, 12 Aug 2025 14:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lf5gqM5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4809D10E339
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 14:36:41 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6972F4A4;
 Tue, 12 Aug 2025 16:35:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1755009347;
 bh=9kPKJxDxF4FeVkznZ+rTY+RlNqCAymjOiZ81dLkk1Vc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lf5gqM5bDlZGsjshlBXndrbFnSRg3LwCVMQgbt+Nbdzh9m2X3sEwvz6UeOBzGRcHX
 3CRtn0HLzCb9K+pBLF9yl3bkJhDE4PA8tt+zDCiuTpVLIOycT+WHKA+EXqTavcb9LS
 FUmylUe6DiKgsUVcU3jRUGzhj0iY+7ZlYbZD6jXs=
Message-ID: <4d0f2b7c-d44c-4dc2-9996-3cbbf3bf68b0@ideasonboard.com>
Date: Tue, 12 Aug 2025 17:36:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/rcar-du: dsi: Implement DSI command support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-5-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250608142636.54033-5-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 08/06/2025 17:24, Marek Vasut wrote:
> Implement support for DSI command transfer mode. Transmission of both Short

I constantly kept reading "DSI command mode support". So I was quite
confused for a bit =). Maybe avoid the use of "mode" with "DSI command".

> Packet and Long Packet is implemented, so is command transmission to request
> response from peripheral device and transmission of non-read command with BTA.
> 
> The AXI memory access mode is currently not implemented, each transfer is
> performed purely using controller register interface. Short Packet transfer
> can transfer up to 2 Bytes of data, Long Packet transfer can transfer up to
> 16 Bytes of data.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 215 ++++++++++++++++++
>  .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 125 ++++++++++
>  2 files changed, 340 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index c31e0d8f3ff9..bc1151c3ce90 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -938,9 +938,224 @@ static int rcar_mipi_dsi_host_detach(struct mipi_dsi_host *host,
>  	return 0;
>  }
>  
> +static ssize_t rcar_mipi_dsi_host_tx_transfer(struct mipi_dsi_host *host,
> +					      const struct mipi_dsi_msg *msg,
> +					      bool is_rx_xfer)
> +{
> +	const bool is_tx_long = mipi_dsi_packet_format_is_long(msg->type);
> +	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
> +	struct mipi_dsi_packet packet;
> +	u8 payload[16] = { 0 };
> +	u32 status;
> +	int ret;
> +
> +	ret = mipi_dsi_create_packet(&packet, msg);
> +	if (ret)
> +		return ret;
> +
> +	/* Configure LP or HS command transfer. */
> +	rcar_mipi_dsi_write(dsi, TXCMSETR, (msg->flags & MIPI_DSI_MSG_USE_LPM) ?
> +					   TXCMSETR_SPDTYP : 0);

There's no runtime PM in the driver, and the clocks are enabled
externally... So I think we just assume that the IP is running here?
It's not a few times (on other platforms) I've hit an issue with
dsi_host tx being called when the video output is not yet enabled, and
thus the whole IP is off. So, maybe this works, but just a note.

> +	/* Register access mode for RX transfer. */
> +	if (is_rx_xfer)
> +		rcar_mipi_dsi_write(dsi, RXPSETR, 0);
> +
> +	/* Do not use IRQ, poll for completion, the completion is quick. */
> +	rcar_mipi_dsi_write(dsi, TXCMIER, 0);
> +
> +	/*
> +	 * Send the header:
> +	 * header[0] = Virtual Channel + Data Type
> +	 * header[1] = Word Count LSB (LP) or first param (SP)
> +	 * header[2] = Word Count MSB (LP) or second param (SP)
> +	 */
> +	rcar_mipi_dsi_write(dsi, TXCMPHDR,
> +			    (is_tx_long ? TXCMPHDR_FMT : 0) |
> +			    TXCMPHDR_VC(msg->channel) |
> +			    TXCMPHDR_DT(msg->type) |
> +			    TXCMPHDR_DATA1(packet.header[2]) |
> +			    TXCMPHDR_DATA0(packet.header[1]));
> +
> +	if (is_tx_long) {
> +		memcpy(payload, packet.payload,
> +		       min(msg->tx_len, sizeof(payload)));
> +
> +		rcar_mipi_dsi_write(dsi, TXCMPPD0R,
> +				    (payload[3] << 24) | (payload[2] << 16) |
> +				    (payload[1] << 8) | payload[0]);
> +		rcar_mipi_dsi_write(dsi, TXCMPPD1R,
> +				    (payload[7] << 24) | (payload[6] << 16) |
> +				    (payload[5] << 8) | payload[4]);
> +		rcar_mipi_dsi_write(dsi, TXCMPPD2R,
> +				    (payload[11] << 24) | (payload[10] << 16) |
> +				    (payload[9] << 8) | payload[8]);
> +		rcar_mipi_dsi_write(dsi, TXCMPPD3R,
> +				    (payload[15] << 24) | (payload[14] << 16) |
> +				    (payload[13] << 8) | payload[12]);
> +	}
> +
> +	/* Start the transfer, RX with BTA, TX without BTA */
> +	if (is_rx_xfer) {
> +		rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_BTAREQ);
> +
> +		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +					(status & RXPSR_BTAREQEND),
> +					2000, 10000, false, dsi, RXPSR);
> +	} else {
> +		rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_TXREQ);
> +
> +		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +					(status & TXCMSR_TXREQEND),
> +					2000, 10000, false, dsi, TXCMSR);
> +	}

Did you check the timeout is big enough? With LP and BTA... Well, it's
only 16 bytes at max. Maybe it's fine. Again, just a note. =)

Does this work when the video stream is on? If yes, then it might take
much longer until the command can be transferred. If not maybe the
function should return an error if the video stream is enabled.

What do these read_poll_timeouts wait, exactly? The first one waits
until the data is sent, and BTA has been done? And the latter waits only
for the data to be sent? Hmm, no... The first must wait until the
peripheral has replied, as there's no wait in the
rcar_mipi_dsi_host_rx_transfer()...

It would be nice to have a short comment what the wait is for.

> +
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "Command transfer timeout (0x%08x)\n",
> +			status);
> +		return ret;
> +	}
> +
> +	return packet.size;
> +}
> +
> +static ssize_t rcar_mipi_dsi_host_rx_transfer(struct mipi_dsi_host *host,
> +					      const struct mipi_dsi_msg *msg)
> +{
> +	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
> +	u8 *rx_buf = (u8 *)(msg->rx_buf);
> +	u32 reg, data, status, wc;
> +	int i, ret;
> +
> +	/* RX transfer received data validation and parsing starts here. */
> +	reg = rcar_mipi_dsi_read(dsi, TOSR);
> +	if (reg & TOSR_TATO) {	/* Turn-Around TimeOut. */
> +		/* Clear TATO Turn-Around TimeOut bit. */
> +		rcar_mipi_dsi_write(dsi, TOSR, TOSR_TATO);
> +		return -ETIMEDOUT;
> +	}
> +
> +	reg = rcar_mipi_dsi_read(dsi, RXPSR);
> +
> +	if (msg->flags & MIPI_DSI_MSG_REQ_ACK) {
> +		/* Transfer with zero-length RX */
> +		if (!(reg & RXPSR_RCVACK)) {
> +			/* No ACK on RX response received */
> +			return -EINVAL;
> +		}
> +	} else {
> +		/* Transfer with non-zero-length RX */
> +		if (!(reg & RXPSR_RCVRESP)) {
> +			/* No packet header of RX response received */
> +			return -EINVAL;
> +		}
> +
> +		if (reg & (RXPSR_CRCERR | RXPSR_WCERR | RXPSR_AXIERR | RXPSR_OVRERR)) {
> +			/* Incorrect response payload */
> +			return -ENODATA;
> +		}
> +
> +		data = rcar_mipi_dsi_read(dsi, RXPHDR);
> +		if (data & RXPHDR_FMT) {	/* Long Packet Response */
> +			/* Read Long Packet Response length from packet header. */
> +			wc = data & 0xffff;
> +			if (wc > msg->rx_len) {
> +				dev_warn(dsi->dev,
> +					 "Long Packet Response longer than RX buffer (%d), limited to %ld Bytes\n",
> +					 wc, msg->rx_len);
> +				wc = msg->rx_len;
> +			}
> +
> +			if (wc > 16) {
> +				dev_warn(dsi->dev,
> +					 "Long Packet Response too long (%d), limited to 16 Bytes\n",
> +					 wc);
> +				wc = 16;
> +			}
> +
> +			for (i = 0; i < msg->rx_len; i++) {
> +				if (!(i % 4))
> +					data = rcar_mipi_dsi_read(dsi, RXPPD0R + i);
> +
> +				rx_buf[i] = data & 0xff;
> +				data >>= 8;
> +			}
> +		} else {	/* Short Packet Response */
> +			if (msg->rx_len >= 1)
> +				rx_buf[0] = data & 0xff;
> +			if (msg->rx_len >= 2)
> +				rx_buf[1] = (data >> 8) & 0xff;
> +			if (msg->rx_len >= 3) {
> +				dev_warn(dsi->dev,
> +					 "Expected Short Packet Response too long (%ld), limited to 2 Bytes\n",
> +					 msg->rx_len);
> +			}
> +		}
> +	}
> +
> +	if (reg & RXPSR_RCVAKE) {
> +		/* Acknowledge and Error report received */
> +		return -EFAULT;
> +	}
> +
> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +				!(status & PPIDL0SR_DIR),
> +				2000, 10000, false, dsi, PPIDL0SR);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "Command RX DIR timeout (0x%08x)\n", status);
> +		return ret;
> +	}
> +
> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
> +				status & PPIDL0SR_STPST,
> +				2000, 10000, false, dsi, PPIDL0SR);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "Command RX STPST timeout (0x%08x)\n", status);
> +		return ret;
> +	}

Same here, it's not very clear what the waits are for. Aren't we done
already after the tx function finished?

> +
> +	return 0;
> +}
> +
> +static ssize_t rcar_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
> +					   const struct mipi_dsi_msg *msg)
> +{
> +	const bool is_rx_xfer = (msg->flags & MIPI_DSI_MSG_REQ_ACK) || msg->rx_len;
> +	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
> +	int ret;
> +
> +	if (msg->tx_len > 16 || msg->rx_len > 16) {
> +		/* ToDo: Implement Memory on AXI bus command mode. */
> +		dev_warn(dsi->dev,
> +			 "Register-based command mode supports only up to 16 Bytes long payload\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	ret = rcar_mipi_dsi_host_tx_transfer(host, msg, is_rx_xfer);
> +
> +	/* If TX transfer succeeded and this transfer has RX part. */
> +	if (ret >= 0 && is_rx_xfer) {
> +		ret = rcar_mipi_dsi_host_rx_transfer(host, msg);
> +		if (ret)
> +			return ret;
> +
> +		ret = msg->rx_len;
> +	}
> +
> +	/* Wait a bit between commands */
> +	usleep_range(1000, 2000);

Why wait and wait a bit between what?

 Tomi

