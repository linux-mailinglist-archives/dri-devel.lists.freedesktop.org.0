Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2506C11F799
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2019 13:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CB289C0A;
	Sun, 15 Dec 2019 12:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5E589C0A
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2019 12:03:36 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 3038020028;
 Sun, 15 Dec 2019 13:03:33 +0100 (CET)
Date: Sun, 15 Dec 2019 13:03:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 11/50] drm/bridge: Add bridge driver for display
 connectors
Message-ID: <20191215120331.GD27552@ravnborg.org>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-12-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210225750.15709-12-laurent.pinchart@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=p8GyAliVrYQ0S6AimxkA:9 a=CjuIK1q_8ugA:10
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

Hi Laurent.

One nit below.

> +
> +struct display_connector {
> +	struct drm_bridge	bridge;
> +
> +	const char		*label;
label is defined here.

> +	struct gpio_desc	*hpd_gpio;
> +	int			hpd_irq;
> +};
> +
...
> +
> +	/* Get the optional connector label. */
> +	of_property_read_string(pdev->dev.of_node, "label", &conn->label);
Assinged here.
> +
> +	/*
> +	 * Get the HPD GPIO for DVI and HDMI connectors. If the GPIO can provide
> +	 * edge interrupts, register an interrupt handler.
> +	 */
       ...
> +
> +	dev_info(&pdev->dev,
> +		 "Found %s display connector '%s' %s DDC bus and %s HPD GPIO (ops 0x%x)\n",
> +		 drm_get_connector_type_name(conn->bridge.type),
> +		 conn->label ? conn->label : "<unlabelled>",
> +		 conn->bridge.ddc ? "with" : "without",
> +		 conn->hpd_gpio ? "with" : "without",
> +		 conn->bridge.ops);
And this is the only user - within the same function where label is
assigned.
We could use a loacal variable, no need to have it in struct display_connector
unless futher use is planned.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
