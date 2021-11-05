Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A766D44614A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 10:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292D46E111;
	Fri,  5 Nov 2021 09:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299856E111;
 Fri,  5 Nov 2021 09:22:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231714554"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="231714554"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 02:22:27 -0700
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="501878634"
Received: from jprisaca-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.214.70])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 02:22:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: Move nomodeset kernel parameter to the DRM
 subsystem
In-Reply-To: <f2c40b22-04bf-e8f2-9839-36d6d26189a1@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211104160707.1407052-1-javierm@redhat.com>
 <20211104160707.1407052-3-javierm@redhat.com>
 <f2c40b22-04bf-e8f2-9839-36d6d26189a1@suse.de>
Date: Fri, 05 Nov 2021 11:22:17 +0200
Message-ID: <87cznf9cty.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 Nov 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 04.11.21 um 17:07 schrieb Javier Martinez Canillas:
>> The "nomodeset" kernel cmdline parameter is handled by the vgacon driver
>> but the exported vgacon_text_force() symbol is only used by DRM drivers.
>>=20
>> It makes much more sense for the parameter logic to be in the subsystem
>> of the drivers that are making use of it.
>>=20
>> Let's move the vgacon_text_force() function and related logic to the DRM
>> subsystem. While doing that, rename the function to drm_check_modeset()
>> which better reflects what the function is really used to test for.
>>=20
>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>=20
>> Changes in v2:
>> - Conditionally build drm_nomodeset.o if CONFIG_VGA_CONSOLE is set.
>> - Squash patches to move nomodeset logic to DRM and do the renaming.
>> - Name the function drm_check_modeset() and make it return -ENODEV.
>>=20
>>   drivers/gpu/drm/Makefile                |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 -
>>   drivers/gpu/drm/ast/ast_drv.c           |  1 -
>>   drivers/gpu/drm/drm_drv.c               |  9 +++++----
>>   drivers/gpu/drm/drm_nomodeset.c         | 26 +++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_module.c      |  2 --
>>   drivers/gpu/drm/mgag200/mgag200_drv.c   |  1 -
>>   drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 -
>>   drivers/gpu/drm/qxl/qxl_drv.c           |  1 -
>>   drivers/gpu/drm/radeon/radeon_drv.c     |  1 -
>>   drivers/gpu/drm/tiny/bochs.c            |  1 -
>>   drivers/gpu/drm/tiny/cirrus.c           |  1 -
>>   drivers/gpu/drm/vboxvideo/vbox_drv.c    |  1 -
>>   drivers/gpu/drm/virtio/virtgpu_drv.c    |  1 -
>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  1 -
>>   drivers/video/console/vgacon.c          | 21 --------------------
>>   include/drm/drm_mode_config.h           |  6 ++++++
>>   include/linux/console.h                 |  6 ------
>>   18 files changed, 39 insertions(+), 44 deletions(-)
>>   create mode 100644 drivers/gpu/drm/drm_nomodeset.c
>>=20
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index 1c41156deb5f..c74810c285af 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -33,6 +33,8 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) +=3D drm_privacy_scre=
en.o drm_privacy_screen_x86.
>>=20=20=20
>>   obj-$(CONFIG_DRM_DP_AUX_BUS) +=3D drm_dp_aux_bus.o
>>=20=20=20
>> +obj-$(CONFIG_VGA_CONSOLE) +=3D drm_nomodeset.o
>> +
>
> This now depends on the VGA textmode console. Even if you have no VGA=20
> console, you'd want drm_nomodeset.o. Simpledrm might be built-in and can=
=20
> provide graphics. Non-PC systems don't even have a VGA device.

This was discussed in an earlier version, which had this builtin but the
header still had a stub for CONFIG_VGA_CONSOLE=3Dn.

> I think we really want a separate boolean config option that gets=20
> selected by CONFIG_DRM.

Perhaps that should be a separate change on top.

BR,
Jani.

