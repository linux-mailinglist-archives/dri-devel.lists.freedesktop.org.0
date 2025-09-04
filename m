Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC31B44127
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A3910EA90;
	Thu,  4 Sep 2025 15:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qv3oeNWl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C86710E263
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 15:54:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CCDE678C;
 Thu,  4 Sep 2025 17:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1757001225;
 bh=EUitpBuEyGTZlB+HNH7hlagNzY8esbz9mumI5QTncHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qv3oeNWlKElB18WaBD7JOC2ZSfn94qfJfTEAq7SJIpKqYRLqo3LRDd+O6kl26tRiI
 sprhdw23w1cNCuHv+XzwGFSHLmxrT+4j1R10n2wvPaXi4jJ6QgjaqTb475tEFB/6jR
 kztAyYJaHfTQpaY6pxRU2IVlisSOZ6IZabWMiWko=
Date: Thu, 4 Sep 2025 17:54:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: lvds: Convert to RUNTIME_PM_OPS()
Message-ID: <20250904155434.GF6174@pendragon.ideasonboard.com>
References: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>
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

On Thu, Sep 04, 2025 at 05:31:00PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Display Unit LVDS driver from
> SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS(), and pm_ptr().  This reduces
> kernel size in case CONFIG_PM is disabled.  While DRM_RCAR_LVDS depends
> on PM, the code may still serve as an example for new drivers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> index 4dcb36dc0bff6e53..6d44238c4078a425 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c
> @@ -1013,7 +1013,7 @@ static int rcar_lvds_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops rcar_lvds_pm_ops = {
> -	SET_RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(rcar_lvds_runtime_suspend, rcar_lvds_runtime_resume, NULL)
>  };
>  
>  static struct platform_driver rcar_lvds_platform_driver = {
> @@ -1021,7 +1021,7 @@ static struct platform_driver rcar_lvds_platform_driver = {
>  	.remove		= rcar_lvds_remove,
>  	.driver		= {
>  		.name	= "rcar-lvds",
> -		.pm	= &rcar_lvds_pm_ops,
> +		.pm	= pm_ptr(&rcar_lvds_pm_ops),
>  		.of_match_table = rcar_lvds_of_table,
>  	},
>  };

-- 
Regards,

Laurent Pinchart
