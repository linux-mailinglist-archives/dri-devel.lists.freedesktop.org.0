Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1489948E8B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A43B10E33C;
	Tue,  6 Aug 2024 12:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cUvrH/y/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B3F10E33C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722946213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+l1JQNhkVTidIBCSNNxq7Jxkqw5y6WGCQTagoaFGvZI=;
 b=cUvrH/y/ik5KlN8iE8A9jLpYJiWy0CnhcSG3L3E87pPZEG5IFIu7hGhluDkkd9UP5gMyY5
 CaO/9Nm3nJFSqV2noVOYZKP/ZP3isxG1bx4VDlEjBqmfHRN8m+07FTRU09d9ANc/Fd1sF+
 uqAayteVIZZutu3hNyXunftVXFSe5oA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-2EdTZ210OFikIVPxxOJx0Q-1; Tue, 06 Aug 2024 08:10:10 -0400
X-MC-Unique: 2EdTZ210OFikIVPxxOJx0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4280a39ecebso32011875e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 05:10:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722946209; x=1723551009;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+l1JQNhkVTidIBCSNNxq7Jxkqw5y6WGCQTagoaFGvZI=;
 b=WBCc6DorQbHY+0NGFyWZWf3XG/2zvRj+FHOhI7M1UJHkGKHy3kKcAneAm3KcnIIzr5
 xFUDpDrsWIJWsvGjDk1pgWzOxQ+0+D03xeVfFca3bCG6Zjhb8TgpfdR4v5vKaPophQrg
 lOqwASFvVHkppMcU1Yx190H+EsRQvzHqTya1f/uIOCz/N/I6Xm46Ky0Az7N2RKzt5c0g
 iLnNTw+/uN6rnVCVaGtgkvmJ3K7neEDvH60L0+LjPeq9goWQ2f+CY0mmMpXly9Z1yS0O
 tnYpdSMreMkAouhBAXdVjHak/h/gX9XYPvnMs7eDM1kjTUNDdk1bMxD+R64NjdUHlwPm
 Pz2Q==
X-Gm-Message-State: AOJu0YzOly3SEP5FlaVcCNEAUKxiREUwhnNLud6tYgraWTe5H+uGZX8s
 NaAWbqGYFOpaaDWh1oXP5HGY6oG1mGLtVTKoGjlP+t7u2YpvpvTOzZB4OB/LthRsWW+mVDbWRZf
 6DW3EoqOZbX4LfUU7gKO67IcJWW+CyWHoTysVXuksPdLumqgoQGrVoKCLTg7iWEEehA==
X-Received: by 2002:a05:6000:dcf:b0:366:e9f7:4e73 with SMTP id
 ffacd0b85a97d-36bb35844aamr11746802f8f.5.1722946209190; 
 Tue, 06 Aug 2024 05:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5CFbEhpyObRt1iyB1Cr+5y24NdCambaeegPAsSiOBR4QD4aGb5bRRuBYsJRIVF1UigqqFPw==
X-Received: by 2002:a05:6000:dcf:b0:366:e9f7:4e73 with SMTP id
 ffacd0b85a97d-36bb35844aamr11746775f8f.5.1722946208747; 
 Tue, 06 Aug 2024 05:10:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf0c348sm12812831f8f.24.2024.08.06.05.10.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 05:10:08 -0700 (PDT)
Message-ID: <a3853f69-3127-45db-98a9-d450f6c9be22@redhat.com>
Date: Tue, 6 Aug 2024 14:10:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/mgag200: vga-bmc: Control CRTC VIDRST flag from
 encoder
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240805130622.63458-1-tzimmermann@suse.de>
 <20240805130622.63458-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240805130622.63458-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05/08/2024 15:05, Thomas Zimmermann wrote:
> Control the VIDRST pin from the VGA-BMC encoder's atomic_check and
> remove the respective code from CRTC. Makes the VIDRST functionality
> fully composable.
> 
> The VIDRST pin allows an external clock source to control the SYNC
> signals of the Matrox chip. The functionality is part of the CRTC,
> but depends on the presence of the clock source. This is the case for
> some BMCs, so control the pin from the VGA-BMC output.


Thanks for this work.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_mode.c    |  3 ---
>   drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 18 ++++++++++++++++++
>   2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index dd125ef15559..8dc16821e1cd 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -611,7 +611,6 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
>   	struct mga_device *mdev = to_mga_device(dev);
>   	const struct mgag200_device_funcs *funcs = mdev->funcs;
>   	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
> -	struct mgag200_crtc_state *new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
>   	struct drm_property_blob *new_gamma_lut = new_crtc_state->gamma_lut;
>   	int ret;
>   
> @@ -622,8 +621,6 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
>   	if (ret)
>   		return ret;
>   
> -	new_mgag200_crtc_state->set_vidrst = mdev->info->sync_bmc;
> -
>   	if (new_crtc_state->mode_changed) {
>   		if (funcs->pixpllc_atomic_check) {
>   			ret = funcs->pixpllc_atomic_check(crtc, new_state);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> index 3a958c3587ac..77340f2dee17 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> @@ -8,6 +8,22 @@
>   #include "mgag200_ddc.h"
>   #include "mgag200_drv.h"
>   
> +static int mgag200_vga_bmc_encoder_atomic_check(struct drm_encoder *encoder,
> +						struct drm_crtc_state *new_crtc_state,
> +						struct drm_connector_state *new_connector_state)
> +{
> +	struct mga_device *mdev = to_mga_device(encoder->dev);
> +	struct mgag200_crtc_state *new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
> +
> +	new_mgag200_crtc_state->set_vidrst = mdev->info->sync_bmc;
> +
> +	return 0;
> +}
> +
> +static const struct drm_encoder_helper_funcs mgag200_dac_encoder_helper_funcs = {
> +	.atomic_check = mgag200_vga_bmc_encoder_atomic_check,
> +};
> +
>   static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
>   	.destroy = drm_encoder_cleanup
>   };
> @@ -86,6 +102,8 @@ int mgag200_vga_bmc_output_init(struct mga_device *mdev)
>   		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
>   		return ret;
>   	}
> +	drm_encoder_helper_add(encoder, &mgag200_dac_encoder_helper_funcs);
> +
>   	encoder->possible_crtcs = drm_crtc_mask(crtc);
>   
>   	ddc = mgag200_ddc_create(mdev);

