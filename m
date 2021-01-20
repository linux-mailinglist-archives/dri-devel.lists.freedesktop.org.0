Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4262FD4BF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 17:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814EF89EA3;
	Wed, 20 Jan 2021 16:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EE889EA3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 16:03:33 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id v1so5761090ott.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 08:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fJCBiwBO/xEgO9jr3aVUv1rBDTi8ytSoHuAN7ss9+FQ=;
 b=SaNPNcS6Z2xbfYNvLJu3j5/JXjEfVIiaD4P4PHnskHPlvUSY3LWnLXUVn3VF1lKqN5
 G/G8yyGUi02V6B9yUNwvIXxbxLSqAD7RAM34brWGTXH/z+dw244szhVmhINlaIqRw9U+
 z6npoCi0zz7cTE+fNxUJSK1uClMI4ipS1yPIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fJCBiwBO/xEgO9jr3aVUv1rBDTi8ytSoHuAN7ss9+FQ=;
 b=rEgXg6HMhlSCbqpdedgmZREjtiJ/1N/LyBob9wMFl8eerL1DL1wJYcOcO4GKrHR3BD
 PcpWowSRAqzDcpTJGcb6aPdbyk+U0VW0tS0qAa+PrTdDkzWw4oA/czDPW97WYyBTyXFD
 OXd/92PGhOpsuTF348/symVUPC9SGGAbVcJKCW4/0KtGHWDHHyapz7Z07a6RuJvOOiYg
 7hq+lKNpHYc6BF1tKUYHRbESZjG+ppqGxylS4XZcLBgXTw8joyIIYiBEfRgvB6XFggPn
 rpkMJwDiS7iupJrSOyyIPNzPXGhmofJD8LBeSGYFFyIAT25OMoB64IGdpg9J9qIr6jJS
 zusg==
X-Gm-Message-State: AOAM530VPTj3BNZ9feNgVWG9p5pPTn/zOfWLlm0UbnqkNZFVC8eNA0F/
 DTfzXv9Ya1drR6L+/jG7S57fqmXN5N75fWEo5IMsL2WBsZ4=
X-Google-Smtp-Source: ABdhPJyWdj1BXwHHDK/NwUPAiGcQF/1RUz7Tu4QQIHGq8FtBjL5jH4ywkwS00QWZajtNaqewC5R8crwbLX0gY5WWKhI=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr7575766otb.281.1611158613038; 
 Wed, 20 Jan 2021 08:03:33 -0800 (PST)
MIME-Version: 1.0
References: <20210120123535.40226-1-paul@crapouillou.net>
 <20210120123535.40226-2-paul@crapouillou.net>
In-Reply-To: <20210120123535.40226-2-paul@crapouillou.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 20 Jan 2021 17:03:22 +0100
Message-ID: <CAKMK7uGGDe8bZpeTnyCkF7g_2gC1nixOzWe4FWYXPRWi-q5y7A@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm: bridge/panel: Cleanup connector on bridge
 detach
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, od@zcrc.me,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 stable <stable@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 1:35 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> If we don't call drm_connector_cleanup() manually in
> panel_bridge_detach(), the connector will be cleaned up with the other
> DRM objects in the call to drm_mode_config_cleanup(). However, since our
> drm_connector is devm-allocated, by the time drm_mode_config_cleanup()
> will be called, our connector will be long gone. Therefore, the
> connector must be cleaned up when the bridge is detached to avoid
> use-after-free conditions.

For -fixes this sounds ok, but for -next I think switching to drmm_
would be much better.
-Daniel

> v2: Cleanup connector only if it was created
>
> Fixes: 13dfc0540a57 ("drm/bridge: Refactor out the panel wrapper from the lvds-encoder bridge.")
> Cc: <stable@vger.kernel.org> # 4.12+
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/panel.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 0ddc37551194..df86b0ee0549 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -87,6 +87,12 @@ static int panel_bridge_attach(struct drm_bridge *bridge,
>
>  static void panel_bridge_detach(struct drm_bridge *bridge)
>  {
> +       struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
> +       struct drm_connector *connector = &panel_bridge->connector;
> +
> +       /* Cleanup the connector if we know it was initialized */
> +       if (!!panel_bridge->connector.dev)
> +               drm_connector_cleanup(connector);
>  }
>
>  static void panel_bridge_pre_enable(struct drm_bridge *bridge)
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
