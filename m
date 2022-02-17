Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD54B9646
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8681010E3B5;
	Thu, 17 Feb 2022 03:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDC810E3B5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 03:02:32 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id h11so1304494ilq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 19:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SDqKCMLHkPaCw6ovXM1GLOoMd4SQY+h9F+jSwe4SwVM=;
 b=CPcBoH/ZU+9TlZUx5RzQ2x3a1alnNTknYehhGtoJGt1JR9X23kDmOaE4q6r/RxlP5T
 WE2lclOVh8jz7GUEJZ94hiJdhNyibl+0mU+YPDDJflmwHPwcrXACnTrA10lZcASZ7og4
 ShDW63gXOenKl70jeR76h7kGvNRWqeNt0JomQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SDqKCMLHkPaCw6ovXM1GLOoMd4SQY+h9F+jSwe4SwVM=;
 b=dA+flee9Vkif8cJLntwOrkdVO+rQee6muE7uJ4/tDmCXbi+gLX2EuqM/3Ox6qmF9+I
 8TJf+DvAHD8++iA9lXMqfjZo7EXGEYX2Ph6bzB+mmhJS/hqpNwyVy36d82BZWKKru76r
 xfTc00rUlz1LeGW0KWr7e6y+6DjtHPYXJFjiYLhCS/mCq1G9EBazNinW0b5jieawA1yn
 Qw9moXqEftSX7XalvE1UPBpxVTCA3JVfmRgjRyGr22GNYdyh31Gt+IoVnDhsQ0Wt7K6e
 UrEqIb7ZP7EWGCWCwfpYWvKsw4eCpqqF0ub5NAGo8apmTtAFeQR91vrwPty/ZimeYJhM
 JYqA==
X-Gm-Message-State: AOAM531s707vUckZXUvV1J66rb/GkNZHSrunHcYhD4iCat6ZcSR9wpTJ
 nnt1oUytQFYZH0pL/FcKai1tWxr5ll37koxf3zAX2Q==
X-Google-Smtp-Source: ABdhPJxp5fVLExa7nP7nDRhaTzG3tJgMhyOvVFoLKomiTIf/veYIrjOSrg6pLxP77T6y0Otez7aIwbJzW3CgselSD5A=
X-Received: by 2002:a05:6e02:1a6d:b0:2bf:60df:d27 with SMTP id
 w13-20020a056e021a6d00b002bf60df0d27mr631014ilv.105.1645066951384; Wed, 16
 Feb 2022 19:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20220217024418.3780171-1-xji@analogixsemi.com>
In-Reply-To: <20220217024418.3780171-1-xji@analogixsemi.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 17 Feb 2022 11:02:05 +0800
Message-ID: <CAJMQK-gDHsH=F=d+9W1-jOqKx6kveUtRRSG03W6KDVat=BzZhg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix release wrong workqueue
To: Xin Ji <xji@analogixsemi.com>
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
Cc: dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, andrzej.hajda@intel.com,
 bliang@analogixsemi.com, Xin Ji <xji@analogix.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 10:45 AM Xin Ji <xji@analogixsemi.com> wrote:
>
> From: Xin Ji <xji@analogix.corp-partner.google.com>
>
> If "hdcp_workqueue" exist, must release "hdcp_workqueue",
> not "workqueue".
>
> Fixes: cd1637c7e480 ("drm/bridge: anx7625: add HDCP support")
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

This fixes an issue that the driver will crash during unbind.

>  drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 633618bafd75..9aab879a8851 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2736,8 +2736,8 @@ static int anx7625_i2c_remove(struct i2c_client *client)
>
>         if (platform->hdcp_workqueue) {
>                 cancel_delayed_work(&platform->hdcp_work);
> -               flush_workqueue(platform->workqueue);
> -               destroy_workqueue(platform->workqueue);
> +               flush_workqueue(platform->hdcp_workqueue);
> +               destroy_workqueue(platform->hdcp_workqueue);
>         }
>
>         if (!platform->pdata.low_power_mode)
> --
> 2.25.1
>
