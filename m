Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A23EA8D5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 18:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF0F6E437;
	Thu, 12 Aug 2021 16:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8446F6E437
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 16:55:13 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id d22so9272754ioy.11
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ajRQDl/gOVwvNbWEBhu//WfevoY6tePub/nv6KPeW3I=;
 b=aSb8j96vLHuOXO0FBSyas19kl6IAsLIMwmg3ku9T8nvfjewVuGPM33mLbilyC6rB8B
 tiQN+uh+75AyIBwHMJ2HEFtzZMiOGvWBIbRJ+QNJD9JmeqfkQ2t6nCwa69MOyn7D28MT
 srIZF9FLnI3BIgjTludpaGZhO7pBF+Wbbl2uM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ajRQDl/gOVwvNbWEBhu//WfevoY6tePub/nv6KPeW3I=;
 b=LRmWTXTJBfOJIChzdo0ol2HNru3cTBkYnvJ4xCKiEuYXmUl6ZopNlW4/HvWlNHWH57
 LRHIRSsSgPS6oFOOtvoyypLWW+6FkOdqNYaz+aZ2BHyhPSEHI9gKZrJtWSW0th/bkYHn
 DvXuRslMeTdiWYzSIN3Jft8BKnsXinSGOorjtrootkCYUpz01T1Q/j6Ujp6aDjhZnt6R
 2gw7X0xz5U6cEPp6dwhgVJxNW3nC+wsUI4JO12x/hpBwH2f+qaBShb1MKMvmmp3N/Dp6
 8bXNd0S0txgrsxMhBbau7RTh040NCWabmOp0jqWpjltYjC9+Ep2yhAV0duGMsUMrquPM
 2wDA==
X-Gm-Message-State: AOAM533X0ieoyfjDkfDeV0MlXsWOdWinC93N+btLjADEyBDL/XM9mNVJ
 oqECG6WRELKwhvo/Eq5dgO5jt+VHR6z8jQ==
X-Google-Smtp-Source: ABdhPJy6X7InCUFoEw7Hj2Q673KzPs87QHcznbPvckJx8CkEaluCm+ak9PKL2n47xgM3rXG5ghgmxg==
X-Received: by 2002:a02:a390:: with SMTP id y16mr4749498jak.120.1628787312923; 
 Thu, 12 Aug 2021 09:55:12 -0700 (PDT)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com.
 [209.85.166.179])
 by smtp.gmail.com with ESMTPSA id i3sm1736274ilu.46.2021.08.12.09.55.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 09:55:11 -0700 (PDT)
Received: by mail-il1-f179.google.com with SMTP id v2so1505801ilg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 09:55:11 -0700 (PDT)
X-Received: by 2002:a92:a008:: with SMTP id e8mr3510493ili.187.1628787310662; 
 Thu, 12 Aug 2021 09:55:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210811235253.924867-1-robdclark@gmail.com>
 <20210811235253.924867-2-robdclark@gmail.com>
In-Reply-To: <20210811235253.924867-2-robdclark@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Aug 2021 09:54:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
Message-ID: <CAD=FV=V8RjS3+3L=_NxeuE8vGoFpPnK2NP+QT9WUYExDG_GY-g@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: ti-sn65dsi86: Avoid creating multiple
 connectors
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 open list <linux-kernel@vger.kernel.org>
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

Hi,

On Wed, Aug 11, 2021 at 4:51 PM Rob Clark <robdclark@gmail.com> wrote:
>
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
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

I'm going to apply this one to drm-misc/drm-misc-next and push since
it's a fix and we're before -rc6, then I'll take a look at the later
patches in the series.

-Doug
