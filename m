Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C7C43A3E5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 22:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2846F6E210;
	Mon, 25 Oct 2021 20:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703186E210
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 20:05:26 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id o204so17144656oih.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 13:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Kddf3rhfd2mwlt1ps9zH7TAMJvvrILGOEKiITtIiEjs=;
 b=kJeIWrgEG/oZGBiTmLDdFEpuphATvas4SUpqd0y0do4c9tRg/5a9GNwNHAj3D1QhWp
 DT5KAWmhJv+zwyR7t+mGhqeLuZgHmFQJqKh/2n1/FpBo0BwohEZmlX/D1k2ianZ0C31G
 FzR0UDFCyNPHV20tBPlYfsTaWx9JdT3mC5nCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Kddf3rhfd2mwlt1ps9zH7TAMJvvrILGOEKiITtIiEjs=;
 b=OPYpazdB+2j571Pvd+8B864xbcX1Q713mWVVbc+vPFlXqdk6u8N+AJKkwk0bsIy0zs
 XCvgDf34wMAJ31734BudsnyoZukjMLfg2PTf0vvp0ICh+k1TO0QvFVfTUmaLY4kidMq1
 i0i6BVfvjqPmrPzY0OqTedcLqGBDWK5knXTXaicuqfFLLDkrT+rhp16bh+N+3atnJvn0
 AWJbofErbN2KlnK1Jj9kCYwSCmFZSKQxsVVvqMr/Z4e7TpgPSd3vcx9pyX6kLj6IEzZo
 Tnh4D1taqFQngoKRpbdrmt054a9n0LnpOCpirX26ulveDA1UlfCrJ4TOEKj+CZm98rfL
 pcag==
X-Gm-Message-State: AOAM530TjuS/mrmfaEePajRDJqkIPpnzAbEk37+ZuHKlpxkZF6hWrDI2
 PgUBAaqVPWrqXDl1o3PXbWckvJ3OxaGF+ksI1GQipA==
X-Google-Smtp-Source: ABdhPJz+slegngwS5VAKi2tbkWLbDE01t2nraU7usD8sV16bb8iycvt49rJ/mKwFF7SiP139E1i+oj7ujDGAHzsyzXY=
X-Received: by 2002:a05:6808:1d9:: with SMTP id
 x25mr12862977oic.64.1635192325533; 
 Mon, 25 Oct 2021 13:05:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Oct 2021 13:05:25 -0700
MIME-Version: 1.0
In-Reply-To: <20211021140552.v2.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
References: <20211021140552.v2.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 25 Oct 2021 13:05:25 -0700
Message-ID: <CAE-0n50zgG963E-xPA3H7NJd9=iAQaV5YYdrN9zHPsTj93TE-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Cc: dianders@chromium.org, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
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

Quoting Philip Chen (2021-10-21 14:05:59)
> Fit ps8640 driver into runtime power management framework:
>
> First, break _poweron() to 3 parts: (1) turn on power and wait for
> ps8640's internal MCU to finish init (2) check panel HPD (which is
> proxied by GPIO9) (3) the other configs. As runtime_resume() can be
> called before panel is powered, we only add (1) to _resume() and leave
> (2)(3) to _pre_enable(). We also add (2) to _aux_transfer() as we want
> to ensure panel HPD is asserted before we start AUX CH transactions.
>
> The original driver has a mysterious delay of 50 ms between (2) and
> (3). Since Parade's support can't explain what the delay is for, and we
> don't see removing the delay break any boards at hand, remove the dalay

s/dalay/delay/

> to fit into this driver change.
>
> Besides, rename "powered" to "pre_enabled" and don't check for it in

"Besides" doesn't make sense here. Probably "In addition" or "Also"?

