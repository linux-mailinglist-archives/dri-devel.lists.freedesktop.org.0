Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD2B29AB7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 09:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC1010E1C6;
	Mon, 18 Aug 2025 07:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GWmi2VPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E965F10E1C6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 07:20:39 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF61D17D1;
 Mon, 18 Aug 2025 09:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1755501581;
 bh=HLqbYlHq1BDKJuJzXWkUG5LFVoomXfaqsUaJko0jS9E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GWmi2VPJB9OhptOJe2RqkG6GaYtlmP7/H8QkOzEriFc4ISaNoMft7sm3VW8pHVfYU
 cwkUHf+3gCwwGja7UbthFGp7J+/9L9Cg9Tmp1CSJKmtEXZgAgm6GdKhTWNIFfBmkFY
 88oogSCME1ezcJpVxQV6WfBdyZoNhl7UzY4YQiAs=
Message-ID: <3f0fc2a6-6e12-45ff-a153-71661ddd236d@ideasonboard.com>
Date: Mon, 18 Aug 2025 10:20:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/rcar-du: dsi: Implement DSI command support
To: Marek Vasut <marek.vasut@mailbox.org>, dri-devel@lists.freedesktop.org
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
 <ac748c7e-d367-4569-9d9a-ac424c813f14@mailbox.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <ac748c7e-d367-4569-9d9a-ac424c813f14@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 18/08/2025 02:40, Marek Vasut wrote:
> On 8/12/25 4:36 PM, Tomi Valkeinen wrote:
> 
> Hello Tomi,
> 
>> On 08/06/2025 17:24, Marek Vasut wrote:
>>> Implement support for DSI command transfer mode. Transmission of both
>>> Short
>>
>> I constantly kept reading "DSI command mode support". So I was quite
>> confused for a bit =). Maybe avoid the use of "mode" with "DSI command".
> 
> I dropped the "mode" in V3.
> 
> [...]
> 
>>> +static ssize_t rcar_mipi_dsi_host_tx_transfer(struct mipi_dsi_host
>>> *host,
>>> +                          const struct mipi_dsi_msg *msg,
>>> +                          bool is_rx_xfer)
>>> +{
>>> +    const bool is_tx_long = mipi_dsi_packet_format_is_long(msg->type);
>>> +    struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
>>> +    struct mipi_dsi_packet packet;
>>> +    u8 payload[16] = { 0 };
>>> +    u32 status;
>>> +    int ret;
>>> +
>>> +    ret = mipi_dsi_create_packet(&packet, msg);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* Configure LP or HS command transfer. */
>>> +    rcar_mipi_dsi_write(dsi, TXCMSETR, (msg->flags &
>>> MIPI_DSI_MSG_USE_LPM) ?
>>> +                       TXCMSETR_SPDTYP : 0);
>>
>> There's no runtime PM in the driver, and the clocks are enabled
>> externally... So I think we just assume that the IP is running here?
> 
> Correct.
> 
> [...]
> 
>>> +    /* Start the transfer, RX with BTA, TX without BTA */
>>> +    if (is_rx_xfer) {
>>> +        rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_BTAREQ);
>>> +
>>> +        ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>>> +                    (status & RXPSR_BTAREQEND),
>>> +                    2000, 10000, false, dsi, RXPSR);
>>> +    } else {
>>> +        rcar_mipi_dsi_write(dsi, TXCMCR, TXCMCR_TXREQ);
>>> +
>>> +        ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>>> +                    (status & TXCMSR_TXREQEND),
>>> +                    2000, 10000, false, dsi, TXCMSR);
>>> +    }
>>
>> Did you check the timeout is big enough? With LP and BTA... Well, it's
>> only 16 bytes at max. Maybe it's fine. Again, just a note. =)
> 
> I did check it with the only hardware I had available which needs this
> command mode so far, the RPi Display 2 using ILI9881 DSI-to-TCON .

Don't call it "command mode" ;).

