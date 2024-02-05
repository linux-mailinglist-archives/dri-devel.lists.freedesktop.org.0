Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8120849514
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365E9112440;
	Mon,  5 Feb 2024 08:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RifFOAdx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AF311242A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 08:08:24 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (99.141-128-109.adsl-dyn.isp.belgacom.be [109.128.141.99])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2835A667;
 Mon,  5 Feb 2024 09:07:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707120421;
 bh=RJo0jMGfwLG8I+tsPvz5m11NBRG+h8zzgj5Z6Oy0ums=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RifFOAdxtCkdaa1VnsMD2TKrpOXLsevtEoZrISrDE8BOLghB4ZQw67j6xdSDDR8tl
 e2v2utQyFZh5cuAnWxOg8A2OW9Z/OAkyPy87HEEsEnVDSjvM8cTqpm9cv6d2PjUJGW
 msEUCKaAZQdVYF4vKyhVXTNMlaM/GD7HLK+drWvg=
Date: Mon, 5 Feb 2024 10:08:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] drm: xlnx: zynqmp_dpsub: Fix timing for live mode
Message-ID: <20240205080824.GH6804@pendragon.ideasonboard.com>
References: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
 <20240124025402.373620-3-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240124025402.373620-3-anatoliy.klymenko@amd.com>
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

On Tue, Jan 23, 2024 at 06:53:59PM -0800, Anatoliy Klymenko wrote:
> Expect external video timing in live video input mode, program
> DPSUB acordingly.

Are there no designs where the DPSUB operates in non-live mode, but uses
a video clock from the PL, for instance to use a different clock
frequency ?

I don't think that use case is very common, so I'm fine with this patch
in order to properly support the more common use case of live input, and
leave the PL clock without live input use case for later.

> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 

No need for a blank line here.

> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 407bc07cec69..8a39b3accce5 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1166,7 +1166,7 @@ void zynqmp_disp_enable(struct zynqmp_disp *disp)
>  	/* Choose clock source based on the DT clock handle. */
>  	zynqmp_disp_avbuf_set_clocks_sources(disp, disp->dpsub->vid_clk_from_ps,
>  					     disp->dpsub->aud_clk_from_ps,
> -					     true);
> +					     disp->dpsub->vid_clk_from_ps);
>  	zynqmp_disp_avbuf_enable_channels(disp);
>  	zynqmp_disp_avbuf_enable_audio(disp);
>  

-- 
Regards,

Laurent Pinchart
