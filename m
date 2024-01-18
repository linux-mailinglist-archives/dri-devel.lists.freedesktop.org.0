Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C8E831201
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 05:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E335E10E125;
	Thu, 18 Jan 2024 04:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2491D10E125
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 04:06:33 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-3606f3b8069so53905175ab.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 20:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1705550732; x=1706155532;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=asTdxJmyObxm04mvJhTbWbygZcovAb5nq215Cf2XjJM=;
 b=Dhf3APGp/FBqkL2eWmlgn7HvR8PH5TBMYidAQDDjeXvTDToLhvQcwLrKexEkiuGOFL
 CgxhSBsfO2aVxDUg52B0zueDNupOWXN0ZZvxCAR+MNH3xsxS9rKkFRMH58KuIcD8tdZl
 OHeqjl/foImQcl8XrVCziJ91bKqOLgV3CoZMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705550732; x=1706155532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=asTdxJmyObxm04mvJhTbWbygZcovAb5nq215Cf2XjJM=;
 b=gqXruGr3bv+n9PU1ZYGaZ4TqkIHAdY9i5tq3ze2r/KCX5D9ZABCiYdrVKFhHSaYsxr
 RmmUz9VACcnh1wbJc8ojfV7CWkQXYfCtIHBxHoCBgBMQgGbKiy25L2do7mxG25mzakdP
 A8YrUwPNPYwjy7kfSCGR7sdoSenwxyPCmKWh3JoiPIxtFngeZmXYNvj01HKUQKPCCggQ
 uWEfqVHXWbu+WacistRNOie9dW+XCzSY4OarNEcbemApGqgkf+2HtBdcgBs4A+ilkoSx
 g8adNX9j9MCBYN29DSbv6VJy3CB57n/fmkftLhYtFWNtJA9B9dwQY6NA4548gVI0pW8m
 XVoA==
X-Gm-Message-State: AOJu0YxEECzpEutxbpHDXCO8M5JYagytyShz5OO4u5Kr9X16SzC6/Sd8
 wl77SnRC7sh3ubSR6MmfKSUPNazCcz/MU/xzWrTCCbY4zgCQFDZnf9oWCgxqBQ166MxTGp08ZQA
 Sq9uI72mgHUUdOItzT49bMoMrm1AxgbjpcouH
X-Google-Smtp-Source: AGHT+IG5ucfMFmFlTrDHrJb/JovTtn4mj3zDimrIQZlTx0qfYqVqP/F+o9BhS85iZH+iMkRwjUKlwP4UzbmWo0pSqPo=
X-Received: by 2002:a92:c10a:0:b0:361:9554:d307 with SMTP id
 p10-20020a92c10a000000b003619554d307mr372847ile.45.1705550732669; Wed, 17 Jan
 2024 20:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20240118015916.2296741-1-hsinyi@chromium.org>
In-Reply-To: <20240118015916.2296741-1-hsinyi@chromium.org>
From: Pin-yen Lin <treapking@chromium.org>
Date: Thu, 18 Jan 2024 12:05:21 +0800
Message-ID: <CAEXTbpc2JUh8-_4sqJEGYXH-4QCuTJgRDviPVwv=3Kz_tfxjow@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Ensure bridge is suspended in
 disable()
To: Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi,

On Thu, Jan 18, 2024 at 9:59=E2=80=AFAM Hsin-Yi Wang <hsinyi@chromium.org> =
wrote:
>
> Similar to commit 26db46bc9c67 ("drm/bridge: parade-ps8640: Ensure bridge
> is suspended in .post_disable()"). Add a mutex to ensure that aux transfe=
r
> won't race with atomic_disable by holding the PM reference and prevent
> the bridge from suspend.
>
> Also we need to use pm_runtime_put_sync_suspend() to suspend the bridge
> instead of idle with pm_runtime_put_sync().
>
> Fixes: 3203e497eb76 ("drm/bridge: anx7625: Synchronously run runtime susp=
end.")
> Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through a=
ux channel")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Tested-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 7 ++++++-
>  drivers/gpu/drm/bridge/analogix/anx7625.h | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/=
bridge/analogix/anx7625.c
> index ef31033439bc..29d91493b101 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1762,6 +1762,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_a=
ux *aux,
>         u8 request =3D msg->request & ~DP_AUX_I2C_MOT;
>         int ret =3D 0;
>
> +       mutex_lock(&ctx->aux_lock);
>         pm_runtime_get_sync(dev);
>         msg->reply =3D 0;
>         switch (request) {
> @@ -1778,6 +1779,7 @@ static ssize_t anx7625_aux_transfer(struct drm_dp_a=
ux *aux,
>                                         msg->size, msg->buffer);
>         pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
> +       mutex_unlock(&ctx->aux_lock);
>
>         return ret;
>  }
> @@ -2474,7 +2476,9 @@ static void anx7625_bridge_atomic_disable(struct dr=
m_bridge *bridge,
>         ctx->connector =3D NULL;
>         anx7625_dp_stop(ctx);
>
> -       pm_runtime_put_sync(dev);
> +       mutex_lock(&ctx->aux_lock);
> +       pm_runtime_put_sync_suspend(dev);
> +       mutex_unlock(&ctx->aux_lock);
>  }
>
>  static enum drm_connector_status
> @@ -2668,6 +2672,7 @@ static int anx7625_i2c_probe(struct i2c_client *cli=
ent)
>
>         mutex_init(&platform->lock);
>         mutex_init(&platform->hdcp_wq_lock);
> +       mutex_init(&platform->aux_lock);
>
>         INIT_DELAYED_WORK(&platform->hdcp_work, hdcp_check_work_func);
>         platform->hdcp_workqueue =3D create_workqueue("hdcp workqueue");
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/=
bridge/analogix/anx7625.h
> index 66ebee7f3d83..39ed35d33836 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.h
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
> @@ -475,6 +475,8 @@ struct anx7625_data {
>         struct workqueue_struct *hdcp_workqueue;
>         /* Lock for hdcp work queue */
>         struct mutex hdcp_wq_lock;
> +       /* Lock for aux transfer and disable */
> +       struct mutex aux_lock;
>         char edid_block;
>         struct display_timing dt;
>         u8 display_timing_valid;
> --
> 2.43.0.381.gb435a96ce8-goog
>

Reviewed-by: Pin-yen Lin <treapking@chromium.org>
