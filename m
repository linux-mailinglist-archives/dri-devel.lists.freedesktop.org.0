Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C933C3D1F59
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 09:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2656E82C;
	Thu, 22 Jul 2021 07:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435646E82C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:54:06 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h2so5655779edt.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 00:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=heGQ4sEU/tcxYGYCH9nVmqIF3VXGFcDHuA5EFudXLOI=;
 b=buD/WBZbanBwdOA+/TO17KV/J3rYmYlKv1VLdOZDhuWbAuHHYJaHq/0xYZdYRCwvO6
 t+CpHyfb+cKkK0Lxo8VWaUu4WOgt5ymWoVG8qFP0IMXa2ViCt9NE53JGQRyUsyEFwo5f
 4rwshKRq2sOmOx9wAuOhfynJ33Tu0/Bm3MJ04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=heGQ4sEU/tcxYGYCH9nVmqIF3VXGFcDHuA5EFudXLOI=;
 b=HwFdZXnQBZ6XqMbnrek5S6LLnW+APReamJYXpOknkyx6F5aNXTAsCZdQgrbMufaUhY
 rUVjZb4YuaxgSn75RPvlMZ0c6wpldWP0NSHyj/Lcx9W9wVZbDb+6uWyAE1CqnG4138EY
 3IGBu0B3K5Gme/EYgOe17+kiyS5BtVon1FF6QviaCiShDZ0IJHQ55yCU/LyhC0Q+fSJa
 w3KkEQThAiOJjYop1q/Z1SamPXUawATyYIJw4QiRXtWMpyr9Y5YkAidK/edRdtMHxgIT
 MCQlXJi6ai75+Rxk+B5c8jxdoh6BLQ4+cNnSxCkrzaTN/ooEwlo/yzWoum9eUNu83Qu8
 1Z+A==
X-Gm-Message-State: AOAM531Vp/I5IFBEX9ivI2+tXAGvQ0MZ8l/wICtP8dIJocb6OeeizDI0
 Ch5ZdFs+LuzL+aA33CFdlVRsCn9BUDdKPznOXk19eA==
X-Google-Smtp-Source: ABdhPJywGnLozfLI+UYKok/2rOKWLwbeYIpdC4Lmv6hjc/+htpEJDm1YdNGlgyx/wnehdHFfXEzTifwl480+4uuSqTo=
X-Received: by 2002:a05:6402:144f:: with SMTP id
 d15mr52935243edx.27.1626940444767; 
 Thu, 22 Jul 2021 00:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-6-maxime@cerno.tech>
In-Reply-To: <20210720134525.563936-6-maxime@cerno.tech>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 22 Jul 2021 13:23:53 +0530
Message-ID: <CAMty3ZAjxr6YCWyY_A3MGJAVPTHASQde=BQFaCfr+wWkHzO6nA@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/panel: Create attach and detach callbacks
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Tue, Jul 20, 2021 at 7:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> In order to make the probe order expectation more consistent between
> bridges, let's create attach and detach hooks for the panels as well to
> match what is there for bridges.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_panel.c | 20 ++++++++++++++++++++
>  include/drm/drm_panel.h     |  6 ++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..23bca798a2f3 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -223,6 +223,26 @@ int drm_panel_get_modes(struct drm_panel *panel,
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>
> +int drm_panel_attach(struct drm_panel *panel)
> +{
> +       if (!panel)
> +               return -EINVAL;
> +
> +       if (panel->funcs && panel->funcs->attach)
> +               return panel->funcs->attach(panel);
> +
> +       return -EOPNOTSUPP;

Most of the panel drivers won't require panel attach/detach API's so
we need to handle those cases as well if we didn't already.

Thanks,
Jagan.
