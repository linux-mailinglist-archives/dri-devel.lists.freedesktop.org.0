Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D06F1430B4E
	for <lists+dri-devel@lfdr.de>; Sun, 17 Oct 2021 19:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78C96E54C;
	Sun, 17 Oct 2021 17:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F316E54C
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Oct 2021 17:52:50 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 0bdd3bd3-2f73-11ec-9c3f-0050568c148b;
 Sun, 17 Oct 2021 17:52:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 74A53194B21;
 Sun, 17 Oct 2021 19:52:56 +0200 (CEST)
Date: Sun, 17 Oct 2021 19:52:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 Daniel Abrecht <public@danielabrecht.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH] drm: mxsfb: Fix NULL pointer dereference crash on unload
Message-ID: <YWxi7oc56nKU2OzF@ravnborg.org>
References: <20210907024900.873850-1-marex@denx.de>
 <YTj/1EIdhQ3245VW@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTj/1EIdhQ3245VW@phenom.ffwll.local>
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

Hi Marek,

On Wed, Sep 08, 2021 at 08:24:20PM +0200, Daniel Vetter wrote:
> On Tue, Sep 07, 2021 at 04:49:00AM +0200, Marek Vasut wrote:
> > The mxsfb->crtc.funcs may already be NULL when unloading the driver,
> > in which case calling mxsfb_irq_disable() via drm_irq_uninstall() from
> > mxsfb_unload() leads to NULL pointer dereference.
> > 
> > Since all we care about is masking the IRQ and mxsfb->base is still
> > valid, just use that to clear and mask the IRQ.
> > 
> > Fixes: ae1ed00932819 ("drm: mxsfb: Stop using DRM simple display pipeline helper")
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Daniel Abrecht <public@danielabrecht.ch>
> > Cc: Emil Velikov <emil.l.velikov@gmail.com>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Stefan Agner <stefan@agner.ch>
> 
> You probably want a drm_atomic_helper_shutdown instead of trying to do all
> that manually. We've also added a bunch more devm and drmm_ functions to
> automate the cleanup a lot more here, e.g. your drm_mode_config_cleanup is
> in the wrong place.

I have applied v2 of this patch today - but failed to see any response
in v2 to this comment from Daniel. Was it lost somehow?

	Sam
