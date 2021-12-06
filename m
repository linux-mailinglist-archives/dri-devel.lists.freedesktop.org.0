Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71954694D5
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 12:15:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D3A6E1A5;
	Mon,  6 Dec 2021 11:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5C36E1A5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 11:15:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43177EE;
 Mon,  6 Dec 2021 12:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638789324;
 bh=k0ZU6PLmhXKBxLaBzJoAUKNd4bvHTx6pfs1ZbhL2Pm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W3OPGacYT546ADQBceHRCDoFMowDLwe+k/HaNqbCe2bUQG7+iP5u/Xw4f40v9fgb+
 HbiSs5JoPWttxC0xSwHateilD1BuL1XVSMMP8QKj/bqZPROoyIDM5hfHt2+zaNvWd9
 eiC5EjOgiZ8YI8pJeq29hHy71COiQik0AThkjsAE=
Date: Mon, 6 Dec 2021 13:14:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] omapdrm: dss: mark runtime PM functions __maybe_unused
Message-ID: <Ya3wsKEVEtkTsmSU@pendragon.ideasonboard.com>
References: <20211205131612.3192652-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211205131612.3192652-1-arnd@kernel.org>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Cai Huoqing <caihuoqing@baidu.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

Thank you for the patch.

On Sun, Dec 05, 2021 at 02:15:56PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Using the SET_RUNTIME_PM_OPS() macro causes a warning about the
> referenced functions when they are marked static but not __maybe_unused:
> 
> drivers/gpu/drm/omapdrm/dss/dss.c:1572:12: error: unused function 'dss_runtime_suspend' [-Werror,-Wunused-function]
> drivers/gpu/drm/omapdrm/dss/dss.c:1584:12: error: unused function 'dss_runtime_resume' [-Werror,-Wunused-function]
> drivers/gpu/drm/omapdrm/dss/dispc.c:4845:12: error: unused function 'dispc_runtime_suspend' [-Werror,-Wunused-function]
> drivers/gpu/drm/omapdrm/dss/dispc.c:4860:12: error: unused function 'dispc_runtime_resume' [-Werror,-Wunused-function]
> 
> Fixes: b92f7ea556f8 ("drm/omap: dss: Make use of the helper macro SET_RUNTIME_PM_OPS()")

I wonder how well drivers are tested with !CONFIG_PM. We may be going
through hoops and loops to support this when it actually won't work in
most drivers. That's a separate issue though :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Tomi, could you apply this ?

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/omapdrm/dss/dispc.c | 4 ++--
>  drivers/gpu/drm/omapdrm/dss/dsi.c   | 4 ++--
>  drivers/gpu/drm/omapdrm/dss/dss.c   | 4 ++--
>  drivers/gpu/drm/omapdrm/dss/venc.c  | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> index b440147ae28b..ab259efe132b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -4842,7 +4842,7 @@ static int dispc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int dispc_runtime_suspend(struct device *dev)
> +static __maybe_unused int dispc_runtime_suspend(struct device *dev)
>  {
>  	struct dispc_device *dispc = dev_get_drvdata(dev);
>  
> @@ -4857,7 +4857,7 @@ static int dispc_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int dispc_runtime_resume(struct device *dev)
> +static __maybe_unused int dispc_runtime_resume(struct device *dev)
>  {
>  	struct dispc_device *dispc = dev_get_drvdata(dev);
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> index d730bf67fed9..a6845856cbce 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -5058,7 +5058,7 @@ static int dsi_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int dsi_runtime_suspend(struct device *dev)
> +static __maybe_unused int dsi_runtime_suspend(struct device *dev)
>  {
>  	struct dsi_data *dsi = dev_get_drvdata(dev);
>  
> @@ -5071,7 +5071,7 @@ static int dsi_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int dsi_runtime_resume(struct device *dev)
> +static __maybe_unused int dsi_runtime_resume(struct device *dev)
>  {
>  	struct dsi_data *dsi = dev_get_drvdata(dev);
>  
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
> index 66db28bfe824..69b3e15b9356 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1569,7 +1569,7 @@ static void dss_shutdown(struct platform_device *pdev)
>  	DSSDBG("shutdown\n");
>  }
>  
> -static int dss_runtime_suspend(struct device *dev)
> +static __maybe_unused int dss_runtime_suspend(struct device *dev)
>  {
>  	struct dss_device *dss = dev_get_drvdata(dev);
>  
> @@ -1581,7 +1581,7 @@ static int dss_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int dss_runtime_resume(struct device *dev)
> +static __maybe_unused int dss_runtime_resume(struct device *dev)
>  {
>  	struct dss_device *dss = dev_get_drvdata(dev);
>  	int r;
> diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
> index 508fddd376cf..4480b69ab5a7 100644
> --- a/drivers/gpu/drm/omapdrm/dss/venc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/venc.c
> @@ -879,7 +879,7 @@ static int venc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int venc_runtime_suspend(struct device *dev)
> +static __maybe_unused int venc_runtime_suspend(struct device *dev)
>  {
>  	struct venc_device *venc = dev_get_drvdata(dev);
>  
> @@ -889,7 +889,7 @@ static int venc_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int venc_runtime_resume(struct device *dev)
> +static __maybe_unused int venc_runtime_resume(struct device *dev)
>  {
>  	struct venc_device *venc = dev_get_drvdata(dev);
>  

-- 
Regards,

Laurent Pinchart
