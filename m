Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D64B1F6A57
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 16:52:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C8C6E923;
	Thu, 11 Jun 2020 14:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E8D6E923
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 14:52:07 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jjOYj-0001t7-Vd; Thu, 11 Jun 2020 16:52:01 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jjOYf-0000k8-BN; Thu, 11 Jun 2020 16:51:57 +0200
Message-ID: <ab17b350d6ac74a89f301b70d0b339f346f5e37a.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/imx: fix use after free
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Marco Felsch
 <m.felsch@pengutronix.de>
Date: Thu, 11 Jun 2020 16:51:57 +0200
In-Reply-To: <20200611130145.GX1551@shell.armlinux.org.uk>
References: <20200611124332.20819-1-m.felsch@pengutronix.de>
 <20200611130145.GX1551@shell.armlinux.org.uk>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
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
Cc: kernel@pengutronix.de, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Russell,

On Thu, 2020-06-11 at 14:01 +0100, Russell King - ARM Linux admin wrote:
> On Thu, Jun 11, 2020 at 02:43:31PM +0200, Marco Felsch wrote:
> > From: Philipp Zabel <p.zabel@pengutronix.de>
> > 
> > Component driver structures allocated with devm_kmalloc() in bind() are
> > freed automatically after unbind(). Since the contained drm structures
> > are accessed afterwards in drm_mode_config_cleanup(), move the
> > allocation into probe() to extend the driver structure's lifetime to the
> > lifetime of the device. This should eventually be changed to use drm
> > resource managed allocations with lifetime of the drm device.
> 
> You need to be extremely careful doing this.  If the allocation is
> in the probe function, it's lifetime is not just until unbind, but
> potentitally to the _next_ bind, unbind, bind, unbind.  In other
> words, it's lifetime is from the point that the component is probed
> to the point that it is later removed.
> 
> If the driver relies on initialisation of that structure, then that
> must be _very_ carefully handled - any state in that structure will
> remain.
> 
> So, you need to think long and hard about changes like this, and do
> a thorough review of the lifetime of every structure member.

Thank you for the warning, I've tried to make sure that no driver relies
on prior initialization by explicitly replacing each
	x = devm_kzalloc(dev, sizeof(*x), GFP_KERNEL);
in .bind() with a
	memset(x, 0, sizeof(*x));

The patch still requires the lifetime of embedded connector and encoder
structures to end somewhere between .unbind() and the next .bind(), but
that should be guaranteed by calling drm_mode_config_cleanup() after
component_unbind_all().

I'd like to replace this with devm_drm_dev_alloc() afterwards, but doing
this first would allow to fix stable kernels as well.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
