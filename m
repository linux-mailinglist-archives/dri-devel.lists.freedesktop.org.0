Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E54A90D85
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 22:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA3D10E9BA;
	Wed, 16 Apr 2025 20:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="O/8oRwAH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1D610E9BA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 20:59:27 +0000 (UTC)
Date: Wed, 16 Apr 2025 16:59:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744837164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TvaLv2QNdfX5fSfGS64EBI+Z7WBX+FDFB//I+E9KN9I=;
 b=O/8oRwAHgPlyXtr3Pq/S4J2Zpf7RVhm1pjkM2X2NgnNlY7UCKk0OTOSFa8dlrIvOigv+3M
 EF56EJcREr1Mn/jIzudPxAWg9GZfyamDWyh57vYLwmoJv0D4EkFyehGc3syoA+z6WwK4mM
 0ZFyYgWh6UIKiw89MeBjfZe1xCrJhBnZDyaoEsIphvVcYMODPzaLAc5ohdKeGM1w7B4mra
 3F2/kDejYT+eXf46sXzQ1NUzi3V3m4LObmQCsipma5hbC9z1J7H4xDuyKrulZFhhUUzufT
 IZw0tRKMbdrnQG3qju6y//Lfm9tx+8ptsJ5n7JBK6m5V2LD3HXL0Oz0U8+b3Dw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] drm: adp: Enable vblank interrupts in crtc's
 .atomic_enable
Message-ID: <aAAaJ_6Y4VXRC3q-@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
 <20250416-drm_adp_fixes-v1-3-772699f13293@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-drm_adp_fixes-v1-3-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Wed , Apr 16, 2025 at 10:25:29PM +0200, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> Calling drm_crtc_vblank_on() drm_crtc_helper_funcs' atomic_enable is
> expected to enable vblank interrupts. It may have been avoided here to
> due to drm_crtc_vblank_get()'s error behavior after
> drm_crtc_vblank_reset(). With that fixed in the preceding change the
> driver can call drm_crtc_vblank_on() from adp_crtc_atomic_enable().
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index 27119acac92238858d58a690eb4196dbb2ae0c1a..c6238fb059342eebafddd53650a499fea0079dea 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -288,6 +288,7 @@ static void adp_crtc_atomic_enable(struct drm_crtc *crtc,
>  	writel(BIT(0), adp->be + ADBE_BLEND_EN3);
>  	writel(BIT(0), adp->be + ADBE_BLEND_BYPASS);
>  	writel(BIT(0), adp->be + ADBE_BLEND_EN4);
> +	drm_crtc_vblank_on(crtc);
>  }
>  
>  static void adp_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -517,8 +518,7 @@ static int adp_drm_bind(struct device *dev)
>  	struct adp_drv_private *adp = to_adp(drm);
>  	int err;
>  
> -	adp_disable_vblank(adp);
> -	writel(ADP_CTRL_FIFO_ON | ADP_CTRL_VBLANK_ON, adp->fe + ADP_CTRL);
> +	writel(ADP_CTRL_FIFO_ON, adp->fe + ADP_CTRL);
>  
>  	adp->next_bridge = drmm_of_get_bridge(&adp->drm, dev->of_node, 0, 0);
>  	if (IS_ERR(adp->next_bridge)) {
> 
> -- 
> 2.49.0
> 
> 
