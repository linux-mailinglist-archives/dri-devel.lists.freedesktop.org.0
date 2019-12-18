Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FFE123CA8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDEA6E21C;
	Wed, 18 Dec 2019 01:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94A46E21C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 01:48:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A003A33B;
 Wed, 18 Dec 2019 02:48:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576633721;
 bh=Hlg5xVk73E+8TxdDy+ZKRYmuTUFx0BbsKdd7t6egTIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ut9gX4OnVj6sfIK+en8wZX0P1f5gYFpwMdSAcPSJ2YH6cu47tTGj4in5qT3wq0vkL
 Fd2Mj6SCBCJr0UV3Rr4gXj9CbyWW3a69DBNl/H/fGB6WVHBRBAIdEt4VFEk9eJ2Kab
 lUJNvlRYj7PKCu7m2YBAw5cdRG113N1IlFzgmxFw=
Date: Wed, 18 Dec 2019 03:48:30 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 11/50] drm/bridge: Add bridge driver for display
 connectors
Message-ID: <20191218014830.GL4874@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-12-laurent.pinchart@ideasonboard.com>
 <20191215120331.GD27552@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215120331.GD27552@ravnborg.org>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the review.

On Sun, Dec 15, 2019 at 01:03:31PM +0100, Sam Ravnborg wrote:
> Hi Laurent.
> 
> One nit below.
> 
> > +
> > +struct display_connector {
> > +	struct drm_bridge	bridge;
> > +
> > +	const char		*label;
>
> label is defined here.
> 
> > +	struct gpio_desc	*hpd_gpio;
> > +	int			hpd_irq;
> > +};
> > +
> ...
> > +
> > +	/* Get the optional connector label. */
> > +	of_property_read_string(pdev->dev.of_node, "label", &conn->label);
>
> Assinged here.
>
> > +
> > +	/*
> > +	 * Get the HPD GPIO for DVI and HDMI connectors. If the GPIO can provide
> > +	 * edge interrupts, register an interrupt handler.
> > +	 */
>        ...
> > +
> > +	dev_info(&pdev->dev,
> > +		 "Found %s display connector '%s' %s DDC bus and %s HPD GPIO (ops 0x%x)\n",
> > +		 drm_get_connector_type_name(conn->bridge.type),
> > +		 conn->label ? conn->label : "<unlabelled>",
> > +		 conn->bridge.ddc ? "with" : "without",
> > +		 conn->hpd_gpio ? "with" : "without",
> > +		 conn->bridge.ops);
>
> And this is the only user - within the same function where label is
> assigned.
> We could use a loacal variable, no need to have it in struct display_connector
> unless futher use is planned.

Agreed, I'll move the field to a local variable. We can always move it
back to the display_connector structure later if needed.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
