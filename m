Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1C99A467
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 15:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100AF10E02D;
	Fri, 11 Oct 2024 13:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="HSyI4MX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E6D10E02D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 13:06:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5251220002;
 Fri, 11 Oct 2024 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728651987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CunMtJJ6/SzlbPyi0GCgaD8hlcTnVAq7qYmei3YWRTI=;
 b=HSyI4MX8HyDIvkQxea0g3u8DIEIepEhJGuZ2GO4ci88p7Ja3tow6uSMV6Ci6pgQksqxY7C
 0Sp9KPH9QB0+wHfpp8EGi9OS9gBzfmGysfRklGhWnUvbvfKqPsf5aW5XJsRIK9uSO+aZs1
 vUaw84pMvVPUF6e+2910VnYBCRxjzlAWypM5S+MQXTIzTjJKBhRablxkTqABW1iXbRtXBq
 lZ4q4Y3g7Bge+lugSTstYfaWdWa5zwOOFzlrBPOC49o4eWFFiCXmeBrp5ibAB6/oGG/IM1
 pJOXX6RRUQkk6R0rm++Bw8YSrksNnQtIleertVPPnz5zTkhGzQRC/QBXpahiVw==
Date: Fri, 11 Oct 2024 15:06:25 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/3] drm: logicvc: fix missing of_node_put() in
 for_each_child_of_node()
Message-ID: <Zwki0VC2hmSsguho@louis-chauvet-laptop>
Mail-Followup-To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241011-logicvc_layer_of_node_put-v1-0-1ec36bdca74f@gmail.com>
 <20241011-logicvc_layer_of_node_put-v1-1-1ec36bdca74f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-logicvc_layer_of_node_put-v1-1-1ec36bdca74f@gmail.com>
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
> Early exits from the for_each_child_of_node() loop require explicit
> calls to of_node_put() for the child node.
> 
> Add the missing 'of_node_put(layer_node)' in the only error path.
> 
> Cc: stable@vger.kernel.org
> Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Reviewed-By: Louis Chauvet <louis.chauvet@bootlin.com>

> ---
>  drivers/gpu/drm/logicvc/logicvc_layer.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
> index 464000aea765..52dabacd42ee 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_layer.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
> @@ -613,6 +613,7 @@ int logicvc_layers_init(struct logicvc_drm *logicvc)
>  
>  		ret = logicvc_layer_init(logicvc, layer_node, index);
>  		if (ret) {
> +			of_node_put(layer_node);
>  			of_node_put(layers_node);
>  			goto error;
>  		}
> 
> -- 
> 2.43.0
> 
