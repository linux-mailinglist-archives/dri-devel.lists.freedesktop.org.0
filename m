Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA26EA5EE15
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 09:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2E889F63;
	Thu, 13 Mar 2025 08:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC2689F63
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 08:33:27 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1tse0B-00077f-6N; Thu, 13 Mar 2025 09:33:15 +0100
Message-ID: <7ba2e429-113d-4e1c-968b-ffbe65bcf9f4@pengutronix.de>
Date: Thu, 13 Mar 2025 09:33:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "barebox@lists.infradead.org" <barebox@lists.infradead.org>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [BUG] drm/rockchip: vop2: uninitialized variables passed to ilog2 and
 writel
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Running clang-analyzer[1] on the VOP2 driver in barebox[2], which was ported
from Linux reports that following variables:

  dclk_out_div, if_pixclk_div, if_dclk_div

defined in rk3588_set_intf_mux() and passed to rk3588_calc_cru_cfg()
are given as uninitialized arguments to ilog2() and in some cases even
used afterwards unconditionally (outside of error cases):

  - dclk_out_div: is not initialized in the HDMI, eDP and DPI cases,
    but is passed to ilog2 unconditionally and the result is written
    into the RK3588_VP_CLK_CTRL register

  - if_pixclk_div: is not initialized in the DP and DPI cases,
    but is passed to ilog2 unconditionally.
    However, the result seems unused.

  - if_clk_div: is not initialized in the DP, MIPI and DPI cases,
    but is passed to ilog2 unconditionally.
    However, the result seems unused.

I checked against Linux v6.14-rc6.

I am not fully sure what a suitable default value would be for the first
case, which is why I report this without a patch.

[1]: https://lore.kernel.org/barebox/20250313080950.3222757-1-a.fatoum@pengutronix.de/T/#m78ca98c01b73ef7fe3316e73ce62cfe4b2c111d0
[2]: https://github.com/barebox/barebox/blob/v2025.02.0/drivers/video/rockchip/rockchip_drm_vop2.c

Thanks,
Ahmad
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

