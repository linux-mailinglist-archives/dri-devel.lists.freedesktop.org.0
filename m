Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C413292D42D
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 16:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3668810E7F2;
	Wed, 10 Jul 2024 14:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XFJpnowE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E5010E7F2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720621626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/WhkE03izr9IVT+WSuvJmiYAmBnP7PNEbXcq7Ek31l0=;
 b=XFJpnowE7hDDMEjsqzgRxOXJGtsYJoLCNPXZG04d5E0VlEjvkY6Av+23PWfyCayTY54Ylu
 pWk8neWCEf/1/XMEPDQ3TgFOxDxxQE8p2hdW6W9m+B0RmrPM1ilVf5UEdzZehD4CJSvGPo
 EWebUHEERDRrLZLQwJ72WSknPzimd2M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-UtN4ZhVIOnevejo84bqoSA-1; Wed, 10 Jul 2024 10:27:04 -0400
X-MC-Unique: UtN4ZhVIOnevejo84bqoSA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-367990b4beeso4333089f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 07:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720621623; x=1721226423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/WhkE03izr9IVT+WSuvJmiYAmBnP7PNEbXcq7Ek31l0=;
 b=UpY3RWDmHReP0S1dLJwsWCdpf0cIgQUEBYf8fy9ec08moTacTMS1O7DMkLI/4XRhgA
 HaQRmVzJN17AJrsoTyfzJrGqHvohaf89fn+e/CbEsfHJHh1Wew39TogeIGTgfQU/++b0
 D0VJpiOLW/vcP4OXx/ecHxicdRQ66N7ReXgG0FPyy2KBoW9yp8xXbQHRIEGGy5ZerNlb
 3/ZHTXIHQOToYctyPUI3tgo8exn6M3ln2naG9kohuGid22sKheorNsQjeXbCWFVuzaok
 BfQNvnTnYiaMvv/IE9bJc+QnYB5bq0nNzBwBaxekjGp3T4VJ0/AlpxGszN9Ez+KnVmpC
 EfmQ==
X-Gm-Message-State: AOJu0YyWYXIYmTLc2s1PQN5mc9dzG3OR1ur1DY7MR+RjZZ75MAd8R7ep
 dkLvmsKvPAYigrBHHnMcAne4gJWwARYwfESSdFNpJzO42v7ZA8RgmOKo0iAvcaODTQ6EKfM54zg
 IbSHH2jjPWqLfaVghaoO4KvbSMCi/0TRE6Q/nfXPhjaAHpr+GX/c1/w4mUeukMq3+bg==
X-Received: by 2002:adf:ae52:0:b0:360:9c4f:1f8 with SMTP id
 ffacd0b85a97d-367cea966a5mr3403695f8f.34.1720621623594; 
 Wed, 10 Jul 2024 07:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdmVJg6Qpd5jAxKzIWsx5UjX++oH9KTGh9yXsucotdTxaqyV6QfwfcrkQo4BMzZw56wKPgRw==
X-Received: by 2002:adf:ae52:0:b0:360:9c4f:1f8 with SMTP id
 ffacd0b85a97d-367cea966a5mr3403677f8f.34.1720621623169; 
 Wed, 10 Jul 2024 07:27:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa0672sm5498485f8f.79.2024.07.10.07.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 07:27:02 -0700 (PDT)
