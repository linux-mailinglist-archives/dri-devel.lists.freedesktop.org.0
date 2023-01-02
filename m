Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6CC65B6A6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 19:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C9310E1D6;
	Mon,  2 Jan 2023 18:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [46.30.211.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29C10E1D6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Jqdntt21bL7Yjq26W0YUxIQULOrcTsSva3Xle99cHtY=;
 b=ski8yGOkKzHAX6Gs2Xwez3f5FQT7X+yMioJlOE7wG5gL7byH4Q6Gvutj+bjx+H1C/3Y9rdZs0NiBt
 pnem6E5Ojxlkv/YAg0tXJQv/TlGr7e0gh4lqJ4Akgst7O4HeGqxeY187qRnevpGhXcgfQtazW78yJc
 GMV860cVTAIeEHMwIPiqUDykvNGrV0bdOnXuNLsbWASfnpk3d6ozJGs2aljoQBR8cnw416DhGLlPsQ
 JDjLFiKUeTCCrcMnuiuKic/6VkjoGyq+ulHFzy64BV10fngJpDCiBmNEikad9q+8sipdq3Oz0LN4xj
 cCeMIs9VC7c8jLub8i8dF7Dfekf6aJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Jqdntt21bL7Yjq26W0YUxIQULOrcTsSva3Xle99cHtY=;
 b=lASuBO6+/smpGM7ICJFExO21ghrG8C1HUFNKGC4lvC6V7RPlN46WPOmYHHDhOicIwSZbhK0NM7Hg/
 eqyForeCA==
X-HalOne-ID: bef84d81-8acc-11ed-b424-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id bef84d81-8acc-11ed-b424-ede074c87fad;
 Mon, 02 Jan 2023 18:39:11 +0000 (UTC)
Date: Mon, 2 Jan 2023 19:39:10 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 01/14] drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
Message-ID: <Y7MkzucDEdsYenqX@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228014757.3170486-2-javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier.

On Wed, Dec 28, 2022 at 02:47:44AM +0100, Javier Martinez Canillas wrote:
> Many panel drivers define dsi_dcs_write_seq() and dsi_generic_write_seq()
> macros to send DCS commands and generic write packets respectively, with
> the payload specified as a list of parameters instead of using arrays.
> 
> There's already a macro for the former, introduced by commit 2a9e9daf75231
> ("drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro") so drivers can be
> changed to use that. But there isn't one yet for the latter, let's add it.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  include/drm/drm_mipi_dsi.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 20b21b577dea..c7c458131ba1 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -297,6 +297,22 @@ int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
>  int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
>  					u16 *brightness);
>  
> +/**
> + * mipi_dsi_generic_write - transmit data using a generic write packet
s/mipi_dsi_generic_write/mipi_dsi_generic_write_seq
(As the bot also reported)

with this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> + * @dsi: DSI peripheral device
> + * @seq: buffer containing the payload
> + */
> +#define mipi_dsi_generic_write_seq(dsi, seq...) do {				\
> +		static const u8 d[] = { seq };					\
> +		struct device *dev = &dsi->dev;	\
> +		int ret;						\
> +		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
> +		if (ret < 0) {						\
> +			dev_err_ratelimited(dev, "transmit data failed: %d\n", ret); \
> +			return ret;						\
> +		}						\
> +	} while (0)
> +
(If you align '\' under each other it would be nicer, but I could see
that mipi_dsi_dcs_write_seq() do not do so).
>  /**
>   * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
>   * @dsi: DSI peripheral device
> -- 
> 2.38.1
