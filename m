Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C01D54B6C4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 18:53:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5AB112926;
	Tue, 14 Jun 2022 16:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6D1112927
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 16:53:09 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g7so12505086eda.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 09:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gsopwpWWDub7lMVGRVKW+M9OivGGMLYn66ZEuZeN868=;
 b=ZtsqMroqiRGBjY5OLyrEYvmnzsIk88PlMmAQJYXQmJNBhHu7ZbZAF4xIcTVWOHvWbS
 +hyMmVfj8QncW7tRcXMNbhP4D96k1WUoYW8sUKmjGoa00gAced6WWi39Z1T5uXTrFhsd
 6yG+53KN0wOZkaBAZm+RakD86e8RuYcb2iRbNybj8JMYyfvWkx+zwpVFXmnrRfOh9WWE
 rIX/A8znBVW6GS7relTnPVzTO3xZCMWmN05/jq1GoO48PQvIk5P6E7jMdQupqsltW7oA
 pkwPrH7hF/zIoFRFZ6SwooNlFWqPsT17/zfd9uE4B9qesCS1b3Got0PGDwx+M/0DhOyU
 YGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gsopwpWWDub7lMVGRVKW+M9OivGGMLYn66ZEuZeN868=;
 b=mmH4EeMiUTeFhVrxkuAnry0OzG5ZghVPlO66Ffq6gXy6X92cN0TVkyfoef6qPnjr44
 am9sf1H32XAoZCkqVfLEirU87veFxdSlHTSb9Aic6PX/d4GZToQUAsAt+wIT4GdtZ5fc
 twxlUIFMuCx+5uQR6TcwRaE1CpoGPpmQyD11QQHRUSoB7axIQLrdB82ghD+JdB80lOVX
 yxuZsDOdnziKCaT1Hw3ewSGSlx6qorXOOpHJDoX/2YhEviq8+KsbLfVZcs0R4KH1nB8j
 HsNtR7AQq0Z4is6CtOnsZJp0Y9T0hz3JWRwCcYigacNKFlxqJM9XS2FygwmZpc/3EcoR
 x9ZQ==
X-Gm-Message-State: AJIora8/Xa1YtZw2FSlIOvLCR1wK45WLR5hViSwY3FIJtD4CZrFEGTN8
 Ey/hdnDpkyGPMmOG1GUvEMQluGMJrNERiVCiRnCS1g==
X-Google-Smtp-Source: AGRyM1uah55V48RTyDjp8oHFdBHc5oJgzOn2gt10Ngr/cXdkR21TtIsEUlXpP0S6hI9AmAC1jXpZL9w3EAh/GSvAUgg=
X-Received: by 2002:a05:6402:524d:b0:42e:332:dd04 with SMTP id
 t13-20020a056402524d00b0042e0332dd04mr7262300edd.258.1655225588239; Tue, 14
 Jun 2022 09:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-28-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-28-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 17:52:52 +0100
Message-ID: <CAPY8ntDK+y-xQ9+Eyw8njUJUoMrwRo7zEggNNHi_KZPq=XXPkA@mail.gmail.com>
Subject: Re: [PATCH 27/64] drm/vc4: dpi: Switch to drmm_of_get_bridge
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
> The current code uses a device-managed function to retrieve the next bridge
> downstream.
>
> However, that means that it will be removed at unbind time, where the DRM
> device is still very much live and might still have some applications that
> still have it open.
>
> Switch to a DRM-managed variant to clean everything up once the DRM device
> has been last closed.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dpi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> index 8a50de2c40d9..9950761449cf 100644
> --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> @@ -220,10 +220,11 @@ static const struct of_device_id vc4_dpi_dt_match[] = {
>   */
>  static int vc4_dpi_init_bridge(struct vc4_dpi *dpi)
>  {
> +       struct drm_device *drm = dpi->encoder.base.dev;
>         struct device *dev = &dpi->pdev->dev;
>         struct drm_bridge *bridge;
>
> -       bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
> +       bridge = drmm_of_get_bridge(drm, dev->of_node, 0, 0);
>         if (IS_ERR(bridge)) {
>                 /* If nothing was connected in the DT, that's not an
>                  * error.
> --
> 2.36.1
>
