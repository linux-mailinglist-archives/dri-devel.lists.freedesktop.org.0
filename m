Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AA93489D4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 08:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEA06ECAD;
	Thu, 25 Mar 2021 07:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5936ECAD
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 07:09:05 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1lPK6y-0007Xe-A6; Thu, 25 Mar 2021 08:08:56 +0100
Received: from pza by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1lPK6w-0000gc-Ew; Thu, 25 Mar 2021 08:08:54 +0100
Date: Thu, 25 Mar 2021 08:08:54 +0100
From: Philipp Zabel <pza@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH] [v3] drm/imx: imx-ldb: fix out of bounds array access
 warning
Message-ID: <20210325070854.GC22419@pengutronix.de>
References: <20210324164750.3833773-1-arnd@kernel.org>
 <42e9cf4dd5f12ca437787d80fee0945b0af9424c.camel@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42e9cf4dd5f12ca437787d80fee0945b0af9424c.camel@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:08:16 up 35 days, 10:32, 66 users,  load average: 0.33, 0.39, 0.40
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: pza@pengutronix.de
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 NXP Linux Team <linux-imx@nxp.com>, Joe Perches <joe@perches.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 25, 2021 at 10:03:23AM +0800, Liu Ying wrote:
> On Wed, 2021-03-24 at 17:47 +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > When CONFIG_OF is disabled, building with 'make W=1' produces warnings
> > about out of bounds array access:
> > 
> > drivers/gpu/drm/imx/imx-ldb.c: In function 'imx_ldb_set_clock.constprop':
> > drivers/gpu/drm/imx/imx-ldb.c:186:8: error: array subscript -22 is below array bounds of 'struct clk *[4]' [-Werror=array-bounds]
> > 
> > Add an error check before the index is used, which helps with the
> > warning, as well as any possible other error condition that may be
> > triggered at runtime.
> > 
> > The warning could be fixed by adding a Kconfig depedency on CONFIG_OF,
> > but Liu Ying points out that the driver may hit the out-of-bounds
> > problem at runtime anyway.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Liu Ying <victor.liu@nxp.com>

Thank you, applied to imx-drm/fixes.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
