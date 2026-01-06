Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9FCFB178
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 22:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6CC10E240;
	Tue,  6 Jan 2026 21:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y7dW2IRp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0E310E1A1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 21:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767735248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DcTHFezLYAepuiXH8kmv0jIcRFZzwNR3RLpr3vIzDAI=;
 b=Y7dW2IRpkunX0JI0oadsafI9ZodjublAbNTYZ3WN33ssO9dTp4btpeF96l/z2bBLzBpPKr
 HkhZ3OlU1UJOxRy/Ctybifv/5ae5io0eFWLltdnOqf8K/3LfoueHNOGNrvTa99P07wvfp0
 B4ZrdW1E59zoPDwZmfMz86dkLannoZ8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-f4K27l4zN72o1d4uHbPctg-1; Tue, 06 Jan 2026 16:34:07 -0500
X-MC-Unique: f4K27l4zN72o1d4uHbPctg-1
X-Mimecast-MFC-AGG-ID: f4K27l4zN72o1d4uHbPctg_1767735246
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-430fcf10280so962549f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 13:34:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767735246; x=1768340046;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DcTHFezLYAepuiXH8kmv0jIcRFZzwNR3RLpr3vIzDAI=;
 b=CybaEJY7m56FaVzjqfS0TCYjV5Gy9VgMMsLb4SOSWSsAZuzahBA+HNfEcQZhh4VlIZ
 4cBBIp9Xnys95UpgHp8jiaVUmyY1QwxLL30lTYNz3ZkBfo6lgfv8AC3dr0mpWf5vFnZw
 IwuxW0s40aiK6PUEX34a41SbaSccGkWUh9+AJMklueyCna8g+XSpxq8uMkktS5zfYHKV
 Hy0ZbRxxGcBuiDgacnbJBTfE3XCme+XfOqEuPCmWfInBXH+oVodQxcxUKrs1jFc60GWC
 k57t5oqvczwsPlkYmqr7j0NU4w7kTRPAeWXOJh5Ke8b1ls64hYpRpDddrUED5cSN9s6w
 jpeg==
X-Gm-Message-State: AOJu0YwiXhyqaVbB/aYQDkWaktuhWihpuaVjYjy3J3hjxKK21CCBZy6p
 vERwgf8hRzZIMnYvatdXyKogPxVsod1i5+NWhsFz4cMcjTvY/KU1aAaQyHHAVYtMz1fU/rnENCg
 wS3iEwR9wAYRc67nddANIcv1hVkbVYRwHhy78YwcQatQjPvbBWv0JArmee1VyF1p7tMCFAiLWxn
 JMrw==
X-Gm-Gg: AY/fxX4Od0YqTbGLiFL/iPp3eF9+g8e1vfjk1ziOimteLzECx3t3q0U3EqaxQ5+eYNs
 SW8S5ZgEx8F7dtJibcu+5TM3AhOl/ApCjPskfW8zgD3tKGVD6sPhLNInrm3R2T1h9kGANlngu/V
 AiHPYkZHeCGwwMM1c+2QKI15cPDELy3/lhJW/tFh2nn31NcxnxQ8ADIJpwGiexH1cX6Zu5DE3hQ
 MT8Dn5HraG28tGqA7ilreoA+ulNsZWQ/wy45GdhMVxFrAZfptNjYJlZei3or+t8ntatTXeqT19t
 DaouSj9bh9mG2G/zzqb1iYWb7fAErgDu+tphflW9GPmLv+n+nIUpBdhHaDGhAy5Gd40pZrR/9uI
 fnVyG3uubmk1XE+Fg7BMIOgFGXAyafsuM3RS/ri/uXQ4eL3SMaA==
X-Received: by 2002:a05:6000:26d3:b0:430:f463:b6a7 with SMTP id
 ffacd0b85a97d-432c379f1a6mr549054f8f.45.1767735245930; 
 Tue, 06 Jan 2026 13:34:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrEMiRil/nYooMCe9+cX4W6RJqywEUrdaqsMMWtF2V6HwIkXL5LVxp+oB41Tj1FnUsqWsV2Q==
X-Received: by 2002:a05:6000:26d3:b0:430:f463:b6a7 with SMTP id
 ffacd0b85a97d-432c379f1a6mr549032f8f.45.1767735245502; 
 Tue, 06 Jan 2026 13:34:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df939sm6488606f8f.21.2026.01.06.13.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 13:34:05 -0800 (PST)
Message-ID: <d54918eb-f9d4-4199-a57a-228799293606@redhat.com>
Date: Tue, 6 Jan 2026 22:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panic: Fix expected string for QR_CODE in
 drm_panic_type_map
To: Nathan Chancellor <nathan@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
 <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-2-55228bd4b0f8@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-2-55228bd4b0f8@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: acxhzkfD0Zs2ktzaSlp2nOrRyKBV0EBDR9LNCjfQAww_1767735246
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

On 06/01/2026 07:19, Nathan Chancellor wrote:
> The help text of CONFIG_DRM_PANIC_SCREEN_QR_CODE documents the expected
> value to CONFIG_DRM_PANIC_SCREEN as "qr_code" but drm_panic_type_map
> checks for "qr". Adjust drm_panic_type_map and the module description to
> match so that existing configurations do not stop working.

Good catch, thanks for the fix.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Fixes: e85e9ccf3f84 ("drm/panic: Report invalid or unsupported panic modes")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 0cd574dd9d88..d6d3b8d85dea 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -823,7 +823,7 @@ static const char *drm_panic_type_map[] = {
>   	[DRM_PANIC_TYPE_KMSG] = "kmsg",
>   	[DRM_PANIC_TYPE_USER] = "user",
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> -	[DRM_PANIC_TYPE_QR] = "qr",
> +	[DRM_PANIC_TYPE_QR] = "qr_code",
>   #endif
>   };
>   
> @@ -855,7 +855,7 @@ static const struct kernel_param_ops drm_panic_ops = {
>   module_param_cb(panic_screen, &drm_panic_ops, NULL, 0644);
>   MODULE_PARM_DESC(panic_screen,
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> -		 "Choose what will be displayed by drm_panic, 'user', 'kmsg' or 'qr' [default="
> +		 "Choose what will be displayed by drm_panic, 'user', 'kmsg' or 'qr_code' [default="
>   #else
>   		 "Choose what will be displayed by drm_panic, 'user' or 'kmsg' [default="
>   #endif
> 

