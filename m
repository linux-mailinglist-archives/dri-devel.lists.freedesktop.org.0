Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572E13F9D6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 20:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402726EEBD;
	Thu, 16 Jan 2020 19:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90D36EEB9;
 Thu, 16 Jan 2020 19:48:32 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4660520730;
 Thu, 16 Jan 2020 19:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579204112;
 bh=eCRmzjTIyjfbPAe/mgLEe93bWWVURDrSsFcpf6uROXM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NWyeid1GitOMqE3prMch6/hWlduNt9sJY2Qz8f5orJr7pXXcK5jrOwHt2yPJo5JAt
 qkSGn8BCTgaxWqLcPZqSdnGSmNEBlVaiDlOwiYiS2wBtUgjGvdBR+GLL7PxGIY8xKt
 QXCC908Z+SglQ58IDwsYgrc1X/SAahZRdscSSY20=
Date: Thu, 16 Jan 2020 20:48:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Julian Stecklina <julian.stecklina@cyberus-technology.de>
Subject: Re: [RFC PATCH 4/4] drm/i915/gvt: move public gvt headers out into
 global include
Message-ID: <20200116194830.GA1072059@kroah.com>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
 <20200109171357.115936-5-julian.stecklina@cyberus-technology.de>
 <20200115152215.GA3830321@kroah.com>
 <9b32e225ee680e61716e300eb1ed8387599cc0dd.camel@cyberus-technology.de>
 <20200116142345.GA476889@kroah.com>
 <edb721906354e26c26883edf5bce09690ca07d6d.camel@cyberus-technology.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edb721906354e26c26883edf5bce09690ca07d6d.camel@cyberus-technology.de>
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
Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 zhiyuan.lv@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 16, 2020 at 04:05:22PM +0100, Julian Stecklina wrote:
> Hi Greg,
> 
> On Thu, 2020-01-16 at 15:23 +0100, Greg KH wrote:
> > On Thu, Jan 16, 2020 at 03:13:01PM +0100, Julian Stecklina wrote:
> > > Hi Greg, Christoph,
> > > 
> > > On Wed, 2020-01-15 at 16:22 +0100, Greg KH wrote:
> > > > On Thu, Jan 09, 2020 at 07:13:57PM +0200, Julian Stecklina wrote:
> > > > > Now that the GVT interface to hypervisors does not depend on i915/GVT
> > > > > internals anymore, we can move the headers to the global include/.
> > > > > 
> > > > > This makes out-of-tree modules for hypervisor integration possible.
> > > > 
> > > > What kind of out-of-tree modules do you need/want for this?
> > > 
> > > The mediated virtualization support in the i915 driver needs a backend to
> > > the
> > > hypervisor. There is currently one backend for KVM in the tree
> > > (drivers/gpu/drm/i915/gvt/kvmgt.c) and at least 3 other hypervisor backends
> > > out
> > > of tree in various states of development that I know of. We are currently
> > > developing one of these.
> > 
> > Great, then just submit this patch series as part of your patch series
> > when submitting yoru hypervisor code.  That's the normal way to export
> > new symbols, we can't do so without an in-kernel user.
> 
> Fair enough.
> 
> As I already said, the KVMGT code is the in-kernel user. But I guess I can
> extend the already existing function pointer way of decoupling KVMGT from i915
> and be on my way without exporting any symbols.
> 
> Somewhat independent of the current discussion, I also think that it's valuable
> to have a defined API (I'm not saying stable API) for the hypervisor backends to
> define what's okay and not okay for them to do.

The only way to get a "good" api is for at least 3 users of them get
into the kernel tree.  If all you have is one or two, then you go with
what you got, and evolve over time as more get added and find better
ways to use them.

In short, it's just basic evolution, not intelligent design :)

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
