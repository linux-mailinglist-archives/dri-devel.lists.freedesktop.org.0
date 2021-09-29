Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841C41CE02
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 23:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA626E25B;
	Wed, 29 Sep 2021 21:27:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABB26E24D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 21:27:33 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id x27so16297232lfa.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vjQP0/+z55MvzkQLmpO17f1ojfgarxRQxkpypeDCRYQ=;
 b=P6d7v/ARFy2oAzNGlzkCFMmhuF0dw1E4Ty8/aKGGomT30aic5OSINMht/5eTnTjw+E
 HVwG/Vb0f044xHEAedWSzxWElToMUBbgbJq2HpAC0E3cTqgTRqpyyvO/TxZlRGm7Knzd
 g197vNwd2IHxhZjeaz4yRtAoxCOvziEh/yVbtU+3O8VuswsBr07x1VFM5xAtgWihuCkO
 uaX1aUCJfdL12bZY+cJm7vPnn7R7kAZO2pzg6uXgoaCGHwkzYiXL2tUrJgQgg6Kyykb/
 RcZANF9j+IZ5JhNrzRCHZVii00VULrEZwGuwD9dkVZiGUnoOdzpJdvJXgmdVANl52dPG
 GeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vjQP0/+z55MvzkQLmpO17f1ojfgarxRQxkpypeDCRYQ=;
 b=7mpekeP0Evs55iGJvB9OKlxMrdF7tgGJ6RMbSWbfl4OMlQtaol+2a+OwZyIgi9n+xB
 wqMOr52iP14WkQLHfb5dgzr6RK22UfZD5TXNtHru3T4Z5FKs5KpU+QG8EE2EBjnIspeH
 O95kAQ5ETMKre4yIDB4gc6//a8cWVFD7iVig4oDDl8DkCDb7/OShHqyarw5n0Zo70Thh
 0Y/J4Z816c+nMMv8wQuvRhQwguC6OWbN1+nZaTqOxciuX+eJyDAYU6H8A0cwdRoq7JIa
 jYvw6/GNZFpkWP215arCaq20Hr+6nEpuZmNALJQ0NskyCLtZnrGYNno2Go91vMRGNaY6
 XnAg==
X-Gm-Message-State: AOAM533wGaGzAoDGmSuAHlKSncPrz8HqlIHbdEEbr9ixisvl3Pxhn6W3
 /VeojKRmKPQjA1dK11lEXBRAxfQiGtO6EXN+sDO6Qw==
X-Google-Smtp-Source: ABdhPJxlRl2WWh8eZDcWokrINznDZYEeyO4HbV5UfIxRhCovDEAxjUhr3yg0Uy13hYjMGKtihX9SR8gKl3bzVxFYltc=
X-Received: by 2002:a05:6512:ea5:: with SMTP id
 bi37mr1986548lfb.36.1632950851440; 
 Wed, 29 Sep 2021 14:27:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210910101218.1632297-1-maxime@cerno.tech>
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 29 Sep 2021 14:27:19 -0700
Message-ID: <CALAqxLUqdkxXogmPhPgHv4Bgx-4b3mxe12LzzvWb07pLSnb2kA@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] drm/bridge: Make panel and bridge probe order
 consistent
To: Maxime Ripard <maxime@cerno.tech>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Sean Paul <sean@poorly.run>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 lkml <linux-kernel@vger.kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>, 
 Inki Dae <inki.dae@samsung.com>, 
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chen Feng <puck.chen@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
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

On Fri, Sep 10, 2021 at 3:12 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> We've encountered an issue with the RaspberryPi DSI panel that prevented the
> whole display driver from probing.
>
> The issue is described in detail in the commit 7213246a803f ("drm/vc4: dsi:
> Only register our component once a DSI device is attached"), but the basic idea
> is that since the panel is probed through i2c, there's no synchronization
> between its probe and the registration of the MIPI-DSI host it's attached to.
>
> We initially moved the component framework registration to the MIPI-DSI Host
> attach hook to make sure we register our component only when we have a DSI
> device attached to our MIPI-DSI host, and then use lookup our DSI device in our
> bind hook.
>
> However, all the DSI bridges controlled through i2c are only registering their
> associated DSI device in their bridge attach hook, meaning with our change
> above, we never got that far, and therefore ended up in the same situation than
> the one we were trying to fix for panels.
>
> The best practice to avoid those issues is to register its functions only after
> all its dependencies are live. We also shouldn't wait any longer than we should
> to play nice with the other components that are waiting for us, so in our case
> that would mean moving the DSI device registration to the bridge probe.
>
> I also had a look at all the DSI hosts, and it seems that exynos, kirin and msm
> would be affected by this and wouldn't probe anymore after those changes.
> Exynos and kirin seems to be simple enough for a mechanical change (that still
> requires to be tested), but the changes in msm seemed to be far more important
> and I wasn't confortable doing them.


Hey Maxime,
  Sorry for taking so long to get to this, but now that plumbers is
over I've had a chance to check it out on kirin

Rob Clark pointed me to his branch with some fixups here:
   https://gitlab.freedesktop.org/robclark/msm/-/commits/for-mripard/bridge-rework

But trying to boot hikey with that, I see the following loop indefinitely:
[    4.632132] adv7511 2-0039: supply avdd not found, using dummy regulator
[    4.638961] adv7511 2-0039: supply dvdd not found, using dummy regulator
[    4.645741] adv7511 2-0039: supply pvdd not found, using dummy regulator
[    4.652483] adv7511 2-0039: supply a2vdd not found, using dummy regulator
[    4.659342] adv7511 2-0039: supply v3p3 not found, using dummy regulator
[    4.666086] adv7511 2-0039: supply v1p2 not found, using dummy regulator
[    4.681898] adv7511 2-0039: failed to find dsi host
[    4.688836] adv7511 2-0039: supply avdd not found, using dummy regulator
[    4.695724] adv7511 2-0039: supply dvdd not found, using dummy regulator
[    4.702583] adv7511 2-0039: supply pvdd not found, using dummy regulator
[    4.709369] adv7511 2-0039: supply a2vdd not found, using dummy regulator
[    4.716232] adv7511 2-0039: supply v3p3 not found, using dummy regulator
[    4.722972] adv7511 2-0039: supply v1p2 not found, using dummy regulator
[    4.738720] adv7511 2-0039: failed to find dsi host

I'll have to dig a bit to figure out what's going wrong, but wanted to
give you the heads up that there seems to be a problem

thanks
-john
