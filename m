Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF2E17CF43
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 17:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188866E247;
	Sat,  7 Mar 2020 16:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855236E247
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2020 16:14:50 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 03AA08050E;
 Sat,  7 Mar 2020 17:14:46 +0100 (CET)
Date: Sat, 7 Mar 2020 17:14:45 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: tang pengchuan <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Message-ID: <20200307161445.GA7524@ravnborg.org>
References: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
 <1582710377-15489-5-git-send-email-kevin3.tang@gmail.com>
 <CACvgo53dME1ioYebimSzdOMvjAudtmzpz_-5Q7rNqQnZoBpaqA@mail.gmail.com>
 <CAFPSGXaN1SHCK1QqEca3XcYxTV45fdRBzj5KejW6zr3z4dx_aw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFPSGXaN1SHCK1QqEca3XcYxTV45fdRBzj5KejW6zr3z4dx_aw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=OIW1Wx_ocpC4raMFu88A:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>, Baolin Wang <baolin.wang@linaro.org>,
 Dave Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin

> > > +
> > > +ifdef CONFIG_ARM64
> > > +KBUILD_CFLAGS += -mstrict-align
> >
> >
> > There are many other drivers that do not use readl/writel for register access,
> > yet none has this workaround... Even those that they are exclusively ARM64.
> >
> > Have you tried that it's not a buggy version of GCC? At the very least, I'd
> > encourage you to add a brief comment about the problem + setup.
> >
> > ... In general I think one should follow the suggestions from Rob Herring.
> >
> Yocto v2.5
> aarch64-linaro-linux-gcc (Linaro GCC 7.2-2017.11) 7.2.1 20171011
> 
> Crash Stack:
> /sprd/drv/dispc/dpu_r2p0.c:729
> 1796256 ffffff8008486650:       f803c043        stur    x3, [x2,#60]
> =>Unhandled fault: alignment fault (0x96000061) at 0xffffff80098b883c
> 
> 729         reg->mmu_min_ppn1 = 0;
> 730         reg->mmu_ppn_range1 = 0xffff;
> 731         reg->mmu_min_ppn2 = 0;
> 732         reg->mmu_ppn_range2 = 0xffff;
> 
> The above C code operation are continuous. The compiler may think that
> the access can be completed by directly using two 64-bit assignment
> operations, so it is optimized to 64-bit operation.

What you see is a side-effect of using a sturct for register access.
When you ave your code change to use readl()/writel() and friends
this is no logner a problem, and you can drop the cc flag.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
