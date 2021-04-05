Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9A3353A6A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Apr 2021 02:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F81289E69;
	Mon,  5 Apr 2021 00:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3634F89E69
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Apr 2021 00:50:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9351D40;
 Mon,  5 Apr 2021 02:50:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617583825;
 bh=gBtmkYGClgERNSI4TslDSDr4bEyMle1yAbKvhAur19s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c4TsRYkjVzzNCstpAvd/2HQnB4iqOyeVvzQRymPS/eRcpxs1kqAkp7WKxS9FWUh37
 f8Ybh1IbYAaS6S9hExP5kCQDa/4Atde89dfhGNTZ3Iep18DxzhUPUSxovZiwoqZxdF
 YHGkEFxDxGqn2EQRbm+g8+UKmSzeg0OO8nHn97tg=
Date: Mon, 5 Apr 2021 03:49:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 01/12] drm/bridge: Fix the stop condition of
 drm_bridge_chain_pre_enable()
Message-ID: <YGpeo9LV4uAh1B7u@pendragon.ideasonboard.com>
References: <20210402222846.2461042-1-dianders@chromium.org>
 <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402152701.v3.1.If62a003f76a2bc4ccc6c53565becc05d2aad4430@changeid>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Fri, Apr 02, 2021 at 03:28:35PM -0700, Douglas Anderson wrote:
> The drm_bridge_chain_pre_enable() is not the proper opposite of
> drm_bridge_chain_post_disable(). It continues along the chain to
> _before_ the starting bridge. Let's fix that.
> 
> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/drm_bridge.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 64f0effb52ac..044acd07c153 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -522,6 +522,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>  		if (iter->funcs->pre_enable)
>  			iter->funcs->pre_enable(iter);
> +
> +		if (iter == bridge)
> +			break;

This looks good as it matches drm_atomic_bridge_chain_disable().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'm curious though, given that the bridge passed to the function should
be the one closest to the encoder, does this make a difference ?

>  	}
>  }
>  EXPORT_SYMBOL(drm_bridge_chain_pre_enable);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
