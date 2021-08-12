Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7678C3E9B9A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 02:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922526E20E;
	Thu, 12 Aug 2021 00:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938EA6E209
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 00:25:12 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 d10-20020a9d4f0a0000b02904f51c5004e3so5584232otl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 17:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aBF5XsmOwLOwhoJ7V4vA+C2s7+F6s8RQ06qQNUqSroI=;
 b=h+56UWETmWksgXZ6odjCSUhkS60nq9twTFk5O3iDfPkw9SlJ2Q9MC4k1YZ13wA9QSI
 cz2Pc3wlRcNYEKwZ643eM+MtGzStloEbEFNy4YhjnGGkil5U0nH2pe9f1iubEMhKDwtU
 PwWNtWc+gGsmqzXBvFg2DTN9n6mT6P+9a9T3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aBF5XsmOwLOwhoJ7V4vA+C2s7+F6s8RQ06qQNUqSroI=;
 b=VZa7pzUXAY8ZGpXG7ov56W3AYA8QMdebJRyCMlVaB/6gP32FPScA0/RfywQoRKItvJ
 UaNUXDbF7/ME69Spu9dozUQx1VS8tTYKEbRl8vycEtS51CWP0mH4DOc83HGCmOfKpf9K
 bTGBOvGESA/ER44HMMqdLsfiPc/ovvtHFfc20M8a/tm7UIKZZEyT0o/tFtFhz1Nz2iab
 09oUHMcOwzkAKyHnh/qopC4d5u9HqOzzZe7GtQJcDUgBs3epCSsFgciGgEaDroRjS3Ol
 MkFzrwE2jK6Q/Lu+WQ350s1SpqF8UvGKWzWbtRYX8v+hhtI4aNvd6B2ZAeOz+5XbUYVf
 pv5Q==
X-Gm-Message-State: AOAM530Ow7ojaONDhPn3y/f6ZFhFGZdu28Qc4zhpU2SLEc8K47UFrJxM
 XqGONdNLLdQAVTSP5OyyAyNcCBljRXoL5+IFrBRYcA==
X-Google-Smtp-Source: ABdhPJx0FoYmfQ9zAKiWN4L09yMr9AcpGP2BwH3WsltDn0CSuMhuEFOx+zQVeSaXHI+pNsLrGV3maXsnDszKO/B14Ss=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr1268834oti.25.1628727911938;
 Wed, 11 Aug 2021 17:25:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 17:25:11 -0700
MIME-Version: 1.0
In-Reply-To: <20210811235253.924867-2-robdclark@gmail.com>
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-2-robdclark@gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 11 Aug 2021 17:25:11 -0700
Message-ID: <CAE-0n51mqTwUdT1cmL=ubcFppFZ8GwerPBWCJ2QsyRtzG9vkjw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple
 connectors
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Jagan Teki <jagan@amarulasolutions.com>, 
 linux-kernel@vger.kernel.org
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

Quoting Rob Clark (2021-08-11 16:52:47)
> From: Rob Clark <robdclark@chromium.org>
>
> If we created our own connector because the driver does not support the
> NO_CONNECTOR flag, we don't want the downstream bridge to *also* create
> a connector.  And if this driver did pass the NO_CONNECTOR flag (and we
> supported that mode) this would change nothing.
>
> Fixes: 4e5763f03e10 ("drm/bridge: ti-sn65dsi86: Wrap panel with panel-bridge")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Thanks for saving me the packaging effort.

Reported-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org>
