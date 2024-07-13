Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AC49305FE
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2024 16:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4643F10E036;
	Sat, 13 Jul 2024 14:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="M2prIyWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04C810E0EE
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2024 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CXyAMCJYhNH9e3PTxvXhtZsKyPJujdEq3lz2SA/wbZo=; b=M2prIyWBm8mP4jeOjSivfDbJc0
 1RP8S8t738XgbnzzaT2kEIDvd5GXpzz9NYcYxdZRHMJc/1xpgRBdBDeyd6F1tvKGMPD3/JkcAvVQL
 SNp/so/BYAoOakyWVmfwDVB46G5B6ptDlx468bwPgjr5SYzUlDWqqGrLO+LhurXlN8UtKp9xt+qtq
 W2MtfPDy8FviwZ04QiRmUSjl2Zd321f8530mNsCCf2AwbYcGmptwX6UNEscDy7HYpQ0PdOidouPim
 NImiBe//8Q9+UAcp4/yYxzmwdb58kPs+1m3Ukj97JjGkdmqTUJQo8QGZiB1bmsuUwLrqPSJNhhVVT
 ly2xYzGQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sSe05-00EkgM-4k; Sat, 13 Jul 2024 16:45:25 +0200
Message-ID: <bdcb84be-75b6-4afb-91a7-40889fbb69fd@igalia.com>
Date: Sat, 13 Jul 2024 11:45:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/17] drm/vkms: Add dummy pixel_read/pixel_write
 callbacks to avoid NULL pointers
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, Pekka Paalanen <pekka.paalanen@collabora.com>
References: <20240516-yuv-v8-0-cf8d6f86430e@bootlin.com>
 <20240516-yuv-v8-5-cf8d6f86430e@bootlin.com>
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
In-Reply-To: <20240516-yuv-v8-5-cf8d6f86430e@bootlin.com>
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

On 5/16/24 10:04, Louis Chauvet wrote:
> Introduce two callbacks which does nothing. They are used in replacement
> of NULL and it avoid kernel OOPS if this NULL is called.

I don't believe we should avoid a reasonable kernel OOPS. As you
noticed, if the user got this kernel OOPS it means that there is a
mismatch between what formats are announced by atomic_check and what is
really supported by atomic_update. This is a driver error.

If this happens, I want the kernel OOPS because it means I need to fix
the driver. Sometimes a kernel OOPS can save you some valuable debugging
time.

I'd probably drop this patch.

Best Regards,
- Maíra

> 
> If those callback are used, it means that there is a mismatch between
> what formats are announced by atomic_check and what is realy supported by
> atomic_update.
> 
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 45 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 39 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 6b3e17374b19..c28c32b00e39 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -135,6 +135,21 @@ static void RGB565_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
>   	out_pixel->b = drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>   }
>   
> +/**
> + * magenta_to_argb_u16() - pixel_read callback which always read magenta
> + *
> + * This callback is used when an invalid format is requested for plane reading.
> + * It is used to avoid null pointer to be used as a function. In theory, this function should
> + * never be called, except if you found a bug in the driver/DRM core.
> + */
> +static void magenta_to_argb_u16(u8 *in_pixel, struct pixel_argb_u16 *out_pixel)
> +{
> +	out_pixel->a = (u16)0xFFFF;
> +	out_pixel->r = (u16)0xFFFF;
> +	out_pixel->g = 0;
> +	out_pixel->b = (u16)0xFFFF;
> +}
> +
>   /**
>    * vkms_compose_row - compose a single row of a plane
>    * @stage_buffer: output line with the composed pixels
> @@ -237,6 +252,16 @@ static void argb_u16_to_RGB565(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
>   	*pixel = cpu_to_le16(r << 11 | g << 5 | b);
>   }
>   
> +/**
> + * argb_u16_to_nothing() - pixel_write callback with no effect
> + *
> + * This callback is used when an invalid format is requested for writeback.
> + * It is used to avoid null pointer to be used as a function. In theory, this should never
> + * happen, except if there is a bug in the driver
> + */
> +static void argb_u16_to_nothing(u8 *out_pixel, struct pixel_argb_u16 *in_pixel)
> +{}
> +
>   /**
>    * vkms_writeback_row() - Generic loop for all supported writeback format. It is executed just
>    * after the blending to write a line in the writeback buffer.
> @@ -260,8 +285,10 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>   
>   /**
>    * get_pixel_conversion_function() - Retrieve the correct read_pixel function for a specific
> - * format. The returned pointer is NULL for unsupported pixel formats. The caller must ensure that
> - * the pointer is valid before using it in a vkms_plane_state.
> + * format.
> + *
> + * If the format is not supported by VKMS a warning is emitted and a dummy "always read magenta"
> + * function is returned.
>    *
>    * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
>    */
> @@ -284,18 +311,21 @@ pixel_read_t get_pixel_read_function(u32 format)
>   		 * format must:
>   		 * - Be listed in vkms_formats in vkms_plane.c
>   		 * - Have a pixel_read callback defined here
> +		 *
> +		 * To avoid kernel crash, a dummy "always read magenta" function is used. It means
> +		 * that during the composition, this plane will always be magenta.
>   		 */
>   		WARN(true,
>   		     "Pixel format %p4cc is not supported by VKMS planes. This is a kernel bug, atomic check must forbid this configuration.\n",
>   		     &format);
> -		return (pixel_read_t)NULL;
> +		return &magenta_to_argb_u16;
>   	}
>   }
>   
>   /**
>    * get_pixel_write_function() - Retrieve the correct write_pixel function for a specific format.
> - * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> - * pointer is valid before using it in a vkms_writeback_job.
> + * If the format is not supported by VKMS a warning is emitted and a dummy "don't do anything"
> + * function is returned.
>    *
>    * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
>    */
> @@ -318,10 +348,13 @@ pixel_write_t get_pixel_write_function(u32 format)
>   		 * format must:
>   		 * - Be listed in vkms_wb_formats in vkms_writeback.c
>   		 * - Have a pixel_write callback defined here
> +		 *
> +		 * To avoid kernel crash, a dummy "don't do anything" function is used. It means
> +		 * that the resulting writeback buffer is not composed and can contains any values.
>   		 */
>   		WARN(true,
>   		     "Pixel format %p4cc is not supported by VKMS writeback. This is a kernel bug, atomic check must forbid this configuration.\n",
>   		     &format);
> -		return (pixel_write_t)NULL;
> +		return &argb_u16_to_nothing;
>   	}
>   }
> 
