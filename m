Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413FA1D9D90
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 19:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4171D6E255;
	Tue, 19 May 2020 17:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.webfaction.com (mail6.webfaction.com [31.170.123.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5B26E255
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 17:10:54 +0000 (UTC)
Received: from jeremy.localnet (host-37-191-188-128.lynet.no [37.191.188.128])
 by smtp.webfaction.com (Postfix) with ESMTPSA id 810DA60038E8E;
 Tue, 19 May 2020 17:11:01 +0000 (UTC)
From: Paul Boddie <paul@boddie.org.uk>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 11/12] gpu/drm: Ingenic: Add support for the IPU
Date: Tue, 19 May 2020 19:10:32 +0200
Message-ID: <3220152.ycyENPvHUQ@jeremy>
User-Agent: KMail/4.14.1 (Linux/3.16.0-10-586; KDE/4.14.2; i686; ; )
In-Reply-To: <YGYIAQ.7N9YGTBML0143@crapouillou.net>
References: <20200516215057.392609-1-paul@crapouillou.net>
 <CACvgo50q=qJXk3nFSCm+S6JHBMxpY0C_HwH8KGB2EAcKwgL0oQ@mail.gmail.com>
 <YGYIAQ.7N9YGTBML0143@crapouillou.net>
MIME-Version: 1.0
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
Cc: devicetree <devicetree@vger.kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday 18. May 2020 13.26.58 Paul Cercueil wrote:
> >>  
> >>  @@ -186,13 +186,16 @@ static void
> >> 
> >> ingenic_drm_crtc_update_timings(struct ingenic_drm *priv,
> >> 
> >>          regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
> >>                             JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16,
> >>                             JZ_LCD_CTRL_OFUP | JZ_LCD_CTRL_BURST_16);
> >>  
> >>  +
> >>  +       regmap_write(priv->map, JZ_REG_LCD_IPUR, JZ_LCD_IPUR_IPUREN
> >>  +                    (ht * vpe / 3) << JZ_LCD_IPUR_IPUR_LSB);
> > 
> > This hunk also indicates that it may be better to merge the IPU within
> > the existing driver.
> 
> This writes the IPUR register of the CRTC, nothing wrong here.

Since I noticed it in the above patch details, I think the mask when updating 
the burst setting in the LCD_CTRL register should - in general - involve 
multiple bits, since the BST field is 3 bits wide on the JZ4780 and 2 bits 
wide on earlier products. Just setting BURST_16 (0b10) could potentially 
enable BURST_32 (0b11) or other field values that are not explicitly defined.

Hope this is useful!

Paul
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
