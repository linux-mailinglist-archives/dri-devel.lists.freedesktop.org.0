Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CEF614C91
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 15:30:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C1510E121;
	Tue,  1 Nov 2022 14:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E1010E121
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 14:29:54 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-13b23e29e36so16964984fac.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 07:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=D+xCRx601mtoVLibkTpSK9YAYKRx4dB22ipYCRn77xA=;
 b=ZnbhHKUFkIEoOZF95AIjk86gAR6eM2JMM6kcdSjWXuxz69kMSxPQqCoTrh6WRavhjW
 ej8JjAo4UC5Ww6dNPUlVm+SO9eCW4gKnF2MnqOsVv0TEcZySLQEXNo5ik7n73ssB2LIx
 3qzEVO3DCg+kQl/PTuxOPiMsZ0uPrvrA5pFkxQZKObTsdilp1oLtY4JDE3lnl8fD2oeI
 7HjEf4TOFFb3xYaxhHxVRJeAFBf05dS2z/kq4ha4NSN4nj4UKb62rONvz2vdpRFI3Q+y
 YGV4ZWmzDMQZ/8ZC8dH11G2k0rnPbrHB1/uwuaVFI4Bgw7hsaB1EFK3tYguO62nFtZb3
 Jh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D+xCRx601mtoVLibkTpSK9YAYKRx4dB22ipYCRn77xA=;
 b=euI5ILlnkdAHqjwUvPAPbx5BfKu4MeC9w0PGu8jn7rS5WKJVpevZBcFL5Sqv2LOaUd
 DOh7VyIM7O8Z/fNtKmL1SS9oqohqlSHfMuIkZ/zrWxoUk7n9UFSoT8430sKeBLQPwQ6B
 eSl1zCjd5+CYDrmF7j2HIBKITbYAOQ1l7zQbTCpk59D1+fUjg7sHF81YGLpVwXLVGJQY
 kVW08BgwJJjFeSJweiMkhcsLCn/dA/+ew9b/Z9ZZiwzdzWOnNQWfXCgK7+OJ6SQeCui1
 UBaK+IgqTm+ar6Zov16T/bwt1wD74ks8EdjXj32uLwhTQeRaicPIgT5Gj7VJdKj7Px4f
 3lIQ==
X-Gm-Message-State: ACrzQf29qobPq8TvAXwPF3Tk/ILq8uVMb6REult2E1eaQKCvFRbPhXsX
 Qes8nlWRvV6t+2kyAm+xQlcE0pcI5lG7b2aihGgKgNL+yvc=
X-Google-Smtp-Source: AMsMyM7C2E/7wXsA+awOfCZiQMYsQgktNankt/lnAfBWNBgwVIU9kXqYpoNCLmkbD+KmKE6iOglYmnXOACKEvaLJZqE=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr11402686oao.96.1667312993520; Tue, 01
 Nov 2022 07:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221031064918.14178-1-tiwai@suse.de>
In-Reply-To: <20221031064918.14178-1-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 1 Nov 2022 10:29:40 -0400
Message-ID: <CADnq5_NVo8wXXBx+iMMFAvuxr77t96fXF8Krw1_fPUOsOtJMzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Use a local mutex for bind/unbind protection
To: Takashi Iwai <tiwai@suse.de>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 31, 2022 at 2:49 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> We used drm_modeset_lock_all() for protecting the audio component
> bind/unbind operations against the notification, but it seems leading
> to kernel WARNING and Oops.  Moreover, the use of
> drm_modeset_lock_all() is rather an overkill only for this
> protection.
>
> This patch introduces a new mutex that protects just the bind/unbind
> and the notify calls and replaces the drm_modeset_lock with it.
>
> Fixes: 34d84636e5e0 ("drm/radeon: Add HD-audio component notifier support (v4)")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1569
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Applied.  I will squash this in with 34d84636e5e0.

Alex

