Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6962D7E7C3D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 13:42:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBD010E05B;
	Fri, 10 Nov 2023 12:42:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 52604 seconds by postgrey-1.36 at gabe;
 Fri, 10 Nov 2023 12:42:33 UTC
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFB310E05B;
 Fri, 10 Nov 2023 12:42:33 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4SRdkx2TnWz9tKp;
 Fri, 10 Nov 2023 12:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1699620153; bh=89w6rav1aXVH/742mr6qJY2fLAZa3NgwZDqC5oc8sxM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tL6iCk0T7pEor/x6z/l4jE8anPdOir+uzkTL1r0VjiuCkHRSWtEy4QUdMF212UZF2
 r4Zi8scHfha0DzDNz22MaWb+EPRkedAOYTOTgF45RwEbWH0FqmZliHER06ZNb3qnB+
 rBvH5eSenO15i8vnir114XNOEeqQL0pnAl6vZgL0=
X-Riseup-User-ID: 9A4F26B5004C1B460AD85A1A22FA586CC315C4E422B15066686610A40FBD844B
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4SRdkv6YsHzFsv3;
 Fri, 10 Nov 2023 12:42:31 +0000 (UTC)
Message-ID: <51c79cb2-7e64-4336-972c-976c7da74a8b@riseup.net>
Date: Fri, 10 Nov 2023 09:42:28 -0300
MIME-Version: 1.0
Subject: Re: [RFC PATCH v3 05/23] drm/vkms: Avoid reading beyond LUT array
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, dri-devel@lists.freedesktop.org
References: <20231108163647.106853-1-harry.wentland@amd.com>
 <20231108163647.106853-6-harry.wentland@amd.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20231108163647.106853-6-harry.wentland@amd.com>
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/11/23 13:36, Harry Wentland wrote:
> When the floor LUT index (drm_fixp2int(lut_index) is the last
> index of the array the ceil LUT index will point to an entry
> beyond the array. Make sure we guard against it and use the
> value of the floor LUT index.
> 
> v3:
>  - Drop bits from commit description that didn't contribute
>    anything of value
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>

LGTM
Reviewed-by: Arthur Grillo <arthurgrillo@riseup.net>

Best Regards,
~Arthur Grillo

> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 6f942896036e..25b6b73bece8 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -123,6 +123,8 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
>  				      enum lut_channel channel)
>  {
>  	s64 lut_index = get_lut_index(lut, channel_value);
> +	u16 *floor_lut_value, *ceil_lut_value;
> +	u16 floor_channel_value, ceil_channel_value;
>  
>  	/*
>  	 * This checks if `struct drm_color_lut` has any gap added by the compiler
> @@ -130,11 +132,15 @@ static u16 apply_lut_to_channel_value(const struct vkms_color_lut *lut, u16 chan
>  	 */
>  	static_assert(sizeof(struct drm_color_lut) == sizeof(__u16) * 4);
>  
> -	u16 *floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> -	u16 *ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
> +	floor_lut_value = (__u16 *)&lut->base[drm_fixp2int(lut_index)];
> +	if (drm_fixp2int(lut_index) == (lut->lut_length - 1))
> +		/* We're at the end of the LUT array, use same value for ceil and floor */
> +		ceil_lut_value = floor_lut_value;
> +	else
> +		ceil_lut_value = (__u16 *)&lut->base[drm_fixp2int_ceil(lut_index)];
>  
> -	u16 floor_channel_value = floor_lut_value[channel];
> -	u16 ceil_channel_value = ceil_lut_value[channel];
> +	floor_channel_value = floor_lut_value[channel];
> +	ceil_channel_value = ceil_lut_value[channel];
>  
>  	return lerp_u16(floor_channel_value, ceil_channel_value,
>  			lut_index & DRM_FIXED_DECIMAL_MASK);
