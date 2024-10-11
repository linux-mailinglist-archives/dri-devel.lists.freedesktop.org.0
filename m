Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA54F99A449
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 15:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BF010EADE;
	Fri, 11 Oct 2024 13:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nULeYxQi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3ECD10EAE1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 13:01:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B53DFF80C;
 Fri, 11 Oct 2024 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728651709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+oFNLMLv8p4sn8aezkzdZsxU4A7uXahszFE92Xgr7dw=;
 b=nULeYxQiiaHy9xULAwglppGuKTvhOc4Vqi14vrMTrxVfKtgB7ar8NsXa6tszOVWlCUMWs1
 SUnz4uQrPqT5ju49zGJMOAHl+5IoS0pl0dQwxqVXWACcDTY3tPLoF/FtgC7tT52B5RRK1c
 fmXsYoiWoPrjZvgYl8/zJFaJD45V29+sByb5MRGI60rCW5wgg+ZQNdLlCE3VFnTjxF2y+k
 rHYSXlQmd4t7wqi6lIbV/SxiC3bm4nrAfAnsw+LKQZnTBnPuWxxoU8Bg9m0bcnD4+hgOYC
 /r/HuPLC4HmEqeGTv87U7TdUhnPynI0q5XsAImqIH1bBhq5evf6/6R09+SC9+A==
Date: Fri, 11 Oct 2024 15:01:47 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm: logicvc: switch to
 for_each_child_of_node_scoped()
Message-ID: <Zwkhuyq39LQSZCIN@louis-chauvet-laptop>
Mail-Followup-To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
 <20241011-logicvc_layer_of_node_put-v1-2-1ec36bdca74f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-logicvc_layer_of_node_put-v1-2-1ec36bdca74f@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Hi,

I think you can squash this commit with the prvious one, I don't think 
this is needed to add of_node_put and remove it just after.

Thanks,
Louis Chauvet

On 11/10/24 - 01:11, Javier Carrasco wrote:
> Use the scoped variant of the macro to avoid leaking memory upon early
> exits without the required call to of_node_put().
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/gpu/drm/logicvc/logicvc_layer.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
> index 52dabacd42ee..34caf5f0f619 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_layer.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> @@ -581,7 +581,6 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
>  	struct drm_device *drm_dev = &logicvc->drm_dev;
>  	struct device *dev = drm_dev->dev;
>  	struct device_node *of_node = dev->of_node;
> -	struct device_node *layer_node = NULL;
>  	struct device_node *layers_node;
>  	struct logicvc_layer *layer;
>  	struct logicvc_layer *next;
> @@ -594,7 +593,7 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
>  		goto error;
>  	}
>  
> -	for_each_child_of_node(layers_node, layer_node) {
> +	for_each_child_of_node_scoped(layers_node, layer_node) {
>  		u32 index = 0;
>  
>  		if (!logicvc_of_node_is_layer(layer_node))
> @@ -613,7 +612,6 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
>  
>  		ret = logicvc_layer_init(logicvc, layer_node, index);
>  		if (ret) {
> -			of_node_put(layer_node);
>  			of_node_put(layers_node);
>  			goto error;
>  		}
> 
> -- 
> 2.43.0
> 
