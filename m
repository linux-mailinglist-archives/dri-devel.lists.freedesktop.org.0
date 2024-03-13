Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F5587B0DB
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 20:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD33D10E4A7;
	Wed, 13 Mar 2024 19:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="nqJQixae";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6362A10E4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 19:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=rIJP/2UJwo6seYvgvi0OmkEBz55Yak5Htnxi3myTKu8=; b=nqJQixaelhfIlCtIrd1vO8BEV0
 PZDMhh4NiN+/ct17a5eR3LnU4zyGsAWNx6XwhHoUlSiiSqSvHKQqEcMMb3g9QJCBA+WJCSD6HNJDr
 WOaFKLWNb6UZMaGaEy/SwAa9MefGcFxOFMqCbKOgvp7V5VTZLBT/gOUnh1kFvj9eH+BTqxZyg84aj
 t5gCEQYwvGPOt/RL8Wybru6ZnNMJ2LdJeHxT4jE+/quDaREQeut52+AmrTxW/pNTOsvCnI2Q1L+Ks
 2kSHf5pg15e6zpJe+b9iw5/zwUCTLORVlyOcNz+lHH1EBw5YBAgqxnnhz6VqroVbXsS4ihBAtWBhY
 /X9x7byQ==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rkTs6-0000000BUAS-3Dl5; Wed, 13 Mar 2024 19:02:38 +0000
Message-ID: <1cda54fb-a61d-4485-b9fe-338a935d7980@infradead.org>
Date: Wed, 13 Mar 2024 12:02:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/16] drm/vkms: write/update the documentation for
 pixel conversion and pixel write functions
Content-Language: en-US
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-3-e610cbd03f52@bootlin.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240313-yuv-v5-3-e610cbd03f52@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 3/13/24 10:44, Louis Chauvet wrote:
> Add some documentation on pixel conversion functions.
> Update of outdated comments for pixel_write functions.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c |  7 ++++
>  drivers/gpu/drm/vkms/vkms_drv.h      | 13 ++++++++
>  drivers/gpu/drm/vkms/vkms_formats.c  | 62 ++++++++++++++++++++++++++++++------
>  3 files changed, 73 insertions(+), 9 deletions(-)
> 

> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 172830a3936a..6e3dc8682ff9 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c


> @@ -216,6 +238,14 @@ static void argb_u16_to_RGB565(u8 *dst_pixels, struct pixel_argb_u16 *in_pixel)
>  	*pixels = cpu_to_le16(r << 11 | g << 5 | b);
>  }
>  
> +/**

This comment is not in kernel-doc format, so either use "/*" to begin the comment
or add the function name in the first comment line, like:


+ * vkms_writeback_row - Generic loop for all supported writeback format. It is executed just after the blending to

> + * Generic loop for all supported writeback format. It is executed just after the blending to
> + * write a line in the writeback buffer.
> + *
> + * @wb: Job where to insert the final image
> + * @src_buffer: Line to write
> + * @y: Row to write in the writeback buffer
> + */
>  void vkms_writeback_row(struct vkms_writeback_job *wb,
>  			const struct line_buffer *src_buffer, int y)
>  {
> @@ -229,6 +259,13 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>  		wb->pixel_write(dst_pixels, &in_pixels[x]);
>  }
>  
> +/**

Needs function name or don't use "/**" to begin the comment.

> + * Retrieve the correct read_pixel function for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> + * pointer is valid before using it in a vkms_plane_state.
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> + */
>  void *get_pixel_conversion_function(u32 format)
>  {
>  	switch (format) {
> @@ -247,6 +284,13 @@ void *get_pixel_conversion_function(u32 format)
>  	}
>  }
>  
> +/**

Same here.

> + * Retrieve the correct write_pixel function for a specific format.
> + * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> + * pointer is valid before using it in a vkms_writeback_job.
> + *
> + * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
> + */
>  void *get_pixel_write_function(u32 format)
>  {
>  	switch (format) {
> 

thanks.
-- 
#Randy
