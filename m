Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F4F80EA91
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 12:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4813710E197;
	Tue, 12 Dec 2023 11:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D466710E197
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 11:40:42 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso4125411276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 03:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1702381242; x=1702986042;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0iUPBvo8eOmT//4vl8DQjGC5UmJmCx85Al5r4t/jUw0=;
 b=Q9jiytPr0WRfO/MxnCw5NTSzi0IGpmr+gp3q6mFZYlP41E4Tdf3WXFMlzzrlCSQLQO
 jPL3ikiLH45Ly9yHgMhQm5LMOx+jkDs9oxvwTrZlq43fYnc7BCepIBne1+kg/5lpFoRy
 dsLNL7WhMz1P/1Iu4LsCQddu32jr8b9p/6P0XQ8KbTtHBXILQyIyPAet4g7p/d5YlE3R
 mdHo5WKo28unSzxlt0PJFwk+/FGR484l9Q8MhWT2Z3Ffk99e32sQXMIL+8ap2mWh6o4U
 ym0so9ePcqTEC2AnDWty0rfP9AVDiz/ZJKqN3KfFD2PQnTkliHFPWzymeG4W4lA8/Epk
 453g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702381242; x=1702986042;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0iUPBvo8eOmT//4vl8DQjGC5UmJmCx85Al5r4t/jUw0=;
 b=BBNhboTIYZ/kQmyDklmoQd/qyub+VyTWr5EHW+ZVa01aVGkxA9zs1sVRwm8wD52XA3
 3AN4RpuCFUYOu5+IpzK7MK6Y8MY7BA3af9+VgJlpX5wLyW7hpJGTKCR5Ideg092FM0PO
 5L5/Kextq0qX0XnIpaInzroexjm++j3dbWlVPD8Ppu5jyOAi/QibkuVKriMBg3kB46dU
 e+u/Ap7zdPRPzWI7tw5vRqZJUtcMUr5XBDnN9C9CGCwFk8QawFKSZIolLdrAxZES4l0M
 BhpguO6IC6exMgxcURFzZnMGt39rTux4xtlKujkXJLJhivYYDvX/EqkltQ3xcB7EVxt8
 d4Aw==
X-Gm-Message-State: AOJu0YwCU5+OWTkktVB6dAC1v82vRdLeYTmHKHvGgtktihG4BqOBnUqA
 ZMgSCaNjRNxjPFRLYxsekQ0Sye/9gNveaB8ZehaEnA==
X-Google-Smtp-Source: AGHT+IGkFxJXB+75F7npYS3Sl7fcGotb27eRrk6u5Q+tryG0nLGLjgw4n/C3z2I9FmEbcpAIdKRvpPS2VqJqFmY8cyo=
X-Received: by 2002:a25:ce8a:0:b0:db5:47ee:47c4 with SMTP id
 x132-20020a25ce8a000000b00db547ee47c4mr2442389ybe.53.1702381242014; Tue, 12
 Dec 2023 03:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20231207-kms-hdmi-connector-state-v5-0-6538e19d634d@kernel.org>
 <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
In-Reply-To: <20231207-kms-hdmi-connector-state-v5-18-6538e19d634d@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 12 Dec 2023 11:40:26 +0000
Message-ID: <CAPY8ntBe9RfSjdnd5Smx23La5gQaR9WqY8ehXQyp=4D_11N55Q@mail.gmail.com>
Subject: Re: [PATCH v5 18/44] drm/vc4: hdmi: Create destroy state
 implementation
To: Maxime Ripard <mripard@kernel.org>
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
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Dec 2023 at 15:50, Maxime Ripard <mripard@kernel.org> wrote:
>
> Even though we were rolling our own custom state for the vc4 HDMI
> controller driver, we were still using the generic helper to destroy
> that state.
>
> It was mostly working since the underlying state is the first member of
> our state so the pointers are probably equal in all relevant cases, but
> it's still fragile so let's fix this properly.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 25c9c71256d3..f05e2c95a60d 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -672,11 +672,21 @@ vc4_hdmi_connector_duplicate_state(struct drm_connector *connector)
>         return &new_state->base;
>  }
>
> +static void vc4_hdmi_connector_destroy_state(struct drm_connector *connector,
> +                                            struct drm_connector_state *state)
> +{
> +       struct vc4_hdmi_connector_state *vc4_state =
> +               conn_state_to_vc4_hdmi_conn_state(state);
> +
> +       __drm_atomic_helper_connector_destroy_state(state);
> +       kfree(vc4_state);
> +}
> +
>  static const struct drm_connector_funcs vc4_hdmi_connector_funcs = {
>         .fill_modes = drm_helper_probe_single_connector_modes,
>         .reset = vc4_hdmi_connector_reset,
>         .atomic_duplicate_state = vc4_hdmi_connector_duplicate_state,
> -       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +       .atomic_destroy_state = vc4_hdmi_connector_destroy_state,
>         .atomic_get_property = vc4_hdmi_connector_get_property,
>         .atomic_set_property = vc4_hdmi_connector_set_property,
>  };
>
> --
> 2.43.0
>
