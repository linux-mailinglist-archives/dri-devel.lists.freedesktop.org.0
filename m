Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DACC8DA39
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 10:52:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E0B10E7FA;
	Thu, 27 Nov 2025 09:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dozxOrKm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2740910E7FA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764237144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vufRYKNXRMt+DGgz/o9bUWvnqxaQN076/DcK8yEYraE=;
 b=dozxOrKm+7Ue+mH/md7x2eRl+nNe/wjYGwTPFfokDBDsky+6QSf/YWk5v31pqQaBms5pUm
 uCaG/nIEkvWcw65BcAunYNosCUG8qdd7GhTGOJZwRW6AUVYFO2wApTPbG1cuRs5S5C+lbZ
 dQpYhawrZm4v86M7AlKJ+uHcBi9ZEh0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-6I1EQqXwPsW1Ug2ZUsdF7g-1; Thu, 27 Nov 2025 04:52:22 -0500
X-MC-Unique: 6I1EQqXwPsW1Ug2ZUsdF7g-1
X-Mimecast-MFC-AGG-ID: 6I1EQqXwPsW1Ug2ZUsdF7g_1764237141
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-42b2ad29140so339821f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 01:52:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764237141; x=1764841941;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vufRYKNXRMt+DGgz/o9bUWvnqxaQN076/DcK8yEYraE=;
 b=Zd5TWcsrJyaa3Lzr2BfN0xw8T7JfeV3uO9VxqAOvbxIn2LPhFy39TMB7cVr/rsZGwe
 Naln6wywnEuDWtS6tnYPASSP30IXSF85Q15dRJpn2FAFwyOvcq/kmJgHcEOyzdOQo+11
 X/Ubq9BymhKEnUSdn/sp2EcC3wcNlvWehhBhGFbMd0F0RnEoHkfSAO4Q5/FM65NNHV5n
 SwXFqGskHIXFz9LgPaYxzrJ05Fa5UqSK/f9su1I2/RLLLJUV0p83DGCl87ZzST6zaMC8
 ctFs9gluYSzGbxagvNA2wOCmZdLQS/xSyEcm77D1Wm8vmdD9r6ov3pC2wWbeSKr9ammx
 4I4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlaXrnI139LvFsUg/qK5W5oMAC7kG50wEyP6HT4c9AXDY8CQNf7ceu/9nRKRAp/gIK37UqwvjJwhM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+W+9LAQECMCl3jKoJdf9LLR+B/LmoVYBK1yotU8GyrUbHNT8n
 vGg/NqIwo4cutw1iEAlcXGsyjPz6ntAN7fHT1gXWfS9aeBgk1mHEE5KUEvWU0oCXkDfn2xKprkL
 IjnGWS650p+iWkMJ1pX4TMu9UupLW4a+Vps1a1EJIsFrw0EDJ3RjueHJmevP4omK2gF7n0A==
X-Gm-Gg: ASbGncuAJb+OSznP0QEWOWrUFBa2gAdfrVMh+/OduleYXmxROpkYPfz2tLXyHkPakZy
 EntQXwNLEWuhAUUAf5QCNmhLE9ZiT7S9egcjPVBXKTOlziwYfb250gG9E+kndxgwm73MXuHplJD
 A/mx+/XsLOC47cp3XfVvcYr3VLnCOr+ZyoHR8pS4XC/PD1KDkYwXiPTtVTXui7SIbJXLJJ1SXb6
 jAg0B8vORWiINHUkImmAOFsIQrBKmv5cbHTsJ1whmrN/74/w5Dc1Xke9XKJm4Xq87E/oYjtPStN
 AcHfIzW40reESrbY2Fr4+U2e05v7SBSmDhzbQ74z3OvmMWX17Q4rgNhttvTQ+zL/Mrzl7oMoN87
 JBsgRIT6NczhqZbsgOcJkltzsTG5dm2GHHGYuNjyl1wmYvAedSg==
X-Received: by 2002:a05:6000:1846:b0:42b:3b45:7197 with SMTP id
 ffacd0b85a97d-42cc1d0c89dmr21314130f8f.42.1764237141178; 
 Thu, 27 Nov 2025 01:52:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBqRJ6kPTQcvdatOqB/l5axzN2B8V7nmJUwdaDZSx33HQh0jFYG2CmSI4i45ekabuiAVRHSg==
X-Received: by 2002:a05:6000:1846:b0:42b:3b45:7197 with SMTP id
 ffacd0b85a97d-42cc1d0c89dmr21314100f8f.42.1764237140765; 
 Thu, 27 Nov 2025 01:52:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca7880asm2557603f8f.31.2025.11.27.01.52.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 01:52:20 -0800 (PST)
Message-ID: <d695dca7-fde1-40f6-8d1b-5aca90eb98f4@redhat.com>
Date: Thu, 27 Nov 2025 10:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Report invalid or unsupported panic modes
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Javier Martinez Canillas <javierm@redhat.com>
References: <20251127090349.92717-1-tvrtko.ursulin@igalia.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251127090349.92717-1-tvrtko.ursulin@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L7oSy6LCVsWFg0KLfAReaCaXw6ZBfBR4let40B0IIyg_1764237141
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

