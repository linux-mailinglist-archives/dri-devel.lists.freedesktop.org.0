Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 757FB1D303E
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2D16EB3A;
	Thu, 14 May 2020 12:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2CB6EB3B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:47:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m24so20609451wml.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=COVflVHOEuSW5Bmw34Dk2yWHL2qrU8HBExCrishOWcI=;
 b=LY1nmjgqUghCnDTku8VbnnbMKhbK8NeWRzDjIZm/kHYNDqrcdfhV8LI3VtXSWstTiI
 qkcWkcAoLI2sj8qJtb7UMG6mRbwEAeDTGPnTpJFv3Fo3uJquU9aRlR4BOWd+dGG1lFar
 lgx8YJEQBUiEbRgnuarsbhpnyUnbxBNUN0KTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=COVflVHOEuSW5Bmw34Dk2yWHL2qrU8HBExCrishOWcI=;
 b=U3dfa2WS80N8mDWVr7GOB6/v+Mw81cTXoTAicNyRFPqtYdM+HwHVfsNU6w2Ee2cKJX
 ALQlpSj+Z5SbqLiZpGERouGpfSUu8X7hLOpeBDCBluwN10NtylrwXE/DzKS/j1vro2Qu
 Q/gXBezhdk0MfwE1BjDfdzJOJzNj64b1UWvDgsTEwqQsBG9M0Ykd2Eq9KvaPMIduPpE3
 ogqgNIQY8vlqPal96jPnUnQS8ejSb/+u+5NY39v+PeXbJqkKTzDAMMN88eGcozN5DbvM
 ucRe223R0wNdnNOyUTUC7RiQoCFOvxf7BDzma9oeaNOBziGQuBqxNOK8VHxWNAR3jKc3
 0Hag==
X-Gm-Message-State: AGi0PuZgKyKx35M9x2/Pi8OAX5YwBrBQWLvkrBlzjgsesbnIwNx6JNWr
 TYRCVfcVMgW3KEPSYaHIUjvWlA==
X-Google-Smtp-Source: APiQypKtqc8/+WmJuEe7tSBagc+sGmEZ1i78zplXDtJAAdCLWkHz+iPdYcAI7BB0GC4KmpwwzuBc9A==
X-Received: by 2002:a1c:2089:: with SMTP id g131mr28522838wmg.47.1589460433232; 
 Thu, 14 May 2020 05:47:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t129sm14215437wmg.27.2020.05.14.05.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:47:12 -0700 (PDT)
Date: Thu, 14 May 2020 14:47:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 7/9] drm/shmem-helpers: Redirect mmap for imported dma-buf
Message-ID: <20200514124710.GX206103@phenom.ffwll.local>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
 <20200511093554.211493-8-daniel.vetter@ffwll.ch>
 <0032ff1a-c2a3-23ec-79e1-342bacaf9b33@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0032ff1a-c2a3-23ec-79e1-342bacaf9b33@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 09:23:37AM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 11.05.20 um 11:35 schrieb Daniel Vetter:
> > Currently this seems to work by converting the sgt into a pages array,
> > and then treating it like a native object. Do the right thing and
> > redirect mmap to the exporter.
> > =

> > With this nothing is calling get_pages anymore on imported dma-buf,
> > and we can start to remove the use of the ->pages array for that case.
> > =

> > v2: Rebase
> > =

> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_gem_shmem_helper.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> > index b9cba5cc61c3..117a7841e284 100644
> > --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> > +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> > @@ -551,6 +551,9 @@ int drm_gem_shmem_mmap(struct drm_gem_object *obj, =
struct vm_area_struct *vma)
> >  	/* Remove the fake offset */
> >  	vma->vm_pgoff -=3D drm_vma_node_start(&obj->vma_node);
> >  =

> > +	if (obj->import_attach)
> > +		return dma_buf_mmap(obj->dma_buf, vma, 0);
> > +
> =

> Just a question: how does it work with the fake value in vm_pgoffset?
> The offset is a DRM-specific thing and the dma-buf exporter expects the
> real offset?

For drm chardev file descriptor we have one file, but want to let
userspace map arbitrary objects. So an object gets a allocated an area
within the over drm mmap space, this fake offset.

For dma-buf mmap otoh there's a 1:1 mapping between fd and object, so no
additional offset needed.
-Daniel

> =

> With this question clarified:
> =

> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> =

> >  	shmem =3D to_drm_gem_shmem_obj(obj);
> >  =

> >  	ret =3D drm_gem_shmem_get_pages(shmem);
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
