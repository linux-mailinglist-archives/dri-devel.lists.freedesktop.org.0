Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5382F61EA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 14:26:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83746E321;
	Thu, 14 Jan 2021 13:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF486E321
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 13:26:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7C1AACB0;
 Thu, 14 Jan 2021 13:26:42 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
To: kieran.bingham+renesas@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
Date: Thu, 14 Jan 2021 14:26:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0020811175=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0020811175==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NuRNkZr7cVBv8p8FCD6h20y55c9X14rpZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NuRNkZr7cVBv8p8FCD6h20y55c9X14rpZ
Content-Type: multipart/mixed; boundary="fYjL4RhaIWzC1aPqWzc3f6ZV564jVaLlO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kieran.bingham+renesas@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
In-Reply-To: <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>

--fYjL4RhaIWzC1aPqWzc3f6ZV564jVaLlO
Content-Type: multipart/mixed;
 boundary="------------45C2C3C6C43F57AFBD43E3A2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------45C2C3C6C43F57AFBD43E3A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Kieran

Am 14.01.21 um 13:51 schrieb Kieran Bingham:
> Hi Thomas,
>=20
> On 23/11/2020 11:56, Thomas Zimmermann wrote:
>> The new GEM object function drm_gem_cma_mmap() sets the VMA flags
>> and offset as in the old implementation and immediately maps in the
>> buffer's memory pages.
>>
>> Changing CMA helpers to use the GEM object function allows for the
>> removal of the special implementations for mmap and gem_prime_mmap
>> callbacks. The regular functions drm_gem_mmap() and drm_gem_prime_mmap=
()
>> are now used.
>=20
> I've encountered a memory leak regression in our Renesas R-Car DU tests=
,
> and git bisection has led me to this patch (as commit f5ca8eb6f9).
>=20
> Running the tests sequentially, while grepping /proc/meminfo for Cma, i=
t
> is evident that CMA memory is not released, until exhausted and the
> allocations fail (seen in [0]) shown by the error report:
>=20
>>      self.fbs.append(pykms.DumbFramebuffer(self.card, mode.hdisplay, m=
ode.vdisplay, "XR24"))
>> ValueError: DRM_IOCTL_MODE_CREATE_DUMB failed: Cannot allocate memory
>=20
>=20
> Failing tests at f5ca8eb6f9 can be seen at [0], while the tests pass
> successfully [1] on the commit previous to that (bc2532ab7c2):
>=20
> Reverting f5ca8eb6f9 also produces a successful pass [2]
>=20
>   [0] https://paste.ubuntu.com/p/VjPGPgswxR/ # Failed at f5ca8eb6f9
>   [1] https://paste.ubuntu.com/p/78RRp2WpNR/ # Success at bc2532ab7c2
>   [2] https://paste.ubuntu.com/p/qJKjZZN2pt/ # Success with revert
>=20
>=20
> I don't believe we handle mmap specially in the RCar-DU driver, so I
> wonder if this issue has hit anyone else as well?
>=20
> Any ideas of a repair without a revert ? Or do we just need to submit a=

> revert?

I think we might not be setting the VMA ops and therefore not finalize=20
the BO correctly. Could you please apply the attched (quick-and-dirty)=20
patch and try again?

Best regards
Thomas

>=20
> I've yet to fully understand the implications of the patch below.
>=20
> Thanks
> --
> Regards
>=20
> Kieran
>=20
>=20
>=20
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/drm_file.c           |   3 +-
>>   drivers/gpu/drm/drm_gem_cma_helper.c | 121 +++++++++----------------=
--
>>   drivers/gpu/drm/pl111/pl111_drv.c    |   2 +-
>>   drivers/gpu/drm/vc4/vc4_bo.c         |   2 +-
>>   include/drm/drm_gem_cma_helper.h     |  10 +--
>>   5 files changed, 44 insertions(+), 94 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index b50380fa80ce..80886d50d0f1 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -113,8 +113,7 @@ bool drm_dev_needs_global_mutex(struct drm_device =
*dev)
>>    * The memory mapping implementation will vary depending on how the =
driver
>>    * manages memory. Legacy drivers will use the deprecated drm_legacy=
_mmap()
>>    * function, modern drivers should use one of the provided memory-ma=
nager
>> - * specific implementations. For GEM-based drivers this is drm_gem_mm=
ap(), and
>> - * for drivers which use the CMA GEM helpers it's drm_gem_cma_mmap().=

