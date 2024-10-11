Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA1B99A44A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 15:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92AE10EAE1;
	Fri, 11 Oct 2024 13:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UvRmCfMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7D810EADE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 13:01:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A69A1C000B;
 Fri, 11 Oct 2024 13:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728651708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9V1S9K1PNb5siPRfIuOMpQ1j/WvSIQ1rht6+3lqOlc=;
 b=UvRmCfMtz06kHn/XwG2cZswRr1EuhfMkVW/aAl0f4c6vX/ILdQHSgHBowHGrW8fvEg6lJ1
 m/kPekUvXJCB1/98Rmp+2+EkquQoW3jf62zO4OxjmJVKxymZYZkKU6lzBmbWBvgsv9LNXi
 q2eWwokNrxi2DHK3EgB/qpdlBKZykeb9sJ0ozvtOreWSNHd6VAAp/7QhY/fewF8SblaQyn
 yLA2/qfV584qXja9291pfhkURDRY0Mw4E4SZ75chPWKWmX3NQnOPK1wI3q01w+XiRGIL1U
 Djn9mgpqLidl27n+O+VERh6jEpdFyCQhKXJyuMLi2vF1clmlGy1jkiEcWPQvdA==
Date: Fri, 11 Oct 2024 15:01:46 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm: logicvc: use automatic cleanup facility for
 layers_node
Message-ID: <ZwkhuixQ8sM5pNs7@louis-chauvet-laptop>
Mail-Followup-To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
 <20241011-logicvc_layer_of_node_put-v1-3-1ec36bdca74f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-logicvc_layer_of_node_put-v1-3-1ec36bdca74f@gmail.com>
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

On 11/10/24 - 01:11, Javier Carrasco wrote:
> Use the more robust approach provided by the __free() macro to
> automatically call of_node_put() when the device node goes out of scope.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>  drivers/gpu/drm/logicvc/logicvc_layer.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
> index 34caf5f0f619..9d7d1b58b002 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_layer.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> @@ -581,12 +581,12 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
>  	struct drm_device *drm_dev = &logicvc->drm_dev;
>  	struct device *dev = drm_dev->dev;
>  	struct device_node *of_node = dev->of_node;
> -	struct device_node *layers_node;
> +	struct device_node *layers_node __free(device_node) =
> +		of_get_child_by_name(of_node, "layers");
>  	struct logicvc_layer *layer;
>  	struct logicvc_layer *next;
>  	int ret = 0;
>  
> -	layers_node = of_get_child_by_name(of_node, "layers");
>  	if (!layers_node) {
>  		drm_err(drm_dev, "No layers node found in the description\n");
>  		ret = -ENODEV;
> @@ -611,14 +611,10 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
>  		}
>  
>  		ret = logicvc_layer_init(logicvc, layer_node, index);
> -		if (ret) {
> -			of_node_put(layers_node);
> +		if (ret)
>  			goto error;
> -		}
>  	}
>  
> -	of_node_put(layers_node);
> -
>  	return 0;
>  
>  error:
> 
> -- 
> 2.43.0
> 
