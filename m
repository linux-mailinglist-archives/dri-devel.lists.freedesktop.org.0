Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1D4524A70
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 12:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F53E10E468;
	Thu, 12 May 2022 10:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A8610E468
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652351915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLfLhQTLZtV8Ar5jmpNMqaXBQb/9/Jz+9zA7tbGI3v8=;
 b=L4EL7N8GNh//BK9lxOTBDlF4zorCQUFA57+u7zmTVRFB/UDnDg/7xU36nGE8G24/99JGrl
 0MP1z6T3uIeayCmgFOV+jIsDGO1l8RujTl1sasKH4SjYfDrBM27c16Y1flV1D7TyQQVIRN
 4KhFcOa4wLr32PmyyEP3L7dig+FvUu0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-kfBYc7P7NSS7Ttf1uU4ipQ-1; Thu, 12 May 2022 06:38:34 -0400
X-MC-Unique: kfBYc7P7NSS7Ttf1uU4ipQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so1472953wmr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 03:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PLfLhQTLZtV8Ar5jmpNMqaXBQb/9/Jz+9zA7tbGI3v8=;
 b=cH0WeYuEkf7jwh7cerzBRc4Hw5SMyV8i3/GUsV+CoPf2gaXVNI48SZYcC/8PreIpIk
 ke5d8khoye5A7dnMnqbQTQPCXz7iZqLo9X8VScu5T4d4Jg5yzUrdJPIL9lPO2xqy9AJs
 gNScGVoSZAwXw54rksvhS0RhMa653TbPMjLtj609eA6lVcy7W5NuxG208US/B1jZ9Ojf
 pWOCxC8NbbywaG9RifWDrYDINNC0hylw79wM9LEsbWWBfXvCBpU/nCRqPz65+EKjhwXS
 AXJ8SfFfPaG50RNAes5lLm+QFO/bq1A9QoKID6M4Mo9oWnPSkZIyauHkMhLvmUV9k/Yg
 CF4g==
X-Gm-Message-State: AOAM531bTkAFYqF8Kuk7P2zdlIHmW/IcEqQRETqPhcvar7NqxKdHnJ00
 Qr98pICIUX40AJdkkXKpQyDYBEoMPKtVC6sg7k86ykmlTSot2/g1LuqotAZ5psQGf2GkMDj3ON1
 RiJe/LaoZISV+TlGYeK/WEecmM9rU
X-Received: by 2002:a05:6000:1a88:b0:20c:6842:d7a7 with SMTP id
 f8-20020a0560001a8800b0020c6842d7a7mr26097254wry.91.1652351913586; 
 Thu, 12 May 2022 03:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJMmJRzqHLrBERa93hnXcbuH2Iog+Mbv1rHA1fZnG4CAmuAhGWl/BbZzzpwYPPUYuGM60w3A==
X-Received: by 2002:a05:6000:1a88:b0:20c:6842:d7a7 with SMTP id
 f8-20020a0560001a8800b0020c6842d7a7mr26097244wry.91.1652351913318; 
 Thu, 12 May 2022 03:38:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a5d4bd0000000b0020c5253d8d8sm4543327wrt.36.2022.05.12.03.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 03:38:33 -0700 (PDT)
Message-ID: <b4c13e79-207d-1e19-4743-29fb8ee93e08@redhat.com>
Date: Thu, 12 May 2022 12:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 7/7] drm/mgag200: Split up connector's mode_valid helper
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20220509103554.11996-1-tzimmermann@suse.de>
 <20220509103554.11996-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220509103554.11996-8-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2022 12:35, Thomas Zimmermann wrote:
