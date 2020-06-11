Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D72FC1F68D1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 15:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE33A6E904;
	Thu, 11 Jun 2020 13:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 402 seconds by postgrey-1.36 at gabe;
 Thu, 11 Jun 2020 13:08:46 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:214:fdff:fe10:1be6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EE46E159
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 13:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mm9uMdNawpFPJoq8ynao2bprQnAwV8DjFqswfPl3MNA=; b=zbTQNcFFife0uuSsUHv4zaHTR
 1gVp+mpRzzMcIpR9ybbXAX+tLR7msD4VuwW2OATlojjoyKYhpICFUgCpeMoWIP9dAg+g/LtN1xPB6
 6BKuNn4p8x+JnU4yP9fX5Pu/Ifhpt60iaB3pbeZ9/zOEujVR9WBXaGMvGpV8uHiDtf7H//zO4nx4T
 ya5NdSzcqHtxAfFq9F9xJRNLy8I2DsRPIraNYn3Tp3rG0uRCzmSCw6ll9mayVOOESOz9SXhnKygU1
 hcF2wTdxbhVkJr9oQ53ZKFI9nhRwdejNtaEu354ALuz5jAdZkHMTA6YIi+LuuNDbYVtY2vMeeYI2x
 kXn2d37ng==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44194)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1jjMq4-0000GN-8F; Thu, 11 Jun 2020 14:01:48 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1jjMq1-0005CT-Po; Thu, 11 Jun 2020 14:01:45 +0100
Date: Thu, 11 Jun 2020 14:01:45 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/imx: fix use after free
Message-ID: <20200611130145.GX1551@shell.armlinux.org.uk>
References: <20200611124332.20819-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611124332.20819-1-m.felsch@pengutronix.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, shawnguo@kernel.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 11, 2020 at 02:43:31PM +0200, Marco Felsch wrote:
> From: Philipp Zabel <p.zabel@pengutronix.de>
> 
> Component driver structures allocated with devm_kmalloc() in bind() are
> freed automatically after unbind(). Since the contained drm structures
> are accessed afterwards in drm_mode_config_cleanup(), move the
> allocation into probe() to extend the driver structure's lifetime to the
> lifetime of the device. This should eventually be changed to use drm
> resource managed allocations with lifetime of the drm device.

You need to be extremely careful doing this.  If the allocation is
in the probe function, it's lifetime is not just until unbind, but
potentitally to the _next_ bind, unbind, bind, unbind.  In other
words, it's lifetime is from the point that the component is probed
to the point that it is later removed.

If the driver relies on initialisation of that structure, then that
must be _very_ carefully handled - any state in that structure will
remain.

So, you need to think long and hard about changes like this, and do
a thorough review of the lifetime of every structure member.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC for 0.8m (est. 1762m) line in suburbia: sync at 13.1Mbps down 503kbps up
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
