Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 408CF28A180
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 23:36:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 300156E096;
	Sat, 10 Oct 2020 21:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EC56E096
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 21:36:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A2074528;
 Sat, 10 Oct 2020 23:36:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1602365798;
 bh=6zUOGUzZVWK7CDIxwW2pJVy+wDEo0zRH6INM1ZmoQMs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kkx480vh9ecASAaigRFPqZmKJ11zXCA19CxHz+QrNUnwqcoZ/zRiVtJxAqq+OkuZD
 jm1NTXHZpRxImkSasGmZ4jqBAzifNhamzDCv+RFkP7nTIZoZw6JkWciSd0Ur0T/SZO
 bbpqveBAqmN8hi4GLciMAIhJdpQrII1CTiL3kcZA=
Date: Sun, 11 Oct 2020 00:35:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
Message-ID: <20201010213554.GD3939@pendragon.ideasonboard.com>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch>
 <20201009123421.67a80d72@coco.lan> <20201009122111.GN5177@ziepe.ca>
 <20201009143723.45609bfb@coco.lan> <20201009124850.GP5177@ziepe.ca>
 <CAKMK7uF-hrSwzFQkp6qEP88hM1Qg8TMQOunuRHh=f2+D8MaMRg@mail.gmail.com>
 <CAAFQd5CTT0re4ssj9NNTxhejFX_v_rCjy6=mX7C+dc=Lw9GOHw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5CTT0re4ssj9NNTxhejFX_v_rCjy6=mX7C+dc=Lw9GOHw@mail.gmail.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomasz,

On Sat, Oct 10, 2020 at 07:22:48PM +0200, Tomasz Figa wrote:
> On Fri, Oct 9, 2020 at 7:52 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Fri, Oct 9, 2020 at 2:48 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > On Fri, Oct 09, 2020 at 02:37:23PM +0200, Mauro Carvalho Chehab wrote:
> > >
> > > > I'm not a mm/ expert, but, from what I understood from Daniel's patch
> > > > description is that this is unsafe *only if*  __GFP_MOVABLE is used.
> > >
> > > No, it is unconditionally unsafe. The CMA movable mappings are
> > > specific VMAs that will have bad issues here, but there are other
> > > types too.
> > >
> > > The only way to do something at a VMA level is to have a list of OK
> > > VMAs, eg because they were creatd via a special mmap helper from the
> > > media subsystem.
> > >
> > > > Well, no drivers inside the media subsystem uses such flag, although
> > > > they may rely on some infrastructure that could be using it behind
> > > > the bars.
> > >
> > > It doesn't matter, nothing prevents the user from calling media APIs
> > > on mmaps it gets from other subsystems.
> >
> > I think a good first step would be to disable userptr of non struct
> > page backed storage going forward for any new hw support. Even on
> > existing drivers. dma-buf sharing has been around for long enough now
> > that this shouldn't be a problem. Unfortunately right now this doesn't
> > seem to exist, so the entire problem keeps getting perpetuated.
> >
> > > > If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> > > > flag that it would be denying the core mm code to set __GFP_MOVABLE.
> > >
> > > We can't tell from the VMA these kinds of details..
> > >
> > > It has to go the other direction, evey mmap that might be used as a
> > > userptr here has to be found and the VMA specially created to allow
> > > its use. At least that is a kernel only change, but will need people
> > > with the HW to do this work.
> >
> > I think the only reasonable way to keep this working is:
> > - add a struct dma_buf *vma_tryget_dma_buf(struct vm_area_struct *vma);
> > - add dma-buf export support to fbdev and v4l
> 
> I assume you mean V4L2 and not the obsolete V4L that is emulated in
> the userspace by libv4l. If so, every video device that uses videobuf2
> gets DMA-buf export for free and there is nothing needed to enable it.
> 
> We probably still have a few legacy drivers using videobuf (non-2),
> but IMHO those should be safe to put behind some disabled-by-default
> Kconfig symbol or even completely drop, as the legacy framework has
> been deprecated for many years already.

There's 8 drivers left, and they support a very large number of devices.
I expect unhappy users distros stop shipping them. On the other hand,
videobuf has been deprecated for a loooooooong time, so there has been
plenty of time to convert the remaining drivers to videobuf2. If nobody
can do it, then we'll have to drop support for these devices given the
security issues.

We have moved media drivers to staging in the past when there wasn't
enough maintenance effort, we could do so here too.

> > - roll this out everywhere we still need it.
> >
> > Realistically this just isn't going to happen. And anything else just
> > reimplements half of dma-buf, which is kinda pointless (you need
> > minimally refcounting and some way to get at a promise of a permanent
> > sg list for dma. Plus probably the vmap for kernel cpu access.
> >
> > > > Please let address the issue on this way, instead of broken an
> > > > userspace API that it is there since 1991.
> > >
> > > It has happened before :( It took 4 years for RDMA to undo the uAPI
> > > breakage caused by a security fix for something that was a 15 years
> > > old bug.
> >
> > Yeah we have a bunch of these on the drm side too. Some of them are
> > really just "you have to upgrade userspace", and there's no real fix
> > for the security nightmare without that.
> 
> I think we need to phase out such userspace indeed. The Kconfig symbol
> allows enabling the unsafe functionality for anyone who still needs
> it, so I think it's not entirely a breakage.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