> Split up the connector's mode_valid helper into a simple-pipe and a
> mode-config helper. The simple-pipe helper tests for display-size
> limits while the mode-config helper tests for memory-bandwidth limits.
> 
> Also add the mgag200_ prefix to mga_vga_calculate_mode_bandwidth() and
> comment on the function's purpose.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c | 146 ++++++++++++-------------
>   1 file changed, 69 insertions(+), 77 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 92d3ae9489f0..a808827d7a2c 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -681,38 +681,27 @@ static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connecto
>   	return ret;
>   }
>   
> -static uint32_t mga_vga_calculate_mode_bandwidth(struct drm_display_mode *mode,
> -							int bits_per_pixel)
> -{
> -	uint32_t total_area, divisor;
> -	uint64_t active_area, pixels_per_second, bandwidth;
> -	uint64_t bytes_per_pixel = (bits_per_pixel + 7) / 8;
> -
> -	divisor = 1024;
> -
> -	if (!mode->htotal || !mode->vtotal || !mode->clock)
> -		return 0;
> -
> -	active_area = mode->hdisplay * mode->vdisplay;
> -	total_area = mode->htotal * mode->vtotal;
> -
> -	pixels_per_second = active_area * mode->clock * 1000;
> -	do_div(pixels_per_second, total_area);
> -
> -	bandwidth = pixels_per_second * bytes_per_pixel * 100;
> -	do_div(bandwidth, divisor);
> +static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
> +	.get_modes  = mgag200_vga_connector_helper_get_modes,
> +};
>   
> -	return (uint32_t)(bandwidth);
> -}
> +static const struct drm_connector_funcs mga_vga_connector_funcs = {
> +	.reset                  = drm_atomic_helper_connector_reset,
> +	.fill_modes             = drm_helper_probe_single_connector_modes,
> +	.destroy                = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
> +};
>   
> -#define MODE_BANDWIDTH	MODE_BAD
> +/*
> + * Simple Display Pipe
> + */
>   
> -static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
> -				 struct drm_display_mode *mode)
> +static enum drm_mode_status
> +mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
> +				       const struct drm_display_mode *mode)
>   {
> -	struct drm_device *dev = connector->dev;
> -	struct mga_device *mdev = to_mga_device(dev);
> -	int bpp = 32;
> +	struct mga_device *mdev = to_mga_device(pipe->crtc.dev);
>   
>   	if (IS_G200_SE(mdev)) {
>   		u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
> @@ -722,42 +711,17 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
>   				return MODE_VIRTUAL_X;
>   			if (mode->vdisplay > 1200)
>   				return MODE_VIRTUAL_Y;
> -			if (mga_vga_calculate_mode_bandwidth(mode, bpp)
> -				> (24400 * 1024))
> -				return MODE_BANDWIDTH;
>   		} else if (unique_rev_id == 0x02) {
>   			if (mode->hdisplay > 1920)
>   				return MODE_VIRTUAL_X;
>   			if (mode->vdisplay > 1200)
>   				return MODE_VIRTUAL_Y;
> -			if (mga_vga_calculate_mode_bandwidth(mode, bpp)
> -				> (30100 * 1024))
> -				return MODE_BANDWIDTH;
> -		} else {
> -			if (mga_vga_calculate_mode_bandwidth(mode, bpp)
> -				> (55000 * 1024))
> -				return MODE_BANDWIDTH;
>   		}
>   	} else if (mdev->type == G200_WB) {
>   		if (mode->hdisplay > 1280)
>   			return MODE_VIRTUAL_X;
>   		if (mode->vdisplay > 1024)
>   			return MODE_VIRTUAL_Y;
> -		if (mga_vga_calculate_mode_bandwidth(mode, bpp) >
> -		    (31877 * 1024))
> -			return MODE_BANDWIDTH;
> -	} else if (mdev->type == G200_EV &&
> -		(mga_vga_calculate_mode_bandwidth(mode, bpp)
> -			> (32700 * 1024))) {
> -		return MODE_BANDWIDTH;
> -	} else if (mdev->type == G200_EH &&
> -		(mga_vga_calculate_mode_bandwidth(mode, bpp)
> -			> (37500 * 1024))) {
> -		return MODE_BANDWIDTH;
> -	} else if (mdev->type == G200_ER &&
> -		(mga_vga_calculate_mode_bandwidth(mode,
> -			bpp) > (55000 * 1024))) {
> -		return MODE_BANDWIDTH;
>   	}
>   
>   	if ((mode->hdisplay % 8) != 0 || (mode->hsync_start % 8) != 0 ||
> @@ -775,30 +739,6 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
>   	return MODE_OK;
>   }
>   
> -static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
> -	.get_modes  = mgag200_vga_connector_helper_get_modes,
> -	.mode_valid = mga_vga_mode_valid,
> -};
> -
> -static const struct drm_connector_funcs mga_vga_connector_funcs = {
> -	.reset                  = drm_atomic_helper_connector_reset,
> -	.fill_modes             = drm_helper_probe_single_connector_modes,
> -	.destroy                = drm_connector_cleanup,
> -	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> -	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
> -};
> -
> -/*
> - * Simple Display Pipe
> - */
> -
> -static enum drm_mode_status
> -mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
> -				       const struct drm_display_mode *mode)
> -{
> -	return MODE_OK;
> -}
> -
>   static void
>   mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
>   		      struct drm_rect *clip, const struct iosys_map *map)
> @@ -1009,6 +949,31 @@ static const uint64_t mgag200_simple_display_pipe_fmtmods[] = {
>    * Mode config
>    */
>   
> +/* Calculates a mode's required memory bandwidth (in KiB/sec). */
> +static uint32_t mgag200_calculate_mode_bandwidth(const struct drm_display_mode *mode,
> +						 unsigned int bits_per_pixel)
> +{
> +	uint32_t total_area, divisor;
> +	uint64_t active_area, pixels_per_second, bandwidth;
> +	uint64_t bytes_per_pixel = (bits_per_pixel + 7) / 8;
> +
> +	divisor = 1024;
> +
> +	if (!mode->htotal || !mode->vtotal || !mode->clock)
> +		return 0;
> +
> +	active_area = mode->hdisplay * mode->vdisplay;
> +	total_area = mode->htotal * mode->vtotal;
> +
> +	pixels_per_second = active_area * mode->clock * 1000;
> +	do_div(pixels_per_second, total_area);
> +
> +	bandwidth = pixels_per_second * bytes_per_pixel * 100;
> +	do_div(bandwidth, divisor);
> +
> +	return (uint32_t)bandwidth;
> +}
> +
>   static enum drm_mode_status mgag200_mode_config_mode_valid(struct drm_device *dev,
>   							   const struct drm_display_mode *mode)
>   {
> @@ -1024,6 +989,33 @@ static enum drm_mode_status mgag200_mode_config_mode_valid(struct drm_device *de
>   	if (fbpages > max_fbpages)
>   		return MODE_MEM;
>   
> +	if (IS_G200_SE(mdev)) {
> +		u32 unique_rev_id = mdev->model.g200se.unique_rev_id;
> +
> +		if (unique_rev_id == 0x01) {
> +			if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (24400 * 1024))
> +				return MODE_BAD;
> +		} else if (unique_rev_id == 0x02) {
> +			if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (30100 * 1024))
> +				return MODE_BAD;
> +		} else {
> +			if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (55000 * 1024))
> +				return MODE_BAD;
> +		}
> +	} else if (mdev->type == G200_WB) {
> +		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (31877 * 1024))
> +			return MODE_BAD;
> +	} else if (mdev->type == G200_EV) {
> +		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (32700 * 1024))
> +			return MODE_BAD;
> +	} else if (mdev->type == G200_EH) {
> +		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (37500 * 1024))
> +			return MODE_BAD;
> +	} else if (mdev->type == G200_ER) {
> +		if (mgag200_calculate_mode_bandwidth(mode, max_bpp * 8) > (55000 * 1024))
> +			return MODE_BAD;
> +	}
> +
>   	return MODE_OK;
>   }

One suggestion to avoid too much repetition:

static int mgag200_get_bandwidth_kbps(mdev) {

	if (IS_G200_SE(mdev)) {
		u32 unique_rev_id = mdev->model.g200se.unique_rev_id;

		if (unique_rev_id == 0x01) {
			return 24400;
		} else if (unique_rev_id == 0x02) {
			return 30100;
	...

	} else if (mdev->type == G200_ER) {
		return 55000;
	}
	/* No bandwidth defined */
	return 0;
}

then in mgag200_mode_config_mode_valid()

int g200_bandwidth = mgag200_get_bandwidth_kbps(mdev);

if (g200_bandwidth && mgag200_calculate_mode_bandwidth(mode, max_bpp * 
8) > g200_bandwidth * 1024)
	return MODE_BAD;



I've also tested this patchset, and have seen no regression.

you can add

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>

for the whole series.

-- 

Jocelyn




