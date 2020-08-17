Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF52466E4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 15:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0D86E50E;
	Mon, 17 Aug 2020 13:03:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2986E50E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 13:03:54 +0000 (UTC)
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C247520825;
 Mon, 17 Aug 2020 13:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597669434;
 bh=wHcCAv3Im+/f3JsOA5Q23pUGXi2Go/hGTpsFxt3yvKI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JDDa2hoF6GZdgWlm1l9stFX4r8wVDpBsHT+xex3dmg2FMHllOANOKSiOR1ez3rt5v
 yRw/lkPFKAmQyOXxohKntIdwrpFuQvB4cQ7cgbpzRMjArJEtdynlKNmrgzYU2eAr0y
 iF6BYjiZwyFpM0Hfxj68n7E3wGAad/uygkf4QPaI=
Date: Mon, 17 Aug 2020 15:03:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: DRM/KMS experimental drivers for HiKey 970
Message-ID: <20200817150349.0644266e@coco.lan>
In-Reply-To: <CAKMK7uGWVov+0qmayAvxS+0a-91mRW_1Wp=tqVHFJmTKJ06DuQ@mail.gmail.com>
References: <20200805105137.2b272efc@coco.lan>
 <CAKMK7uFdp_3gm-2DNko4AYa-EOgt5MTwuQLSXbo=xn-9oXayVg@mail.gmail.com>
 <20200805121343.4553d7ab@coco.lan>
 <CAKMK7uGWVov+0qmayAvxS+0a-91mRW_1Wp=tqVHFJmTKJ06DuQ@mail.gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, mani@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Em Wed, 5 Aug 2020 13:04:18 +0200
Daniel Vetter <daniel@ffwll.ch> escreveu:


> > > > I've been working to get upstream support for the DRM driver on HiKey 970.
> > > >
> > > > While the patches are not ready yet for upstream merge, I'm placing
> > > > what I've sone so far on this repository:
> > > >
> > > >         https://github.com/mchehab/linux/tree/hikey970/to_upstream-2.0-v1.1

I already started the process of submitting the pending drivers which
are required for the DRM driver to work (regulators and IOMMU).

I'm now planning what to do with the DRM KMS driver. This driver is
somewhat similar to the Kirin 6220 driver, but the display engine
uses a different set of registers which are chipset specific. My
port should work with either Kirin 960 or 970, although, so far,
I tested only the Kirin 970 part.

Besides its size, the driver is pretty much a standard KMS driver
that uses emulation framebuffer.

Yet, as I said before, it currently has some bugs that are hard to
debug and fix, as the downstream version also has them.

John has a different port, which works only for Kirin 960, adding
some functionality on the existing Kirin 6220 driver. Based on the
history on his WIP tree, it sounds to me that the same bugs I'm
facing are also present on his port. 

The known bugs are:

- EDID reads via adv7135 don't work properly. Adding a delay on
  some part of adv7135 code may help, but that sounds to me more
  like a hack than a final solution;

- There are some underflows on a something called LDI. This is the
  worse bug, as, once it happens, the hardware stops changing the
  displayed image. At John's tree for Kirin 960, there were several
  attempts (and several reverts), trying to address it. Based on a comment
  at the downstream version, at least for Kirin 970 I suspect that this could
  be due to a too low clock frequency, but increasing it alone breaks the 
  driver. I suspect that other clock frequencies would need to be adjusted,
  but I don't know how to adjust the other clocks for it to work with a
  higher frequency;

- There's currently a hack at the valid modesetting logic; only
  modes that are known to work return MODE_OK. 	 

I'm planning to test my port on Kirin 960 soon, and ensure that the
DRM driver will work for both chipsets.

In the future, I'm planning to try merging support for all 3 Kirin
variants at the same driver, probably using part of John's approach
for Kirin 960.

In any case, considering the existing bugs, plus the eventual future
work in order to support multiple Kirin variants at the same driver,
I would prefer merging this driver first at staging. 

Would that be acceptable?

Thanks,
Mauro
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
