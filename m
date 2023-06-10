Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D44F72AED9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 22:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D1910E023;
	Sat, 10 Jun 2023 20:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89C410E023
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2wtl7K8F8djbFifkPNwlrteB6Gg+wwqZT2UjebjY8/E=;
 b=bsLUIDdBSmxKFll4tzHGlusksKstjq1cOjziqOf0kRyYqCpA89lx4/2KaPsEvCKZq2ntsuznafWuR
 41qQQbI76vMVshtfUg4W+GD/TUY2aBa67FwK+BJuQ6KgCCJQN4v2oA0g2SdyfjDUR0SjzSuCRA6pKE
 KazFz/GquNcGerxnJzKRZvfWMjyrYM0jPondnzuvuUAl2LGkscxsBKscDk0Ru6cHiHovfmlQH8XRwW
 popbc6LgZIl98pGR7L/7t2Zdaqxvxgoe26Hr3p6kgopJDQIgpPaEAuwubiMZrtPa1MarsS1V7KOneu
 L6TQ2OHQ5jsvlUURNKN1P+0yvOyQL0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2wtl7K8F8djbFifkPNwlrteB6Gg+wwqZT2UjebjY8/E=;
 b=JO61/FRMPr+m0l+k2DGa/arRRfAxid/Ctl9H+UQHBh+UacvjDlVFEyYkRM1SVfqpslZMRj4cQSCwq
 W3g1avpBQ==
X-HalOne-ID: b91d737d-07cf-11ee-a88b-13111ccb208d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id b91d737d-07cf-11ee-a88b-13111ccb208d;
 Sat, 10 Jun 2023 20:45:27 +0000 (UTC)
Date: Sat, 10 Jun 2023 22:45:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 7/7] drm/panel: sitronix-st7789v: Check display ID
Message-ID: <20230610204525.GA1042549@ravnborg.org>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609145951.853533-8-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel,

On Fri, Jun 09, 2023 at 04:59:51PM +0200, Miquel Raynal wrote:
> A very basic debugging rule when a device is connected for the first
> time is to access a read-only register which contains known data in
> order to ensure the communication protocol is properly working. This
> driver lacked any read helper which is often a critical peace for
> fastening bring-ups.
> 
> Add a read helper and use it to verify the communication with the panel
> is working as soon as possible in order to fail early if this is not the
> case.

The read helper seems like a log of general boiler plate code.
I briefly looked into the use of regmap for the spi communication,
but it did not look like it supported the bit9 stuff.

I did not stare enough to add a reviewd by, but the approach is fine
and it is good to detech issues early.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index 7de192a3a8aa..fb21d52a7a63 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -113,6 +113,9 @@
>  			return val;		\
>  	} while (0)
>  
> +#define ST7789V_IDS { 0x85, 0x85, 0x52 }
> +#define ST7789V_IDS_SIZE 3
> +
>  struct st7789v_panel_info {
>  	const struct drm_display_mode *display_mode;
>  	u16 width_mm;
> @@ -165,6 +168,77 @@ static int st7789v_write_data(struct st7789v *ctx, u8 cmd)
>  	return st7789v_spi_write(ctx, ST7789V_DATA, cmd);
>  }
>  
> +static int st7789v_read_data(struct st7789v *ctx, u8 cmd, u8 *buf,
> +			     unsigned int len)
> +{
> +	struct spi_transfer xfer[2] = { };
> +	struct spi_message msg;
> +	u16 txbuf = ((ST7789V_COMMAND & 1) << 8) | cmd;
> +	u16 rxbuf[4] = {};
> +	u8 bit9 = 0;
> +	int ret, i;
> +
> +	switch (len) {
> +	case 1:
> +	case 3:
> +	case 4:
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	spi_message_init(&msg);
> +
> +	xfer[0].tx_buf = &txbuf;
> +	xfer[0].len = sizeof(txbuf);
> +	spi_message_add_tail(&xfer[0], &msg);
> +
> +	xfer[1].rx_buf = rxbuf;
> +	xfer[1].len = len * 2;
> +	spi_message_add_tail(&xfer[1], &msg);
> +
> +	ret = spi_sync(ctx->spi, &msg);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < len; i++) {
> +		buf[i] = rxbuf[i] >> i | (bit9 << (9 - i));
> +		if (i)
> +			bit9 = rxbuf[i] & GENMASK(i - 1, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int st7789v_check_id(struct drm_panel *panel)
> +{
> +	const u8 st7789v_ids[ST7789V_IDS_SIZE] = ST7789V_IDS;
> +	struct st7789v *ctx = panel_to_st7789v(panel);
> +	bool invalid_ids = false;
> +	int ret, i;
> +	u8 ids[3];
> +
> +	ret = st7789v_read_data(ctx, MIPI_DCS_GET_DISPLAY_ID, ids, ST7789V_IDS_SIZE);
> +	if (ret) {
> +		dev_err(panel->dev, "Failed to read IDs\n");
> +		return ret;
> +	}
> +
> +	for (i = 0; i < ST7789V_IDS_SIZE; i++) {
> +		if (ids[i] != st7789v_ids[i]) {
> +			invalid_ids = true;
> +			break;
> +		}
> +	}
> +
> +	if (invalid_ids) {
> +		dev_err(panel->dev, "Unrecognized panel IDs");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct drm_display_mode default_mode = {
>  	.clock = 7000,
>  	.hdisplay = 240,
> @@ -237,6 +311,10 @@ static int st7789v_prepare(struct drm_panel *panel)
>  	gpiod_set_value(ctx->reset, 0);
>  	msleep(120);
>  
> +	ret = st7789v_check_id(panel);
> +	if (ret)
> +		return ret;
> +
>  	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_EXIT_SLEEP_MODE));
>  
>  	/* We need to wait 120ms after a sleep out command */
> -- 
> 2.34.1
