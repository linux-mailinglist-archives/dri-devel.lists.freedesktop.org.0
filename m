Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84091501F50
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 01:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B25010E213;
	Thu, 14 Apr 2022 23:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D59410E213
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 23:51:58 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-e2afb80550so6841758fac.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 16:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qPW/tKpzT2OLfeSRQ/n3e2HyIfU7YN+KxUW+wzF8svk=;
 b=PdpQhj7fINn7qu87oYF/GhsNSZEgkM4PsGuYww5mHdO4QC2XEsCgTazMbYHrpKHV4v
 RzQ9lxw3t5eMj7tdzUazdoz+Nbj7ZTiGS4PRPKKE6GSv/k14Ua5PI6g6zJ+zHSvnftCW
 SRJBCgk6mTzyKuTYBAoraxrYw3OJudMqcmLiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qPW/tKpzT2OLfeSRQ/n3e2HyIfU7YN+KxUW+wzF8svk=;
 b=fCAV5BZgvXSg6gtVRQszzuIIBGntWuoHMMrs4H97R0a7cUCyWEFnJmUY9Wrx+VLSlM
 a8ceTyTdLso6ssZd3Q/8FVVJIH0PTlrh0auG1wv3vmAOrWGmuNqzO+XZ5WI2dLHjhx4p
 lN/t9S65ZY5eUYo7PE/24Aj52yC/sD8JlAJ3WUemfcXtTT6ziMM+ucAu7NQcHFFwWLET
 OydB+z72M8Ju66h5I+rt0hRsFDjiw8+17W2xRXYY2HlbYa6eXuH/FBMqx1J63vvyE8fP
 06bTx+mFc9Btdo4qWZ5nId4N5zjtumXSJD6Hwz4zBPH7QmokoDrsP5Ku5YlvHuX4sza4
 KaKA==
X-Gm-Message-State: AOAM531rhg/B4mQhDTYFclDMKxbfYhALIANg8bYU6AC+29vCvcxfSH1K
 3jad0py8bH/3kfM73TFhznsX7wJBJVEeZtraRk73+A==
X-Google-Smtp-Source: ABdhPJzwtYuodRPeJxtc7mOL3ncJ6vXZH0JF/qaaDvKAqWbPWW4V5ip/oD2U6NULs8f/Ige1bLyTXI+BlKT9LPX07s4=
X-Received: by 2002:a05:6870:e893:b0:e2:ecbc:e581 with SMTP id
 q19-20020a056870e89300b000e2ecbce581mr389269oan.193.1649980317590; Thu, 14
 Apr 2022 16:51:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Apr 2022 16:51:57 -0700