Message-ID: <ee79a3d8-41e6-4857-aad4-36fe80c7c6d6@redhat.com>
Date: Wed, 10 Jul 2024 16:27:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/mgag200: Rename BMC vidrst names
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20240710084609.354578-1-tzimmermann@suse.de>
 <20240710084609.354578-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240710084609.354578-4-tzimmermann@suse.de>
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
> The BMC's scanout synchronization is only indirectly related to the
> VIDRST functionality. Do some renaming.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_bmc.c    |  4 ++--
>   drivers/gpu/drm/mgag200/mgag200_drv.h    | 14 +++++++-------
>   drivers/gpu/drm/mgag200/mgag200_g200er.c |  4 ++--
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c |  4 ++--
>   drivers/gpu/drm/mgag200/mgag200_g200se.c |  4 ++--
>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 10 +++++-----
>   6 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> index 1c7aa4f36787..45e35dffb3ea 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
> @@ -14,7 +14,7 @@ static struct mgag200_bmc_connector *to_mgag200_bmc_connector(struct drm_connect
>   	return container_of(connector, struct mgag200_bmc_connector, base);
>   }
>   
> -void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
> +void mgag200_bmc_stop_scanout(struct mga_device *mdev)
>   {
>   	u8 tmp;
>   	int iter_max;
> @@ -73,7 +73,7 @@ void mgag200_bmc_disable_vidrst(struct mga_device *mdev)
>   	}
>   }
>   
> -void mgag200_bmc_enable_vidrst(struct mga_device *mdev)
> +void mgag200_bmc_start_scanout(struct mga_device *mdev)
>   {
>   	u8 tmp;
>   
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 4a46c8c006c8..f97eaa49b089 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -216,8 +216,8 @@ struct mgag200_device_info {
>   	 */
>   	unsigned long max_mem_bandwidth;
>   
> -	/* HW has external source (e.g., BMC) to synchronize with */
> -	bool has_vidrst:1;
> +	/* Synchronize scanout with BMC */
> +	bool sync_bmc:1;
>   
>   	struct {
>   		unsigned data_bit:3;
> @@ -232,13 +232,13 @@ struct mgag200_device_info {
>   };
>   
>   #define MGAG200_DEVICE_INFO_INIT(_max_hdisplay, _max_vdisplay, _max_mem_bandwidth, \
> -				 _has_vidrst, _i2c_data_bit, _i2c_clock_bit, \
> +				 _sync_bmc, _i2c_data_bit, _i2c_clock_bit, \
>   				 _bug_no_startadd) \
>   	{ \
>   		.max_hdisplay = (_max_hdisplay), \
>   		.max_vdisplay = (_max_vdisplay), \
>   		.max_mem_bandwidth = (_max_mem_bandwidth), \
> -		.has_vidrst = (_has_vidrst), \
> +		.sync_bmc = (_sync_bmc), \
>   		.i2c = { \
>   			.data_bit = (_i2c_data_bit), \
>   			.clock_bit = (_i2c_clock_bit), \
> @@ -430,9 +430,9 @@ int mgag200_mode_config_init(struct mga_device *mdev, resource_size_t vram_avail
>   /* mgag200_vga.c */
>   int mgag200_vga_output_init(struct mga_device *mdev);
>   
> -				/* mgag200_bmc.c */
> -void mgag200_bmc_disable_vidrst(struct mga_device *mdev);
> -void mgag200_bmc_enable_vidrst(struct mga_device *mdev);
> +/* mgag200_bmc.c */
> +void mgag200_bmc_stop_scanout(struct mga_device *mdev);
> +void mgag200_bmc_start_scanout(struct mga_device *mdev);
>   int mgag200_bmc_output_init(struct mga_device *mdev, struct drm_connector *physical_connector);
>   
>   #endif				/* __MGAG200_DRV_H__ */
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index b3bb3e9fb0d1..737a48aa9160 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -206,8 +206,8 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (mdev->info->has_vidrst)
> -		mgag200_bmc_enable_vidrst(mdev);
> +	if (mdev->info->sync_bmc)
> +		mgag200_bmc_start_scanout(mdev);
>   }
>   
>   static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index 3ac0a508e2c5..8d1ccc2ad94a 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -207,8 +207,8 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (mdev->info->has_vidrst)
> -		mgag200_bmc_enable_vidrst(mdev);
> +	if (mdev->info->sync_bmc)
> +		mgag200_bmc_start_scanout(mdev);
>   }
>   
>   static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index 7a8099eb100c..cf7f6897838f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -338,8 +338,8 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (mdev->info->has_vidrst)
> -		mgag200_bmc_enable_vidrst(mdev);
> +	if (mdev->info->sync_bmc)
> +		mgag200_bmc_start_scanout(mdev);
>   }
>   
>   static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index fcc10723d385..735eb5906892 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -610,7 +610,7 @@ int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_st
>   	if (ret)
>   		return ret;
>   
> -	new_mgag200_crtc_state->set_vidrst = mdev->info->has_vidrst;
> +	new_mgag200_crtc_state->set_vidrst = mdev->info->sync_bmc;
>   
>   	if (new_crtc_state->mode_changed) {
>   		if (funcs->pixpllc_atomic_check) {
> @@ -670,16 +670,16 @@ void mgag200_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_
>   
>   	mgag200_enable_display(mdev);
>   
> -	if (mdev->info->has_vidrst)
> -		mgag200_bmc_enable_vidrst(mdev);
> +	if (mdev->info->sync_bmc)
> +		mgag200_bmc_start_scanout(mdev);
>   }
>   
>   void mgag200_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *old_state)
>   {
>   	struct mga_device *mdev = to_mga_device(crtc->dev);
>   
> -	if (mdev->info->has_vidrst)
> -		mgag200_bmc_disable_vidrst(mdev);
> +	if (mdev->info->sync_bmc)
> +		mgag200_bmc_stop_scanout(mdev);
>   
>   	mgag200_disable_display(mdev);
>   }

