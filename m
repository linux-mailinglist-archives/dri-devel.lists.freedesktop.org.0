Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B701289F83
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 11:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5706E0E3;
	Sat, 10 Oct 2020 09:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E094B6E0E3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 09:21:30 +0000 (UTC)
Received: from coco.lan (ip5f5ad5ce.dynamic.kabel-deutschland.de
 [95.90.213.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7E03207C4;
 Sat, 10 Oct 2020 09:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602321690;
 bh=d3mTSqxjmIVv8pvjDnUxuO/wR4Ywg3sH+xwYDg3gKUY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GvHeRr3ZUEwZJUKG634fF9Md5DIz1b6g+GzjmK/SnMBCaTfKY/Nv+1CfBU6hrZYex
 JiYJ3TI4ntgmxVwSgIfd0LVLdi9AM0cRnqK4eOJqIWNfAQ2EIpbNiM2Z3niSGk9MmJ
 mFn0WP4KLtQX9HyBi/TdwG6kikR3GKtxtj5/JmG8=
Date: Sat, 10 Oct 2020 11:21:22 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
Message-ID: <20201010112122.587f9945@coco.lan>
In-Reply-To: <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan> <20201009122111.GN5177@ziepe.ca>
 <20201009143723.45609bfb@coco.lan> <20201009124850.GP5177@ziepe.ca>
 <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, KVM list <kvm@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Fri, 9 Oct 2020 19:52:05 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> escreveu:

> On Fri, Oct 9, 2020 at 2:48 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:
> >  
> > > I'm not a mm/ expert, but, from what I understood from Daniel's patch
> > > description is that this is unsafe *only if*  __GFP_MOVABLE is used.  
> >
> > No, it is unconditionally unsafe. The CMA movable mappings are
> > specific VMAs that will have bad issues here, but there are other
> > types too.

I didn't check the mm dirty details, but I strongly suspect that the mm
code has a way to prevent moving a mmapped page while it is still in usage.

If not, then the entire movable pages concept sounds broken to me, and
has to be fixed at mm subsystem.

> >
> > The only way to do something at a VMA level is to have a list of OK
> > VMAs, eg because they were creatd via a special mmap helper from the
> > media subsystem.

I'm not sure if I'm following you on that. The media API can work with
different ways of sending buffers to userspace:

	- read();

	- using the overlay mode. This interface is deprecated in
	  practice, being replaced by DMABUF. Only a few older hardware
	  supports it, and it depends on an special X11 helper driver
	  for it to work.

	- via DMABUF:
		https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dmabuf.html

	- via mmap, using a mmap helper:
		https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/mmap.html

	- via mmap, using userspace-provided pointers:
		https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/userp.html

The existing open-source programs usually chose one or more of the above
modes. if the Kernel driver returns -EINVAL when an mmapped streaming I/O
mode is not supported, userspace has to select a different method.

Most userspace open source programs have fallback support: if one
mmap I/O method fails, it selects another one, although this is not
a mandatory requirement. I found (and fixed) a few ones that were
relying exclusively on userptr support, but I didn't make a 
comprehensive check.

Also there are a number of relevant closed-source apps that we have no 
idea about what methods they use, like Skype, and other similar
videoconferencing programs. Breaking support for those, specially at
a time where people are relying on it in order to participate on
conferences and doing internal meetings is a **very bad** idea.

So, whatever solution is taken, it should not be dumping warning
messages at the system and tainting the Kernel, but, instead, checking
if the userspace request is valid or not. If it is invalid, return the
proper error code via the right V4L2 ioctl, in order to let userspace
choose a different method. I the request is valid, refcount the pages 
for them to not be moved while they're still in usage.

-

Let me provide some background about how things work at the media
subsytem. If you want to know more, the userspace-provided memory 
mapped pointers work is described here:

	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/userp.html#userp

Basically, userspace calls either one of those ioctls:

	VIDIOC_CREATE_BUFS:
		https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-create-bufs.html

Which is translated into a videobuf2 call to: vb2_ioctl_create_bufs()

	VIDIOC_REQBUFS
		https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-reqbufs.html#vidioc-reqbufs

Which is translated into a videobuf2 call to: vb2_ioctl_reqbufs()

Both internally calls vb2_verify_memory_type(), which is responsible
for checking if the provided pointers are OK for the usage and/or do
all necessary page allocations, and taking care of any special 
requirements. This could easily have some additional checks to
verify if the requested VMA address has pages that are movable or
not, ensuring that ensure that the VMA is OK, and locking them in
order to prevent the mm code to move such pages while they are in
usage by the media subsystem.

Now, as I said before, I don't know the dirty details about how
to lock those pages at the mm subsystem in order to avoid it
to move the used pages. Yet, when vb2_create_framevec()
is called, the check if VMA is OK should already be happened
at vb2_verify_memory_type().

-

It should be noticed that the dirty hack added by patch 09/17
and 10/17 affects *all* types of memory allocations at V4L2, 
as this kAPI is called by the 3 different memory models
supported at the media subsystem:

	drivers/media/common/videobuf2/videobuf2-vmalloc.c
	drivers/media/common/videobuf2/videobuf2-dma-contig.c
	drivers/media/common/videobuf2/videobuf2-dma-sg.c

In other words, with this code:

	int unsafe_follow_pfn(struct vm_area_struct *vma, unsigned long address,
		unsigned long *pfn)
	{
	#ifdef CONFIG_STRICT_FOLLOW_PFN
		pr_info("unsafe follow_pfn usage rejected, see CONFIG_STRICT_FOLLOW_PFN\n");
		return -EINVAL;
	#else
		WARN_ONCE(1, "unsafe follow_pfn usage\n");
		add_taint(TAINT_USER, LOCKDEP_STILL_OK);

		return follow_pfn(vma, address, pfn);
	#endif

you're unconditionally breaking the media userspace API support not
only for embedded systems that could be using userptr instead of
DMA_BUF, but also for *all* video devices, including USB cameras.

This is **NOT** an acceptable solution. 

So, I stand my NACK to this approach.

> > > Well, no drivers inside the media subsystem uses such flag, although
> > > they may rely on some infrastructure that could be using it behind
> > > the bars.  
> >
> > It doesn't matter, nothing prevents the user from calling media APIs
> > on mmaps it gets from other subsystems.  
> 
> I think a good first step would be to disable userptr of non struct
> page backed storage going forward for any new hw support. Even on
> existing drivers. dma-buf sharing has been around for long enough now
> that this shouldn't be a problem. Unfortunately right now this doesn't
> seem to exist, so the entire problem keeps getting perpetuated.

Well, the media uAPI does support DMABUF (both import and export):

	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/dmabuf.html
	https://linuxtv.org/downloads/v4l-dvb-apis-new/userspace-api/v4l/vidioc-expbuf.html#vidioc-expbuf

And I fully agree that newer programs should use DMABUF when sharing
buffers with DRM subsystem, but that's not my main concern.

What I do want is to not break userspace support nor to taint the Kernel
due to a valid uAPI call.

A valid uAPI call should check if the parameters passed though it are
valid. If they are, it should handle. Otherwise, it should return
-EINVAL, without tainting the Kernel or printing warning messages.

The approach took by patches 09/17 and 10/17 doesn't do that.
Instead, they just unconditionally breaks the media uAPI.

What should be done, instead, is to drop patch 10/17, and work on
a way for the code inside vb2_create_framevec() to ensure that, if
USERPTR is used, the memory pages will be properly locked while the
driver is using, returning -EINVAL only if there's no way to proceed,
without tainting the Kernel.

> 
> > > If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> > > flag that it would be denying the core mm code to set __GFP_MOVABLE.  
> >
> > We can't tell from the VMA these kinds of details..
> >
> > It has to go the other direction, evey mmap that might be used as a
> > userptr here has to be found and the VMA specially created to allow
> > its use. At least that is a kernel only change, but will need people
> > with the HW to do this work.  
> 
> I think the only reasonable way to keep this working is:
> - add a struct dma_buf *vma_tryget_dma_buf(struct vm_area_struct *vma);

Not sure how an userspace buffer could be mapped to be using it,
specially since the buffer may not even be imported/exported
from the DRM subsystem, but it could simply be allocated
via glibc calloc()/malloc().

> - add dma-buf export support to fbdev and v4l

V4L has support for it already.

> - roll this out everywhere we still need it.

That's where things are hard. This is not like DRM, where the APIs
are called via some open source libraries that are also managed
by DRM upstream developers.

In the case of the media subsystem, while we added a libv4l sometime
ago, not all userspace apps use it, as a large part of them used
to exist before the addition of the libraries. Also, we're currently 
trying to deprecate libv4l, at least for embedded systems, in favor
of libcamera.

On media, there are lots of closed source apps that uses the media API
directly. Even talking about open source ones, there are lots of
different apps, including not only media-specific apps, but also
generic ones, like web browsers, which don't use the libraries we
wrote.

An userspace API breakage would take *huge* efforts and will take
lots of time to have it merged everywhere. It will cause lots of
troubles everywhere.

> Realistically this just isn't going to happen. 

Why not? Any app developer could already use DMA-BUF if required,
as the upstream support was added several years ago.

> And anything else just
> reimplements half of dma-buf, 

It is just the opposite: those uAPIs came years before dma-buf.
In other words, it was dma-buf that re-implemented it ;-)

Now, I agree with you that dma-buf is a way cooler than the past
alternatives.

-

It sounds to me that you're considering on only one use case of 
USERPTR: to pass a buffer created from DRM. As far as I'm aware,
only embedded userspace applications actually do that.

Yet, there are a number of other applications that do something like
the userptr_capture() function on this code:

	https://git.linuxtv.org/v4l-utils.git/tree/contrib/test/v4l2grab.c

E. g. using glibc alloc functions like calloc() to allocate memory, 
passing the user-allocated data to the Kernel via something like this:

	struct v4l2_requestbuffers req;
	struct v4l2_buffer buf;
	int n_buffers = 2;

	req.count  = 2;
	req.type   = V4L2_BUF_TYPE_VIDEO_CAPTURE;
	req.memory = V4L2_MEMORY_USERPTR;
	if (ioctl(fd, VIDIOC_REQBUFS, &req))
		return errno;

	for (i = 0; i < req.count; ++i) {
		buf.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
		buf.memory = V4L2_MEMORY_USERPTR;
		buf.index = i;
		buf.m.userptr = (unsigned long)buffers[i].start;
		buf.length = buffers[i].length;
		if (ioctl(fd, VIDIOC_QBUF, &buf))
			return errno;
	}
	if (ioctl(fd, VIDIOC_STREAMON, &req.type))
		return errno;

	/* some capture loop */

	ioctl(fd, VIDIOC_STREAMOFF, &req.type);

I can't possibly see *any* security issues with the above code.

As I said before, VIDIOC_REQBUFS should be checking if the userspace
buffers are OK and ensure that their refcounts will be incremented,
in order to avoid mm to move the pages used there, freeing the 
refconts when VIDIOC_STREAMOFF - or close(fd) - is called.

> which is kinda pointless (you need
> minimally refcounting and some way to get at a promise of a permanent
> sg list for dma. Plus probably the vmap for kernel cpu access.

Yeah, refcounting needs to happen. 

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
