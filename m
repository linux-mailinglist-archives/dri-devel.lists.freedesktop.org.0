Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 888824C705E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 16:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4AB10E4B7;
	Mon, 28 Feb 2022 15:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83C7B10E1C2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 15:13:36 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 139so11745247pge.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 07:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LGwYcAtA2klfvyrB2PcrP/sabG2d6wgbmrp7H5C/tzI=;
 b=vDnkExEF+F5iAc4BnkmVTIxJmvcumyqPVFatWGgZ2EJVSXd0LHrELbiRT8yRPhlCAc
 KRMEDnZyRk+ibD6GMOxqZ9gUnH2dVJHZ4tvDiK+u9gCjwaa+7NhbS0lzSV6KOYgvHF6T
 Jbb44dmwpT3Zu2jtS50z5UOSWYEei2g67TdgJQz2pLrzBGNBPFbhkQtVCBgSHZKQJOBl
 /do+he/QPu1AtCUACLaYczXgxIqgxLhYcQWccsXl7mdnxMX/c1xUvUTqY9HK/BLgr1Vx
 oScKWP8JpwOMg3WM42nK7fdpy+G9B5mFVZG1q6YXkspCMFR+lTM9YdC8jQWbYsVnZgo0
 rwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LGwYcAtA2klfvyrB2PcrP/sabG2d6wgbmrp7H5C/tzI=;
 b=1yamu73pIFl/1izFGN8sINcjZV2rVn6J3xiBB/QEVXiJ3LpSd+0gsBtIJh07BOrwce
 3FFUIps6qCv8y2YiaAa3skY8Z6W3zmdEjK03HYPra49n036jMtR0WQ9czWgImWCRcr7s
 rAlo3aQr7htTRogVc0yfnt+FhQ1xUnmDomYr2ZLiU/sfp/qeYzkhGeOwPQbwNK4jjdhq
 JeAGWUe/5sNFmK252eJ/4DEeDItDbbj7YQKBkwkoed2u8UpOvu2lmkeDba+7AiYl7Rpg
 9WgDvW6co9/pBAsxjEY4ISJQ6Nj8K+be9TVo5+TbWfv44Wisnapy69ApL54vEoCsiSl4
 fl3Q==
X-Gm-Message-State: AOAM531J3qiRr8vusH8B9Gzmfwsj4XH85qDeATOK/Sut18+qs8jF4iji
 hoab1SCmPJwpDDmC3vwTMRhQJ6RyVo+DCuDBuooJTg==
X-Google-Smtp-Source: ABdhPJzk13pYILJKJ1yE53AETbOo1jfwEnx9hA9QDAQ+gwwwSSsFu6fOzIoUotvsgRS82wZ107CMhRY4mXN1sVpjpqo=
X-Received: by 2002:a63:b257:0:b0:376:7f43:5449 with SMTP id
 t23-20020a63b257000000b003767f435449mr14527357pgo.201.1646061216056; Mon, 28
 Feb 2022 07:13:36 -0800 (PST)
MIME-Version: 1.0
References: <20220228081421.1504213-1-hsinyi@chromium.org>
In-Reply-To: <20220228081421.1504213-1-hsinyi@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 28 Feb 2022 16:13:24 +0100
Message-ID: <CAG3jFysyV8QHO4zEdUYLxt9eBnGsHWrXdWbicmufUPnTB-oRLA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Fix the read buffer array bound
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
 Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Feb 2022 at 09:14, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> The size of read_buf is READ_BUFFER_SIZE (200), so we can't access it
> with read_buf + PAGE_SIZE (4096). Extend the READ_BUFFER_SIZE to 400 and
> set the end position to read_buf + READ_BUFFER_SIZE.
>
> Fixes: b5c84a9edcd418 ("drm/bridge: add it6505 driver")
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index fb16a176822d81..f2f101220ade94 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -289,7 +289,7 @@
>  #define WORD_LENGTH_20BIT 2
>  #define WORD_LENGTH_24BIT 3
>  #define DEBUGFS_DIR_NAME "it6505-debugfs"
> -#define READ_BUFFER_SIZE 200
> +#define READ_BUFFER_SIZE 400
>
>  /* Vendor option */
>  #define HDCP_DESIRED 1
> @@ -3074,7 +3074,7 @@ static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
>         struct it6505 *it6505 = file->private_data;
>         struct drm_display_mode *vid = &it6505->video_info;
>         u8 read_buf[READ_BUFFER_SIZE];
> -       u8 *str = read_buf, *end = read_buf + PAGE_SIZE;
> +       u8 *str = read_buf, *end = read_buf + READ_BUFFER_SIZE;
>         ssize_t ret, count;
>
>         if (!it6505)
> --
> 2.35.1.574.g5d30c73bfb-goog
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
