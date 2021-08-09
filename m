Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F21603E4667
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 15:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC1489B30;
	Mon,  9 Aug 2021 13:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986CF89B84;
 Mon,  9 Aug 2021 13:21:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="236684800"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="236684800"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 06:21:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; d="scan'208";a="514951933"
Received: from lmajkows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.39.191])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2021 06:20:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Karol Herbst <kherbst@redhat.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Subject: Re: [PATCH] nouveau: make backlight support non optional
In-Reply-To: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
 <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
 <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
 <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
 <CACO55tuceMUz2pgOM23wvcmtaTqbo6S6rCB+mfLptqJRt=fMWA@mail.gmail.com>
 <CAK8P3a3+AD02-8nbULMdae2Hc=hJ+-Zb_CL+bHF-9oGieYiZWQ@mail.gmail.com>
 <CACO55tswMuDE9u3asU2Ls7BhA0uKGGarLk+E-WTD6MVnLwc3tw@mail.gmail.com>
 <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
Date: Mon, 09 Aug 2021 16:20:55 +0300
Message-ID: <87tujyoitk.fsf@intel.com>
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

On Sat, 24 Jul 2021, Arnd Bergmann <arnd@kernel.org> wrote:
> On Sat, Jul 24, 2021 at 4:14 PM Karol Herbst <kherbst@redhat.com> wrote:
>>
>> we use the MXM_WMI in code. We also have to keep arm in mind and not
>> break stuff there. So I will try to play around with your changes and
>> see how that goes.
>
> Ok, should find any randconfig build failures for arm, arm64 or x86 over the
> weekend. I also this on linux-next today
>
> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function
> `intel_backlight_device_register':
> intel_panel.c:(.text+0x2804): undefined reference to `backlight_device_register'
> ld: intel_panel.c:(.text+0x284e): undefined reference to
> `backlight_device_register'
> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function
> `intel_backlight_device_unregister':
> intel_panel.c:(.text+0x28b1): undefined reference to
> `backlight_device_unregister'
>
> and I added this same thing there to see how it goes:

Last I checked (and it was a while a go) you really had to make all
users of BACKLIGHT_CLASS_DEVICE depend not select it, otherwise you end
up with recursive dependencies.

BR,
Jani.

>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 87825d36335b..69c6b7aec49e 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -3,6 +3,8 @@ config DRM_I915
>         tristate "Intel 8xx/9xx/G3x/G4x/HD Graphics"
>         depends on DRM
>         depends on X86 && PCI
> +       depends on ACPI_VIDEO || !ACPI
> +       depends on BACKLIGHT_CLASS_DEVICE
>         select INTEL_GTT
>         select INTERVAL_TREE
>         # we need shmfs for the swappable backing store, and in particular
> @@ -16,10 +18,6 @@ config DRM_I915
>         select IRQ_WORK
>         # i915 depends on ACPI_VIDEO when ACPI is enabled
>         # but for select to work, need to select ACPI_VIDEO's dependencies, ick
> -       select DRM_I915_BACKLIGHT if ACPI
> -       select INPUT if ACPI
> -       select ACPI_VIDEO if ACPI
> -       select ACPI_BUTTON if ACPI
>         select SYNC_FILE
>         select IOSF_MBI
>         select CRC32
> @@ -64,13 +62,7 @@ config DRM_I915_FORCE_PROBE
>           Use "*" to force probe the driver for all known devices.
>
>  config DRM_I915_BACKLIGHT
> -       tristate "Control backlight support"
> -       depends on DRM_I915
> -       default DRM_I915
> -       select BACKLIGHT_CLASS_DEVICE
> -       help
> -          Say Y here if you want to control the backlight of your display
> -          (e.g. a laptop panel).
> +       def_tristate DRM_I915
>
>  config DRM_I915_CAPTURE_ERROR
>         bool "Enable capturing GPU state following a hang"

-- 
Jani Nikula, Intel Open Source Graphics Center