> ---
>  drivers/gpu/drm/radeon/radeon.h        |  1 +
>  drivers/gpu/drm/radeon/radeon_audio.c  | 21 ++++++++++++---------
>  drivers/gpu/drm/radeon/radeon_device.c |  1 +
>  3 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
> index d82424525f5a..2e7161acd443 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -1799,6 +1799,7 @@ struct r600_audio {
>         struct radeon_audio_basic_funcs *funcs;
>         struct drm_audio_component *component;
>         bool component_registered;
> +       struct mutex component_mutex;
>  };
>
>  /*
> diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
> index 4ceb90556127..71b67d4efe08 100644
> --- a/drivers/gpu/drm/radeon/radeon_audio.c
> +++ b/drivers/gpu/drm/radeon/radeon_audio.c
> @@ -181,8 +181,7 @@ static struct radeon_audio_funcs dce6_dp_funcs = {
>         .dpms = evergreen_dp_enable,
>  };
>
> -static void radeon_audio_component_notify(struct drm_audio_component *acomp,
> -                                         int port);
> +static void radeon_audio_component_notify(struct radeon_device *rdev, int port);
>
>  static void radeon_audio_enable(struct radeon_device *rdev,
>                                 struct r600_audio_pin *pin, u8 enable_mask)
> @@ -212,7 +211,7 @@ static void radeon_audio_enable(struct radeon_device *rdev,
>         if (rdev->audio.funcs->enable)
>                 rdev->audio.funcs->enable(rdev, pin, enable_mask);
>
> -       radeon_audio_component_notify(rdev->audio.component, pin->id);
> +       radeon_audio_component_notify(rdev, pin->id);
>  }
>
>  static void radeon_audio_interface_init(struct radeon_device *rdev)
> @@ -731,12 +730,16 @@ unsigned int radeon_audio_decode_dfs_div(unsigned int div)
>  /*
>   * Audio component support
>   */
> -static void radeon_audio_component_notify(struct drm_audio_component *acomp,
> -                                         int port)
> +static void radeon_audio_component_notify(struct radeon_device *rdev, int port)
>  {
> +       struct drm_audio_component *acomp;
> +
> +       mutex_lock(&rdev->audio.component_mutex);
> +       acomp = rdev->audio.component;
>         if (acomp && acomp->audio_ops && acomp->audio_ops->pin_eld_notify)
>                 acomp->audio_ops->pin_eld_notify(acomp->audio_ops->audio_ptr,
>                                                  port, -1);
> +       mutex_unlock(&rdev->audio.component_mutex);
>  }
>
>  static int radeon_audio_component_get_eld(struct device *kdev, int port,
> @@ -787,11 +790,11 @@ static int radeon_audio_component_bind(struct device *kdev,
>         if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
>                 return -ENOMEM;
>
> -       drm_modeset_lock_all(dev);
> +       mutex_lock(&rdev->audio.component_mutex);
>         acomp->ops = &radeon_audio_component_ops;
>         acomp->dev = kdev;
>         rdev->audio.component = acomp;
> -       drm_modeset_unlock_all(dev);
> +       mutex_unlock(&rdev->audio.component_mutex);
>
>         return 0;
>  }
> @@ -805,11 +808,11 @@ static void radeon_audio_component_unbind(struct device *kdev,
>
>         device_link_remove(hda_kdev, kdev);
>
> -       drm_modeset_lock_all(dev);
> +       mutex_lock(&rdev->audio.component_mutex);
>         rdev->audio.component = NULL;
>         acomp->ops = NULL;
>         acomp->dev = NULL;
> -       drm_modeset_unlock_all(dev);
> +       mutex_unlock(&rdev->audio.component_mutex);
>  }
>
>  static const struct component_ops radeon_audio_component_bind_ops = {
> diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
> index 17bfbbe906c8..2e13ce2b65d3 100644
> --- a/drivers/gpu/drm/radeon/radeon_device.c
> +++ b/drivers/gpu/drm/radeon/radeon_device.c
> @@ -1312,6 +1312,7 @@ int radeon_device_init(struct radeon_device *rdev,
>         mutex_init(&rdev->pm.mutex);
>         mutex_init(&rdev->gpu_clock_mutex);
>         mutex_init(&rdev->srbm_mutex);
> +       mutex_init(&rdev->audio.component_mutex);
>         init_rwsem(&rdev->pm.mclk_lock);
>         init_rwsem(&rdev->exclusive_lock);
>         init_waitqueue_head(&rdev->irq.vblank_queue);
> --
> 2.35.3
>
