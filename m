Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 478271F0904
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 01:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638936E0E9;
	Sat,  6 Jun 2020 23:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7EB6E0E9
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jun 2020 23:02:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB1C230D;
 Sun,  7 Jun 2020 01:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1591484538;
 bh=NH97upxs8ffzweoZEJhZBPjM2YAckzbZww8EbnXl2Ec=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wdU3hMYst6T2XoigAbS7Lpbo4gg26km1SkQuyzFgXGdnpHXDxeCFMGl52tnreNU+g
 WFByuoNCPaMFuwyOAYUXMSP4IbiOPT7yc3wJvQ+XQg/IDy2sk33M3ogJhTY2kYhKp1
 CzWd22iuZzoad7JpTKvZQ0xQucIFdEfQyeaZemEs=
Date: Sun, 7 Jun 2020 02:01:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 20/22] drm: mxsfb: Merge mxsfb_set_pixel_fmt() and
 mxsfb_set_bus_fmt()
Message-ID: <20200606230159.GM7339@pendragon.ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-21-laurent.pinchart@ideasonboard.com>
 <CACvgo51QNp745AKkW6CqEUGQ=Jx9v4hqp3YguZpVmvZWwx9y2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51QNp745AKkW6CqEUGQ=Jx9v4hqp3YguZpVmvZWwx9y2g@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

On Fri, Jun 05, 2020 at 03:58:53PM +0100, Emil Velikov wrote:
> Hi Laurent,
> 
> With the previous disclaimer in mind, the series is:
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Sorry, which disclaimer is that ?

> There's a small suggestion inline, for future work.
> 
> On Sat, 30 May 2020 at 04:11, Laurent Pinchart wrote:
> 
> >         switch (bus_format) {
> >         case MEDIA_BUS_FMT_RGB565_1X16:
> > -               reg |= CTRL_BUS_WIDTH_16;
> > +               ctrl |= CTRL_BUS_WIDTH_16;
> >                 break;
> >         case MEDIA_BUS_FMT_RGB666_1X18:
> > -               reg |= CTRL_BUS_WIDTH_18;
> > +               ctrl |= CTRL_BUS_WIDTH_18;
> >                 break;
> >         case MEDIA_BUS_FMT_RGB888_1X24:
> > -               reg |= CTRL_BUS_WIDTH_24;
> > +               ctrl |= CTRL_BUS_WIDTH_24;
> >                 break;
> >         default:
> >                 dev_err(drm->dev, "Unknown media bus format %d\n", bus_format);
> >                 break;
> 
> Off the top of my head, the default case should be handled in the
> atomic_check() hook.
> That is, unless I'm missing something and one can change the bus
> format in between atomic_check() and atomic_enable(). Which would
> sound like a very odd thing to do.

I agree, this should go to the atomic check. There are still quite a few
things to improve in this driver, one step at a time :-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
