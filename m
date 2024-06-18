Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386490D768
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 17:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3018E89B01;
	Tue, 18 Jun 2024 15:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CuegVrQj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0667689B01;
 Tue, 18 Jun 2024 15:34:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C63FFCE0317;
 Tue, 18 Jun 2024 15:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 697B8C3277B;
 Tue, 18 Jun 2024 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718724866;
 bh=+nQiJq6jvTQndJvGZiYobP2khJ0xmO2XzOZLZ/frEfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CuegVrQjPPoQBzx63RvFc+JE14Y3fYyjgERDi5hBBJZhwf08XwWG8hzJXk8Jsqk3P
 FgRO2Nlf3+qkTTGXlDf2BiO3B4VwXfGsfLlyQGWEXJzuCiO89yAiwd/NBWB7eR9lbl
 Zos0HBP5RHSaypeys4SxN0J6luoo3ioCGqNzON9uZK+L7Wu8BV20kq5K9KyDc5vk+/
 A/Tq6f+OoKE5jpNjAfKo8wuBvNFBUTl/DK9yw1cwSPNE74Ltn6r+37Jo3+dLxYbyiE
 v2pVmU7kMV3JDlUcWbBNXXVdYoXMk6r02zM7woVfqa7STdTLRomo85Abw9h1og2pdg
 gekUvQBeyKM0w==
Date: Tue, 18 Jun 2024 16:34:20 +0100
From: Will Deacon <will@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andrew Halaney <ahalaney@redhat.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
Message-ID: <20240618153419.GC2354@willie-the-truck>
References: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
 <20240514183849.6lpyplifero5u35r@hu-akhilpo-hyd.qualcomm.com>
 <ae4a77wt3kc73ejshptldqx6ugzrqguyq7etbbu54y4avhbdlt@qyt4r6gma7ev>
 <20240516145005.gdksmvxp35m45ifh@hu-akhilpo-hyd.qualcomm.com>
 <5vyrmxvkurdstqfiatxfqcqljwyiswda2vpkea27ighb2eqbav@n24yzdykbc23>
 <20240604144055.GE20384@willie-the-truck>
 <444f6a34-6636-44b0-850b-777c44fd62dd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <444f6a34-6636-44b0-850b-777c44fd62dd@linaro.org>
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

On Thu, Jun 06, 2024 at 02:03:24PM +0200, Konrad Dybcio wrote:
> On 4.06.2024 4:40 PM, Will Deacon wrote:
> > On Thu, May 16, 2024 at 01:55:26PM -0500, Andrew Halaney wrote:
> >> On Thu, May 16, 2024 at 08:20:05PM GMT, Akhil P Oommen wrote:
> >>> On Thu, May 16, 2024 at 08:15:34AM -0500, Andrew Halaney wrote:
> >>>> If I understand correctly, you don't need any memory barrier.
> >>>> writel()/readl()'s are ordered to the same endpoint. That goes for all
> >>>> the reordering/barrier comments mentioned below too.
> >>>>
> >>>> device-io.rst:
> >>>>
> >>>>     The read and write functions are defined to be ordered. That is the
> >>>>     compiler is not permitted to reorder the I/O sequence. When the ordering
> >>>>     can be compiler optimised, you can use __readb() and friends to
> >>>>     indicate the relaxed ordering. Use this with care.
> >>>>
> >>>> memory-barriers.txt:
> >>>>
> >>>>      (*) readX(), writeX():
> >>>>
> >>>> 	    The readX() and writeX() MMIO accessors take a pointer to the
> >>>> 	    peripheral being accessed as an __iomem * parameter. For pointers
> >>>> 	    mapped with the default I/O attributes (e.g. those returned by
> >>>> 	    ioremap()), the ordering guarantees are as follows:
> >>>>
> >>>> 	    1. All readX() and writeX() accesses to the same peripheral are ordered
> >>>> 	       with respect to each other. This ensures that MMIO register accesses
> >>>> 	       by the same CPU thread to a particular device will arrive in program
> >>>> 	       order.
> >>>>
> >>>
> >>> In arm64, a writel followed by readl translates to roughly the following
> >>> sequence: dmb_wmb(), __raw_writel(), __raw_readl(), dmb_rmb(). I am not
> >>> sure what is stopping compiler from reordering  __raw_writel() and __raw_readl()
> >>> above? I am assuming iomem cookie is ignored during compilation.
> >>
> >> It seems to me that is due to some usage of volatile there in
> >> __raw_writel() etc, but to be honest after reading about volatile and
> >> some threads from gcc mailing lists, I don't have a confident answer :)
> >>
> >>>
> >>> Added Will to this thread if he can throw some light on this.
> >>
> >> Hopefully Will can school us.
> > 
> > The ordering in this case is ensured by the memory attributes used for
> > ioremap(). When an MMIO region is mapped using Device-nGnRE attributes
> > (as it the case for ioremap()), the "nR" part means "no reordering", so
> > readX() and writeX() to that region are ordered wrt each other.
> > 
> > Note that guarantee _doesn't_ apply to other flavours of ioremap(), so
> > e.g. ioremap_wc() won't give you the ordering.
> > 
> > Hope that helps,
> 
> Just to make sure I'm following, would mapping things as nGnRnE effectively
> get rid of write buffering, perhaps being a way of debugging whether that
> in particular is causing issues (at the cost of speed)?

I think the "nE" part is just a hint, so it will depend on how the
hardware has been built. On top of that, you'll still need something
like a DSB to force the CPU to wait for the write response.

Will
