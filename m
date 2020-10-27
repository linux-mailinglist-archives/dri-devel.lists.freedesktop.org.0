Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB1F29B63A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 16:23:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18F06EB91;
	Tue, 27 Oct 2020 15:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27756EB91
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 15:23:14 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k65so1646196oih.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y7p2bWXeNVE4mSOn4VyOVW7guNOlBAaPPL1EhJXhXc4=;
 b=gba8mWAJckLunWjuGeOf0+DkgpnBy2hHLFq2ZE3+cIxsue4WXjywVaSqSThvq3NOSv
 VPwjNsngUd5MwPa96e5BfJCe5CnzP3vSF6HtwscfyubH6Vi+fo9fv5fsPxq+JdhobpEu
 AXtx03tN6jms5Y93/hv+nrVJRktTo8Dvi9MrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y7p2bWXeNVE4mSOn4VyOVW7guNOlBAaPPL1EhJXhXc4=;
 b=dwnugZKJCFJIpHcXDlyaIZZYbCgfCx1nq/ggUbN7c28MuTTx4enPCe5m9afS/8bfXP
 x9jluabWrYjUlGp/M9yJgUekAY5qQkhZOz9n0SectCWDcAdur+VPbs/aUdHn6xMIn5eO
 UqOu/wkhl40RsvC9GMXH0OtClZtCtvTA5G/ZSzXm13cqWtMgMmeBIWOL/IQX2oTFUon9
 RL/KK+gadEdmSig2cHIaYozjySWmKWRaBXXnTzjgvFJ1//ehg+YCR+50OcF4+BQxu9WE
 cH6h+sS2l81K++P3rjSmFr8nbBTpxcDI1uzENRtKJWTp8l4FiacS7mGiFm9q19Meqvo6
 XABQ==
X-Gm-Message-State: AOAM530RLAj/+E7a/3J0uF3CC9CATQnI1d3Ly12xItYt30zLsczfn7fo
 66ZL3wNlFQnCajyPWtTHp9rL9DTQSZvoriI2Cv+7Rg==
X-Google-Smtp-Source: ABdhPJxs3db6AIwXv5DRHZ+Fz6sPNG/yOhtcrtTrgEQs/nLO03+xcyrHGNHwvwfrC5cRKbLSysAxqy4eUEd4vyxj6K8=
X-Received: by 2002:aca:39d6:: with SMTP id g205mr1862198oia.14.1603812193624; 
 Tue, 27 Oct 2020 08:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201027135153.324873-1-hdegoede@redhat.com>
In-Reply-To: <20201027135153.324873-1-hdegoede@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 27 Oct 2020 16:23:02 +0100
Message-ID: <CAKMK7uE0DcFKdUd6HhjZzuWe9YdA+r3CJm=jW8Lz7hD6C7brBw@mail.gmail.com>
Subject: Re: [PATCH] drm/vboxvideo: Unmap iomem on probe-failure and remove
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 27, 2020 at 2:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Add missing pci_iounmap() calls to properly unmap the memory on
> probe-failure and remove.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I think switching over to devm would be really nice. And for pci all
you need to do is use pcim_enable_device and delete all the cleanup
code, and it's all done. Hand rolling device cleanup code really isn't
a great idea and way too error-prone. Plus you're using lots of devm_
already.
-Daniel

> ---
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 23 ++++++++++++++++-------
>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index d68d9bad7674..2eeb1d3be54a 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -71,6 +71,8 @@ static void vbox_accel_fini(struct vbox_private *vbox)
>
>         for (i = 0; i < vbox->num_crtcs; ++i)
>                 vbva_disable(&vbox->vbva_info[i], vbox->guest_pool, i);
> +
> +       pci_iounmap(vbox->ddev.pdev, vbox->vbva_buffers);
>  }
>
>  /* Do we support the 4.3 plus mode hint reporting interface? */
> @@ -124,19 +126,19 @@ int vbox_hw_init(struct vbox_private *vbox)
>         vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
>                                                 "vboxvideo-accel");
>         if (!vbox->guest_pool)
> -               return -ENOMEM;
> +               goto out_unmap_guest_heap;
>
>         ret = gen_pool_add_virt(vbox->guest_pool,
>                                 (unsigned long)vbox->guest_heap,
>                                 GUEST_HEAP_OFFSET(vbox),
>                                 GUEST_HEAP_USABLE_SIZE, -1);
>         if (ret)
> -               return ret;
> +               goto out_unmap_guest_heap;
>
>         ret = hgsmi_test_query_conf(vbox->guest_pool);
>         if (ret) {
>                 DRM_ERROR("vboxvideo: hgsmi_test_query_conf failed\n");
> -               return ret;
> +               goto out_unmap_guest_heap;
>         }
>
>         /* Reduce available VRAM size to reflect the guest heap. */
> @@ -148,23 +150,30 @@ int vbox_hw_init(struct vbox_private *vbox)
>
>         if (!have_hgsmi_mode_hints(vbox)) {
>                 ret = -ENOTSUPP;
> -               return ret;
> +               goto out_unmap_guest_heap;
>         }
>
>         vbox->last_mode_hints = devm_kcalloc(vbox->ddev.dev, vbox->num_crtcs,
>                                              sizeof(struct vbva_modehint),
>                                              GFP_KERNEL);
> -       if (!vbox->last_mode_hints)
> -               return -ENOMEM;
> +       if (!vbox->last_mode_hints) {
> +               ret = -ENOMEM;
> +               goto out_unmap_guest_heap;
> +       }
>
>         ret = vbox_accel_init(vbox);
>         if (ret)
> -               return ret;
> +               goto out_unmap_guest_heap;
>
>         return 0;
> +
> +out_unmap_guest_heap:
> +       pci_iounmap(vbox->ddev.pdev, vbox->guest_pool);
> +       return ret;
>  }
>
>  void vbox_hw_fini(struct vbox_private *vbox)
>  {
>         vbox_accel_fini(vbox);
> +       pci_iounmap(vbox->ddev.pdev, vbox->guest_pool);
>  }
> --
> 2.28.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
