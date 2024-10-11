Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957DC99A03B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 11:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B9310E1E4;
	Fri, 11 Oct 2024 09:36:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GoFfH3pX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E2610E1E4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 09:36:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 778932000A;
 Fri, 11 Oct 2024 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1728639400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DOr1y6bkl2ESGBEAuDHnJepThp32G9brhsEAe/glmCw=;
 b=GoFfH3pXCxEQ4cP0HBtTb/GeVfzPsPexPQ9F04GQ7cdvz7gVeh6Oanb3JYxWTGyNAdK1KX
 9z7BVCEvmenpF+fYTIc7Zx4T0hkBQ6Bmc+HES5JROGHQS6OI/2wdC+5QGF7uqXey19YJv6
 Os2QsSuL1KJhpMXzLbdpflFV9HfZ6I4J9eJcEVfOAKwWZfKCdW61ggBKc2/YzhEbVnxjjG
 +dK3T7LoAUViCGsMTGz2DAoZkEKHzHmX6/SU1DI7hXlDpoNacFP6X73CGR2PHyDncpe6B9
 gABvipThp1v5nyYyolUdX5dwNhkk6WQ+zUdQWiHqKfCh2Thppou4rt7YD0jMEw==
Date: Fri, 11 Oct 2024 11:36:35 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, Maaara Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v12 09/15] drm/vkms: Remove useless drm_rotation_simplify
Message-ID: <Zwjxo2TEAR3PelO9@louis-chauvet-laptop>
Mail-Followup-To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maaara Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20241007-yuv-v12-0-01c1ada6fec8@bootlin.com>
 <20241007-yuv-v12-9-01c1ada6fec8@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007-yuv-v12-9-01c1ada6fec8@bootlin.com>
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


Hi all,

Until this point, this series has not received any major comments since 
v9. I will commit patches 1-9 next week if there are no further comments.

For patches 10-15, I am currently waiting for feedback from Maxime to 
send the next iteration with a fix for kunit tests.

Thanks,
Louis Chauvet

On 07/10/24 - 18:10, Louis Chauvet wrote:
> As all the rotation are now supported by VKMS, this simplification does
> not make sense anymore, so remove it.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 8875bed76410..5a028ee96c91 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>  	frame_info->fb = fb;
>  	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>  	drm_framebuffer_get(frame_info->fb);
> -	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
> -									  DRM_MODE_ROTATE_90 |
> -									  DRM_MODE_ROTATE_270 |
> -									  DRM_MODE_REFLECT_X |
> -									  DRM_MODE_REFLECT_Y);
> -
> +	frame_info->rotation = new_state->rotation;
>  
>  	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
>  }
> 
> -- 
> 2.46.2
> 
