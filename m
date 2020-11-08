Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5E72AAA74
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 10:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C946489F6F;
	Sun,  8 Nov 2020 09:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE0889F6F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Nov 2020 09:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gu6W+SYNYwujRSnH/S/cqUbxFQBEVozmfEiGAZYOXTA=; b=CV5/QWIS9Q6yhKqIURS3jOiQr
 sTYBSt7zBvclZtLq9/AyhSNGwBonxuH2r2ePFH8J+7Xx5jqnPUmzQc4SH/mmz0W7mNqzbECRh+Zii
 anGEnoxZi3Oiac1yj2hm/+SGR5mYROn55SFyDixBQAdjv2wCxdzFKJjTsbl7mPPZUXH4zAEtjfMVd
 KC8+q9qJ3pWisOnBEhcJ1apqGtoHIB8xS3EWeuctgpJke1jD+8sDCvhuUBj0ZIdQf0WG+Y0jes3Wc
 y1021x5lFU0en/hGGD/wuAW5+FVgp9yVfPrj2X/thGkAUnVtGuzijUVgGjrdIs81zgdp0RHPdF2F6
 VJg9lE4Hg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56562)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kbhRy-0007Ez-TU; Sun, 08 Nov 2020 09:57:30 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kbhRt-0007jT-4M; Sun, 08 Nov 2020 09:57:25 +0000
Date: Sun, 8 Nov 2020 09:57:25 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: bridge: dw-hdmi: Avoid resetting force in the
 detect function
Message-ID: <20201108095724.GW1551@shell.armlinux.org.uk>
References: <20201031081747.372599-1-net147@gmail.com>
 <20201108095322.GA1129714@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201108095322.GA1129714@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonathan Liu <net147@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 08, 2020 at 10:53:22AM +0100, Sam Ravnborg wrote:
> Russell,
> 
> On Sat, Oct 31, 2020 at 07:17:47PM +1100, Jonathan Liu wrote:
> > It has been observed that resetting force in the detect function can
> > result in the PHY being powered down in response to hot-plug detect
> > being asserted, even when the HDMI connector is forced on.
> > 
> > Enabling debug messages and adding a call to dump_stack() in
> > dw_hdmi_phy_power_off() shows the following in dmesg:
> > [  160.637413] dwhdmi-rockchip ff940000.hdmi: EVENT=plugin
> > [  160.637433] dwhdmi-rockchip ff940000.hdmi: PHY powered down in 0 iterations
> > 
> > Call trace:
> > dw_hdmi_phy_power_off
> > dw_hdmi_phy_disable
> > dw_hdmi_update_power
> > dw_hdmi_detect
> > dw_hdmi_connector_detect
> > drm_helper_probe_detect_ctx
> > drm_helper_hpd_irq_event
> > dw_hdmi_irq
> > irq_thread_fn
> > irq_thread
> > kthread
> > ret_from_fork
> > 
> > Fixes: 381f05a7a842 ("drm: bridge/dw_hdmi: add connector mode forcing")
> > Signed-off-by: Jonathan Liu <net147@gmail.com>
> 
> you are the original author of this code - any comments on this patch?

No further comments beyond what has already been discussed, and the
long and short of it is it's been so long that I don't remember why
that code was there. Given that, I'm not even in a position to ack
the change. Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
