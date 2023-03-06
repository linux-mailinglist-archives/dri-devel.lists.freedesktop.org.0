Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2025D6AC0FE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 14:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3368A10E250;
	Mon,  6 Mar 2023 13:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7603D10E250
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 13:31:24 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pZAvy-0006n4-Oq; Mon, 06 Mar 2023 14:31:22 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pZAvv-0002M7-LA; Mon, 06 Mar 2023 14:31:19 +0100
Date: Mon, 6 Mar 2023 14:31:19 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v6 0/4] drm/rockchip: dw_hdmi: Add 4k@30 support
Message-ID: <20230306133119.GP23347@pengutronix.de>
References: <20230216102447.582905-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216102447.582905-1-s.hauer@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
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
Cc: Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>, Dan Johansen <strit@manjaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

No negative feedback anymore, so I think this series should be merged
now.

Heiko, can you take these patches? I just noticed that I didn't Cc you
on this series, I just added you for this mail. Please let me know if
I should resend.

Sascha

On Thu, Feb 16, 2023 at 11:24:43AM +0100, Sascha Hauer wrote:
> One small fix compared to the last version, when checking for valid
> resolutions I accidently compared the current mode width with the
> maximum allowed height which resulted in wrong resolutions being
> discarded.
> 
> Changes since v5:
> - Fix wrong check width vs. height
> 
> Changes since v4:
> - Use struct vop_reg to store resolutions
> - Only check for valid clock rates when clock != NULL
> 
> Changes since v3:
> - Add patch to limit VOP resolutions to hardware capabilities
> 
> Changes since v2:
> - Use correct register values for mpll_cfg
> - Add patch to discard modes we cannot achieve
> 
> Changes since v1:
> - Allow non standard clock rates only on Synopsys phy as suggested by
>   Robin Murphy
> 
> Sascha Hauer (4):
>   drm/rockchip: vop: limit maximium resolution to hardware capabilities
>   drm/rockchip: dw_hdmi: relax mode_valid hook
>   drm/rockchip: dw_hdmi: Add support for 4k@30 resolution
>   drm/rockchip: dw_hdmi: discard modes with unachievable pixelclocks
> 
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c  | 41 ++++++++++++++++----
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c  | 15 +++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h  |  6 +++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  5 ---
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c  | 18 +++++++++
>  5 files changed, 73 insertions(+), 12 deletions(-)
> 
> -- 
> 2.30.2
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
