Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1058743903C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 09:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B73BE89DD8;
	Mon, 25 Oct 2021 07:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18BF89DD8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 07:20:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF61660724;
 Mon, 25 Oct 2021 07:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635146415;
 bh=oTmkGUaMrUls5+nCfH+wzzIwXOCcij7+t4UXotfvygc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBBnUm5h4gqghZDyGBMFXofipnhDcGhosPJFd1wDxuNdR8Y3iJTNIfaycs/CXyeEk
 Pg1TjT/dDF6z6yziPGqO9eYMRx1Xh5kc35qEqRyYuFcAf4ExWCxzNb4OpkbLKLcNm/
 YtwCSwNicUdpsVC1qNrsQeqqSpX3eDl8xTFq8964WT60svGjv17G5F8epkoteciX0b
 MDM9z53DyMs+3WNInJXoi6s6gnPPCVCSK1aiEI/S/eH/G9jBfGky62ppl5JD2QDNuR
 1SsxwHagc6UmJGtIr7NVHonkZQ3/Su10jESG+wPPrb4BXYK2qNGgplVBxx+vICxTTo
 CCz4zW7iHKanw==
Date: Mon, 25 Oct 2021 12:50:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 6/7] phy: phy-mtk-dp: Add driver for DP phy
Message-ID: <YXZaq/HYkZSNYKI3@matsya>
References: <20211021092707.3562523-1-msp@baylibre.com>
 <20211021092707.3562523-7-msp@baylibre.com>
 <YXJIPu/Ax6qeft03@matsya> <20211022130636.ncqisltwsvkkc7cg@blmsp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022130636.ncqisltwsvkkc7cg@blmsp>
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

On 22-10-21, 15:06, Markus Schneider-Pargmann wrote:

> > > +	dp_phy->regs = *(struct regmap **)dev->platform_data;
> > > +	if (!dp_phy->regs) {
> > > +		dev_err(dev, "No data passed, requires struct regmap**\n");
> > > +		return -EINVAL;
> > > +	}
> > 
> > is there a reason to do it this way? Why not set the IORESOURCE_MEM for
> > this device and let the driver map here?
> > 
> > NO clocks?
> 
> As briefly mentioned in the commit message, this phy is not a dedicated
> phy. It is embedded in the DisplayPort controller that is added in patch
> 7 of this series. The registerspace of the DisplayPort controller starts
> at offset 0x0, continues with 0x1000 for PHY related functions and goes
> on with encoder related and other registers at 0x2000, 0x3000 and
> 0x4000.
> 
> As this seems to me to be a single function block (also from what I read
> from the datasheet), I designed the binding documentation so that the
> DisplayPort controller starts at 0x0 and spans all registers. Based on
> that I wanted to share the regmap created in the DisplayPort controller
> with this PHY driver that is a direct child of that driver, similar to
> multi function device drivers.
> 
> That also means that the PHY does not have any clocks it requires as it
> only exists in the context of the DisplayPort controller. I could pass
> the same clocks to the PHY, but the use of these clocks does not make
> any difference.

Okay, that sounds sensible

> As I don't have a piece of devicetree, I struggled with using phy_get
> as, if I understand it correctly, it uses the devicetree to find the
> correct PHY device?

Not really, device tree is one of the backends phy_get() relies on. If
you are having issues, then chances are there are bugs somewhere or
usage is incorrect

> Do you have a suggestion on how I could improve this interaction between
> DP controller and PHY? Maybe some driver that I could look at that has
> similar constraints?

I would say use phy_get() and fix if we have any issues around it, that
should make it much cleaner to use

-- 
~Vinod
