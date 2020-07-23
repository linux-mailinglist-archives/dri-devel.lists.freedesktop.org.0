Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E91C22B52C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 19:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122426E2F2;
	Thu, 23 Jul 2020 17:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCD06E191;
 Thu, 23 Jul 2020 17:48:46 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21910932-1500050 for multiple; Thu, 23 Jul 2020 18:48:44 +0100
MIME-Version: 1.0
In-Reply-To: <1D440B9B88E22A4ABEF89F9F1F81BC290117BC5431@ORSMSX163.amr.corp.intel.com>
References: <20200723172119.17649-1-chris@chris-wilson.co.uk>
 <20200723172119.17649-2-chris@chris-wilson.co.uk>
 <1D440B9B88E22A4ABEF89F9F1F81BC290117BC5431@ORSMSX163.amr.corp.intel.com>
Subject: RE: [PATCH 2/3] drm/i915/gem: Move context decoupling from postclose
 to preclose
From: Chris Wilson <chris@chris-wilson.co.uk>
To: "Tang, CQ" <cq.tang@intel.com>, intel-gfx@lists.freedesktop.org
Date: Thu, 23 Jul 2020 18:48:42 +0100
Message-ID: <159552652244.21069.17962945806364093006@build.alporthouse.com>
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Tang, CQ (2020-07-23 18:44:08)
> 
> 
> > -----Original Message-----
> > From: Chris Wilson <chris@chris-wilson.co.uk>
> > Sent: Thursday, July 23, 2020 10:21 AM
> > To: intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org; Chris Wilson <chris@chris-wilson.co.uk>;
> > Tang, CQ <cq.tang@intel.com>; Vetter, Daniel <daniel.vetter@intel.com>;
> > stable@vger.kernel.org
> > Subject: [PATCH 2/3] drm/i915/gem: Move context decoupling from
> > postclose to preclose
> > 
> > Since the GEM contexts refer to other GEM state, we need to nerf those
> > pointers before that state is freed during drm_gem_release(). We need to
> > move i915_gem_context_close() from the postclose callback to the preclose.
> > 
> > In particular, debugfs likes to peek into the GEM contexts, and from there
> > peek at the drm core objects. If the context is closed during the peeking, we
> > may attempt to dereference a stale core object.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: CQ Tang <cq.tang@intel.com>
> > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/gpu/drm/i915/i915_drv.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_drv.c
> > b/drivers/gpu/drm/i915/i915_drv.c index 5fd5af4bc855..15242a8c70f7 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.c
> > +++ b/drivers/gpu/drm/i915/i915_drv.c
> > @@ -1114,11 +1114,15 @@ static void i915_driver_lastclose(struct
> > drm_device *dev)
> >       vga_switcheroo_process_delayed_switch();
> >  }
> > 
> > +static void i915_driver_preclose(struct drm_device *dev, struct
> > +drm_file *file) {
> > +     i915_gem_context_close(file);
> > +}
> > +
> >  static void i915_driver_postclose(struct drm_device *dev, struct drm_file
> > *file)  {
> >       struct drm_i915_file_private *file_priv = file->driver_priv;
> > 
> > -     i915_gem_context_close(file);
> >       i915_gem_release(dev, file);
> 
> Now we separate i915_gem_context_close() from i915_gem_release() and other freeing code in postclose(), is there any side effect to allow code to run in between?
> Can we move all postclose() code into preclose()?

i915_gem_release() is scheduled for deletion, so I didn't care. What
remains in postclose are the kfree + tidyup, which seem like a good idea
to keep last.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
