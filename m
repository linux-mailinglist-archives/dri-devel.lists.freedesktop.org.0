Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3C8E453B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 10:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1F46E8D0;
	Fri, 25 Oct 2019 08:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0536E8DB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 08:08:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0EDFDB9CE;
 Fri, 25 Oct 2019 08:08:44 +0000 (UTC)
Subject: Re: [PATCH 5/5] drm/udl: Replace fbdev code with generic emulation
To: Daniel Vetter <daniel@ffwll.ch>
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-6-tzimmermann@suse.de>
 <20191025074746.GR11828@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <001d0980-04f7-1eed-40cc-44a3f63d78ad@suse.de>
Date: Fri, 25 Oct 2019 10:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191025074746.GR11828@phenom.ffwll.local>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: sam@ravnborg.org, airlied@redhat.com, sean@poorly.run,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1813411413=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1813411413==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UGN3D39RXLGn2bYhUrFDvyJ1IRZcrWHZn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UGN3D39RXLGn2bYhUrFDvyJ1IRZcrWHZn
Content-Type: multipart/mixed; boundary="DDyhGe72LO9THd6aldkLRUOyTKkuxrj3w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sam@ravnborg.org
Message-ID: <001d0980-04f7-1eed-40cc-44a3f63d78ad@suse.de>
Subject: Re: [PATCH 5/5] drm/udl: Replace fbdev code with generic emulation
References: <20191024144237.8898-1-tzimmermann@suse.de>
 <20191024144237.8898-6-tzimmermann@suse.de>
 <20191025074746.GR11828@phenom.ffwll.local>
In-Reply-To: <20191025074746.GR11828@phenom.ffwll.local>

