Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9D7579D73
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 14:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BA910F38E;
	Tue, 19 Jul 2022 12:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD7E10EBF2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 12:51:28 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id m8so5989492edd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PjpROpPnKk6Lr3/t3VDn36SQQ/aHzCLJ5byWA24Lk8o=;
 b=yRZkNSMxNz37/W+r3b4APYWY1M+oIKBQt2jkFBd3J/Kfr7ztFN/At/79ys5dYVz+s3
 n7L31oA0D3YceRnMFN5lFjzIAlLJ8V0o31C4lbOYihABnalOijFz30zNieT0Mu8UjXG/
 rVlRKEXeQNyRRBUXv5hnwLXUh82PMTRWSPKOxRBxa883/xYeh3x9zEwzkhCxkhnyJFHE
 xONRKdcxo/kimjIjjWdkOrlwbFs5dtzjCBSGJf/68XuDGQTblHuuclHQNJaFl1AXNVwG
 Y06kPtbqQCbYj4TDgELiO4ibhkMmtqij57Zgq0ZCNJxuHHwXRs8I4OujbbvUjgyhvRUI
 ISIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PjpROpPnKk6Lr3/t3VDn36SQQ/aHzCLJ5byWA24Lk8o=;
 b=MjBynmb9pOW3hksyH/QlxvtaJnFUpqJ7bPuZ9yWZuH1PxL8eRmWQ4y+Y6uEYMmqwLL
 //+B9MlhM5H2Vf2Mas1fWcAXofG8tssCs+DbiCy0f2n+jZCcwIZ/tB4E8bHUwlvvVijL
 vxofKiTDP58kAiNGq+n5EitBLpG9BeLu32JvCBwqUGntszcduhw/TFXXWcX2DEuxUJOP
 8CxKVm6JhLQ+6vZOQ7RPa+7EcA9Psq5kxer26JSl33TdZE6r1sLbWKSwyGJSgNGluOVe
 pIhx1cID3bTkLYdR5G2usWgiA3CpoqLT4lWIVfZ/dJego0S17Atn59hJ/zKgeonZGpTD
 VirA==
X-Gm-Message-State: AJIora+sZ+0npJf6ZL4BZ61ZISNLZ1G9VEQAeC8SfUghi4bLV5CMtN03
 e4tHKLCeZf27aj5oWpEXxeQVap3aSWxhBWaNf/0HlA==
X-Google-Smtp-Source: AGRyM1stflnsaWPkjWc5UZIHqWEGRf9YCgXv808aGCEexzbIN6C7aTgcl6HZ0/VTYxbDfC53LEe5nuaFldeOTMSONXE=
X-Received: by 2002:a05:6402:5245:b0:43a:a024:82cc with SMTP id
 t5-20020a056402524500b0043aa02482ccmr43704138edd.56.1658235087121; Tue, 19
 Jul 2022 05:51:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220719065447.1080817-1-windhl@126.com>
In-Reply-To: <20220719065447.1080817-1-windhl@126.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 19 Jul 2022 14:51:16 +0200
Message-ID: <CAG3jFyuty+5=PU69My+=mzOXZtrX7hiokCawgOfPP=HxEV0--w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: anx7625: Fix refcount bug in
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Jul 2022 at 08:55, Liang He <windhl@126.com> wrote:
>
> In anx7625_parse_dt(), 'pdata->mipi_host_node' will be assigned a
> new reference with of_graph_get_remote_node() which will increase
> the refcount of the object, correspondingly, we should call
> of_node_put() for the old reference stored in the 'pdata->mipi_host_node'.
>
> Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
>
>  v2: (1) rebase with drm-misc-next advised by Robert Foss
>      (2) use proper title
>      (3) remove the v1's second bug ('ep0'), fixed recently
>  v1: https://lore.kernel.org/all/20220707012330.305646-1-windhl@126.com/
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index d1f1d525aeb6..79fc7a50b497 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1642,6 +1642,7 @@ static int anx7625_parse_dt(struct device *dev,
>         anx7625_get_swing_setting(dev, pdata);
>
>         pdata->is_dpi = 0; /* default dsi mode */
> +       of_node_put(pdata->mipi_host_node);
>         pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
>         if (!pdata->mipi_host_node) {
>                 DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
> --
> 2.25.1
>

This series has my r-b.
Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied series to drm-misc-next.
