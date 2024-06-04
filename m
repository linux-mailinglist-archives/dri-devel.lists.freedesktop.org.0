Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE89D8FB5BA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 16:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4491510E1D4;
	Tue,  4 Jun 2024 14:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OQUvskLU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C55D10E49F;
 Tue,  4 Jun 2024 14:41:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9143D61299;
 Tue,  4 Jun 2024 14:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93555C2BBFC;
 Tue,  4 Jun 2024 14:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717512062;
 bh=mMQkWVSXbYBsdOLYmzi5KmcMzPAUaVKm50X4Xsw56ak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OQUvskLUvAt55dCN/pmYncolyVzQuWF9dIVGfKa0pBA+K25Oitp9cCR0TaJfjAF1Q
 tC1lkodyEZ1uKzduXA77TZPeRyAB3dnPXYtZN3GCIR/FjJmK0bp0HrMRFPlgnsliRE
 9dCqASCJsTU1nWSGRc2BNKXaWuEe0cQX1Skz+Yob3gtgxVqVy8veZPMl0cqlp1taW6
 gU1Vfna8PrJUGo6Rp9vow6MUPsuQmY+vqC65KgDqr6C0qo5TH3OufTgaxEppC6Ongy
 XQn2NY3KUcZKI6kYTFIxGMqUP7jPzB+VAvWreSh0jtFha1d+ufyadgliZynsXkmG8f
 OtoQPMZbd3lng==
Date: Tue, 4 Jun 2024 15:40:56 +0100
From: Will Deacon <will@kernel.org>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
Message-ID: <20240604144055.GE20384@willie-the-truck>
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
 <ae4a77wt3kc73ejshptldqx6ugzrqguyq7etbbu54y4avhbdlt@qyt4r6gma7ev>
 <20240516145005.gdksmvxp35m45ifh@hu-akhilpo-hyd.qualcomm.com>
 <5vyrmxvkurdstqfiatxfqcqljwyiswda2vpkea27ighb2eqbav@n24yzdykbc23>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5vyrmxvkurdstqfiatxfqcqljwyiswda2vpkea27ighb2eqbav@n24yzdykbc23>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, May 16, 2024 at 01:55:26PM -0500, Andrew Halaney wrote:
> On Thu, May 16, 2024 at 08:20:05PM GMT, Akhil P Oommen wrote:
> > On Thu, May 16, 2024 at 08:15:34AM -0500, Andrew Halaney wrote:
> > > If I understand correctly, you don't need any memory barrier.
> > > writel()/readl()'s are ordered to the same endpoint. That goes for all
> > > the reordering/barrier comments mentioned below too.
> > > 
> > > device-io.rst:
> > > 
> > >     The read and write functions are defined to be ordered. That is the
> > >     compiler is not permitted to reorder the I/O sequence. When the ordering
> > >     can be compiler optimised, you can use __readb() and friends to
> > >     indicate the relaxed ordering. Use this with care.
> > > 
> > > memory-barriers.txt:
> > > 
> > >      (*) readX(), writeX():
> > > 
> > > 	    The readX() and writeX() MMIO accessors take a pointer to the
> > > 	    peripheral being accessed as an __iomem * parameter. For pointers
> > > 	    mapped with the default I/O attributes (e.g. those returned by
> > > 	    ioremap()), the ordering guarantees are as follows:
> > > 
> > > 	    1. All readX() and writeX() accesses to the same peripheral are ordered
> > > 	       with respect to each other. This ensures that MMIO register accesses
> > > 	       by the same CPU thread to a particular device will arrive in program
> > > 	       order.
> > > 
> > 
> > In arm64, a writel followed by readl translates to roughly the following
> > sequence: dmb_wmb(), __raw_writel(), __raw_readl(), dmb_rmb(). I am not
> > sure what is stopping compiler from reordering  __raw_writel() and __raw_readl()
> > above? I am assuming iomem cookie is ignored during compilation.
> 
> It seems to me that is due to some usage of volatile there in
> __raw_writel() etc, but to be honest after reading about volatile and
> some threads from gcc mailing lists, I don't have a confident answer :)
> 
> > 
> > Added Will to this thread if he can throw some light on this.
> 
> Hopefully Will can school us.

The ordering in this case is ensured by the memory attributes used for
ioremap(). When an MMIO region is mapped using Device-nGnRE attributes
(as it the case for ioremap()), the "nR" part means "no reordering", so
readX() and writeX() to that region are ordered wrt each other.

Note that guarantee _doesn't_ apply to other flavours of ioremap(), so
e.g. ioremap_wc() won't give you the ordering.

Hope that helps,

Will
