Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FD7678783
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 21:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B803810E558;
	Mon, 23 Jan 2023 20:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 127200 seconds by postgrey-1.36 at gabe;
 Mon, 23 Jan 2023 20:19:45 UTC
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C968510E558
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 20:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=SqWuVyvVY+npo4rlCxIsex0r7WCYtZp2jn0AumxPuBc=;
 b=jXsOdRhIactOc2anD+VOMx7w67UlBatZ8N5duwzIsx269KUJzwo4my9Cz2+6pRXlyYr2GZwoP/yjd
 FRQbthdsn/r6LGPngHakSkHB+rUmbLVxBY6RzywTb4NuEf4NaZNAwXHKGjsd36vs4e7RIDifi9Q79p
 j+l07I1JKfMbhaOBGNqJFGEY/tHp0WY9WE8aP1URu6lZkyNEZljIjtiwWOrEhI8JGGN/muktrfHGtj
 JHhILfvETapYKZq6lu2QZTEs/BVGiNlEW+X/6iNGQW0IfoO2hctxlAr4mZ0IdcIf9+KZsAjDi6T4SQ
 R6NKkhWArT/ppGAhBZd1+hMpbvtdYsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=SqWuVyvVY+npo4rlCxIsex0r7WCYtZp2jn0AumxPuBc=;
 b=v9ksV9BdJWBFgFbnpo0rB6g9Iz3oBJewhUgzGPb1u57ZYFADhKzlKBV5FbrMdpv1BNj7OH1M6dhz9
 a82fYrGDQ==
X-HalOne-ID: 44648566-9b5b-11ed-a883-11abd97b9443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 44648566-9b5b-11ed-a883-11abd97b9443;
 Mon, 23 Jan 2023 20:19:43 +0000 (UTC)
Date: Mon, 23 Jan 2023 21:19:42 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@edgeble.ai>
Subject: Re: [PATCH 1/2] drm: bridge: dw-mipi-dsi: Handle NO_EOT_PACKET mode
Message-ID: <Y87r3jgRPceNBLdl@ravnborg.org>
References: <20230123184647.437965-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123184647.437965-1-jagan@edgeble.ai>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan.

One small drive-by comment.

On Tue, Jan 24, 2023 at 12:16:46AM +0530, Jagan Teki wrote:
> Many downstream bridges or panels followed by dw-mipi-dsi were
> using MIPI_DSI_MODE_NO_EOT_PACKET.
> 
> So, handle the EOTP bits accordingly in the dw-mipi-dsi host.
> 
> Signed-off-by: Jagan Teki <jagan@edgeble.ai>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index b2efecf7d160..47bd69d5ac99 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -664,7 +664,13 @@ static void dw_mipi_dsi_dpi_config(struct dw_mipi_dsi *dsi,
>  
>  static void dw_mipi_dsi_packet_handler_config(struct dw_mipi_dsi *dsi)
>  {
> -	dsi_write(dsi, DSI_PCKHDL_CFG, CRC_RX_EN | ECC_RX_EN | BTA_EN);
> +	u32 val;
> +
> +	val = CRC_RX_EN | ECC_RX_EN | BTA_EN | EOTP_TX_EN;
> +	if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
> +		val &= ~EOTP_TX_EN;

I had to look twice because the bit is set, and then maybe cleared.

	val = CRC_RX_EN | ECC_RX_EN | BTA_EN | EOTP_TX_EN;
	if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
		val |= EOTP_TX_EN;
?

	Sam
