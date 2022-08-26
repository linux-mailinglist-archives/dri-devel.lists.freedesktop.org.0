Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661BA5A2CD1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 18:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D4510E9D3;
	Fri, 26 Aug 2022 16:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4EC10E9D1;
 Fri, 26 Aug 2022 16:53:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 444F52B3;
 Fri, 26 Aug 2022 18:53:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661532797;
 bh=l5nOKSe7tyfi3nmMy5tSpDEUSHUZJimujVQ7AUBOrok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P4BMX7Li/hWK8IRnz7x7qD/Ng+5uu5uhcW2LSEW+3Fn0hKLD2Zm+j4+VPRDL2GT9F
 nDyTiEUDopC9p2jDnvxjXUFRYiV/GxXeKNZ8EdNsso92pIJ+NKyZk5dBK5oI1K/9a8
 tHXcnJKYoJfPUrHR8Du1dvU8DxaCd2vudOSAOmXw=
Date: Fri, 26 Aug 2022 19:53:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC] drm/bridge: adv7533: remove dynamic lane switching from
 adv7533 bridge
Message-ID: <Ywj6dnZEPhQjzlTG@pendragon.ideasonboard.com>
References: <1660005330-12369-1-git-send-email-quic_abhinavk@quicinc.com>
 <YvK4SpvF0zwtaIM9@pendragon.ideasonboard.com>
 <2933a555-d000-3fc3-5336-778238545b80@linaro.org>
 <ef88ed87-fd32-5c50-d220-fd43b238bd7c@linaro.org>
 <Ywi0u4E5+MUx9wCk@pendragon.ideasonboard.com>
 <648214d3-df31-9554-7b42-c69d72fe1ba9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <648214d3-df31-9554-7b42-c69d72fe1ba9@linaro.org>
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
Cc: jernej.skrabec@gmail.com, andrzej.hajda@intel.com, narmstrong@baylibre.com,
 airlied@linux.ie, sam@ravnborg.org, jonas@kwiboo.se,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, robert.foss@linaro.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com, colin.king@intel.com,
 freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Fri, Aug 26, 2022 at 04:52:12PM +0300, Dmitry Baryshkov wrote:
> On 26/08/2022 14:55, Laurent Pinchart wrote:
> > On Fri, Aug 26, 2022 at 01:17:43PM +0300, Dmitry Baryshkov wrote:
> >> On 22/08/2022 19:31, Dmitry Baryshkov wrote:
> >>> On 09/08/2022 22:40, Laurent Pinchart wrote:
> >>>> On Mon, Aug 08, 2022 at 05:35:30PM -0700, Abhinav Kumar wrote:
> >>>>> adv7533 bridge tries to dynamically switch lanes based on the
> >>>>> mode by detaching and attaching the mipi dsi device.
> >>>>>
> >>>>> This approach is incorrect because as per the DSI spec the
> >>>>> number of lanes is fixed at the time of system design or initial
> >>>>> configuration and may not change dynamically.
> >>>>
> >>>> Is that really so ? The number of lanes connected on the board is
> >>>> certainlyset at design time, but a lower number of lanes can be used at
> >>>> runtime. It shouldn't change dynamically while the display is on, but it
> >>>> could change at mode set time.
> >>>
> >>> I'm not sure if I interpreted the standard correctly, but I tended to
> >>> have the same interpretation as Abhinav did.
> >>>
> >>> Anyway, even if we allow the drivers to switch the amount of lanes, this
> >>> should not happen in the form of detach()/attach() cycle. The drivers
> > 
> > Agreed.
> > 
> >>> use mipi_dsi_attach() as way to signal the DSI hosts that the sink
> >>> device is ready. Some of DSI hosts (including MSM one) would bind
> >>> components from the attach callback.
> >>>
> >>> If we were to support dynamically changing the amount of lanes, I would
> >>> ask for additional mipi_dsi API call telling the host to switch the
> >>> amount of lanes. And note that this can open the can of worms. Different
> >>> hosts might have different requirements here. For example for the MSM
> >>> platform the amount of lanes is programmed during bridge_pre_enable
> >>> chain call, so it is possible to just set the amount of lanes following
> >>> the msm_dsi_device::lanes. Other hosts might have other requirements.
> > 
> > Conceptually, I would expect the number of effective lanes to be
> > selected at mode set time, because it has to be done while the output is
> > disabled.
> 
> There is one tightly coupled question. The dual-DSI (or bonded-DSI) 
> mode. Currently it is exposed as two independent DSI hosts. If we allow 
> changing the amount of DSI lanes at runtime, bonded DSI mode would 
> become complicated by fixing amount of lanes for each of outputs (or 
> switching them in tight loop). And then comes the question of switching 
> between single-DSI and bonded-DSI at runtime.

