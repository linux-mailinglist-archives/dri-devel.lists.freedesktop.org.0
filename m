Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B162D59F7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 13:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247B36E051;
	Thu, 10 Dec 2020 12:06:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C0F6E051
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 12:06:18 +0000 (UTC)
Date: Thu, 10 Dec 2020 13:07:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607601977;
 bh=7+XUs0NKgoibxWSzN421h7xPCAuuCw7byH4TQnvEGNw=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=oLeFeqt1pFET44DeiiSlhpvd2a6K2KZr6n0cBqcNsNx771+9H5PVIOkPbJucQu4u/
 tqbg1OacZoFarVqzvGXDaM3wAp3VMknJUO2TG5c+1KksB3zFrWz7f6ra6xII51BqSz
 sT8IhGsd63xCbp3XdM5LTVkVLgdSi4atIBmDoym0=
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] dmabuf: Add the capability to expose DMA-BUF stats in
 sysfs
Message-ID: <X9IPhEkcZO+Ut5RH@kroah.com>
References: <20201210044400.1080308-1-hridya@google.com>
 <b5adfe46-8615-5821-d092-2b93feed5b79@amd.com>
 <X9H0JREcdxDsMtLX@kroah.com>
 <20201210102727.GE401619@phenom.ffwll.local>
 <X9H+3AP1q39aMxeb@kroah.com>
 <CAKMK7uFD3fE01Li3JOpHpzP7313OT3xpcjBwzSVjrCGAmab2Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFD3fE01Li3JOpHpzP7313OT3xpcjBwzSVjrCGAmab2Zg@mail.gmail.com>
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
Cc: Android Kernel Team <kernel-team@android.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Hridya Valsaraju <hridya@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 12:26:01PM +0100, Daniel Vetter wrote:
> On Thu, Dec 10, 2020 at 11:55 AM Greg KH <gregkh@linuxfoundation.org> wro=
te:
> >
> > On Thu, Dec 10, 2020 at 11:27:27AM +0100, Daniel Vetter wrote:
> > > On Thu, Dec 10, 2020 at 11:10:45AM +0100, Greg KH wrote:
> > > > On Thu, Dec 10, 2020 at 10:58:50AM +0100, Christian K=F6nig wrote:
> > > > > In general a good idea, but I have a few concern/comments here.
> > > > >
> > > > > Am 10.12.20 um 05:43 schrieb Hridya Valsaraju:
> > > > > > This patch allows statistics to be enabled for each DMA-BUF in
> > > > > > sysfs by enabling the config CONFIG_DMABUF_SYSFS_STATS.
> > > > > >
> > > > > > The following stats will be exposed by the interface:
> > > > > >
> > > > > > /sys/kernel/dmabuf/<inode_number>/exporter_name
> > > > > > /sys/kernel/dmabuf/<inode_number>/size
> > > > > > /sys/kernel/dmabuf/<inode_number>/dev_map_info
> > > > > >
> > > > > > The inode_number is unique for each DMA-BUF and was added earli=
er [1]
> > > > > > in order to allow userspace to track DMA-BUF usage across diffe=
rent
> > > > > > processes.
> > > > > >
> > > > > > Currently, this information is exposed in
> > > > > > /sys/kernel/debug/dma_buf/bufinfo.
> > > > > > However, since debugfs is considered unsafe to be mounted in pr=
oduction,
> > > > > > it is being duplicated in sysfs.
> > > > >
> > > > > Mhm, this makes it part of the UAPI. What is the justification fo=
r this?
> > > > >
> > > > > In other words do we really need those debug information in a pro=
duction
> > > > > environment?
> > > >
> > > > Production environments seem to want to know who is using up memory=
 :)
> > >
> > > This only shows shared memory, so it does smell a lot like $specific_=
issue
> > > and we're designing a narrow solution for that and then have to carry=
 it
> > > forever.
> >
> > I think the "issue" is that this was a feature from ion that people
> > "missed" in the dmabuf move.  Taking away the ability to see what kind
> > of allocations were being made didn't make a lot of debugging tools
> > happy :(
> =

> If this is just for dma-heaps then why don't we add the stuff back
> over there? It reinforces more that the android gpu stack and the
> non-android gpu stack on linux are fairly different in fundamental
> ways, but that's not really new.

Back "over where"?

dma-bufs are not only used for the graphics stack on android from what I
can tell, so this shouldn't be a gpu-specific issue.

confused,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
