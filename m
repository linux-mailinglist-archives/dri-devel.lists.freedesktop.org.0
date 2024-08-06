Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17736948E83
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D8F10E336;
	Tue,  6 Aug 2024 12:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d755XPgw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1EBC10E336
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722946189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qhqg8D/lXKZfi2gweGqpu4U+ORa44Jhy1i1i3X2Ja1M=;
 b=d755XPgwmqjVozWbI56gWgG79ksc0I5zwUekK55zZnH8HQGnKO3xakhaPFrH8JIa2se7aL
 Qby99O6y7TLjv0foaiQYwSZ8UwRaibI4l1N7HWKTdtR7KMxwuPGz1NvkVwaLb7+LRmTc+3
 FNXXW7m7ck8d1j5iIYtL23qKQjlkWkA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-rzujIIWpPVGSTxOp1w1b5A-1; Tue, 06 Aug 2024 08:09:46 -0400
X-MC-Unique: rzujIIWpPVGSTxOp1w1b5A-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4281f8994adso4338255e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 05:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722946185; x=1723550985;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qhqg8D/lXKZfi2gweGqpu4U+ORa44Jhy1i1i3X2Ja1M=;
 b=mH/LaJx0UoCyYj3XVJxXA8tHJIJxuFTufUWT/N0lJqQ9vgd+7G+VYfJ2vkx3qQQtF/
 jjUxCrWdZZfssz7b7Q6Y2UoigKYrFCwtEZU2ftydQfq7jQ1ZGRRs6VV5XwZ77rk6Foan
 /pN14xU6dWEjyzzuZtQMCM++gcKFCbJm1pxFBBfXT2cPQLCn7XJvfn6/64ItjbqSG1Ov
 t6ELlcIpf8ypGYnFNYlHGtGWoxzBka9JCbBr0NohbGCDXCVCZYW0I7ZRuUFBYVVpPXq8
 WyxKthTYTnQPlfZOG3zyoCpEY9BT47fSY44PGjTs71NYAmr1L8clO0riqi9srnlp0aJr
 TYmw==
X-Gm-Message-State: AOJu0YwrA7urlkETo2jux1HP8sblV1aJpeoCAUkxmTM8s8vN8gv5/n3z
 QfxZ5eEnSbUksQus/W8E8Ryl7nCLxD1sXC8ViTKGKc1NMBVTU1jv9A5LK8PmjmghxWIF35NIt8g
 7hfAbXmVF6ZTuudWCtYuDRU+1qCw3R5NTAApEg092JbJN3k6T/8Ci93llORJerQe8LQ==
X-Received: by 2002:a05:600c:4690:b0:426:5fbc:f319 with SMTP id
 5b1f17b1804b1-428e6b8f5f7mr103800465e9.33.1722946184798; 
 Tue, 06 Aug 2024 05:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWu/1tfjSO0nbjLZ/r/5Db51MqWaA51h5MMhOMLX4sv0lFZ45PkBczzAh2GeSXBFm0NqFpKA==
X-Received: by 2002:a05:600c:4690:b0:426:5fbc:f319 with SMTP id
 5b1f17b1804b1-428e6b8f5f7mr103800235e9.33.1722946184269; 
 Tue, 06 Aug 2024 05:09:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e3c0b7sm177421645e9.23.2024.08.06.05.09.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 05:09:43 -0700 (PDT)
Message-ID: <ea85723d-3733-4931-baa5-af3108a076e3@redhat.com>
Date: Tue, 6 Aug 2024 14:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/mgag200: Add VGA-BMC output
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240805130622.63458-1-tzimmermann@suse.de>
 <20240805130622.63458-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240805130622.63458-2-tzimmermann@suse.de>
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
> Duplicate VGA output to VGA-BMC output and update all code for Matrox
> server chips. The new output represents a VGA output that has a BMC
> attached to it. No functional changes so far.

