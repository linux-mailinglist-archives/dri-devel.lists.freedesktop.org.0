Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA3C2F2A4D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B0C6E141;
	Tue, 12 Jan 2021 08:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22A26E141
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:49:17 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id d203so1617671oia.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iad8sxGnASYHsbh1yO920OHJWwDu1aDtjauAZEVVXc8=;
 b=X5qShR7gboYBGGDdHxPkv74wg2Ry7xRW+XXwOz4MzDP0RZLQwiOCjl6e7QoQ2ogAg3
 6qJU+7fn4V3YNh1ACf2I0DmEmK/VXDMRYWtp9ldCZ6pE6bsqtcxmmMclLjS1GW9iR0vU
 btMXz5P/SpZuv4LLWhEa5PyOUtS3x6Sics6fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iad8sxGnASYHsbh1yO920OHJWwDu1aDtjauAZEVVXc8=;
 b=tg0de9A9av4sL0gUxySr1riF+IXuIPyRmjp7HTdaYMqfJRPSOIZ9EqRB38j+Lv11EZ
 e655LFUzSJ0cq+tk4PrOe22/mpQEDIqw6y0nc/4I19Rrl0O35tDyKNVBMGclIIeYNGVK
 KeQXNxVBj1XD7AE8ATsfj7PcqHN2xoIsGtu53vUJZ8PQR1MsG4c6ek6cit5lf3YPFaDt
 VYGEC6HRfdBnZ2nVjMECMM51VAe7udSrgE1+Sohbcvh8bpsM/ZN3TEj1WaEns1c7/DLP
 e/w9BNbKuhQ3/Fgi6uvtz47eCfy+w6EFGLuD7P+3sgbIXr/r543upIHTy3M/D+8/Rxv3
 sOJQ==
X-Gm-Message-State: AOAM531X3SWeYRxHWzA7LU0PuCidul+YLOMlpCJx/Y2zHgSR0a+GF6Mv
 vXOPCqkn+IwtRpS3HGP6QHzxqwx5cUIYGXRJluKqPMktzrujdQ==
X-Google-Smtp-Source: ABdhPJwQXIiUxAhol2b7xfDhzVRvf12UuRsJyQ0PCvP7dyaVb4BnHKdzyEC4yzsmgLpENwHd9/jv9NupX0yke6BpoaU=
X-Received: by 2002:aca:4d08:: with SMTP id a8mr1740978oib.128.1610441356929; 
 Tue, 12 Jan 2021 00:49:16 -0800 (PST)
MIME-Version: 1.0
References: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 12 Jan 2021 09:49:06 +0100
Message-ID: <CAKMK7uFjeJHS9siPfY4swYyHi92Ee2eEVw1syQ0h-efOHEKPig@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/vmwgfx: Drop svga_lock
To: DRI Development <dri-devel@lists.freedesktop.org>
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Roland,

Hopefully you had a nice start into the new year! Ping for some
review/testing on this series.

Thanks, Daniel

On Fri, Dec 11, 2020 at 5:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> This isn't actually protecting anything becuase:
> - when running, ttm_resource_manager->use_type is protected through
>   vmw_private->reservation_semaphore against concurrent execbuf or
>   well anything else that might evict or reserve buffers
> - during suspend/resume there's nothing else running, hence
>   vmw_pm_freeze and vmw_pm_restore do not need to take the same lock.
> - this also holds for the SVGA_REG_ENABLE register write
>
> Hence it is safe to just remove that spinlock.
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 10 +---------
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  1 -
>  2 files changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 0008be02d31c..204f7a1830f0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -672,7 +672,6 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
>         spin_lock_init(&dev_priv->hw_lock);
>         spin_lock_init(&dev_priv->waiter_lock);
>         spin_lock_init(&dev_priv->cap_lock);
> -       spin_lock_init(&dev_priv->svga_lock);
>         spin_lock_init(&dev_priv->cursor_lock);
>
>         for (i = vmw_res_context; i < vmw_res_max; ++i) {
> @@ -1189,12 +1188,10 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
>  {
>         struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>
> -       spin_lock(&dev_priv->svga_lock);
>         if (!ttm_resource_manager_used(man)) {
>                 vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
>                 ttm_resource_manager_set_used(man, true);
>         }
> -       spin_unlock(&dev_priv->svga_lock);
>  }
>
>  /**
> @@ -1220,14 +1217,12 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
>  {
>         struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>
> -       spin_lock(&dev_priv->svga_lock);
>         if (ttm_resource_manager_used(man)) {
>                 ttm_resource_manager_set_used(man, false);
>                 vmw_write(dev_priv, SVGA_REG_ENABLE,
>                           SVGA_REG_ENABLE_HIDE |
>                           SVGA_REG_ENABLE_ENABLE);
>         }
> -       spin_unlock(&dev_priv->svga_lock);
>  }
>
>  /**
> @@ -1254,17 +1249,14 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
>          */
>         vmw_kms_lost_device(dev_priv->dev);
>         ttm_write_lock(&dev_priv->reservation_sem, false);
> -       spin_lock(&dev_priv->svga_lock);
>         if (ttm_resource_manager_used(man)) {
>                 ttm_resource_manager_set_used(man, false);
> -               spin_unlock(&dev_priv->svga_lock);
>                 if (ttm_resource_manager_evict_all(&dev_priv->bdev, man))
>                         DRM_ERROR("Failed evicting VRAM buffers.\n");
>                 vmw_write(dev_priv, SVGA_REG_ENABLE,
>                           SVGA_REG_ENABLE_HIDE |
>                           SVGA_REG_ENABLE_ENABLE);
> -       } else
> -               spin_unlock(&dev_priv->svga_lock);
> +       }
>         ttm_write_unlock(&dev_priv->reservation_sem);
>  }
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 5b9a28157dd3..715f2bfee08a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -596,7 +596,6 @@ struct vmw_private {
>
>         bool stealth;
>         bool enable_fb;
> -       spinlock_t svga_lock;
>
>         /**
>          * PM management.
> --
> 2.29.2
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
