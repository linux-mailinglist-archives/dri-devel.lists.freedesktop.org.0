Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8743CA23
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8715E8938F;
	Wed, 27 Oct 2021 12:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D508938F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:52:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC0A56109D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635339165;
 bh=Q7hlXm24IlvoYotzMPCW0asKP7SmokzIn117GHNxzFY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HyHWeRsQLzxW3Cv2ZvfgJq9LQ0C24Yzzkch5UMjac3pgFU8ZwxqDFVkOdi3dxSZnZ
 VJVz8V5vIai80fB+VJ4ykIGCCfzURmHfgqIS4tJXmrOAo808A9h+fCInfTxa0cg/ZD
 jUCQx61dITcuN7VfuODxdavtSKuWsdLMcp1xI6AVOpTYLuB+m9KKAxDrk9JWDdDDG5
 0AxZZJiKWmeVEjAfh2o+Xxf2dJHArpkQ42oV/UMQiisra2DBh6TKy4SqflT/bBMlf0
 jBT8ztNAoFVPU17HKgI60G47vpA1PbIFc+d6nayvOki8YuOZ9HrmtUQUjAvAG1fDL+
 EGy9+zVVqaGLQ==
Received: by mail-wr1-f53.google.com with SMTP id m22so4085131wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 05:52:45 -0700 (PDT)
X-Gm-Message-State: AOAM531ocGBBeU9Ko8XuVr8u9oZ+bKPFolAxPQ9pSsNZBCImHogwzhSh
 du9uIrvuRCYHErXymPQFIStXxOdTpGTomaXJsOg=
X-Google-Smtp-Source: ABdhPJzbCZlyX9k07pVOYD24NnN5Ih9Jz4C65HCAbcMBr1xanhoORR4HnbeuhyjlQLr424LeCjS0GIekG1+t5CZJ+/Q=
X-Received: by 2002:a5d:47a3:: with SMTP id 3mr27512666wrb.336.1635339164196; 
 Wed, 27 Oct 2021 05:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook>
 <YVXJLE8UqgcUNIKl@phenom.ffwll.local> <878ryeit9i.fsf@intel.com>
 <CAK8P3a0EG_C6OvG00Dg8SQacirNztLFjVonb5t2xQj9aFZ47Vg@mail.gmail.com>
 <3604fb90-f6c3-0fa2-c864-7f1795caee1e@redhat.com>
In-Reply-To: <3604fb90-f6c3-0fa2-c864-7f1795caee1e@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 27 Oct 2021 14:52:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0_9U0MDLcNG8GL_ZDCGQAsB=G7DBC0k1BYB1HNQTbu4Q@mail.gmail.com>
Message-ID: <CAK8P3a0_9U0MDLcNG8GL_ZDCGQAsB=G7DBC0k1BYB1HNQTbu4Q@mail.gmail.com>
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kees Cook <keescook@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Arnd Bergmann <arnd@arndb.de>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 27, 2021 at 2:38 PM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> >
> > This is something we can't easily express in Kconfig, as we can't add the
> > dependency to a symbol that only gets selected by other drivers, which
> > is why the dependency has to be in the user-visible symbol,
> > in this case DRM_FBDEV_EMULATION.
> >
>
> Why the dependency has to be in a user-visible symbol? What could be the
> problem with having something like:
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index cea777ae7fb9..f80b404946ca 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -82,6 +82,7 @@ config DRM_DEBUG_SELFTEST
>  config DRM_KMS_HELPER
>         tristate
>         depends on DRM
> +       depends on (DRM_FBDEV_EMULATION && FB) || !DRM_FBDEV_EMULATION
>         help
>           CRTC helpers for KMS drivers.
>
> @@ -104,7 +105,6 @@ config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
>         depends on DRM
>         depends on FB
> -       select DRM_KMS_HELPER
>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA
>         select FB_CFB_IMAGEBLIT

This fails because of all the other drivers that try to 'select DRM_KMS_HELPER'.
Kconfig will now complain about a symbol that gets selected while its
dependencies
are not met.

To work around that, every single driver that has 'selects DRM_KMS_HELPER' would
now have to also list 'depends on (DRM_FBDEV_EMULATION && FB) ||
!DRM_FBDEV_EMULATION'.

       Arnd
