Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0F372B9AB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 10:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2946E10E1B3;
	Mon, 12 Jun 2023 08:04:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B645D10E1B3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9J4mBROHImWsNsaboPyzbhh6dhacjAV4g8jVZe8034k=;
 b=m2cIc/LM0ANI2ohn3Liq6PJxc8z7+5HDG+aykQc6rV5N1e8Z7+LDTSvqmdkIiqIhNIl1OcgLlp+vW
 ewqjGnAxft90BF1gFF4TGld0ExnT+w3btzf7+5akUzwssrB9uvQyJ7OeWoCU/KsE9cj5hsXuALQJtm
 IQi5nzze7t40seI6oRBdsmTH+P8xuSRpuJBa71oVzdCig+v6bBAZd+RDNCtN0ez+E+1bi8MXkzIlr1
 MXmsNQFHZklTYNlO9zqiybNWjxDD7HhGflDFfClPNozqIVODha3P9Du6clcKXHRZ7UAzudAoQefz/0
 PBuy8g5NMZeKS8lgHYye1JaCyNCvnlw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=9J4mBROHImWsNsaboPyzbhh6dhacjAV4g8jVZe8034k=;
 b=6QZY3Rwc2R0AY5QHZp1OitVxT7dnCmTsFgyoaudc5jAZwge2dCe/tCCVC2RnsDGtrM+k35N4JjJFk
 j1gailRCQ==
X-HalOne-ID: afa55bbf-08f7-11ee-8b24-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id afa55bbf-08f7-11ee-8b24-b90637070a9d;
 Mon, 12 Jun 2023 08:04:01 +0000 (UTC)
Date: Mon, 12 Jun 2023 10:04:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] drm/mxsfb: Disable overlay plane in
 mxsfb_plane_overlay_atomic_disable()
Message-ID: <20230612080400.GA1212744@ravnborg.org>
References: <20230612075530.681869-1-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612075530.681869-1-victor.liu@nxp.com>
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
Cc: marex@denx.de, kernel@pengutronix.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu Ying.

On Mon, Jun 12, 2023 at 03:55:30PM +0800, Liu Ying wrote:
> When disabling overlay plane in mxsfb_plane_overlay_atomic_update(),
> overlay plane's framebuffer pointer is NULL.  So, dereferencing it would
> cause a kernel Oops(NULL pointer dereferencing).  Fix the issue by
> disabling overlay plane in mxsfb_plane_overlay_atomic_disable() instead.

Reading the above I had expected that some code was dropped from
mxsfb_plane_overlay_atomic_update().
I do not know the driver code, but was confused so decided to give
feedback.

	Sam

> 
> Fixes: cb285a5348e7 ("drm: mxsfb: Replace mxsfb_get_fb_paddr() with drm_fb_cma_get_gem_addr()")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 3bcc9c0f2019..7ed2516b6de0 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -611,6 +611,14 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
>  	writel(ctrl, mxsfb->base + LCDC_AS_CTRL);
>  }
>  
> +static void mxsfb_plane_overlay_atomic_disable(struct drm_plane *plane,
> +					       struct drm_atomic_state *state)
> +{
> +	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
> +
> +	writel(0, mxsfb->base + LCDC_AS_CTRL);
> +}
> +
>  static bool mxsfb_format_mod_supported(struct drm_plane *plane,
>  				       uint32_t format,
>  				       uint64_t modifier)
> @@ -626,6 +634,7 @@ static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
>  static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
>  	.atomic_check = mxsfb_plane_atomic_check,
>  	.atomic_update = mxsfb_plane_overlay_atomic_update,
> +	.atomic_disable = mxsfb_plane_overlay_atomic_disable,
>  };
>  
>  static const struct drm_plane_funcs mxsfb_plane_funcs = {
> -- 
> 2.37.1
