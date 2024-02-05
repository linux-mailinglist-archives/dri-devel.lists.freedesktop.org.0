Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E68849497
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 08:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A34710EE75;
	Mon,  5 Feb 2024 07:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WSJRT/3S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF3D10EE75
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 07:35:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (99.141-128-109.adsl-dyn.isp.belgacom.be [109.128.141.99])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 94C24667;
 Mon,  5 Feb 2024 08:33:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707118438;
 bh=TPAhRfZNvGXB/DBnRhVN6DN8EMYWbqn2NG2XnBRmiZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WSJRT/3StG+O7Jz2pKyDnebcgjnslPoTgBbloAtiqlGXMR7S3xmlsydsn/T3NlrEM
 NpZQIZ5jWwnrUHlFK7NOgVxX4G1GYCzL/++6NkwZeCArXaJovYBVVLKFCVRYmaiqz8
 8YviHml3Asllhr1nRtqC7qS2iVvI2PIAgNmBQxc8=
Date: Mon, 5 Feb 2024 09:35:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] drm: xlnx: zynqmp_dpsub: Filter interrupts
 against mask
Message-ID: <20240205073522.GG6804@pendragon.ideasonboard.com>
References: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
 <20240124025402.373620-5-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240124025402.373620-5-anatoliy.klymenko@amd.com>
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

Hi Anatoliy,

Thank you for the patch.

On Tue, Jan 23, 2024 at 06:54:01PM -0800, Anatoliy Klymenko wrote:
> Filter out status register against the interrupts' mask.
> 
> Some events are being reported via DP status register, even if
> corresponding interrupts have been disabled. One instance of such event
> leads to generation of VBLANK when the driver is in DRM bridge mode,
> which in turn results in NULL pointer dereferencing. We should avoid
> processing such events in an interrupt handler context.
> 
> This problem is less noticeable when the driver operates in DMA mode, as
> in this case we have DRM CRTC object instantiated and DRM framework
> simply discards unwanted VBLANKs in drm_handle_vblank().
> 
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 5a3335e1fffa..9f48e5bbcdec 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1627,7 +1627,14 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
>  	/* clear status register as soon as we read it */
>  	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
>  	mask = zynqmp_dp_read(dp, ZYNQMP_DP_INT_MASK);
> -	if (!(status & ~mask))
> +
> +	/*
> +	 * Status register may report some events, which corresponding interrupts
> +	 * have been disabled. Filter out those events against interrupts' mask.
> +	 */
> +	status &= ~mask;
> +
> +	if (!status)
>  		return IRQ_NONE;
>  
>  	/* dbg for diagnostic, but not much that the driver can do */

-- 
Regards,

Laurent Pinchart
