Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE904627713
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695DC10E271;
	Mon, 14 Nov 2022 08:07:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1D910E297
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:07:08 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id b29so10267211pfp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 00:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4t/BoIsCViJGhjVIcNUi0sYe9H44xsAz/HtONZdW/v4=;
 b=VHNrJTq150PaoEG9nXYxs2RCJKQ2I9wNgzT/MRyXy6ix8bazIFcWEtNsUfbyDuloPx
 +CWl39jC8fRHczsUUIFYm+8RNk0/ytlwXZx1sCruqNW4hSnufbevbtwRVhE2cl3bTv1G
 KldHBcg5XCY/s7SQu+N4Zz3q3N7ct5CiTty4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4t/BoIsCViJGhjVIcNUi0sYe9H44xsAz/HtONZdW/v4=;
 b=CpYK++tklfCw4MmUw0Kh0lVYgaiDOQQhOAoJTuChdV0wzY25p6x2FFbt3Q2ENRkrd+
 O0YsbLnfywynBu0yCcHMj/0MMrNswdShLM7/lRQr77m9UnCb4GiqPXegTRx8qZc+Hsfj
 1XP7IwfsZdg4qqDAlwFH5AJyRrggiFBsWokegMVsw6A6uRQjBeGJeqNJyjHsA1YXXlhO
 1svhDSP7k46w4lRWpfrNvynuVOhV0oQ4SoA9djwKc5KOwBJMCCUgXKT3k80rdIth5Hna
 +4e0bOUYTM4TokT3HaB6FUHc+64b+Be8F/+oxB0UMYrcxFGULAN01GeDIb/59p7nY/ck
 I/ww==
X-Gm-Message-State: ANoB5pk/H50PaCohl5pkXrogPWxsmQ4cCIiCn5iOe1BgQVHVI/Vo8Ns0
 rubbqQg93qxfxTCqS4zZ2Yx5X/Uv+JUHA4VnC3dqCA==
X-Google-Smtp-Source: AA0mqf4aJRNb7lgu1jDUZ6VRUvPaQjM/np33yOCyyKTRuWTMAV48uov2RojHXaeQlMhaWZki3iPd6jpPIH0arKCkCoM=
X-Received: by 2002:a65:4984:0:b0:470:8e:6003 with SMTP id
 r4-20020a654984000000b00470008e6003mr11017815pgs.19.1668413228425; 
 Mon, 14 Nov 2022 00:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20221101112009.1067681-1-hsinyi@chromium.org>
In-Reply-To: <20221101112009.1067681-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 14 Nov 2022 16:06:42 +0800
Message-ID: <CAJMQK-h-wu-eU1O6+oSxuxz6YPL16WV4GXQxrbXGfY=OfaRUnA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: handle HDCP request
To: Robert Foss <robert.foss@linaro.org>, Allen Chen <allen.chen@ite.com.tw>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pin-yen Lin <treapking@chromium.org>, Hermes Wu <hermes.wu@ite.com.tw>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022 at 7:20 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> it6505 supports HDCP 1.3, but current implementation lacks the update of
> HDCP status through drm_hdcp_update_content_protection(). it6505 default
> enables the HDCP. If user set it to undesired then the driver will stop
> HDCP.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
Move this patch into the series to register HDCP property:
https://lore.kernel.org/lkml/20221114080405.2426999-1-hsinyi@chromium.org/

>  drivers/gpu/drm/bridge/ite-it6505.c | 54 +++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index b929fc766e243..65c6f932cae25 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -423,6 +423,7 @@ struct it6505 {
>         struct extcon_dev *extcon;
>         struct work_struct extcon_wq;
>         int extcon_state;
> +       struct drm_connector *connector;
>         enum drm_connector_status connector_status;
>         enum link_train_status link_state;
>         struct work_struct link_works;
> @@ -2399,6 +2400,14 @@ static void it6505_irq_hdcp_done(struct it6505 *it6505)
>
>         DRM_DEV_DEBUG_DRIVER(dev, "hdcp done interrupt");
>         it6505->hdcp_status = HDCP_AUTH_DONE;
> +       if (it6505->connector) {
> +               struct drm_device *drm_dev = it6505->connector->dev;
> +
> +               drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
> +               drm_hdcp_update_content_protection(it6505->connector,
> +                                                  DRM_MODE_CONTENT_PROTECTION_ENABLED);
> +               drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
> +       }
>         it6505_show_hdcp_info(it6505);
>  }
>
> @@ -2931,6 +2940,7 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
>         if (WARN_ON(!connector))
>                 return;
>
> +       it6505->connector = connector;
>         conn_state = drm_atomic_get_new_connector_state(state, connector);
>
>         if (WARN_ON(!conn_state))
> @@ -2974,6 +2984,7 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
>
>         DRM_DEV_DEBUG_DRIVER(dev, "start");
>
> +       it6505->connector = NULL;
>         if (it6505->powered) {
>                 it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
>                                              DP_SET_POWER_D3);
> @@ -3028,6 +3039,48 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
>         return edid;
>  }
>
> +static int it6505_connector_atomic_check(struct it6505 *it6505,
> +                                        struct drm_connector_state *state)
> +{
> +       struct device *dev = &it6505->client->dev;
> +       int cp = state->content_protection;
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "hdcp connector state:%d, curr hdcp state:%d",
> +                            cp, it6505->hdcp_status);
> +
> +       if (!it6505->hdcp_desired) {
> +               DRM_DEV_DEBUG_DRIVER(dev, "sink not support hdcp");
> +               return 0;
> +       }
> +
> +       if (it6505->hdcp_status == HDCP_AUTH_GOING)
> +               return -EINVAL;
> +
> +       if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> +               if (it6505->hdcp_status == HDCP_AUTH_DONE)
> +                       it6505_stop_hdcp(it6505);
> +       } else if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> +               if (it6505->hdcp_status == HDCP_AUTH_IDLE &&
> +                   it6505->link_state == LINK_OK)
> +                       it6505_start_hdcp(it6505);
> +       } else {
> +               DRM_DEV_DEBUG_DRIVER(dev, "invalid to set hdcp enabled");
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int it6505_bridge_atomic_check(struct drm_bridge *bridge,
> +                                     struct drm_bridge_state *bridge_state,
> +                                     struct drm_crtc_state *crtc_state,
> +                                     struct drm_connector_state *conn_state)
> +{
> +       struct it6505 *it6505 = bridge_to_it6505(bridge);
> +
> +       return it6505_connector_atomic_check(it6505, conn_state);
> +}
> +
>  static const struct drm_bridge_funcs it6505_bridge_funcs = {
>         .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> @@ -3035,6 +3088,7 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
>         .attach = it6505_bridge_attach,
>         .detach = it6505_bridge_detach,
>         .mode_valid = it6505_bridge_mode_valid,
> +       .atomic_check = it6505_bridge_atomic_check,
>         .atomic_enable = it6505_bridge_atomic_enable,
>         .atomic_disable = it6505_bridge_atomic_disable,
>         .atomic_pre_enable = it6505_bridge_atomic_pre_enable,
> --
> 2.38.0.135.g90850a2211-goog
>
