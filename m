Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B0E913E03
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714810E0A8;
	Sun, 23 Jun 2024 20:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g4qedJ//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB4310E0A8
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 20:19:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5158BCE069B;
 Sun, 23 Jun 2024 20:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B45C2BD10;
 Sun, 23 Jun 2024 20:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719173960;
 bh=TayuONK4J25f6tB8Tq6Fwb2x73bI53md4ee5lvhBZec=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=g4qedJ//IAs24DDex+n3r5u8GYcROCh3z0qsFkDms3nKw/eJz0HKYOV0Kz3E2BSty
 AIOqUh3OoBMriDBQIZ4oD7+pBL7rk8EUaVtxMmQ8+Dqj/PW1l95BPuhtfITf7+FKGp
 LTtYhec56+r7S12Dw/lLdu8dyC6vsKQCzL/3x5BGGMPXXO6Kxa5uRsb9lZlzB7I/Ru
 xPXn5hCpbNZHbPorOAkcVxzxN9ycscbIBD8HO45UQhkoW0fn9vv9rcQny4m0ic4cet
 oaoW33NOaj6vDDokZw0AHJlZWABIWYPMBzKnHT7y88MuMil3GMaX8+ouTQ/doPSS+6
 VCcrc0H5n2COg==
Date: Sun, 23 Jun 2024 15:19:17 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>, 
 Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <fin5dnpf3jyo5mk4b7fktdutbds5lkpxwzojecxa4zh7gwfad2@rkryxqzt6maq>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
 <CAA8EJprgCJKOnZo7Q31KZV3SA3NqWxcMmoUxuqnVF+8cQW5ucg@mail.gmail.com>
 <6f59552d-d7a3-5e05-3465-e707c1b7eaf2@quicinc.com>
 <ZnWhwJtTXS32UI9H@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnWhwJtTXS32UI9H@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 21, 2024 at 05:52:32PM GMT, Daniel Vetter wrote:
> On Fri, Jun 21, 2024 at 09:40:09AM -0600, Jeffrey Hugo wrote:
> > On 6/21/2024 5:19 AM, Dmitry Baryshkov wrote:
> > > On Fri, 21 Jun 2024 at 09:19, Bjorn Andersson <andersson@kernel.org> wrote:
> > > > 
> > > > On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
> > > > > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> > > > > > Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> > > > > > to be added for PD notifications and other missing features. Adding
> > > > > > and maintaining new files from within fastrpc directory would be easy.
> > > > > > 
> > > > > > Example of feature that is being planned to be introduced in a new C
> > > > > > file:
> > > > > > https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> > > > > > 
> > > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > > ---
> > > > > >   MAINTAINERS                          |  2 +-
> > > > > >   drivers/misc/Kconfig                 | 13 +------------
> > > > > >   drivers/misc/Makefile                |  2 +-
> > > > > >   drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> > > > > >   drivers/misc/fastrpc/Makefile        |  2 ++
> > > > > >   drivers/misc/{ => fastrpc}/fastrpc.c |  0
> > > > > >   6 files changed, 21 insertions(+), 14 deletions(-)
> > > > > >   create mode 100644 drivers/misc/fastrpc/Kconfig
> > > > > >   create mode 100644 drivers/misc/fastrpc/Makefile
> > > > > >   rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> > > > > 
> > > > > Please consider whether it makes sense to move to drivers/accel instead
> > > > > (and possibly writing a better Kconfig entry, specifying that the driver
> > > > > is to be used to offload execution to the DSP).
> > > > > 
> > > > 
> > > > Wouldn't this come with the expectation of following the ABIs of
> > > > drivers/accel and thereby breaking userspace?
> > > 
> > > As I wrote earlier, that depends on the accel/ maintainers decision,
> > > whether it's acceptable to have non-DRM_ACCEL code underneath.
> > > But at least I'd try doing that on the grounds of keeping the code at
> > > the proper place in the drivers/ tree, raising awareness of the
> > > FastRPC, etc.
> > > For example current fastrpc driver bypasses dri-devel reviews, while
> > > if I remember correctly, at some point it was suggested that all
> > > dma-buf-handling drivers should also notify the dri-devel ML.

If the agreement is that dma-buf-handling drivers must get reviews from
dri-devel, then let's document that in MAINTAINERS and agree with the
maintainer.

There's no need to move the driver for that.

> > > 
> > > Also having the driver under drivers/accels makes it possible and
> > > logical to  implement DRM_ACCEL uAPI at some point. In the ideal world
> > > we should be able to declare existing FastRPC uAPI as legacy /
> > > deprecated / backwards compatibility only and migrate to the
> > > recommended uAPI approach, which is DRM_ACCEL.
> > > 
> > 
> > I suspect Vetter/Airlie need to be involved in this.
> > 
> > Its my understanding that accelerator drivers are able to reside in misc as
> > long as there is no use of dma-buf.  Use of dma-buf means they need to be in
> > drm/accel.
> > 
> > There is precedent for moving a driver from misc to accel (HabanaLabs).
> > 
> > Right now, I'm not aware that fastRPC meets the requirements for drm/accel.
> > There is an open source userspace driver, but I'm not aware of an open
> > source compiler.  From what I know of the architecture, it should be
> > possible to utilize upstream LLVM to produce one.
> 
> Yeah so fastrpc is one of the reasons why I've added a dma_buf regex match
> to MAINTAINERS, and given this move has shown up here on dri-devel that
> seems to work.
> 

Sounds good.

> But also, it slipped through, can't break uapi, so I just pretend it's not
> really there :-)
> 

There's a small, but growing userbase of the current upstream fastrpc
uAPI. If there are benefits and a migration path, I think it's
reasonable to explore that - at this point, but probably not much later.

> That aside, going forward it might make sense to look into drivers/accel,
> and also going forward new dma_buf uapi will be reviewed to fairly
> stringent standards. We're not going to impose the dri-devel userspace
> rules on everyone, each subsystem tends to know what's best in their
> ecosystem.

> But if something just ends up in misc so it can avoid the drm
> or accel rules (and I think media is also pretty much on the same page
> nowadays), then expect some serious heat ...
> 

Certainly sounds reasonable to avoid adding new accel-drivers in
drivers/misc.

Regards,
Bjorn

> Cheers, Sima
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
