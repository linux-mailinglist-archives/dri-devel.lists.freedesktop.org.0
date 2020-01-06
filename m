Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B402F131090
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 11:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046A46E23D;
	Mon,  6 Jan 2020 10:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C67C6E23B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2020 10:29:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A86B52F;
 Mon,  6 Jan 2020 11:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1578306561;
 bh=Epnma+hHn8oqzO71KUPxhhXyABGgluqWJ8aDYarTFCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aigvBjAQvWmc8LAwYvHzTLXXO7BKX/wgcBPDtmHopU4+uCbi+NHq55BGMe5XUPPRf
 BUspD4IC/XxUK6FmRRc7RIuiwPlv12unT/wTF6Dd7qhwcS5iBzuLqciOBRHiRGoboX
 6Mv08y27tCV2rZFbNsIlaPgqRzeSIqZrS7gKK2SE=
Date: Mon, 6 Jan 2020 12:29:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 1/3] drm/bridge: Fix drm_bridge_chain_pre_enable()
Message-ID: <20200106102911.GA4853@pendragon.ideasonboard.com>
References: <20191227144124.210294-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191227144124.210294-1-boris.brezillon@collabora.com>
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, dri-devel@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

Thank you for the patch.

On Fri, Dec 27, 2019 at 03:41:22PM +0100, Boris Brezillon wrote:
> Stop iterating on the bridge chain when we reach the bridge element.
> That's what other helpers do and should allow bridge implementations
> to execute a pre_enable operation on a sub-chain.

The code looks fine to me, but I think you should update the
documentation to explain this. It currently states:

 * Calls &drm_bridge_funcs.pre_enable op for all the bridges in the encoder
 * chain, starting from the last bridge to the first. These are called
 * before calling the encoder's commit op.
 *
 * Note: the bridge passed should be the one closest to the encoder

I suggest stating instead that the operation is called from the last
bridge to the bridge passed as the argument. The note should then either
be removed, or updated to state that bridge is usually the bridge
closest to the encoder, but can be any other bridge if the caller only
wants to execute the operation on a subset of the chain. It's also
probably worth it updating the other functions accordingly.

> Fixes: 05193dc38197 ("drm/bridge: Make the bridge chain a double-linked list")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/drm_bridge.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c2cf0c90fa26..b3b269ec6a39 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -357,6 +357,9 @@ void drm_bridge_chain_pre_enable(struct drm_bridge *bridge)
>  	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
>  		if (iter->funcs->pre_enable)
>  			iter->funcs->pre_enable(iter);
> +
> +		if (iter == bridge)
> +			break;
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