>> + * specific implementations. For GEM-based drivers this is drm_gem_mm=
ap().
>>    *
>>    * No other file operations are supported by the DRM userspace API. =
Overall the
>>    * following is an example &file_operations structure::
>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/dr=
m_gem_cma_helper.c
>> index 6a4ef335ebc9..7942cf05cd93 100644
>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>> @@ -38,6 +38,7 @@ static const struct drm_gem_object_funcs drm_gem_cma=
_default_funcs =3D {
>>   	.print_info =3D drm_gem_cma_print_info,
>>   	.get_sg_table =3D drm_gem_cma_get_sg_table,
>>   	.vmap =3D drm_gem_cma_vmap,
>> +	.mmap =3D drm_gem_cma_mmap,
>>   	.vm_ops =3D &drm_gem_cma_vm_ops,
>>   };
>>  =20
>> @@ -277,62 +278,6 @@ const struct vm_operations_struct drm_gem_cma_vm_=
ops =3D {
>>   };
>>   EXPORT_SYMBOL_GPL(drm_gem_cma_vm_ops);
>>  =20
>> -static int drm_gem_cma_mmap_obj(struct drm_gem_cma_object *cma_obj,
>> -				struct vm_area_struct *vma)
>> -{
>> -	int ret;
>> -
>> -	/*
>> -	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set =
the
>> -	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to=
 map
>> -	 * the whole buffer.
>> -	 */
>> -	vma->vm_flags &=3D ~VM_PFNMAP;
>> -	vma->vm_pgoff =3D 0;
>> -
>> -	ret =3D dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
>> -			  cma_obj->paddr, vma->vm_end - vma->vm_start);
>> -	if (ret)
>> -		drm_gem_vm_close(vma);
>> -
>> -	return ret;
>> -}
>> -
>> -/**
>> - * drm_gem_cma_mmap - memory-map a CMA GEM object
>> - * @filp: file object
>> - * @vma: VMA for the area to be mapped
>> - *
>> - * This function implements an augmented version of the GEM DRM file =
mmap
>> - * operation for CMA objects: In addition to the usual GEM VMA setup =
it
>> - * immediately faults in the entire object instead of using on-demain=
d
>> - * faulting. Drivers which employ the CMA helpers should use this fun=
ction
>> - * as their ->mmap() handler in the DRM device file's file_operations=

>> - * structure.
>> - *
>> - * Instead of directly referencing this function, drivers should use =
the
>> - * DEFINE_DRM_GEM_CMA_FOPS().macro.
>> - *
>> - * Returns:
>> - * 0 on success or a negative error code on failure.
>> - */
>> -int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma)
>> -{
>> -	struct drm_gem_cma_object *cma_obj;
>> -	struct drm_gem_object *gem_obj;
>> -	int ret;
>> -
>> -	ret =3D drm_gem_mmap(filp, vma);
>> -	if (ret)
>> -		return ret;
>> -
>> -	gem_obj =3D vma->vm_private_data;
>> -	cma_obj =3D to_drm_gem_cma_obj(gem_obj);
>> -
>> -	return drm_gem_cma_mmap_obj(cma_obj, vma);
>> -}
>> -EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
>> -
>>   #ifndef CONFIG_MMU
>>   /**
>>    * drm_gem_cma_get_unmapped_area - propose address for mapping in no=
MMU cases
>> @@ -500,33 +445,6 @@ drm_gem_cma_prime_import_sg_table(struct drm_devi=
ce *dev,
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_cma_prime_import_sg_table);
>>  =20
>> -/**
>> - * drm_gem_cma_prime_mmap - memory-map an exported CMA GEM object
>> - * @obj: GEM object
>> - * @vma: VMA for the area to be mapped
>> - *
>> - * This function maps a buffer imported via DRM PRIME into a userspac=
e
>> - * process's address space. Drivers that use the CMA helpers should s=
et this
>> - * as their &drm_driver.gem_prime_mmap callback.
>> - *
>> - * Returns:
>> - * 0 on success or a negative error code on failure.
>> - */
>> -int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>> -			   struct vm_area_struct *vma)
>> -{
>> -	struct drm_gem_cma_object *cma_obj;
>> -	int ret;
>> -
>> -	ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	cma_obj =3D to_drm_gem_cma_obj(obj);
>> -	return drm_gem_cma_mmap_obj(cma_obj, vma);
>> -}
>> -EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
>> -
>>   /**
>>    * drm_gem_cma_vmap - map a CMA GEM object into the kernel's virtual=

>>    *     address space
>> @@ -553,6 +471,43 @@ int drm_gem_cma_vmap(struct drm_gem_object *obj, =
struct dma_buf_map *map)
>>   }
>>   EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
>>  =20
>> +/**
>> + * drm_gem_cma_mmap - memory-map an exported CMA GEM object
>> + * @obj: GEM object
>> + * @vma: VMA for the area to be mapped
>> + *
>> + * This function maps a buffer into a userspace process's address spa=
ce.
>> + * In addition to the usual GEM VMA setup it immediately faults in th=
e entire
>> + * object instead of using on-demand faulting. Drivers that use the C=
MA
>> + * helpers should set this as their &drm_gem_object_funcs.mmap callba=
ck.
>> + *
>> + * Returns:
>> + * 0 on success or a negative error code on failure.
>> + */
>> +int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struc=
t *vma)
>> +{
>> +	struct drm_gem_cma_object *cma_obj;
>> +	int ret;
>> +
>> +	/*
>> +	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set =
the
>> +	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to=
 map
>> +	 * the whole buffer.
>> +	 */
>> +	vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
>> +	vma->vm_flags &=3D ~VM_PFNMAP;
>> +
>> +	cma_obj =3D to_drm_gem_cma_obj(obj);
>> +
>> +	ret =3D dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
>> +			  cma_obj->paddr, vma->vm_end - vma->vm_start);
>> +	if (ret)
>> +		drm_gem_vm_close(vma);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
>> +
>>   /**
>>    * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another dri=
ver's
>>    *	scatter/gather table and get the virtual address of the buffer
>> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111=
/pl111_drv.c
>> index 40e6708fbbe2..e4dcaef6c143 100644
>> --- a/drivers/gpu/drm/pl111/pl111_drv.c
>> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
>> @@ -228,7 +228,7 @@ static const struct drm_driver pl111_drm_driver =3D=
 {
>>   	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
>>   	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>>   	.gem_prime_import_sg_table =3D pl111_gem_import_sg_table,
>> -	.gem_prime_mmap =3D drm_gem_cma_prime_mmap,
>> +	.gem_prime_mmap =3D drm_gem_prime_mmap,
>>  =20
>>   #if defined(CONFIG_DEBUG_FS)
>>   	.debugfs_init =3D pl111_debugfs_init,
>> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo=
=2Ec
>> index 813e6cb3f9af..dc316cb79e00 100644
>> --- a/drivers/gpu/drm/vc4/vc4_bo.c
>> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
>> @@ -782,7 +782,7 @@ int vc4_prime_mmap(struct drm_gem_object *obj, str=
uct vm_area_struct *vma)
>>   		return -EINVAL;
>>   	}
>>  =20
>> -	return drm_gem_cma_prime_mmap(obj, vma);
>> +	return drm_gem_prime_mmap(obj, vma);
>>   }
>>  =20
>>   int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map *m=
ap)
>> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cm=
a_helper.h
>> index 4680275ab339..0a9711caa3e8 100644
>> --- a/include/drm/drm_gem_cma_helper.h
>> +++ b/include/drm/drm_gem_cma_helper.h
>> @@ -59,7 +59,7 @@ struct drm_gem_cma_object {
>>   		.poll		=3D drm_poll,\
>>   		.read		=3D drm_read,\
>>   		.llseek		=3D noop_llseek,\
>> -		.mmap		=3D drm_gem_cma_mmap,\
>> +		.mmap		=3D drm_gem_mmap,\
>>   		DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
>>   	}
>>  =20
>> @@ -76,9 +76,6 @@ int drm_gem_cma_dumb_create(struct drm_file *file_pr=
iv,
>>   			    struct drm_device *drm,
>>   			    struct drm_mode_create_dumb *args);
>>  =20
>> -/* set vm_flags and we can change the VM attribute to other one at he=
re */
>> -int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma);
>> -
>>   /* allocate physical memory */
>>   struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm=
,
>>   					      size_t size);
>> @@ -101,9 +98,8 @@ struct drm_gem_object *
>>   drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>>   				  struct dma_buf_attachment *attach,
>>   				  struct sg_table *sgt);
>> -int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>> -			   struct vm_area_struct *vma);
>>   int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map =
*map);
>> +int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struc=
t *vma);
>>  =20
>>   /**
>>    * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operatio=
ns
>> @@ -123,7 +119,7 @@ int drm_gem_cma_vmap(struct drm_gem_object *obj, s=
truct dma_buf_map *map);
>>   	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd, \
>>   	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle, \
>>   	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table, \=

>> -	.gem_prime_mmap		=3D drm_gem_cma_prime_mmap
>> +	.gem_prime_mmap		=3D drm_gem_prime_mmap
>>  =20
>>   /**
>>    * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------45C2C3C6C43F57AFBD43E3A2
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-cma-Set-vma-ops-in-mmap-function.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-drm-cma-Set-vma-ops-in-mmap-function.patch"

=46rom d0583fe22cd0cd29749ff679e46e13b58de325cb Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 14 Jan 2021 14:21:51 +0100
Subject: [PATCH] drm/cma: Set vma ops in mmap function

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_g=
em_cma_helper.c
index 7942cf05cd93..0bd192736169 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -489,6 +489,8 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, stru=
ct vm_area_struct *vma)
 	struct drm_gem_cma_object *cma_obj;
 	int ret;
=20
+	vma->vm_ops =3D obj->funcs->vm_ops;
+
 	/*
 	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the=

 	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to ma=
p
--=20
2.29.2


--------------45C2C3C6C43F57AFBD43E3A2--

--fYjL4RhaIWzC1aPqWzc3f6ZV564jVaLlO--

--NuRNkZr7cVBv8p8FCD6h20y55c9X14rpZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAARpEFAwAAAAAACgkQlh/E3EQov+Al
iw/+L7XhIseuWlvbHgu7J00agnb+bKukWI+zRKNSOsYeGtECdd/jLC6bbUmk6Ctne0cmbFrgtrJM
qb/zsVSxw5EYKr8sSS+HEdYHamkbzj8AM9vKdI5Wo1/dmYGIXGDDSkqXfZhH0xRPo1G61zOiH3Rc
9DiGleTe5U6iMTWseCZF0kLWKY2jbL6KdYr5L5nV3fy3qieel4V4QyjJj4U7M59jkS8nIf5iqK3E
PMSWbhrujwx6qHgs1eQ/jsk2h6TDRC1LAqTVXrBNLUEPF2dIhx15hgLZU2MntEP/lTPBqybLvTaL
bcYzLr4WpTiOz1bCK3hwEQ1AoZFakBF8uA9EGkmU2NdujWhRhrzlXWRAjgCOGjZTL3G4+SYsv9ot
bRCLQoLzPP+fJEHGzUEpJfUh1o/RThRw/nl1ljQkkkxtupaCAPL8WWoRWwusrCxDf2MNQirIkyCh
rLqOEd2lUAaW5283mUWf2y/WvIgPvl6uZwB1NoDb1J3KZxn4PT0qYwpG+5ix1ZoT9mzQ+vTpAnpG
0tQwk8uIFWgVchTiQ0a0UOHIvUY2/0QCCleTX1C/rwNiVGmJnA0sUxLmMczbfdSf+JCofVByEX8k
mF3eZYJA4F0qFwNpozVKFneilQUcXakcjnfmIGmp80rb7wFCzxyyDwl5u+Wq/3vOhnj+Nny1M6IT
JHw=
=egTA
-----END PGP SIGNATURE-----

--NuRNkZr7cVBv8p8FCD6h20y55c9X14rpZ--

--===============0020811175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0020811175==--