> the pm_runtime calls. The pm_runtime calls are already refcounted so
> there's no reason to check there. The other user of "powered",
> _get_edid(), only cares if pre_enable() has already been called.
>
> Lastly, change some existing DRM_...() logging to dev_...() along the
> way, since DRM_...() seem to be deprecated in [1].
>
> [1] https://patchwork.freedesktop.org/patch/454760/
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 3aaa90913bf8..220ca3b03d24 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -148,6 +149,25 @@ static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
>         return container_of(aux, struct ps8640, aux);
>  }
>
> +static void ps8640_ensure_hpd(struct ps8640 *ps_bridge)
> +{
> +       struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
> +       struct device *dev = &ps_bridge->page[PAGE2_TOP_CNTL]->dev;
> +       int status;
> +       int ret;
> +
> +       /*
> +        * Apparently something about the firmware in the chip signals that
> +        * HPD goes high by reporting GPIO9 as high (even though HPD isn't
> +        * actually connected to GPIO9).
> +        */
> +       ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> +                               status & PS_GPIO9, 20 * 1000, 200 * 1000);
> +
> +       if (ret < 0)
> +               dev_warn(dev, "HPD didn't go high: %d", ret);

Missing newline on the print message.

> +}
> +
>  static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>                                    struct drm_dp_aux_msg *msg)
>  {
> @@ -171,6 +191,9 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>         if (msg->address & ~SWAUX_ADDR_MASK)
>                 return -EINVAL;
>
> +       pm_runtime_get_sync(dev);
> +       ps8640_ensure_hpd(ps_bridge);

Shouldn't we bail out of here with an error if we can't ensure hpd?

> +
>         switch (request) {
>         case DP_AUX_NATIVE_WRITE:
>         case DP_AUX_NATIVE_READ:
> @@ -180,14 +203,15 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>         case DP_AUX_I2C_READ:
>                 break;
>         default:
> -               return -EINVAL;
> +               ret = -EINVAL;
> +               goto exit;
>         }
>
>         ret = regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "failed to write PAGE0_AUXCH_CFG3: %d\n",
>                               ret);
> -               return ret;
> +               goto exit;
>         }
>
>         /* Assume it's good */
> @@ -213,7 +237,7 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>                                 DRM_DEV_ERROR(dev,
>                                               "failed to write WDATA: %d\n",
>                                               ret);
> -                               return ret;
> +                               goto exit;
>                         }
>                 }
>         }
> @@ -228,7 +252,7 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>         if (ret) {
>                 DRM_DEV_ERROR(dev, "failed to read PAGE0_SWAUX_STATUS: %d\n",
>                               ret);
> -               return ret;
> +               goto exit;
>         }
>
>         switch (data & SWAUX_STATUS_MASK) {
> @@ -250,9 +274,11 @@ static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
>                 len = data & SWAUX_M_MASK;
>                 break;
>         case SWAUX_STATUS_INVALID:
> -               return -EOPNOTSUPP;
> +               ret = -EOPNOTSUPP;
> +               goto exit;
>         case SWAUX_STATUS_TIMEOUT:
> -               return -ETIMEDOUT;
> +               ret = -ETIMEDOUT;
> +               goto exit;
>         }
>
>         if (len && (request == DP_AUX_NATIVE_READ ||

It may be simpler to understand the diff if the transfer function still
exited the same way and a small wrapper function was put around this to
do the runtime PM operations.


	pm_runtime_get_sync();
	if (ps8640_hpd_asserted())
		ret = ps8640_aux_transfer_msg();
	pm_runtime_mark_last_busy();
	pm_runtime_put_autosuspend();

	return ret;


> @@ -587,6 +611,13 @@ static int ps8640_probe(struct i2c_client *client)
>         ps_bridge->aux.transfer = ps8640_aux_transfer;
>         drm_dp_aux_init(&ps_bridge->aux);
>
> +       pm_runtime_enable(dev);
> +       pm_runtime_set_autosuspend_delay(dev, 500);

Presumably 500 is chosen because the message transfer speed is faster
than that? Can we get a comment in the code for that?

> +       pm_runtime_use_autosuspend(dev);
> +       ret = devm_add_action_or_reset(dev, ps8640_runtime_disable, dev);
> +       if (ret)
> +               return ret;
> +
>         drm_bridge_add(&ps_bridge->bridge);
>
>         return 0;
