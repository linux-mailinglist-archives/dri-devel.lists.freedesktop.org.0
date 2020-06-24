Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD2E206D6C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 09:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7076EA80;
	Wed, 24 Jun 2020 07:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6666EA7D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 07:19:46 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q15so1303372wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 00:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=jocsJHNbwLMjmOaoHehdPc45R0YO9H8oPxEP5MW0m6U=;
 b=kgD+ydUydzSzBIqrXzEvT4vnT5iDLW+5wPwITJuaP1TNTwFGiWAurFzGLwQ4MiIPND
 lZQq4Cfq8VEEIP5JYaa3akusyk/OqLxkbNXI78pi+5Wb8H8qCsWhTZYviWcAPCJpl9PN
 F5RJixku582FYxbkNuZ1+4RY7g4QKf7uQMqzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jocsJHNbwLMjmOaoHehdPc45R0YO9H8oPxEP5MW0m6U=;
 b=DjcPKTFlhbdoJ8yFIwQ1qagNwOx9uTxBp/LhB4r7ONnkGiHBul/S3yNm80UPHoEX+z
 6EgrgGIyJnlKNUY3efJkoRvYFcao+ndv+PRyY8g5TnaG76gcr7nw+eukrFxI/l9SlFw+
 MxH/C5wAvExHTFHvotg8leESmXJ8iaQA9qQhQvcrgWgsjPxooqpAE4hCUS48usfuwi8E
 d3iX0+QYBI8A9op+WdPAAg0JKa+Vt66g9pvWpZz3JLxect9fZcvjNEidwy/XSMayN2fN
 iwxhMz6tJdWyotKALWpfHoTzPUMPzsCXxTvzNOfsZDVHwe2nBwNt1wdmCZhKR5kUltfz
 RGQw==
X-Gm-Message-State: AOAM531f97MOOR83yfBThUjqJpJ+/7shme3jN134EBDQtygfVkf0OixV
 Sey2oUfM8V48cDdiVGKG9rClgQ==
X-Google-Smtp-Source: ABdhPJyET73fwB/PsjT8Iv70C+wg1wXaHS+xW6bEbzj8yPd6zbNmfQYXxr8B+wVjqX0wwaDYjbaXYg==
X-Received: by 2002:a1c:9ac2:: with SMTP id c185mr17551524wme.24.1592983184840; 
 Wed, 24 Jun 2020 00:19:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g195sm6982855wme.38.2020.06.24.00.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 00:19:44 -0700 (PDT)
Date: Wed, 24 Jun 2020 09:19:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Subject: Re: [PATCH v2 2/8] drm/ttm: Remap all page faults to per process
 dummy page.
Message-ID: <20200624071942.GS20149@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-3-git-send-email-andrey.grodzovsky@amd.com>
 <20200622094103.GA20149@phenom.ffwll.local>
 <63be2315-b123-0d8f-729f-9ae47fb2138b@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63be2315-b123-0d8f-729f-9ae47fb2138b@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 23, 2020 at 11:31:45PM -0400, Andrey Grodzovsky wrote:
> =

> On 6/22/20 5:41 AM, Daniel Vetter wrote:
> > On Sun, Jun 21, 2020 at 02:03:02AM -0400, Andrey Grodzovsky wrote:
> > > On device removal reroute all CPU mappings to dummy page per drm_file
> > > instance or imported GEM object.
> > > =

> > > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_bo_vm.c | 65 ++++++++++++++++++++++++++++++=
++++++-----
> > >   1 file changed, 57 insertions(+), 8 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/tt=
m_bo_vm.c
> > > index 389128b..2f8bf5e 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> > > @@ -35,6 +35,8 @@
> > >   #include <drm/ttm/ttm_bo_driver.h>
> > >   #include <drm/ttm/ttm_placement.h>
> > >   #include <drm/drm_vma_manager.h>
> > > +#include <drm/drm_drv.h>
> > > +#include <drm/drm_file.h>
> > >   #include <linux/mm.h>
> > >   #include <linux/pfn_t.h>
> > >   #include <linux/rbtree.h>
> > > @@ -328,19 +330,66 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
> > Hm I think diff and code flow look a bit bad now. What about renaming t=
he
> > current function to __ttm_bo_vm_fault and then having something like the
> > below:
> > =

