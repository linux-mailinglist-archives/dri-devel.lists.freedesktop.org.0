Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E21FB48480
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 08:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB53110E052;
	Mon,  8 Sep 2025 06:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XGOEZ/gR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913DB10E052
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 06:54:07 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E6C799F;
 Mon,  8 Sep 2025 08:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1757314373;
 bh=89Kcw2gLgaJYgm7Wgq9e1Mu15pHehUERgjbrZ4hW2gk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XGOEZ/gR2CN8N/K+PTgsoTH8wgiyU0sVR2ENTsbcs3yyEdxTEN/fswqFR9P4EG1fQ
 ftuWjIAP3wWgnAOqGsJd5iaJ+oJXoWH4DHFJyOSubLMlMJZEltaMyIlmxmW/R5YCEm
 v4fRoyBhIKcN03Q5oqrTpZqs/HB7UL9d4i0JH3Ts=
Message-ID: <b3332d6c-08e8-427d-a928-bdc94ab48940@ideasonboard.com>
Date: Mon, 8 Sep 2025 09:54:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: rcar-du: lvds: Convert to RUNTIME_PM_OPS()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 04/09/2025 18:31, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Display Unit LVDS driver from
> SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS(), and pm_ptr().  This reduces
> kernel size in case CONFIG_PM is disabled.  While DRM_RCAR_LVDS depends
> on PM, the code may still serve as an example for new drivers.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

Thanks, pushing to drm-misc-next.

 Tomi

