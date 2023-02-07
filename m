Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF768D301
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 10:40:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FE810E49A;
	Tue,  7 Feb 2023 09:40:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D30610E086
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 09:40:13 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pPKSR-0002q8-SK; Tue, 07 Feb 2023 10:40:11 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1pPKSP-0003tK-2n; Tue, 07 Feb 2023 10:40:09 +0100
Date: Tue, 7 Feb 2023 10:40:09 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Dan Johansen <strit@manjaro.org>
Subject: Re: [PATCH v4 1/4] drm/rockchip: vop: limit maximium resolution to
 hardware capabilities
Message-ID: <20230207094009.GE10447@pengutronix.de>
References: <20230207084452.1069656-1-s.hauer@pengutronix.de>
 <20230207084452.1069656-2-s.hauer@pengutronix.de>
 <33d2fe54-7d29-67da-f4c9-9ff084937f11@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33d2fe54-7d29-67da-f4c9-9ff084937f11@manjaro.org>
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
Cc: Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, FUKAUMI Naoki <naoki@radxa.com>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 07, 2023 at 10:16:57AM +0100, Dan Johansen wrote:
> 
> Den 07.02.2023 kl. 09.44 skrev Sascha Hauer:
> > The different VOP variants support different maximum resolutions. Reject
> > resolutions that are not supported by a specific variant.
> > 
> > This hasn't been a problem in the upstream driver so far as 1920x1080
> > has been the maximum resolution supported by the HDMI driver and that
> > resolution is supported by all VOP variants. Now with higher resolutions
> > supported in the HDMI driver we have to limit the resolutions to the
> > ones supported by the VOP.
> > 
> > The actual maximum resolutions are taken from the Rockchip downstream
> > Kernel.
> 
> So just so I understand it, this will allow only up to 1080p on rk3399 or
> will it change something that allows higher resolutions, but with lower
> clock/pixel rates?

This patch is not about bandwidth limitations, only limitations in the
maximum resolution.

The RK3399 has two VOPs, VOPB and VOPL. The latter can only do 1080p
whereas the former can do up to 4k@30. This patch limits the allowed
resolutions to what the VOP can do. So when your application chooses
VOPB you should see 4k@30 as long as your monitor supports it.

In my testing weston has chosen VOPB and thus shows 4k@30, but I can't
tell if it does so because weston is smart enough, or just happens to
default to the VOPB.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
