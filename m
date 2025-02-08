Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEA8A2D695
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 15:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FE910E3D3;
	Sat,  8 Feb 2025 14:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ENXDSNgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547B810E3D3
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 14:21:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A183E82A;
 Sat,  8 Feb 2025 15:20:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1739024418;
 bh=WU+sOOHT6k3K6YZ/b2hxBHd5CiMb8fuXeIQVlDyaYqo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ENXDSNgV2OV6z8Bh46vXfQTGd1/4d0TTteGN95QOS4Lisju1Ypra8p+rdujk3Qq6O
 9IPuwEzFjfx9Dh6f7Z32a504X0Q3Z6PATh+To2SqdD+X1yCidysPhxMe+Qj/0FULVH
 xoEfMavuBYbegzpFwXLVwF0qFGERRa7UcD8OnM28=
Date: Sat, 8 Feb 2025 16:21:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, michal.simek@amd.com, vishal.sagar@amd.com,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: Add NULL check in
 zynqmp_audio_init
Message-ID: <20250208142125.GC21843@pendragon.ideasonboard.com>
References: <20250208100323.11625-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250208100323.11625-1-hanchunchao@inspur.com>
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

Hi Charles,

Thank you for the patch.

On Sat, Feb 08, 2025 at 06:03:22PM +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure,but this

s/but/ but/

> returned value in zynqmp_audio_init() is not checked.
> Add NULL check in zynqmp_audio_init(), to handle kernel NULL
> pointer dereference error.
> 
> Fixes: 3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> index fa5f0ace6084..f07ff4eb3a6d 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> @@ -323,12 +323,16 @@ int zynqmp_audio_init(struct zynqmp_dpsub *dpsub)
>  
>  	audio->dai_name = devm_kasprintf(dev, GFP_KERNEL,
>  					 "%s-dai", dev_name(dev));
> +	if (!audio->dai_name)
> +		return -ENOMEM;
>  
>  	for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
>  		audio->link_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>  						      "%s-dp-%u", dev_name(dev), i);
>  		audio->pcm_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>  						     "%s-pcm-%u", dev_name(dev), i);
> +		if (!audio->link_names[i] || !audio->pcm_names[i])
> +			return -ENOMEM;
>  	}
>  
>  	audio->base = devm_platform_ioremap_resource_byname(pdev, "aud");

-- 
Regards,

Laurent Pinchart
