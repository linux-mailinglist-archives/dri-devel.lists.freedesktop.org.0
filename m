Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4E3A9824
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 12:51:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858E76E56D;
	Wed, 16 Jun 2021 10:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF5E6E56D
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 10:51:43 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id m18so2156042wrv.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 03:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ror3HEGQij43KsNy/OhimJcbX50+3r96xDmjcLIvB/I=;
 b=tycBPRkwiJJgdgl38Lv7Pbzi1GyJQkD+N4Nlm9LiOW0HqR7WpdS9UVbSMDlJoCBvOX
 DWGtV/5m70Ud6B6RlIJycRtUVvGPR1y/j85WZKDAdXe6+wEzOnY+kgmjDcqi5qs21zds
 kzgM0ZOhi/BNIo10Dj0CRX3OwY513+4wNxfTkQTlguc4mdSzLeqLexhS46IkjZBY9Q/e
 gZpFFAnCE4+FIeiGEeV/Jr2p2/ZUSfviZrKUyQc+Jz0BoaaV12bb86AitfI4Uz+grn6r
 7VJbWX8Iu+bgwSE6d+lPYM+mbcSYFHXGLaw6ZnCcvNAzQHwIlEMpFfczfFvQAxwU8h1b
 r/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ror3HEGQij43KsNy/OhimJcbX50+3r96xDmjcLIvB/I=;
 b=J9jOMSEX5YQoW8xNYxEmwFO4hnDKWy4iQqb3AXbW+fVMQWegd+JEAQgp9giOh771Q2
 OH/EHcwWZaEALRVpXdxVV/6O0yojqA772Koe9+9ySJ5UvlOiQLxgIbo/7+zHuAhwF27P
 hSp3fxlloZ0sWPd1ZT44zQ8iWw2VylbMAskh9VI0ZFuWXvZVXcrdOYYRUbxShVpEU+E0
 pOUbnk4MxdNny3Fnxptgaoso5UITBf2t/8g/+fWR2t0iJz6+ur3G4z7//HdIithSYrC5
 wKyAjvd8gLmB3+vusXohS9suKCQFx1+XpvAYHkVZDcjyureyLZhLZV0x4z8v/NeHTeI4
 z6zw==
X-Gm-Message-State: AOAM533/No/4i0HMC40TEQTb+DHUN32DZiosGAX+L/1J+gj/RyA/sRd4
 X60k7V03ua6ysZIBm2t0Ln7wwtIqkXogjHuXQUsAmg==
X-Google-Smtp-Source: ABdhPJz8mBKR0UC3894Y0jb6bNx9tenCDSO/hzmMNNVW02Aft0Lpe5TMqmF0GWIVfpIPRtcI4B7LzDKl2/sO47r66b8=
X-Received: by 2002:a5d:47ce:: with SMTP id o14mr4501345wrc.273.1623840702553; 
 Wed, 16 Jun 2021 03:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210525091059.234116-1-maxime@cerno.tech>
 <20210525091059.234116-4-maxime@cerno.tech>
In-Reply-To: <20210525091059.234116-4-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 16 Jun 2021 11:51:26 +0100
Message-ID: <CAPY8ntDfoKLwWG6pkPNvq78C3e5WzXNCVtCykJrrHhZ0UcrjTg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/vc4: hdmi: Make sure the controller is powered in
 detect
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eric Anholt <eric@anholt.net>, Tim Gover <tim.gover@raspberrypi.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 May 2021 at 10:11, Maxime Ripard <maxime@cerno.tech> wrote:
>
> If the HPD GPIO is not available and drm_probe_ddc fails, we end up
> reading the HDMI_HOTPLUG register, but the controller might be powered
> off resulting in a CPU hang. Make sure we have the power domain and the
> HSM clock powered during the detect cycle to prevent the hang from
> happening.
>
> Fixes: 4f6e3d66ac52 ("drm/vc4: Add runtime PM support to the HDMI encoder driver")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 867009a471e1..4b6857467e58 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -166,6 +166,8 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>         struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
>         bool connected = false;
>
> +       WARN_ON(pm_runtime_resume_and_get(&vc4_hdmi->pdev->dev));
> +
>         if (vc4_hdmi->hpd_gpio) {
>                 if (gpio_get_value_cansleep(vc4_hdmi->hpd_gpio) ^
>                     vc4_hdmi->hpd_active_low)
> @@ -187,10 +189,12 @@ vc4_hdmi_connector_detect(struct drm_connector *connector, bool force)
>                         }
>                 }
>
> +               pm_runtime_put(&vc4_hdmi->pdev->dev);
>                 return connector_status_connected;
>         }
>
>         cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> +       pm_runtime_put(&vc4_hdmi->pdev->dev);
>         return connector_status_disconnected;
>  }
>
> --
> 2.31.1
>
