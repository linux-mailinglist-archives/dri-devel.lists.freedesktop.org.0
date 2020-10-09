Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE232288F46
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 18:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858226ED5E;
	Fri,  9 Oct 2020 16:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3A06ED58
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 16:57:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e2so10519275wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 09:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=0pLn82IbgQV35wH4ma+k0406StKvwf+W3mj4bGhZifE=;
 b=PkNBVdrvO/SF2HUY/SBKzGH/JIbyGv1X7JVHwyRp2NMGmrRwPiJ8YO5KTnNxVs/DTR
 h+yXL8eb2mq4/cn2Dwt59h04BZYPDMJfUrNOEQpyRhv358eWBm8iMQ4wuE8aH+K/XoWv
 VQPgSPuQrV1mjqwCbrtPywjhk1nkKWI7znRiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=0pLn82IbgQV35wH4ma+k0406StKvwf+W3mj4bGhZifE=;
 b=JKfn9Yqqu7fSHjsxgtKhIiwiN8taPRn10BDdQLjIXDWOHFJUXpUl96Tz9jCa5GON2k
 WXb6oEqAhegzPw4CYj4GCsva7nJd4qBAoBTLmZOLc1EVdLls3e/0i21KP73dkAxRRsfv
 vmBbru9ntIBbtDcVakj119dtnRHL5hdFeWSHGxn3xwAO6KS7WFLWsfSZ/VVpB8vY3+i8
 hdYTxYSPKAMNCf92+r9lZysH1IfW1gje5SlzOQj2/GxVOvphJdliJS6JOR87xDtAWUF3
 vmCHp3ImDsWWjMm3TknO0tqih+RNUHsamScqe94djrwYaIbUuF6QAdEEb5/ZKY9x61/g
 Vrqw==
X-Gm-Message-State: AOAM531750Jh3xuZtMPf1ZjGFyx4R5Oi2FnKBYdAbrx7gvA4Z9EUFqvh
 /34ndZURiFAOusv3lhCeTEEAZA==
X-Google-Smtp-Source: ABdhPJzWm2EDClZGBoeRp2koRpZWB9TbXgl54u2KDWSi+G0UmCpXfa0O1HJTk/LTlflMGH/BrzAI9Q==
X-Received: by 2002:a1c:9ad0:: with SMTP id c199mr15291080wme.54.1602262664449; 
 Fri, 09 Oct 2020 09:57:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm12381658wmk.7.2020.10.09.09.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 09:57:43 -0700 (PDT)
Date: Fri, 9 Oct 2020 18:57:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 06/17] media: videobuf2: Move frame_vector into media
 subsystem
Message-ID: <20201009165740.GP438822@phenom.ffwll.local>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 linux-s390@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Pawel Osciak <pawel@osciak.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jan Kara <jack@suse.cz>, Dan Williams <dan.j.williams@intel.com>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-7-daniel.vetter@ffwll.ch>
 <20201009121417.115db7d9@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009121417.115db7d9@coco.lan>
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
Cc: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Pawel Osciak <pawel@osciak.com>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Tomasz Figa <tfiga@chromium.org>, linux-mm@kvack.org,
 Kyungmin Park <kyungmin.park@samsung.com>, John Hubbard <jhubbard@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 09, 2020 at 12:14:17PM +0200, Mauro Carvalho Chehab wrote:
> Em Fri,  9 Oct 2020 09:59:23 +0200
> Daniel Vetter <daniel.vetter@ffwll.ch> escreveu:
> =

> > It's the only user. This also garbage collects the CONFIG_FRAME_VECTOR
> > symbol from all over the tree (well just one place, somehow omap media
> > driver still had this in its Kconfig, despite not using it).
> > =

> > Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Pawel Osciak <pawel@osciak.com>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Kyungmin Park <kyungmin.park@samsung.com>
> > Cc: Tomasz Figa <tfiga@chromium.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=E9r=F4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  drivers/media/common/videobuf2/Kconfig        |  1 -
> >  drivers/media/common/videobuf2/Makefile       |  1 +
> >  .../media/common/videobuf2}/frame_vector.c    |  2 +
> >  drivers/media/platform/omap/Kconfig           |  1 -
> >  include/linux/mm.h                            | 42 -------------------
> >  include/media/videobuf2-core.h                | 42 +++++++++++++++++++
> >  mm/Kconfig                                    |  3 --
> >  mm/Makefile                                   |  1 -
> >  8 files changed, 45 insertions(+), 48 deletions(-)
> >  rename {mm =3D> drivers/media/common/videobuf2}/frame_vector.c (99%)
> > =

