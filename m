Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2EE3F875E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7126E827;
	Thu, 26 Aug 2021 12:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 668 seconds by postgrey-1.36 at gabe;
 Thu, 26 Aug 2021 12:25:40 UTC
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30D06E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TRtL4257U7HQ9HSWhs33zhviZUifqBtCKs/0jahRZT4=; b=R6rbC20zVAKo6S7NFA+v+Itej
 uq6GQvVFmRkDKERnaO2juLauqL29bxaIVuHQmWkY09CEdNIw7jTghF1hJkES5ID7cal4+VjrYgwBb
 l565CvpUOlOgliXUqSYMyjlS6RvSiPyudsWRmrLdB+OrPxbJwDwn0EvKV8EpGlx37wGLv4LNLZ6g0
 3ugDKSQnne6BdP53UyN9G1bxPtnECzGFjoShV9mJrEy/FiAPCbjS0D0+pa4GI2lEFld2xqAYcZhLu
 R0vGStupwg1DBpQJv7Fv8RcEFOYnGBaINDlV+4gZwGhiesj+GMOij7j55XhHqChiGds66EFQuLLKi
 rOHlU/dhw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47710)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1mJEH6-0007s6-TK; Thu, 26 Aug 2021 13:14:28 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1mJEH4-0000o5-Lj; Thu, 26 Aug 2021 13:14:26 +0100
Date: Thu, 26 Aug 2021 13:14:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Michael Walle <michael@walle.cc>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Lukas F . Hartmann" <lukas@mntre.com>,
 Marek Vasut <marek.vasut@gmail.com>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/3] drm/etnaviv: fix dma configuration of the virtual
 device
Message-ID: <20210826121426.GR22278@shell.armlinux.org.uk>
References: <20210826121006.685257-1-michael@walle.cc>
 <20210826121006.685257-3-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826121006.685257-3-michael@walle.cc>
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

On Thu, Aug 26, 2021 at 02:10:05PM +0200, Michael Walle wrote:
> +	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(40);
> +	pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;

Please use dma_coerce_mask_and_coherent() here instead.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
