Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995FC65B6B5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 19:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9504A10E370;
	Mon,  2 Jan 2023 18:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9FD110E370
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 18:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9VjhZi1lZp62p1i/a1yEP66fDtHh2k3BomIwh/pXJGI=;
 b=SMv0HwDsCyj9XHS8MtM3kucGvsb22zFB1Q8QQcqQ0Zp16egyfrY9GVWOvZ8JClg8df6lpq0RatuK5
 JXAh0JCrlCljskkca8BpIJ0mA4F1dGtf/LiAVIDcU5mFR646PWRs3L2LWZVpf4YVEcCR3AmZRQi8oF
 8ESJ6I+qCygJy1OPvF0WeXK1BqrO3qcnCILevkrRF0eoU1nF1N0HmGIpLu1xVkwGyHWxg8coavORGp
 /LR92qmty13nvbafLVfqMfKLKgFXElUuij5D/PQn4aBcYRbdo7CmdFouAEGg152keU54rhOhq5ZXai
 6q435+JFW4qD+WOdiQnJphrrDZN3cGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9VjhZi1lZp62p1i/a1yEP66fDtHh2k3BomIwh/pXJGI=;
 b=hNmcXMw3dimZxN4CESJnuumR299a1U9G/ykayuy4EV3SO5vxa9wqZfQeB23FOXchwHA9qP1/r2HNi
 GkxYhR+AA==
X-HalOne-ID: fd414098-8acd-11ed-81f3-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id fd414098-8acd-11ed-81f3-7703b0afff57;
 Mon, 02 Jan 2023 18:48:05 +0000 (UTC)
Date: Mon, 2 Jan 2023 19:48:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 09/14] drm/panel-samsung-s6e88a0-ams452ef01: Drop custom
 DSI write macro
Message-ID: <Y7Mm46iJnwJC2Dqr@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-10-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228014757.3170486-10-javierm@redhat.com>
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

On Wed, Dec 28, 2022 at 02:47:52AM +0100, Javier Martinez Canillas wrote:
> There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
> that instead and delete the custom DSI write macro defined in the driver.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  .../panel/panel-samsung-s6e88a0-ams452ef01.c  | 24 +++++++------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> index 97ff7a18545c..e94d88fed4f3 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams452ef01.c
> @@ -28,14 +28,6 @@ s6e88a0_ams452ef01 *to_s6e88a0_ams452ef01(struct drm_panel *panel)
>  	return container_of(panel, struct s6e88a0_ams452ef01, panel);
>  }
>  
> -#define dsi_dcs_write_seq(dsi, seq...) do {				\
> -		static const u8 d[] = { seq };				\
> -		int ret;						\
> -		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
> -		if (ret < 0)						\
> -			return ret;					\
> -	} while (0)
> -
>  static void s6e88a0_ams452ef01_reset(struct s6e88a0_ams452ef01 *ctx)
>  {
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
> @@ -54,8 +46,8 @@ static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
>  
>  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>  
> -	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
> -	dsi_dcs_write_seq(dsi, 0xcc, 0x4c); // set Pixel Clock Divider polarity
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a); // enable LEVEL2 commands
> +	mipi_dsi_dcs_write_seq(dsi, 0xcc, 0x4c); // set Pixel Clock Divider polarity
>  
>  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>  	if (ret < 0) {
> @@ -65,7 +57,7 @@ static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
>  	msleep(120);
>  
>  	// set default brightness/gama
> -	dsi_dcs_write_seq(dsi, 0xca,
> +	mipi_dsi_dcs_write_seq(dsi, 0xca,
>  			  0x01, 0x00, 0x01, 0x00, 0x01, 0x00,	// V255 RR,GG,BB
>  			  0x80, 0x80, 0x80,			// V203 R,G,B
>  			  0x80, 0x80, 0x80,			// V151 R,G,B
> @@ -77,11 +69,11 @@ static int s6e88a0_ams452ef01_on(struct s6e88a0_ams452ef01 *ctx)
>  			  0x6b, 0x68, 0x71,			// V3   R,G,B
>  			  0x00, 0x00, 0x00);			// V1   R,G,B
Fix indent - with this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  	// set default Amoled Off Ratio
> -	dsi_dcs_write_seq(dsi, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a);
> -	dsi_dcs_write_seq(dsi, 0xb6, 0x2c, 0x0b); // set default elvss voltage
> -	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> -	dsi_dcs_write_seq(dsi, 0xf7, 0x03); // gamma/aor update
> -	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
> +	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x40, 0x0a, 0x17, 0x00, 0x0a);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x2c, 0x0b); // set default elvss voltage
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x03); // gamma/aor update
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5); // disable LEVEL2 commands
>  
>  	ret = mipi_dsi_dcs_set_display_on(dsi);
>  	if (ret < 0) {
> -- 
> 2.38.1
