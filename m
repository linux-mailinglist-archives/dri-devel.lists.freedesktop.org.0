Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7287504CF7
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 09:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F84310E7C2;
	Mon, 18 Apr 2022 07:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A7B10E7C2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 07:07:43 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 3e71f98d-bee6-11ec-9ac0-0050568cd888;
 Mon, 18 Apr 2022 07:07:44 +0000 (UTC)
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (mailproxy3.pub.dirpod4-cph3.one.com [104.37.34.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5F784194B38;
 Mon, 18 Apr 2022 09:07:39 +0200 (CEST)
Date: Mon, 18 Apr 2022 09:07:35 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm/panel: newvision-nv3052c: Fix build
Message-ID: <Yl0ON+E7bYluGIYG@ravnborg.org>
References: <20220409100016.9337-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220409100016.9337-1-paul@crapouillou.net>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 kbuild-all <kbuild-all@lists.01.org>, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 09, 2022 at 11:00:16AM +0100, Paul Cercueil wrote:
> The driver was compile-tested then rebased on drm-misc-next, and not
> compile-tested after the rebase; unfortunately the driver didn't compile
> anymore when it hit drm-misc-next.
> 
> Fixes: 49956b505c53 ("drm/panel: Add panel driver for NewVision NV3052C based LCDs")
> Cc: Christophe Branchereau <cbranchereau@gmail.com>
> Cc: kbuild-all <kbuild-all@lists.01.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 127bcfdb59df..cf078f0d3cd3 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -416,15 +416,13 @@ static int nv3052c_probe(struct spi_device *spi)
>  	return 0;
>  }
>  
> -static int nv3052c_remove(struct spi_device *spi)
> +static void nv3052c_remove(struct spi_device *spi)
>  {
>  	struct nv3052c *priv = spi_get_drvdata(spi);
>  
>  	drm_panel_remove(&priv->panel);
>  	drm_panel_disable(&priv->panel);
>  	drm_panel_unprepare(&priv->panel);
> -
> -	return 0;
>  }
>  
>  static const struct drm_display_mode ltk035c5444t_modes[] = {
> -- 
> 2.35.1