> > diff --git a/drivers/media/common/videobuf2/Kconfig b/drivers/media/com=
mon/videobuf2/Kconfig
> > index edbc99ebba87..d2223a12c95f 100644
> > --- a/drivers/media/common/videobuf2/Kconfig
> > +++ b/drivers/media/common/videobuf2/Kconfig
> > @@ -9,7 +9,6 @@ config VIDEOBUF2_V4L2
> >  =

> >  config VIDEOBUF2_MEMOPS
> >  	tristate
> > -	select FRAME_VECTOR
> >  =

> >  config VIDEOBUF2_DMA_CONTIG
> >  	tristate
> > diff --git a/drivers/media/common/videobuf2/Makefile b/drivers/media/co=
mmon/videobuf2/Makefile
> > index 77bebe8b202f..54306f8d096c 100644
> > --- a/drivers/media/common/videobuf2/Makefile
> > +++ b/drivers/media/common/videobuf2/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  videobuf2-common-objs :=3D videobuf2-core.o
> > +videobuf2-common-objs +=3D frame_vector.o
> >  =

> >  ifeq ($(CONFIG_TRACEPOINTS),y)
> >    videobuf2-common-objs +=3D vb2-trace.o
> > diff --git a/mm/frame_vector.c b/drivers/media/common/videobuf2/frame_v=
ector.c
> > similarity index 99%
> > rename from mm/frame_vector.c
> > rename to drivers/media/common/videobuf2/frame_vector.c
> > index d44779e56313..2b0b97761d15 100644
> > --- a/mm/frame_vector.c
> > +++ b/drivers/media/common/videobuf2/frame_vector.c
> > @@ -8,6 +8,8 @@
> >  #include <linux/pagemap.h>
> >  #include <linux/sched.h>
> >  =

> > +#include <media/videobuf2-core.h>
> > +
> =

> See my comment below...
> =

> >  /**
> >   * get_vaddr_frames() - map virtual addresses to pfns
> >   * @start:	starting user address
> > diff --git a/drivers/media/platform/omap/Kconfig b/drivers/media/platfo=
rm/omap/Kconfig
> > index f73b5893220d..de16de46c0f4 100644
> > --- a/drivers/media/platform/omap/Kconfig
> > +++ b/drivers/media/platform/omap/Kconfig
> > @@ -12,6 +12,5 @@ config VIDEO_OMAP2_VOUT
> >  	depends on VIDEO_V4L2
> >  	select VIDEOBUF2_DMA_CONTIG
> >  	select OMAP2_VRFB if ARCH_OMAP2 || ARCH_OMAP3
> > -	select FRAME_VECTOR
> >  	help
> >  	  V4L2 Display driver support for OMAP2/3 based boards.
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 16b799a0522c..acd60fbf1a5a 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -1743,48 +1743,6 @@ int account_locked_vm(struct mm_struct *mm, unsi=
gned long pages, bool inc);
> >  int __account_locked_vm(struct mm_struct *mm, unsigned long pages, boo=
l inc,
> >  			struct task_struct *task, bool bypass_rlim);
> >  =

> > -/* Container for pinned pfns / pages */
> > -struct frame_vector {
> > -	unsigned int nr_allocated;	/* Number of frames we have space for */
> > -	unsigned int nr_frames;	/* Number of frames stored in ptrs array */
> > -	bool got_ref;		/* Did we pin pages by getting page ref? */
> > -	bool is_pfns;		/* Does array contain pages or pfns? */
> > -	void *ptrs[];		/* Array of pinned pfns / pages. Use
> > -				 * pfns_vector_pages() or pfns_vector_pfns()
> > -				 * for access */
> > -};
> > -
> > -struct frame_vector *frame_vector_create(unsigned int nr_frames);
> > -void frame_vector_destroy(struct frame_vector *vec);
> > -int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
> > -		     unsigned int gup_flags, struct frame_vector *vec);
> > -void put_vaddr_frames(struct frame_vector *vec);
> > -int frame_vector_to_pages(struct frame_vector *vec);
> > -void frame_vector_to_pfns(struct frame_vector *vec);
> > -
> > -static inline unsigned int frame_vector_count(struct frame_vector *vec)
> > -{
> > -	return vec->nr_frames;
> > -}
> > -
> > -static inline struct page **frame_vector_pages(struct frame_vector *ve=
c)
> > -{
> > -	if (vec->is_pfns) {
> > -		int err =3D frame_vector_to_pages(vec);
> > -
> > -		if (err)
> > -			return ERR_PTR(err);
> > -	}
> > -	return (struct page **)(vec->ptrs);
> > -}
> > -
> > -static inline unsigned long *frame_vector_pfns(struct frame_vector *ve=
c)
> > -{
> > -	if (!vec->is_pfns)
> > -		frame_vector_to_pfns(vec);
> > -	return (unsigned long *)(vec->ptrs);
> > -}
> > -
> >  struct kvec;
> >  int get_kernel_pages(const struct kvec *iov, int nr_pages, int write,
> >  			struct page **pages);
> > diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-c=
ore.h
> > index bbb3f26fbde9..a2e75ca0334f 100644
> > --- a/include/media/videobuf2-core.h
> > +++ b/include/media/videobuf2-core.h
> > @@ -1254,4 +1254,46 @@ bool vb2_request_object_is_buffer(struct media_r=
equest_object *obj);
> >   */
> >  unsigned int vb2_request_buffer_cnt(struct media_request *req);
> >  =

