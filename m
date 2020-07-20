Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6D2260B7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 15:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C7D89DB4;
	Mon, 20 Jul 2020 13:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF1389DB4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:22:55 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jxVkn-0005Q0-0w; Mon, 20 Jul 2020 15:22:49 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jxVkl-0006sd-IY; Mon, 20 Jul 2020 15:22:47 +0200
Message-ID: <90a99bbca52358d81f2313dfb3953f6baad12152.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/imx: fix use after free
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marco Felsch <m.felsch@pengutronix.de>, airlied@linux.ie,
 daniel@ffwll.ch,  shawnguo@kernel.org, stefan@agner.ch,
 rmk+kernel@armlinux.org.uk
Date: Mon, 20 Jul 2020 15:22:47 +0200
In-Reply-To: <20200611124332.20819-1-m.felsch@pengutronix.de>
References: <20200611124332.20819-1-m.felsch@pengutronix.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-06-11 at 14:43 +0200, Marco Felsch wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Component driver structures allocated with devm_kmalloc() in bind() are
> freed automatically after unbind(). Since the contained drm structures
> are accessed afterwards in drm_mode_config_cleanup(), move the
> allocation into probe() to extend the driver structure's lifetime to the
> lifetime of the device. This should eventually be changed to use drm
> resource managed allocations with lifetime of the drm device.
> 
> We also need to ensure that all componets are available during the
> unbind() so we need to call component_unbind_all() before we free
> non-devres resources like planes.
> 
> Note this patch fixes the the use after free bug but introduces a
> possible boot loop issue. The issue is triggered if the HDMI support is
> enabled and a component driver always return -EPROBE_DEFER, see
> discussion [1] for more details.
> 
> [1] https://lkml.org/lkml/2020/3/24/1467
> 
> Fixes: 17b5001b5143 ("imx-drm: convert to componentised device support")
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> [m.felsch@pengutronix: fix imx_tve_probe()]
> [m.felsch@pengutronix: resort component_unbind_all())
> [m.felsch@pengutronix: adapt commit message]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Thank you, applied to imx-drm/next.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
