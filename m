Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D387ECD3
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE67E10E062;
	Mon, 18 Mar 2024 15:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oJi+aZA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E3210E062
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:57:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 732BF2A5;
 Mon, 18 Mar 2024 16:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710777424;
 bh=SCTurdP0/3uyYnnbKe4OqBQbTcgNX6zxdBuyRbZZ3Qo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oJi+aZA/9Mu50X41lwDmXAl9IbZDoPPi+Oq1KicNuRaXrnT8yCOMzUAXWU7CYDplz
 TDHSdnRzOfNwRWrJJ8K4nAQb0RFKaGqKOIlwApb+4NtvTSvAFmAc7Q4skBqGw730dU
 WXseanWU1m1/7msbXAUjIP5Ru3FJDU/YiYB3nBYg=
Date: Mon, 18 Mar 2024 17:57:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: bridge: thc63lvd1024: Switch to use
 of_graph_get_remote_node()
Message-ID: <20240318155726.GE13682@pendragon.ideasonboard.com>
References: <20240316172800.1168390-1-sui.jingfeng@linux.dev>
 <20240318153326.GD13682@pendragon.ideasonboard.com>
 <22229306-aa72-4367-b029-fbdff4410cec@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <22229306-aa72-4367-b029-fbdff4410cec@linux.dev>
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

On Mon, Mar 18, 2024 at 11:53:11PM +0800, Sui Jingfeng wrote:
> On 2024/3/18 23:33, Laurent Pinchart wrote:
> > On Sun, Mar 17, 2024 at 01:28:00AM +0800, Sui Jingfeng wrote:
> >> To reduce boilerplate, use of_graph_get_remote_node() helper instead of
> >> the hand-rolling code.
> >>
> >> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
> >> ---
> >>   drivers/gpu/drm/bridge/thc63lvd1024.c | 24 +++---------------------
> >>   1 file changed, 3 insertions(+), 21 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> >> index d4c1a601bbb5..5f99f9724081 100644
> >> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> >> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> >> @@ -123,28 +123,10 @@ static int thc63_parse_dt(struct thc63_dev *thc63)
> >>   	struct device_node *endpoint;
> >>   	struct device_node *remote;
> >>   
> >> -	endpoint = of_graph_get_endpoint_by_regs(thc63->dev->of_node,
> >> -						 THC63_RGB_OUT0, -1);
> >> -	if (!endpoint) {
> >> -		dev_err(thc63->dev, "Missing endpoint in port@%u\n",
> >> -			THC63_RGB_OUT0);
> >> -		return -ENODEV;
> >> -	}
> >> -
> >> -	remote = of_graph_get_remote_port_parent(endpoint);
> >> -	of_node_put(endpoint);
> >> -	if (!remote) {
> >> -		dev_err(thc63->dev, "Endpoint in port@%u unconnected\n",
> >> -			THC63_RGB_OUT0);
> >> +	remote = of_graph_get_remote_node(thc63->dev->of_node,
> >> +					  THC63_RGB_OUT0, -1);
> >> +	if (!remote)
> > The old logic is equivalent to of_graph_get_remote_node(), but now the
> > driver will fail probing without an error message. That's not very nice
> > as it leads to difficult to debug problems. I would keep one dev_err()
> > here:
> >
> > 		dev_err(thc63->dev, "No remote endpoint for port@%u\n",
> > 			THC63_RGB_OUT0);
> >
> > As your patch has been merged already, would you like to post a
> > follow-up patch to fix this ?
> 
> Yes, this is indeed a difference. I will post a follow-up patch to fix this.

I'm actually build-testing a patch I already wrote :-) I'll post it in a
moment.

> >>   		return -ENODEV;
> >> -	}
> >> -
> >> -	if (!of_device_is_available(remote)) {
> >> -		dev_err(thc63->dev, "port@%u remote endpoint is disabled\n",
> >> -			THC63_RGB_OUT0);
> >> -		of_node_put(remote);
> >> -		return -ENODEV;
> >> -	}
> >>   
> >>   	thc63->next = of_drm_find_bridge(remote);
> >>   	of_node_put(remote);

-- 
Regards,

Laurent Pinchart
