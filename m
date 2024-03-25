Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302B388A3A4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AEC10E5AA;
	Mon, 25 Mar 2024 14:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="kNi/YcM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A6E10E80C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yd9+S3XxenHqQanmkoRWCDO8d3X3+DCs7dRSrWF3pvk=; b=kNi/YcM8gsGT02869qrcozocD9
 0tdtdl2SMnXU50FgZnNk9MUPj4deYmQWRt1MYa2bkGIsW6q7VpTYRUq9cr9oC5TRG6jqcs8nC6ZVc
 vOstY/fooRU32lPrefNsfF8Ds21+ZNiYV23EmmtVL4hPXqgjzwI1M1ht6AhwScQSrJ2e1wXoh57qc
 GSHPEfTbIJO6tTiDI/bRs4LEABafq/Cx61xyA9ype2dglSagTOL3wkpxSh18hKeTfdQZ5iPJLqUYF
 6qvOwYMW9GnJv4SX1OnSj0hC/jA5JK49SuH7U3GprlQYMm8Jo3TV1CxRAAJUOVECcmQHwvRbLOLPM
 xV02CkjA==;
Received: from [177.34.169.255] (helo=[192.168.0.139])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rokyn-00F5UY-S2; Mon, 25 Mar 2024 15:07:14 +0100
Message-ID: <ecffe7bd-98bc-444a-bf5b-d8f3ff933a34@igalia.com>
Date: Mon, 25 Mar 2024 11:07:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/16] drm/vkms: Introduce pixel_read_direction enum
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, arthurgrillo@riseup.net,
 Jonathan Corbet <corbet@lwn.net>, pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-9-e610cbd03f52@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240313-yuv-v5-9-e610cbd03f52@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 3/13/24 14:45, Louis Chauvet wrote:
> The pixel_read_direction enum is useful to describe the reading direction
> in a plane. It avoids using the rotation property of DRM, which not
> practical to know the direction of reading.
> This patch also introduce two helpers, one to compute the
> pixel_read_direction from the DRM rotation property, and one to compute
> the step, in byte, between two successive pixel in a specific direction.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_composer.c | 36 ++++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/vkms/vkms_drv.h      | 11 +++++++++++
>   drivers/gpu/drm/vkms/vkms_formats.c  | 30 ++++++++++++++++++++++++++++++
>   3 files changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 9254086f23ff..989bcf59f375 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -159,6 +159,42 @@ static void apply_lut(const struct vkms_crtc_state *crtc_state, struct line_buff
>   	}
>   }
>   
> +/**
> + * direction_for_rotation() - Get the correct reading direction for a given rotation
> + *
> + * This function will use the @rotation setting of a source plane to compute the reading
> + * direction in this plane which correspond to a "left to right writing" in the CRTC.
> + * For example, if the buffer is reflected on X axis, the pixel must be read from right to left
> + * to be written from left to right on the CRTC.
> + *
> + * @rotation: Rotation to analyze. It correspond the field @frame_info.rotation.

A bit unusual to see arguments after the description.

> + */
> +static enum pixel_read_direction direction_for_rotation(unsigned int rotation)
> +{
> +	if (rotation & DRM_MODE_ROTATE_0) {
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			return READ_RIGHT_TO_LEFT;
> +		else
> +			return READ_LEFT_TO_RIGHT;
> +	} else if (rotation & DRM_MODE_ROTATE_90) {
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			return READ_BOTTOM_TO_TOP;
> +		else
> +			return READ_TOP_TO_BOTTOM;
> +	} else if (rotation & DRM_MODE_ROTATE_180) {
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			return READ_LEFT_TO_RIGHT;
> +		else
> +			return READ_RIGHT_TO_LEFT;
> +	} else if (rotation & DRM_MODE_ROTATE_270) {
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			return READ_TOP_TO_BOTTOM;
> +		else
> +			return READ_BOTTOM_TO_TOP;
> +	}
> +	return READ_LEFT_TO_RIGHT;
> +}
> +
>   /**
>    * blend - blend the pixels from all planes and compute crc
>    * @wb: The writeback frame buffer metadata
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 3ead8b39af4a..985e7a92b7bc 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -69,6 +69,17 @@ struct vkms_writeback_job {
>   	pixel_write_t pixel_write;
>   };
>   
> +/**
> + * enum pixel_read_direction - Enum used internaly by VKMS to represent a reading direction in a
> + * plane.
> + */
> +enum pixel_read_direction {
> +	READ_BOTTOM_TO_TOP,
> +	READ_TOP_TO_BOTTOM,
> +	READ_RIGHT_TO_LEFT,
> +	READ_LEFT_TO_RIGHT
> +};
> +
>   /**
>    * typedef pixel_read_t - These functions are used to read a pixel in the source frame,
>    * convert it to `struct pixel_argb_u16` and write it to @out_pixel.
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 649d75d05b1f..743b6fd06db5 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -75,6 +75,36 @@ static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
>   	*addr = (u8 *)frame_info->map[0].vaddr + offset;
>   }
>   
> +/**
> + * get_step_next_block() - Common helper to compute the correct step value between each pixel block
> + * to read in a certain direction.
> + *
> + * As the returned offset is the number of bytes between two consecutive blocks in a direction,
> + * the caller may have to read multiple pixel before using the next one (for example, to read from
> + * left to right in a DRM_FORMAT_R1 plane, each block contains 8 pixels, so the step must be used
> + * only every 8 pixels.
> + *
> + * @fb: Framebuffer to iter on
> + * @direction: Direction of the reading
> + * @plane_index: Plane to get the step from

Same.

Best Regards,
- Maíra

> + */
> +static int get_step_next_block(struct drm_framebuffer *fb, enum pixel_read_direction direction,
> +			       int plane_index)
> +{
> +	switch (direction) {
> +	case READ_LEFT_TO_RIGHT:
> +		return fb->format->char_per_block[plane_index];
> +	case READ_RIGHT_TO_LEFT:
> +		return -fb->format->char_per_block[plane_index];
> +	case READ_TOP_TO_BOTTOM:
> +		return (int)fb->pitches[plane_index];
> +	case READ_BOTTOM_TO_TOP:
> +		return -(int)fb->pitches[plane_index];
> +	}
> +
> +	return 0;
> +}
> +
>   static void *get_packed_src_addr(const struct vkms_frame_info *frame_info, int y,
>   				 int plane_index)
>   {
> 
