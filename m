Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4FC909F4A
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2024 20:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158E910E0D6;
	Sun, 16 Jun 2024 18:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kg9coJpW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D16C10E0D6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 18:43:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBFB1581;
 Sun, 16 Jun 2024 20:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718563411;
 bh=TWBxG3KAFkYqCXEnV2s67ZEnGQPNxe89WFXEwY7DKAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kg9coJpWTq8YBlLSPw9hcqo5W4UHRpwF9TauQ88F6VGFJmUgLwYJzhEOy7YcXL4bs
 tNi0AJV1aSzEdQqNE4eN/XJBO6FO0BsI5Azlxe1mFPZYXwwebf6PeuSNeOUGtUqsbO
 DRSOHn5PNgLiC7vH3z6zcIq/9z5m15vkAG4ZSGCQ=
Date: Sun, 16 Jun 2024 21:43:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm: zynqmp_dpsub: Fix an error handling path in
 zynqmp_dpsub_probe()
Message-ID: <20240616184326.GC7378@pendragon.ideasonboard.com>
References: <974d1b062d7c61ee6db00d16fa7c69aa1218ee02.1716198025.git.christophe.jaillet@wanadoo.fr>
 <5288867f-ee45-4930-bde0-14b24b878181@linux.dev>
 <120ffe3c-0240-4f93-a220-e0df565bcdbf@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <120ffe3c-0240-4f93-a220-e0df565bcdbf@linux.dev>
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

On Thu, Jun 13, 2024 at 11:05:01AM -0400, Sean Anderson wrote:
> On 5/20/24 11:05, Sean Anderson wrote:
> > On 5/20/24 05:40, Christophe JAILLET wrote:
> >> If zynqmp_dpsub_drm_init() fails, we must undo the previous
> >> drm_bridge_add() call.
> >> 
> >> Fixes: be3f3042391d ("drm: zynqmp_dpsub: Always register bridge")
> >> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >> ---
> >> Compile tested only
> >> ---
> >>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >> 
> >> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> >> index face8d6b2a6f..f5781939de9c 100644
> >> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> >> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> >> @@ -269,6 +269,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
> >>  	return 0;
> >>  
> >>  err_disp:
> >> +	drm_bridge_remove(dpsub->bridge);
> >>  	zynqmp_disp_remove(dpsub);
> >>  err_dp:
> >>  	zynqmp_dp_remove(dpsub);
> > 
> > Reviewed-by: Sean Anderson <sean.anderso@linux.dev>
> 
> Will this be applied soon? The patch it fixes has made its way into
> the stable tree already.

If someone can merge it in drm-misc that would be the fastest way.
Otherwise I'll send a pull request at some point, but I'm overworked at
the moment.

-- 
Regards,

Laurent Pinchart
