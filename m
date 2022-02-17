Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA514BA40B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 16:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F279F10E2D5;
	Thu, 17 Feb 2022 15:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537D910E161
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:13:03 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nKiSr-0001t9-Hc; Thu, 17 Feb 2022 16:13:01 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nKiSp-000720-G6; Thu, 17 Feb 2022 16:12:59 +0100
Date: Thu, 17 Feb 2022 16:12:59 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v6 13/23] drm/rockchip: dw_hdmi: Set cur_ctr to 0 always
Message-ID: <20220217151259.GT18637@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
 <20220217082954.2967889-14-s.hauer@pengutronix.de>
 <f5abe6aa-473a-a00d-2bc5-b8a1d0560d1f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5abe6aa-473a-a00d-2bc5-b8a1d0560d1f@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:04:18 up 68 days, 23:49, 87 users,  load average: 0.37, 0.42, 0.35
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
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Yakir Yang <ykk@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 05:00:37PM +0300, Dmitry Osipenko wrote:
> 17.02.2022 11:29, Sascha Hauer пишет:
> > From: Douglas Anderson <dianders@chromium.org>
> > 
> > Jitter was improved by lowering the MPLL bandwidth to account for high
> > frequency noise in the rk3288 PLL.  In each case MPLL bandwidth was
> > lowered only enough to get us a comfortable margin.  We believe that
> > lowering the bandwidth like this is safe given sufficient testing.
> 
> There are no device-trees that use "rockchip,rk3288-cru", AFAICS..

What do you mean? In my tree I have:

arch/arm/boot/dts/rk3288.dtsi:863:              compatible = "rockchip,rk3288-cru";
drivers/clk/rockchip/clk-rk3288.c:985:CLK_OF_DECLARE(rk3288_cru, "rockchip,rk3288-cru", rk3288_clk_init);

> 
> Was this change tested on a non-RK3288 devices?

Yes, on a rk3568 ;)

The patch has been posted back in 2015 and was added to the Rockchip
downstream kernel in 2016. I don't know how thoroughly Rockchip tests
their kernels, but I assume the patch wouldn't be there if it caused
any problems.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
