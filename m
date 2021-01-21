Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095082FE4E1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43996E516;
	Thu, 21 Jan 2021 08:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64CC6E516
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 08:25:51 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id q25so1308950oij.10
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 00:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dcZ1FYPsDBKXN3hC2IcAkzYMcxDaDlTQqW6wszGPCkA=;
 b=YufljbHlHbmx/xR31VlXerp95BT7cxahfNrgURan972flhmsJdRcjQQZPRQWrNUYh4
 CnnyhIjhUyKVgMeBMcRkWiTtjRH1msLOlPhiWTVc6MPBTrLwIF55Jy/g9n0z5adm/DV4
 9g0IgTn9NeBXXyMQuIXUYV37SgwCy062PaU3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dcZ1FYPsDBKXN3hC2IcAkzYMcxDaDlTQqW6wszGPCkA=;
 b=Mf8AOZprfvCQkQUdh4tW5SGM2sSF/oROX/DfhetEk8e+NBdTaHGH9Pdv4IqCoXNxb5
 7TX39UpwUwhSmHSBW7GXVgthd/D+g56AC8T4TSPb5j3T0if8d35PeHWXjcFvEejJ0mhm
 8b2Q3VO8/Jg7ljhVbsLI5+0K5M/Kn4bs5dgFnk7Hsy2HP+we3phxE32Ilwhk28XTe+Oa
 ghbNbJbdhiPwxgYvWy6KwcI0JZHx6wrfYxoiSEcr4riUticR6U+RGSiGtosfuLN5CP1L
 y8Yvh7h1UVnmlY95ULXzlTXFz7cnW7mCkx3WA/HpRHiElcHm6nzSJwL0D8pEySPcg3/6
 KGyw==
X-Gm-Message-State: AOAM530sKQ1DIVFdEBHivhMuIoY7QZPVwnY81W6zxujLL09IR1fKD8mp
 H9tAPgW+ssYmhgOWVfJTWUH62uBJm5FAjdIISqv8XQ==
X-Google-Smtp-Source: ABdhPJzz0JkV/k4V0avoNCaP5d/Ro05hcp5CHt9s45BuCIcuqAorp3oRURqBTkqgwJQymAvgou+9FyRGO03Vf0s8NqQ=
X-Received: by 2002:aca:ad92:: with SMTP id w140mr5398682oie.128.1611217551051; 
 Thu, 21 Jan 2021 00:25:51 -0800 (PST)
MIME-Version: 1.0
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-9-hch@lst.de>
In-Reply-To: <20210121074959.313333-9-hch@lst.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 21 Jan 2021 09:25:40 +0100
Message-ID: <CAKMK7uFo3epNAUdcp0vvW=VyWMMTZghGyRTPbz_Z37S6nem_2A@mail.gmail.com>
Subject: Re: [PATCH 08/13] drm: remove drm_fb_helper_modinit
To: Christoph Hellwig <hch@lst.de>
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
Cc: Petr Mladek <pmladek@suse.com>, Jiri Kosina <jikos@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michal Marek <michal.lkml@markovi.net>, Joe Lawrence <joe.lawrence@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jessica Yu <jeyu@kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, live-patching@vger.kernel.org,
 Miroslav Benes <mbenes@suse.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 8:55 AM Christoph Hellwig <hch@lst.de> wrote:
>
> drm_fb_helper_modinit has a lot of boilerplate for what is not very
> simple functionality.  Just open code it in the only caller using
> IS_ENABLED and IS_MODULE.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I didn't spot any dependencies with your series, should I just merge
this through drm trees? Or do you want an ack?
-Daniel

> ---
>  drivers/gpu/drm/drm_crtc_helper_internal.h | 10 ---------
>  drivers/gpu/drm/drm_fb_helper.c            | 16 -------------
>  drivers/gpu/drm/drm_kms_helper_common.c    | 26 +++++++++++-----------
>  3 files changed, 13 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
> index 25ce42e799952c..61e09f8a8d0ff0 100644
> --- a/drivers/gpu/drm/drm_crtc_helper_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
> @@ -32,16 +32,6 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_modes.h>
>
> -/* drm_fb_helper.c */
> -#ifdef CONFIG_DRM_FBDEV_EMULATION
> -int drm_fb_helper_modinit(void);
> -#else
> -static inline int drm_fb_helper_modinit(void)
> -{
> -       return 0;
> -}
> -#endif
> -
>  /* drm_dp_aux_dev.c */
>  #ifdef CONFIG_DRM_DP_AUX_CHARDEV
>  int drm_dp_aux_dev_init(void);
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index ce6d63ca75c32a..0b9f1ae1b7864c 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2499,19 +2499,3 @@ void drm_fbdev_generic_setup(struct drm_device *dev,
>         drm_client_register(&fb_helper->client);
>  }
>  EXPORT_SYMBOL(drm_fbdev_generic_setup);
> -
> -/* The Kconfig DRM_KMS_HELPER selects FRAMEBUFFER_CONSOLE (if !EXPERT)
> - * but the module doesn't depend on any fb console symbols.  At least
> - * attempt to load fbcon to avoid leaving the system without a usable console.
> - */
> -int __init drm_fb_helper_modinit(void)
> -{
> -#if defined(CONFIG_FRAMEBUFFER_CONSOLE_MODULE) && !defined(CONFIG_EXPERT)
> -       const char name[] = "fbcon";
> -
> -       if (!module_loaded(name))
> -               request_module_nowait(name);
> -#endif
> -       return 0;
> -}
> -EXPORT_SYMBOL(drm_fb_helper_modinit);
> diff --git a/drivers/gpu/drm/drm_kms_helper_common.c b/drivers/gpu/drm/drm_kms_helper_common.c
> index 221a8528c9937a..b694a7da632eae 100644
> --- a/drivers/gpu/drm/drm_kms_helper_common.c
> +++ b/drivers/gpu/drm/drm_kms_helper_common.c
> @@ -64,19 +64,19 @@ MODULE_PARM_DESC(edid_firmware,
>
>  static int __init drm_kms_helper_init(void)
>  {
> -       int ret;
> -
> -       /* Call init functions from specific kms helpers here */
> -       ret = drm_fb_helper_modinit();
> -       if (ret < 0)
> -               goto out;
> -
> -       ret = drm_dp_aux_dev_init();
> -       if (ret < 0)
> -               goto out;
> -
> -out:
> -       return ret;
> +       /*
> +        * The Kconfig DRM_KMS_HELPER selects FRAMEBUFFER_CONSOLE (if !EXPERT)
> +        * but the module doesn't depend on any fb console symbols.  At least
> +        * attempt to load fbcon to avoid leaving the system without a usable
> +        * console.
> +        */
> +       if (IS_ENABLED(CONFIG_DRM_FBDEV_EMULATION) &&
> +           IS_MODULE(CONFIG_FRAMEBUFFER_CONSOLE) &&
> +           !IS_ENABLED(CONFIG_EXPERT) &&
> +           !module_loaded("fbcon"))
> +               request_module_nowait("fbcon");
> +
> +       return drm_dp_aux_dev_init();
>  }
>
>  static void __exit drm_kms_helper_exit(void)
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
