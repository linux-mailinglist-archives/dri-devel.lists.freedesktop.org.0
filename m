Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2B4DD687
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 09:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD7910E7A7;
	Fri, 18 Mar 2022 08:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3AF10E7A7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 08:52:05 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nV8L5-0005HN-Tp; Fri, 18 Mar 2022 09:52:03 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nV8L2-0004Z8-MF; Fri, 18 Mar 2022 09:52:00 +0100
Date: Fri, 18 Mar 2022 09:52:00 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v8 22/24] drm: rockchip: Add VOP2 driver
Message-ID: <20220318085200.GB12181@pengutronix.de>
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
 <20220311083323.887372-23-s.hauer@pengutronix.de>
 <9ec29d9b-8197-98fb-c612-5c842e4212c4@rock-chips.com>
 <20220316074001.GP405@pengutronix.de>
 <f9d57503-1ac6-61c6-5fda-1a78b6e7270a@rock-chips.com>
 <e6ab5ce2-4177-9e45-a50f-9ea3abb08800@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6ab5ce2-4177-9e45-a50f-9ea3abb08800@rock-chips.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:48:51 up 97 days, 17:34, 77 users,  load average: 0.74, 0.24, 0.12
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy,

On Thu, Mar 17, 2022 at 03:23:12PM +0800, Andy Yan wrote:
>    I found a obvious  error in 0x604(OVERLAY_LAYER_SEL) register, the
>    configuration value
> 
>    is 0x54763513.
> 
>    I am not sure if you know clearly about this register:
> 
>    Every four bits of this register select a Window(Cluster0,Cluster1,
>    Esmart0, Esmart1, Smart0. Smart1)
> 
>    for layer0 to layer 5 from bottom to top.
> 
>    0: Cluster0
> 
>    1: Cluster1:
> 
>    2: Esmart0
> 
>    3: Smart0
> 
>    6: Esmart1
> 
>    7: Smart1
> 
>    And one window can only be selected by one layer at a time.
> 
>    So when I change this register to 0x54762513, the square draw by
>    weston-simple-dmabuf-egl appeared on the top of the weston background on
>    screen.

I can reproduce this here. It seems I have only tested overlays with two
active VPs. With only one active VP I see the same behaviour as you do.

The following patch fixes this, will include that in the next round.

Sascha

------------------------------8<-------------------------------
From d07036753bd1496fa8a49c31eff004e927ce412b Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Fri, 18 Mar 2022 09:47:53 +0100
Subject: [PATCH] fixup! drm: rockchip: Add VOP2 driver

---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 81ff79eddb8a0..71bc8c11b8bcf 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1941,7 +1941,7 @@ static void vop2_setup_layer_mixer(struct vop2_video_port *vp)
 	}
 
 	/* configure unused layers to 0x5 (reserved) */
-	for (; nlayer < 3; nlayer++) {
+	for (; nlayer < vp->nlayers; nlayer++) {
 		layer_sel &= ~RK3568_OVL_LAYER_SEL__LAYER(nlayer + ofs, 0x7);
 		layer_sel |= RK3568_OVL_LAYER_SEL__LAYER(nlayer + ofs, 5);
 	}
-- 
2.30.2

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
