Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8928BAA1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 16:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5A96E48E;
	Mon, 12 Oct 2020 14:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08986E48E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 14:19:10 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l15so13873520wmh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 07:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=SuTUuPoSnGpk/kjzh2rwLKMK0NV61T2wKUHxGWe1zb8=;
 b=b2jM2N7c7mPZ8EQ74nK4as+DJOk3QIe1TTYSZ7oaXJ3365OVv4YcNg0qxxuCOPCxWm
 vCNnR/PtgLnbnCWWMkgiKiOIBral0E0p/MHJyNO76dWYwluCVeZIJCQEYXYML0RprK+3
 MPKg0NsB7G5eAb0oAe3c/PxZvmGkrVc0l8J4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=SuTUuPoSnGpk/kjzh2rwLKMK0NV61T2wKUHxGWe1zb8=;
 b=n2KfSNGah1BAboDgnWkN+OM7q8UqP7CLsMeNlXwCYwjug7Rm1yQ778Xq4Cfux+nASz
 Fh+F6/O8ejjRfwGE8+Y/H5CZaDfPsqdWtIwPFGzo2GJ9swYr6EXJ8NaQi1XkCxCs3Ph7
 vH3HTBHQMoT5Ljwkmdt4sIrsyIovTWV0MneKQLcwbmgjQvToYl/IZEXtOPVctYv0JoSY
 KKBJYTdCx5yj+tC2Gfi+d7oSBDB9dp8aIvhQtogM7xdNcovmScW19iNxay32O58q08xY
 kL6SDV4SnEHcpKI18TbTg6WGITfBZwB8nFjad1NnVKwEUolB0wNj1tbAWhjkeaBm94WL
 sZwg==
X-Gm-Message-State: AOAM531JmGO50oGxjQv6xzcXcIOsnkXWJcsgcw3NDB9Kd7HEuXpXM1DH
 wwpw4jm0/yOpAtMW3JfluN2G2g==
X-Google-Smtp-Source: ABdhPJzGnqdPcnQQAOL/8bt/9LG14tDuHDf/7FLmVEbsTsUaPr2zgpHozg5qRzqt8PtLD2kO4LhHrw==
X-Received: by 2002:a1c:5685:: with SMTP id
 k127mr11456739wmb.135.1602512349502; 
 Mon, 12 Oct 2020 07:19:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z127sm23493365wmc.2.2020.10.12.07.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 07:19:08 -0700 (PDT)
Date: Mon, 12 Oct 2020 16:19:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH v2 08/17] s390/pci: Remove races against pte updates
Message-ID: <20201012141906.GX438822@phenom.ffwll.local>
Mail-Followup-To: Niklas Schnelle <schnelle@linux.ibm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 linux-s390@vger.kernel.org,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Dan Williams <dan.j.williams@intel.com>,
 Kees Cook <keescook@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 John Hubbard <jhubbard@nvidia.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jan Kara <jack@suse.cz>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-9-daniel.vetter@ffwll.ch>
 <6deb08dd-46f3-bf26-5362-fdc696f6fd74@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6deb08dd-46f3-bf26-5362-fdc696f6fd74@linux.ibm.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 04:03:28PM +0200, Niklas Schnelle wrote:
> Hi Daniel,
> =

> freshly back from my vacation I've just taken a look at your patch.
> First thanks for this fix and the detailed commit description.
> Definitely makes sense to fix this and you can add my
> =

> Acked-by: Niklas Schnelle <schnelle@linux.ibm.com>
> =

> Content wise it all looks sane and clear and since Gerald did the testing,
> I would have applied it to our tree already, but I got some trivial
> checkpatch violations that probably apply to the whole series.
> I've commented them inline below.
> If you confirm there I can do the fixups when applying or you can resend.
> =

> On 10/9/20 9:59 AM, Daniel Vetter wrote:
> > Way back it was a reasonable assumptions that iomem mappings never
> > change the pfn range they point at. But this has changed:
> > =

> > - gpu drivers dynamically manage their memory nowadays, invalidating
> > ptes with unmap_mapping_range when buffers get moved
> > =

