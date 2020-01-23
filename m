Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67D1462B4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 08:37:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78256F9B8;
	Thu, 23 Jan 2020 07:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3548A6F9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2020 07:37:22 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 74F1A28CE86;
 Thu, 23 Jan 2020 07:37:20 +0000 (GMT)
Date: Thu, 23 Jan 2020 08:37:17 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 01/12] drm/bridge: Add a drm_bridge_state object
Message-ID: <20200123083717.1264d9b4@collabora.com>
In-Reply-To: <20200122111700.1924960-2-boris.brezillon@collabora.com>
References: <20200122111700.1924960-1-boris.brezillon@collabora.com>
 <20200122111700.1924960-2-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Mark Rutland <mark.rutland@arm.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 22 Jan 2020 12:16:49 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +
> +/**
> + * drm_atomic_get_bridge_state - get bridge state
> + * @state: global atomic state object
> + * @bridge: bridge to get state object for
> + *
> + * This function returns the bridge state for the given bridge, allocating it
> + * if needed. It will also grab the relevant bridge lock to make sure that the
> + * state is consistent.
> + *
> + * Returns:
> + *
> + * Either the allocated state or the error code encoded into the pointer. When
> + * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
> + * entire atomic sequence must be restarted.
> + */
> +struct drm_bridge_state *
> +drm_atomic_get_bridge_state(struct drm_atomic_state *state,
> +			    struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_private_obj_state(state, &bridge->base);
> +	if (IS_ERR(obj_state))
> +		return ERR_CAST(obj_state);
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_get_bridge_state);
> +
> +/**
> + * drm_atomic_get_old_bridge_state - get old bridge state, if it exists
> + * @state: global atomic state object
> + * @bridge: bridge to grab
> + *
> + * This function returns the old bridge state for the given bridge, or NULL if
> + * the bridge is not part of the global atomic state.
> + */
> +struct drm_bridge_state *
> +drm_atomic_get_old_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_old_private_obj_state(state, &bridge->base);
> +	if (!obj_state)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_get_old_bridge_state);
> +
> +/**
> + * drm_atomic_get_new_bridge_state - get new bridge state, if it exists
> + * @state: global atomic state object
> + * @bridge: bridge to grab
> + *
> + * This function returns the new bridge state for the given bridge, or NULL if
> + * the bridge is not part of the global atomic state.
> + */
> +struct drm_bridge_state *
> +drm_atomic_get_new_bridge_state(struct drm_atomic_state *state,
> +				struct drm_bridge *bridge)
> +{
> +	struct drm_private_state *obj_state;
> +
> +	obj_state = drm_atomic_get_new_private_obj_state(state, &bridge->base);
> +	if (!obj_state)
> +		return NULL;
> +
> +	return drm_priv_to_bridge_state(obj_state);
> +}
> +EXPORT_SYMBOL(drm_atomic_get_new_bridge_state);
> +

Oops, I placed those helpers in the #ifdef CONFIG_DEBUG_FS section.

>  #endif
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
