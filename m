Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358BC98DFE7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 17:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32EC10E03C;
	Wed,  2 Oct 2024 15:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="PvL4+223";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6F3610E03C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 15:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=DUGkyHprQykvlCIC/94t9pYCNbNncCmGACakvirHEZ4=; b=PvL4+223kNeKewK3bbdWOAInZq
 lQNOIMciYp6PQwMB0A/Ig7z3GUWzY6gtm2n14BhFDdCeteFng7pXs0mFXb6DioTpphvRx9jeWcLHy
 6s0vFLC2oRNmRWntURakKqSukAybqsshavG6Piqv6UzghdajNQrQ8boXEdmXBZ104eiwU06VzUUGs
 Q7pUAsfl0OC9Rmj8kQD0tRw2C91mRwBGTEmhJpbPaveWxQ9IA2oxbBdU40LEg9m1pon5e+2B1ObCt
 v3LWjNqMybAjpIBe3l/Yn7LH2VSg+AhAxT5ifEm+4buxd0dUIBT7mmejbN2tI9OaUDHTQqUpS1jkC
 e3tsRF/g==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1sw1hk-00000003Wcq-2Drb; Wed, 02 Oct 2024 15:55:56 +0000
Message-ID: <17edd793-32ac-4139-b989-e94502dda362@infradead.org>
Date: Wed, 2 Oct 2024 08:55:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/15] drm/vkms: Add YUV support
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, arthurgrillo@riseup.net,
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240930-yuv-v11-0-4b1a26bcfc96@bootlin.com>
 <20240930-yuv-v11-10-4b1a26bcfc96@bootlin.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240930-yuv-v11-10-4b1a26bcfc96@bootlin.com>
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



On 9/30/24 8:31 AM, Louis Chauvet wrote:
> From: Arthur Grillo <arthurgrillo@riseup.net>
> 
> Add support to the YUV formats bellow:
> 
> - NV12/NV16/NV24
> - NV21/NV61/NV42
> - YUV420/YUV422/YUV444
> - YVU420/YVU422/YVU444
> 
> The conversion from yuv to rgb is done with fixed-point arithmetic, using
> 32.32 fixed-point numbers and the drm_fixed helpers.
> 
> To do the conversion, a specific matrix must be used for each color range
> (DRM_COLOR_*_RANGE) and encoding (DRM_COLOR_*). This matrix is stored in
> the `conversion_matrix` struct, along with the specific y_offset needed.
> This matrix is queried only once, in `vkms_plane_atomic_update` and
> stored in a `vkms_plane_state`. Those conversion matrices of each
> encoding and range were obtained by rounding the values of the original
> conversion matrices multiplied by 2^32. This is done to avoid the use of
> floating point operations.
> 
> The same reading function is used for YUV and YVU formats. As the only
> difference between those two category of formats is the order of field, a
> simple swap in conversion matrix columns allows using the same function.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> [Louis Chauvet:
> - Adapted Arthur's work
> - Implemented the read_line_t callbacks for yuv
> - add struct conversion_matrix
> - store the whole conversion_matrix in the plane state
> - remove struct pixel_yuv_u8
> - update the commit message
> - Merge the modifications from Arthur]
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h     |  18 ++
>  drivers/gpu/drm/vkms/vkms_formats.c | 353 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.h |   4 +
>  drivers/gpu/drm/vkms/vkms_plane.c   |  16 +-
>  4 files changed, 390 insertions(+), 1 deletion(-)
> 

> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index 0f6678420a11..adb1228e5201 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -140,6 +140,51 @@ static void packed_pixels_addr_1x1(const struct vkms_frame_info *frame_info,
>  	*addr = (u8 *)frame_info->map[0].vaddr + offset;
>  }
>  
> +/**
> + * get_subsampling() - Get the subsampling divisor value on a specific direction
> + *
> + * @format: format to extarct the subsampling from

                         extract

> + * @direction: direction of the subsampling requested
> + */
> +static int get_subsampling(const struct drm_format_info *format,
> +			   enum pixel_read_direction direction)
> +{
> +	switch (direction) {
> +	case READ_BOTTOM_TO_TOP:
> +	case READ_TOP_TO_BOTTOM:
> +		return format->vsub;
> +	case READ_RIGHT_TO_LEFT:
> +	case READ_LEFT_TO_RIGHT:
> +		return format->hsub;
> +	}
> +	WARN_ONCE(true, "Invalid direction for pixel reading: %d\n", direction);
> +	return 1;
> +}
> +
> +/**
> + * get_subsampling_offset() - An offset for keeping the chroma siting consistent regardless of
> + * x_start and y_start values
> + *
> + * @direction: direction of the reading to properly compute this offset
> + * @x_start: x coordinate of the starting point of the readed line

                                                          read

> + * @y_start: y coordinate of the starting point of the readed line

                                                          read

> + */
> +static int get_subsampling_offset(enum pixel_read_direction direction, int x_start, int y_start)
> +{

