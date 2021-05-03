Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B82371418
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 13:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F686E8A7;
	Mon,  3 May 2021 11:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B35E6E8A7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 11:16:08 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id C4DC2809F;
 Mon,  3 May 2021 11:16:08 +0000 (UTC)
Date: Mon, 3 May 2021 14:16:04 +0300
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YI/bdLkwtUNFKHyW@atomide.com>
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
 <YIo6CzsU4JRvAdpb@atomide.com>
 <79bea9b8-b2d2-11ec-87a3-34626347e122@ideasonboard.com>
 <YI/UXqQbvdtC2HqI@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YI/UXqQbvdtC2HqI@atomide.com>
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
Cc: linux-omap@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

* Tony Lindgren <tony@atomide.com> [210503 10:45]:
> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210503 08:04]:
> > On 29/04/2021 07:46, Tony Lindgren wrote:
> > > Decoupling the system suspend and resume from PM runtime calls for
> > > all the other dss components should still also be done IMO. But that
> > > can be done as a separate clean-up patches after we have fixed the
> > > $subject issue.
> > 
> > I don't think I still really understand why all this is needed. I mean,
> > obviously things don't work correctly at the moment, so maybe this patch can
> > be applied to fix the system suspend. But it just feels like a big hack (the
> > current pm_runtime_force_suspend/resume work-around feels like a big hack
> > too).
> 
> Well omapdrm is not handling the -EBUSY error during system resume.

Or rather something on the resume path is not handling and cannot handle
-EBUSY. And sounds like the reason is..

> > Slightly off topic, but I just noticed that we're using runtime_put_sync for
> > some reason. Found 0eaf9f52e94f756147dbfe1faf1f77a02378dbf9. I've been
> > fighting with system suspend for a long time =).
> > 
> > I wonder if using non-sync version would remove the EBUSY problem...
> 
> Worth trying, but it will only help if the -EBUSY error from
> pm_runtime_put() is handled somewhere for a retry..

..the use of pm_runtime_put_sync() like you suggested. I did a quick
test with the minimal change below and that works :) Seems like that's
probably the best minimal fix for the -rc cycle.

Regards,

Tony

8< ----------------
diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -664,7 +664,7 @@ void dispc_runtime_put(struct dispc_device *dispc)
 
 	DSSDBG("dispc_runtime_put\n");
 
-	r = pm_runtime_put_sync(&dispc->pdev->dev);
+	r = pm_runtime_put(&dispc->pdev->dev);
 	WARN_ON(r < 0 && r != -ENOSYS);
 }
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
