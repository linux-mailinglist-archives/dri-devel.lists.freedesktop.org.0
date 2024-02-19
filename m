Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92B285A1DE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 12:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF94810E326;
	Mon, 19 Feb 2024 11:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kfoLRF3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231C510E31A;
 Mon, 19 Feb 2024 11:23:57 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41266ef4bc3so4631885e9.3; 
 Mon, 19 Feb 2024 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708341835; x=1708946635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KllHviBteYqichKMWYx5540z8UbscyuO8VqMj6jgLjs=;
 b=kfoLRF3VGfrJnbHdNvnKfIth+JyzxQ1yw+nytUDLWAug8UDzigABelI4lzm2AQScgS
 j2pckzkTyJ7y7NtPRV8tls4Fu72av+VrfofDVfbw+MOeYG8FcN1+7ol9ta/1bUHbCrZq
 u9jb6+OjRXQsLDJW8lEnA5elHhIYNjFQFxg1vWHFSGTijTfpUpNs3O74OikDI0lq0t1U
 9TsUKwmBRMVEgHxXnslhlZ0OS8vS4WqI3QUXh5Cp0j6cQ91vJDlGgfnAv55bLti4SONe
 dX2uIwAsXvYQsCQj4heEHpOnkczOsMhH/WdV/Ne+jsw/8Mkk0Qdp7n9kdeJQKzMIVKJ8
 S3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708341835; x=1708946635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KllHviBteYqichKMWYx5540z8UbscyuO8VqMj6jgLjs=;
 b=kPW+8fWWTacPi7ACRF2dV6VVV8W+p1Tr/7oB5A5QrxYOjpnet8TzLZMwX7QENgEhi/
 vqGf7PDs0Qfd3dIw7tSCbfrGhh8pU+J9GzJHDNKxjbCM/6/bWOOSSFplInGF3lmyJ3XN
 pJ6bkHx1z81l5L+gCptUBxuLNPXB47Zxpi0FzLAXHdZyjv0eChuP2JzowNxA8U6b04TF
 n1mKCc3c8vVsijaiP5Lu72utThcv3gYRt+tXdigf4pbao30OYznFTh1d7zYJ9wtZcgv7
 2uaXLhRS9hMmxb+acURiipNVjWVfQJvV+qgGNNOOG5GlCRSRWTZ6x3v5fNHv5WRAydMU
 5UVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvAVBkYmOrGfPVlxjUsOMto0luZ2RsUwMPftMTFKOuRVGYqYcCxf8n+uZMXOQcPidF2Omj+S/YY2CaarsDU4nzVoEjQYnLcvhgYSQ5aA==
X-Gm-Message-State: AOJu0Yz759GVRxW1kV6KqAIDylT+jx8NxnZky+0NyK03nQ263Be2xiqU
 yl5oKpBsx+pkhtyEdoW3nv9eeRhO48Qvls45fRZbLZUwBAzeN46Q
X-Google-Smtp-Source: AGHT+IGURND98NfUCEOJhVASTqV/ysTcLERacl8mCK+HR1GAfOP/DoPzkTipu4I2XXJT+nNRzfQZjA==
X-Received: by 2002:a5d:5987:0:b0:33d:1896:f895 with SMTP id
 n7-20020a5d5987000000b0033d1896f895mr7217813wri.33.1708341835097; 
 Mon, 19 Feb 2024 03:23:55 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a5d4a11000000b0033cf4e47496sm10045523wrq.51.2024.02.19.03.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 03:23:54 -0800 (PST)
Message-ID: <8f426368-694b-45c2-af05-2055fc8338a5@gmail.com>
Date: Mon, 19 Feb 2024 12:23:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Drop abm_level property
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <Harry.Wentland@amd.com>, 
 Hamza Mahfooz <Hamza.Mahfooz@amd.com>, Sun peng Li <Sunpeng.Li@amd.com>
References: <20240216153334.83372-1-mario.limonciello@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240216153334.83372-1-mario.limonciello@amd.com>
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

Am 16.02.24 um 16:33 schrieb Mario Limonciello:
> This vendor specific property has never been used by userspace
> software and conflicts with the panel_power_savings sysfs file.
> That is a compositor and user could fight over the same data.
>
> Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings sysfs entry to eDP connectors")
> Suggested-by: Harry Wentland <Harry.Wentland@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> --
> Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
> Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       |  8 --------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          |  2 --
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 --------------
>   3 files changed, 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index b8fbe97efe1d..3ecc7ef95172 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -1350,14 +1350,6 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
>   					 "dither",
>   					 amdgpu_dither_enum_list, sz);
>   
> -	if (adev->dc_enabled) {
> -		adev->mode_info.abm_level_property =
> -			drm_property_create_range(adev_to_drm(adev), 0,
> -						  "abm level", 0, 4);
> -		if (!adev->mode_info.abm_level_property)
> -			return -ENOMEM;
> -	}
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index 2e4911050cc5..1fe21a70ddd0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -324,8 +324,6 @@ struct amdgpu_mode_info {
>   	struct drm_property *audio_property;
>   	/* FMT dithering */
>   	struct drm_property *dither_property;
> -	/* Adaptive Backlight Modulation (power feature) */
> -	struct drm_property *abm_level_property;
>   	/* hardcoded DFP edid from BIOS */
>   	struct edid *bios_hardcoded_edid;
>   	int bios_hardcoded_edid_size;
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b9ac3d2f8029..e3b32ffba85a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6388,9 +6388,6 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
>   	} else if (property == adev->mode_info.underscan_property) {
>   		dm_new_state->underscan_enable = val;
>   		ret = 0;
> -	} else if (property == adev->mode_info.abm_level_property) {
> -		dm_new_state->abm_level = val ?: ABM_LEVEL_IMMEDIATE_DISABLE;
> -		ret = 0;
>   	}
>   
>   	return ret;
> @@ -6433,10 +6430,6 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
>   	} else if (property == adev->mode_info.underscan_property) {
>   		*val = dm_state->underscan_enable;
>   		ret = 0;
> -	} else if (property == adev->mode_info.abm_level_property) {
> -		*val = (dm_state->abm_level != ABM_LEVEL_IMMEDIATE_DISABLE) ?
> -			dm_state->abm_level : 0;
> -		ret = 0;
>   	}
>   
>   	return ret;
> @@ -7652,13 +7645,6 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
>   	aconnector->base.state->max_bpc = 16;
>   	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
>   
> -	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
> -	    (dc_is_dmcu_initialized(adev->dm.dc) ||
> -	     adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
> -		drm_object_attach_property(&aconnector->base.base,
> -				adev->mode_info.abm_level_property, 0);
> -	}
> -
>   	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
>   		/* Content Type is currently only implemented for HDMI. */
>   		drm_connector_attach_content_type_property(&aconnector->base);

