Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE75C413386
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 14:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39606E979;
	Tue, 21 Sep 2021 12:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2DE6E979
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 12:48:01 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id e15so42045600lfr.10
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0iKk677m9bJ0KMcgnOWE11cK+zGCL3J/lyYGIokaL7A=;
 b=gG4XEOORpOHqjT1Y1Lb34Jfjp1+ydzkV7OeAXPYWN3c0Ngiw6GF+z7F1HdcsN7kKEL
 pdN3nH7lIlB6uVjCQ4RNCdWP4UOlWLLwvAyQgWntQqmLPH7v1LosxGA3kxQxa8u5QFEP
 pfr1qKQ9ZHWyMa8R9lXMP9hZvXU34fEzyCZyyRv2I06uDMtywptl4rVLdnuz06DGhtTx
 qahELgM9QTwTCTPMERO+qmZf3yJut6vV3FwIOvQt8i7UwxKLlqmK4TrD4YmhHRPd6mpM
 WgPUYmvalTobH/rIWVu3o7V9ZGpx43u+4IWSMOmRKxcdJihRMBDbG/qa599UXxVYQEjy
 3jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0iKk677m9bJ0KMcgnOWE11cK+zGCL3J/lyYGIokaL7A=;
 b=A6Yyoy1xlryfdaBIUCCHulMJbReRCiXGXGeYN3iykcMQLJhTnhhLsZ+tsOrmgiR1WV
 jkZWTS9LDlrq4FCMG9a6yyXrGtA+S1aGKqLWr0m0JGJxXplGzqvptywSKmk0XnugfAZ6
 hVWQKjmjryZEiXoMNi5LVcuPui4h5xaTqK9syz02FgOhtZz21wbVCJTYjGmBj/s+zXcO
 zqmKwk2ptznKq4qqSNOA5vT1Fh4cBNwt16p2G11hebD39Qb6reHIwNBB762nEiYvvnzT
 o+T89iFj63vDXiOY2NfCdDaHJkP/y/IFQVq/T+k4keM08H7mpCxDJPDxqzBdP1Uv5tQg
 BZbQ==
X-Gm-Message-State: AOAM532rPvHP1KuicuXos7kEfmmH7Ijo9xxawj/h5Q3VdnEA62jXadzR
 cWndMy1hubwWPiDTSxs0pk9Suq1UKLV6I6j9WLQ=
X-Google-Smtp-Source: ABdhPJzsqCAiHDNGui6Z2KWWjHmlWbgZGz+LHfGrmnBiDgS6/PShgAwYAnhcF4P6R1KElcBa04zVu8ZrPs6SyBsE4kQ=
X-Received: by 2002:a05:651c:a0f:: with SMTP id
 k15mr26367935ljq.231.1632228479988; 
 Tue, 21 Sep 2021 05:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210910130941.1740182-1-maxime@cerno.tech>
 <20210910130941.1740182-2-maxime@cerno.tech>
In-Reply-To: <20210910130941.1740182-2-maxime@cerno.tech>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 21 Sep 2021 14:47:49 +0200
Message-ID: <CAMeQTsaFdqVQt5+FhWL1VeBpLvpCPgKX6R5tEc_jzAFVRWH5Vg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/bridge: Add a function to abstract away panels
To: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Sep 10, 2021 at 3:10 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Display drivers so far need to have a lot of boilerplate to first
> retrieve either the panel or bridge that they are connected to using
> drm_of_find_panel_or_bridge(), and then either deal with each with ad-hoc
> functions or create a drm panel bridge through drm_panel_bridge_add.
>
> In order to reduce the boilerplate and hopefully create a path of least
> resistance towards using the DRM panel bridge layer, let's create the
> function devm_drm_of_get_next to reduce that boilerplate.

Hi Maxime,

This patch creates a dependency error for me:

depmod: ERROR: Cycle detected: drm_kms_helper -> drm -> drm_kms_helper
depmod: ERROR: Cycle detected: cec
depmod: ERROR: Found 2 modules in dependency cycles!

Cheers
Patrik

>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_bridge.c | 42 ++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/drm_of.c     |  3 +++
>  include/drm/drm_bridge.h     |  2 ++
>  3 files changed, 43 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index a8ed66751c2d..10ddca4638b0 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_encoder.h>
> +#include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>
>  #include "drm_crtc_internal.h"
> @@ -51,10 +52,8 @@
>   *
>   * Display drivers are responsible for linking encoders with the first bridge
>   * in the chains. This is done by acquiring the appropriate bridge with
> - * of_drm_find_bridge() or drm_of_find_panel_or_bridge(), or creating it for a
> - * panel with drm_panel_bridge_add_typed() (or the managed version
> - * devm_drm_panel_bridge_add_typed()). Once acquired, the bridge shall be
> - * attached to the encoder with a call to drm_bridge_attach().
> + * devm_drm_of_get_bridge(). Once acquired, the bridge shall be attached to the
> + * encoder with a call to drm_bridge_attach().
>   *
>   * Bridges are responsible for linking themselves with the next bridge in the
>   * chain, if any. This is done the same way as for encoders, with the call to
> @@ -1233,6 +1232,41 @@ struct drm_bridge *of_drm_find_bridge(struct device_node *np)
>         return NULL;
>  }
>  EXPORT_SYMBOL(of_drm_find_bridge);
> +
> +/**
> + * devm_drm_of_get_bridge - Return next bridge in the chain
> + * @dev: device to tie the bridge lifetime to
> + * @np: device tree node containing encoder output ports
> + * @port: port in the device tree node
> + * @endpoint: endpoint in the device tree node
> + *
> + * Given a DT node's port and endpoint number, finds the connected node
> + * and returns the associated bridge if any, or creates and returns a
> + * drm panel bridge instance if a panel is connected.
> + *
> + * Returns a pointer to the bridge if successful, or an error pointer
> + * otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
> +                                         struct device_node *np,
> +                                         unsigned int port,
> +                                         unsigned int endpoint)
> +{
> +       struct drm_bridge *bridge;
> +       struct drm_panel *panel;
> +       int ret;
> +
> +       ret = drm_of_find_panel_or_bridge(np, port, endpoint,
> +                                         &panel, &bridge);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       if (panel)
> +               bridge = devm_drm_panel_bridge_add(dev, panel);
> +
> +       return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_get_bridge);
>  #endif
>
>  MODULE_AUTHOR("Ajay Kumar <ajaykumar.rs@samsung.com>");
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 997b8827fed2..37c34146eea8 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -231,6 +231,9 @@ EXPORT_SYMBOL_GPL(drm_of_encoder_active_endpoint);
>   * return either the associated struct drm_panel or drm_bridge device. Either
>   * @panel or @bridge must not be NULL.
>   *
> + * This function is deprecated and should not be used in new drivers. Use
> + * devm_drm_of_get_bridge() instead.
> + *
>   * Returns zero if successful, or one of the standard error codes if it fails.
>   */
>  int drm_of_find_panel_or_bridge(const struct device_node *np,
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 46bdfa48c413..f70c88ca96ef 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -911,6 +911,8 @@ struct drm_bridge *devm_drm_panel_bridge_add(struct device *dev,
>  struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>                                                    struct drm_panel *panel,
>                                                    u32 connector_type);
> +struct drm_bridge *devm_drm_of_get_bridge(struct device *dev, struct device_node *node,
> +                                       unsigned int port, unsigned int endpoint);
>  struct drm_connector *drm_panel_bridge_connector(struct drm_bridge *bridge);
>  #endif
>
> --
> 2.31.1
>
