Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE5C7770A2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 08:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B06210E4BE;
	Thu, 10 Aug 2023 06:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0F110E4BF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 06:45:57 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BB1766607214;
 Thu, 10 Aug 2023 07:45:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691649956;
 bh=sssu7S7I5IMdLNake9bmuW0hNZ9kLGZut123UXQZjnU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I9m90szIhyCx6Cn710V4Q4FSgVssoVdzUc6afzCK4XN1BgGktSKFLxIxxIQpThDX0
 vhqHG5Z8vUtigncwFn3EBdH9/jf39h3JZEiSMd66xl5vkNFISbTbBGOWlUPblf4ff0
 UYtkMmtQFeapES7vi8L2XlaNF0Kpxd5aM15xzbtpUH977RroXyhkDHRIj2ZmNaoA5k
 LQbEhwUlL5OQJHKfqvqCLYyozR1FnU5Agc3Ggc8ryMs0AcToniadQcMyx9zam8O2JR
 d7Lt+3dD888PNhXET42iUK7ZwhCVdaAaglf9nMYNfvrI5YrmCFte7aE8q7zBALOeiL
 +DlqQkuUfAZxw==
Date: Thu, 10 Aug 2023 08:45:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] drm: atmel-hlcdc: Support inverting the pixel clock
 polarity
Message-ID: <20230810084552.3db3d8c6@collabora.com>
In-Reply-To: <20230808083338.5e31584c@xps-13>
References: <20230609144843.851327-1-miquel.raynal@bootlin.com>
 <20230610200515.GA1041001@ravnborg.org>
 <20230807111246.663637a6@xps-13>
 <20230807165245.GA281773@ravnborg.org>
 <20230808083338.5e31584c@xps-13>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, rfoss@kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Aug 2023 08:33:38 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Sam,
> 
> sam@ravnborg.org wrote on Mon, 7 Aug 2023 18:52:45 +0200:
> 
> > Hi Miquel,
> > 
> > On Mon, Aug 07, 2023 at 11:12:46AM +0200, Miquel Raynal wrote:  
> > > Hi Sam,
> > > 
> > > sam@ravnborg.org wrote on Sat, 10 Jun 2023 22:05:15 +0200:
> > >     
> > > > On Fri, Jun 09, 2023 at 04:48:43PM +0200, Miquel Raynal wrote:    
> > > > > On the SoC host controller, the pixel clock can be:
> > > > > * standard: data is launched on the rising edge
> > > > > * inverted: data is launched on the falling edge
> > > > > 
> > > > > Some panels may need the inverted option to be used so let's support
> > > > > this DRM flag.
> > > > > 
> > > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>      
> > > > 
> > > > Hi Miquel,
> > > > 
> > > > the patch is:
> > > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > > 
> > > > I hope someone else can pick it up and apply it to drm-misc as
> > > > my drm-misc setup is hopelessly outdated atm.    
> > > 
> > > I haven't been noticed this patch was picked-up, is your tree still
> > > outdated or can you take care of it?    
> > 
> > I am still hopelessly behind on stuff.  
> 
> No problem.

I queued it to drm-misc-next this morning.

Regards,

Boris
