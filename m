Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54F48AC41
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 12:17:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3AE112B0F;
	Tue, 11 Jan 2022 11:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E17112B0F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:16:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D5A5FB818B8;
 Tue, 11 Jan 2022 11:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B931C36AE3;
 Tue, 11 Jan 2022 11:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641899816;
 bh=Ih4XNkfQCbJ3g/tQh7glo+kyu5MaCrOm3tNTG01znjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M21rEXm/nbRu43fGrxd8N3k5B+1BCzABIZNlPUzQNkpJmqKIPDLPcQ5sYDCdwI/Hc
 44a/9IOdoDUMh4xsGnE2YyILZiwez6eTnAzZirGbN0/ywBdMQz1AjNmO5qrs9DCyhE
 SYMObuf1FJ3dK4mweeCf4DwEkqjpUSz76WXaU5qI=
Date: Tue, 11 Jan 2022 12:16:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
Message-ID: <Yd1nJqmHXULnccNF@kroah.com>
References: <20220104235148.21320-1-hridya@google.com>
 <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
 <CA+wgaPMWT0s0KNo_wM7jU+bH626OAVtn77f7_WX=E1wyU8aBzg@mail.gmail.com>
 <3a29914d-0c7b-1f10-49cb-dbc1cc6e52b0@amd.com>
 <CA+wgaPOmRTAuXiSRRmj-s=3d2W6ny=EMFtroOShYKrp0u+xF+g@mail.gmail.com>
 <CA+wgaPO81R+NckRt0nzZazxs9fqSC_V_wyChU=kcMqJ01WxXNw@mail.gmail.com>
 <5a6bd742-10ca-2e88-afaa-3744731c2c0c@amd.com>
 <CA+wgaPPdCMPi1t+ObyO4+cqsk7Xx3E=K5BOPM37=QAviQDAfmw@mail.gmail.com>
 <CAKMK7uGRUrP+0PcY-yxTweb_K_QacHJchgPoa0K9K_kwGO+K3g@mail.gmail.com>
 <934ac18c-d53e-beeb-48c1-015a5936e713@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <934ac18c-d53e-beeb-48c1-015a5936e713@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, keescook@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org, kaleshsingh@google.com,
 Hridya Valsaraju <hridya@google.com>, surenb@google.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 11, 2022 at 11:58:07AM +0100, Christian König wrote:
> > > This is also not a problem due to the high number of DMA-BUF
> > > exports during launch time, as even a single export can be delayed for
> > > an unpredictable amount of time. We cannot eliminate DMA-BUF exports
> > > completely during app-launches and we are unfortunately seeing reports
> > > of the exporting process occasionally sleeping long enough to cause
> > > user-visible jankiness :(
> > > 
> > > We also looked at whether any optimizations are possible from the
> > > kernfs implementation side[1] but the semaphore is used quite extensively
> > > and it looks like the best way forward would be to remove sysfs
> > > creation/teardown from the DMA-BUF export/release path altogether. We
> > > have some ideas on how we can reduce the code-complexity in the
> > > current patch. If we manage to
> > > simplify it considerably, would the approach of offloading sysfs
> > > creation and teardown into a separate thread be acceptable Christian?
> 
> At bare minimum I suggest to use a work_struct instead of re-inventing that
> with kthread.
> 
> And then only put the exporting of buffers into the background and not the
> teardown.
> 
> > > Thank you for the guidance!
> > One worry I have here with doing this async that now userspace might
> > have a dma-buf, but the sysfs entry does not yet exist, or the dma-buf
> > is gone, but the sysfs entry still exists. That's a bit awkward wrt
> > semantics.
> > 
> > Also I'm pretty sure that if we can hit this, then other subsystems
> > using kernfs have similar problems, so trying to fix this in kernfs
> > with slightly more fine-grained locking sounds like a much more solid
> > approach. The linked patch talks about how the big delays happen due
> > to direct reclaim, and that might be limited to specific code paths
> > that we need to look at? As-is this feels a bit much like papering
> > over kernfs issues in hackish ways in sysfs users, instead of tackling
> > the problem at its root.
> 
> Which is exactly my feeling as well, yes.

More and more people are using sysfs/kernfs now for things that it was
never designed for (i.e. high-speed statistic gathering).  That's not
the fault of kernfs, it's the fault of people thinking it can be used
for stuff like that :)

But delays like this is odd, tearing down sysfs attributes should
normally _never_ be a fast-path that matters to system throughput.  So
offloading it to a workqueue makes sense as the attributes here are for
objects that are on the fast-path.

thanks,

greg k-h