--DDyhGe72LO9THd6aldkLRUOyTKkuxrj3w
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.10.19 um 09:47 schrieb Daniel Vetter:
> On Thu, Oct 24, 2019 at 04:42:37PM +0200, Thomas Zimmermann wrote:
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/udl/udl_drv.c     |   3 +
>>  drivers/gpu/drm/udl/udl_drv.h     |   4 -
>>  drivers/gpu/drm/udl/udl_fb.c      | 263 +----------------------------=
-
>>  drivers/gpu/drm/udl/udl_main.c    |   2 -
>>  drivers/gpu/drm/udl/udl_modeset.c |   3 +-
>>  5 files changed, 8 insertions(+), 267 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_d=
rv.c
>> index 15ad7a338f9d..6beaa1109c2c 100644
>> --- a/drivers/gpu/drm/udl/udl_drv.c
>> +++ b/drivers/gpu/drm/udl/udl_drv.c
>> @@ -7,6 +7,7 @@
>> =20
>>  #include <drm/drm_crtc_helper.h>
>>  #include <drm/drm_drv.h>
>> +#include <drm/drm_fb_helper.h>
>>  #include <drm/drm_file.h>
>>  #include <drm/drm_ioctl.h>
>>  #include <drm/drm_probe_helper.h>
>> @@ -62,6 +63,8 @@ static struct drm_driver driver =3D {
>>  	.driver_features =3D DRIVER_MODESET | DRIVER_GEM,
>>  	.release =3D udl_driver_release,
>> =20
>> +	.lastclose =3D drm_fb_helper_lastclose,
>> +
>>  	/* gem hooks */
>>  	.gem_free_object_unlocked =3D udl_gem_free_object,
>>  	.gem_vm_ops =3D &udl_gem_vm_ops,
>> diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_d=
rv.h
>> index 12a970fd9a87..5f8a7ac084f6 100644
>> --- a/drivers/gpu/drm/udl/udl_drv.h
>> +++ b/drivers/gpu/drm/udl/udl_drv.h
>> @@ -50,8 +50,6 @@ struct urb_list {
>>  	size_t size;
>>  };
>> =20
>> -struct udl_fbdev;
>> -
>>  struct udl_device {
>>  	struct drm_device drm;
>>  	struct device *dev;
>> @@ -65,7 +63,6 @@ struct udl_device {
>>  	struct urb_list urbs;
>>  	atomic_t lost_pixels; /* 1 =3D a render op failed. Need screen refre=
sh */
>> =20
>> -	struct udl_fbdev *fbdev;
>>  	char mode_buf[1024];
>>  	uint32_t mode_buf_len;
>>  	atomic_t bytes_rendered; /* raw pixel-bytes driver asked to render *=
/
>> @@ -111,7 +108,6 @@ int udl_init(struct udl_device *udl);
>>  void udl_fini(struct drm_device *dev);
>> =20
>>  int udl_fbdev_init(struct drm_device *dev);
>> -void udl_fbdev_cleanup(struct drm_device *dev);
>>  void udl_fbdev_unplug(struct drm_device *dev);
>>  struct drm_framebuffer *
>>  udl_fb_user_fb_create(struct drm_device *dev,
>> diff --git a/drivers/gpu/drm/udl/udl_fb.c b/drivers/gpu/drm/udl/udl_fb=
=2Ec
>> index ef3504d06343..43a1da3a56c3 100644
>> --- a/drivers/gpu/drm/udl/udl_fb.c
>> +++ b/drivers/gpu/drm/udl/udl_fb.c
>> @@ -19,19 +19,9 @@
>> =20
>>  #include "udl_drv.h"
>> =20
>> -#define DL_DEFIO_WRITE_DELAY    (HZ/20) /* fb_deferred_io.delay in ji=
ffies */
>> -
>> -static int fb_defio =3D 0;  /* Optionally enable experimental fb_defi=
o mmap support */
>>  static int fb_bpp =3D 16;
>> =20
>>  module_param(fb_bpp, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
>> -module_param(fb_defio, int, S_IWUSR | S_IRUSR | S_IWGRP | S_IRGRP);
>> -
>> -struct udl_fbdev {
>> -	struct drm_fb_helper helper; /* must be first */
>> -	struct udl_framebuffer ufb;
>> -	int fb_count;
>> -};
>> =20
>>  #define DL_ALIGN_UP(x, a) ALIGN(x, a)
>>  #define DL_ALIGN_DOWN(x, a) ALIGN_DOWN(x, a)
>> @@ -157,123 +147,6 @@ int udl_handle_damage(struct udl_framebuffer *fb=
, int x, int y,
>>  	return 0;
>>  }
>> =20
>> -static int udl_fb_mmap(struct fb_info *info, struct vm_area_struct *v=
ma)
>> -{
>> -	unsigned long start =3D vma->vm_start;
>> -	unsigned long size =3D vma->vm_end - vma->vm_start;
>> -	unsigned long offset;
>> -	unsigned long page, pos;
>> -
>> -	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
>> -		return -EINVAL;
>> -
>> -	offset =3D vma->vm_pgoff << PAGE_SHIFT;
>> -
>> -	if (offset > info->fix.smem_len || size > info->fix.smem_len - offse=
t)
>> -		return -EINVAL;
>> -
>> -	pos =3D (unsigned long)info->fix.smem_start + offset;
>> -
>> -	pr_debug("mmap() framebuffer addr:%lu size:%lu\n",
>> -		  pos, size);
>> -
>> -	/* We don't want the framebuffer to be mapped encrypted */
>> -	vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>> -
>> -	while (size > 0) {
>> -		page =3D vmalloc_to_pfn((void *)pos);
>> -		if (remap_pfn_range(vma, start, page, PAGE_SIZE, PAGE_SHARED))
>> -			return -EAGAIN;
>> -
>> -		start +=3D PAGE_SIZE;
>> -		pos +=3D PAGE_SIZE;
>> -		if (size > PAGE_SIZE)
>> -			size -=3D PAGE_SIZE;
>> -		else
>> -			size =3D 0;
>> -	}
>> -
>> -	/* VM_IO | VM_DONTEXPAND | VM_DONTDUMP are set by remap_pfn_range() =
*/
>> -	return 0;
>> -}
>> -
>> -/*
>> - * It's common for several clients to have framebuffer open simultane=
ously.
>> - * e.g. both fbcon and X. Makes things interesting.
>> - * Assumes caller is holding info->lock (for open and release at leas=
t)
>> - */
>> -static int udl_fb_open(struct fb_info *info, int user)
>> -{
>> -	struct udl_fbdev *ufbdev =3D info->par;
>> -	struct drm_device *dev =3D ufbdev->ufb.base.dev;
>> -	struct udl_device *udl =3D to_udl(dev);
>> -
>> -	/* If the USB device is gone, we don't accept new opens */
>> -	if (drm_dev_is_unplugged(&udl->drm))
>> -		return -ENODEV;
>> -
>> -	ufbdev->fb_count++;
>> -
>> -#ifdef CONFIG_DRM_FBDEV_EMULATION
>> -	if (fb_defio && (info->fbdefio =3D=3D NULL)) {
>> -		/* enable defio at last moment if not disabled by client */
>> -
>> -		struct fb_deferred_io *fbdefio;
>> -
>> -		fbdefio =3D kzalloc(sizeof(struct fb_deferred_io), GFP_KERNEL);
>> -
>> -		if (fbdefio) {
>> -			fbdefio->delay =3D DL_DEFIO_WRITE_DELAY;
>> -			fbdefio->deferred_io =3D drm_fb_helper_deferred_io;
>> -		}
>> -
>> -		info->fbdefio =3D fbdefio;
>> -		fb_deferred_io_init(info);
>> -	}
>> -#endif
>> -
>> -	pr_debug("open /dev/fb%d user=3D%d fb_info=3D%p count=3D%d\n",
>> -		  info->node, user, info, ufbdev->fb_count);
>> -
>> -	return 0;
>> -}
>> -
>> -
>> -/*
>> - * Assumes caller is holding info->lock mutex (for open and release a=
t least)
>> - */
>> -static int udl_fb_release(struct fb_info *info, int user)
>> -{
>> -	struct udl_fbdev *ufbdev =3D info->par;
>> -
>> -	ufbdev->fb_count--;
>> -
>> -#ifdef CONFIG_DRM_FBDEV_EMULATION
>> -	if ((ufbdev->fb_count =3D=3D 0) && (info->fbdefio)) {
>> -		fb_deferred_io_cleanup(info);
>> -		kfree(info->fbdefio);
>> -		info->fbdefio =3D NULL;
>> -		info->fbops->fb_mmap =3D udl_fb_mmap;
>> -	}
>> -#endif
>> -
>> -	pr_debug("released /dev/fb%d user=3D%d count=3D%d\n",
>> -		info->node, user, ufbdev->fb_count);
>> -
>> -	return 0;
>> -}
>> -
>> -static struct fb_ops udlfb_ops =3D {
>> -	.owner =3D THIS_MODULE,
>> -	DRM_FB_HELPER_DEFAULT_OPS,
>> -	.fb_fillrect =3D drm_fb_helper_sys_fillrect,
>> -	.fb_copyarea =3D drm_fb_helper_sys_copyarea,
>> -	.fb_imageblit =3D drm_fb_helper_sys_imageblit,
>> -	.fb_mmap =3D udl_fb_mmap,
>> -	.fb_open =3D udl_fb_open,
>> -	.fb_release =3D udl_fb_release,
>> -};
>> -
>>  static int udl_user_framebuffer_dirty(struct drm_framebuffer *fb,
>>  				      struct drm_file *file,
>>  				      unsigned flags, unsigned color,
>> @@ -346,150 +219,20 @@ udl_framebuffer_init(struct drm_device *dev,
>>  	return ret;
>>  }
>> =20
>> -
>> -static int udlfb_create(struct drm_fb_helper *helper,
>> -			struct drm_fb_helper_surface_size *sizes)
>> -{
>> -	struct udl_fbdev *ufbdev =3D
>> -		container_of(helper, struct udl_fbdev, helper);
>> -	struct drm_device *dev =3D ufbdev->helper.dev;
>> -	struct fb_info *info;
>> -	struct drm_framebuffer *fb;
>> -	struct drm_mode_fb_cmd2 mode_cmd;
>> -	struct udl_gem_object *obj;
>> -	uint32_t size;
>> -	int ret =3D 0;
>> -
>> -	if (sizes->surface_bpp =3D=3D 24)
>> -		sizes->surface_bpp =3D 32;
>> -
>> -	mode_cmd.width =3D sizes->surface_width;
>> -	mode_cmd.height =3D sizes->surface_height;
>> -	mode_cmd.pitches[0] =3D mode_cmd.width * ((sizes->surface_bpp + 7) /=
 8);
>> -
>> -	mode_cmd.pixel_format =3D drm_mode_legacy_fb_format(sizes->surface_b=
pp,
>> -							  sizes->surface_depth);
>> -
>> -	size =3D mode_cmd.pitches[0] * mode_cmd.height;
>> -	size =3D ALIGN(size, PAGE_SIZE);
>> -
>> -	obj =3D udl_gem_alloc_object(dev, size);
>> -	if (!obj)
>> -		goto out;
>> -
>> -	ret =3D udl_gem_vmap(obj);
>> -	if (ret) {
>> -		DRM_ERROR("failed to vmap fb\n");
>> -		goto out_gfree;
>> -	}
>> -
>> -	info =3D drm_fb_helper_alloc_fbi(helper);
>> -	if (IS_ERR(info)) {
>> -		ret =3D PTR_ERR(info);
>> -		goto out_gfree;
>> -	}
>> -
>> -	ret =3D udl_framebuffer_init(dev, &ufbdev->ufb, &mode_cmd, obj);
>> -	if (ret)
>> -		goto out_gfree;
>> -
>> -	fb =3D &ufbdev->ufb.base;
>> -
>> -	ufbdev->helper.fb =3D fb;
>> -
>> -	info->screen_base =3D ufbdev->ufb.obj->vmapping;
>> -	info->fix.smem_len =3D size;
>> -	info->fix.smem_start =3D (unsigned long)ufbdev->ufb.obj->vmapping;
>> -
>> -	info->fbops =3D &udlfb_ops;
>> -	drm_fb_helper_fill_info(info, &ufbdev->helper, sizes);
>> -
>> -	DRM_DEBUG_KMS("allocated %dx%d vmal %p\n",
>> -		      fb->width, fb->height,
>> -		      ufbdev->ufb.obj->vmapping);
>> -
>> -	return ret;
>> -out_gfree:
>> -	drm_gem_object_put_unlocked(&ufbdev->ufb.obj->base);
>> -out:
>> -	return ret;
>> -}
>> -
>> -static const struct drm_fb_helper_funcs udl_fb_helper_funcs =3D {
>> -	.fb_probe =3D udlfb_create,
>> -};
>> -
>> -static void udl_fbdev_destroy(struct drm_device *dev,
>> -			      struct udl_fbdev *ufbdev)
>> -{
>> -	drm_fb_helper_unregister_fbi(&ufbdev->helper);
>> -	drm_fb_helper_fini(&ufbdev->helper);
>> -	if (ufbdev->ufb.obj) {
>> -		drm_framebuffer_unregister_private(&ufbdev->ufb.base);
>> -		drm_framebuffer_cleanup(&ufbdev->ufb.base);
>> -		drm_gem_object_put_unlocked(&ufbdev->ufb.obj->base);
>> -	}
>> -}
>> -
>>  int udl_fbdev_init(struct drm_device *dev)
>>  {
>> -	struct udl_device *udl =3D to_udl(dev);
>>  	int bpp_sel =3D fb_bpp;
>> -	struct udl_fbdev *ufbdev;
>>  	int ret;
>> =20
>> -	ufbdev =3D kzalloc(sizeof(struct udl_fbdev), GFP_KERNEL);
>> -	if (!ufbdev)
>> -		return -ENOMEM;
>> -
>> -	udl->fbdev =3D ufbdev;
>> -
>> -	drm_fb_helper_prepare(dev, &ufbdev->helper, &udl_fb_helper_funcs);
>> -
>> -	ret =3D drm_fb_helper_init(dev, &ufbdev->helper, 1);
>> -	if (ret)
>> -		goto free;
>> -
>> -	ret =3D drm_fb_helper_single_add_all_connectors(&ufbdev->helper);
>> +	ret =3D drm_fbdev_generic_setup(dev, bpp_sel);
>>  	if (ret)
>> -		goto fini;
>> -
>> -	/* disable all the possible outputs/crtcs before entering KMS mode *=
/
>> -	drm_helper_disable_unused_functions(dev);
>> -
>> -	ret =3D drm_fb_helper_initial_config(&ufbdev->helper, bpp_sel);
>> -	if (ret)
>> -		goto fini;
>> -
>> +		return ret;
>>  	return 0;
>> -
>> -fini:
>> -	drm_fb_helper_fini(&ufbdev->helper);
>> -free:
>> -	kfree(ufbdev);
>> -	return ret;
>> -}
>> -
>> -void udl_fbdev_cleanup(struct drm_device *dev)
>> -{
>> -	struct udl_device *udl =3D to_udl(dev);
>> -	if (!udl->fbdev)
>> -		return;
>> -
>> -	udl_fbdev_destroy(dev, udl->fbdev);
>> -	kfree(udl->fbdev);
>> -	udl->fbdev =3D NULL;
>>  }
>> =20
>>  void udl_fbdev_unplug(struct drm_device *dev)
>>  {
>> -	struct udl_device *udl =3D to_udl(dev);
>> -	struct udl_fbdev *ufbdev;
>> -	if (!udl->fbdev)
>> -		return;
>> -
>> -	ufbdev =3D udl->fbdev;
>> -	drm_fb_helper_unlink_fbi(&ufbdev->helper);
>> +	drm_fb_helper_unlink_fbi(dev->fb_helper);
>=20
> Uh I think this here can be all garbage-collected. The generic fbdev
> already calls drm_fb_helper_unregister_fbi, which calls
> unregister_framebuffer, which is a strict superset of unlink_framebuffe=
r.
> The later isn't really enough for hotunplug.
>=20
> So for generic fbdev you really shouldn't need any cleanup nor unplug
> functions anymore.
>=20
> Also udl is the only caller of drm_fb_helper_unlink_fbi, so we could dr=
op
> that. Which removes the only external caller of unlink_framebuffer, so =
we
> can drop that too. Care to follow up with those 2 patches?

Sure. BTW is there a policy for keeping potentially useful functions? I
recently converted vboxvideo to generic fbdev and notices that there are
no more users of drm_fb_helper_fbdev_{setup,teardown}(). But there's
still a TODO item for converting drivers over to them. Shall they remain
in the code base?

I have quite a few patches for udl in the making. After converting to
shmem and generic fbdev, udl_framebuffer can be replaced with the GEM
framebuffer code. The udl modesetting code is an epicenter of simple
display pipelines. Converting this over should give atomic mode setting.

Best regards
Thomas

> Aside from this this patch here looks great!
> -Daniel
>=20
>>  }
>> =20
>>  struct drm_framebuffer *
>> diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_=
main.c
>> index 4e854e017390..2a6399290f09 100644
>> --- a/drivers/gpu/drm/udl/udl_main.c
>> +++ b/drivers/gpu/drm/udl/udl_main.c
>> @@ -367,6 +367,4 @@ void udl_fini(struct drm_device *dev)
>> =20
>>  	if (udl->urbs.count)
>>  		udl_free_urb_list(dev);
>> -
>> -	udl_fbdev_cleanup(dev);
>>  }
>> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/u=
dl_modeset.c
>> index bc1ab6060dc6..1517d5e881b8 100644
>> --- a/drivers/gpu/drm/udl/udl_modeset.c
>> +++ b/drivers/gpu/drm/udl/udl_modeset.c
>> @@ -10,6 +10,7 @@
>>   */
>> =20
>>  #include <drm/drm_crtc_helper.h>
>> +#include <drm/drm_fb_helper.h>
>>  #include <drm/drm_modeset_helper_vtables.h>
>>  #include <drm/drm_vblank.h>
>> =20
>> @@ -422,7 +423,7 @@ static int udl_crtc_init(struct drm_device *dev)
>> =20
>>  static const struct drm_mode_config_funcs udl_mode_funcs =3D {
>>  	.fb_create =3D udl_fb_user_fb_create,
>> -	.output_poll_changed =3D NULL,
>> +	.output_poll_changed =3D drm_fb_helper_output_poll_changed,
>>  };
>> =20
>>  int udl_modeset_init(struct drm_device *dev)
>> --=20
>> 2.23.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--DDyhGe72LO9THd6aldkLRUOyTKkuxrj3w--

--UGN3D39RXLGn2bYhUrFDvyJ1IRZcrWHZn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl2yrYgACgkQaA3BHVML
eiMyyAf+JCb9sdAvPrVF6SCGPOxZFnqropzXB3pv8UmqebGgzSagPImgWCDAMyax
Y9KxOL0j1kJjzMXhz6TF/KgMnKW5jrvrFHVT9oIIpLx9bu0QaOe4BU76njEpg0ZW
XqVs9X8f3WivHMEwfmTSXLhuffuGk244xWUQgvNRlFE7hsIm0whvFUBzTlWqfYby
o6MFtNG9/XTrq1etJWU1OFkkhgWt0yIn16wsVDjbV389yNuT+3HxBdlait8JQsyx
yDFZHaAuW+yoJd+FmCbh1LZvxIJGpZqaKD4WqdSeiepCag6MBl3Hcw/GyzKm8rl6
D79isTZ9G4Uw/k8hhAOYvTBqNUqBaA==
=M8YF
-----END PGP SIGNATURE-----

--UGN3D39RXLGn2bYhUrFDvyJ1IRZcrWHZn--

--===============1813411413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1813411413==--