Thanks for this work.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/Makefile          |  1 +
>   drivers/gpu/drm/mgag200/mgag200_drv.h     |  3 +
>   drivers/gpu/drm/mgag200/mgag200_g200eh.c  |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200eh3.c |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 +-
>   drivers/gpu/drm/mgag200/mgag200_vga_bmc.c | 72 +++++++++++++++++++++++
>   10 files changed, 83 insertions(+), 7 deletions(-)
>   create mode 100644 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> 
> diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
> index d1b25f9f6586..5a02203fad12 100644
> --- a/drivers/gpu/drm/mgag200/Makefile
> +++ b/drivers/gpu/drm/mgag200/Makefile
> @@ -12,6 +12,7 @@ mgag200-y := \
>   	mgag200_g200se.o \
>   	mgag200_g200wb.o \
>   	mgag200_mode.o \
> +	mgag200_vga_bmc.o \
>   	mgag200_vga.o
>   
>   obj-$(CONFIG_DRM_MGAG200) += mgag200.o
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 8df3c84d2405..1301d3066a49 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -437,6 +437,9 @@ void mgag200_enable_display(struct mga_device *mdev);
>   void mgag200_init_registers(struct mga_device *mdev);
>   int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_available);
>   
> +/* mgag200_vga_bmc.c */
> +int mgag200_vga_bmc_output_init(struct mga_device *mdev);
> +
>   /* mgag200_vga.c */
>   int mgag200_vga_output_init(struct mga_device *mdev);
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> index 72bd8e3421c2..1824c0e59c03 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
> @@ -215,7 +215,7 @@ static int mgag200_g200eh_pipeline_init(struct mga_device *mdev)
>   	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
>   
> -	ret = mgag200_vga_output_init(mdev);
> +	ret = mgag200_vga_bmc_output_init(mdev);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> index 1bbb0745b84a..9cb2a165e460 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
> @@ -119,7 +119,7 @@ static int mgag200_g200eh3_pipeline_init(struct mga_device *mdev)
>   	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
>   
> -	ret = mgag200_vga_output_init(mdev);
> +	ret = mgag200_vga_bmc_output_init(mdev);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index e65d59173939..e0f7816ad87a 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -258,7 +258,7 @@ static int mgag200_g200er_pipeline_init(struct mga_device *mdev)
>   	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
>   
> -	ret = mgag200_vga_output_init(mdev);
> +	ret = mgag200_vga_bmc_output_init(mdev);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index a4890b496050..a2c683f82127 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -259,7 +259,7 @@ static int mgag200_g200ev_pipeline_init(struct mga_device *mdev)
>   	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
>   
> -	ret = mgag200_vga_output_init(mdev);
> +	ret = mgag200_vga_bmc_output_init(mdev);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> index fbaa97c7e0da..7a2806be2d2e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> @@ -128,7 +128,7 @@ static int mgag200_g200ew3_pipeline_init(struct mga_device *mdev)
>   	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
>   
> -	ret = mgag200_vga_output_init(mdev);
> +	ret = mgag200_vga_bmc_output_init(mdev);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index fcb97e4253c4..b83f3f31ed0e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -390,7 +390,7 @@ static int mgag200_g200se_pipeline_init(struct mga_device *mdev)
>   	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
>   
> -	ret = mgag200_vga_output_init(mdev);
> +	ret = mgag200_vga_bmc_output_init(mdev);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> index 33ef35c95acb..cb971ca5e306 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> @@ -262,7 +262,7 @@ static int mgag200_g200wb_pipeline_init(struct mga_device *mdev)
>   	drm_mode_crtc_set_gamma_size(crtc, MGAG200_LUT_SIZE);
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, MGAG200_LUT_SIZE);
>   
> -	ret = mgag200_vga_output_init(mdev);
> +	ret = mgag200_vga_bmc_output_init(mdev);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> new file mode 100644
> index 000000000000..b6b90632b3c6
> --- /dev/null
> +++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
> @@ -0,0 +1,72 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "mgag200_ddc.h"
> +#include "mgag200_drv.h"
> +
> +static const struct drm_encoder_funcs mgag200_dac_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup
> +};
> +
> +static const struct drm_connector_helper_funcs mgag200_vga_connector_helper_funcs = {
> +	.get_modes = drm_connector_helper_get_modes,
> +	.detect_ctx = drm_connector_helper_detect_from_ddc
> +};
> +
> +static const struct drm_connector_funcs mgag200_vga_connector_funcs = {
> +	.reset                  = drm_atomic_helper_connector_reset,
> +	.fill_modes             = drm_helper_probe_single_connector_modes,
> +	.destroy                = drm_connector_cleanup,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state
> +};
> +
> +int mgag200_vga_bmc_output_init(struct mga_device *mdev)
> +{
> +	struct drm_device *dev = &mdev->base;
> +	struct drm_crtc *crtc = &mdev->crtc;
> +	struct drm_encoder *encoder;
> +	struct drm_connector *connector;
> +	struct i2c_adapter *ddc;
> +	int ret;
> +
> +	encoder = &mdev->output.vga.encoder;
> +	ret = drm_encoder_init(dev, encoder, &mgag200_dac_encoder_funcs,
> +			       DRM_MODE_ENCODER_DAC, NULL);
> +	if (ret) {
> +		drm_err(dev, "drm_encoder_init() failed: %d\n", ret);
> +		return ret;
> +	}
> +	encoder->possible_crtcs = drm_crtc_mask(crtc);
> +
> +	ddc = mgag200_ddc_create(mdev);
> +	if (IS_ERR(ddc)) {
> +		ret = PTR_ERR(ddc);
> +		drm_err(dev, "failed to add DDC bus: %d\n", ret);
> +		return ret;
> +	}
> +
> +	connector = &mdev->output.vga.connector;
> +	ret = drm_connector_init_with_ddc(dev, connector,
> +					  &mgag200_vga_connector_funcs,
> +					  DRM_MODE_CONNECTOR_VGA, ddc);
> +	if (ret) {
> +		drm_err(dev, "drm_connector_init_with_ddc() failed: %d\n", ret);
> +		return ret;
> +	}
> +	drm_connector_helper_add(connector, &mgag200_vga_connector_helper_funcs);
> +
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
> +			    DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +	ret = drm_connector_attach_encoder(connector, encoder);
> +	if (ret) {
> +		drm_err(dev, "drm_connector_attach_encoder() failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

