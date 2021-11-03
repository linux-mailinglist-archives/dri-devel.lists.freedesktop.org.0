Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AE84441FE
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 13:57:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9526E15F;
	Wed,  3 Nov 2021 12:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FEA6E0FB;
 Wed,  3 Nov 2021 12:56:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="231335964"
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="231335964"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 05:56:46 -0700
X-IronPort-AV: E=Sophos;i="5.87,205,1631602800"; d="scan'208";a="501045631"
Received: from bmagdala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.215.42])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 05:56:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 2/5] drm: Move nomodeset kernel parameter handler
 to the DRM subsystem
In-Reply-To: <20211103122809.1040754-3-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211103122809.1040754-1-javierm@redhat.com>
 <20211103122809.1040754-3-javierm@redhat.com>
Date: Wed, 03 Nov 2021 14:56:36 +0200
Message-ID: <87tugtbdob.fsf@intel.com>
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
 Gerd Hoffmann <kraxel@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, Neal Gompa <ngompa13@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 nouveau@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 03 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
> The "nomodeset" kernel cmdline parameter is handled by the vgacon driver
> but the exported vgacon_text_force() symbol is only used by DRM drivers.
>
> It makes much more sense for the parameter logic to be in the subsystem
> of the drivers that are making use of it. Let's move that to DRM.
>
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>
>  drivers/gpu/drm/Makefile                |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  3 +--
>  drivers/gpu/drm/ast/ast_drv.c           |  1 -
>  drivers/gpu/drm/drm_nomodeset.c         | 26 +++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_module.c      |  2 --
>  drivers/gpu/drm/mgag200/mgag200_drv.c   |  1 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 -
>  drivers/gpu/drm/qxl/qxl_drv.c           |  1 -
>  drivers/gpu/drm/radeon/radeon_drv.c     |  1 -
>  drivers/gpu/drm/tiny/bochs.c            |  1 -
>  drivers/gpu/drm/tiny/cirrus.c           |  1 -
>  drivers/gpu/drm/vboxvideo/vbox_drv.c    |  1 -
>  drivers/gpu/drm/virtio/virtgpu_drv.c    |  1 -
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  1 -
>  drivers/video/console/vgacon.c          | 21 --------------------
>  include/drm/drm_mode_config.h           |  6 ++++++
>  include/linux/console.h                 |  6 ------
>  17 files changed, 35 insertions(+), 41 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_nomodeset.c
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 1c41156deb5f..0e2d60ea93ca 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -33,6 +33,8 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) +=3D drm_privacy_scree=
n.o drm_privacy_screen_x86.
>=20=20
>  obj-$(CONFIG_DRM_DP_AUX_BUS) +=3D drm_dp_aux_bus.o
>=20=20
> +obj-y +=3D drm_nomodeset.o

This is a subtle functional change. With this, you'll always have
__setup("nomodeset", text_mode) builtin and the parameter available. And
using nomodeset will print out the pr_warn() splat from text_mode(). But
removing nomodeset will have no impact if CONFIG_VGA_CONSOLE=3Dn as that
leads to vgacon_text_force() always returning false.

To not make functional changes, this should be:

obj-$(CONFIG_VGA_CONSOLE) +=3D drm_nomodeset.o

Now, going with the cleanup in this series, maybe we should make the
functional change, and break the connection to CONFIG_VGA_CONSOLE
altogether, also in the header?

(Maybe we'll also need a proxy drm kconfig option to only have
drm_modeset.o builtin when CONFIG_DRM !=3D n.)