> > ttm_bo_vm_fault(args) {
> > =

> > 	if (drm_dev_enter()) {
> > 		__ttm_bo_vm_fault(args);
> > 		drm_dev_exit();
> > 	} else  {
> > 		drm_gem_insert_dummy_pfn();
> > 	}
> > }
> > =

> > I think drm_gem_insert_dummy_pfn(); should be portable across drivers, =
so
> > another nice point to try to unifiy drivers as much as possible.
> > -Daniel
> > =

> > >   	pgprot_t prot;
> > >   	struct ttm_buffer_object *bo =3D vma->vm_private_data;
> > >   	vm_fault_t ret;
> > > +	int idx;
> > > +	struct drm_device *ddev =3D bo->base.dev;
> > > -	ret =3D ttm_bo_vm_reserve(bo, vmf);
> > > -	if (ret)
> > > -		return ret;
> > > +	if (drm_dev_enter(ddev, &idx)) {
> > > +		ret =3D ttm_bo_vm_reserve(bo, vmf);
> > > +		if (ret)
> > > +			goto exit;
> > > +
> > > +		prot =3D vma->vm_page_prot;
> > > -	prot =3D vma->vm_page_prot;
> > > -	ret =3D ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT);
> > > -	if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NO=
WAIT))
> > > +		ret =3D ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT=
);
> > > +		if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_N=
OWAIT))
> > > +			goto exit;
> > > +
> > > +		dma_resv_unlock(bo->base.resv);
> > > +
> > > +exit:
> > > +		drm_dev_exit(idx);
> > >   		return ret;
> > > +	} else {
> > > -	dma_resv_unlock(bo->base.resv);
> > > +		struct drm_file *file =3D NULL;
> > > +		struct page *dummy_page =3D NULL;
> > > +		int handle;
> > > -	return ret;
> > > +		/* We are faulting on imported BO from dma_buf */
> > > +		if (bo->base.dma_buf && bo->base.import_attach) {
> > > +			dummy_page =3D bo->base.dummy_page;
> > > +		/* We are faulting on non imported BO, find drm_file owning the BO=
*/
> > Uh, we can't fish that out of the vma->vm_file pointer somehow? Or is t=
hat
> > one all wrong? Doing this kind of list walk looks pretty horrible.
> > =

> > If the vma doesn't have the right pointer I guess next option is that we
> > store the drm_file page in gem_bo->dummy_page, and replace it on first
> > export. But that's going to be tricky to track ...
> > =

> > > +		} else {
> > > +			struct drm_gem_object *gobj;
> > > +
> > > +			mutex_lock(&ddev->filelist_mutex);
> > > +			list_for_each_entry(file, &ddev->filelist, lhead) {
> > > +				spin_lock(&file->table_lock);
> > > +				idr_for_each_entry(&file->object_idr, gobj, handle) {
> > > +					if (gobj =3D=3D &bo->base) {
> > > +						dummy_page =3D file->dummy_page;
> > > +						break;
> > > +					}
> > > +				}
> > > +				spin_unlock(&file->table_lock);
> > > +			}
> > > +			mutex_unlock(&ddev->filelist_mutex);
> > > +		}
> > > +
> > > +		if (dummy_page) {
> > > +			/*
> > > +			 * Let do_fault complete the PTE install e.t.c using vmf->page
> > > +			 *
> > > +			 * TODO - should i call free_page somewhere ?
> > Nah, instead don't call get_page. The page will be around as long as
> > there's a reference for the drm_file or gem_bo, which is longer than any
> > mmap. Otherwise yes this would like really badly.
> =

> =

> So actually that was my thinking in the first place and I indeed avoided
> taking reference and this ended up
> with multiple BUG_ONs as seen bellow where=A0 refcount:-63 mapcount:-48 f=
or a
> page are deep into negative
> values... Those warnings were gone once i added get_page(dummy) which in =
my
> opinion implies that there
> is a page reference per each PTE and that when there is unmapping of the
> process address
> space and PTEs are deleted there is also put_page somewhere in mm core and
> the get_page per mapping
> keeps it balanced.
> =

> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762929] BUG: Bad page=
 map in
> process glxgear:disk$0=A0 pte:8000000132284867 pmd:15aaec067
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762931]
> page:ffffe63384c8a100 refcount:-63 mapcount:-48 mapping:0000000000000000
> index:0x0
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762932] flags:
> 0x17fff8000000008(dirty)
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762933] raw:
> 017fff8000000008 dead000000000100 dead000000000122 0000000000000000
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762934] raw:
> 0000000000000000 0000000000000000 ffffffc1ffffffcf 0000000000000000
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762935] page dumped b=
ecause: bad pte
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762937]
> addr:00007fe086263000 vm_flags:1c0440fb anon_vma:0000000000000000
> mapping:ffff9b5cd42db268 index:1008b3
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762981] file:renderD1=
29
> fault:ttm_bo_vm_fault [ttm] mmap:amdgpu_mmap [amdgpu] readpage:0x0
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762984] CPU: 5 PID: 2=
619
> Comm: glxgear:disk$0 Tainted: G=A0=A0=A0 B=A0=A0=A0=A0=A0 OE 5.6.0-dev+ #=
51
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762985] Hardware name:
> System manufacturer System Product Name/RAMPAGE IV FORMULA, BIOS 4804
> 12/30/2013
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762985] Call Trace:
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762988] dump_stack+0x=
68/0x9b
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762990] print_bad_pte=
+0x19f/0x270
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762992]=A0 ? lock_pag=
e_memcg+0x5/0xf0
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.762995] unmap_page_ra=
nge+0x777/0xbe0
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763000] unmap_vmas+0x=
cc/0x160
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763004] exit_mmap+0xb=
5/0x1b0
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763009] mmput+0x65/0x=
140
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763010] do_exit+0x362=
/0xc40
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763013] do_group_exit=
+0x47/0xb0
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763016] get_signal+0x=
18b/0xc30
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763019] do_signal+0x3=
6/0x6a0
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763021]=A0 ?
> __set_task_comm+0x62/0x120
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763024]=A0 ?
> __x64_sys_futex+0x88/0x180
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763028]
> exit_to_usermode_loop+0x6f/0xc0
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763030] do_syscall_64=
+0x149/0x1c0
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763032]
> entry_SYSCALL_64_after_hwframe+0x49/0xbe
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763034] RIP: 0033:0x7=
fe091bd9360
> Jun 20 01:36:43 ubuntu-1604-test kernel: [=A0=A0 98.763037] Code: Bad RIP=
 value.

Uh, I guess that just shows how little I understand how this all works.
But yeah if we set vmf->page then I guess core mm takes care of
everything, but apparently expects a page reference.
-Daniel
 =

> Andrey
> =

> =

> > =

> > > +			 */
> > > +			get_page(dummy_page);
> > > +			vmf->page =3D dummy_page;
> > > +			return 0;
> > > +		} else {
> > > +			return VM_FAULT_SIGSEGV;
> > Hm that would be a kernel bug, wouldn't it? WARN_ON() required here imo.
> > -Daniel
> > =

> > > +		}
> > > +	}
> > >   }
> > >   EXPORT_SYMBOL(ttm_bo_vm_fault);
> > > -- =

> > > 2.7.4
> > > =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
