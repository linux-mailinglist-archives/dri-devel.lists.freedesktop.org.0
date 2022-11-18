Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D862F2A4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 11:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4055F10E229;
	Fri, 18 Nov 2022 10:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33FC910E229
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 10:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=4c9uE
 3fyeTteQiMB6ZX5jXFCh66NO9kuuzGOxgH3+Ek=; b=lBf8q+dcpErtPBTHaN4Dl
 nUJnINe+UvgijJJOx2cIDc1OhQJcp71+WQfRGJzZ4jjNmrD/cfk2KOYyme/4Ee2y
 C84OFmi5Rjx4o7deG4aFIhTH8taAYHAF7c09zWDLo9LfFB9MstikmdSYVvTF4wAP
 7kbIRJ79mAnGPZU8SU/FDw=
Received: from localhost (unknown [114.221.197.177])
 by smtp10 (Coremail) with SMTP id DsCowABXey1AX3djaWaKNQ--.62677S2;
 Fri, 18 Nov 2022 18:32:33 +0800 (CST)
Date: Fri, 18 Nov 2022 18:32:32 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] drm/gem-shmem: When drm_gem_object_init failed,
 should release object
Message-ID: <20221118183232.00007638@163.com>
In-Reply-To: <2b4e38d8-d0ea-e85c-88f1-bb6a714ee0eb@suse.de>
References: <20221111033817.366-1-tangchunyou@163.com>
 <2b4e38d8-d0ea-e85c-88f1-bb6a714ee0eb@suse.de>
Organization: icube
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.16.6; i586-pc-mingw32msvc)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowABXey1AX3djaWaKNQ--.62677S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4rAFykKFWUWFWfXr1DWrg_yoW5tFW7pa
 9xArW7KrW8tFWqgr97XF4kAa43Gw40gF48Wa43J3yakw10yF1DJF15Cr1DAFW7Ar17Xr1a
 qwnF9F93AFWjyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9o7_UUUUU=
X-Originating-IP: [114.221.197.177]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiVgG9UVqzvEdRtgAAsO
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
Cc: linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,
   Can I discard the first two patchs, and pull the new code, then
   modify and git send-email this patch?


ÓÚ Thu, 17 Nov 2022 14:42:36 +0100
Thomas Zimmermann <tzimmermann@suse.de> Ð´µÀ:

> Hi
> 
> Am 11.11.22 um 04:38 schrieb ChunyouTang:
> > when goto err_free, the object had init, so it should be release
> > when fail.
> > 
> > Signed-off-by: ChunyouTang <tangchunyou@163.com>
> > ---
> >   drivers/gpu/drm/drm_gem.c              | 19 ++++++++++++++++---
> >   drivers/gpu/drm/drm_gem_shmem_helper.c |  4 +++-
> >   include/drm/drm_gem.h                  |  1 +
> >   3 files changed, 20 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 8b68a3c1e6ab..cba32c46bb05 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -169,6 +169,21 @@ void drm_gem_private_object_init(struct
> > drm_device *dev, }
> >   EXPORT_SYMBOL(drm_gem_private_object_init);
> >   
> > +/**
> > + * drm_gem_private_object_fini - Finalize a failed drm_gem_object
> > + * @obj: drm_gem_object
> > + *
> > + * Uninitialize an already allocated GEM object when it
> > initialized failed
> > + */
> > +void drm_gem_private_object_fini(struct drm_gem_object *obj)
> > +{
> > +	WARN_ON(obj->dma_buf);
> 
> Rather lease this in its original place.
> 
> > +
> > +	dma_resv_fini(&obj->_resv);
> > +	drm_gem_lru_remove(obj);
> 
> AFAICT drm_gem_lru_remove() doesn't belong into this function.
> 
> > +}
> > +EXPORT_SYMBOL(drm_gem_private_object_fini);
> > +
> >   /**
> >    * drm_gem_object_handle_free - release resources bound to
> > userspace handles
> >    * @obj: GEM object to clean up.
> > @@ -930,14 +945,12 @@ drm_gem_release(struct drm_device *dev,
> > struct drm_file *file_private) void
> >   drm_gem_object_release(struct drm_gem_object *obj)
> >   {
> > -	WARN_ON(obj->dma_buf);
> > +	drm_gem_private_object_fini(obj);
> >   
> >   	if (obj->filp)
> >   		fput(obj->filp);
> >   
> > -	dma_resv_fini(&obj->_resv);
> 
> Please call drm_gem_private_object_fini() here.
> 
> >   	drm_gem_free_mmap_offset(obj);
> > -	drm_gem_lru_remove(obj);
> 
> Please keep this line here.
> 
> Best regards
> Thomas
> 
> >   }
> >   EXPORT_SYMBOL(drm_gem_object_release);
> >   
> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > b/drivers/gpu/drm/drm_gem_shmem_helper.c index
> > 35138f8a375c..845e3d5d71eb 100644 ---
> > a/drivers/gpu/drm/drm_gem_shmem_helper.c +++
> > b/drivers/gpu/drm/drm_gem_shmem_helper.c @@ -79,8 +79,10 @@
> > __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool
> > private) } else { ret = drm_gem_object_init(dev, obj, size);
> >   	}
> > -	if (ret)
> > +	if (ret) {
> > +		drm_gem_private_object_fini(obj)
> >   		goto err_free;
> > +	}
> >   
> >   	ret = drm_gem_create_mmap_offset(obj);
> >   	if (ret)
> > diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> > index bd42f25e449c..9b1feb03069d 100644
> > --- a/include/drm/drm_gem.h
> > +++ b/include/drm/drm_gem.h
> > @@ -405,6 +405,7 @@ int drm_gem_object_init(struct drm_device *dev,
> >   			struct drm_gem_object *obj, size_t size);
> >   void drm_gem_private_object_init(struct drm_device *dev,
> >   				 struct drm_gem_object *obj,
> > size_t size); +void drm_gem_private_object_fini(struct
> > drm_gem_object *obj); void drm_gem_vm_open(struct vm_area_struct
> > *vma); void drm_gem_vm_close(struct vm_area_struct *vma);
> >   int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long
> > obj_size,
> 

