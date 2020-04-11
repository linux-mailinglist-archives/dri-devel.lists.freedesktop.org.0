Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13521A4F8E
	for <lists+dri-devel@lfdr.de>; Sat, 11 Apr 2020 13:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6532E6E2E9;
	Sat, 11 Apr 2020 11:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109CF6E2E9;
 Sat, 11 Apr 2020 11:40:00 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7294B214D8;
 Sat, 11 Apr 2020 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586605199;
 bh=SvpS8ofQxG/gfKVKsdp7xkFw2sUtzxdRCV1XrE9Gqfw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JG9Kg4Bh3+8Rb9Ffl8S4nSejTh7pjxl6ypKqEQ/xOm8pj/3cQNmkKO+nl9p6L0GLV
 a482gx74YHVD/7z045tVuYbDoTVcE1fhljsaaQ6Wy73J8N45zv1tMb2W0HeDWKFJnw
 1IxcDdgsSjthxah8uFTvXmHdvD7UYBtBeIjgm81g=
Date: Sat, 11 Apr 2020 13:39:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sultan Alsawaf <sultan@kerneltoast.com>
Subject: Re: [PATCH v2] drm/i915: Fix ref->mutex deadlock in i915_active_wait()
Message-ID: <20200411113957.GB2606747@kroah.com>
References: <20200407065210.GA263852@kroah.com>
 <20200407071809.3148-1-sultan@kerneltoast.com>
 <20200410090838.GD1691838@kroah.com>
 <20200410141738.GB2025@sultan-box.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200410141738.GB2025@sultan-box.localdomain>
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 10, 2020 at 07:17:38AM -0700, Sultan Alsawaf wrote:
> On Fri, Apr 10, 2020 at 11:08:38AM +0200, Greg KH wrote:
> > On Tue, Apr 07, 2020 at 12:18:09AM -0700, Sultan Alsawaf wrote:
> > > From: Sultan Alsawaf <sultan@kerneltoast.com>
> > > 
> > > The following deadlock exists in i915_active_wait() due to a double lock
> > > on ref->mutex (call chain listed in order from top to bottom):
> > >  i915_active_wait();
> > >  mutex_lock_interruptible(&ref->mutex); <-- ref->mutex first acquired
> > >  i915_active_request_retire();
> > >  node_retire();
> > >  active_retire();
> > >  mutex_lock_nested(&ref->mutex, SINGLE_DEPTH_NESTING); <-- DEADLOCK
> > > 
> > > Fix the deadlock by skipping the second ref->mutex lock when
> > > active_retire() is called through i915_active_request_retire().
> > > 
> > > Note that this bug only affects 5.4 and has since been fixed in 5.5.
> > > Normally, a backport of the fix from 5.5 would be in order, but the
> > > patch set that fixes this deadlock involves massive changes that are
> > > neither feasible nor desirable for backporting [1][2][3]. Therefore,
> > > this small patch was made to address the deadlock specifically for 5.4.
> > > 
> > > [1] 274cbf20fd10 ("drm/i915: Push the i915_active.retire into a worker")
> > > [2] 093b92287363 ("drm/i915: Split i915_active.mutex into an irq-safe spinlock for the rbtree")
> > > [3] 750bde2fd4ff ("drm/i915: Serialise with remote retirement")
> > > 
> > > Fixes: 12c255b5dad1 ("drm/i915: Provide an i915_active.acquire callback")
> > > Cc: <stable@vger.kernel.org> # 5.4.x
> > > Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
> > > ---
> > >  drivers/gpu/drm/i915/i915_active.c | 27 +++++++++++++++++++++++----
> > >  drivers/gpu/drm/i915/i915_active.h |  4 ++--
> > >  2 files changed, 25 insertions(+), 6 deletions(-)
> > 
> > Now queued up, thanks.
> > 
> > greg k-h
> 
> I'm sorry, I meant the v3 [1]. Apologies for the confusion. The v3 was picked
> into Ubuntu so that's what we're rolling with.

Ok, thanks, hopefully now I picked upthe right one...

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
