Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8971C94BB38
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 12:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980FD10E6C8;
	Thu,  8 Aug 2024 10:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hlDx4VNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884A310E6C8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 10:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723113337; x=1754649337;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P5WkWuMuBZYslRPDaGbmL4Xir3nJ3nC4NhpsZuTy/BE=;
 b=hlDx4VNxAwcCDQB1Lx2nZEEC0cXFCO4zK1m55WqoHdRejXa+ufQeP/O5
 Me+3LTlD4ZCawuqNosWmhQuxnOxEfmMLuvwsrfIfWeGSCyzdbE4YZsgD1
 wngmSFhWBC57Y/53PCMH+wdvCypkXa/RD6p8oQh9Z3CbvsIuc8nD7q4aq
 TXQd5vbgYUPIHK5jRXrIxz13DCzSiZssURZwhgMjpjEoYcff7EJsA0LeP
 sM3Ij4yROuqRjltx7u4oX+BPDZ/Bledqq3VsdyRQLCkH1nm11icRzOFHB
 vvNLnMTVALg4mVmPO+/uMIAmk6PWQ75BfZV1jbQALDucVJR1XU/5swAgM Q==;
X-CSE-ConnectionGUID: f5+GxsnFTR6t3hXWFlMjnw==
X-CSE-MsgGUID: +jhtEGQqRwCtV4ncVSz9hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38686052"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="38686052"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 03:35:37 -0700
X-CSE-ConnectionGUID: s3wnOjv9ThyGUOLWHcX9Sg==
X-CSE-MsgGUID: POL1YADgSwCsqBMS5jINtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="57274416"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.245.71])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 03:35:30 -0700
Date: Thu, 8 Aug 2024 11:35:23 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: use dev_err_probe when failing
 to get panel bridge
Message-ID: <ZrSfayN4U6Lk3UCj@ashyti-mobl2.lan>
References: <20240808-ti-sn65dsi83-dev_err_probe-v1-1-72417aa275ab@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808-ti-sn65dsi83-dev_err_probe-v1-1-72417aa275ab@bootlin.com>
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

Hi Luca,

On Thu, Aug 08, 2024 at 12:26:14PM +0200, Luca Ceresoli wrote:
> When devm_drm_of_get_bridge() fails, the probe fails silently. Use
> dev_err_probe() instead to log an error or report the deferral reason,
> whichever is applicable.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 57a7ed13f996..60b9f14d769a 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -606,7 +606,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
>  
>  	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
>  	if (IS_ERR(panel_bridge))
> -		return PTR_ERR(panel_bridge);
> +		return dev_err_probe(dev, PTR_ERR(panel_bridge), "Failed to get panel bridge\n");

patch looks good, but the message is a bit misleading. You are
not failing to get the panel bridge, but you are failing to find
a panel bridge in a DT node. Right?

Andi
