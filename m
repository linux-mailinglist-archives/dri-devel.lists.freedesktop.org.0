Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30981A2C8F5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 17:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8991410EB77;
	Fri,  7 Feb 2025 16:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qs3BCIO9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B09E10EB77
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 16:33:25 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 436442BA;
 Fri,  7 Feb 2025 17:32:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1738945929;
 bh=N2uS9yWPLD4E6ZHEuCHhrIKMkX02v4Rz8ruwE/3Kq40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qs3BCIO9noT5nVvOJY1+N8hSoVlybPDgYi+8fhLhLTLdudUtUI9LGIaNlkX0IfTGI
 nQE9OAUWaj2ccAfl6PV6vBnjK4pqeYLt4XtjtVj0uTEkrGbhFaCxKP1hNNWUF9mKAM
 RnQKXWodw5LuGpOKWkH3ffHekxGcesVWrYcf58bQ=
Date: Fri, 7 Feb 2025 18:33:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "open list:DRM DRIVERS FOR XILINX" <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bart Van Assche <bvanassche@acm.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] drm: zynqmp_dp: Fix a deadlock in
 zynqmp_dp_ignore_hpd_set()
Message-ID: <20250207163317.GA5869@pendragon.ideasonboard.com>
References: <20250207162528.1651426-1-sean.anderson@linux.dev>
 <20250207162528.1651426-2-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207162528.1651426-2-sean.anderson@linux.dev>
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

Hi Sean, Bart,

Thank you for the patch.

On Fri, Feb 07, 2025 at 11:25:27AM -0500, Sean Anderson wrote:
> From: Bart Van Assche <bvanassche@acm.org>
> 
> Instead of attempting the same mutex twice, lock and unlock it.
> 
> This bug has been detected by the Clang thread-safety analyzer.
> 
> Cc: Sean Anderson <sean.anderson@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: 28edaacb821c ("drm: zynqmp_dp: Add debugfs interface for compliance testing")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Sean Anderson <sean.anderson@linux.dev>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 979f6d3239ba..189a08cdc73c 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2295,7 +2295,7 @@ static int zynqmp_dp_ignore_hpd_set(void *data, u64 val)
>  
>  	mutex_lock(&dp->lock);
>  	dp->ignore_hpd = val;
> -	mutex_lock(&dp->lock);
> +	mutex_unlock(&dp->lock);
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart
