Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9589A984B37
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 20:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AAF10E12E;
	Tue, 24 Sep 2024 18:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ICCYT+6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1A710E12E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 18:44:08 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38642C8E;
 Tue, 24 Sep 2024 20:42:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1727203360;
 bh=K4ipj/F3NB0jOguIlNsqwGp8ZR4U5A/NO4flIB98um4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ICCYT+6ThZOw3owTfXdSqxF4IZSxMyxUJLLDOtHbdWlQ4IVSqIrqKPdQrMWq/a143
 0mTCvwf7SNgIOb1+Ry2g6nYPg9zAedDLXWbZoK6rBzc4zCZ7EAnbCVTjF2TFtitSvc
 lsAg/yUVTQEXGCqLXcxNeOxiVqnvugcO6Pxl+6ic=
Date: Tue, 24 Sep 2024 21:43:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: lists@steffen.cc
Cc: dri-devel@lists.freedesktop.org,
 Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: also call
 drm_helper_hpd_irq_event
Message-ID: <20240924184335.GJ30551@pendragon.ideasonboard.com>
References: <20240923074803.10306-1-lists@steffen.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923074803.10306-1-lists@steffen.cc>
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

Hi Steffen,

Thank you for the patch.

On Mon, Sep 23, 2024 at 09:48:03AM +0200, lists@steffen.cc wrote:
> From: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> 
> With hpd going through the bridge as of commit eb2d64bfcc17
> ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
> we don't get hotplug events in userspace on zynqmp hardware.
> Also sending hotplug events with drm_helper_hpd_irq_event works.

Why does the driver need to call both drm_helper_hpd_irq_event() and
drm_bridge_hpd_notify() ? The latter should end up calling
drm_kms_helper_connector_hotplug_event(), which is the same function
that drm_helper_hpd_irq_event() calls.

> Fixes: eb2d64bfcc17 ("drm: xlnx: zynqmp_dpsub: Report HPD through the bridge")
> Signed-off-by: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 1846c4971fd8..cb823540a412 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -17,6 +17,7 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_modes.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> @@ -1614,6 +1615,9 @@ static void zynqmp_dp_hpd_work_func(struct work_struct *work)
>  					    hpd_work.work);
>  	enum drm_connector_status status;
>  
> +	if (dp->bridge.dev)
> +		drm_helper_hpd_irq_event(dp->bridge.dev);
> +
>  	status = zynqmp_dp_bridge_detect(&dp->bridge);
>  	drm_bridge_hpd_notify(&dp->bridge, status);
>  }

-- 
Regards,

Laurent Pinchart
