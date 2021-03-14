Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2633733A24D
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 03:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D692E89BFD;
	Sun, 14 Mar 2021 02:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4869C89BFD
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 02:15:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0320E55C;
 Sun, 14 Mar 2021 03:15:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615688150;
 bh=DKsxYktuuGnusRXJGBQqTLHN0r6C6x8dBcI2xv+gbos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pHZm8riY74l8W/JQpcFEYe4VWPBYb0NL+62WF/W5j5QFq89rRy2pRwspPS8FAKb4J
 IQIq1kOlo4eQUT43Px638X5Qa0Jdm+dh52yD7ZS3KFuhyJgn/di4uG+rlJvdAQkdYs
 DvJ/a2dxMDfmW9eIb3nDkaXc2UfSoII0crFFJNjo=
Date: Sun, 14 Mar 2021 04:15:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: angkery <angkery@163.com>
Subject: Re: [PATCH] drm/omap: dsi: fix unsigned expression compared with zero
Message-ID: <YE1xsg0gm0nNR8hy@pendragon.ideasonboard.com>
References: <20210312071445.1721-1-angkery@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312071445.1721-1-angkery@163.com>
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
Cc: Junlin Yang <yangjunlin@yulong.com>, tomba@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 sebastian.reichel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Junlin,

Thank you for the patch.

On Fri, Mar 12, 2021 at 03:14:45PM +0800, angkery wrote:
> From: Junlin Yang <yangjunlin@yulong.com>
> 
> r is "u32" always >= 0,mipi_dsi_create_packet may return little than zero.
> so r < 0 condition is never accessible.
> 
> Fixes coccicheck warnings:
> ./drivers/gpu/drm/omapdrm/dss/dsi.c:2155:5-6:
> WARNING: Unsigned expression compared with zero: r < 0
> 
> Signed-off-by: Junlin Yang <yangjunlin@yulong.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, will you take this in your tree ?

> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index 8e11612..b31d750 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -2149,11 +2149,12 @@ static int dsi_vc_send_short(struct dsi_data *dsi, int vc,
>  			     const struct mipi_dsi_msg *msg)
>  {
>  	struct mipi_dsi_packet pkt;
> +	int ret;
>  	u32 r;
>  
> -	r = mipi_dsi_create_packet(&pkt, msg);
> -	if (r < 0)
> -		return r;
> +	ret = mipi_dsi_create_packet(&pkt, msg);
> +	if (ret < 0)
> +		return ret;
>  
>  	WARN_ON(!dsi_bus_is_locked(dsi));
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
