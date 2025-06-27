Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDF5AEBEFA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 20:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF6210EA7E;
	Fri, 27 Jun 2025 18:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rJbrk4P6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D184A10EA77
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 18:19:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C5B137E1;
 Fri, 27 Jun 2025 20:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1751048355;
 bh=L/+t4B4UqPiFs6T06MKpbhooF8vPcuC8n5LJInGuFco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rJbrk4P66V18UpgBMooaWv0cZM4+Zdhe7sgeSwp88RQwWuNBkJ5xgn4X7P9MfZcKi
 5n20lyYZCTqd2I3sLszoEl5mv8MLCusU2QsRdbokim1Gal6xtSrzdvrIZk93KmptB/
 aHX62hVwhA97ZmoPRiXhfBzpKa8vzFTxwOwD1Vmg=
Date: Fri, 27 Jun 2025 21:19:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250627181911.GF24912@pendragon.ideasonboard.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627145058.6880-1-mike.looijmans@topic.nl>
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

Hi Mike,

Thank you for the patch.

On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> XRGB8888 is the default mode that Xorg will want to use. Add support
> for this to the Zynqmp DisplayPort driver, so that applications can use
> 32-bit framebuffers. This solves that the X server would fail to start
> unless one provided an xorg.conf that sets DefaultDepth to 16.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 80d1e499a18d..501428437000 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>  		.swap		= true,
>  		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XRGB8888,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> +		.swap		= true,
> +		.sf		= scaling_factors_888,

I'm afraid that's not enough. There's a crucial difference between
DRM_FORMAT_ARGB8888 (already supported by this driver) and
DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
The graphics layer is blended on top of the video layer, and the blender
uses both a global alpha parameter and the alpha channel of the graphics
layer for 32-bit RGB formats. This will lead to incorrect operation when
the 'X' component is not set to full opacity.

>  	}, {
>  		.drm_fmt	= DRM_FORMAT_RGBA8888,
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,

-- 
Regards,

Laurent Pinchart
