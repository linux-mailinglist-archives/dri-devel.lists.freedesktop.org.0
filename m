Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F42FA109
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 14:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C879189FFD;
	Mon, 18 Jan 2021 13:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8339589FFD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 13:15:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m4so16410860wrx.9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 05:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7LFccCP1IdJpl0SvYSOkJUpMgGQTwGS0dfsxKAZHV0E=;
 b=DbJ6iFqdYXWXF7Hox7v6oMRS8ovbVyYwtksUDDzAcDhLz5fTNvM1PT/+lJ0D4b79kV
 J8epo4vXuBqs8z7GNkjJtlPlwZWz2tLp9Xk+HOUZwySl7owMS+e5cnm0ZuOlEH8YW6c2
 WYPQ2b5w99mJyJYCry3TnIg5DoXnTUDDRZFJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7LFccCP1IdJpl0SvYSOkJUpMgGQTwGS0dfsxKAZHV0E=;
 b=B3efXmsXkk4BWHc+xuDy/j++WzQL5kV0r7o39THNW9ujNr9xim8sLg4IRNCMKEMLpQ
 GR+V9ZHYsi1A6LPoGbQD4V92C+BEeKofiWJRer0pvjcGS9flHVpiXo0uyHm8XD/PzzZ9
 PwWjxLLdE+iS7p2sL7KJfrCFSsBuK1Ir0d7GpIqYzgwDXtPwePo+a0AjSBrts7B21Qvu
 peLnzpLhLeNFbn/aVdB+ca0Al4YWPiF2JAJO/cJrgywQCYbWHTQJEy8rZuUU0+24DJsn
 NhAEMd+ErMBf04UODfVI1IGeqsC47TPV45NllcWR12OlCmaF/yRTSAaMIzpshlMiPQHE
 vDqA==
X-Gm-Message-State: AOAM530uGahKgD6npEARoIuLHfttPB75ul/Qms1oXhkHAK3J81qRujdf
 u1Dj/pfgOByABjurT14j0Vgd0w==
X-Google-Smtp-Source: ABdhPJyX5TRENpyhNlu7DaaJ/mi84wpVJefNjIb58LGIuJYD3mWTaWJEL/azU80AH7aq7aviNhLuPg==
X-Received: by 2002:adf:8185:: with SMTP id 5mr24974507wra.44.1610975736274;
 Mon, 18 Jan 2021 05:15:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm29050942wrx.21.2021.01.18.05.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 05:15:35 -0800 (PST)
Date: Mon, 18 Jan 2021 14:15:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH 1/3] drm/vmwgfx: Drop svga_lock
Message-ID: <YAWJ9fkwyZE37HD0@phenom.ffwll.local>
References: <20201211162942.3399050-1-daniel.vetter@ffwll.ch>
 <CAKMK7uFjeJHS9siPfY4swYyHi92Ee2eEVw1syQ0h-efOHEKPig@mail.gmail.com>
 <ed5a3fbb-5aee-a7d8-e8f2-2b8a117eab6c@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed5a3fbb-5aee-a7d8-e8f2-2b8a117eab6c@vmware.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 14, 2021 at 04:31:09PM +0100, Roland Scheidegger wrote:
> Hi,
> 
> looking at it, seems alright. Not sure why the lock was supposedly
> needed, maybe it was at some point (it seems like all usage of this lock
> was introduced way back in 2015, commit 153b3d5b037ee).
> 
> For the series: Reviewed-by: Roland Scheidegger <sroland@vmware.com>

Series merged, thanks for taking a look.
-Daniel

> 
> Roland
> 
> Am 12.01.21 um 09:49 schrieb Daniel Vetter:
> > Hi Roland,
> > 
> > Hopefully you had a nice start into the new year! Ping for some
> > review/testing on this series.
> > 
> > Thanks, Daniel
> > 
> > On Fri, Dec 11, 2020 at 5:29 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >>
> >> This isn't actually protecting anything becuase:
> >> - when running, ttm_resource_manager->use_type is protected through
> >>   vmw_private->reservation_semaphore against concurrent execbuf or
> >>   well anything else that might evict or reserve buffers
> >> - during suspend/resume there's nothing else running, hence
> >>   vmw_pm_freeze and vmw_pm_restore do not need to take the same lock.
> >> - this also holds for the SVGA_REG_ENABLE register write
> >>
> >> Hence it is safe to just remove that spinlock.
> >>
> >> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> >> Cc: Roland Scheidegger <sroland@vmware.com>
> >> ---
> >>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 10 +---------
> >>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  1 -
> >>  2 files changed, 1 insertion(+), 10 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> >> index 0008be02d31c..204f7a1830f0 100644
> >> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> >> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> >> @@ -672,7 +672,6 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
> >>         spin_lock_init(&dev_priv->hw_lock);
> >>         spin_lock_init(&dev_priv->waiter_lock);
> >>         spin_lock_init(&dev_priv->cap_lock);
> >> -       spin_lock_init(&dev_priv->svga_lock);
> >>         spin_lock_init(&dev_priv->cursor_lock);
> >>
> >>         for (i = vmw_res_context; i < vmw_res_max; ++i) {
> >> @@ -1189,12 +1188,10 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
> >>  {
> >>         struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
> >>
> >> -       spin_lock(&dev_priv->svga_lock);
> >>         if (!ttm_resource_manager_used(man)) {
> >>                 vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
> >>                 ttm_resource_manager_set_used(man, true);
> >>         }
> >> -       spin_unlock(&dev_priv->svga_lock);
> >>  }
> >>
> >>  /**
> >> @@ -1220,14 +1217,12 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
> >>  {
> >>         struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
> >>
> >> -       spin_lock(&dev_priv->svga_lock);
> >>         if (ttm_resource_manager_used(man)) {
> >>                 ttm_resource_manager_set_used(man, false);
> >>                 vmw_write(dev_priv, SVGA_REG_ENABLE,
> >>                           SVGA_REG_ENABLE_HIDE |
> >>                           SVGA_REG_ENABLE_ENABLE);
> >>         }
> >> -       spin_unlock(&dev_priv->svga_lock);
> >>  }
> >>
> >>  /**
> >> @@ -1254,17 +1249,14 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
> >>          */
> >>         vmw_kms_lost_device(dev_priv->dev);
> >>         ttm_write_lock(&dev_priv->reservation_sem, false);
> >> -       spin_lock(&dev_priv->svga_lock);
> >>         if (ttm_resource_manager_used(man)) {
> >>                 ttm_resource_manager_set_used(man, false);
> >> -               spin_unlock(&dev_priv->svga_lock);
> >>                 if (ttm_resource_manager_evict_all(&dev_priv->bdev, man))
> >>                         DRM_ERROR("Failed evicting VRAM buffers.\n");
> >>                 vmw_write(dev_priv, SVGA_REG_ENABLE,
> >>                           SVGA_REG_ENABLE_HIDE |
> >>                           SVGA_REG_ENABLE_ENABLE);
> >> -       } else
> >> -               spin_unlock(&dev_priv->svga_lock);
> >> +       }
> >>         ttm_write_unlock(&dev_priv->reservation_sem);
> >>  }
> >>
> >> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> >> index 5b9a28157dd3..715f2bfee08a 100644
> >> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> >> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> >> @@ -596,7 +596,6 @@ struct vmw_private {
> >>
> >>         bool stealth;
> >>         bool enable_fb;
> >> -       spinlock_t svga_lock;
> >>
> >>         /**
> >>          * PM management.
> >> --
> >> 2.29.2
> >>
> > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
