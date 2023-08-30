Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD62A78E0CC
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 22:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0584610E2A4;
	Wed, 30 Aug 2023 20:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8C610E2A4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 20:38:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB4452D8;
 Wed, 30 Aug 2023 22:36:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693427814;
 bh=w4+pDGg4A1xcuvMXkOpdT0G3fedDIjjTTZZ9xWTuDTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ue3LRcWcsrr2zVLKt4WKB29r46N/I73/p9ISbY3c1NiT+V0uS4dBtbShEWJd0utjr
 KvuPl3MME623fVBQw1MLG1BOJU3zMn2xoLQKUtIa+Ux5R0OREtqQOZqW3L2bUpXoZQ
 HbZjfBGRiXR5PT5/N/Q7bvDT0Njs/3fk7okNJTAw=
Date: Wed, 30 Aug 2023 23:38:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v5 2/3] drm/bridge: Drop conditionals around of_node
 pointers
Message-ID: <20230830203825.GP6477@pendragon.ideasonboard.com>
References: <20230830170819.309269-1-biju.das.jz@bp.renesas.com>
 <20230830170819.309269-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230830170819.309269-3-biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

Thank you for the patch.

In the commit message, s/pointers/pointer/ as you're only touching a
single one.

On Wed, Aug 30, 2023 at 06:08:18PM +0100, Biju Das wrote:
> The commit c9e358dfc4a8 ("driver-core: remove conditionals around
> devicetree pointers") supposed to remove conditionals around of_node
> pointer, but it missed out drm/bridge.h. So drop #if conditionals by
> adding struct device_node forward declaration.

You can hardly blame commit c9e358dfc4a8 for forgetting drm_bridge, as
that commit dates back from 2011 and the drm_bridge of_node field was
added in 2015 :-)

I would simply copy the rationale from the commit message of
c9e358dfc4a8 and write something like

--------
Having conditional around the of_node pointer of the drm_bridge
structure turns out to make driver code use ugly #ifdef blocks. Drop the
conditionals to simplify drivers. While this slightly increases the size
of struct drm_bridge on non-OF system, the number of bridges used today
and foreseen tomorrow on those systems is very low, so this shouldn't be
an issue.
--------

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> v5:
>  * Split from patch#2
>  * Updated commit description
>  * Added struct device_node forward declaration.
> ---
>  include/drm/drm_bridge.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index c339fc85fd07..843736627f60 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -32,6 +32,8 @@
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_modes.h>
>  
> +struct device_node;
> +
>  struct drm_bridge;
>  struct drm_bridge_timings;
>  struct drm_connector;
> @@ -716,10 +718,8 @@ struct drm_bridge {
>  	struct drm_encoder *encoder;
>  	/** @chain_node: used to form a bridge chain */
>  	struct list_head chain_node;
> -#ifdef CONFIG_OF
>  	/** @of_node: device node pointer to the bridge */
>  	struct device_node *of_node;
> -#endif
>  	/** @list: to keep track of all added bridges */
>  	struct list_head list;
>  	/**

-- 
Regards,

Laurent Pinchart