Maybe we can leave dynamic selection of the number of lanes for dual-DSI
out at this point ? I have no experienced with bonded DSI, is it typical
to have to switch between single and bonded links at runtime (to be
precise, at mode set time, not while the display is on) ?

> > With the atomic API for bridges the .mode_set() operation is
> > deprecated, so .pre_enable() sounds best, but there's a potential issue:
> > the .pre_enable() operation is called from sink to source. It means that
> > a DSI sink .pre_enable() operation would need to call a DSI host
> > operation to set (or maybe negotiate instead of just setting a fixed
> > value) the number of lanes first if it wants to control the sink through
> > DCS at .pre_enable() time. We'd have to see how that fits.
> 
> What is the fate of the patchset that implemented 'parent-first' opt-in 
> for the drm_bridge chains? It was supposed to solve this this kind of 
> issues. I'm asking because until it is merged some DSI hosts (e.g. the 
> msm dsi) turn on the power in .mode_set() to allow the pre_enable() 
> callbacks work when the DSI link is in LP11 mode.
> 
> Back then I voted for the explicit mipi_dsi_power_on kind of calls, 
> which would allow the sink bridge to prepare for the DSI powerup (e.g. 
> by setting the amount of lanes), power up the DSI host, putting the link 
> into LP11 and after that communicate with the sink using the DSI data 
> lanes.

A long time ago, I worked on converting the omapdrm driver to the DRM
bridge API. It was using internal bridge and panel drivers with an API
specific to omapdrm, and it was based on a similar principle: enabling
or disabling an output went from the last component in the chain, which
was the responsible for calling into its parent explicitly, with a
bus-specific API. DRM bridge, on the other hand, doesn't use a recursive
model but sequences the whole pipeline with a fixed order. This has led
to be pre-enable/enable split, and even that isn't enough. Moving from
the omapdrm model to the DRM bridge model was difficult and took lots of
time and effort, and I'm now increasingly thinking the omapdrm model got
it right, only too early to convince enough people.

> >>> Thus said I'd suggest accepting this patch and maybe working on the
> >>> API/support for the lane switching as a followup.
> > 
> > I don't have a personal need for the ADV7533 so I won't really complain
> > about any potential regression this may introduce (given that it fixes a
> > deadlock maybe things are completely broken already and nothing can
> > regress). I'd like to see this fixed though, doing it as a follow up is
> > too often a way to avoid doing it at all :-)
> 
> I don't know if this sounds like a promise, we are supporting several 
> devices which use adv75xx (including famous dragonboard410c and less 
> known Inforce ifc6510). So it might be (*) in our interest to restore 
> this functionality. However as it requires adding additional API, design 
> & negotiations might take some time.

That's fine.

> (*) might be if it limits the functionality of the device by limiting 
> support for different modes. If not... why care then?
> 
> > In any case, the commit message should be reworded to explain the
> > rationale and what needs to be done. Adding a TODO or FIXME comment in
> > the code would also help.

-- 
Regards,

Laurent Pinchart
