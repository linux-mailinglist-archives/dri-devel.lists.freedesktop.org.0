Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CF1964927
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 16:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFDE10E6F1;
	Thu, 29 Aug 2024 14:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y/hg1oCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CB410E6F1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 14:54:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 96DC4A4410C;
 Thu, 29 Aug 2024 14:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB876C4CEC3;
 Thu, 29 Aug 2024 14:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724943276;
 bh=94sqycuEg7LZE3IfoAS/UYJHpdhV1CbtJdmFG3iWS1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y/hg1oCh+Ij6W4jgfibIcNLBH2y6qwXWngwcUcGr4b3eYryJduYRVobwRt6oxc42R
 H6f1zYxHYCrS7niInBO5J0AjCy8ecFWqNseOf/cmogScebBhrEna8OTyktEs8yEjrJ
 175Q0V6vAr2G+DQqxPtZGIdZNe+qIREnbKSj8qwgAhz5FNxTFMhz5yEsTHAxdoLS3i
 hI3xZDeYhtA/QPLEtmCboawwvUP6HlSbtj5geHqzV/za/0DVs4yDF5mOzTCBINi1xj
 x4gwu3HxpENBZpP5e0AkTwn4UUpF/Eb8me1jX0fvP6HHtr585Fv4o2jsG3R7yMmQpr
 Zda3hB26yi+pQ==
Date: Thu, 29 Aug 2024 09:54:34 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 9/9] media: xilinx-tpg: use new of_graph functions
Message-ID: <20240829145434.GA465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <87y14h1b9f.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y14h1b9f.wl-kuninori.morimoto.gx@renesas.com>
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

On Wed, Aug 28, 2024 at 05:12:28AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/xilinx/xilinx-tpg.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
> index e05e528ffc6f7..a25f216b2513c 100644
> --- a/drivers/media/platform/xilinx/xilinx-tpg.c
> +++ b/drivers/media/platform/xilinx/xilinx-tpg.c
> @@ -13,6 +13,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/xilinx-v4l2-controls.h>
>  
> @@ -744,7 +745,7 @@ static int xtpg_parse_of(struct xtpg_device *xtpg)
>  		}
>  

This function is looping over port nodes, why don't you make it use 
for_each_of_graph_port()?

>  		if (nports == 0) {
> -			endpoint = of_get_next_child(port, NULL);
> +			endpoint = of_graph_get_next_port_endpoint(port, NULL);
>  			if (endpoint)
>  				has_endpoint = true;
>  			of_node_put(endpoint);
> -- 
> 2.43.0
> 