> > - contiguous dma allocations have moved from dedicated carvetouts to
> > cma regions. This means if we miss the unmap the pfn might contain
> > pagecache or anon memory (well anything allocated with GFP_MOVEABLE)
> > =

> > - even /dev/mem now invalidates mappings when the kernel requests that
> > iomem region when CONFIG_IO_STRICT_DEVMEM is set, see 3234ac664a87
> =

> The above commit mention should use the format
> 'commit 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims the=
 region")'
> otherwise this results in a checkpatch ERROR.
> =

> > ("/dev/mem: Revoke mappings when a driver claims the region")
> > =

> > Accessing pfns obtained from ptes without holding all the locks is
> > therefore no longer a good idea. Fix this.
> > =

> > Since zpci_memcpy_from|toio seems to not do anything nefarious with
> > locks we just need to open code get_pfn and follow_pfn and make sure
> > we drop the locks only after we've done. The write function also needs
> =

> just a typo but just saw it "we're" instead of "we've"
> =

> > the copy_from_user move, since we can't take userspace faults while
> > holding the mmap sem.
> > =

> > Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> > =

> No empty line after the Revied-by tag.
> =

> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> =

> Your Signed-off-by mail address does not match the one you're sending fro=
m,
> this yields a checkpatch warning when using git am with your mail.
> This is probably just a silly misconfiguration but since Signed-offs
> are signatures should I change this to =

> "Daniel Vetter <daniel.vetter@ffwll.ch>" which is the one you're
> sending from and also in the MAINTAINERS file?
> =

> =

> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> =

> The above Cc: line for Dan Williams is a duplicate
> =

> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: Niklas Schnelle <schnelle@linux.ibm.com>
> > Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
> > Cc: linux-s390@vger.kernel.org
> > --
> > v2: Move VM_IO | VM_PFNMAP checks around so they keep returning EINVAL
> > like before (Gerard)
> =

> I think the above should go before the CC/Signed-off/Reviewev block.

This is a per-subsystem bikeshed :-) drivers/gpu definitely wants it
above, but most core subsystems want it below. I'll move it.

> > ---
> >  arch/s390/pci/pci_mmio.c | 98 +++++++++++++++++++++++-----------------
> >  1 file changed, 57 insertions(+), 41 deletions(-)
> > =

> > diff --git a/arch/s390/pci/pci_mmio.c b/arch/s390/pci/pci_mmio.c
> > index 401cf670a243..1a6adbc68ee8 100644
> > --- a/arch/s390/pci/pci_mmio.c
> > +++ b/arch/s390/pci/pci_mmio.c
> > @@ -119,33 +119,15 @@ static inline int __memcpy_toio_inuser(void __iom=
em *dst,
> >  	return rc;
> >  }
> >  =

> > -static long get_pfn(unsigned long user_addr, unsigned long access,
> > -		    unsigned long *pfn)
> > -{
> > -	struct vm_area_struct *vma;
> > -	long ret;
> > -
> > -	mmap_read_lock(current->mm);
> > -	ret =3D -EINVAL;
> > -	vma =3D find_vma(current->mm, user_addr);
> > -	if (!vma)
> > -		goto out;
> > -	ret =3D -EACCES;
> > -	if (!(vma->vm_flags & access))
> > -		goto out;
> > -	ret =3D follow_pfn(vma, user_addr, pfn);
> > -out:
> > -	mmap_read_unlock(current->mm);
> > -	return ret;
> > -}
> > -
> >  SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
> >  		const void __user *, user_buffer, size_t, length)
> >  {
> >  	u8 local_buf[64];
> >  	void __iomem *io_addr;
> >  	void *buf;
> > -	unsigned long pfn;
> > +	struct vm_area_struct *vma;
> > +	pte_t *ptep;
> > +	spinlock_t *ptl;
> =

> With checkpatch.pl --strict the above yields a complained
> "CHECK: spinlock_t definition without comment" but I think
> that's really okay since your commit description is very clear.
> Same oin line 277.

I think this is a falls positive, checkpatch doesn't realize that
SYSCALL_DEFINE3 is a function, not a structure. And in a structure I'd
have added the kerneldoc or comment.

I'll fix up all the nits you've found for the next round. Thanks for
taking a look.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
