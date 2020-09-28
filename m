Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC2F27B4F2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 21:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC7289F6B;
	Mon, 28 Sep 2020 19:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A7989F6B
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 19:03:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 62EBC20058;
 Mon, 28 Sep 2020 21:03:42 +0200 (CEST)
Date: Mon, 28 Sep 2020 21:03:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Alex G." <mr.nuke.me@gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: Enable I/O and core VCC
 supplies if present
Message-ID: <20200928190341.GA673726@ravnborg.org>
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
 <20200926184919.GB98875@ravnborg.org>
 <9c3ce766-743c-705f-7926-21e753c2d02d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c3ce766-743c-705f-7926-21e753c2d02d@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=n0pIf5krzdTGiaSpMTQA:9
 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex.

On Mon, Sep 28, 2020 at 12:35:01PM -0500, Alex G. wrote:
> On 9/26/20 1:49 PM, Sam Ravnborg wrote:
> > Hi Alexandru
> > 
> > On Thu, Sep 24, 2020 at 03:05:05PM -0500, Alexandru Gagniuc wrote:
> > > On the SII9022, the IOVCC and CVCC12 supplies must reach the correct
> > > voltage before the reset sequence is initiated. On most boards, this
> > > assumption is true at boot-up, so initialization succeeds.
> > > 
> > > However, when we try to initialize the chip with incorrect supply
> > > voltages, it will not respond to I2C requests. sii902x_probe() fails
> > > with -ENXIO.
> > > 
> > > To resolve this, look for the "iovcc" and "cvcc12" regulators, and
> > > make sure they are enabled before starting the reset sequence. If
> > > these supplies are not available in devicetree, then they will default
> > > to dummy-regulator. In that case everything will work like before.
> > > 
> > > This was observed on a STM32MP157C-DK2 booting in u-boot falcon mode.
> > > On this board, the supplies would be set by the second stage
> > > bootloader, which does not run in falcon mode.
> > > 
> > > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > 
> > One nitpick here. The binding should be present in the tree before
> > you start using it. So this patch should be applied after the binding.
> 
> It is :)
>   * arch/arm/boot/dts/stm32mp15xx-dkx.dtsi

This is the device tree. So essentially there is part of the device
tree that is not yet documented - so in a perfect world all parts of the
device tree is documented in bindings
(Documentation/devicetree/bindings/* ) before the device tree is
committed.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
