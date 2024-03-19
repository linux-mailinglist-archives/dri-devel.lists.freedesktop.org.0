Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E204C87F464
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 01:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C751C10E320;
	Tue, 19 Mar 2024 00:13:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d8BJZS8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4125710E320
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 00:12:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9361A480;
 Tue, 19 Mar 2024 01:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710807151;
 bh=cJWPjHKoew1CHYHZkQVjW2vYHS+pGQpJZuRRjf5H9x4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d8BJZS8iGJKZLVolj7pGRGn48j9q6lDP9SSCup0/hbbzaOQB9ES1z7zUegweh/+O9
 KSI35JwNdPa4FPVBnUBTSMV1ABPNyT33vrycN65BrvNuw//jfx/VPIqUlU3hlPd8Sq
 dsjbTKQhuorbCoxcGGU8yyI07/EcoeSPVtTr7dRM=
Date: Tue, 19 Mar 2024 02:12:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 4/8] drm: xlnx: zynqmp_dpsub: Minimize usage of global
 flag
Message-ID: <20240319001255.GV13682@pendragon.ideasonboard.com>
References: <20240312-dp-live-fmt-v2-0-a9c35dc5c50d@amd.com>
 <20240312-dp-live-fmt-v2-4-a9c35dc5c50d@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240312-dp-live-fmt-v2-4-a9c35dc5c50d@amd.com>
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

On Tue, Mar 12, 2024 at 05:55:01PM -0700, Anatoliy Klymenko wrote:
> Avoid usage of global zynqmp_dpsub.dma_enabled flag in DPSUB layer
> context. This flag signals whether the driver runs in DRM CRTC or DRM
> bridge mode, assuming that all display layers share the same live or
> non-live mode of operation. Using per-layer mode instead of global flag
> will siplify future support of the hybrid scenario.

s/siplify/simplify/

> Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index af851190f447..dd48fa60fa9a 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -975,7 +975,7 @@ void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
>  {
>  	unsigned int i;
>  
> -	if (layer->disp->dpsub->dma_enabled) {
> +	if (layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE) {
>  		for (i = 0; i < layer->drm_fmt->num_planes; i++)
>  			dmaengine_terminate_sync(layer->dmas[i].chan);
>  	}
> @@ -1001,7 +1001,7 @@ void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>  
>  	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
>  
> -	if (!layer->disp->dpsub->dma_enabled)
> +	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
>  		return;
>  
>  	/*
> @@ -1039,7 +1039,7 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
>  	const struct drm_format_info *info = layer->drm_fmt;
>  	unsigned int i;
>  
> -	if (!layer->disp->dpsub->dma_enabled)
> +	if (layer->mode == ZYNQMP_DPSUB_LAYER_LIVE)
>  		return 0;

The above changes look nice.

>  
>  	for (i = 0; i < info->num_planes; i++) {
> @@ -1089,7 +1089,7 @@ static void zynqmp_disp_layer_release_dma(struct zynqmp_disp *disp,
>  {
>  	unsigned int i;
>  
> -	if (!layer->info || !disp->dpsub->dma_enabled)
> +	if (!layer->info)

This, however, doesn't seem right, as this function is called
unconditionally from the remove path. The change below seems weird too.
If I'm missing something, it should at least be explained in the commit
message.

>  		return;
>  
>  	for (i = 0; i < layer->info->num_channels; i++) {
> @@ -1132,9 +1132,6 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
>  	unsigned int i;
>  	int ret;
>  
> -	if (!disp->dpsub->dma_enabled)
> -		return 0;
> -
>  	for (i = 0; i < layer->info->num_channels; i++) {
>  		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
>  		char dma_channel_name[16];
> 

-- 
Regards,

Laurent Pinchart
