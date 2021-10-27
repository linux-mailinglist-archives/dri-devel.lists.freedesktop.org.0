Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAE043D0D1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 20:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3EB789B95;
	Wed, 27 Oct 2021 18:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8505789B95
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 18:34:18 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 205so6209713ljf.9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oMasC2rgckEWdCe4DVz6in+O9oEmCriK7Q/BDKT8+60=;
 b=BU9c4Kt2klb9pGlGYSH6N2/niQ4oNqfLZ0U1NjtsaTgg7k2zPmvXxZMNe4LsT/a25Y
 FIhGhLYGlcZIbZ5j7j/wImxQN0EpLG2rhMuMjkY2ZOZtzRN9RqqqM2Z5uaL0wHre6mWM
 X7XRH+g6SO72fi7HbBdQdNVRGP6vVPJBwpQNB051MQ98oMp8EsGzZR8rkERWdlg/ct9o
 ddJXJKuqCo1GoTk5cB29k6H24t/jtwCG/qx/JiEgo0fh9G2BeRlLJWBsA8+ncOvhsWK7
 4aJySPcTUrOnoJ4Ah5b9ngmkz6HfI8+bB1S/leVgn/9yzaNvwSOGDWeh+h8NSiDjQk22
 DXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oMasC2rgckEWdCe4DVz6in+O9oEmCriK7Q/BDKT8+60=;
 b=RYtveS/5mAQfVqOt1P7xMhr0i80YqQEnDC9wUPZc0CUkl7q33esIsOSXgV/88dhbRP
 koh3w21WoUNIc3o6e+1AadX6+AvH7FNgdidOPmkxqb2dKXvDF5Yxq1IlPr9tWHs2H5AS
 SZOnx4969iwixo045Fevn4brbf0h4MbvuCPQ9LRkx2fviGK/+f00Xkj/AqK9Z9NNMVDi
 IFGSyafQckvxgJ3r1CzHYLfFYXkqbmaOhHv/ovV9vxciJLr5JUPCJKZJYoUbqHjE7Y9Z
 1HDqgcExIfyoPDi4EpXrV/HWLPdK/Rq6uAiN9v+dIKN7nVcXYqxp66FmmHz2Hd2+vi1p
 AKWQ==
X-Gm-Message-State: AOAM531QP46KChJliV2pv9Tdf6zkYSU+jI3PWFCc5aVKULSJm171iebS
 7RHDhOAWHkKZLRVTaJolzzdPsnE8tseSWeaZ8aELhg==
X-Google-Smtp-Source: ABdhPJydr0p5R5kOrBi0cKjyUtJDjfb0NxbOwZhHcj6m+H19kxZT9BRZop/bB7yZsgjxXgCMaOYdHA2FjRV6asLzles=
X-Received: by 2002:a05:651c:389:: with SMTP id
 e9mr14617679ljp.61.1635359656666; 
 Wed, 27 Oct 2021 11:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-21-maxime@cerno.tech>
In-Reply-To: <20211025151536.1048186-21-maxime@cerno.tech>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 27 Oct 2021 11:34:05 -0700
Message-ID: <CALAqxLXG5R2ZN9gfFsGTLfdY8mhNhh=o8f1w5Axo8NSw8QanAQ@mail.gmail.com>
Subject: Re: [PATCH v6 20/21] drm/kirin: dsi: Adjust probe order
To: Maxime Ripard <maxime@cerno.tech>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 linux-arm-msm@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Rob Clark <robdclark@gmail.com>, Tian Tao <tiantao6@hisilicon.com>, 
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, 
 Xinliang Liu <xinliang.liu@linaro.org>, linux-kernel@vger.kernel.org, 
 Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
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

On Mon, Oct 25, 2021 at 8:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Without proper care and an agreement between how DSI hosts and devices
> drivers register their MIPI-DSI entities and potential components, we can
> end up in a situation where the drivers can never probe.
>
> Most drivers were taking evasive maneuvers to try to workaround this,
> but not all of them were following the same conventions, resulting in
> various incompatibilities between DSI hosts and devices.
>
> Now that we have a sequence agreed upon and documented, let's convert
> kirin to it.
>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

For this patch, and any others in this series folks see fit:
   Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
