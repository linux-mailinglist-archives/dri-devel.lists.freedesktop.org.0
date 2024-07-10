Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4835B92D42B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 16:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C380310E7F1;
	Wed, 10 Jul 2024 14:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TcWnt5M6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D4E10E7F1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 14:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720621589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLpje94ko4rJbRiat9uARaebkBWqPj9eNqna53WMfVE=;
 b=TcWnt5M6Rl6/UvUjXqWn7kWvxJhlrTa9Vzs1K43Pgtbv5IZ2l2Awx2rQP4dJUDco8DfY/Y
 CUGmeGTu/R4VYYECPYtPYnP19ur+kAqRvVd2ouQlGzR/iif8Agp+/XV9URCLXsPnwX4JgB
 7hyidTwCLxMDRKOkBN07UuEiNkFXFd4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-ftbH2glEMp-uCEgJ_6Z22A-1; Wed, 10 Jul 2024 10:26:28 -0400
X-MC-Unique: ftbH2glEMp-uCEgJ_6Z22A-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-367990b4beeso4332714f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 07:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720621586; x=1721226386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YLpje94ko4rJbRiat9uARaebkBWqPj9eNqna53WMfVE=;
 b=YG9MCucJdYyx0w2lT+qd54zHcrQV/f/tq5kac0/YZuoDlgBjiYvibyC4ZC/L6/ZGlw
 UqgrrYBo+XW8Ve/nD4pR4Vz2boStPe72NSpr2qVvWxYcFEqdP7mko9rKL1eaTXtEgo07
 7dAto7uAswA7fU+RSYb3UmGHoBVYijQg9nB1K0A5MAMRxqi4BXZ7rqxOzsRoADrEN1uk
 USoKoxAujL+Y+raMF7s3+ppTvIiZ+kJmAaIxPKbhKst1zR7OGFCYV3VO+AA13nqmxG+C
 PFTeQ6+i+B/eqvhn1TRFLg/VnnJglw1wOzceEEIJHGglZ2CK7gAjKI0jPKLTFx6QcJuC
 a1NQ==
X-Gm-Message-State: AOJu0Yz/RPl1rLVbJduwiAIlnjSgnBhK38BtNChA1cO0yi2H1rqrh+AK
 TAsuum669fiVTaDHHBv1c/T32K9WgJwEWn4awpHn5Wln3ag3kpHnnMDmOjzPB1QUZYlfFtaMfou
 KhL/pAgZ6/vnyjlaWZcJIiVkjrk0tMmd5FegJeWyEp3qpB0S2u1IiuPrs2Ykgks7LjX4Fcj8gJQ
 ==
X-Received: by 2002:a05:6000:54a:b0:367:975c:e551 with SMTP id
 ffacd0b85a97d-367cea962femr3892425f8f.33.1720621586376; 
 Wed, 10 Jul 2024 07:26:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSa2oHWWThSK1FvVmePH3SW8D8uNWJa6v6ME2mSW52hoRa52FleXnBikOFq24NEznOMIIKVg==
X-Received: by 2002:a05:6000:54a:b0:367:975c:e551 with SMTP id
 ffacd0b85a97d-367cea962femr3892408f8f.33.1720621585880; 
 Wed, 10 Jul 2024 07:26:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde846a3sm5481229f8f.30.2024.07.10.07.26.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 07:26:25 -0700 (PDT)
Message-ID: <d5a559a9-5e22-47ed-bfad-5bab4e521a4f@redhat.com>
Date: Wed, 10 Jul 2024 16:26:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/mgag200: Remove vidrst callbacks from struct
 mgag200_device_funcs
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240710084609.354578-1-tzimmermann@suse.de>
 <20240710084609.354578-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240710084609.354578-3-tzimmermann@suse.de>
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



