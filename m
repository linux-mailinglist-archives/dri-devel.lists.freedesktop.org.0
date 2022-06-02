Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAB453B365
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 08:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1006113452;
	Thu,  2 Jun 2022 06:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C190113452
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 06:17:41 +0000 (UTC)
Date: Thu, 02 Jun 2022 06:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1654150658; x=1654409858;
 bh=8l6ulhbU3BRy0U+ItP38SooeJDs8Zt+8NZh1tnMZ1lo=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=fGR5ox26i49ZIeBOkY9rKpq0Q9HcrJ+Jt3z4z4gOmmJFY0hxYGk1HVjCMHctSiuDs
 ivKJADsqeoxeuraazmVbgttyH0dkj+BHY9fgGW3a2QQSMdj7xslfdL1JxbXOOFGExU
 lOSYWdjprxSok9CtMd4lGapBjmdUkeox8JJE585HEZ5XZF5hYoP4+DP8zC/HlGpcI+
 gcU9BdA7Q2BUNu5PkoZs3dHDR1OXTwDRpO4vT+6EmiHYmJfvxVdMAc6esplI5Nunn3
 bp7t+ojSyrjjVEu6ZbeGgfFtP/3aa8CPWZk2bktG4FN3BTDWar8UuzFxJFbae9nFhT
 vnMWorKpJzy+Q==
To: Greg KH <greg@kroah.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v4] dma-buf: Add a capabilities directory
Message-ID: <BCduk8OI3oQXvl2_-ejGwile7y09VscIp1U2MKHX2kEVun1JNxznDByVlidyN8B0vf5xOxS35axHhz5QYWmrmrQmsa8qONFJof6ZtR7CC1Y=@emersion.fr>
In-Reply-To: <YphNaq/JZdlTW8S7@kroah.com>
References: <20220601161303.64797-1-contact@emersion.fr>
 <YphNaq/JZdlTW8S7@kroah.com>
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

On Thursday, June 2nd, 2022 at 07:40, Greg KH <greg@kroah.com> wrote:

> On Wed, Jun 01, 2022 at 04:13:14PM +0000, Simon Ser wrote:
>
> > To discover support for new DMA-BUF IOCTLs, user-space has no
> > choice but to try to perform the IOCTL on an existing DMA-BUF.
>
> Which is correct and how all kernel features work (sorry I missed the
> main goal of this patch earlier and focused only on the sysfs stuff).
>
> > However, user-space may want to figure out whether or not the
> > IOCTL is available before it has a DMA-BUF at hand, e.g. at
> > initialization time in a Wayland compositor.
>
> Why not just do the ioctl in a test way? That's how we determine kernel
> features, we do not poke around in sysfs to determine what is, or is
> not, present at runtime.
>
> > Add a /sys/kernel/dmabuf/caps directory which allows the DMA-BUF
> > subsystem to advertise supported features. Add a
> > sync_file_import_export entry which indicates that importing and
> > exporting sync_files from/to DMA-BUFs is supported.
>
> No, sorry, this is not a sustainable thing to do for all kernel features
> over time. Please just do the ioctl and go from there. sysfs is not
> for advertising what is and is not enabled/present in a kernel with
> regards to functionality or capabilities of the system.
>
> If sysfs were to export this type of thing, it would have to do it for
> everything, not just some random tiny thing of one kernel driver.

I'd argue that DMA-BUF is a special case here.

To check whether the import/export IOCTLs are available, user-space
needs a DMA-BUF to try to perform the IOCTL. To get a DMA-BUF,
user-space needs to enumerate GPUs, pick one at random, load GBM or
Vulkan, use that heavy-weight API to allocate a "fake" buffer on the
GPU, export that buffer into a DMA-BUF, try the IOCTL, then teardown
all of this. There is no other way.

This sounds like a roundabout way to answer the simple question "is the
IOCTL available?". Do you have another suggestion to address this
problem?
