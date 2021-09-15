Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E840BCAD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 02:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65A896E875;
	Wed, 15 Sep 2021 00:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14BE6E875
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 00:29:54 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id h133so1776230oib.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 17:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=JukkaUTsG0GonnjXzrW/GiofJ5UBspcWxgvtjkWtQ1U=;
 b=AuuJcS90PlV274We64tcJ6Vja+tX9GL//WLswy6oBmmnJMa7VGj/eLcCwShK9DARKD
 zqdTE/OS/pw60d80+8u2tcQqEkfWV/C87yp9w8+ukZ8gTLV8gDdSQ5jfWgxZwg75mWST
 Y1B1iOoQZ0vvZqXLaavPaARDqld6N0eLdsH/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=JukkaUTsG0GonnjXzrW/GiofJ5UBspcWxgvtjkWtQ1U=;
 b=Pr+4VX9z/AJ52/mWxz0vAaEJ79uaGnhRTYU8ZXXuFcHCTWIFZoYTtOOXEaKA/X10kD
 7vtgnLIeTk6WvhdaMcl/eRSJZC1dhNQpZO+ZWOpY50PSrFLZsMztvXhFIo+d6mkLGt4f
 R37MIOYyHrwUp9kvnAZ4ZTqG34pyQa2sCvbH1WVUabwgmeMO477og0PuHj4CdbEJ6rc6
 eHje5BwJ/6/UPg5MIqR9PkYgSRjB8xPV8af7qGQu39AZWkvbca6/ejIFOBd1a1N7RZ9/
 DT/LtB7UvztxdjCoy2nns6LZ937Y3Vejh2wrVQP2A2pT9JkhFJFLID87GHijLZIYLGmS
 oj+g==
X-Gm-Message-State: AOAM532SjK2bhnBZv6qpR6NP32b8qJNjAy3BB7nUDnxmgLixnOPrEPTH
 O1K2rTglx/1pQXYazZ5NA9MxKEvbGPc1hpFeee/2dw==
X-Google-Smtp-Source: ABdhPJxeexSkYU4JqkvTpWYP1ROeGk6cSocDZiQTYPtbiYojnNHQl/XbgMWKHp6Oo+RybVeFCkQ1T11g8h9Q9f6LEr0=
X-Received: by 2002:a05:6808:909:: with SMTP id
 w9mr3380549oih.164.1631665794244; 
 Tue, 14 Sep 2021 17:29:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Sep 2021 17:29:53 -0700
MIME-Version: 1.0
In-Reply-To: <20210914162825.v3.2.Ib06997ddd73e2ac29e185f039d85cfa8e760d641@changeid>
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.2.Ib06997ddd73e2ac29e185f039d85cfa8e760d641@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 14 Sep 2021 17:29:53 -0700
Message-ID: <CAE-0n53BXh3_6jEW5oTbPA-V=MSaN=RvqaU8uoY9GNOm-0Pv_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: parade-ps8640: Use regmap APIs
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Cc: dianders@chromium.org, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Philip Chen (2021-09-14 16:28:44)
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index e340af381e05..8d3e7a147170 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -368,6 +396,12 @@ static int ps8640_probe(struct i2c_client *client)
>
>         ps_bridge->page[PAGE0_DP_CNTL] = client;
>
> +       ps_bridge->regmap[PAGE0_DP_CNTL] = devm_regmap_init_i2c(client, ps8640_regmap_config);
> +       if (IS_ERR(ps_bridge->regmap[PAGE0_DP_CNTL])) {
> +               return dev_err_probe(dev, PTR_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]),
> +                                    "Error initting page 0 regmap\n");

This one also doesn't return -EPROBE_DEFER? The dev_err_probe() should
really only be used on "get" style APIs that can defer.

> +       }
> +
>         for (i = 1; i < ARRAY_SIZE(ps_bridge->page); i++) {
>                 ps_bridge->page[i] = devm_i2c_new_dummy_device(&client->dev,
>                                                              client->adapter,
