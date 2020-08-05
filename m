Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12CA123C9D0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 12:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609FA89A91;
	Wed,  5 Aug 2020 10:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACC589A91
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 10:13:47 +0000 (UTC)
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de
 [95.90.213.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31C922177B;
 Wed,  5 Aug 2020 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596622427;
 bh=h37frPbp3J3T9tr6W/Fu9xur7TSY8h8fMye9Atsfsac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ejrz6SLVAayo5/5Sp2IO+lpG1h/LV9bUGldXdKTz6ZghgKO6b/6hphvHjC33zEnAQ
 QuPzFaCRdKB3nRw+I8JNakPv26efOVETBpY0p+OCLcqqE095fr90yxUxT31GnkAhO+
 wR4shjiN40dTkNywCY2c48NZ0DeLz0UwFyusz8Hg=
Date: Wed, 5 Aug 2020 12:13:43 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: DRM/KMS experimental drivers for HiKey 970
Message-ID: <20200805121343.4553d7ab@coco.lan>
In-Reply-To: <CAKMK7uFdp_3gm-2DNko4AYa-EOgt5MTwuQLSXbo=xn-9oXayVg@mail.gmail.com>
References: <20200805105137.2b272efc@coco.lan>
 <CAKMK7uFdp_3gm-2DNko4AYa-EOgt5MTwuQLSXbo=xn-9oXayVg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, mani@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Wed, 5 Aug 2020 11:34:54 +0200
Daniel Vetter <daniel@ffwll.ch> escreveu:

> On Wed, Aug 5, 2020 at 10:51 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Hi,
> >
> > I've been working to get upstream support for the DRM driver on HiKey 970.
> >
> > While the patches are not ready yet for upstream merge, I'm placing
> > what I've sone so far on this repository:
> >
> >         https://github.com/mchehab/linux/tree/hikey970/to_upstream-2.0-v1.1
> >
> > The drivers there are a port from the Linaro's HiKey official Kernel:
> >
> >         https://github.com/96boards-hikey/linux
> >
> > The patches there preserve the old history. The porting patches
> > are applied after the original patches imported from that tree.
> >
> > Besides the DRM driver, this repository contains:
> >
> > - a PMIC/regulator driver;
> > - an iommu driver (still requiring some changes at DT properties);
> > - A DMA driver;
> > - a small ugly hack reverting some PM changes at the WiFi driver,
> >   causing a regression on this board for HiKey 970.
> >
> > My current plans are to start upstreaming those needed drivers.
> >
> > The KMS/DRM driver there still need some changes. I guess it is
> > not ready for being upstreamed yet. Also, it depends on the
> > other drivers to work.
> >
> > In particular, its support for DPMS is broken: if the monitor is
> > suspended, it won't return back to the right frequency settings.  
> 
> Hm this is somewhat surprising, at least with atomic, since DPMS as a
> separate thing doesn't exist anymore - it's the same path as any other
> modeset. With the suspend/resume helpers even the same as after
> resume. But of course in reality there's always potential for some
> differences between boot-up state and what your atomic_disable leaves
> behind to creep in.

Yeah, I didn't notice anything that would explain a problem there,
but I didn't have much time so far to try to identify what is
the real issue there.

Btw, this problem is also present on the official Hikey Linaro's tree. 
There, it had an ugly hack at the modeset logic on adv7535 downstream
driver.

Ah, I forgot to mention, but this driver has a problem when talking
with EDID. So, I'm passing this parameter via grub:

	drm_kms_helper.edid_firmware=edid/1920x1080.bin

With the EDID info from the monitor I'm using at the tests.

Perhaps the DPMS is somehow related to it.

In any case, the modeset part of this driver needs to be revisited,
before merging it drivers/drm.

Btw, both issues are also present at the official Hikey driver,
which makes a little harder to fix, as I was unable to get any
documentation about this chipset so far - except for the public
ones at 96boards.org.

> 
> Just figured I drop this in quickly, always great to have more hw
> drivers showing up!

Yeah, it has been great for me to work on this DRM driver.

Btw, although I didn't test, this driver is meant to support
also Hikey 960.

I intend to test it there when I have some spare time.

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
