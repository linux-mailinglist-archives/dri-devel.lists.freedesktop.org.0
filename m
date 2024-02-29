Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648A886C479
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 10:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C25110E39F;
	Thu, 29 Feb 2024 09:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NRPAskIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695DC10E358
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 09:05:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8A2AE0C;
 Thu, 29 Feb 2024 10:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1709197496;
 bh=SSDbhD8zVZFFRcHjVzOZVaCFdEnhF7KatMVUSwcuEs8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NRPAskIckbv4heHEGnYwiaIjFpOWFnuMb3N08l/CJLOem6W+lGSxxivE0iXPD9W7/
 QsYT9HEo5UnaE3+jCQ8nwywG0TYBeimV5G140ttSKzQalT/9LC9mEXyjcPVlmBTAKK
 dK7JKXyg0N/6QqeEwWj2QFhVs8pSmiV3ZCp2llkY=
Date: Thu, 29 Feb 2024 11:05:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Rohit Visavalia <rohit.visavalia@amd.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: dp: Reset DisplayPort IP
Message-ID: <20240229090511.GG1659@pendragon.ideasonboard.com>
References: <20240216124043.1226713-1-rohit.visavalia@amd.com>
 <20240228162224.GG9863@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228162224.GG9863@pendragon.ideasonboard.com>
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

Tomi, could you push this through drm-misc ?

On Wed, Feb 28, 2024 at 06:22:25PM +0200, Laurent Pinchart wrote:
> Hello Rohit,
> 
> Thank you for the patch.
> 
> On Fri, Feb 16, 2024 at 04:40:43AM -0800, Rohit Visavalia wrote:
> > Assert DisplayPort reset signal before deasserting,
> > it is to clear out any registers programmed before booting kernel.
> > 
> > Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 1846c4971fd8..5a40aa1d4283 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -1714,6 +1714,10 @@ int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub)
> >  		goto err_free;
> >  	}
> >  
> > +	ret = zynqmp_dp_reset(dp, true);
> > +	if (ret < 0)
> > +		return ret;
> > +
> 
> This looks fine to me, so
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> However, looking at zynqmp_dp_reset(), we have
> 
> static int zynqmp_dp_reset(struct zynqmp_dp *dp, bool assert)
> {
> 	unsigned long timeout;
> 
> 	if (assert)
> 		reset_control_assert(dp->reset);
> 	else
> 		reset_control_deassert(dp->reset);
> 
> 	/* Wait for the (de)assert to complete. */
> 	timeout = jiffies + msecs_to_jiffies(RST_TIMEOUT_MS);
> 	while (!time_after_eq(jiffies, timeout)) {
> 		bool status = !!reset_control_status(dp->reset);
> 
> 		if (assert == status)
> 			return 0;
> 
> 		cpu_relax();
> 	}
> 
> 	dev_err(dp->dev, "reset %s timeout\n", assert ? "assert" : "deassert");
> 	return -ETIMEDOUT;
> }
> 
> That doesn't seem quite right. Aren't reset_control_assert() and
> reset_control_deassert() supposed to be synchronous ? If so there should
> be no need to wait, and if there's a need to wait, it could be a bug in
> the reset controller driver. This should be fixed, and then the code in
> probe could be replaced with a call to reset_control_reset().
> 
> >  	ret = zynqmp_dp_reset(dp, false);
> >  	if (ret < 0)
> >  		goto err_free;

-- 
Regards,

Laurent Pinchart