MIME-Version: 1.0
In-Reply-To: <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 14 Apr 2022 16:51:57 -0700
Message-ID: <CAE-0n53vDRdndb7=ShovrJV0P1CvV0JgV6JTNQNMr-KWtyg8Jg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers to
 use DP AUX bus properly
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2022-04-08 19:36:23)
> As talked about in the kerneldoc for "struct dp_aux_ep_client" in this
> patch and also in the past in commit a1e3667a9835 ("drm/bridge:
> ti-sn65dsi86: Promote the AUX channel to its own sub-dev"), to use the
> DP AUX bus properly we really need two "struct device"s. One "struct
> device" is in charge of providing the DP AUX bus and the other is
> where we'll try to get a reference to the newly probed endpoint
> devices.
>
> In ti-sn65dsi86 this wasn't too difficult to accomplish. That driver
> is already broken up into several "struct devices" anyway because it
> also provides a PWM and some GPIOs. Adding one more wasn't that
> difficult / ugly.
>
> When I tried to do the same solution in parade-ps8640, it felt like I
> was copying too much boilerplate code. I made the realization that I
> didn't _really_ need a separate "driver" for each person that wanted
> to do the same thing. By putting all the "driver" related code in a
> common place then we could save a bit of hassle. This change
> effectively adds a new "ep_client" driver that can be used by
> anyone. The devices instantiated by this driver will just call through
> to the probe/remove/shutdown calls provided.
>
> At the moment, the "ep_client" driver is backed by the Linux auxiliary
> bus (unfortunate naming--this has nothing to do with DP AUX). I didn't
> want to expose this to clients, though, so as far as clients are
> concerned they get a vanilla "struct device".
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Is it correct that the struct dp_aux_ep_client is largely equivalent to
a struct dp_aux_ep_device? What's the difference? I think it is a fully
probed dp_aux_ep_device? Or a way to tell the driver that calls
of_dp_aux_populate_ep_devices() that the endpoint has probed now?

I read the commit text but it didn't click until I read the next patch
that this is solving a probe ordering/loop problem. The driver that
creates the 'struct drm_dp_aux' and populates devices on the DP aux bus
with of_dp_aux_populate_ep_devices() wants to be sure that the
drm_bridge made by the 'struct dp_aux_ep_driver' probe routine in
edp-panel is going to be there before calling drm_of_get_bridge().

	of_dp_aux_populate_ep_devices();
	[No idea if the bridge is registered yet]
	drm_of_get_bridge();

The solution is to retry the drm_of_get_bridge() until 'struct
dp_aux_ep_driver' probes and registers the next bridge. It looks like a
wait_for_completion() on top of drm_of_get_bridge() implemented through
driver probe and -EPROBE_DEFER; no disrespect!

Is there another problem here that the driver that creates the 'struct
drm_dp_aux' and populates devices on the DP aux bus with
of_dp_aux_populate_ep_devices() wants to use that same 'struct
drm_dp_aux' directly to poke at some 'struct dp_aux_ep_device' that was
populated? And the 'struct dp_aux_ep_device' may either not be probed
and bound to a 'struct dp_aux_ep_driver' or it may not be powered on
because it went to runtime PM suspend?

Put another way, I worry that the owner of 'struct drm_dp_aux' wants to
use some function in include/drm/dp/drm_dp_helper.h that takes the
'struct drm_dp_aux' directly without considering the device model state
of the endpoint device (the 'struct dp_aux_ep_device'). That would be a
similar problem as waiting for the endpoint to be powered on and probed.
Solving that through a sub-driver feels awkward.

What if we had some function like drm_dp_get_aux_ep() that took a
'struct drm_dp_aux' and looked for the endpoint device (there can only
be one?), waited for it to be probed, and then powered it up via some
pm_runtime_get_sync()? My understanding is that with edp-panel we have
two power "domains" of importance, the panel power domain and the DP/eDP
power domain. Access to the AUX bus via 'struct drm_dp_aux' needs both
power domains to be powered on. If the 'struct dp_aux_ep_device' is in
hand, then both power domains can be powered on by making sure the power
state of the 'struct dp_aux_ep_device::dev' is enabled. If only the
'struct drm_dp_aux' is in hand then we'll need to do something more like
find the child device and power it on.

Could the 'struct drm_dp_aux' functions in drm_dp_helper.h do this
automatically somehow? Maybe we can drop a variable in 'struct
drm_dp_aux' when of_dp_aux_populate_ep_devices() is called that the
other side may not be powered up. Then if something tries to transfer on
that aux channel it powers on all children of 'struct drm_dp_aux::dev'
that are on the 'dp_aux_bus_type' or bails out if those devices haven't
probed yet or can't be powered on.

> diff --git a/include/drm/dp/drm_dp_aux_bus.h b/include/drm/dp/drm_dp_aux_bus.h
> index 4f19b20b1dd6..ecf68b6873bd 100644
> --- a/include/drm/dp/drm_dp_aux_bus.h
> +++ b/include/drm/dp/drm_dp_aux_bus.h
> @@ -54,4 +54,62 @@ int __dp_aux_dp_driver_register(struct dp_aux_ep_driver *aux_ep_drv,
>                                 struct module *owner);
>  void dp_aux_dp_driver_unregister(struct dp_aux_ep_driver *aux_ep_drv);
>
> +/**
> + * struct dp_aux_ep_device - Helper for clients of DP AUX EP devices

dp_aux_ep_client?

> + *
> + * The DP AUX bus can be a bit tricky to use properly. Usually, the way
> + * things work is that:
> + * - The DP controller driver provides the DP AUX bus and would like to probe
> + *   the endpoints on the DP AUX bus (AKA the panel) as part of its probe
> + *   routine.
> + * - The DP controller driver would also like to acquire a reference to the
> + *   DP AUX endpoints (AKA the panel) as part of its probe.
> + *
> + * The problem is that the DP AUX endpoints aren't guaranteed to complete their
> + * probe right away. They could be probing asynchronously or they simply might
> + * fail to acquire some resource and return -EPROBE_DEFER.
> + *
> + * The best way to solve this is to break the DP controller's probe into
> + * two parts. The first part will create the DP AUX bus. The second part will
> + * acquire the reference to the DP AUX endpoint. The first part can complete
> + * finish with no problems and be "done" even if the second part ends up

s/finish//

> + * deferring while waiting for the DP AUX endpoint.
> + *
> + * The dp_aux_ep_client structure and associated functions help with managing
> + * this common case. They will create/add a second "struct device" for you.

create and add a second

> + * In the probe for this second "struct device" (known as the "clientdev" here)
> + * you can acquire references to the AUX DP endpoints and can freely return
> + * -EPROBE_DEFER if they're not ready yet.
> + *
> + * A few notes:
> + * - The parent of the clientdev is guaranteed to be aux->dev
> + * - The of_node of the clientdev is guaranteed to be the same as the of_node
> + *   of aux->dev, copied with device_set_of_node_from_dev().
> + * - If you're doing "devm" type things in the clientdev's probe you should
> + *   use the clientdev. This makes lifetimes be managed properly.
> + *
> + * NOTE: there's no requirement to use these helpers if you have solved the
> + * problem described above in some other way.
> + */
