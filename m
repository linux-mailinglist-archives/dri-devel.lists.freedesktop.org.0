Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B16DEF67
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 10:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBEC10E73C;
	Wed, 12 Apr 2023 08:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0D610E73C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:50:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA022616E;
 Wed, 12 Apr 2023 10:50:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681289432;
 bh=P9omQNjGcS98ijd1kM117+6oifyx6ZMzbf6istyRB4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fd33A+4wt3y/33SzfS4z5h7/h/wcRGcdvwjMJyAze3ctbDteoo/NRvI5UySQHI5tc
 o1prKtHhFq2S77Iwuu35OJET47uY+nL2q4CL/D6zttYHOoDgwQGRvT+/tzwFvOB4Cx
 0IxMAwS6Ug5VaiZNyAtzWetyj5o7oCxXHgLcVYkg=
Date: Wed, 12 Apr 2023 11:50:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] drm/omap: dsi: Fix deferred probe warnings
Message-ID: <20230412085044.GP11253@pendragon.ideasonboard.com>
References: <20230412073954.20601-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230412073954.20601-1-tony@atomide.com>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tony,

Thank you for the patch.

On Wed, Apr 12, 2023 at 10:39:53AM +0300, Tony Lindgren wrote:
> We may not have dsi->dsidev initialized during probe, and that can
> lead into various dsi related warnings as omap_dsi_host_detach() gets
> called with dsi->dsidev set to NULL.
> 
> The warnings can be "Fixed dependency cycle(s)" followed by a
> WARNING: CPU: 0 PID: 787 at drivers/gpu/drm/omapdrm/dss/dsi.c:4414.

How can this happen ? I assume .detach() can't be called without a
priori successful call to .attach(), that that sets dsi->dsidev.

> Let's fix the warnings by checking for a valid dsi->dsidev.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4411,7 +4411,7 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
>  {
>  	struct dsi_data *dsi = host_to_omap(host);
>  
> -	if (WARN_ON(dsi->dsidev != client))
> +	if (dsi->dsidev && WARN_ON(dsi->dsidev != client))
>  		return -EINVAL;
>  
>  	cancel_delayed_work_sync(&dsi->dsi_disable_work);

-- 
Regards,

Laurent Pinchart