>
>
>>   drm_cma_helper-y :=3D drm_gem_cma_helper.o
>>   obj-$(CONFIG_DRM_GEM_CMA_HELPER) +=3D drm_cma_helper.o
>>=20=20=20
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_drv.c
>> index 7fde40d06181..b4b6993861e6 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -31,7 +31,6 @@
>>   #include "amdgpu_drv.h"
>>=20=20=20
>>   #include <drm/drm_pciids.h>
>> -#include <linux/console.h>
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/vga_switcheroo.h>
>> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv=
.c
>> index 802063279b86..6222082c3082 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.c
>> +++ b/drivers/gpu/drm/ast/ast_drv.c
>> @@ -26,7 +26,6 @@
>>    * Authors: Dave Airlie <airlied@redhat.com>
>>    */
>>=20=20=20
>> -#include <linux/console.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>>=20=20=20
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 3fb567d62881..80b85b8ea776 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -986,12 +986,13 @@ EXPORT_SYMBOL(drm_dev_set_unique);
>>    */
>>   int drm_drv_enabled(const struct drm_driver *driver)
>>   {
>> -	if (vgacon_text_force()) {
>> +	int ret;
>> +
>> +	ret =3D drm_check_modeset();
>> +	if (ret)
>>   		DRM_INFO("%s driver is disabled\n", driver->name);
>> -		return -ENODEV;
>> -	}
>>=20=20=20
>> -	return 0;
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL(drm_drv_enabled);
>>=20=20=20
>> diff --git a/drivers/gpu/drm/drm_nomodeset.c b/drivers/gpu/drm/drm_nomod=
eset.c
>> new file mode 100644
>> index 000000000000..6683e396d2c5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/drm_nomodeset.c
>> @@ -0,0 +1,26 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/module.h>
>> +#include <linux/types.h>
>> +
>> +static bool drm_nomodeset;
>> +
>> +int drm_check_modeset(void)
>> +{
>> +	return drm_nomodeset ? -ENODEV : 0;
>> +}
>> +EXPORT_SYMBOL(drm_check_modeset);
>> +
>> +static int __init disable_modeset(char *str)
>> +{
>> +	drm_nomodeset =3D true;
>> +
>> +	pr_warn("You have booted with nomodeset. This means your GPU drivers a=
re DISABLED\n");
>> +	pr_warn("Any video related functionality will be severely degraded, an=
d you may not even be able to suspend the system properly\n");
>> +	pr_warn("Unless you actually understand what nomodeset does, you shoul=
d reboot without enabling it\n");
>
> I'd update this text to be less sensational.
>
>> +
>> +	return 1;
>> +}
>> +
>> +/* Disable kernel modesetting */
>> +__setup("nomodeset", disable_modeset);
>> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i=
915_module.c
>> index 45cb3e540eff..c890c1ca20c4 100644
>> --- a/drivers/gpu/drm/i915/i915_module.c
>> +++ b/drivers/gpu/drm/i915/i915_module.c
>> @@ -4,8 +4,6 @@
>>    * Copyright =C2=A9 2021 Intel Corporation
>>    */
>>=20=20=20
>> -#include <linux/console.h>
>> -
>
> These changes should be in patch 1?
>
>>   #include "gem/i915_gem_context.h"
>>   #include "gem/i915_gem_object.h"
>>   #include "i915_active.h"
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mga=
g200/mgag200_drv.c
>> index 2a581094ba2b..8e000cac11ba 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -6,7 +6,6 @@
>>    *          Dave Airlie
>>    */
>>=20=20=20
>> -#include <linux/console.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>>   #include <linux/vmalloc.h>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nou=
veau/nouveau_drm.c
>> index 8844d3602d87..bd1456521b7c 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
>> @@ -22,7 +22,6 @@
>>    * Authors: Ben Skeggs
>>    */
>>=20=20=20
>> -#include <linux/console.h>
>>   #include <linux/delay.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv=
.c
>> index 3ac2ef2bf545..ff070ac76111 100644
>> --- a/drivers/gpu/drm/qxl/qxl_drv.c
>> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
>> @@ -29,7 +29,6 @@
>>=20=20=20
>>   #include "qxl_drv.h"
>>=20=20=20
>> -#include <linux/console.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>>   #include <linux/vgaarb.h>
>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeo=
n/radeon_drv.c
>> index 56d688c04346..f59cc971ec95 100644
>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>> @@ -31,7 +31,6 @@
>>=20=20=20
>>=20=20=20
>>   #include <linux/compat.h>
>> -#include <linux/console.h>
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/vga_switcheroo.h>
>> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
>> index ee6b1ff9128b..6e9a31f1a0f3 100644
>> --- a/drivers/gpu/drm/tiny/bochs.c
>> +++ b/drivers/gpu/drm/tiny/bochs.c
>> @@ -1,6 +1,5 @@
>>   // SPDX-License-Identifier: GPL-2.0-or-later
>>=20=20=20
>> -#include <linux/console.h>
>>   #include <linux/pci.h>
>>=20=20=20
>>   #include <drm/drm_aperture.h>
>> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus=
.c
>> index 4706c5bc3067..659208d5aef9 100644
>> --- a/drivers/gpu/drm/tiny/cirrus.c
>> +++ b/drivers/gpu/drm/tiny/cirrus.c
>> @@ -16,7 +16,6 @@
>>    * Copyright 1999-2001 Jeff Garzik <jgarzik@pobox.com>
>>    */
>>=20=20=20
>> -#include <linux/console.h>
>>   #include <linux/dma-buf-map.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vbox=
video/vbox_drv.c
>> index e4377c37cf33..b1e63fd543bb 100644
>> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
>> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
>> @@ -7,7 +7,6 @@
>>    *          Michael Thayer <michael.thayer@oracle.com,
>>    *          Hans de Goede <hdegoede@redhat.com>
>>    */
>> -#include <linux/console.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>>   #include <linux/vt_kern.h>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virt=
io/virtgpu_drv.c
>> index 28200dfba2d1..ba9c0c2f8ae6 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
>> @@ -27,7 +27,6 @@
>>    */
>>=20=20=20
>>   #include <linux/module.h>
>> -#include <linux/console.h>
>>   #include <linux/pci.h>
>>   #include <linux/poll.h>
>>   #include <linux/wait.h>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_drv.c
>> index 05e9949293d5..115ec9518277 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
>> @@ -25,7 +25,6 @@
>>    *
>>    *********************************************************************=
*****/
>>=20=20=20
>> -#include <linux/console.h>
>>   #include <linux/dma-mapping.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgac=
on.c
>> index ef9c57ce0906..d4320b147956 100644
>> --- a/drivers/video/console/vgacon.c
>> +++ b/drivers/video/console/vgacon.c
>> @@ -97,30 +97,9 @@ static int 		vga_video_font_height;
>>   static int 		vga_scan_lines		__read_mostly;
>>   static unsigned int 	vga_rolled_over; /* last vc_origin offset before =
wrap */
>>=20=20=20
>> -static bool vgacon_text_mode_force;
>>   static bool vga_hardscroll_enabled;
>>   static bool vga_hardscroll_user_enable =3D true;
>>=20=20=20
>> -bool vgacon_text_force(void)
>> -{
>> -	return vgacon_text_mode_force;
>> -}
>> -EXPORT_SYMBOL(vgacon_text_force);
>> -
>> -static int __init text_mode(char *str)
>> -{
>> -	vgacon_text_mode_force =3D true;
>> -
>> -	pr_warn("You have booted with nomodeset. This means your GPU drivers a=
re DISABLED\n");
>> -	pr_warn("Any video related functionality will be severely degraded, an=
d you may not even be able to suspend the system properly\n");
>> -	pr_warn("Unless you actually understand what nomodeset does, you shoul=
d reboot without enabling it\n");
>> -
>> -	return 1;
>> -}
>> -
>> -/* force text mode - used by kernel modesetting */
>> -__setup("nomodeset", text_mode);
>> -
>>   static int __init no_scroll(char *str)
>>   {
>>   	/*
>> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config=
.h
>> index 48b7de80daf5..18982d3507e4 100644
>> --- a/include/drm/drm_mode_config.h
>> +++ b/include/drm/drm_mode_config.h
>> @@ -969,4 +969,10 @@ static inline int drm_mode_config_init(struct drm_d=
evice *dev)
>>   void drm_mode_config_reset(struct drm_device *dev);
>>   void drm_mode_config_cleanup(struct drm_device *dev);
>>=20=20=20
>> +#ifdef CONFIG_VGA_CONSOLE
>> +extern int drm_check_modeset(void);
>> +#else
>> +static inline int drm_check_modeset(void) { return 0; }
>> +#endif
>> +
>>   #endif
>> diff --git a/include/linux/console.h b/include/linux/console.h
>> index 20874db50bc8..d4dd8384898b 100644
>> --- a/include/linux/console.h
>> +++ b/include/linux/console.h
>> @@ -217,12 +217,6 @@ extern atomic_t ignore_console_lock_warning;
>>   #define VESA_HSYNC_SUSPEND      2
>>   #define VESA_POWERDOWN          3
>>=20=20=20
>> -#ifdef CONFIG_VGA_CONSOLE
>> -extern bool vgacon_text_force(void);
>> -#else
>> -static inline bool vgacon_text_force(void) { return false; }
>> -#endif
>> -
>>   extern void console_init(void);
>>=20=20=20
>>   /* For deferred console takeover */
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
