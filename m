Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858842D58A3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 11:55:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BA26EA75;
	Thu, 10 Dec 2020 10:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCC96EA75
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 10:55:15 +0000 (UTC)
Date: Thu, 10 Dec 2020 11:56:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607597715;
 bh=fIdtGp8vWJ8rg/wWH4ZsOydgwsBnqjqa6suyPx9CjfQ=;
 h=From:To:Subject:References:In-Reply-To:From;
 b=uNJUj8Xv/P5uwUw4YhKVzlwl51hpeBuON60UdAv3sBOhpHulQebDdtLbzFylGBF1t
 9Lhwbxdf8pMSKN1m7Bbd1q2Jepska5L9E+yXMC8giviE+EG9nw8uIPi3IAzMimIIS0
 27uyTunzMLLsj7WS9F3TRfBEkUkBZj9IUGJJysRY=
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 surenb@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Hridya Valsaraju <hridya@google.com>, kernel-team@android.com,
 linux-media@vger.kernel.org
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
Message-ID: <X9H+3AP1q39aMxeb@kroah.com>
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com>
 <20201210102727.GE401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210102727.GE401619@phenom.ffwll.local>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
> On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
> > On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian K=F6nig wrote:
> > > In general a good idea, but I have a few concern/comments here.
> > > =

> > > Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> > > > This patch allows statistics to be enabled for each DMA-BUF in
> > > > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > > =

> > > > The following stats will be exposed by the interface:
> > > > =

> > > > /sys/kernel/dmabuf/<inode_number>/exporter_name
> > > > /sys/kernel/dmabuf/<inode_number>/size
> > > > /sys/kernel/dmabuf/<inode_number>/dev_map_info
> > > > =

> > > > The inode_number is unique for each DMA-BUF and was added earlier [=
1]
> > > > in order to allow userspace to track DMA-BUF usage across different
> > > > processes.
> > > > =

> > > > Currently, this information is exposed in
> > > > /sys/kernel/debug/dma_buf/bufinfo.
> > > > However, since debugfs is considered unsafe to be mounted in produc=
tion,
> > > > it is being duplicated in sysfs.
> > > =

> > > Mhm, this makes it part of the UAPI. What is the justification for th=
is?
> > > =

> > > In other words do we really need those debug information in a product=
ion
> > > environment?
> > =

> > Production environments seem to want to know who is using up memory :)
> =

> This only shows shared memory, so it does smell a lot like $specific_issue
> and we're designing a narrow solution for that and then have to carry it
> forever.

I think the "issue" is that this was a feature from ion that people
"missed" in the dmabuf move.  Taking away the ability to see what kind
of allocations were being made didn't make a lot of debugging tools
happy :(

But Hridya knows more, she's been dealing with the transition for a long
time now.

> E.g. why is the list of attachments not a sysfs link? That's how we
> usually expose struct device * pointers in sysfs to userspace, not as a
> list of things.

These aren't struct devices, so I don't understand the objection here.
Where else could these go in sysfs?

> Furthermore we don't have the exporter device covered anywhere, how is
> that tracked? Yes Android just uses ion for all shared buffers, but that's
> not how all of linux userspace works.

Do we have the exporter device link in the dmabuf interface?  If so,
great, let's use that, but for some reason I didn't think it was there.

> Then I guess there's the mmaps, you can fish them out of procfs. A tool
> which collects all that information might be useful, just as demonstration
> of how this is all supposed to be used.

There's a script somewhere that does this today, again, Hridya knows
more.

> There's also some things to make sure we're at least having thought about
> how other things fit in here. E.d. dma_resv attached to the dma-buf
> matters in general a lot. It doesn't matter on Android because
> everything's pinned all the time anyway.
> =

> Also I thought sysfs was one value one file, dumping an entire list into
> dev_info_map with properties we'll need to extend (once you care about
> dma_resv you also want to know which attachments are dynamic) does not
> smell like sysfs design at all.

sysfs is one value per file, what is being exported that is larger than
that here?  Did I miss something on review?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
