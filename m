Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B78772B80
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD2D10E2F6;
	Mon,  7 Aug 2023 16:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFEE10E2F6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5sX20XekzDgMlAphYoByMy0F+x3hGHvMl1TU3/CvZJk=;
 b=ngydRK7AUBWNIuvXRoImK7mBzp3XmT8jPe+fUnWUyb/d3JnAWfnE36MBxSmIlEixYPDdtdkLw4kLu
 qE3ZWBSD7oWIWKcQnuQAduK5TNx1V1/8n52N7hUUnot5la3nYi2QNJcrLQZv0glLwlZqQ3BRy2kYzu
 XTtdONGNtFlz7V7Cyf1RxMm2YitGfKSHUEjxuqY5NaXanP2LV2WOblSpsAIaMQ+386LgPkVoPq0Caa
 bQjT2Y4nZhtHdlBDFD4ypR2/Pb5ZOeW8n1osvHvrEfCuAkUccteUlXGBM/1cl3gv58W95dKe660tJ2
 fDexpvPvx5nKaLj/9XCsLbL0evlm8RA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=5sX20XekzDgMlAphYoByMy0F+x3hGHvMl1TU3/CvZJk=;
 b=3SV18FAbOAcgeZZZI3bXg2OfhD6BTfVLBdNOsjCjVBZnItfqQY+dcDx6DjOzrLgya707v6AhryuiA
 B/rcXfLAA==
X-HalOne-ID: d4415c4d-3542-11ee-87c2-55333ba73462
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id d4415c4d-3542-11ee-87c2-55333ba73462;
 Mon, 07 Aug 2023 16:52:46 +0000 (UTC)
Date: Mon, 7 Aug 2023 18:52:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, rfoss@kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm: atmel-hlcdc: Support inverting the pixel clock
 polarity
Message-ID: <20230807165245.GA281773@ravnborg.org>
References: <20230609144843.851327-1-miquel.raynal@bootlin.com>
 <20230610200515.GA1041001@ravnborg.org>
 <20230807111246.663637a6@xps-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807111246.663637a6@xps-13>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Miquel,

On Mon, Aug 07, 2023 at 11:12:46AM +0200, Miquel Raynal wrote:
> Hi Sam,
> 
> sam@ravnborg.org wrote on Sat, 10 Jun 2023 22:05:15 +0200:
> 
> > On Fri, Jun 09, 2023 at 04:48:43PM +0200, Miquel Raynal wrote:
> > > On the SoC host controller, the pixel clock can be:
> > > * standard: data is launched on the rising edge
> > > * inverted: data is launched on the falling edge
> > > 
> > > Some panels may need the inverted option to be used so let's support
> > > this DRM flag.
> > > 
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>  
> > 
> > Hi Miquel,
> > 
> > the patch is:
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > 
> > I hope someone else can pick it up and apply it to drm-misc as
> > my drm-misc setup is hopelessly outdated atm.
> 
> I haven't been noticed this patch was picked-up, is your tree still
> outdated or can you take care of it?

I am still hopelessly behind on stuff.
I copied a few people on this mail that I hope can help.

Link to the original patch:
https://lore.kernel.org/dri-devel/20230609144843.851327-1-miquel.raynal@bootlin.com/

	Sam
