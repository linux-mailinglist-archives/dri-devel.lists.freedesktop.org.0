Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0D73825F6
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5476E8F4;
	Mon, 17 May 2021 08:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6936E8F7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:00:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0FC66105A;
 Mon, 17 May 2021 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621238402;
 bh=P4h/zP4hu3xUeYH1FCb7Jn+H1STMmMvvHTnVqyKxP9Y=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=fghbKWNQxTrJdalIvKxa78I7kaT56lZbLJl6dwQA0tfnzaRfdHeJ1x8M8SbTmXM4i
 H3tmpXCkgbo+IQy54+SxpO3SHvmZzKzWO1LtPc/axqPejNlFGKEcW7Wr5BMz77gmdq
 WpbEV8bTTVPHxhxDWgQi08LSqu/jCcTDUJj0s3Yw=
Date: Mon, 17 May 2021 10:00:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@gmail.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <YKIigHrwqp8zd036@kroah.com>
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKIeBdwFb9Ng275X@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 09:40:53AM +0200, Daniel Vetter wrote:
> On Fri, May 14, 2021 at 11:00:38AM +0200, Arnd Bergmann wrote:
> > On Fri, May 14, 2021 at 10:34 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:
> > > > Dear kernel maintainers,
> > > >
> > > > This submission is a kernel driver to support Intel(R) Gaussian & Neural
> > > > Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
> > > > available on multiple Intel platforms. AI developers and users can offload
> > > > continuous inference workloads to an Intel(R) GNA device in order to free
> > > > processor resources and save power. Noise reduction and speech recognition
> > > > are the examples of the workloads Intel(R) GNA deals with while its usage
> > > > is not limited to the two.
> > >
> > > How does this compare with the "nnpi" driver being proposed here:
> > >         https://lore.kernel.org/r/20210513085725.45528-1-guy.zadicario@intel.com
> > >
> > > Please work with those developers to share code and userspace api and
> > > tools.  Having the community review two totally different apis and
> > > drivers for the same type of functionality from the same company is
> > > totally wasteful of our time and energy.
> > 
> > Agreed, but I think we should go further than this and work towards a
> > subsystem across companies for machine learning and neural networks
> > accelerators for both inferencing and training.
> 
> We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
> think G as in General, not Graphisc.
> 
> > We have support for Intel habanalabs hardware in drivers/misc, and there are
> > countless hardware solutions out of tree that would hopefully go the same
> > way with an upstream submission and open source user space, including
> > 
> > - Intel/Mobileye EyeQ
> > - Intel/Movidius Keembay
> > - Nvidia NVDLA
> > - Gyrfalcon Lightspeeur
> > - Apple Neural Engine
> > - Google TPU
> > - Arm Ethos
> > 
> > plus many more that are somewhat less likely to gain fully open source
> > driver stacks.
> 
> We also had this entire discussion 2 years ago with habanalabs. The
> hang-up is that drivers/gpu folks require fully open source userspace,
> including compiler and anything else you need to actually use the chip.
> Greg doesn't, he's happy if all he has is the runtime library with some
> tests.

All you need is a library, what you write on top of that is always
application-specific, so how can I ask for "more"?

> These two drivers here look a lot more like classic gpus than habanalabs
> did, at least from a quick look they operate with explicit buffer
> allocations/registration model. So even more reasons to just reuse all the
> stuff we have already. But also I don't expect these drivers here to come
> with open compilers, they never do, not initially at least before you
> started talking with the vendor. Hence I expect there'll be more
> drivers/totally-not-drm acceleration subsystem nonsense.

As these are both from Intel, why aren't they using the same open
compiler?  Why aren't they using the same userspace api as well?  What's
preventing them from talking to each other about this and not forcing
the community (i.e. outsiders) from being the one to force this to
happen?

> Anyway this horse has been throughroughly beaten to death and more, the
> agreement is that accel drivers in drivers/misc must not use any gpu
> stuff, so that drivers/gpu people dont end up in a prickly situation they
> never signed up for. E.g. I removed some code sharing from habanalabs.
> This means interop between gpu and nn/ai drivers will be no-go until this
> is resolved, but *shrug*.

I'm all for making this unified, but these are not really devices doing
graphics so putting it all into DRM always feels wrong to me.  The fact
that people abuse GPU devices for not graphic usages would indicate to
me that that code should be moving _out_ of the drm subsystem :)

thanks,

greg k-h
