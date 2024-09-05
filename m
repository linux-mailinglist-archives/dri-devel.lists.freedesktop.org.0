Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2D96D01F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 09:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20FF810E681;
	Thu,  5 Sep 2024 07:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C6D310E681
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 07:11:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1sm6dw-0002sW-V8; Thu, 05 Sep 2024 09:11:00 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1sm6dt-005e23-37; Thu, 05 Sep 2024 09:10:57 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <sha@pengutronix.de>) id 1sm6ds-0085D2-38;
 Thu, 05 Sep 2024 09:10:56 +0200
Date: Thu, 5 Sep 2024 09:10:56 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andyshrk@163.com>
Cc: detlev.casanova@collabora.com, sjoerd@collabora.com,
 sebastian.reichel@collabora.com, heiko@sntech.de,
 hjc@rock-chips.com, cristian.ciocaltea@collabora.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org,
 krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v2 05/11] drm/rockchip: vop2: Introduce vop hardware
 version
Message-ID: <ZtlZgKcDQFF_WnCn@pengutronix.de>
References: <20240904120238.3856782-1-andyshrk@163.com>
 <20240904120238.3856782-6-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904120238.3856782-6-andyshrk@163.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
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

Hi Andy,

On Wed, Sep 04, 2024 at 08:02:32PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> There is a version number hardcoded in the VOP VERSION_INFO
> register, and the version number increments sequentially based
> on the production order of the SOC.
> 
> So using this version number to distinguish different VOP features
> will simplify the code.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - Introduce vop hardware version
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  7 ++++---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 11 +++++++++++
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c |  3 +++
>  3 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> index 9b269f6e576e..871d9bcd1d80 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> @@ -13,6 +13,15 @@
>  #include "rockchip_drm_drv.h"
>  #include "rockchip_drm_vop.h"
>  
> +#define VOP2_VERSION(major, minor, build)	((major) << 24 | (minor) << 16 | (build))
> +
> +/* The new SOC VOP version is bigger than the old */
> +#define VOP_VERSION_RK3568	VOP2_VERSION(0x40, 0x15, 0x8023)
> +#define VOP_VERSION_RK3588	VOP2_VERSION(0x40, 0x17, 0x6786)
> +#define VOP_VERSION_RK3528	VOP2_VERSION(0x50, 0x17, 0x1263)
> +#define VOP_VERSION_RK3562	VOP2_VERSION(0x50, 0x17, 0x4350)
> +#define VOP_VERSION_RK3576	VOP2_VERSION(0x50, 0x19, 0x9765)

What about the RK3566? Does it have the same version code as the RK3568?

This new version field replaces the soc_id mechanism we had before to
99%. You keep the soc_id around just for distinguishing between RK3566
and RK3568. It would be nice to fully replace it.

I see that the VOP_VERSION_RK* numbers are the same as found in the
VOP2_SYS_VERSION_INF registers. On the other hand you never read the
value from the register which make the VOP_VERSION_RK* just arbitrary
numbers. Wouldn't it be possible to make something up for RK3566, like
VOP2_VERSION(0x40, 0x15, 0x8022) to get rid of the soc_id thingy?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
