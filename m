Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7CC58D59D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 10:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D119710F232;
	Tue,  9 Aug 2022 08:46:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB3C11AEF0
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 08:45:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D6B0612FE;
 Tue,  9 Aug 2022 08:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671D3C433D6;
 Tue,  9 Aug 2022 08:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1660034743;
 bh=VKIJz/3kseX4NXW5x3L6MqsO9hB4DzRJ2UXkmwU0jLY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k6wrqg9/xFtT/6CURaKkO/Pfga0WpsRzfLdgqihdYhelEtipuK7OAUp+LDHU8GTJV
 Jn3GdKFC/V31aWSlo9gjwqWlFWJj6njcSRF8XU/8ELupdFlb2wnqyo2Ulg4wlU6h2V
 4IrqmLWeXHIQutSMd9Zz7NBI4034owXmtBBvzWmQ=
Date: Tue, 9 Aug 2022 10:45:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: New subsystem for acceleration devices
Message-ID: <YvIethFMeGyljdVV@kroah.com>
References: <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
 <YuvctaLwRi+z0Gw4@nvidia.com>
 <CAFCwf12wD3uEhr+kxwN9ROXApHzGh_n1je5susZV5NgGR9fCcQ@mail.gmail.com>
 <Yuxi1eRHPN36Or+1@nvidia.com>
 <CAFCwf13QF_JdzNcpw==zzBoEQUYChMXfechotH31qmAfYZUGmg@mail.gmail.com>
 <CAFCwf107tLxHKxkPqSRsOHVVp5s2tDEFOOy2oDZUz_KGmv-rDg@mail.gmail.com>
 <YvCozvgodIY19LSr@kroah.com> <YvFOEPdC9r8QBH11@nvidia.com>
 <YvH9X5puer4jpzMX@kroah.com> <YvIU/wMdqFA1fYc6@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvIU/wMdqFA1fYc6@infradead.org>
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
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 09, 2022 at 01:04:15AM -0700, Christoph Hellwig wrote:
> On Tue, Aug 09, 2022 at 08:23:27AM +0200, Greg Kroah-Hartman wrote:
> > Based on the number of drivers that I see submitted weekly that try to
> > restrict their open call to just one user by using atomic variables or
> > other tricks, I think my interpretation of this stands :)
> 
> I think they really want what Jason described most of the time.  They
> just don't know about the pitfalls of dup yet.
> 
> > > This is different from the number of FDs pointing at the struct file.
> > > Userpsace can open a HW state and point a lot of FDs at it, that is
> > > userspace's problem. From a kernel view they all share one struct file
> > > and thus one HW state.
> > 
> > Yes, that's fine, if that is what is happening here, I have no
> > objection.
> 
> It would be great if we could actually life that into a common
> layer (chardev or vfs) given just how common this, and drivers tend
> to get it wrong, do it suboptimal so often.

No objection from me, I'll gladly take patches to chardev or miscdev to
support this.

greg k-h
