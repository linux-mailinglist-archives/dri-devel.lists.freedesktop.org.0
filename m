Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FAA382796
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 10:55:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 122D06E904;
	Mon, 17 May 2021 08:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5990E6E902
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:55:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFA9960249;
 Mon, 17 May 2021 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621241737;
 bh=sayPBYIL2BgAEIQlb6vIdXR5Z7eP5vsC+Bvmfq6hWEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OzOSg6YGcP4EgQga6m2YpUt3k4HmJid9bja8rhhh4Z0aWI1PzR71CAOIwB6uZ1lpv
 IfNbmxWtsUPXIZIRDhS57/dhTzfSdsTOH+eawQ0CTxWK6e+hcMT/KjH4xWSsu4Tv2p
 R0kL9A4dbbp0cLz7I5gX12tekg4AeC7z8TgHcqTI=
Date: Mon, 17 May 2021 10:55:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <YKIvh9wbrOnd1yvj@kroah.com>
References: <20210513110040.2268-1-maciej.kwapulinski@linux.intel.com>
 <YJ42MEgwDZrAEQLl@kroah.com>
 <CAK8P3a0pcBHfrwu9fHHRWim5WgQuCqpROpMM83yCCpjjwu1FJQ@mail.gmail.com>
 <YKIeBdwFb9Ng275X@phenom.ffwll.local> <YKIigHrwqp8zd036@kroah.com>
 <CAKMK7uEg2khb7wDzHTGEPwfbYe+T_5Av=_BTnt91CBW5U4yWvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEg2khb7wDzHTGEPwfbYe+T_5Av=_BTnt91CBW5U4yWvg@mail.gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 10:49:09AM +0200, Daniel Vetter wrote:
> On Mon, May 17, 2021 at 10:00 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, May 17, 2021 at 09:40:53AM +0200, Daniel Vetter wrote:
> > > On Fri, May 14, 2021 at 11:00:38AM +0200, Arnd Bergmann wrote:
> > > > On Fri, May 14, 2021 at 10:34 AM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > > On Thu, May 13, 2021 at 01:00:26PM +0200, Maciej Kwapulinski wrote:
> > > > > > Dear kernel maintainers,
> > > > > >
> > > > > > This submission is a kernel driver to support Intel(R) Gaussian & Neural
> > > > > > Accelerator (Intel(R) GNA). Intel(R) GNA is a PCI-based neural co-processor
> > > > > > available on multiple Intel platforms. AI developers and users can offload
> > > > > > continuous inference workloads to an Intel(R) GNA device in order to free
> > > > > > processor resources and save power. Noise reduction and speech recognition
> > > > > > are the examples of the workloads Intel(R) GNA deals with while its usage
> > > > > > is not limited to the two.
> > > > >
> > > > > How does this compare with the "nnpi" driver being proposed here:
> > > > >         https://lore.kernel.org/r/20210513085725.45528-1-guy.zadicario@intel.com
> > > > >
> > > > > Please work with those developers to share code and userspace api and
> > > > > tools.  Having the community review two totally different apis and
> > > > > drivers for the same type of functionality from the same company is
> > > > > totally wasteful of our time and energy.
> > > >
> > > > Agreed, but I think we should go further than this and work towards a
> > > > subsystem across companies for machine learning and neural networks
> > > > accelerators for both inferencing and training.
> > >
> > > We have, it's called drivers/gpu. Feel free to rename to drivers/xpu or
> > > think G as in General, not Graphisc.
> > >
> > > > We have support for Intel habanalabs hardware in drivers/misc, and there are
> > > > countless hardware solutions out of tree that would hopefully go the same
> > > > way with an upstream submission and open source user space, including
> > > >
> > > > - Intel/Mobileye EyeQ
> > > > - Intel/Movidius Keembay
> > > > - Nvidia NVDLA
> > > > - Gyrfalcon Lightspeeur
> > > > - Apple Neural Engine
> > > > - Google TPU
> > > > - Arm Ethos
> > > >
> > > > plus many more that are somewhat less likely to gain fully open source
> > > > driver stacks.
> > >
> > > We also had this entire discussion 2 years ago with habanalabs. The
> > > hang-up is that drivers/gpu folks require fully open source userspace,
> > > including compiler and anything else you need to actually use the chip.
> > > Greg doesn't, he's happy if all he has is the runtime library with some
> > > tests.
> 
> I guess we're really going to beat this horse into pulp ... oh well.
> 
> > All you need is a library, what you write on top of that is always
> > application-specific, so how can I ask for "more"?
> 
> This is like accepting a new cpu port, where all you require is that
> the libc port is open source, but the cpu compiler is totally fine as
> a blob (doable with llvm now being supported). It makes no sense at
> all, at least to people who have worked with accelerators like this
> before.
> 
> We are not requiring that applications are open. We're only requiring
> that at least one of the compilers you need (no need to open the fully
> optimized one with all the magic sauce) to create any kind of
> applications is open, because without that you can't use the device,
> you can't analyze the stack, and you have no idea at all about what
> exactly it is you're merging. With these devices, the uapi visible in
> include/uapi is the smallest part of the interface exposed to
> userspace.

Ok, sorry, I was not aware that the habanalabs compiler was not
available to all under an open source license.  All I was trying to
enforce was that the library to use the kernel api was open so that
anyone could use it.  Trying to enforce compiler requirements like this
might feel to be a bit of a reach as the CPU on the hardware really
doesn't fall under the license of the operating system running on this
CPU over here :)

thanks,

greg k-h
