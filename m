Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 840F7382830
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2C06E91C;
	Mon, 17 May 2021 09:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3EE6E918
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 09:05:30 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h15so2627159ilr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 02:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o60wPNLr21xWpD+QwBWtK7YH8IFJi6smJPucpJVnzMY=;
 b=oG167cCo5raGDssXdEmdUQlIdmaHQVF5t31VR1SsNkqG5d/rhAg6Tv/rjbL2BdrXlF
 T4S//obYm6TeUseFLMj8i86rcCBTfsekBZuA1NqR1Hvt6llzpfqeYmEZ4/ORyJmShOqy
 d1wb/6dO2bAoFSZjKki/OS2d8gh7OnVy1ZiioADr5eAm4FdxBh7AasoXJYPjmfdNVGvG
 PHT7pl4vDF+FWRF7Q02XVzcuIxa1YWK0wveJSD38M1z1FVkDd9eNZ8ZXtU/tR0xe1TDi
 xovUSpuOGnV9VME7mHt5Lc+Q71gQ45OpJOskyEa5VzP8e2EwLO6It7QOH4j9G7zz8Tkg
 91zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o60wPNLr21xWpD+QwBWtK7YH8IFJi6smJPucpJVnzMY=;
 b=uNKWYvHZEMN5+pQobYo+HIGYkwY830+L4brWkSMdw66fum9zfXyVpWzkjv5Fqso8Ur
 hTd+CaUz7+h39y1rOUHYhoW1Ji7HeZYkqNM1XW41yRBhBjOM15LVpfhEI+2/S8tkMB87
 qrwPAv+BnMBlRBDfPxNdkZHeXMXqKRwGXNv5uNXkQwFD64d5QiiumP1vWci8kFB8nGkE
 D3qtWl74r86jQ6lU7jnjFxkmEuEejUArMl/xUdPngehX+IZ970h6EH2GccOYQO6xO35O
 3M4yIhLiKEuWGXz/zKL5LakWpj4cYA9goqxHl6Njh/SYFNvlW79kJeR1AyLs085bW1ds
 gIng==
X-Gm-Message-State: AOAM530Y8FB1AKkgQP9D7bYrpb0iGM7yjS2Womdln29+KC+3eOWH1t+t
 9T+q1+GLxz5C7TttDp1vSbwJFqKbhKe46CvnqvN6YA==
X-Google-Smtp-Source: ABdhPJxZbp3diLrvyq3dgrYuMRWfC3H9RpmazP77wsFU4Fo/hGGzNwxhNiPkwUYI7ddMGxLaJexigKtM+k4YmlmUSmM=
X-Received: by 2002:a05:6e02:1b05:: with SMTP id
 i5mr38832882ilv.204.1621242329564; 
 Mon, 17 May 2021 02:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210517063553.554955-1-pihsun@chromium.org>
In-Reply-To: <20210517063553.554955-1-pihsun@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Mon, 17 May 2021 17:05:18 +0800
Message-ID: <CA+Px+wXePF0Pi1binoZyhZY=9QSX53N-ThWN4mn+fGBoHk1s3A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] drm/bridge: anx7625: refactor power control to use
 runtime PM framework
To: Pi-Hsun Shih <pihsun@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 17 May 2021 09:22:53 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 2:36 PM Pi-Hsun Shih <pihsun@chromium.org> wrote:
>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

With some minor comments,
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

> @@ -1228,22 +1173,25 @@ static void anx7625_work_func(struct work_struct *work)
>                                                 struct anx7625_data, work);
>
>         mutex_lock(&ctx->lock);
> +
> +       if (pm_runtime_suspended(&ctx->client->dev))
> +               goto unlock;
> +
>         event = anx7625_hpd_change_detect(ctx);
> -       mutex_unlock(&ctx->lock);
>         if (event < 0)
> -               return;
> +               goto unlock;
>
>         if (ctx->bridge_attached)
>                 drm_helper_hpd_irq_event(ctx->bridge.dev);
> +
> +unlock:
> +       mutex_unlock(&ctx->lock);
>  }

Reminder: the lock now also protects the invoke of drm_helper_hpd_irq_event().

> +static int __maybe_unused anx7625_runtime_pm_suspend(struct device *dev)
> +{
> +       struct anx7625_data *ctx = dev_get_drvdata(dev);
> +
> +       mutex_lock(&ctx->lock);
> +
> +       anx7625_stop_dp_work(ctx);
> +       anx7625_power_standby(ctx);
> +
> +       mutex_unlock(&ctx->lock);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
> +{
> +       struct anx7625_data *ctx = dev_get_drvdata(dev);
> +
> +       mutex_lock(&ctx->lock);
> +
> +       anx7625_power_on_init(ctx);
> +       anx7625_hpd_polling(ctx);
> +
> +       mutex_unlock(&ctx->lock);
> +
> +       return 0;
> +}

Maybe in another patch: the ctx->lock looks to protect too much code.
