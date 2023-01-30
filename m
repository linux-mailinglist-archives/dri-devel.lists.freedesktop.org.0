Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD48681E50
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 23:45:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E411D10E303;
	Mon, 30 Jan 2023 22:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B86210E301
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675118727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8o8Rhd4sel1C6oh+rw0VuQFQ55i8FksRNvBFfvYTTs=;
 b=gmYJrewTttdYoOQb/YfDFNTEn4vANUmw3HFEg5umW3R2reK6OR0S6T9PJV0dw4oWdA2AjG
 uKIpADBnDxizLCGn0GzZmexxc0urkrVZ7VUGHbqYyt8xx5uTj4E5+QjoEim3t7dktMw7jD
 HEkov4qbCHwuo6utulg9wCprv9IwX4g=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-240-tCJ6mIObPOu3EksGv4tfcA-1; Mon, 30 Jan 2023 17:45:27 -0500
X-MC-Unique: tCJ6mIObPOu3EksGv4tfcA-1
Received: by mail-qt1-f197.google.com with SMTP id
 x16-20020ac87ed0000000b003b82d873b38so3789823qtj.13
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 14:45:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YRpkYJeAY4fR+O7gfXMan8c007OCAP8+OFxbnnC3mIY=;
 b=E5xPC7NxV7QDqzDSj1CSbn6zj9X75/JON/SYQ7aKh+1k3596M6ln9mq8d97rTiJM2a
 42U8gdr78r99pk3RNspEN6/ll3fReRFXQ5M71Xj/HNMjVzDWBJKyCu3OZzVDmZu/RQh+
 Ogn2tmawJZ/QRF0ktv6u6uAALwCEW3LVl/HMdQO2/rTj1xpIAD6k3mdb3XfwSKfcNKJx
 tgDKATnECN3aUiGT/fTAxueIgpPXDDJ19nQvYOTfe9KSv8ClRD6vhWRuYhjFVfplmDh2
 it+WnMjbhVm+4vwfaru7qCRuzchdN3ynLxQD4gOArZjBpPmvos9PvtQpIei7JHnSZ4g4
 xMyA==
X-Gm-Message-State: AFqh2kpgfKQFoH+9v1FYGSfnOlaOO+inMqney6sor2cIh5KwNKVdZ29V
 FGZneYf+2omQdi3nTXodD1erRCOELapu43Dw9syx7Szp/EH9dc08F51Rb9P1vMbGj9fkcl7KeMH
 ODFJIkOUdKUgOW69bITuIfskYlNhO
X-Received: by 2002:a05:6214:ca6:b0:537:4d43:9c55 with SMTP id
 s6-20020a0562140ca600b005374d439c55mr70765096qvs.39.1675118726430; 
 Mon, 30 Jan 2023 14:45:26 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu0QFMKgggOPzEwfCc7M8SZd99arSnlL8jcaw+gLk5xP9Bmws0IiZ5C0yUOMG7jU62fJisupQ==
X-Received: by 2002:a05:6214:ca6:b0:537:4d43:9c55 with SMTP id
 s6-20020a0562140ca600b005374d439c55mr70765062qvs.39.1675118726129; 
 Mon, 30 Jan 2023 14:45:26 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 pe27-20020a05620a851b00b0071883954df4sm7269744qkn.103.2023.01.30.14.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 14:45:25 -0800 (PST)
Message-ID: <750324ffe72fb2d07c0d39e8b4a4e77b6449b794.camel@redhat.com>
Subject: Re: [PATCH v2 3/3] drm: Call
 vga_switcheroo_process_delayed_switch() in drm_lastclose
From: Lyude Paul <lyude@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch,  maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, bskeggs@redhat.com,
 kherbst@redhat.com, evan.quan@amd.com, jose.souza@intel.com
Date: Mon, 30 Jan 2023 17:45:24 -0500
In-Reply-To: <20230112201156.26849-4-tzimmermann@suse.de>
References: <20230112201156.26849-1-tzimmermann@suse.de>
 <20230112201156.26849-4-tzimmermann@suse.de>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Acked-by: Lyude Paul <lyude@redhat.com>

