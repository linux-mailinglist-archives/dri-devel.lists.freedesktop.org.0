Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B5B1DA9BB
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 07:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2761C6E3DF;
	Wed, 20 May 2020 05:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC626E48D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 05:15:39 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87D5420709;
 Wed, 20 May 2020 05:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589951739;
 bh=KPQMGRpN/8pksdTK+mITk4uG/KU+mOKwSHzD2e/jfd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r22Tpllut6JmcXCyRGqQGTHKkf+22MD5eYE7TFPAMk7X78m31KDGDFuD+uNPcCiTl
 g4uT+VmG793nPL1sLrtCYYfoXMcQ2Ky12cmbiU+7S/dNdTfSNFVXsCgl+BlbHCQGlZ
 BV+7JbQGliTmhHd9MijjWRkFp9hBHgEtqUq1BjfQ=
Date: Wed, 20 May 2020 07:15:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
Message-ID: <20200520051536.GA2141566@kroah.com>
References: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
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
Cc: Olof Johansson <olof.johansson@gmail.com>, wufan@codeaurora.org,
 Arnd Bergmann <arnd@arndb.de>, Jeffrey Hugo <jhugo@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, pratanan@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 19, 2020 at 10:41:15PM +0200, Daniel Vetter wrote:
> On Tue, May 19, 2020 at 07:41:20PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, May 19, 2020 at 08:57:38AM -0600, Jeffrey Hugo wrote:
> > > On 5/18/2020 11:08 PM, Dave Airlie wrote:
> > > > On Fri, 15 May 2020 at 00:12, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> > > > >
> > > > > Introduction:
> > > > > Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
> > > > > SoC ASIC for the purpose of efficently running Deep Learning inference
> > > > > workloads in a data center environment.
> > > > >
> > > > > The offical press release can be found at -
> > > > > https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
> > > > >
> > > > > The offical product website is -
> > > > > https://www.qualcomm.com/products/datacenter-artificial-intelligence
> > > > >
> > > > > At the time of the offical press release, numerious technology news sites
> > > > > also covered the product.  Doing a search of your favorite site is likely
> > > > > to find their coverage of it.
> > > > >
> > > > > It is our goal to have the kernel driver for the product fully upstream.
> > > > > The purpose of this RFC is to start that process.  We are still doing
> > > > > development (see below), and thus not quite looking to gain acceptance quite
> > > > > yet, but now that we have a working driver we beleive we are at the stage
> > > > > where meaningful conversation with the community can occur.
> > > >
> > > >
> > > > Hi Jeffery,
> > > >
> > > > Just wondering what the userspace/testing plans for this driver.
> > > >
> > > > This introduces a new user facing API for a device without pointers to
> > > > users or tests for that API.
> > >
> > > We have daily internal testing, although I don't expect you to take my word
> > > for that.
> > >
> > > I would like to get one of these devices into the hands of Linaro, so that
> > > it can be put into KernelCI.  Similar to other Qualcomm products. I'm trying
> > > to convince the powers that be to make this happen.
> > >
> > > Regarding what the community could do on its own, everything but the Linux
> > > driver is considered proprietary - that includes the on device firmware and
> > > the entire userspace stack.  This is a decision above my pay grade.
> >
> > Ok, that's a decision you are going to have to push upward on, as we
> > really can't take this without a working, open, userspace.
> 
> Uh wut.
> 
> So the merge criteria for drivers/accel (atm still drivers/misc but I
> thought that was interim until more drivers showed up) isn't actually
> "totally-not-a-gpu accel driver without open source userspace".
> 
> Instead it's "totally-not-a-gpu accel driver without open source
> userspace" _and_ you have to be best buddies with Greg. Or at least
> not be on the naughty company list. Since for habanalabs all you
> wanted is a few test cases to exercise the ioctls. Not the entire
> userspace.

Also, to be fair, I have changed my mind after seeing the mess of
complexity that these "ioctls for everyone!" type of pass-through
these kinds of drivers are creating.  You were right, we need open
userspace code in order to be able to properly evaluate and figure out
what they are doing is right or not and be able to maintain things over
time correctly.

So I was wrong, and you were right, my apologies for my previous
stubbornness.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
