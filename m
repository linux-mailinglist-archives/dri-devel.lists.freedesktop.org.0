Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D35728B95A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 16:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071056E434;
	Mon, 12 Oct 2020 14:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC396E059;
 Mon, 12 Oct 2020 14:01:15 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 22691944-1500050 for multiple; Mon, 12 Oct 2020 15:01:11 +0100
MIME-Version: 1.0
In-Reply-To: <CAKMK7uForN39MQ-1EsD5-TNfHG4=jXSMPR70T6QY0BhMQGVrRw@mail.gmail.com>
References: <20201009102132.22770-1-chris@chris-wilson.co.uk>
 <CAKMK7uG51_t9988vTen2rK+gbwwjN0tLphpVhMd2nbsFTNi+GQ@mail.gmail.com>
 <160249974352.30484.764236348954464063@build.alporthouse.com>
 <CAKMK7uForN39MQ-1EsD5-TNfHG4=jXSMPR70T6QY0BhMQGVrRw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/vgem: Replace vgem_object_funcs with the
 common drm shmem helper
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 12 Oct 2020 15:01:09 +0100
Message-ID: <160251126986.3847.17805869986165580043@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-10-12 14:55:07)
> On Mon, Oct 12, 2020 at 12:49 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > Quoting Daniel Vetter (2020-10-09 17:16:06)
> > > On Fri, Oct 9, 2020 at 12:21 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > >
> > > > vgem is a minimalistic driver that provides shmemfs objects to
> > > > userspace that may then be used as an in-memory surface and transported
> > > > across dma-buf to other drivers. Since it's introduction,
> > > > drm_gem_shmem_helper now provides the same shmemfs facilities and so we
> > > > can trim vgem to wrap the helper.
> > > >
> > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > > ---
> > > >  drivers/gpu/drm/Kconfig         |   1 +
> > > >  drivers/gpu/drm/vgem/vgem_drv.c | 281 ++------------------------------
> > > >  drivers/gpu/drm/vgem/vgem_drv.h |  11 --
> > > >  3 files changed, 13 insertions(+), 280 deletions(-)
> > >
> > > Nice diffstat :-)
> > >
> > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Unfortunately I had to drop the drm_gem_prime_mmap() since the existing
> > expectation is that we hand the faulthandler off to shmemfs so we can
> > release the module while the memory is exported.
> 
> That sounds like a broken igt. Once we have refcounting for
> outstanding dma_fence/buf or anything else we'll block unloading of
> the module (not unbinding of the driver). Which one is that?

The dma-buf is closed; all that remains is the mmap. Then from the
perspective of the module, there is no reference back to the module
since we delegate handling of the mmap back to the owner, the shmemfs
builtin. That allows us to remove the module as its object code is no
longer required.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
