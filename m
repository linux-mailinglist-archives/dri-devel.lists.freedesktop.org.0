Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7793371523
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 14:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5CB6E8A9;
	Mon,  3 May 2021 12:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8B62F6E8A9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 12:18:01 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 302F8809F;
 Mon,  3 May 2021 12:18:02 +0000 (UTC)
Date: Mon, 3 May 2021 15:17:57 +0300
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCHv2] drm/omap: Fix issue with clocks left on after resume
Message-ID: <YI/p9Trr5tphov6q@atomide.com>
References: <20210428092500.23521-1-tony@atomide.com>
 <YIlsy4mOkLcbMKwr@pendragon.ideasonboard.com>
 <YIo6CzsU4JRvAdpb@atomide.com>
 <79bea9b8-b2d2-11ec-87a3-34626347e122@ideasonboard.com>
 <YI/UXqQbvdtC2HqI@atomide.com> <YI/bdLkwtUNFKHyW@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YI/bdLkwtUNFKHyW@atomide.com>
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

* Tony Lindgren <tony@atomide.com> [210503 11:16]:
> ..the use of pm_runtime_put_sync() like you suggested. I did a quick
> test with the minimal change below and that works :) Seems like that's
> probably the best minimal fix for the -rc cycle.

Sorry I was mistaken, the patch below won't help for the omapdrm
PM runtime state on suspend.

I had patch "bus: ti-sysc: Fix am335x resume hang for usb otg module"
applied, and that changes ti-sysc to get rid of the PM runtime calls
during system suspend. The side effect is ti-sysc now ignores the module
PM runtime state on suspend. This is pretty much what _od_suspend_noirq()
was also doing.

I think we still fix the dispc related issue too, otherwise the parent
child_count will just keep increasing on each suspend. I check that
again though.

Regards,


Tony


> 8< ----------------
> diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
> --- a/drivers/gpu/drm/omapdrm/dss/dispc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
> @@ -664,7 +664,7 @@ void dispc_runtime_put(struct dispc_device *dispc)
>  
>  	DSSDBG("dispc_runtime_put\n");
>  
> -	r = pm_runtime_put_sync(&dispc->pdev->dev);
> +	r = pm_runtime_put(&dispc->pdev->dev);
>  	WARN_ON(r < 0 && r != -ENOSYS);
>  }
>  
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
