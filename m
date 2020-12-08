Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 217762D3D76
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4116E9D5;
	Wed,  9 Dec 2020 08:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6836E954
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 14:00:38 +0000 (UTC)
Date: Tue, 08 Dec 2020 14:00:22 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/5] drm: Add and export =?UTF-8?Q?function=0D=0A?=
 drm_gem_cma_mmap_noncoherent
To: Christoph Hellwig <hch@infradead.org>
Message-Id: <MKX0LQ.WS1HU920R7ZP2@crapouillou.net>
In-Reply-To: <FQI8JQ.KNVZ9XZ67ZV41@crapouillou.net>
References: <20201102220651.22069-1-paul@crapouillou.net>
 <20201102220651.22069-4-paul@crapouillou.net>
 <20201103185058.GA20134@infradead.org>
 <FQI8JQ.KNVZ9XZ67ZV41@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, od@zcrc.me,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

Le mar. 3 nov. 2020 =E0 19:13, Paul Cercueil <paul@crapouillou.net> a =

=E9crit :
> Hi Christoph,
> =

> Le mar. 3 nov. 2020 =E0 18:50, Christoph Hellwig <hch@infradead.org> a =

> =E9crit :
>> On Mon, Nov 02, 2020 at 10:06:49PM +0000, Paul Cercueil wrote:
>>>  This function can be used by drivers that need to mmap dumb buffers
>>>  created with non-coherent backing memory.
>>> =

>>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>>  ---
>>>   drivers/gpu/drm/drm_gem_cma_helper.c | 39 =

>>> =7F=7F++++++++++++++++++++++++++++
>>>   include/drm/drm_gem_cma_helper.h     |  2 ++
>>>   2 files changed, 41 insertions(+)
>>> =

>>>  diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c =

>>> =7F=7Fb/drivers/gpu/drm/drm_gem_cma_helper.c
>>>  index 3bdd67795e20..4ed63f4896bd 100644
>>>  --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>>>  +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>>>  @@ -387,6 +387,45 @@ int drm_gem_cma_mmap(struct file *filp, =

>>> struct =7F=7Fvm_area_struct *vma)
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
>>> =

>>>  +/**
>>>  + * drm_gem_cma_mmap_noncoherent - memory-map a CMA GEM object with
>>>  + *     non-coherent cache attribute
>>>  + * @filp: file object
>>>  + * @vma: VMA for the area to be mapped
>>>  + *
>>>  + * Just like drm_gem_cma_mmap, but for a GEM object backed by =

>>> =7F=7Fnon-coherent
>>>  + * memory.
>>>  + *
>>>  + * Returns:
>>>  + * 0 on success or a negative error code on failure.
>>>  + */
>>>  +int drm_gem_cma_mmap_noncoherent(struct file *filp, struct =

>>> =7F=7Fvm_area_struct *vma)
>>>  +{
>>>  +	struct drm_gem_cma_object *cma_obj;
>>>  +	int ret;
>>>  +
>>>  +	ret =3D drm_gem_mmap(filp, vma);
>>>  +	if (ret)
>>>  +		return ret;
>>>  +
>>>  +	cma_obj =3D to_drm_gem_cma_obj(vma->vm_private_data);
>>>  +
>>>  +	/*
>>>  +	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and =

>>> =7F=7Fset the
>>>  +	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we =

>>> want =7F=7Fto map
>>>  +	 * the whole buffer.
>>>  +	 */
>>>  +	vma->vm_flags &=3D ~VM_PFNMAP;
>>>  +	vma->vm_pgoff =3D 0;
>>>  +	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>>>  +
>>>  +	return remap_pfn_range(vma, vma->vm_start,
>>>  +			       cma_obj->paddr >> PAGE_SHIFT,
>>>  +			       vma->vm_end - vma->vm_start,
>>>  +			       vma->vm_page_prot);
>> =

>> Per patch 1 cma_obj->paddr is the dma address, while remap_pfn_range
>> expects a physical address.  This does not work.
> =

> Ok, what would be the correct way to mmap_noncoherent?

Waiting for your input here :)

Cheers,
-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
