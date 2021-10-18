Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441C432895
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 22:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378E76EA63;
	Mon, 18 Oct 2021 20:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4596EA63
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 20:43:59 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id k3so16261301ilu.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 13:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qi8NOFsLDDab/yOpN0XP104qJcqwkCAnAmt6gilG+5I=;
 b=aciretGC6a6ALhm0FgbvurjyzW+NP25atSOa2ypM1Tu3vG/GPjqL3nTovQyoM1Mq7p
 zYtqmKvmD/GVQ64+KAfuiUJogEVeMnqVVfe8v2aYnRwnXKhfKqtZmdKcyw94d5vp4YWa
 DH8wIR0mZ7Ew2wqZBFPO8kwIW31TMM3tiOxMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qi8NOFsLDDab/yOpN0XP104qJcqwkCAnAmt6gilG+5I=;
 b=vf5ClHL7S8oRkD99/ezkqpDISTLxwhiIxi6C+QUtz2UWMmwt42KooFOwyK3yj+zn8V
 MYApzZmK8jHZ8/XbYeUU7Gp4m39dr7PwAtqGbKQoVTnqVXXxxbPGEGrhNNNcOfZMape7
 7fnFly5hVHDkfa3SKNHAaDQXnbjBAZWYP01ZkLVsb3m38nAm3hPxFRrof1hHkvTAJE7W
 IFXah+6zZz+4uy+TbYHUPd17QpD1A4sREcOf3ZE5SzaiW4IwbWNY0+CVvxTEi7Hw6L2Z
 TqGSrU6v7xZ/YZNtGM9SPtjNbQlcJYeuox+LYIthnzrB0/edDeAYdyWPFDlKdOkafQue
 yAAQ==
X-Gm-Message-State: AOAM53167Y+Fucm7SibTjJ3MaWdrLaK0cdTvu7tW+ScYF4AB7a3eULdb
 NJFJAbNtTRJ834Qx19ko000BAuLXLocfaw==
X-Google-Smtp-Source: ABdhPJy34GJ40m8XzoRVXUeIvKyt/mi12ijs4xJ1K6tRMyO9d8eDuOodA4sCfJaqR/PWBfXL8glnFw==
X-Received: by 2002:a05:6e02:1c28:: with SMTP id
 m8mr16113665ilh.23.1634589838686; 
 Mon, 18 Oct 2021 13:43:58 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id y12sm1849550iow.2.2021.10.18.13.43.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 13:43:58 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id w10so16207154ilc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 13:43:57 -0700 (PDT)
X-Received: by 2002:a05:6e02:17ce:: with SMTP id
 z14mr15289996ilu.120.1634589837544; 
 Mon, 18 Oct 2021 13:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211016095644.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
 <20211016095644.2.I44ee57ef73528243acf8f29af8d2416b810e1a9d@changeid>
In-Reply-To: <20211016095644.2.I44ee57ef73528243acf8f29af8d2416b810e1a9d@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Oct 2021 13:43:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XXOY_Rded_j6oysDkZ=e7_Gc1SPKPbkLK2DBdoKHWuKA@mail.gmail.com>
Message-ID: <CAD=FV=XXOY_Rded_j6oysDkZ=e7_Gc1SPKPbkLK2DBdoKHWuKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: parade-ps8640: Populate devices on aux-bus
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
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

Hi,

On Sat, Oct 16, 2021 at 9:57 AM Philip Chen <philipchen@chromium.org> wrote:
>
> Conventionally, panel is listed under the root in the device tree.
> When userland asks for display mode, ps8640 bridge is responsible
> for returning EDID when ps8640_bridge_get_edid() is called.
>
> Now enable a new option of listing the panel under "aux-bus" of ps8640
> bridge node in the device tree. In this case, panel driver can retrieve
> EDID by triggering AUX transactions, without ps8640_bridge_get_edid()
> calls at all.
>
> To prevent the "old" and "new" options from interfering with each
> other's logic flow, disable DRM_BRIDGE_OP_EDID when the new option
> is taken.
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 52 ++++++++++++++++++++------
>  1 file changed, 40 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index acfe1bf0f936..98884f799ea8 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -14,6 +14,7 @@
>  #include <linux/regulator/consumer.h>
>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_dp_aux_bus.h>

You need a `select DRM_DP_AUX_BUS` in the Kconfig to avoid the errors
that the build robot found for you.


>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
> @@ -149,6 +150,24 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
>         return container_of(aux, struct ps8640, aux);
>  }
>
> +static bool ps8640_of_panel_on_aux_bus(struct device *dev)
> +{
> +       struct device_node *bus, *panel;
> +
> +       if (!dev->of_node)
> +               return false;

You probably don't need the above check. I think things would be
pretty broken if we didn't have an "of_node".


> +       bus = of_get_child_by_name(dev->of_node, "aux-bus");
> +       if (!bus)
> +               return false;
> +
> +       panel = of_get_child_by_name(bus, "panel");

of_node_put(bus);


> +       if (!panel)
> +               return false;

of_node_put(panel);


Other than the above, this looks reasonable to me.

-Doug
