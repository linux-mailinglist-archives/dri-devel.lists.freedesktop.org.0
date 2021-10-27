Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5E43C8DF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 13:51:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24F26E88B;
	Wed, 27 Oct 2021 11:51:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8F96E88B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 11:51:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="316345988"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="316345988"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 04:51:39 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="497831225"
Received: from smaharan-mobl.gar.corp.intel.com (HELO localhost)
 ([10.251.214.195])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 04:51:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Cc: Dan =?utf-8?Q?Hor=C3=A1k?= <dan@danny.cz>, "Justin M . Forbes"
 <jforbes@fedoraproject.org>, Peter Robinson <pbrobinson@gmail.com>, Javier
 Martinez Canillas <javierm@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Make DRM_FBDEV_EMULATION deps more robust to fix
 linker errors
In-Reply-To: <20211027072044.4105113-1-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211027072044.4105113-1-javierm@redhat.com>
Date: Wed, 27 Oct 2021 14:51:31 +0300
Message-ID: <875ytiit30.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 27 Oct 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
> Enabling the CONFIG_DRM_FBDEV_EMULATION Kconfig symbol can lead to linker
> errors, if CONFIG_DRM_KMS_HELPER is built-in but CONFIG_FB as a module.
>
> Because in that case the drm_kms_helper.o object will have references to
> symbols that are defined in the fb.ko module, i.e:
>
>   $ make bzImage modules
>     DESCEND objtool
>     CALL    scripts/atomic/check-atomics.sh
>     CALL    scripts/checksyscalls.sh
>     CHK     include/generated/compile.h
>     GEN     .version
>     CHK     include/generated/compile.h
>     UPD     include/generated/compile.h
>     CC      init/version.o
>     AR      init/built-in.a
>     LD      vmlinux.o
>     MODPOST vmlinux.symvers
>     MODINFO modules.builtin.modinfo
>     GEN     modules.builtin
>     LD      .tmp_vmlinux.kallsyms1
>   ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_resume_worker':
>   drm_fb_helper.c:(.text+0x2a0): undefined reference to `fb_set_suspend'
>   ...
>
> To prevent this, make following changes to the config option dependencies:
>
>   * Depend on FB && !(DRM_KMS_HELPER=y && FB=m), to avoid invalid configs.
>   * Depend on DRM_KMS_HELPER instead selecting it, to avoid circular deps.
>
> Reported-by: Justin M. Forbes <jforbes@fedoraproject.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Please see [1]. I think it's a big mess. I don't think this is the fix
either.

BR,
Jani.

[1] https://lore.kernel.org/r/878ryeit9i.fsf@intel.com

> ---
>
> This fixes linker errors found when building the Fedora kernel package
> for the s390x architecture:
>
> https://kojipkgs.fedoraproject.org//work/tasks/9849/77859849/build.log
>
>  drivers/gpu/drm/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index cea777ae7fb9..9a21e57b4a0d 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -103,8 +103,8 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>  config DRM_FBDEV_EMULATION
>  	bool "Enable legacy fbdev support for your modesetting driver"
>  	depends on DRM
> -	depends on FB
> -	select DRM_KMS_HELPER
> +	depends on FB && !(DRM_KMS_HELPER=y && FB=m)
> +	depends on DRM_KMS_HELPER
>  	select FB_CFB_FILLRECT
>  	select FB_CFB_COPYAREA
>  	select FB_CFB_IMAGEBLIT

-- 
Jani Nikula, Intel Open Source Graphics Center