On Thu, 2023-01-12 at 21:11 +0100, Thomas Zimmermann wrote:
> Several lastclose helpers call vga_switcheroo_process_delayed_switch().
> It's better to call the helper from drm_lastclose() after the kernel
> client's screen has been restored. This way, all drivers can benefit
> without having to implement their own lastclose helper. For drivers
> without vga-switcheroo, vga_switcheroo_process_delayed_switch() does
> nothing.
>=20
> There was an earlier patchset to do something similar. [1]
>=20
> v2:
> =09* handle vga_switcheroo_client_fb_set() in a separate patch
> =09* also update i915, nouveau and radeon
> =09* remove unnecessary include statements
> =09* update vga-switcheroo docs
>=20
> Suggested-by: Alexander Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Link: https://lore.kernel.org/amd-gfx/20221020143603.563929-1-alexander.d=
eucher@amd.com/ # 1
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 13 -------------
>  drivers/gpu/drm/drm_file.c              |  3 +++
>  drivers/gpu/drm/i915/i915_driver.c      | 25 ++-----------------------
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  1 -
>  drivers/gpu/drm/nouveau/nouveau_vga.c   |  7 -------
>  drivers/gpu/drm/nouveau/nouveau_vga.h   |  1 -
>  drivers/gpu/drm/radeon/radeon_drv.c     |  2 +-
>  drivers/gpu/drm/radeon/radeon_drv.h     |  1 -
>  drivers/gpu/drm/radeon/radeon_kms.c     | 18 ------------------
>  drivers/gpu/vga/vga_switcheroo.c        |  4 ++--
>  12 files changed, 8 insertions(+), 70 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 63c921c55fb9..7120b9b6e580 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1330,7 +1330,6 @@ extern const int amdgpu_max_kms_ioctl;
> =20
>  int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long fla=
gs);
>  void amdgpu_driver_unload_kms(struct drm_device *dev);
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file=
_priv);
>  void amdgpu_driver_postclose_kms(struct drm_device *dev,
>  =09=09=09=09 struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 1353ffd08988..783c1e284a22 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -34,7 +34,6 @@
>  #include <drm/drm_pciids.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> -#include <linux/vga_switcheroo.h>
>  #include <drm/drm_probe_helper.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/suspend.h>
> @@ -2785,7 +2784,6 @@ static const struct drm_driver amdgpu_kms_driver =
=3D {
>  =09    DRIVER_SYNCOBJ_TIMELINE,
>  =09.open =3D amdgpu_driver_open_kms,
>  =09.postclose =3D amdgpu_driver_postclose_kms,
> -=09.lastclose =3D amdgpu_driver_lastclose_kms,
>  =09.ioctls =3D amdgpu_ioctls_kms,
>  =09.num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
>  =09.dumb_create =3D amdgpu_mode_dumb_create,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_kms.c
> index 7aa7e52ca784..a37be02fb2fc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -34,7 +34,6 @@
>  #include "amdgpu_vce.h"
>  #include "atom.h"
> =20
> -#include <linux/vga_switcheroo.h>
>  #include <linux/slab.h>
>  #include <linux/uaccess.h>
>  #include <linux/pci.h>
> @@ -1104,18 +1103,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void=
 *data, struct drm_file *filp)
>  /*
>   * Outdated mess for old drm with Xorg being in charge (void function no=
w).
>   */
> -/**
> - * amdgpu_driver_lastclose_kms - drm callback for last close
> - *
> - * @dev: drm dev pointer
> - *
> - * Switch vga_switcheroo state after last close (all asics).
> - */
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev)
> -{
> -=09drm_fb_helper_lastclose(dev);
> -=09vga_switcheroo_process_delayed_switch();
> -}
> =20
>  /**
>   * amdgpu_driver_open_kms - drm callback for open
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index a51ff8cee049..314c309db9a3 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -38,6 +38,7 @@
>  #include <linux/pci.h>
>  #include <linux/poll.h>
>  #include <linux/slab.h>
> +#include <linux/vga_switcheroo.h>
> =20
>  #include <drm/drm_client.h>
>  #include <drm/drm_drv.h>
> @@ -460,6 +461,8 @@ void drm_lastclose(struct drm_device * dev)
>  =09=09drm_legacy_dev_reinit(dev);
> =20
>  =09drm_client_dev_restore(dev);
> +
> +=09vga_switcheroo_process_delayed_switch();
>  }
> =20
>  /**
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i9=
15_driver.c
> index 33e231b120c1..bf6ad8620970 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -29,6 +29,7 @@
> =20
>  #include <linux/acpi.h>
>  #include <linux/device.h>
> +#include <linux/fb.h> /* for FBINFO_STATE_ */
>  #include <linux/module.h>
>  #include <linux/oom.h>
>  #include <linux/pci.h>
> @@ -37,7 +38,6 @@
>  #include <linux/pnp.h>
>  #include <linux/slab.h>
>  #include <linux/string_helpers.h>
> -#include <linux/vga_switcheroo.h>
>  #include <linux/vt.h>
> =20
>  #include <drm/drm_aperture.h>
> @@ -1057,27 +1057,6 @@ static int i915_driver_open(struct drm_device *dev=
, struct drm_file *file)
>  =09return 0;
>  }
> =20
> -/**
> - * i915_driver_lastclose - clean up after all DRM clients have exited
> - * @dev: DRM device
> - *
> - * Take care of cleaning up after all DRM clients have exited.  In the
> - * mode setting case, we want to restore the kernel's initial mode (just
> - * in case the last client left us in a bad state).
> - *
> - * Additionally, in the non-mode setting case, we'll tear down the GTT
> - * and DMA structures, since the kernel won't be using them, and clea
> - * up any GEM state.
> - */
> -static void i915_driver_lastclose(struct drm_device *dev)
> -{
> -=09struct drm_i915_private *i915 =3D to_i915(dev);
> -
> -=09intel_fbdev_restore_mode(dev);
> -
> -=09vga_switcheroo_process_delayed_switch();
> -}
> -
>  static void i915_driver_postclose(struct drm_device *dev, struct drm_fil=
e *file)
>  {
>  =09struct drm_i915_file_private *file_priv =3D file->driver_priv;
> @@ -1921,7 +1900,7 @@ static const struct drm_driver i915_drm_driver =3D =
{
>  =09    DRIVER_SYNCOBJ_TIMELINE,
>  =09.release =3D i915_driver_release,
>  =09.open =3D i915_driver_open,
> -=09.lastclose =3D i915_driver_lastclose,
> +=09.lastclose =3D intel_fbdev_restore_mode,
>  =09.postclose =3D i915_driver_postclose,
> =20
>  =09.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouv=
eau/nouveau_drm.c
> index 80f154b6adab..c3bd2a1d3d2e 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1230,7 +1230,6 @@ driver_stub =3D {
> =20
>  =09.open =3D nouveau_drm_open,
>  =09.postclose =3D nouveau_drm_postclose,
> -=09.lastclose =3D nouveau_vga_lastclose,
> =20
>  #if defined(CONFIG_DEBUG_FS)
>  =09.debugfs_init =3D nouveau_drm_debugfs_init,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouv=
eau/nouveau_vga.c
> index 789393b94291..fc125e2247f7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -126,10 +126,3 @@ nouveau_vga_fini(struct nouveau_drm *drm)
>  =09if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
>  =09=09vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
>  }
> -
> -
> -void
> -nouveau_vga_lastclose(struct drm_device *dev)
> -{
> -=09vga_switcheroo_process_delayed_switch();
> -}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.h b/drivers/gpu/drm/nouv=
eau/nouveau_vga.h
> index 951a83f984dd..63be415d2a44 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.h
> @@ -4,6 +4,5 @@
> =20
>  void nouveau_vga_init(struct nouveau_drm *);
>  void nouveau_vga_fini(struct nouveau_drm *);
> -void nouveau_vga_lastclose(struct drm_device *dev);
> =20
>  #endif
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon=
/radeon_drv.c
> index 6cbe1ab81aba..dbf85e1f0061 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -597,7 +597,7 @@ static const struct drm_driver kms_driver =3D {
>  =09.load =3D radeon_driver_load_kms,
>  =09.open =3D radeon_driver_open_kms,
>  =09.postclose =3D radeon_driver_postclose_kms,
> -=09.lastclose =3D radeon_driver_lastclose_kms,
> +=09.lastclose =3D drm_fb_helper_lastclose,
>  =09.unload =3D radeon_driver_unload_kms,
>  =09.ioctls =3D radeon_ioctls_kms,
>  =09.num_ioctls =3D ARRAY_SIZE(radeon_ioctls_kms),
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.h b/drivers/gpu/drm/radeon=
/radeon_drv.h
> index ac7970919c4d..2ffe0975ee54 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.h
> +++ b/drivers/gpu/drm/radeon/radeon_drv.h
> @@ -120,7 +120,6 @@ long radeon_drm_ioctl(struct file *filp,
> =20
>  int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags);
>  void radeon_driver_unload_kms(struct drm_device *dev);
> -void radeon_driver_lastclose_kms(struct drm_device *dev);
>  int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file=
_priv);
>  void radeon_driver_postclose_kms(struct drm_device *dev,
>  =09=09=09=09 struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon=
/radeon_kms.c
> index 965161b8565b..e0214cf1b43b 100644
> --- a/drivers/gpu/drm/radeon/radeon_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_kms.c
> @@ -32,7 +32,6 @@
>  #include <linux/uaccess.h>
>  #include <linux/vga_switcheroo.h>
> =20
> -#include <drm/drm_fb_helper.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/radeon_drm.h>
> @@ -622,23 +621,6 @@ int radeon_info_ioctl(struct drm_device *dev, void *=
data, struct drm_file *filp)
>  =09return 0;
>  }
> =20
> -
> -/*
> - * Outdated mess for old drm with Xorg being in charge (void function no=
w).
> - */
> -/**
> - * radeon_driver_lastclose_kms - drm callback for last close
> - *
> - * @dev: drm dev pointer
> - *
> - * Switch vga_switcheroo state after last close (all asics).
> - */
> -void radeon_driver_lastclose_kms(struct drm_device *dev)
> -{
> -=09drm_fb_helper_lastclose(dev);
> -=09vga_switcheroo_process_delayed_switch();
> -}
> -
>  /**
>   * radeon_driver_open_kms - drm callback for open
>   *
> diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switc=
heroo.c
> index 365e6ddbe90f..6a198cb80c12 100644
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@ -926,8 +926,8 @@ static void vga_switcheroo_debugfs_init(struct vgasr_=
priv *priv)
>  /**
>   * vga_switcheroo_process_delayed_switch() - helper for delayed switchin=
g
>   *
> - * Process a delayed switch if one is pending. DRM drivers should call t=
his
> - * from their ->lastclose callback.
> + * Process a delayed switch if one is pending. DRM automatically calls t=
his
> + * at the end of its lastclose function.
>   *
>   * Return: 0 on success. -EINVAL if no delayed switch is pending, if the=
 client
>   * has unregistered in the meantime or if there are other clients blocki=
ng the

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

