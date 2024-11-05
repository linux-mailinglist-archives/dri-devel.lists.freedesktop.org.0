Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A09BD16C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 17:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0098310E5E9;
	Tue,  5 Nov 2024 16:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rhw5jwaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E4510E5E9
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 16:01:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAB31874;
 Tue,  5 Nov 2024 17:01:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730822501;
 bh=jV0ZsDeRx2PgG5eWTadzFaxOSxD1QREaoh8NhIiUtnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rhw5jwaWZpBtZ801zchegwjm59zZWvCec4AuS28/Q5PCsO/aGbaNpEj5P1sSbm1UZ
 7RvUZZhG4prUTPDnREh3jreMoJ6FBOlwR1b6pfKs5YbsILAqQywWAtwjvwCz38UHF5
 2kyM7zLLNZFDACTMx6osQTOD3sviAx8FAU5RHzQw=
Date: Tue, 5 Nov 2024 18:01:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Archit Taneja <architt@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Message-ID: <20241105160138.GB6317@pendragon.ideasonboard.com>
References: <20241105111228.112813-1-biju.das.jz@bp.renesas.com>
 <20241105111228.112813-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241105111228.112813-2-biju.das.jz@bp.renesas.com>
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

Hi Biju,

Thank you for the patch.

On Tue, Nov 05, 2024 at 11:12:18AM +0000, Biju Das wrote:
> The host_node pointer assigned and freed in adv7533_parse_dt()
> and later adv7533_attach_dsi() uses the same. Fix this issue
> by freeing the host_node in adv7533_attach_dsi() instead of
> adv7533_parse_dt().
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7533.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index 4481489aaf5e..3e57ba838e5e 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -133,6 +133,7 @@ int adv7533_patch_cec_registers(struct adv7511 *adv)
>  
>  int adv7533_attach_dsi(struct adv7511 *adv)
>  {
> +	struct device_node *np __free(device_node) = adv->host_node;

This raises so many red flags. The function will free the node while the
adv->host_node variable still points to it, opening the door to
use-after-free. Furthermore, there's nothing in the function name that
hints it will do this, callers can get surprised by this behaviour.

I'm sure you can do better than this and fix the problem with readable
code, not cryptic and error-prone constructs :-)

>  	struct device *dev = &adv->i2c_main->dev;
>  	struct mipi_dsi_host *host;
>  	struct mipi_dsi_device *dsi;
> @@ -181,8 +182,6 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
>  	if (!adv->host_node)
>  		return -ENODEV;
>  
> -	of_node_put(adv->host_node);
> -
>  	adv->use_timing_gen = !of_property_read_bool(np,
>  						"adi,disable-timing-generator");
>  

-- 
Regards,

Laurent Pinchart
