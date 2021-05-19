Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF19D388975
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 10:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B483B6ECE7;
	Wed, 19 May 2021 08:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465B06ECE0;
 Wed, 19 May 2021 08:31:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D4EB60240;
 Wed, 19 May 2021 08:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621413081;
 bh=yw/1bpuAjUVekN1AeJ4Eg9GKHPYM862Mdg+01rpYcrU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QkmjymG5ux3+REdQiuHWYql5pxdbYiGdbyFau5taVYbbXdPg6apJbXRDOpoMDJPXE
 Jh81O7HSqVltNMSTtHfGKBAcQFvmfj5LbQtdaQIb4OBqPiLSfhrcjoZsBBwihd/krU
 bBUuocm5YMOTzHAvTN5jBDZuAHgmejsOefR0InPk=
Date: Wed, 19 May 2021 10:31:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gvt: remove local storage of debugfs file
Message-ID: <YKTM1tQ7SMPnYgiV@kroah.com>
References: <20210518161705.3697143-1-gregkh@linuxfoundation.org>
 <YKPrRW+zBC8Wmjgz@kroah.com>
 <20210519080313.GH4589@zhen-hp.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519080313.GH4589@zhen-hp.sh.intel.com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 19, 2021 at 04:03:13PM +0800, Zhenyu Wang wrote:
> On 2021.05.18 18:28:53 +0200, Greg Kroah-Hartman wrote:
> > On Tue, May 18, 2021 at 06:17:05PM +0200, Greg Kroah-Hartman wrote:
> > > There is no need to keep the dentry around for the debugfs kvmgt cache
> > > file, as we can just look it up when we want to remove it later on.
> > > Simplify the structure by removing the dentry and relying on debugfs
> > > to find the dentry to remove when we want to.
> > > 
> > > By doing this change, we remove the last in-kernel user that was storing
> > > the result of debugfs_create_long(), so that api can be cleaned up.
> > > 
> > > Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
> > > Cc: Zhi Wang <zhi.a.wang@intel.com>
> > > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: intel-gvt-dev@lists.freedesktop.org
> > > Cc: intel-gfx@lists.freedesktop.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > >  drivers/gpu/drm/i915/gvt/kvmgt.c | 11 +++++------
> > >  1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > Note, I can take this through my debugfs tree if wanted, that way I can
> > clean up the debugfs_create_long() api at the same time.  Otherwise it's
> > fine, I can wait until next -rc1 for that to happen.
> > 
> 
> It's fine with me to go through debugfs tree. Just double check that recent
> kvmgt change would not cause conflict with this as well.

How can I check that?  I'll be glad to take this through my tree, we can
handle the merge issues later for 5.14-rc1 :)

thanks,

greg k-h
