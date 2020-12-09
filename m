Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B402D4567
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778FC6EA84;
	Wed,  9 Dec 2020 15:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5AC6EA84
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:29:52 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a3so2089695wmb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 07:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cTUfxBJNUwO1T4fl13WV399I1YLEJBhpcELektdjR9w=;
 b=qNmr75i7kpjdSbfa6wW6Ktl3iXxyLzDX49SNlexMY0uSkqjwPAwNS35LxDuy4C9lr+
 zKdU0eBFWu+v7QUccoDN3/F7WW3cilP/2FjgwdbHKIZDM+8045NYu+ml8ikn0cYICPk3
 qIamqvK7pAaEMltqUZIlRWTxjmTmH0x8V24Eednm8grG1JjG9vYUmSYKkL1Q8VFmZzY1
 rbQ74mSTUbZW/K7fgSGgw7XLAhfCWEBnL21U8ysX0VgyDuGZGciUEYlF2kPZ1VBak49H
 eji3aKYkYwQCNruuQjBEImU9dA5AuSWWtX3ln4TiyTjBBQ2Oz+fulAxfSIZs3vx22ugJ
 oLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cTUfxBJNUwO1T4fl13WV399I1YLEJBhpcELektdjR9w=;
 b=F+OfgCFDMxPyFKQI2kJLWiV5bwHLlA8hnpFWQuB5AQnDZ/jtwE3683afFE9LXK49uZ
 Yas3GgJi3zhIZUIwg/lLpM73s8CyxuoXYH0GCAjSSH8mUS2AmICbKoMJXfe/EsYdAEYI
 dSNl9wHin/Zek6Uyv+SxaXMDfVejsBHnXbrdmXx/kKqQjLo8MB0Q5XO0kV7XeUa8Q0tP
 do4++dyqPv0Pfy2ohANqzGia/fCKATO1FtkUtz0gIjYU4GcPfae7/MHKHRoCZo1FLRc2
 wKXRrr33ijshDwwhl65yw2PqdU4zH7HsGE9LIB0lxwYUuhSD5PkXVSkr7fNByV64pugC
 dBkg==
X-Gm-Message-State: AOAM532tMTPPZC0n+KvyVJksVdmGcND2khAo/djZjwDASu24Yo3z1S2H
 5+hYkvUJiFYCz3BJB1TwJG0jPdYPoNR78jCoCVfBiQ==
X-Google-Smtp-Source: ABdhPJxdQ0Y+HwcwgqEfTEi/96nYrHAl+SWPLcxJnKIywsNeghQ58PRGFYvDZ3CKxuff9Y4Kv6Zuz6wVu5PzoCKZFRE=
X-Received: by 2002:a1c:bc88:: with SMTP id m130mr3457927wmf.82.1607527791573; 
 Wed, 09 Dec 2020 07:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-4-maxime@cerno.tech>
In-Reply-To: <20201207155719.17149-4-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Dec 2020 15:29:36 +0000
Message-ID: <CAPY8ntAmKpLNjmCyv4mJAxnsjsOnBcN+kmV1tSH_9+JiF1VmTA@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] drm/vc4: hdmi: Take into account the clock
 doubling flag in atomic_check
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Mon, 7 Dec 2020 at 15:57, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 63495f6b4aed ("drm/vc4: hdmi: Make sure our clock rate is within limits")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 5a608ed1d75e..a88aa20beeb6 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -796,6 +796,9 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
>                 pixel_rate = mode->clock * 1000;
>         }
>
> +       if (mode->flags & DRM_MODE_FLAG_DBLCLK)
> +               pixel_rate = pixel_rate * 2;
> +
>         if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>                 return -EINVAL;
>
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
