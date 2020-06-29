Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3F20CD15
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 09:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E5B289CF8;
	Mon, 29 Jun 2020 07:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C21389CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 07:58:40 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 26C0520022;
 Mon, 29 Jun 2020 09:46:17 +0200 (CEST)
Date: Mon, 29 Jun 2020 09:46:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/3] drm/dsi: use stack buffer in mipi_dsi_dcs_write()
Message-ID: <20200629074615.GB227119@ravnborg.org>
References: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=Ikd4Dj_1AAAA:8 a=QX4gbG5DAAAA:8
 a=e5mUnYsNAAAA:8 a=fa0ZEyJeFclwIsBcDLwA:9 a=CjuIK1q_8ugA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Jani Nikula <jani.nikula@intel.com>, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 05, 2020 at 05:03:27PM +0100, Emil Velikov wrote:
> Currently the function heap allocates when we have any payload. Where in
> many case the payload is 1 byte - ouch.
> 
> >From casual observation, vast majority of the payloads are smaller than
> 8 bytes - so use a stack array tx[8] to avoid the senseless kmalloc and
> kfree dance.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>

Applied to drm-misc-next. Sorry for taking so long.

	Sam

> ---
>  drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 55531895dde6..b96d5b4629d7 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -748,26 +748,26 @@ ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
>  {
>  	ssize_t err;
>  	size_t size;
> +	u8 stack_tx[8];
>  	u8 *tx;
>  
> -	if (len > 0) {
> -		size = 1 + len;
> -
> +	size = 1 + len;
> +	if (len > ARRAY_SIZE(stack_tx) - 1) {
>  		tx = kmalloc(size, GFP_KERNEL);
>  		if (!tx)
>  			return -ENOMEM;
> -
> -		/* concatenate the DCS command byte and the payload */
> -		tx[0] = cmd;
> -		memcpy(&tx[1], data, len);
>  	} else {
> -		tx = &cmd;
> -		size = 1;
> +		tx = stack_tx;
>  	}
>  
> +	/* concatenate the DCS command byte and the payload */
> +	tx[0] = cmd;
> +	if (data)
> +		memcpy(&tx[1], data, len);
> +
>  	err = mipi_dsi_dcs_write_buffer(dsi, tx, size);
>  
> -	if (len > 0)
> +	if (tx != stack_tx)
>  		kfree(tx);
>  
>  	return err;
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
