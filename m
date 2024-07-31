Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3299434AB
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 19:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D1810E6A4;
	Wed, 31 Jul 2024 17:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Xd6IYbeV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFBC010E6A4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 17:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722445457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDFdzUtWm1uC35jrgYi2K22RGJ2XdD9baDWAfehO8X4=;
 b=Xd6IYbeVcwh6ZSGo/4IUafvNIo0swzJmB+7I1sgawQ6Z6NzNHgtLvFPZSMqfc8KSJSw4Qe
 xOe3xpWW+QhIT1ADLpliHSJQcAaEoSyVdQuqZNFUvbuSlw0t+j/+wlLWufxFvlKNUmN912
 0UwefHxtPGtFmgwRKxhpJ6byXmeLlHY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-5PQLeo4ZMeyTkiO85E0tGQ-1; Wed, 31 Jul 2024 13:04:15 -0400
X-MC-Unique: 5PQLeo4ZMeyTkiO85E0tGQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ef22e62457so58108911fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 10:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722445454; x=1723050254;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xDFdzUtWm1uC35jrgYi2K22RGJ2XdD9baDWAfehO8X4=;
 b=Eg8KbB8EOFelCcEmi7u7c1V8/gDRRV1JV5Kn0e71mTuPr+66lVMJ+OHXnS8DaVhZLT
 aPgakpML7xsEoPNoK8E6XRtXP1Tb47J7pV8knOpKS3Jw594Olpty75eUYqX5VXbTSg/j
 8OMMbqZMwJ63FuF7AeB9bWybzM2sl7lEPXSDHEzpV0VkCQpDswgrgjWV9tOR8ULEalw6
 udBkFJj22bWIGlHB9XmttsiDkaCtbY9parTZFRDU6w5IthNWNqxX0U1PZlfu0HsTzglc
 O6IyxLqMgVnQ6DSwI+rFRm26Ef6Yb2gQO2o7rHDZOBs7ZWtalyTdRyo31Ujx/fld0M2+
 KnFA==
X-Gm-Message-State: AOJu0YxrSS9hpOfLHcuTn/Lx95z3k1xrS3fa3toLb8S3e0uz/M+IizL9
 NvqGEKPYtLED5C9550DMI966H13m1x6rsC6a52X3gwjqjqihS93JLDLF6GE237wqVPlLKreH4Pk
 gRCb4mHkzqkmyc0DN4/uEuLtt0O+slibVYrkV7/LXFVQ3wc4cqMmSXIRE+tNdo5Xdhg==
X-Received: by 2002:a2e:7814:0:b0:2ef:2c86:4d47 with SMTP id
 38308e7fff4ca-2f1530e8e0cmr549491fa.15.1722445453769; 
 Wed, 31 Jul 2024 10:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX09D99+Ytn5uWWP5OX5BoMsNo4vXMCrP6+cmGhCeTzuqAq6U95COpQEHGu0NqRhUAKCnYaQ==
X-Received: by 2002:a2e:7814:0:b0:2ef:2c86:4d47 with SMTP id
 38308e7fff4ca-2f1530e8e0cmr549121fa.15.1722445453108; 
 Wed, 31 Jul 2024 10:04:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bba283fsm27551615e9.46.2024.07.31.10.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 10:04:12 -0700 (PDT)
Message-ID: <36111c9a-7b44-4655-984c-ab22c755e463@redhat.com>
Date: Wed, 31 Jul 2024 19:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Fix VBLANK interrupt handling
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20240731071004.519566-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240731071004.519566-1-tzimmermann@suse.de>
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


On 31/07/2024 09:09, Thomas Zimmermann wrote:
> Fix support for VBLANK interrupts on G200ER, G200EV and G200SE, which
> use a slightly different implementation than the others. The original
> commits forgot to update the custom helpers when adding interrupt
> handling for VBLANK events.

Thanks, it looks good to me.
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 89c6ea2006e2 ("drm/mgag200: Add vblank support")
> Fixes: d5070c9b2944 ("drm/mgag200: Implement struct drm_crtc_funcs.get_vblank_timestamp")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/mgag200/mgag200_g200er.c | 5 ++++-
>   drivers/gpu/drm/mgag200/mgag200_g200ev.c | 5 ++++-
>   drivers/gpu/drm/mgag200/mgag200_g200se.c | 5 ++++-
>   3 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> index 6d727ab1a7aa..e65d59173939 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
> @@ -209,6 +209,8 @@ static void mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	if (mdev->info->sync_bmc)
>   		mgag200_bmc_start_scanout(mdev);
> +
> +	drm_crtc_vblank_on(crtc);
>   }
>   
>   static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
> @@ -216,7 +218,8 @@ static const struct drm_crtc_helper_funcs mgag200_g200er_crtc_helper_funcs = {
>   	.atomic_check = mgag200_crtc_helper_atomic_check,
>   	.atomic_flush = mgag200_crtc_helper_atomic_flush,
>   	.atomic_enable = mgag200_g200er_crtc_helper_atomic_enable,
> -	.atomic_disable = mgag200_crtc_helper_atomic_disable
> +	.atomic_disable = mgag200_crtc_helper_atomic_disable,
> +	.get_scanout_position = mgag200_crtc_helper_get_scanout_position,
>   };
>   
>   static const struct drm_crtc_funcs mgag200_g200er_crtc_funcs = {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> index e6c9ba61bf97..a4890b496050 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
> @@ -210,6 +210,8 @@ static void mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	if (mdev->info->sync_bmc)
>   		mgag200_bmc_start_scanout(mdev);
> +
> +	drm_crtc_vblank_on(crtc);
>   }
>   
>   static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
> @@ -217,7 +219,8 @@ static const struct drm_crtc_helper_funcs mgag200_g200ev_crtc_helper_funcs = {
>   	.atomic_check = mgag200_crtc_helper_atomic_check,
>   	.atomic_flush = mgag200_crtc_helper_atomic_flush,
>   	.atomic_enable = mgag200_g200ev_crtc_helper_atomic_enable,
> -	.atomic_disable = mgag200_crtc_helper_atomic_disable
> +	.atomic_disable = mgag200_crtc_helper_atomic_disable,
> +	.get_scanout_position = mgag200_crtc_helper_get_scanout_position,
>   };
>   
>   static const struct drm_crtc_funcs mgag200_g200ev_crtc_funcs = {
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index 2a53ebf41539..fcb97e4253c4 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -341,6 +341,8 @@ static void mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>   
>   	if (mdev->info->sync_bmc)
>   		mgag200_bmc_start_scanout(mdev);
> +
> +	drm_crtc_vblank_on(crtc);
>   }
>   
>   static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
> @@ -348,7 +350,8 @@ static const struct drm_crtc_helper_funcs mgag200_g200se_crtc_helper_funcs = {
>   	.atomic_check = mgag200_crtc_helper_atomic_check,
>   	.atomic_flush = mgag200_crtc_helper_atomic_flush,
>   	.atomic_enable = mgag200_g200se_crtc_helper_atomic_enable,
> -	.atomic_disable = mgag200_crtc_helper_atomic_disable
> +	.atomic_disable = mgag200_crtc_helper_atomic_disable,
> +	.get_scanout_position = mgag200_crtc_helper_get_scanout_position,
>   };
>   
>   static const struct drm_crtc_funcs mgag200_g200se_crtc_funcs = {

