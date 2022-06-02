Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEE153B39D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 08:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8323410FF52;
	Thu,  2 Jun 2022 06:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BDC112EF2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 06:34:38 +0000 (UTC)
Date: Thu, 02 Jun 2022 06:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654151676; x=1654410876;
 bh=N1WFrFNouf4FGKPKUT3CMPbbDESXZL5iQUW72WwpTek=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=PAP1eQfeLMudFC2WlyF7qphtMgnxY3GRv6caIvkKQjD8+zKL4it5BpY+wBB5phsv4
 xj6ZyKjC1uL0V8fJN76aVy9Y7sY/BJc50nmPg8jT8ll+o1BaxIFckD5xEC3H/JVa0L
 bKjHf1hxCn+4b1u9SoBK9D9cWXN76dI0xQYZoVAjC6wQ8dj4cIWRwvgSbOhGM8lCyZ
 gDGNEN0YCvO8jfE2P3NYDpEbQXoaS6QOP1ILMWufl9wqxMQZ7WszOsGR0gEjQf3oSX
 IPMY3iQmNo+W9LDbJzrfZoDtRp7RT00x9R43s9i4KMQF13BIwAQLkjlIYwi08A2Svv
 5pgI1SsTjekNA==
To: Greg KH <greg@kroah.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Message-ID: <CtTIPo68VAvDRUp7-QFc0m-2SnikPFd0QpdogNj2xueFfyQKa3DQqiw3Meqtsu8vQgEuKX_-MPKbe7jQdf49-Y3z2TAYbajUrC5GKF0Dolk=@emersion.fr>
In-Reply-To: <YphX2erQp3e4mUba@kroah.com>
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
 <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
 <YphX2erQp3e4mUba@kroah.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thursday, June 2nd, 2022 at 08:25, Greg KH <greg@kroah.com> wrote:

> On Thu, Jun 02, 2022 at 06:17:31AM +0000, Simon Ser wrote:
>
> > On Thursday, June 2nd, 2022 at 07:40, Greg KH greg@kroah.com wrote:
> >
> > > On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
> > >
> > > > To discover support for new DMA-BUF IOCTLs, user-space has no
> > > > choice but to try to perform the IOCTL on an existing DMA-BUF.
> > >
> > > Which is correct and how all kernel features work (sorry I missed the
> > > main goal of this patch earlier and focused only on the sysfs stuff).
> > >
> > > > However, user-space may want to figure out whether or not the
> > > > IOCTL is available before it has a DMA-BUF at hand, e.g. at
> > > > initialization time in a Wayland compositor.
> > >
> > > Why not just do the ioctl in a test way? That's how we determine kern=
el
> > > features, we do not poke around in sysfs to determine what is, or is
> > > not, present at runtime.
> > >
> > > > Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> > > > subsystem to advertise supported features. Add a
> > > > sync_file_import_export entry which indicates that importing and
> > > > exporting sync_files from/to DMA-BUFs is supported.
> > >
> > > No, sorry, this is not a sustainable thing to do for all kernel featu=
res
> > > over time. Please just do the ioctl and go from there. sysfs is not
> > > for advertising what is and is not enabled/present in a kernel with
> > > regards to functionality or capabilities of the system.
> > >
> > > If sysfs were to export this type of thing, it would have to do it fo=
r
> > > everything, not just some random tiny thing of one kernel driver.
> >
> > I'd argue that DMA-BUF is a special case here.
>
> So this is special and unique just like everything else? :)
>
> > To check whether the import/export IOCTLs are available, user-space
> > needs a DMA-BUF to try to perform the IOCTL. To get a DMA-BUF,
> > user-space needs to enumerate GPUs, pick one at random, load GBM or
> > Vulkan, use that heavy-weight API to allocate a "fake" buffer on the
> > GPU, export that buffer into a DMA-BUF, try the IOCTL, then teardown
> > all of this. There is no other way.
> >
> > This sounds like a roundabout way to answer the simple question "is the
> > IOCTL available?". Do you have another suggestion to address this
> > problem?
>
> What does userspace do differently if the ioctl is present or not?

Globally enable a synchronization API for Wayland clients, for instance
in the case of a Wayland compositor.

> And why is this somehow more special than of the tens of thousands of
> other ioctl calls where you have to do exactly the same thing you list
> above to determine if it is present or not?

For other IOCTLs it's not as complicated to obtain a FD to do the test
with.

> And how have you specifically tied this sysfs to the ioctl so that if it
> changes or is ported elsewhere, that sysfs attribute will also know to
> be added?

What do you mean by "ported elsewhere"?

> You already have shipping kernels today without this attribute, you
> can't go back in time and add the attribute to those kernels just to
> reflect the ioctl being present or not, so you have to handle this case
> in userspace today, making this not needed at all. Do you want to have
> two test cases in your userspace code, one that does "is the sysfs file
> there? No, ok, let's see if we are on an older kernel without it, yet
> the ioctl is present..." When really you can just do "let's see if the
> ioctl is present" logic as you already do that today.

The IOCTL has not been shipped yet.
