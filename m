Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229B2849494
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 08:34:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D210410ED4C;
	Mon,  5 Feb 2024 07:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ipqLXaQg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390BF10ECC2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 07:33:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (99.141-128-109.adsl-dyn.isp.belgacom.be [109.128.141.99])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B050667;
 Mon,  5 Feb 2024 08:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707118353;
 bh=PZulMIJuh1ibi1SJPAkqcIgNNrCSO8cnnWgsWRmhjP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ipqLXaQgog05Sd3Q4T6o8mINsn1EkTkQoJ9Hc55qxirusJr+cd2dIo4pKwdmDhU81
 L9OSMcFCeIuyiHtiSdvw6vmDpSy5DfNYNJ6OxoC/daKEwI6Q1d3I/phfIuR5fL9i8B
 nhnzkgzeNN6gzrrRhV2b0FfKsLcL54U2MHKYuxnQ=
Date: Mon, 5 Feb 2024 09:33:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/5] drm: xlnx: zynqmp_dpsub: Clear status register ASAP
Message-ID: <20240205073357.GF6804@pendragon.ideasonboard.com>
References: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
 <20240124025402.373620-4-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240124025402.373620-4-anatoliy.klymenko@amd.com>
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

On Tue, Jan 23, 2024 at 06:54:00PM -0800, Anatoliy Klymenko wrote:
> Clear status register as soon as we read it.
> 
> Addressing comments from
> https://lore.kernel.org/dri-devel/beb551c7-bb7e-4cd0-b166-e9aad90c4620@ideasonboard.com/
> 
> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index d60b7431603f..5a3335e1fffa 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -1624,6 +1624,8 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
>  	u32 status, mask;
>  
>  	status = zynqmp_dp_read(dp, ZYNQMP_DP_INT_STATUS);
> +	/* clear status register as soon as we read it */

I don't think a comment is strictly required, but I don't mind it.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
>  	mask = zynqmp_dp_read(dp, ZYNQMP_DP_INT_MASK);
>  	if (!(status & ~mask))
>  		return IRQ_NONE;
> @@ -1634,8 +1636,6 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
>  	if (status & ZYNQMP_DP_INT_CHBUF_OVERFLW_MASK)
>  		dev_dbg_ratelimited(dp->dev, "overflow interrupt\n");
>  
> -	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
> -
>  	if (status & ZYNQMP_DP_INT_VBLANK_START)
>  		zynqmp_dpsub_drm_handle_vblank(dp->dpsub);
>  

-- 
Regards,

Laurent Pinchart
