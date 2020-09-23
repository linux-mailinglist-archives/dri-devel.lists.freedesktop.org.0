Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4C5275AEA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 16:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46596E14F;
	Wed, 23 Sep 2020 14:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89A86E14F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 14:59:22 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id x23so334151wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 07:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V+cBklJTbxYu9jB6G1xk7C0JryKFWDhHimn2GGsMfGA=;
 b=AQveBjZfQtcczRa+ojQtsU7d8VOaL11K+JXl+IQhkrwEtIz/vQSMBUGoPGBrZc+N0k
 t7QWWNn06UjQxhBeITMKxfKds8gKr+pPpUUQqL2NXta/qU5iNSa3483rcjqmuwuWeFG1
 oo87hOaGMnHrFyuiZ00bLzK1Jgl2QevBPgfLNafgXhkmoHrjexDu0KztGb7ga+hF9xD5
 40UlXiwNYA5/jSDkUFyzJcqujfwKB3QpE0eh6O+nwCQId3ModudEZLSRZfhce5ckkixS
 214lFBTaACALuxfjLXhDVJHbDgF6s/erlnPf3yMDKJZklHCOTEcLi7fdLHufNu/g3rhd
 YxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V+cBklJTbxYu9jB6G1xk7C0JryKFWDhHimn2GGsMfGA=;
 b=GCHYlqh165CGXHGhHAbj2MBwj8yUIv90TKhiahTuKTP50nfSmq4X/h5Wyexj0d+JD2
 2T6aqsRsXQ3S8NcsHYPWHyrbgngJuBWiuF/3hApFwuvqhKuHFAH2A69MnXYs00mUP0qy
 8N/nxIaRgr+Z5YEQSj3ANPCsMtmHjFGphnsNLeAR3kGNgH4XcUBAlHWuu3cC+w0SJVLl
 D6J8nJISsnvqE9pSLVWvqks48h4MwOchYkyUBlstz/bPnbxZ17g/Hz9ACqV5neJlUUbg
 J8w0mSCakL7c6Q/rv2J7m83c/8JN0NmHU9G8XkeppA4GXH3StSlFIQ4UZNnoiC7cqDHt
 kjkg==
X-Gm-Message-State: AOAM533zAoq3bFU0qkzFlCHhFZZk2YRpCVNujEj8je7fo3Tt3igFnPQA
 BCDxinRiWlMwDfvSFaUpyhG/hGAv1SCKZuBtbyg4Lw==
X-Google-Smtp-Source: ABdhPJyonWaK5otYZjjA8LSK93DhYkssLdpA8YXh72uKx+M0CKmwDCUhnSVjREzehQZsAlVACbr39TpNjuIOqiDrqWk=
X-Received: by 2002:a1c:4303:: with SMTP id q3mr6947852wma.158.1600873161435; 
 Wed, 23 Sep 2020 07:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200923084032.218619-1-maxime@cerno.tech>
In-Reply-To: <20200923084032.218619-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Sep 2020 15:59:04 +0100
Message-ID: <CAPY8ntAjiBeAoB=PZzNWW_5Vi3ZstXnD59GSkPXoeBj4XbGt0Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/vc4: crtc: Rework a bit the CRTC state code
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 23 Sep 2020 at 09:40, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The current CRTC state reset hook in vc4 allocates a vc4_crtc_state
> structure as a drm_crtc_state, and relies on the fact that vc4_crtc_state
> embeds drm_crtc_state as its first member, and therefore can be safely
> casted.

s/casted/cast

> However, this is pretty fragile especially since there's no check for this
> in place, and we're going to need to access vc4_crtc_state member at reset
> so this looks like a good occasion to make it more robust.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Based on the issue I perceived with the previous patch, I'm happy. I
haven't thought about how the framework handles losing the state, but
that's not the driver's problem.

There is still an implicit assumption that drm_crtc_state is the first
member from the implementation of to_vc4_crtc_state in vc4_drv.h. To
make it even more robust that could be a container_of instead. I
haven't checked for any other places that make the assumption though.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>
> Changes from v1:
>   - new patch
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index a393f93390a2..7ef20adedee5 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -852,11 +852,18 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
>
>  void vc4_crtc_reset(struct drm_crtc *crtc)
>  {
> +       struct vc4_crtc_state *vc4_crtc_state;
> +
>         if (crtc->state)
>                 vc4_crtc_destroy_state(crtc, crtc->state);
> -       crtc->state = kzalloc(sizeof(struct vc4_crtc_state), GFP_KERNEL);
> -       if (crtc->state)
> -               __drm_atomic_helper_crtc_reset(crtc, crtc->state);
> +
> +       vc4_crtc_state = kzalloc(sizeof(*vc4_crtc_state), GFP_KERNEL);
> +       if (!vc4_crtc_state) {
> +               crtc->state = NULL;
> +               return;
> +       }
> +
> +       __drm_atomic_helper_crtc_reset(crtc, &vc4_crtc_state->base);
>  }
>
>  static const struct drm_crtc_funcs vc4_crtc_funcs = {
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
