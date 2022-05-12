Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328652423B
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 03:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870A610E4D3;
	Thu, 12 May 2022 01:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D0010F8D4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 01:58:33 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id y63so4816376oia.7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 18:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Ew6wAX9YihrNznSFxG+GfB43C9Zeo824boapu8VVX0Y=;
 b=A2dNMrO5TZBA3uubMg3LoxxHktyTrpGgR9A7Z1wODLEXSPCMP6NdyLRepwqtDIBA2w
 XpvUEtOHgkC8CjQ2+JN5OiKrYnwNbDS6A5Xnq2iFbxHBDmT6A2ZiFhOsY9Y8loaQ/QgG
 llbcSHjRSIP163ztRPz8tCEQrWwg8V/GLuVEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Ew6wAX9YihrNznSFxG+GfB43C9Zeo824boapu8VVX0Y=;
 b=7WQLJHMsL4Kf8o32Rgi6sXh/aEt1fBKAM4nf18aJHWp09OrQCcgSxPuzG2/7x+SjQ+
 AG+QByhvizNVgIQiTnyJQiaCNZoxhbj572fvVOb+AcySQwoWwdHjlpYOnAgDG6TQyJ9P
 9rEuHMmfxAVpZGLkawLnZztIqONsGe76Px1hLU+Dwiwj+/duJwqB7BS7pcem5y9byvUC
 NSuq3azPTDtH+b3FdDQqtOevQsDkTU3gZ/0rVEqn4EQRgVjq+10OCGdeCXPd1kxv2JAb
 JAviDoG4CPuozXvRtIB5St6cH4Ue8mGpTGSqAeyM7x5jqJmByt2CUWa0cHWouQ65wCsP
 wbAg==
X-Gm-Message-State: AOAM530MmayUxG0x/qlbbOogh6QQCXcaKtugFg1u+H7yukQpsaYenqg0
 AEuIW4YRIbzeqFijnW5jT9srp/OoeFDn7eYA8U1Dcw==
X-Google-Smtp-Source: ABdhPJx0Dlj1uzL7cIUiHfs3RnHj2J1c7/H0WVTcAkonpSNzGOGYsQOmIq+nRxa3NGvGJ9MXBe+33UKZZ/N2u5EPwAA=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr3935796oiw.193.1652320712791; Wed, 11
 May 2022 18:58:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 May 2022 18:58:32 -0700
MIME-Version: 1.0
In-Reply-To: <20220418101725.v3.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
References: <20220418171757.2282651-1-dianders@chromium.org>
 <20220418101725.v3.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 11 May 2022 18:58:32 -0700
Message-ID: <CAE-0n51iNXN4oOP-wAqrm9U6qC84fQ+qMUBu0BODXjsCDk+H=w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/dp: Add wait_hpd_asserted() callback to struct
 drm_dp_aux
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
 Philip Chen <philipchen@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2022-04-18 10:17:54)
> Sometimes it's useful for users of the DP AUX bus (like panels) to be
> able to poll HPD. Let's add a callback that allows DP AUX busses
> drivers to provide this.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Left Dmitry's Reviewed-by tag off since patch changed enough.
>
> (no changes since v2)
>
> Changes in v2:
> - Change is_hpd_asserted() to wait_hpd_asserted()
>
>  include/drm/dp/drm_dp_helper.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> index 53d1e722f4de..0940c415db8c 100644
> --- a/include/drm/dp/drm_dp_helper.h
> +++ b/include/drm/dp/drm_dp_helper.h
> @@ -2035,6 +2035,32 @@ struct drm_dp_aux {
>         ssize_t (*transfer)(struct drm_dp_aux *aux,
>                             struct drm_dp_aux_msg *msg);
>
> +       /**
> +        * @wait_hpd_asserted: wait for HPD to be asserted
> +        *
> +        * This is mainly useful for eDP panels drivers to wait for an eDP
> +        * panel to finish powering on. This is an optional function.

Is there any use for the opposite direction? For example, does anything
care that HPD is deasserted?

> +        *
> +        * This function will efficiently wait for up to `wait_us` microseconds
> +        * for HPD to be asserted and might sleep.
> +        *
> +        * This function returns 0 if HPD was asserted or -ETIMEDOUT if time
> +        * expired and HPD wasn't asserted. This function should not print
> +        * timeout errors to the log.
> +        *
> +        * The semantics of this function are designed to match the
> +        * readx_poll_timeout() function. That means a `wait_us` of 0 means
> +        * to wait forever. If you want to do a quick poll you could pass 1
> +        * for `wait_us`.

It would also make sense to have a drm_dp_wait_hpd_asserted() API

  int drm_dp_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_us);

and then this aux function could be implemented in various ways. The API
could poll if the aux can only read immediate state of HPD, or it could
sleep (is sleeping allowed? that isn't clear) and wake up the process
once HPD goes high. Or if this op isn't implemented maybe there's a
fixed timeout member that is non-zero which means "sleep this long".
Either way, making each drm_dp_aux implement that logic seems error
prone vs. having the drm_dp_aux implement some function for

	get_immediate_hpd(struct drm_dp_aux *aux)

or

	notify_on_hpd(struct drm_dp_aux *auxstruct completion *comp)

> +        *
> +        * NOTE: this function specifically reports the state of the HPD pin
> +        * that's associated with the DP AUX channel. This is different from
> +        * the HPD concept in much of the rest of DRM which is more about
> +        * physical presence of a display. For eDP, for instance, a display is
> +        * assumed always present even if the HPD pin is deasserted.
> +        */
> +       int (*wait_hpd_asserted)(struct drm_dp_aux *aux, unsigned long wait_us);
> +
>         /**
>          * @i2c_nack_count: Counts I2C NACKs, used for DP validation.
>          */
