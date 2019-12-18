Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97032123CA2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 02:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242796E21A;
	Wed, 18 Dec 2019 01:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0897E6E21A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 01:45:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6872933B;
 Wed, 18 Dec 2019 02:45:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576633556;
 bh=Tqqiv4vhRT1LK4REtPSSVZsb7hGqh5bTc5eFX0LJD08=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uKzkcVvd2Sftd6aCY2/5D1jLdnShv8oAvq5lOyT2B/niVegDQZSlhZiWZz00uZuuH
 H6txATpvwICuj+RMj29wftmhLNJK7Qxg7G4m4X+MUM1SPGek/pIJmoyPwYn+7UI5Yl
 vYLtD1HiW8fq9iUnHEastbgu4F4cLzQ53+5avTQE=
Date: Wed, 18 Dec 2019 03:45:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@iki.fi>
Subject: Re: [PATCH v3 11/50] drm/bridge: Add bridge driver for display
 connectors
Message-ID: <20191218014545.GK4874@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-12-laurent.pinchart@ideasonboard.com>
 <61bdedd0-6d88-7e1a-8229-18790439ed9d@iki.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <61bdedd0-6d88-7e1a-8229-18790439ed9d@iki.fi>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Mon, Dec 16, 2019 at 03:11:23PM +0200, Tomi Valkeinen wrote:
> On 11/12/2019 00:57, Laurent Pinchart wrote:
> > Display connectors are modelled in DT as a device node, but have so far
> > been handled manually in several bridge drivers. This resulted in
> > duplicate code in several bridge drivers, with slightly different (and
> > thus confusing) logics.
> > 
> > In order to fix this, implement a bridge driver for display connectors.
> > The driver centralises logic for the DVI, HDMI, VGAn composite and
> > S-video connectors and exposes corresponding bridge operations.
> > 
> > This driver in itself doesn't solve the issue completely, changes in
> > bridge and display controller drivers are needed to make use of the new
> > connector driver.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > ---
> > Changes since v2:
> > 
> > - Fall back to polling if the GPIO IRQ chip doesn't support
> >    edge-triggered interrupts
> > 
> > Changes since v1:
> > 
> > - Use drm_get_connector_type_name() instead of open-coding
> >    display_connector_type_name()
> > - Remove empty .hpd_enable() and .hpd_disable() operations
> > - Set bridge.ddc
> > ---
> >   drivers/gpu/drm/bridge/Kconfig             |  11 +
> >   drivers/gpu/drm/bridge/Makefile            |   1 +
> >   drivers/gpu/drm/bridge/display-connector.c | 292 +++++++++++++++++++++
> >   3 files changed, 304 insertions(+)
> >   create mode 100644 drivers/gpu/drm/bridge/display-connector.c
> 
> <snip>
> 
> > +	dev_info(&pdev->dev,
> > +		 "Found %s display connector '%s' %s DDC bus and %s HPD GPIO (ops 0x%x)\n",
> > +		 drm_get_connector_type_name(conn->bridge.type),
> > +		 conn->label ? conn->label : "<unlabelled>",
> > +		 conn->bridge.ddc ? "with" : "without",
> > +		 conn->hpd_gpio ? "with" : "without",
> > +		 conn->bridge.ops);
> 
> On AM5 EVM, we have HDMI output with DDC and HPD, but I get a kernel print:
> 
> display-connector connector: Found HDMI-A display connector 'hdmi' without DDC bus and without HPD 
> GPIO (ops 0x0)
> 
> I think that print may be quite confusing for someone who doesn't know the details of the drivers 
> involved.

I agree, but the information could be useful for developers. Do you
think it should be dropped ? Or do you have an alternative wording to
propose ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
