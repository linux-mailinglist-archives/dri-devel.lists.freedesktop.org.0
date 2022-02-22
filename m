Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 804414C04D3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 23:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B171C10E815;
	Tue, 22 Feb 2022 22:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E117310E7D3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 22:45:06 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id w63so23037683ybe.10
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 14:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HadLybndSc4+83udfaFf6CPAEtJp2NdGL5J7rhdH6QI=;
 b=g2WRHS6wQdK3tXYzDPeyJLqMhw6ManzjpWTA2X6HQ5WyjR9VzujGnKgB5uu+Qx64Se
 rGHymFc5xxmNZIxevQ1UjDdKf417WYtyEyIyyrt+yjkW3nROZawRFM5w6y3dhHVSLFZR
 B3qHayA6j2OzWyupaCIRb+PS9IBuXmvGkaU2g7EqNQdRuQksvwISiD8FeTU9OHrqiLvw
 0WwtVy82DYJyIKtOj96IOVeOShNshiagT2cIwOEPcwi6G+wg5hxgfTBZz1B77Rc4uqMs
 zc6wCQ77J+u6w3qDB1pXCwAStZvr8qqj1oJvXat9Oc8asioowCLaPKKigK8K8pofIuZP
 t2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HadLybndSc4+83udfaFf6CPAEtJp2NdGL5J7rhdH6QI=;
 b=c5Eu/8ym+H0kcvY1OaPPE7diwQGOlx+oTgF3ZVUSZkCBRJA9NfozuQsQDknO8V0Twt
 gj6GE7wm+LONUk8izKYglDbCDd2rUo2mmJ/t/Qfdd/bMrJi5t9nzpV3mAr+cn73m6UwR
 9KYwkT03OdRT8uixe9qdFX8cAXvuMHoTr0cRQJYOPnMi5hucKGDt4Piu1S+SFgUg/MGS
 s3Mcqop4lBuPJrW9NcW5FXPbrp7HYhsUxzbdwOOEsTjw1FzRKa2x+vmJtKmLKzxXYBRv
 DStqpJZr0ugU+Wx0UFvvTird6cC3LrNS+OvMMvkbXll5JDWzKTaVWeKJdMwUKgJXZJbw
 yo4A==
X-Gm-Message-State: AOAM533MG7l5QiyEnYRUojOKGk3e6REUcYcX/zp1YEuTaRpl/pQZwWOf
 xINwr8yOpnCYBs/voJSNuI/zQksQo6RwBMq7V4vooQ==
X-Google-Smtp-Source: ABdhPJwXhQzLFapXj6GO5ms7h/KJI9VTpfh/O4OclZgrb8LhtsEGl7isKasno4HU0SgGHd/4gJMddJRV2PFl9WlJTz8=
X-Received: by 2002:a25:9108:0:b0:61e:329:700 with SMTP id
 v8-20020a259108000000b0061e03290700mr24730620ybl.369.1645569906080; 
 Tue, 22 Feb 2022 14:45:06 -0800 (PST)
MIME-Version: 1.0
References: <20220222141838.1.If784ba19e875e8ded4ec4931601ce6d255845245@changeid>
In-Reply-To: <20220222141838.1.If784ba19e875e8ded4ec4931601ce6d255845245@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Feb 2022 23:44:54 +0100
Message-ID: <CACRpkdbQ9U22afR74YiZs95qCm7dnLb2k4_nT3Le__hJPpDGUw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Properly undo autosuspend
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 11:19 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The PM Runtime docs say:
>   Drivers in ->remove() callback should undo the runtime PM changes done
>   in ->probe(). Usually this means calling pm_runtime_disable(),
>   pm_runtime_dont_use_autosuspend() etc.
>
> We weren't doing that for autosuspend. Let's do it.
>
> Fixes: 9bede63127c6 ("drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Hm. I know a few places in drivers where I don't do this :/
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
