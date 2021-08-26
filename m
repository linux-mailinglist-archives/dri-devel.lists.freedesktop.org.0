Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B39163F8760
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184356E828;
	Thu, 26 Aug 2021 12:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3132B6E82C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v7KqzQJkSi8ftAONeP7LkeFQvet5wxyhKiHQuCVaVI0=; b=sqVrzyX0+Bb+uxIfzIohMi6Sc
 NY4nexc3ugoDP0LDv6g685BfQxOmOAoA72xEzeIaj1lFWO78UNh3QYFQ/ak3lrI0TsyDWoDZVv/kb
 RPWG8ulE4G405t1G1eM+CHoPamXwZxS27Sh0JH5InyQ9/tZxN7CDGfl5LL1/RmKblQOuPFkczCG4z
 FBA+s+JgkrLXo2XRJo4uD3Ld/2/pCGovXnUwojIeWYuEW/TrGQ8iePlFSHRSKJJxc3+cZEPwpQOCy
 nAlOcvJRYIV5Qr0K2HRH6bWIAHgu5qjDNxoU3hoddTCR46N+RpxhnisX8Z8wpC1vEtkMRr/g6ozoY
 wpDdzlD6g==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47712)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mJELl-0007sx-I0; Thu, 26 Aug 2021 13:19:17 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mJELl-0000oQ-AI; Thu, 26 Aug 2021 13:19:17 +0100
Date: Thu, 26 Aug 2021 13:19:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Michael Walle <michael@walle.cc>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Lukas F . Hartmann" <lukas@mntre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/etnaviv: use a 32 bit mask as coherent DMA mask
Message-ID: <20210826121917.GS22278@shell.armlinux.org.uk>
References: <20210826121006.685257-1-michael@walle.cc>
 <20210826121006.685257-4-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826121006.685257-4-michael@walle.cc>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 26, 2021 at 02:10:06PM +0200, Michael Walle wrote:
> -	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> -	pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
> +	/*
> +	 * PTA and MTLB can have 40 bit base addresses, but
> +	 * unfortunately, an entry in the MTLB can only point to a
> +	 * 32 bit base address of a STLB. Moreover, to initialize the
> +	 * MMU we need a command buffer with a 32 bit address because
> +	 * without an MMU there is only an indentity mapping between
> +	 * the internal 32 bit addresses and the bus addresses.
> +	 *
> +	 * To make things easy, we set the dma_coherent_mask to 32
> +	 * bit to make sure we are allocating the command buffers and
> +	 * TLBs in the lower 4 GiB address space.
> +	 */
> +	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(40)) ||
> +	    dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32))) {
> +		dev_dbg(&pdev->dev, "No suitable DMA available\n");
> +		return -ENODEV;
> +	}

This makes no sense. In the previous patch, you initialised
pdev->dev.dma_mask ot point at the coherent mask, implying that
it wasn't already set - for which dma_coerce_mask_and_coherent()
should be used. Now you're just calling dma_set_mask(), which will
fail if pdev->dev.dma_mask hasn't already been set to point at
something.

If it's already been initialised to point at something, then you
shouldn't be overwriting it in the driver, and you should've used
dma_set_mask_and_coherent() in your previous patch.

Confused.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
