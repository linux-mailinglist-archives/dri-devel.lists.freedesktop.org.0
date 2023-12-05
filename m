Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18924804EA6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F57B10E4B0;
	Tue,  5 Dec 2023 09:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CE410E4B0
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:48:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1rAS2g-0004Kk-Us; Tue, 05 Dec 2023 10:48:38 +0100
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1rAS2e-00DiEw-H2; Tue, 05 Dec 2023 10:48:36 +0100
Received: from sha by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1rAS2e-005MaM-EC; Tue, 05 Dec 2023 10:48:36 +0100
Date: Tue, 5 Dec 2023 10:48:36 +0100
From: Sascha Hauer <sha@pengutronix.de>
To: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 11/14] drm/rockchip: vop2: Add support for rk3588
Message-ID: <20231205094836.GZ1057032@pengutronix.de>
References: <20231130122001.12474-1-andyshrk@163.com>
 <20231130122439.13374-1-andyshrk@163.com>
 <20231205092936.GW1057032@pengutronix.de>
 <87831dc3-2554-4b53-a9f8-6b61cf67732e@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87831dc3-2554-4b53-a9f8-6b61cf67732e@rock-chips.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 05:44:03PM +0800, Andy Yan wrote:
> Hi Sascha:
> 
> On 12/5/23 17:29, Sascha Hauer wrote:
> > On Thu, Nov 30, 2023 at 08:24:39PM +0800, Andy Yan wrote:
> > > From: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > VOP2 on rk3588:
> > > 
> > > Four video ports:
> > > VP0 Max 4096x2160
> > > VP1 Max 4096x2160
> > > VP2 Max 4096x2160
> > > VP3 Max 2048x1080
> > > 
> > > 4 4K Cluster windows with AFBC/line RGB and AFBC-only YUV support
> > > 4 4K Esmart windows with line RGB/YUV support
> > > 
> > > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > 
> > With the two nits below feel free to add my:
> > 
> > Reviewed-by: Sascha Hauer <s.hauer@pengutronix.de>
> > 
> > Thanks for working on this.
> > 
> > > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > > index 8d7ff52523fb..8b16031eda52 100644
> > > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > > @@ -13,9 +13,16 @@
> > >   #define VOP_FEATURE_OUTPUT_10BIT        BIT(0)
> > 
> > You could rename this to include "VP" for Video Port so it's not so
> > easily mixed up with the defines below.
> 
> Yes, I have the same idea, maybe it's better to do the rename in a separate ?

Ah Yes, I didn't realize this is just a context line. I thought you
had added it.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
