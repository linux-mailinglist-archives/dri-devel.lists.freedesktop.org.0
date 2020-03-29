Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647F19751B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5711B89FC5;
	Mon, 30 Mar 2020 07:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs40.siol.net [185.57.226.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887BE89F01
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 23:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id A502E521FBD;
 Mon, 30 Mar 2020 01:29:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id ZWF0-JOzCeTW; Mon, 30 Mar 2020 01:29:44 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 4DA5D521FD4;
 Mon, 30 Mar 2020 01:29:44 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 934CE521FBD;
 Mon, 30 Mar 2020 01:29:42 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Torsten Duwe <duwe@lst.de>,
 Maxime Ripard <maxime@cerno.tech>, Icenowy Zheng <icenowy@aosc.io>,
 Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH] drm/bridge: anx6345: set correct BPC for display_info of
 connector
Date: Mon, 30 Mar 2020 01:29:42 +0200
Message-ID: <11490050.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <20200329222253.2941405-1-anarsoul@gmail.com>
References: <20200329222253.2941405-1-anarsoul@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi!

Dne ponedeljek, 30. marec 2020 ob 00:22:53 CEST je Vasily Khoruzhick 
napisal(a):
> Some drivers (e.g. sun4i-drm) need this info to decide whether they
> need to enable dithering. Currently driver reports what panel supports
> and if panel supports 8 we don't get dithering enabled.
> 
> Hardcode BPC to 6 for now since that's the only BPC
> that driver supports.

Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej

> 
> Fixes: 6aa192698089 ("drm/bridge: Add Analogix anx6345 support")
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c index
> d7cb10c599a3..ea5de9395662 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
> @@ -494,6 +494,9 @@ static int anx6345_get_modes(struct drm_connector
> *connector)
> 
>  	num_modes += drm_add_edid_modes(connector, anx6345->edid);
> 
> +	/* Driver currently supports only 6bpc */
> +	connector->display_info.bpc = 6;
> +
>  unlock:
>  	if (power_off)
>  		anx6345_poweroff(anx6345);




_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
