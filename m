Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBB54B6DC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87808112881;
	Tue, 14 Jun 2022 16:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C4211285B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:55:31 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id n28so12500030edb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2n4i8eqY4azKlLg3WiRJ8pfAqM2SRZqfHTUhf1NIJ/Q=;
 b=YQ+SXa7dguLWLOmieca38RNgGzqczRxmymm74jqQngo/e5lt3ok1VIQIHpWBtjs3pM
 Safa7b6mFKjN0jEoF/7HHSDIKBK2pmgnW3FZqIDJKfLSTrtdPiUTGsiRI5m/m4c73BTA
 4UqKH9kSGKgxkLvOlQW1+YKdqcRJ/ZK07uzSPiVDtH5+KWjwBi7K76F/NaA9UQYp9tks
 ugGBei7M4A/cHEGjpfa3YHKfUKyTk1XYuolHtWvNnefhcLSV0QZOdjNGu+jUbP/Rgx4X
 V24uPXKDbtJ+GIvEOpBUyJLns3LtK4KkLf7OFSSj8gu1V+iMLNfe9B7V7tkf/21XJmfl
 TLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2n4i8eqY4azKlLg3WiRJ8pfAqM2SRZqfHTUhf1NIJ/Q=;
 b=T7GCZbi4o97lJ1xQHmYH3US8q42Mjt5BuqKLFAN6/j0nx3i4pMBKYrbYJgRUFleowy
 cLpX4rTA4GfHCk0TGGdNEH+foPUnoRi2cyRFOmC40MHP/caVPPN+968XB1jthfBQoFgp
 hCbQ8Z72k5RTlRWmTcPRUEXu2q7H1peIy9Rlo7RFyprXY/Qb1BHEphZwbsb9qXP7etpJ
 hHUnF2lEuwYW4K3RqnLObWq0I/+wm6SNMAQnNeTDuVTQ7y35u/1YOQJcGiYXchHQuu84
 5evbCz42AvJDmogNVbmYrmRvO9zPvMFGToCt5LPuAsIxOlhWLf+qDQoZd0QOQhzGL2SX
 GPdw==
X-Gm-Message-State: AOAM53337f9H9CXU0qm8IEkBQg7kR3IEW7TvOZZ70o2u8esHP9KVZI/O
 fBzOWjvHdRJ0XPtEUQZREAXrSIi5SJaCq3IQOtyFWA==
X-Google-Smtp-Source: AGRyM1vUNwbqOqfOe1DlMlhZ+Iw10knEQeUg7rVinsJzvis9DP5UevdnPiL3+ZC6XP/vhUSdPf5hRfT/vmcDK2Xv7uA=
X-Received: by 2002:a05:6402:1857:b0:42d:bcd6:3a88 with SMTP id
 v23-20020a056402185700b0042dbcd63a88mr7376587edy.6.1655225730416; Tue, 14 Jun
 2022 09:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-29-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-29-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:55:14 +0100
Message-ID: <CAPY8ntCKKQxpA54WMZ3ue1S=z6ZXSWrcevNFMwM6Ue1zmR0xzA@mail.gmail.com>
Subject: Re: [PATCH 28/64] drm/vc4: dpi: Protect device resources
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Our current code now mixes some resources whose lifetime are tied to the
> device (clocks, IO mappings, etc.) and some that are tied to the DRM device
> (encoder, bridge).
>
> The device one will be freed at unbind time, but the DRM one will only be
> freed when the last user of the DRM device closes its file handle.
>
> So we end up with a time window during which we can call the encoder hooks,
> but we don't have access to the underlying resources and device.
>
> Let's protect all those sections with drm_dev_enter() and drm_dev_exit() so
> that we bail out if we are during that window.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index 9950761449cf..ea3d20651f43 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -13,6 +13,7 @@
>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -111,9 +112,16 @@ static const struct debugfs_reg32 dpi_regs[] = {
>
>  static void vc4_dpi_encoder_disable(struct drm_encoder *encoder)
>  {
> +       struct drm_device *dev = encoder->dev;
>         struct vc4_dpi *dpi = to_vc4_dpi(encoder);
> +       int idx;
> +
> +       if (!drm_dev_enter(dev, &idx))
> +               return;
>
>         clk_disable_unprepare(dpi->pixel_clock);
> +
> +       drm_dev_exit(idx);
>  }
>
>  static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
> @@ -124,6 +132,7 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>         struct drm_connector_list_iter conn_iter;
>         struct drm_connector *connector = NULL, *connector_scan;
>         u32 dpi_c = DPI_ENABLE | DPI_OUTPUT_ENABLE_MODE;
> +       int idx;
>         int ret;
>
>         /* Look up the connector attached to DPI so we can get the
> @@ -184,6 +193,9 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>         else if (!(mode->flags & DRM_MODE_FLAG_PVSYNC))
>                 dpi_c |= DPI_VSYNC_DISABLE;
>
> +       if (!drm_dev_enter(dev, &idx))
> +               return;
> +
>         DPI_WRITE(DPI_C, dpi_c);
>
>         ret = clk_set_rate(dpi->pixel_clock, mode->clock * 1000);
> @@ -193,6 +205,8 @@ static void vc4_dpi_encoder_enable(struct drm_encoder *encoder)
>         ret = clk_prepare_enable(dpi->pixel_clock);
>         if (ret)
>                 DRM_ERROR("Failed to set clock rate: %d\n", ret);
> +
> +       drm_dev_exit(idx);
>  }
>
>  static enum drm_mode_status vc4_dpi_encoder_mode_valid(struct drm_encoder *encoder,
> --
> 2.36.1
>
