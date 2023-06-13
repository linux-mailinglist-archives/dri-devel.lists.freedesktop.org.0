Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C9772D753
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 04:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FD910E128;
	Tue, 13 Jun 2023 02:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4599B10E128
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 02:20:10 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b1b3836392so61299511fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 19:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686622808; x=1689214808;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=B1shOEn6nPaVCEbd4LM/XYWlmeirPeNDnDCpFLJAn8M=;
 b=RAtFtf51gawv3C7hUz5ysqbwI7ecg+XXrOydFkRhKemur5yZN3RD5q9GAF5/Sljofw
 17WN4Cj3ugfoMZJkMFYnB+Hk0AduWXEiNApie/YI1gmnWVvRbYLenB1FDQo0vpq/pz35
 O+DasHqbUyrEBTgqNENAOrq2J3LT+GYiG3h00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686622808; x=1689214808;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1shOEn6nPaVCEbd4LM/XYWlmeirPeNDnDCpFLJAn8M=;
 b=PT+9IIqcFLoCNA4qjNPYBoMIHJcQmcxAgd3OTY83QCRiqfWk2zLxaEX5MFvgXoSvHH
 BItRIgvC3kMBFLA7lOa3ZqZBLtPsC3wuqbJpPQitkz662qyDwAfJwEokLA3jUQAcH4Tt
 fW1X+wUtAw8CBYmw0pUJmIVy7etX9engEHLFUUYKzFJGbR1LjkHHDNx8swslAgF6kyeg
 eNQ57g+rp1ITVAzcmKZlXAOg0KsFqWPdNFC9DJ1A9WcA+TeG5u4LtL3hEwJX95W5fXEw
 6apeCgr0WRqEuAphY4CE7IEVBvPqHCpwRyuYRzlDQn/6mQ1m+2kDu6KSmIwAGd2Hr4Gt
 IJhw==
X-Gm-Message-State: AC+VfDzZUzwOTPM5FpP9I27PjKvp7DUhD5YLyN6uSND1THSNyx3XCiyG
 pDvVxuPqHZOTLQ3WV24jbtsnvlvsD2zaBNcspBIlCA==
X-Google-Smtp-Source: ACHHUZ5nU/RT+l0B8eGNQK7cVvbMPzWQeVYVWx36X8mWJm2OkkWZ8BTKX3tUWqYeB7PdXuhD39Z6AeV/fsdbkM+IuZ0=
X-Received: by 2002:a2e:868b:0:b0:2b1:c783:b905 with SMTP id
 l11-20020a2e868b000000b002b1c783b905mr3549460lji.15.1686622807918; Mon, 12
 Jun 2023 19:20:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 12 Jun 2023 19:20:07 -0700
MIME-Version: 1.0
In-Reply-To: <20230612165302.1.I24b838a5b4151fb32bccd6f36397998ea2df9fbb@changeid>
References: <20230612165302.1.I24b838a5b4151fb32bccd6f36397998ea2df9fbb@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 12 Jun 2023 19:20:07 -0700
Message-ID: <CAE-0n50E+ERC2tvTmb2_FMas8QETgdogm8A1d_bkmhhwafsn6w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2023-06-12 16:53:03)
> Memory for the "struct device" for any given device isn't supposed to
> be released until the device's release() is called. This is important
> because someone might be holding a kobject reference to the "struct
> device" and might try to access one of its members even after any
> other cleanup/uninitialization has happened.
>
> Code analysis of ti-sn65dsi86 shows that this isn't quite right. When
> the code was written, it was believed that we could rely on the fact
> that the child devices would all be freed before the parent devices
> and thus we didn't need to worry about a release() function. While I
> still believe that the parent's "struct device" is guaranteed to
> outlive the child's "struct device" (because the child holds a kobject
> reference to the parent), the parent's "devm" allocated memory is a
> different story. That appears to be freed much earlier.
>
> Let's make this better for ti-sn65dsi86 by allocating each auxiliary
> with kzalloc and then free that memory in the release().
>
> Fixes: bf73537f411b ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers")
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Thanks!

> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 597ceb7024e0..db1461cc3170 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -464,27 +464,32 @@ static void ti_sn65dsi86_delete_aux(void *data)
>         auxiliary_device_delete(data);
>  }
>
> -/*
> - * AUX bus docs say that a non-NULL release is mandatory, but it makes no
> - * sense for the model used here where all of the aux devices are allocated
> - * in the single shared structure. We'll use this noop as a workaround.
> - */
> -static void ti_sn65dsi86_noop(struct device *dev) {}
> +static void ti_sn65dsi86_aux_device_release(struct device *dev)
> +{
> +       struct auxiliary_device *aux = container_of(dev, struct auxiliary_device, dev);
> +
> +       kfree(aux);
> +}
>
>  static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
> -                                      struct auxiliary_device *aux,
> +                                      struct auxiliary_device **aux_out,
>                                        const char *name)
>  {
>         struct device *dev = pdata->dev;
> +       struct auxiliary_device *aux;
>         int ret;
>
> +       aux = kzalloc(sizeof(*aux), GFP_KERNEL);

Check for allocation failure?

> +
>         aux->name = name;
>         aux->dev.parent = dev;
> -       aux->dev.release = ti_sn65dsi86_noop;
> +       aux->dev.release = ti_sn65dsi86_aux_device_release;
>         device_set_of_node_from_dev(&aux->dev, dev);
>         ret = auxiliary_device_init(aux);
> -       if (ret)
> +       if (ret) {
> +               kfree(aux);
>                 return ret;
> +       }
>         ret = devm_add_action_or_reset(dev, ti_sn65dsi86_uninit_aux, aux);
>         if (ret)
>                 return ret;
> @@ -494,6 +499,9 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
>                 return ret;
>         ret = devm_add_action_or_reset(dev, ti_sn65dsi86_delete_aux, aux);
>

Nitpick: Stick this if line to the line above

> +       if (!ret)
> +               *aux_out = aux;
> +
>         return ret;
