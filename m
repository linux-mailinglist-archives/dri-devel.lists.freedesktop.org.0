Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A2087B115
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 20:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17D410E6E1;
	Wed, 13 Mar 2024 19:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="BMsm9s2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CC910EAE4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 19:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=S4RVqXzF13y0CJV+kmNbU9l+QECvaduFB2onsfFa8UE=; b=BMsm9s2lN63/CsRPp7HRg/iSHJ
 uFEE4BHSNcctHMSlBioSWDsdjHGP1+0l5c7ULsON17Yhyykcr0Uqf8RCV/MkTNcFd7SlVKCvmu2Zb
 hmpI2fVgp4bOn+zufJ+8CNBmbETd9JvyPOV1pIvyN6FkVyvOWrvnjysMqpa2B0RkP3knmqmdP7r3p
 Mhrir3AwbgNp7NiV4lhVto0G7htl8C7VtQW3MvH6jACifqz5FTppxSm2yAgsL8ymE3Ml0vrGHJHp1
 MmDeW/lWnqGsOXfCMBIheCCGMGXAJlj7NFnEg8/1vs5ia5xIOtODGsQKWJxXF7C35CLRtKB5hKblW
 3jr2/8fQ==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1rkTxV-0000000BVpl-1QZv; Wed, 13 Mar 2024 19:08:13 +0000
Message-ID: <9c12e240-271a-4bf5-a946-7a2a25d1b18a@infradead.org>
Date: Wed, 13 Mar 2024 12:08:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/16] drm/vkms: Add dummy pixel_read/pixel_write
 callbacks to avoid NULL pointers
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
 <20240313-yuv-v5-5-e610cbd03f52@bootlin.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240313-yuv-v5-5-e610cbd03f52@bootlin.com>
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



On 3/13/24 10:44, Louis Chauvet wrote:
> Introduce two callbacks which does nothing. They are used in replacement
> of NULL and it avoid kernel OOPS if this NULL is called.
> 
> If those callback are used, it means that there is a mismatch between
> what formats are announced by atomic_check and what is realy supported by
> atomic_update.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 43 +++++++++++++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 55a4365d21a4..b57d85b8b935 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c


> @@ -261,8 +286,8 @@ void vkms_writeback_row(struct vkms_writeback_job *wb,
>  
>  /**

Please mak this comment conform to kernel-doc format or don't use "/**" to
begin the comment.

>   * Retrieve the correct read_pixel function for a specific format.
> - * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> - * pointer is valid before using it in a vkms_plane_state.
> + * If the format is not supported by VKMS a warn is emitted and a dummy "always read black"
> + * function is returned.
>   *
>   * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
>   */
> @@ -285,18 +310,21 @@ pixel_read_t get_pixel_read_function(u32 format)
>  		 * format must:
>  		 * - Be listed in vkms_formats in vkms_plane.c
>  		 * - Have a pixel_read callback defined here
> +		 *
> +		 * To avoid kernel crash, a dummy "always read black" function is used. It means
> +		 * that during the composition, this plane will always be black.
>  		 */
>  		WARN(true,
>  		     "Pixel format %p4cc is not supported by VKMS planes. This is a kernel bug, atomic check must forbid this configuration.\n",
>  		     &format);
> -		return (pixel_read_t)NULL;
> +		return &black_to_argb_u16;
>  	}
>  }
>  
>  /**

Same here.

>   * Retrieve the correct write_pixel function for a specific format.
> - * The returned pointer is NULL for unsupported pixel formats. The caller must ensure that the
> - * pointer is valid before using it in a vkms_writeback_job.
> + * If the format is not supported by VKMS a warn is emitted and a dummy "don't do anything"
> + * function is returned.
>   *
>   * @format: DRM_FORMAT_* value for which to obtain a conversion function (see [drm_fourcc.h])
>   */

thanks.
-- 
#Randy