On 27/11/2025 10:03, Tvrtko Ursulin wrote:
> Currently the user can write anything into the drm.panic_screen modparam,
> either at runtime via sysfs, or as a kernel boot time argument. Invalid
> strings will be silently accepted and ignored at use time by defaulting to
> the 'user' panic mode.
> 
> Let instead add some validation in order to have immediate feedback when
> something has been mistyped, or not compiled in.
> 
> For example during kernel boot:
> 
>   Booting kernel: `bsod' invalid for parameter `drm.panic_screen'
> 
> Or at runtime:
> 
>   # echo -n bsod > /sys/module/drm/parameters/panic_screen
>   -bash: echo: write error: Invalid argument
> 
> Change of behavior is that when invalid mode is attempted to be
> configured, currently the code will default to the 'user' mode, while with
> this change the code will ignore it, and default to the mode set at kernel
> build time via CONFIG_DRM_PANIC_SCREEN.
> 
> While at it lets also fix the module parameter description to include all
> compiled in modes.

Thanks, I agree that's better than the current implementation.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/gpu/drm/drm_panic.c | 77 ++++++++++++++++++++++++++++++-------
>   1 file changed, 63 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index d4b6ea42db0f..f42be7f1d8c2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -39,12 +39,6 @@ MODULE_AUTHOR("Jocelyn Falempe");
>   MODULE_DESCRIPTION("DRM panic handler");
>   MODULE_LICENSE("GPL");
>   
> -static char drm_panic_screen[16] = CONFIG_DRM_PANIC_SCREEN;
> -module_param_string(panic_screen, drm_panic_screen, sizeof(drm_panic_screen), 0644);
> -MODULE_PARM_DESC(panic_screen,
> -		 "Choose what will be displayed by drm_panic, 'user' or 'kmsg' [default="
> -		 CONFIG_DRM_PANIC_SCREEN "]");
> -
>   /**
>    * DOC: overview
>    *
> @@ -813,15 +807,60 @@ static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
>   		draw_panic_static_user(sb);
>   }
>   #else
> -static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
> -{
> -	draw_panic_static_user(sb);
> -}
> -
>   static void drm_panic_qr_init(void) {};
>   static void drm_panic_qr_exit(void) {};
>   #endif
>   
> +enum drm_panic_type {
> +	DRM_PANIC_TYPE_KMSG,
> +	DRM_PANIC_TYPE_USER,
> +	DRM_PANIC_TYPE_QR,
> +};
> +
> +static enum drm_panic_type drm_panic_type = -1;
> +
> +static const char *drm_panic_type_map[] = {
> +	[DRM_PANIC_TYPE_KMSG] = "kmsg",
> +	[DRM_PANIC_TYPE_USER] = "user",
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +	[DRM_PANIC_TYPE_QR] = "qr",
> +#endif
> +};
> +
> +static int drm_panic_type_set(const char *val, const struct kernel_param *kp)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_panic_type_map); i++) {
> +		if (!strcmp(val, drm_panic_type_map[i])) {
> +			drm_panic_type = i;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int drm_panic_type_get(char *buffer, const struct kernel_param *kp)
> +{
> +	return scnprintf(buffer, PAGE_SIZE, "%s\n",
> +			 drm_panic_type_map[drm_panic_type]);
> +}
> +
> +static const struct kernel_param_ops drm_panic_ops = {
> +	.set = drm_panic_type_set,
> +	.get = drm_panic_type_get,
> +};
> +
> +module_param_cb(panic_screen, &drm_panic_ops, NULL, 0644);
> +MODULE_PARM_DESC(panic_screen,
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +		 "Choose what will be displayed by drm_panic, 'user', 'kmsg' or 'qr' [default="
> +#else
> +		 "Choose what will be displayed by drm_panic, 'user' or 'kmsg' [default="
> +#endif
> +		 CONFIG_DRM_PANIC_SCREEN "]");
> +
>   /*
>    * drm_panic_is_format_supported()
>    * @format: a fourcc color code
> @@ -838,11 +877,19 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   
>   static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
>   {
> -	if (!strcmp(drm_panic_screen, "kmsg")) {
> +	switch (drm_panic_type) {
> +	case DRM_PANIC_TYPE_KMSG:
>   		draw_panic_static_kmsg(sb);
> -	} else if (!strcmp(drm_panic_screen, "qr_code")) {
> +		break;
> +
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +	case DRM_PANIC_TYPE_QR:
>   		draw_panic_static_qr_code(sb);
> -	} else {
> +		break;
> +#endif
> +
> +	case DRM_PANIC_TYPE_USER:
> +	default:
>   		draw_panic_static_user(sb);
>   	}
>   }
> @@ -1025,6 +1072,8 @@ void drm_panic_unregister(struct drm_device *dev)
>    */
>   void __init drm_panic_init(void)
>   {
> +	if (drm_panic_type == -1)
> +		drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL);
>   	drm_panic_qr_init();
>   }
>   