> > +/* Container for pinned pfns / pages in frame_vector.c */
> > +struct frame_vector {
> > +	unsigned int nr_allocated;	/* Number of frames we have space for */
> > +	unsigned int nr_frames;	/* Number of frames stored in ptrs array */
> > +	bool got_ref;		/* Did we pin pages by getting page ref? */
> > +	bool is_pfns;		/* Does array contain pages or pfns? */
> > +	void *ptrs[];		/* Array of pinned pfns / pages. Use
> > +				 * pfns_vector_pages() or pfns_vector_pfns()
> > +				 * for access */
> > +};
> > +
> > +struct frame_vector *frame_vector_create(unsigned int nr_frames);
> > +void frame_vector_destroy(struct frame_vector *vec);
> > +int get_vaddr_frames(unsigned long start, unsigned int nr_pfns,
> > +		     unsigned int gup_flags, struct frame_vector *vec);
> > +void put_vaddr_frames(struct frame_vector *vec);
> > +int frame_vector_to_pages(struct frame_vector *vec);
> > +void frame_vector_to_pfns(struct frame_vector *vec);
> > +
> > +static inline unsigned int frame_vector_count(struct frame_vector *vec)
> > +{
> > +	return vec->nr_frames;
> > +}
> > +
> > +static inline struct page **frame_vector_pages(struct frame_vector *ve=
c)
> > +{
> > +	if (vec->is_pfns) {
> > +		int err =3D frame_vector_to_pages(vec);
> > +
> > +		if (err)
> > +			return ERR_PTR(err);
> > +	}
> > +	return (struct page **)(vec->ptrs);
> > +}
> > +
> > +static inline unsigned long *frame_vector_pfns(struct frame_vector *ve=
c)
> > +{
> > +	if (!vec->is_pfns)
> > +		frame_vector_to_pfns(vec);
> > +	return (unsigned long *)(vec->ptrs);
> > +}
> > +
> >  #endif /* _MEDIA_VIDEOBUF2_CORE_H */
> =

> Please place those into a include/media/frame_vector.h file, instead of
> merging it directly at vb2 core header.
> =

> Then include the new header at videobuf2-core.h and at frame_vector.c.

Makes sense, I'll do that for v3.

> With such changes:
> =

> Acked-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks for taking a look.
-Daniel

> =

> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 6c974888f86f..da6c943fe9f1 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -815,9 +815,6 @@ config DEVICE_PRIVATE
> >  	  memory; i.e., memory that is only accessible from the device (or
> >  	  group of devices). You likely also want to select HMM_MIRROR.
> >  =

> > -config FRAME_VECTOR
> > -	bool
> > -
> >  config ARCH_USES_HIGH_VMA_FLAGS
> >  	bool
> >  config ARCH_HAS_PKEYS
> > diff --git a/mm/Makefile b/mm/Makefile
> > index d5649f1c12c0..a025fd6c6afd 100644
> > --- a/mm/Makefile
> > +++ b/mm/Makefile
> > @@ -111,7 +111,6 @@ obj-$(CONFIG_PAGE_EXTENSION) +=3D page_ext.o
> >  obj-$(CONFIG_CMA_DEBUGFS) +=3D cma_debug.o
> >  obj-$(CONFIG_USERFAULTFD) +=3D userfaultfd.o
> >  obj-$(CONFIG_IDLE_PAGE_TRACKING) +=3D page_idle.o
> > -obj-$(CONFIG_FRAME_VECTOR) +=3D frame_vector.o
> >  obj-$(CONFIG_DEBUG_PAGE_REF) +=3D debug_page_ref.o
> >  obj-$(CONFIG_HARDENED_USERCOPY) +=3D usercopy.o
> >  obj-$(CONFIG_PERCPU_STATS) +=3D percpu-stats.o
> =

> =

> =

> Thanks,
> Mauro

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
