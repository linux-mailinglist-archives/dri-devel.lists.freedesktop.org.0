Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF591325DF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 13:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4356E046;
	Tue,  7 Jan 2020 12:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32706E044
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 12:16:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A9A952F;
 Tue,  7 Jan 2020 13:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1578399358;
 bh=5kqfuBPBTzizbkln3ybVv5kDTp0Ue1oQZ8Qj2fBW0bg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hpmGpOLvQL7esTzbpmakioBq2CHqfH3piFalmoBsaEW+AmUKInMvyk0pNKGat0NyX
 dzLhwdCDqdAsgJ93wcsAfMW1gbN4revcsrol5BFUmXKdMCKte5+YVDs8u8PT+whBO2
 i4DvqY7vAqNsK8erqw0P3M3tPHMyzNBa8uC7B0TU=
Date: Tue, 7 Jan 2020 14:15:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] drm/bridge: Fix a NULL pointer dereference in
 drm_atomic_bridge_chain_check()
Message-ID: <20200107121547.GA4871@pendragon.ideasonboard.com>
References: <20200107113031.435604-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200107113031.435604-1-boris.brezillon@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 intel-gfx-trybot@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

Thank you for the patch.

On Tue, Jan 07, 2020 at 12:30:31PM +0100, Boris Brezillon wrote:
> drm_atomic_bridge_chain_check() callers can pass a NULL bridge. Let's
> bail out before derefencing the bridge pointer when that happens.
> 
> Reported-by: Chris Wilson <chris@chris-wilson.co.uk>
> Fixes: b86d895524ab ("drm/bridge: Add an ->atomic_check() hook")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_bridge.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index da28967bc586..f6f020854e83 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -941,15 +941,19 @@ int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
>  				  struct drm_connector_state *conn_state)
>  {
>  	struct drm_connector *conn = conn_state->connector;
> -	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_encoder *encoder;
>  	struct drm_bridge *iter;
>  	int ret;
>  
> +	if (!bridge)
> +		return 0;
> +
>  	ret = drm_atomic_bridge_chain_select_bus_fmts(bridge, crtc_state,
>  						      conn_state);
>  	if (ret)
>  		return ret;
>  
> +	encoder = bridge->encoder;
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>  		int ret;
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
