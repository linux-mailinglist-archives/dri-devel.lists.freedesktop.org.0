Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC766D2346
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 16:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF97D10E0A9;
	Fri, 31 Mar 2023 14:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545B410E0A9
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 14:58:24 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id j7so27730320ybg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 07:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680274703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+9vywVkizA1/BL+IoFGg5oSdyRUHG9JaCTPgm6cyxaI=;
 b=RiEUbASd4Nv2bK5U0NfdCxz+zGU9jvca9t9L9dX8WOCA+TKl2+UavAzbHhwokVPtii
 Ns/nmgxsMfcFREXylGBnoQNH6yVWzO9I2/Lr3fBUhDBuQ1B02+IPW9wI7Go+UeQ767GJ
 EhsoUgCVLsyu3PM+cZRxuOjp9fXxG+208DkvZObKFf5+Y4mixJ7fwrqXVbbPt7cvcmzD
 GgRTzUc4OrI0bZSmug8TxFMTjUjrbMYcNWhYjrwVdDTxEPvyavmLqideHlzGIoFLPTw+
 WE795LitI1h0crKga2+zmrGOIs39+D7z1ih/3NIVqwwwnnbEjuSYrYJrTMzC7ozAKF+L
 5z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680274703;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+9vywVkizA1/BL+IoFGg5oSdyRUHG9JaCTPgm6cyxaI=;
 b=EnHSwOfvEhj004LaH1jL/CdmO7a5EoothyJwsVIdjaPFDrmKm5VPTq78cxhzYJDYB3
 gNe9JDLkJVwwDWesYg47ejJNK7DwanOJzOLnURoyl9msVhBnCdyB5thuhLcs0FrDwwSD
 /iO0oGnzGqO3DIPn1hfplb6P/9PWPuLuEwkBlvKeFAjyX5Pyrd68SUE7CCbWcbVkwDZ6
 JoQkGI7VmvywCG7R/6XuEM62K5tN8KoxAaxQwg3AqsHvpegmazWBu2Mp6sbgTzWVzKbf
 DFJZmCcsdxX54MyIU2LV/fI2+N8IT76wcK8AyKgBbdrQhaIBstbHwFdyBzDR/dZ+ybcP
 Et7Q==
X-Gm-Message-State: AAQBX9cD0uBOh2yd8n06udL1KIqu35oxr7Lr4o+QRSOBZM03X7whFZjm
 lYK8doPG2gCRdA9VqbLDZ9mUdFIQvCrCp0G72AD2fqdixJ5niGtF
X-Google-Smtp-Source: AKy350asvDklS51ndeBMVx+J7/M6JaGcY9r/+cXahsDugorB/yziYIP20bAOPlDlUaFmd1YvBHiWeGw991/U9/QIB18=
X-Received: by 2002:a25:d747:0:b0:b82:410e:daae with SMTP id
 o68-20020a25d747000000b00b82410edaaemr211714ybg.9.1680274703429; Fri, 31 Mar
 2023 07:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <1680271114-1534-1-git-send-email-quic_vpolimer@quicinc.com>
 <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1680271114-1534-4-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 31 Mar 2023 17:58:12 +0300
Message-ID: <CAA8EJppc3LDQy2RgVZbWki4Y-_FOTK67Y8RfK5Bm9gqdfqMjqQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] msm: skip the atomic commit of self refresh while
 PSR running
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 quic_sbillaka@quicinc.com, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com,
 linux-arm-msm@vger.kernel.org, quic_khsieh@quicinc.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Mar 2023 at 16:59, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> In certain CPU stress conditions, there can be a delay in scheduling commit
> work and it was observed that PSR commit from a different work queue was
> scheduled. Avoid these commits as display is already in PSR mode.
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 645fe53..f8141bb 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -192,6 +192,9 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>                         new_crtc_state->mode_changed = true;
>                         state->allow_modeset = true;
>                 }
> +
> +               if (old_crtc_state->self_refresh_active && new_crtc_state->self_refresh_active)
> +                       return -EINVAL;

EINVAL here means that atomic_check will fail if both old and new
states are in SR mode. For example, there might be a mode set for
another CRTC (while keeping this one in SR mode). I don't think this
is correct. We should skip/shortcut the commit, that's true. But I
doubt that returning an error here is a proper way to do this. Please
correct me if I'm wrong.

>         }
>
>         return drm_atomic_helper_check(dev, state);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
