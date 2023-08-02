Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C07876D783
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 21:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D320D10E56F;
	Wed,  2 Aug 2023 19:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9150510E56F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 19:12:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93AC429A;
 Wed,  2 Aug 2023 21:11:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691003490;
 bh=79gCi+ljQNxU5kGfbaU4eODO3ztjzxCR2y1UIHcBH+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SPEG/sa7I0CPMVolb6AYy5D/t2GM+kTk/VrYzBMUVpHC/7u45CCt4N1iDdakbFR6D
 5bJZWgd5TvYP3IVWRifufmCS01sQguhRL+w74YoP2NLWw7lnFH0XzoL9Mf9wDYehR0
 f6LGCI4oHEwAEOh+K3Kd8f1klINbupJ8eREDknUY=
Date: Wed, 2 Aug 2023 22:12:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Message-ID: <20230802191239.GA1142@pendragon.ideasonboard.com>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <5cf0e3fa-f66d-06c4-cfda-c48efd8c6508@linaro.org>
 <bf95af44-2510-1835-dec9-183144de8413@denx.de>
 <CAA8EJppp_ZJr-DcoZGd1GZmWuo=AECNS+X9zx0dNB4Edn8M2zg@mail.gmail.com>
 <c5597c50-d41c-9f7e-fb85-4e4a1bc29f15@denx.de>
 <69900221-503a-693a-f52e-cfa5841230a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69900221-503a-693a-f52e-cfa5841230a6@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, Amit Pundir <amit.pundir@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 02, 2023 at 09:49:42PM +0300, Dmitry Baryshkov wrote:
> On 02/08/2023 21:45, Marek Vasut wrote:
> > On 8/2/23 20:16, Dmitry Baryshkov wrote:
> >> On Wed, 2 Aug 2023 at 20:34, Marek Vasut wrote:
> >>> On 8/2/23 15:38, Dmitry Baryshkov wrote:
> >>>> On 02/08/2023 11:52, Neil Armstrong wrote:
> >>>>> This reverts commit [1] to fix display regression on the 
> >>>>> Dragonboard 845c
> >>>>> (SDM845) devboard.
> >>>>>
> >>>>> There's a mismatch on the real action of the following flags:
> >>>>> - MIPI_DSI_MODE_VIDEO_NO_HSA
> >>>>> - MIPI_DSI_MODE_VIDEO_NO_HFP
> >>>>> - MIPI_DSI_MODE_VIDEO_NO_HBP
> >>>>> which leads to a non-working display on qcom platforms.
> >>>>>
> >>>>> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
> >>>>> EOT packet")
> >>>>>
> >>>>> Cc: Marek Vasut <marex@denx.de>
> >>>>> Cc: Robert Foss <rfoss@kernel.org>
> >>>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA
> >>>>> and EOT packet")
> >>>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> >>>>> Link:
> >>>>> https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
> >>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>> ---
> >>>>>    drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
> >>>>>    1 file changed, 1 insertion(+), 3 deletions(-)
> >>>>>
> >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #fix db845c
> >>>>
> >>>> The boards broken by [1] are used in production by different parties
> >>>> since 5.10, breaking them doesn't seem more acceptable than breaking the
> >>>> new out-of-tree iMX8m hardware.
> >>>
> >>> The MX8M is also in-tree, so this does not apply.
> >>
> >> v6.5-rc4:
> >>
> >> $ git grep lontium,lt9611 | grep -v 9611uxc
> >> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
> >> http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> >> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
> >>      - lontium,lt9611
> >> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
> >>        compatible = "lontium,lt9611";
> >> arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible = "lontium,lt9611";
> >> drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
> >> drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible = "lontium,lt9611" },
> >>
> >> next-20230802:
> >>
> >> $ git grep lontium,lt9611 | grep -v 9611uxc
> >> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
> >> http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> >> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
> >>      - lontium,lt9611
> >> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
> >>        compatible = "lontium,lt9611";
> >> arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible = "lontium,lt9611";
> >> drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
> >> drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible = "lontium,lt9611" },
> >>
> >> Your device is not in the tree. Your commit broke existing users.
> > 
> > These devices are in tree:
> > arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
> > arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
> > 
> > The LT9211 and LT9611 are both expansion modules handled by DTOs and 
> > bound to the DSIM (which is also in tree).
> 
> And they DT for them is not in the tree, that was my point. You have 
> broken the existing user for the DTBO that is not present even in 
> linux-next.
> 
> >> Can we please end the argument, land the fix (this revert) for 6.5 and
> >> work on the solution for 6.6 or 6.7?
> > 
> > I would much prefer a solution which does not break my existing use 
> > case. It is still not even clear whether the problem really is on MX8M 
> > side at all, or whether it is QCOM misinterpreting flags. I cannot debug 
> > the later, since I have no access to that platform, nor its documentation.
> 
> You can get the RB1 for $199 and check the DSI behaviour on that 
> platform. It has newer bridge, but the DSI controller is (mostly) the same.

Could everybody please get away from the keyboard for a few hours, take
a deep breath, and resume the discussion in a less aggressive and more
constructive way ?

Without judging the technical merits of the arguments, and which
platform gets it wrong, the commit being reverted landed in v6.5-rc1,
and breaks in-tree users. Reverting and retrying thus seems the usual
practice to me, as we are getting too close to the v6.5 release to
ensure a correct fix can be developed and merged in time. This will not
cause a regression on i.MX8M, as the commit has never appeared in a
release kernel.

This is however an unfortunate event. It is not a nice feeling to work
on enabling features for a platform and see the work being reverted at
the last minute. Neil, Dmitry, could you please help Marek figuring out
a good solution for v6.6 ? I don't think it's reasonable to ask him to
buy an RB1 and investigate the MSM side, when Linaro has access to
hardware and support.

-- 
Regards,

Laurent Pinchart
