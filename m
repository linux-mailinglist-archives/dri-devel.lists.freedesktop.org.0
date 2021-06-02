Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E1139876A
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 12:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C366E3D2;
	Wed,  2 Jun 2021 10:57:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60CCE6E3C1;
 Wed,  2 Jun 2021 10:57:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FF1460FF2;
 Wed,  2 Jun 2021 10:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622631422;
 bh=4Kqd06H4tk196Fea2oUyUzPCeW3WtfbykgTc6Olq6aI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NQ54KWhccDSvwlRvVWIWPFBMdCHFM40ckBKp6C0O5pVbaEfpXntyDYDIZR1FIkfVd
 b03Za3uUGuo/Zj39zpCr1+1lWnv/u0cP4LFi/yd7RtFku3JFlWJf2ZxwT5f7jAgsBP
 bcQ92lU7Z9HmuqOmHCs32ugqc6ToKMXLQ97btza9X9vl98ZMo0BBTIX/hXmN+tlrjz
 s3ZeJunw3tPwq38VH4nTDl4fOD0zztQYA6ctd/OsneYD22ko3V9NN+aP7lTyWMDVOC
 +ZIfuUA6BIgJOAP78YqTd1+yvM9FzcKekN/MsRDOCMeAnVXT1CsRs9IVj5IU+JMc3u
 k3H3NIyX1NJ8A==
Date: Wed, 2 Jun 2021 16:26:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
Message-ID: <YLdj+nu3rUiIQL0k@vkoul-mobl>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
 <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
 <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26-05-21, 09:00, Jeffrey Hugo wrote:
> On Tue, May 25, 2021 at 11:46 PM Vinod Koul <vkoul@kernel.org> wrote:
> > On 21-05-21, 08:09, Jeffrey Hugo wrote:
> > > On Fri, May 21, 2021 at 6:50 AM Vinod Koul <vkoul@kernel.org> wrote:
> > > >
> > > > Display Stream Compression (DSC) compresses the display stream in host which
> > > > is later decoded by panel. This series enables this for Qualcomm msm driver.
> > > > This was tested on Google Pixel3 phone which use LGE SW43408 panel.
> > > >
> > > > The changes include adding DT properties for DSC then hardware blocks support
> > > > required in DPU1 driver and support in encoder. We also add support in DSI
> > > > and introduce required topology changes.
> > > >
> > > > In order for panel to set the DSC parameters we add dsc in drm_panel and set
> > > > it from the msm driver.
> > > >
> > > > Complete changes which enable this for Pixel3 along with panel driver (not
> > > > part of this series) and DT changes can be found at:
> > > > git.linaro.org/people/vinod.koul/kernel.git pixel/dsc_rfc
> > > >
> > > > Comments welcome!
> > >
> > > This feels backwards to me.  I've only skimmed this series, and the DT
> > > changes didn't come through for me, so perhaps I have an incomplete
> > > view.
> >
> > Not sure why, I see it on lore:
> > https://lore.kernel.org/dri-devel/20210521124946.3617862-3-vkoul@kernel.org/
> >
> > > DSC is not MSM specific.  There is a standard for it.  Yet it looks
> > > like everything is implemented in a MSM specific way, and then pushed
> > > to the panel.  So, every vendor needs to implement their vendor
> > > specific way to get the DSC info, and then push it to the panel?
> > > Seems wrong, given there is an actual standard for this feature.
> >
> > I have added slice and bpp info in the DT here under the host and then
> > pass the generic struct drm_dsc_config to panel which allows panel to
> > write the pps cmd
> >
> > Nothing above is MSM specific.. It can very well work with non MSM
> > controllers too.
> 
> I disagree.
> 
> The DT bindings you defined (thanks for the direct link) are MSM
> specific.  I'm not talking (yet) about the properties you defined, but
> purely from the stand point that you defined the binding within the
> scope of the MSM dsi binding.  No other vendor can use those bindings.
> Of course, if we look at the properties themselves, they are prefixed
> with "qcom", which is vendor specific.
> 
> So, purely on the face of it, this is MSM specific.
> 
> Assuming we want a DT solution for DSC, I think it should be something
> like Documentation/devicetree/bindings/clock/clock-bindings.txt (the
> first example that comes to mind), which is a non-vendor specific
> generic set of properties that each vendor/device specific binding can
> inherit.  Panel has similar things.
> 
> Specific to the properties, I don't much like that you duplicate BPP,
> which is already associated with the panel (although perhaps not in
> the scope of DT).  What if the panel and your DSC bindings disagree?
> Also, I guess I need to ask, have you read the DSC spec?  Last I
> looked, there were something like 3 dozen properties that could be
> configured.  You have five in your proposed binding.  To me, this is
> not a generic DSC solution, this is MSM specific (and frankly I don't
> think this supports all the configuration the MSM hardware can do,
> either).

I would concede the point that DT is msm specific. I dont disagree on
making them a common dsc biding which anyone can use. I think your idea
does have merits...

I am still not sure who should include these properties, would it be the
panel or host. Either would work and rest of the system can use these
properties...

-- 
~Vinod
