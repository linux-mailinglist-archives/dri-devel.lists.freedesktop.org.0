Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA058D3B4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 08:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17DCC7534;
	Tue,  9 Aug 2022 06:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D32C7503
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 06:23:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32FAFB811B6;
 Tue,  9 Aug 2022 06:23:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A67C4347C;
 Tue,  9 Aug 2022 06:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660026211;
 bh=r4gBsXWejMioOyU9kv7AqoaLFSBmsdp3u4zoSc5meJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BEztx697rcbEZiFXoACdMEbb6LbyomvNJOqu1DzKUk8Z2VMo6BYyenk6YGf4f2yLi
 sjubCbTVpCuZsqzIVGbVvvcNhSh6DC5u1bQg6a/D6/HSPpnCIjQsyl4PVisfcuD0r6
 vy+nmLXW/3zlz8yODEdV/0oKdPA+Ya0LRx+64b5w=
Date: Tue, 9 Aug 2022 08:23:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: New subsystem for acceleration devices
Message-ID: <YvH9X5puer4jpzMX@kroah.com>
References: <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
 <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
 <CAFCwf107tLxHKxkPqSRsOHVVp5s2tDEFOOy2oDZUz_KGmv-rDg@mail.gmail.com>
 <YvCozvgodIY19LSr@kroah.com> <YvFOEPdC9r8QBH11@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvFOEPdC9r8QBH11@nvidia.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiho Chu <jiho.chu@samsung.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 08, 2022 at 02:55:28PM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 08, 2022 at 08:10:22AM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Aug 07, 2022 at 02:25:33PM +0300, Oded Gabbay wrote:
> > > 2. Common code to handle drivers that want to allow a single user at a
> > > time to run open the device char file.
> > 
> > Note, that's an impossible request, and one that the kernel should never
> > worry about, so don't even try it.  Think about userspace doing an call
> > to dup() on an open char file descriptor and then passing that off
> > somewhere else.
> 
> Oded is talking about a model like VFIO has where the HW has a limited
> number of concurrent state registers - lets say in this case the ASID
> translation mapping the accelerator into DMA.

Based on the number of drivers that I see submitted weekly that try to
restrict their open call to just one user by using atomic variables or
other tricks, I think my interpretation of this stands :)

> Each 'struct file' that is created owns one of those HW state
> registers, and each struct file is completely isolated from all
> others. eg someone controlling the accelerator through struct file A
> cannot access memory mapped into the accelerator through struct file
> B.
> 
> So, the number of struct files that can be created is capped at the
> number of HW state registers the device can support (eg one for
> Habana).
> 
> This is different from the number of FDs pointing at the struct file.
> Userpsace can open a HW state and point a lot of FDs at it, that is
> userspace's problem. From a kernel view they all share one struct file
> and thus one HW state.

Yes, that's fine, if that is what is happening here, I have no
objection.

greg k-h
