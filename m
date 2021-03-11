Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126533372AA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:32:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678866E50B;
	Thu, 11 Mar 2021 12:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5F16E50B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 12:32:42 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:32:27 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/5] drm: Add and export function
 drm_gem_cma_mmap_noncoherent
To: Christoph Hellwig <hch@infradead.org>
Message-Id: <3I1TPQ.E55GRWWDYVRG@crapouillou.net>
In-Reply-To: <20210311122642.GB1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-4-paul@crapouillou.net>
 <20210311122642.GB1739082@infradead.org>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, od@zcrc.me,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christoph,

Le jeu. 11 mars 2021 =E0 12:26, Christoph Hellwig <hch@infradead.org> a =

=E9crit :
>>  +int drm_gem_cma_mmap_noncoherent(struct drm_gem_object *obj,
>>  +				 struct vm_area_struct *vma)
>>  +{
>>  +	struct drm_gem_cma_object *cma_obj;
>>  +	unsigned long pfn;
>>  +	int ret;
>>  +
>>  +	/*
>>  +	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and =

>> set the
>>  +	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want =

>> to map
>>  +	 * the whole buffer.
>>  +	 */
>>  +	vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
>>  +	vma->vm_flags &=3D ~VM_PFNMAP;
>>  +	vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
>>  +
>>  +	cma_obj =3D to_drm_gem_cma_obj(obj);
>>  +
>>  +	pfn =3D PHYS_PFN(dma_to_phys(cma_obj->base.dev->dev, =

>> cma_obj->paddr));
>>  +
>>  +	ret =3D remap_pfn_range(vma, vma->vm_start, pfn,
>>  +			      vma->vm_end - vma->vm_start,
>>  +			      vma->vm_page_prot);
> =

> dma_to_phys must not be used by drivers.
> =

> I have a proper helper for this waiting for users:
> =

> http://git.infradead.org/users/hch/misc.git/commitdiff/96a546e7229ec53aad=
bdb7936d1e5e6cb5958952
> =

> If you can confirm the helpers works for you I can try to still sneak
> it to Linus for 5.12 to ease the merge pain.

I can try. How do I get a page pointer from a dma_addr_t?

-Paul


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
