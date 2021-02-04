Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFED30FC3B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 20:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3496E0C8;
	Thu,  4 Feb 2021 19:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D036E0C8
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 19:10:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43447EE;
 Thu,  4 Feb 2021 20:10:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1612465816;
 bh=AgYkKVrP4DKAR+xgr3fDWPdr8Po/TcC1JbCsIsCLFyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q7l7iNVxlIO85iPTlgW3DXj+tMxwENTog2YffK6XGZYkXn+m7gDc7mn1T3mOKWNpp
 eKrDQw9yFiHrnAF+aZ2p5Fw1nTQgiBs4mW7ktyzsH2LFC8eUicvC+0rYaGH1iOTtm4
 IKY5oDxciFpreUxfz/ln6ZecdRgryRnkDNTAubtc=
Date: Thu, 4 Feb 2021 21:09:53 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH] drm/bridge: make a const array static, makes object
 smaller
Message-ID: <YBxGgRh4ckgbI0Z/@pendragon.ideasonboard.com>
References: <20210204183344.110078-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204183344.110078-1-colin.king@canonical.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Colin,

Thank you for the patch.

On Thu, Feb 04, 2021 at 06:33:44PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array frs_limits on the stack but instead make
> it static. Makes the object code smaller by 128 bytes:
> 
> Before:
>    text    data     bss     dec     hex filename
>   24845    7440      64   32349    7e5d ./drivers/gpu/drm/bridge/tc358768.o
> 
> After:
>    text    data     bss     dec     hex filename
>   24749    7408      64   32221    7ddd ./drivers/gpu/drm/bridge/tc358768.o
> 
> (gcc version 10.2.0)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/tc358768.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
> index 8ed8302d6bbb..2495ea46b091 100644
> --- a/drivers/gpu/drm/bridge/tc358768.c
> +++ b/drivers/gpu/drm/bridge/tc358768.c
> @@ -291,7 +291,7 @@ static int tc358768_calc_pll(struct tc358768_priv *priv,
>  			     const struct drm_display_mode *mode,
>  			     bool verify_only)
>  {
> -	const u32 frs_limits[] = {
> +	static const u32 frs_limits[] = {
>  		1000000000,
>  		500000000,
>  		250000000,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
