Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E28CD578150
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 13:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDA5AB1B2;
	Mon, 18 Jul 2022 11:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B206AA2C7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 11:54:30 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id b11so20697142eju.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 04:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yy23u9hdBxqpE2zdmxinC9T2OubStOce3dTgCyQtSDk=;
 b=Ela3cBvy52pHkTn5NqBhXQks5K8A97NX2hpK1lwbbiS6xXswFCCfilo9GpyGD/12CU
 Fl1zEcx7HzcJiafF5fMuPFPgwpH8k2mH20SP/HZ46FWScwOCPKgrzSHhgh/htvFC374c
 BN9rr5aph9RidHc2OQDgMt1JeoRXy1aRMsN3rYLZff85yYM7zPl7MgSP0EnJoIM6qtQl
 m9FnLLbwbxVPHqpYEqdkp6QpyDD8NsDS8MN/MKGewsCllbSntuqvZxahuqMMQiSMTnGW
 /Br68otPLd8dZWqImtwHGP1qrEGZdPjQkM24Y4fMzFt5FUwPW5ls5IeRzz02/yaTZXUe
 FRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yy23u9hdBxqpE2zdmxinC9T2OubStOce3dTgCyQtSDk=;
 b=MamuDbvuNGaWUGntbkgshIt9rQGi4ugX9ClwB2Ag/aylQExUQcQGGX1OS2azUX2UVy
 yUulJ3DSYGiXwX4Z3rNwPxV7sl8xX6NAUbpreV39UEomXEnm1rrvkFC8N24p0Kyhdofi
 ueO/UnoZCqSxd40hSK+L9yojC/3Lct+tCuQIebPeC0KLoYfDnnJ2RFQXPwFfuCW4pxp0
 xxiYt2O4AJlqVBZHH+vmvnXxMZl59/rnw+AHTowXsR4tUhSoEfE2Kcf4qI7KNHQ5EfzF
 MM27nh2bEvkP/deUll4sh55vevkJcM6iw7eKqSkEE915OXuTPgSE0hR4bKg2s8GisQUh
 YUuw==
X-Gm-Message-State: AJIora+WvO1MexHAbpaqmpGjZaU79XHZWXis1zKiETtQXj1mCo8XiiDi
 CTeh9Bai0csYvb26NWnZkG6Y3wqLlZYo0wllYAH6xw==
X-Google-Smtp-Source: AGRyM1sKDotW1dZisB9wPPN1n+tf2a7ibcGYGFFtuWv8evaJGgEj4OHz0SrzBXauMTyvkx4LxMCl+qidJnmM8qGVhmE=
X-Received: by 2002:a17:907:d22:b0:72b:9b4b:78a9 with SMTP id
 gn34-20020a1709070d2200b0072b9b4b78a9mr24872646ejc.626.1658145268994; Mon, 18
 Jul 2022 04:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220707012330.305646-1-windhl@126.com>
In-Reply-To: <20220707012330.305646-1-windhl@126.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 18 Jul 2022 13:54:18 +0200
Message-ID: <CAG3jFysYDVh2wk4VXePfZ_pwPvoa0EgP3Lv3pXXF6eu8W-Yt1g@mail.gmail.com>
Subject: Re: [PATCH] drm:bridge:analogix: Fix refcount bugs in
 anx7625_parse_dt()
To: Liang He <windhl@126.com>
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
Cc: andrzej.hajda@intel.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Liang,


On Thu, 7 Jul 2022 at 03:25, Liang He <windhl@126.com> wrote:
>
> There are two refcount bugs in this funcion:
>
> BUG-1: 'pdata->mipi_host_node' will be assigned a new reference with
> of_graph_get_remote_node() which will increase the refcount of the
> object, correspondingly, we should call of_node_put() for the old
> reference stored in the 'pdata->mipi_host_node'.
>
> BUG-2: of_graph_get_endpoint_by_regs() will also increase the refcount
> of the object and its new reference will be assigned to local 'ep0', so
> there should be a of_node_put() when 'ep0' is not used anymore.
>
> Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 53a5da6c49dd..f39b9be19eaf 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1624,6 +1624,7 @@ static int anx7625_parse_dt(struct device *dev,
>         anx7625_get_swing_setting(dev, pdata);
>
>         pdata->is_dpi = 1; /* default dpi mode */
> +       of_node_put(pdata->mipi_host_node);
>         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
>         if (!pdata->mipi_host_node) {
>                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> @@ -1638,6 +1639,7 @@ static int anx7625_parse_dt(struct device *dev,
>                         bus_type = 0;
>
>                 mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
> +               of_node_put(ep0);
>         }
>
>         if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
> --
> 2.25.1
>

This patch does not apply on drm-misc-next, could you please rebase it
and send a v2?

Rob.
