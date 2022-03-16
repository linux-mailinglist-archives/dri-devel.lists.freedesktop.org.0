Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622984DAD42
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 10:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308A410E61B;
	Wed, 16 Mar 2022 09:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9B910E60C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 09:13:12 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUPiC-0006To-24; Wed, 16 Mar 2022 10:12:56 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nUPi9-0005kX-PB; Wed, 16 Mar 2022 10:12:53 +0100
Date: Wed, 16 Mar 2022 10:12:53 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v8 09/24] drm/rockchip: dw_hdmi: Add support for niu clk
Message-ID: <20220316091253.GQ405@pengutronix.de>
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
 <20220311083323.887372-10-s.hauer@pengutronix.de>
 <4712e128-8a14-e361-0819-911dc3453372@collabora.com>
 <20220314081834.GK405@pengutronix.de>
 <96e3682c-51ff-6af2-ca07-6ea1b952dd70@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96e3682c-51ff-6af2-ca07-6ea1b952dd70@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:40:05 up 95 days, 16:25, 82 users,  load average: 0.18, 0.25, 0.22
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 "elaine.zhang" <zhangqing@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 14, 2022 at 08:54:27PM +0300, Dmitry Osipenko wrote:
> On 3/14/22 11:18, Sascha Hauer wrote:
> > On Sun, Mar 13, 2022 at 12:07:56AM +0300, Dmitry Osipenko wrote:
> >> On 3/11/22 11:33, Sascha Hauer wrote:
> >>> The rk3568 HDMI has an additional clock that needs to be enabled for the
> >>> HDMI controller to work. This clock is not needed for the HDMI
> >>> controller itself, but to make the SoC internal bus logic work. From the
> >>> reference manual:
> >>>
> >>>> 2.8.6 NIU Clock gating reliance
> >>>>
> >>>> A part of niu clocks have a dependence on another niu clock in order to
> >>>> sharing the internal bus. When these clocks are in use, another niu
> >>>> clock must be opened, and cannot be gated.  These clocks and the special
> >>>> clock on which they are relied are as following:
> >>>>
> >>>> Clocks which have dependency     The clock which can not be gated
> >>>> -----------------------------------------------------------------
> >>>> ...
> >>>> pclk_vo_niu, hclk_vo_s_niu       hclk_vo_niu
> >>>> ...
> >>> The clock framework does not support turning on a clock whenever another
> >>> clock is turned on, so this patch adds support for the dependent clock
> >>> to the HDMI driver. We call it "NIU", which is for "Native Interface
> >>> Unit"
> >>
> >> This still doesn't make sense to me. You're saying that "pclk_vo_niu,
> >> hclk_vo_s_niu" depend on "hclk_vo_niu", but HDMI doesn't use pclk_vo, it
> >> uses pclk_hdmi.
> > 
> > pclk_hdmi_host is a child clock of pclk_vo:
> > 
> >      aclk_vo                  2        2        0   300000000          0     0  50000         Y
> >         aclk_hdcp             0        0        0   300000000          0     0  50000         N
> >         pclk_vo               2        3        0    75000000          0     0  50000         Y
> >            pclk_edp_ctrl      0        0        0    75000000          0     0  50000         N
> >            pclk_dsitx_1       0        0        0    75000000          0     0  50000         N
> >            pclk_dsitx_0       1        2        0    75000000          0     0  50000         Y
> >            pclk_hdmi_host     1        2        0    75000000          0     0  50000         Y
> >            pclk_hdcp          0        0        0    75000000          0     0  50000         N
> >         hclk_vo               2        5        0   150000000          0     0  50000         Y
> >            hclk_hdcp          0        0        0   150000000          0     0  50000         N
> >            hclk_vop           0        2        0   150000000          0     0  50000         N
> 
> It was unclear that the pclk_hdmi is the child of pclk_vo by looking at
> the clk driver's code, thank you!
> 
> Won't be better if the implicit clk dependency would be handled
> internally by the RK clk driver?

I have considered handling something like coupled clocks in the clock
framework, but I have not yet considered handling this internally in the
Rockchip clock driver.

I just had a quick look at the driver. While it sounds like an easy task
to enable gate A whenever gate B is enabled I haven't found a good way to
integrate that into the clk driver. It seems to me that it's not easier
to implement in the clk driver than it is to implement it in the clk
framework where it could be used by others as well.

> For example, by making the common gate
> shared/refcounted. Have you considered this variant? Then we won't need
> to change the DT bindings.

For the DT bindings it is just an additional clock. Should we have a
better way to handle that case in the future we could simply ignore the
additional clock. I wouldn't bother too much about this.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
