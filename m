Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E35B295B3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 01:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3F010E027;
	Sun, 17 Aug 2025 23:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Vzdsu0ZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3AA10E027
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 23:40:35 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4c4sm00yFwz9ssp;
 Mon, 18 Aug 2025 01:40:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1755474032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iom/s0i6tr0/92vmhPUqTJIIJ8P+iWsTF1Y4mPkXmwQ=;
 b=Vzdsu0ZDLo9plCMFt9kgOARqY07HOcb6JXLm5QXrsukm44CfABJ3rQhEFXNe8iGAbiruHu
 UIusmHEhjIh5/zAKmCSJolctaT1gc+VXIUD6NCxUTNRWAU3bEnN43CtUD5baYle68AUi4r
 qz7a/2Q0kE8vcjWw0uHb6b++EMIitEX72fatcudPbyn+gDBTT5epKx4J4mbt39ZDRaWU6U
 LOHnWVhqouqP8IVvbLKv7WtX+lsmVx2uuwkIA+O9cOotAU8dfmLNfhv5jZFELD2iOIpGF8
 CYAt1F+BYobNVclev5LgXldMezcdye5hc3CbR0RdWoeTkODkBUfs+Do2W1SGOA==
Message-ID: <ac748c7e-d367-4569-9d9a-ac424c813f14@mailbox.org>
Date: Mon, 18 Aug 2025 01:40:29 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] drm/rcar-du: dsi: Implement DSI command support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
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
 <4d0f2b7c-d44c-4dc2-9996-3cbbf3bf68b0@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <4d0f2b7c-d44c-4dc2-9996-3cbbf3bf68b0@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: b793aff83432e4191f5
X-MBO-RS-META: 3dq94wkm8et7hsoyfjxez8o8uhuknn4u
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

On 8/12/25 4:36 PM, Tomi Valkeinen wrote:

Hello Tomi,

> On 08/06/2025 17:24, Marek Vasut wrote:
>> Implement support for DSI command transfer mode. Transmission of both Short
> 
> I constantly kept reading "DSI command mode support". So I was quite
> confused for a bit =). Maybe avoid the use of "mode" with "DSI command".

I dropped the "mode" in V3.

[...]

>> +static ssize_t rcar_mipi_dsi_host_tx_transfer(struct mipi_dsi_host *host,
>> +					      const struct mipi_dsi_msg *msg,
>> +					      bool is_rx_xfer)
>> +{
>> +	const bool is_tx_long = mipi_dsi_packet_format_is_long(msg->type);
>> +	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
>> +	struct mipi_dsi_packet packet;
>> +	u8 payload[16] = { 0 };
>> +	u32 status;
>> +	int ret;
>> +
>> +	ret = mipi_dsi_create_packet(&packet, msg);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Configure LP or HS command transfer. */
>> +	rcar_mipi_dsi_write(dsi, TXCMSETR, (msg->flags & MIPI_DSI_MSG_USE_LPM) ?
>> +					   TXCMSETR_SPDTYP : 0);
> 
> There's no runtime PM in the driver, and the clocks are enabled
> externally... So I think we just assume that the IP is running here?

Correct.

[...]

>> +	/* Start the transfer, RX with BTA, TX without BTA */
>> +	if (is_rx_xfer) {
>> +		rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_BTAREQ);
>> +
>> +		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>> +					(status & RXPSR_BTAREQEND),
>> +					2000, 10000, false, dsi, RXPSR);
>> +	} else {
>> +		rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_TXREQ);
>> +
>> +		ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>> +					(status & TXCMSR_TXREQEND),
>> +					2000, 10000, false, dsi, TXCMSR);
>> +	}
> 
> Did you check the timeout is big enough? With LP and BTA... Well, it's
> only 16 bytes at max. Maybe it's fine. Again, just a note. =)

I did check it with the only hardware I had available which needs this 
command mode so far, the RPi Display 2 using ILI9881 DSI-to-TCON .

> Does this work when the video stream is on?

That is untested, the ILI9881 only uses command mode during 
initialization, before it switches video mode on.

> If yes, then it might take
> much longer until the command can be transferred.

Do you know the upper limit , is that one or two frame times ?

> If not maybe the
> function should return an error if the video stream is enabled.

I haven't seen any drivers special casing that, I'd prefer to increase 
the timeouts. For V3, I'll update the timeout to 50ms , which is about 3 
frame times.

> What do these read_poll_timeouts wait, exactly? The first one waits
> until the data is sent, and BTA has been done? And the latter waits only
> for the data to be sent? Hmm, no... The first must wait until the
> peripheral has replied, as there's no wait in the
> rcar_mipi_dsi_host_rx_transfer()...

First one is transmit+BTA+receive , second one is only transmit .

> It would be nice to have a short comment what the wait is for.

Will do in V3.

[...]

>> +	ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>> +				status & PPIDL0SR_STPST,
>> +				2000, 10000, false, dsi, PPIDL0SR);
>> +	if (ret < 0) {
>> +		dev_err(dsi->dev, "Command RX STPST timeout (0x%08x)\n", status);
>> +		return ret;
>> +	}
> 
> Same here, it's not very clear what the waits are for. Aren't we done
> already after the tx function finished?

First one waits for bus handover to host processor to complete, the 
second one (STPST) waits for data lane to enter LP11 stop state .

>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t rcar_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
>> +					   const struct mipi_dsi_msg *msg)
>> +{
>> +	const bool is_rx_xfer = (msg->flags & MIPI_DSI_MSG_REQ_ACK) || msg->rx_len;
>> +	struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
>> +	int ret;
>> +
>> +	if (msg->tx_len > 16 || msg->rx_len > 16) {
>> +		/* ToDo: Implement Memory on AXI bus command mode. */
>> +		dev_warn(dsi->dev,
>> +			 "Register-based command mode supports only up to 16 Bytes long payload\n");
>> +		return -EOPNOTSUPP;
>> +	}
>> +
>> +	ret = rcar_mipi_dsi_host_tx_transfer(host, msg, is_rx_xfer);
>> +
>> +	/* If TX transfer succeeded and this transfer has RX part. */
>> +	if (ret >= 0 && is_rx_xfer) {
>> +		ret = rcar_mipi_dsi_host_rx_transfer(host, msg);
>> +		if (ret)
>> +			return ret;
>> +
>> +		ret = msg->rx_len;
>> +	}
>> +
>> +	/* Wait a bit between commands */
>> +	usleep_range(1000, 2000);
> 
> Why wait and wait a bit between what?
The consecutive command transmission was unreliable unless there was a 
slight delay between the consecutive commands. Hence this delay.