On 10/07/2024 10:42, Thomas Zimmermann wrote:
> The callbacks disable_vidrst and enable_vidrst are obsolete. Remove
> the fields from struct mgag200_device_funcs. Instead call their
> implementations directly of the field 'has_vidrst' has been set in
> struct mgag200_device_info.
> 
> Also change the logic slightly. The BMC used to start and stop scanout
> during the CRTC's atomic_enable and atomic_disable. Plane updates were
> done while the BMC scanned out the display. Now only stop once in
> atomic_disable at the beginning of a modeset and then restart the
> scanout at the end of a modeset in atomic_enable. While the modeset
> takes place, the BMC does not scanout at all.


Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.h     | 12 ------------
>   drivers/gpu/drm/mgag200/mgag200_g200er.c  |  7 ++-----
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c  |  7 ++-----
>   drivers/gpu/drm/mgag200/mgag200_g200ew3.c |  2 --
>   drivers/gpu/drm/mgag200/mgag200_g200se.c  |  7 ++-----
>   drivers/gpu/drm/mgag200/mgag200_g200wb.c  |  2 --
>   drivers/gpu/drm/mgag200/mgag200_mode.c    | 15 ++++-----------
>   7 files changed, 10 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 4b75613de882..4a46c8c006c8 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -247,18 +247,6 @@ struct mgag200_device_info {
>   	}
>   
>   struct mgag200_device_funcs {
> -	/*
> -	 * Disables an external reset source (i.e., BMC) before programming
> -	 * a new display mode.
> -	 */
> -	void (*disable_vidrst)(struct mga_device *mdev);
> -
> -	/*
> -	 * Enables an external reset source (i.e., BMC) after programming
> -	 * a new display mode.
> -	 */
> -	void (*enable_vidrst)(struct mga_device *mdev);
> -
>   	/*
>   	 * Validate that the given state can be programmed into PIXPLLC. On
>   	 * success, the calculated parameters should be stored in the CRTC's
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index abfbed6ec390..b3bb3e9fb0d1 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -191,9 +191,6 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
>   	const struct drm_format_info *format = mgag200_crtc_state->format;
>   
> -	if (funcs->disable_vidrst)
> -		funcs->disable_vidrst(mdev);
> -
>   	mgag200_set_format_regs(mdev, format);
>   	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
>   
> @@ -209,8 +206,8 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (funcs->enable_vidrst)
> -		funcs->enable_vidrst(mdev);
> +	if (mdev->info->has_vidrst)
> +		mgag200_bmc_enable_vidrst(mdev);
>   }
>   
>   static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index acc99999e2b5..3ac0a508e2c5 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -192,9 +192,6 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
>   	const struct drm_format_info *format = mgag200_crtc_state->format;
>   
> -	if (funcs->disable_vidrst)
> -		funcs->disable_vidrst(mdev);
> -
>   	mgag200_set_format_regs(mdev, format);
>   	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
>   
> @@ -210,8 +207,8 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (funcs->enable_vidrst)
> -		funcs->enable_vidrst(mdev);
> +	if (mdev->info->has_vidrst)
> +		mgag200_bmc_enable_vidrst(mdev);
>   }
>   
>   static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> index 839401e8b465..265f3e95830a 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
> @@ -146,8 +146,6 @@ static const struct mgag200_device_info mgag200_g200ew3_device_info =
>   	MGAG200_DEVICE_INFO_INIT(2048, 2048, 0, true, 0, 1, false);
>   
>   static const struct mgag200_device_funcs mgag200_g200ew3_device_funcs = {
> -	.disable_vidrst = mgag200_bmc_disable_vidrst,
> -	.enable_vidrst = mgag200_bmc_enable_vidrst,
>   	.pixpllc_atomic_check = mgag200_g200ew3_pixpllc_atomic_check,
>   	.pixpllc_atomic_update = mgag200_g200wb_pixpllc_atomic_update, // same as G200WB
>   };
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index be4e124102c6..7a8099eb100c 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -323,9 +323,6 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
>   	const struct drm_format_info *format = mgag200_crtc_state->format;
>   
> -	if (funcs->disable_vidrst)
> -		funcs->disable_vidrst(mdev);
> -
>   	mgag200_set_format_regs(mdev, format);
>   	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
>   
> @@ -341,8 +338,8 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (funcs->enable_vidrst)
> -		funcs->enable_vidrst(mdev);
> +	if (mdev->info->has_vidrst)
> +		mgag200_bmc_enable_vidrst(mdev);
>   }
>   
>   static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> index 835df0f4fc13..e25477347c3e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
> @@ -280,8 +280,6 @@ static const struct mgag200_device_info mgag200_g200wb_device_info =
>   	MGAG200_DEVICE_INFO_INIT(1280, 1024, 31877, true, 0, 1, false);
>   
>   static const struct mgag200_device_funcs mgag200_g200wb_device_funcs = {
> -	.disable_vidrst = mgag200_bmc_disable_vidrst,
> -	.enable_vidrst = mgag200_bmc_enable_vidrst,
>   	.pixpllc_atomic_check = mgag200_g200wb_pixpllc_atomic_check,
>   	.pixpllc_atomic_update = mgag200_g200wb_pixpllc_atomic_update,
>   };
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index e746f365fecf..fcc10723d385 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -657,9 +657,6 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
>   	struct mgag200_crtc_state *mgag200_crtc_state = to_mgag200_crtc_state(crtc_state);
>   	const struct drm_format_info *format = mgag200_crtc_state->format;
>   
> -	if (funcs->disable_vidrst)
> -		funcs->disable_vidrst(mdev);
> -
>   	mgag200_set_format_regs(mdev, format);
>   	mgag200_set_mode_regs(mdev, adjusted_mode, mgag200_crtc_state->set_vidrst);
>   
> @@ -673,22 +670,18 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (funcs->enable_vidrst)
> -		funcs->enable_vidrst(mdev);
> +	if (mdev->info->has_vidrst)
> +		mgag200_bmc_enable_vidrst(mdev);
>   }
>   
>   void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
>   {
>   	struct mga_device *mdev = to_mga_device(crtc->dev);
> -	const struct mgag200_device_funcs *funcs = mdev->funcs;
>   
> -	if (funcs->disable_vidrst)
> -		funcs->disable_vidrst(mdev);
> +	if (mdev->info->has_vidrst)
> +		mgag200_bmc_disable_vidrst(mdev);
>   
>   	mgag200_disable_display(mdev);
> -
> -	if (funcs->enable_vidrst)
> -		funcs->enable_vidrst(mdev);
>   }
>   
>   void mgag200_crtc_reset(struct drm_crtc *crtc)