> +
>  drm_cma_helper-y :=3D drm_gem_cma_helper.o
>  obj-$(CONFIG_DRM_GEM_CMA_HELPER) +=3D drm_cma_helper.o
>=20=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index c718fb5f3f8a..2680a2aaa877 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -31,7 +31,6 @@
>  #include "amdgpu_drv.h"
>=20=20
>  #include <drm/drm_pciids.h>
> -#include <linux/console.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/vga_switcheroo.h>
> @@ -2515,7 +2514,7 @@ static int __init amdgpu_init(void)
>  	int r;
>=20=20
>  	if (vgacon_text_force()) {
> -		DRM_ERROR("VGACON disables amdgpu kernel modesetting.\n");
> +		DRM_ERROR("amdgpu kernel modesetting disabled.\n");
>  		return -EINVAL;
>  	}
>=20=20
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 86d5cd7b6318..048be607b182 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -26,7 +26,6 @@
>   * Authors: Dave Airlie <airlied@redhat.com>
>   */
>=20=20
> -#include <linux/console.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>=20=20
> diff --git a/drivers/gpu/drm/drm_nomodeset.c b/drivers/gpu/drm/drm_nomode=
set.c
> new file mode 100644
> index 000000000000..1ac9a8d5a8fe
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_nomodeset.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/module.h>
> +#include <linux/types.h>
> +
> +static bool vgacon_text_mode_force;
> +
> +bool vgacon_text_force(void)
> +{
> +	return vgacon_text_mode_force;
> +}
> +EXPORT_SYMBOL(vgacon_text_force);
> +
> +static int __init text_mode(char *str)
> +{
> +	vgacon_text_mode_force =3D true;
> +
> +	pr_warn("You have booted with nomodeset. This means your GPU drivers ar=
e DISABLED\n");
> +	pr_warn("Any video related functionality will be severely degraded, and=
 you may not even be able to suspend the system properly\n");
> +	pr_warn("Unless you actually understand what nomodeset does, you should=
 reboot without enabling it\n");
> +
> +	return 1;
> +}
> +
> +/* force text mode - used by kernel modesetting */
> +__setup("nomodeset", text_mode);
> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i9=
15_module.c
> index c7507266aa83..14a59226519d 100644
> --- a/drivers/gpu/drm/i915/i915_module.c
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -4,8 +4,6 @@
>   * Copyright =C2=A9 2021 Intel Corporation
>   */
>=20=20
> -#include <linux/console.h>
> -
>  #include "gem/i915_gem_context.h"
>  #include "gem/i915_gem_object.h"
>  #include "i915_active.h"
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag=
200/mgag200_drv.c
> index 6b9243713b3c..685e766db6a4 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -6,7 +6,6 @@
>   *          Dave Airlie
>   */
>=20=20
> -#include <linux/console.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/vmalloc.h>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 1f828c9f691c..029997f50d1a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -22,7 +22,6 @@
>   * Authors: Ben Skeggs
>   */
>=20=20
> -#include <linux/console.h>
>  #include <linux/delay.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
> index fc47b0deb021..3cd6bd9f059d 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.c
> +++ b/drivers/gpu/drm/qxl/qxl_drv.c
> @@ -29,7 +29,6 @@
>=20=20
>  #include "qxl_drv.h"
>=20=20
> -#include <linux/console.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/vgaarb.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon=
/radeon_drv.c
> index b74cebca1f89..9b606c1b11ec 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -31,7 +31,6 @@
>=20=20
>=20=20
>  #include <linux/compat.h>
> -#include <linux/console.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/vga_switcheroo.h>
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 2ce3bd903b70..04333f78be55 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -1,6 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>=20=20
> -#include <linux/console.h>
>  #include <linux/pci.h>
>=20=20
>  #include <drm/drm_aperture.h>
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 4611ec408506..8bd674f0d682 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -16,7 +16,6 @@
>   * Copyright 1999-2001 Jeff Garzik <jgarzik@pobox.com>
>   */
>=20=20
> -#include <linux/console.h>
>  #include <linux/dma-buf-map.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.c b/drivers/gpu/drm/vboxv=
ideo/vbox_drv.c
> index a6c81af37345..e6d983121d0b 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_drv.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_drv.c
> @@ -7,7 +7,6 @@
>   *          Michael Thayer <michael.thayer@oracle.com,
>   *          Hans de Goede <hdegoede@redhat.com>
>   */
> -#include <linux/console.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/vt_kern.h>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virti=
o/virtgpu_drv.c
> index 749db18dcfa2..cd4c170236f1 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -27,7 +27,6 @@
>   */
>=20=20
>  #include <linux/module.h>
> -#include <linux/console.h>
>  #include <linux/pci.h>
>  #include <linux/poll.h>
>  #include <linux/wait.h>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index ab9a1750e1df..fcc4b5a7f639 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -25,7 +25,6 @@
>   *
>   ***********************************************************************=
***/
>=20=20
> -#include <linux/console.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgaco=
n.c
> index ef9c57ce0906..d4320b147956 100644
> --- a/drivers/video/console/vgacon.c
> +++ b/drivers/video/console/vgacon.c
> @@ -97,30 +97,9 @@ static int 		vga_video_font_height;
>  static int 		vga_scan_lines		__read_mostly;
>  static unsigned int 	vga_rolled_over; /* last vc_origin offset before wr=
ap */
>=20=20
> -static bool vgacon_text_mode_force;
>  static bool vga_hardscroll_enabled;
>  static bool vga_hardscroll_user_enable =3D true;
>=20=20
> -bool vgacon_text_force(void)
> -{
> -	return vgacon_text_mode_force;
> -}
> -EXPORT_SYMBOL(vgacon_text_force);
> -
> -static int __init text_mode(char *str)
> -{
> -	vgacon_text_mode_force =3D true;
> -
> -	pr_warn("You have booted with nomodeset. This means your GPU drivers ar=
e DISABLED\n");
> -	pr_warn("Any video related functionality will be severely degraded, and=
 you may not even be able to suspend the system properly\n");
> -	pr_warn("Unless you actually understand what nomodeset does, you should=
 reboot without enabling it\n");
> -
> -	return 1;
> -}
> -
> -/* force text mode - used by kernel modesetting */
> -__setup("nomodeset", text_mode);
> -
>  static int __init no_scroll(char *str)
>  {
>  	/*
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 48b7de80daf5..e1d2042a7b77 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -969,4 +969,10 @@ static inline int drm_mode_config_init(struct drm_de=
vice *dev)
>  void drm_mode_config_reset(struct drm_device *dev);
>  void drm_mode_config_cleanup(struct drm_device *dev);
>=20=20
> +#ifdef CONFIG_VGA_CONSOLE
> +extern bool vgacon_text_force(void);
> +#else
> +static inline bool vgacon_text_force(void) { return false; }
> +#endif
> +

As said, maybe the CONFIG_VGA_CONSOLE ifdef should be dropped.

Also, this seems like a completely arbitrary choice of header to place
this.


BR,
Jani.


>  #endif
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 20874db50bc8..d4dd8384898b 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -217,12 +217,6 @@ extern atomic_t ignore_console_lock_warning;
>  #define VESA_HSYNC_SUSPEND      2
>  #define VESA_POWERDOWN          3
>=20=20
> -#ifdef CONFIG_VGA_CONSOLE
> -extern bool vgacon_text_force(void);
> -#else
> -static inline bool vgacon_text_force(void) { return false; }
> -#endif
> -
>  extern void console_init(void);
>=20=20
>  /* For deferred console takeover */

--=20
Jani Nikula, Intel Open Source Graphics Center