>> Does this work when the video stream is on?
> 
> That is untested, the ILI9881 only uses command mode during
> initialization, before it switches video mode on.
> 
>> If yes, then it might take
>> much longer until the command can be transferred.
> 
> Do you know the upper limit , is that one or two frame times ?

If using DSI video mode and the stream is on, the DSI TX has to
interleave the commands either to the line blanking or frame blanking.
Usually this is configurable in the DSI TX (if the chip can do
interleaving).

A read command will be the most difficult to interleave, as it takes
more time with the BTA and reply.

I think the worst case is one frame delay (next vblank).

>> If not maybe the
>> function should return an error if the video stream is enabled.
> 
> I haven't seen any drivers special casing that, I'd prefer to increase
> the timeouts. For V3, I'll update the timeout to 50ms , which is about 3
> frame times.

If the docs have no word about interleaving the commands and there are
no related registers, I would guess that it's not supported. If this
can't be tested, I suggest just returning an error if a command is sent
while the video is on.

You should be able to test this, though. E.g. just add a debugfs/sysfs
file to the panel or dsi tx driver, which does a DSI command, possibly a
read. See what happens when the video is enabled.

>> What do these read_poll_timeouts wait, exactly? The first one waits
>> until the data is sent, and BTA has been done? And the latter waits only
>> for the data to be sent? Hmm, no... The first must wait until the
>> peripheral has replied, as there's no wait in the
>> rcar_mipi_dsi_host_rx_transfer()...
> 
> First one is transmit+BTA+receive , second one is only transmit .
> 
>> It would be nice to have a short comment what the wait is for.
> 
> Will do in V3.
> 
> [...]
> 
>>> +    ret = read_poll_timeout(rcar_mipi_dsi_read, status,
>>> +                status & PPIDL0SR_STPST,
>>> +                2000, 10000, false, dsi, PPIDL0SR);
>>> +    if (ret < 0) {
>>> +        dev_err(dsi->dev, "Command RX STPST timeout (0x%08x)\n",
>>> status);
>>> +        return ret;
>>> +    }
>>
>> Same here, it's not very clear what the waits are for. Aren't we done
>> already after the tx function finished?
> 
> First one waits for bus handover to host processor to complete, the
> second one (STPST) waits for data lane to enter LP11 stop state .
> 
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static ssize_t rcar_mipi_dsi_host_transfer(struct mipi_dsi_host *host,
>>> +                       const struct mipi_dsi_msg *msg)
>>> +{
>>> +    const bool is_rx_xfer = (msg->flags & MIPI_DSI_MSG_REQ_ACK) ||
>>> msg->rx_len;
>>> +    struct rcar_mipi_dsi *dsi = host_to_rcar_mipi_dsi(host);
>>> +    int ret;
>>> +
>>> +    if (msg->tx_len > 16 || msg->rx_len > 16) {
>>> +        /* ToDo: Implement Memory on AXI bus command mode. */
>>> +        dev_warn(dsi->dev,
>>> +             "Register-based command mode supports only up to 16
>>> Bytes long payload\n");
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +
>>> +    ret = rcar_mipi_dsi_host_tx_transfer(host, msg, is_rx_xfer);
>>> +
>>> +    /* If TX transfer succeeded and this transfer has RX part. */
>>> +    if (ret >= 0 && is_rx_xfer) {
>>> +        ret = rcar_mipi_dsi_host_rx_transfer(host, msg);
>>> +        if (ret)
>>> +            return ret;
>>> +
>>> +        ret = msg->rx_len;
>>> +    }
>>> +
>>> +    /* Wait a bit between commands */
>>> +    usleep_range(1000, 2000);
>>
>> Why wait and wait a bit between what?
> The consecutive command transmission was unreliable unless there was a
> slight delay between the consecutive commands. Hence this delay.

This sounds like there's a bug in the driver, or the TX or RX hardware.
Please document the sleep clearly in the comment.

 Tomi

