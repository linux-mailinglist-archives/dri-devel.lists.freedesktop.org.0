Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6179E0F4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 09:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00DA310E473;
	Wed, 13 Sep 2023 07:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id B9B6C10E473
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 07:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id E3D438088;
 Wed, 13 Sep 2023 07:37:56 +0000 (UTC)
Date: Wed, 13 Sep 2023 10:37:55 +0300
From: Tony Lindgren <tony@atomide.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/omap: dsi: Fix deferred probe warnings
Message-ID: <20230913073755.GE5285@atomide.com>
References: <20230412073954.20601-1-tony@atomide.com>
 <20230412085044.GP11253@pendragon.ideasonboard.com>
 <2bf56c04-733b-24a5-a344-166a94cd51f7@ideasonboard.com>
 <20230412085926.GR11253@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412085926.GR11253@pendragon.ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Laurent Pinchart <laurent.pinchart@ideasonboard.com> [230412 11:59]:
> On Wed, Apr 12, 2023 at 11:55:34AM +0300, Tomi Valkeinen wrote:
> > On 12/04/2023 11:50, Laurent Pinchart wrote:
> > > Hi Tony,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Wed, Apr 12, 2023 at 10:39:53AM +0300, Tony Lindgren wrote:
> > >> We may not have dsi->dsidev initialized during probe, and that can
> > >> lead into various dsi related warnings as omap_dsi_host_detach() gets
> > >> called with dsi->dsidev set to NULL.
> > >>
> > >> The warnings can be "Fixed dependency cycle(s)" followed by a
> > >> WARNING: CPU: 0 PID: 787 at drivers/gpu/drm/omapdrm/dss/dsi.c:4414.
> > > 
> > > How can this happen ? I assume .detach() can't be called without a
> > > priori successful call to .attach(), that that sets dsi->dsidev.
> > 
> > I had a quick look, and the driver calls mipi_dsi_host_register() in 
> > probe, and mipi_dsi_host_unregister() in remove.
> > 
> > mipi_dsi_host_unregister() always calls mipi_dsi_detach(), but I don't 
> > think mipi_dsi_host_register() always calls attach, which happens later 
> > when the peripheral probes.
> 
> Is this something that should be addressed in the DRM MIPI DSI helpers,
> to only detach after an attach ?

Tomi, any comments on detach after attach?

Regards,

Tony

> > >> Let's fix the warnings by checking for a valid dsi->dsidev.
> > >>
> > >> Signed-off-by: Tony Lindgren <tony@atomide.com>
> > >> ---
> > >>   drivers/gpu/drm/omapdrm/dss/dsi.c | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > >> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> > >> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> > >> @@ -4411,7 +4411,7 @@ static int omap_dsi_host_detach(struct mipi_dsi_host *host,
> > >>   {
> > >>   	struct dsi_data *dsi = host_to_omap(host);
> > >>   
> > >> -	if (WARN_ON(dsi->dsidev != client))
> > >> +	if (dsi->dsidev && WARN_ON(dsi->dsidev != client))
> > >>   		return -EINVAL;
> > >>   
> > >>   	cancel_delayed_work_sync(&dsi->dsi_disable_work);
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 
