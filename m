Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF3F90A8DE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 11:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0C010E049;
	Mon, 17 Jun 2024 08:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bubVsi3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AD510E049
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 08:59:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C65CE2D5;
 Mon, 17 Jun 2024 10:59:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1718614779;
 bh=Glz+Xgpaku4DZHOwAqdMTYptGC/CqsWlvIDpZMM2rwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bubVsi3cVQbGZ9ffNBbQNIK48dnxJxtbHHmPD8+WIWUj2OaZKiT06RL2Re8E7Qyig
 DwO3N7wEJRRL5m6oC9aEaMOhzrxTPyC2BkSPEkoXpwMpYorFMHMV+u8Is9cUyrZDu0
 FVW4l8EvXp+j7Xhdr2nf7KtirJZdMd9ed8YddQVM=
Date: Mon, 17 Jun 2024 11:59:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Sean Anderson <sean.anderson@linux.dev>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm: zynqmp_dpsub: Fix an error handling path in
 zynqmp_dpsub_probe()
Message-ID: <20240617085934.GF30324@pendragon.ideasonboard.com>
References: <974d1b062d7c61ee6db00d16fa7c69aa1218ee02.1716198025.git.christophe.jaillet@wanadoo.fr>
 <5288867f-ee45-4930-bde0-14b24b878181@linux.dev>
 <120ffe3c-0240-4f93-a220-e0df565bcdbf@linux.dev>
 <20240616184326.GC7378@pendragon.ideasonboard.com>
 <88cbb88a-34de-4f97-9035-b3ef630580ed@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <88cbb88a-34de-4f97-9035-b3ef630580ed@ideasonboard.com>
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

On Mon, Jun 17, 2024 at 10:43:44AM +0300, Tomi Valkeinen wrote:
> On 16/06/2024 21:43, Laurent Pinchart wrote:
> > On Thu, Jun 13, 2024 at 11:05:01AM -0400, Sean Anderson wrote:
> >> On 5/20/24 11:05, Sean Anderson wrote:
> >>> On 5/20/24 05:40, Christophe JAILLET wrote:
> >>>> If zynqmp_dpsub_drm_init() fails, we must undo the previous
> >>>> drm_bridge_add() call.
> >>>>
> >>>> Fixes: be3f3042391d ("drm: zynqmp_dpsub: Always register bridge")
> >>>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >>>> ---
> >>>> Compile tested only
> >>>> ---
> >>>>   drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 1 +
> >>>>   1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> >>>> index face8d6b2a6f..f5781939de9c 100644
> >>>> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> >>>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
> >>>> @@ -269,6 +269,7 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
> >>>>   	return 0;
> >>>>   
> >>>>   err_disp:
> >>>> +	drm_bridge_remove(dpsub->bridge);
> >>>>   	zynqmp_disp_remove(dpsub);
> >>>>   err_dp:
> >>>>   	zynqmp_dp_remove(dpsub);
> >>>
> >>> Reviewed-by: Sean Anderson <sean.anderso@linux.dev>
> >>
> >> Will this be applied soon? The patch it fixes has made its way into
> >> the stable tree already.
> > 
> > If someone can merge it in drm-misc that would be the fastest way.
> > Otherwise I'll send a pull request at some point, but I'm overworked at
> > the moment.
> 
> Thanks, I have pushed this to drm-misc-next.

Thank you Tomi, much appreciated.

-- 
Regards,

Laurent Pinchart
