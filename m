Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037AB65B6C1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 19:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4ABC10E378;
	Mon,  2 Jan 2023 18:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 549 seconds by postgrey-1.36 at gabe;
 Mon, 02 Jan 2023 18:53:53 UTC
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8D610E378
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 18:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8VLVmTvVkuOSGpnmMwBbwKdLwYt0S8Bj/odKQ0a7OTw=;
 b=gNqFncLxK04Qe99dWBCKAN2ehYi/arfU4C3Kwqduv5G3/bdsHsDxJV0iY/b5bKFrPcMLN5m9os4nz
 acI6NI6wmOzt0UELEkEDnrWkd19KpunHrTMoCcuP6sn9I8f/UuvT0z/CxLwctSs+MOOoxPATIp1GA4
 TQnzoP5GmyKLI7nJ5+U+QTRxMWR1KabJc84+F2Pq+HMi8uRVoStNhNaPkMmlK/qvXJ5akMRz6YZOc7
 1mGDOUzg5V1MNiPHa462h8trZaYO70x3W+0I7+rcImRjcqruRyCwVMznxhHvNwUCylwgIapKvBUF6A
 EnAFbxGXWCjY46Enol4F1n3DE9x3xDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=8VLVmTvVkuOSGpnmMwBbwKdLwYt0S8Bj/odKQ0a7OTw=;
 b=mh2bj+SNKaVQCpfrCMpnt6ZTqb9MlCGgrSUlMHJmz5nyJspx9HcXell33z/wJzx7SZjfgvZKNMubR
 KVI/zqRDw==
X-HalOne-ID: cae89d77-8ace-11ed-91ab-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id cae89d77-8ace-11ed-91ab-cde5ad41a1dd;
 Mon, 02 Jan 2023 18:53:51 +0000 (UTC)
Date: Mon, 2 Jan 2023 19:53:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 14/14] drm/panel-xinpeng-xpp055c272: Drop custom DSI
 write macro
Message-ID: <Y7MoPm/7wLxSgiHF@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-15-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228014757.3170486-15-javierm@redhat.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier.

On Wed, Dec 28, 2022 at 02:47:57AM +0100, Javier Martinez Canillas wrote:
> There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
> that instead and delete the custom DSI write macro defined in the driver.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 44 ++++++++-----------
>  1 file changed, 18 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> index 2c54733ee241..230d87ba139a 100644
> --- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> +++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
> @@ -60,14 +60,6 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
>  	return container_of(panel, struct xpp055c272, panel);
>  }
>  
> -#define dsi_generic_write_seq(dsi, cmd, seq...) do {			\
> -		static const u8 b[] = { cmd, seq };			\
> -		int ret;						\
> -		ret = mipi_dsi_dcs_write_buffer(dsi, b, ARRAY_SIZE(b));	\
Notice that this is *dcs*

> -		if (ret < 0)						\
> -			return ret;					\
> -	} while (0)
> -
>  static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
>  {
>  	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> @@ -77,37 +69,37 @@ static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
>  	 * Init sequence was supplied by the panel vendor without much
>  	 * documentation.
>  	 */
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
This is wrong - here you should use mipi_dsi_dcs_write_seq()
Likewise for the rest of the file.

	Sam

> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETMIPI,
>  			      0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
>  			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
>  			      0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
>  			      0x00, 0x00, 0x37);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
>  			      0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
>  			      0x00, 0x00);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETSCR,
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETSCR,
>  			      0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
>  			      0x00);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEQ,
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETEQ,
>  			      0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
>  			      0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER,
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETPOWER,
>  			      0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
>  			      0x67, 0x77, 0x33, 0x33);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
>  			      0xff, 0x01, 0xff);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
>  	msleep(20);
>  
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP1,
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP1,
>  			      0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
>  			      0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
>  			      0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
> @@ -116,7 +108,7 @@ static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
>  			      0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
>  			      0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
>  			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP2,
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGIP2,
>  			      0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
>  			      0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
>  			      0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
> @@ -125,7 +117,7 @@ static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
>  			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>  			      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
>  			      0xa0, 0x00, 0x00, 0x00, 0x00);
> -	dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
> +	mipi_dsi_generic_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
>  			      0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
>  			      0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
>  			      0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
> -- 
> 2.38.1
