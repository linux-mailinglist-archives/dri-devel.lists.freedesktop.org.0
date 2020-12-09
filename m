Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3986A2D4532
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 16:20:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F5A6EA75;
	Wed,  9 Dec 2020 15:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAA26EA75
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 15:20:46 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q75so2054556wme.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 07:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yLHTUEMqEsVymCbbRW/m8T5XORY7zfjPXDgyznTVKGI=;
 b=kkwxoSzZLnObQaaJ6ZtIF6nZLt9ou1obeU4e4nI/i7ieJNdC0tM39AsQnd8N2N4JgD
 FR4dV1EpctJC3tMIaH2NmfHNBgHi3flK2c9IedEItq1ksma3Pomgf9MpNnqGeSgATLkW
 mHvO5cNDi1YPiIGUhBYjt4DoBK9y82dYCOosluTNaEU5yRetKNPl2/gnhn30Itup2VyS
 CanRWQ3iXJYsxik6Js5naHO4QBlZEgQXqJwERoKuo1cz/ivfX61zri+87QP4MKwCSyCz
 LeS74DH+7MpiRSxXN8QF7xfv8m0sSSk412AzpCJIauIhhHBxm+0ySW19ikBGyyEWYp6s
 3ZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yLHTUEMqEsVymCbbRW/m8T5XORY7zfjPXDgyznTVKGI=;
 b=DIADO0M5fIBLhM7cjMTddFllLaWWwAnYCiZnlnV133TbWcg9EzEqkI8/JGvUoSbrQ9
 qgNJgisyQHmk8k1F/ZAnbLRgWD78kXqJzZ6DBjXSKGBzWG2m1WN1v81yBqccFpn5h3l3
 hbf5V8Ne2jCEB9UaScibh1SnatvqKGrhA4RqPgwW3X2N1yQrfyY0qfbfSLhWrg1D1xRO
 CX0InFWvcKs+6AjiByPSvOxM7B5+xVF95uSKrU8ptat4Lf8EKJYMCOCL18xARs4Jf3BR
 ow86Dmcwkiv7T3x9uf4ySvutaxjIAZl8FQV+4bTalh2VI3GLjvVEtCO+xQ3GthoyLU+f
 yahA==
X-Gm-Message-State: AOAM5324we0QnvL0WfGuzlIvVlKCnURyS9SUdPapEQ8Kmg/+L3CUGwJN
 SCkETNqOPV3Q9vDyoqvtQHRdl6SxqVVI/1ZvnLdQxA==
X-Google-Smtp-Source: ABdhPJyFylqdqvCa3yVhz9mJjfIn5+E/OMvvFWfhhgBYtXS6iJLHCpEL7J4F7jPiFKRu0GLvJ0jAskosi3rrtuOym44=
X-Received: by 2002:a1c:5447:: with SMTP id p7mr3325491wmi.116.1607527245156; 
 Wed, 09 Dec 2020 07:20:45 -0800 (PST)
MIME-Version: 1.0
References: <20201207155719.17149-1-maxime@cerno.tech>
 <20201207155719.17149-5-maxime@cerno.tech>
In-Reply-To: <20201207155719.17149-5-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Dec 2020 15:20:30 +0000
Message-ID: <CAPY8ntC5VPc8Ctcxdp9vyrt1de2Y3dAO9fpqKJCMNe2gjTAc2A@mail.gmail.com>
Subject: Re: [PATCH v5 4/9] drm/vc4: hdmi: Don't access the connector state in
 reset if kmalloc fails
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
> drm_atomic_helper_connector_reset uses kmalloc which, from an API
> standpoint, can fail, and thus setting connector->state to NULL.
> However, our reset hook then calls drm_atomic_helper_connector_tv_reset
> that will access connector->state without checking if it's a valid
> pointer or not.
>
> Make sure we don't end up accessing a NULL pointer.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index a88aa20beeb6..61039cc89d9d 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -171,7 +171,9 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
>  static void vc4_hdmi_connector_reset(struct drm_connector *connector)
>  {
>         drm_atomic_helper_connector_reset(connector);
> -       drm_atomic_helper_connector_tv_reset(connector);
> +
> +       if (connector->state)
> +               drm_atomic_helper_connector_tv_reset(connector);
>  }
>
>  static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
