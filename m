Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB58D79E850
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 14:50:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D38810E4AF;
	Wed, 13 Sep 2023 12:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE45E10E4AF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id EC6FE8088;
 Wed, 13 Sep 2023 12:50:37 +0000 (UTC)
Date: Wed, 13 Sep 2023 15:50:36 +0300
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH] drm/omap: dsi: Fix deferred probe warnings
Message-ID: <20230913125036.GM5285@atomide.com>
References: <20230412073954.20601-1-tony@atomide.com>
 <9daacd2f-0dbf-dddc-9403-b802447896a2@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9daacd2f-0dbf-dddc-9403-b802447896a2@ideasonboard.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [230913 11:59]:
> On 12/04/2023 10:39, Tony Lindgren wrote:
> > We may not have dsi->dsidev initialized during probe, and that can
> > lead into various dsi related warnings as omap_dsi_host_detach() gets
> > called with dsi->dsidev set to NULL.
> > 
> > The warnings can be "Fixed dependency cycle(s)" followed by a
> > WARNING: CPU: 0 PID: 787 at drivers/gpu/drm/omapdrm/dss/dsi.c:4414.
> > 
> > Let's fix the warnings by checking for a valid dsi->dsidev.
> > 
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >   drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > @@ -4411,7 +4411,7 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
> >   {
> >   	struct dsi_data *dsi = host_to_omap(host);
> > -	if (WARN_ON(dsi->dsidev != client))
> > +	if (dsi->dsidev && WARN_ON(dsi->dsidev != client))
> >   		return -EINVAL;
> >   	cancel_delayed_work_sync(&dsi->dsi_disable_work);
> 
> Shouldn't this rather be
> 
> if (!dsi->dsidev)
> 	return 0;
> 
> before the if (WARN_ON(dsi->dsidev != client)) line?
> 
> If dsi->dsidev is NULL, then attach hasn't been called, and we shouldn't do
> anything in the detach callback either.
> 
> With your change we'll end up doing all the work in the detach callback,
> without ever doing their counterpart in the attach side.

Oops, I'll check that thanks.

Tony
