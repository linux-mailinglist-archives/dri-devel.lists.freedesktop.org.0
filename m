Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6356CFB16C
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 22:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F282610E059;
	Tue,  6 Jan 2026 21:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hAg7hlWd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3C110E059
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 21:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767735183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pK3HWFjguqv0mPEkY3G/9Ji56I1oTveoFdGiHqdwcBQ=;
 b=hAg7hlWdiV5dcpVQJ/8j9sDHQ52PhPb8dyHOO3L89EL24T8ddpXFaLeh45gLjzNWDnAjwg
 IOTGeZ9DH13BhyUVCjYo7GUKr47t3J1zONG8VCqN+FZsQxn86iRM1Soq9EVG6AEw8u0a2g
 Y9jZas+iqdzC2fT93T8OOj6f7BWyx4g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-rkJ8m85rNyqYO3sAgttHpA-1; Tue, 06 Jan 2026 16:33:02 -0500
X-MC-Unique: rkJ8m85rNyqYO3sAgttHpA-1
X-Mimecast-MFC-AGG-ID: rkJ8m85rNyqYO3sAgttHpA_1767735181
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47777158a85so16968395e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 13:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767735181; x=1768339981;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pK3HWFjguqv0mPEkY3G/9Ji56I1oTveoFdGiHqdwcBQ=;
 b=bIEWYRVQQlIXZfF8zHtfjlj8fOqnSpB3cHRFSCHhaB14bmm2CdNDI6qLJ52DtEgjxF
 BVtNUxSjj8pvyBTjOPMaCPzfrySaoE5roNcbhf/JTBSVIJ/VtsPJ3ZyQoqTE82NFf+aJ
 7UGsYkHcPtMm4LbUQHvDY//8MdcwZllbxXjSQFp2Q7jLH8Y8rgeEqpoVmQu8lSFDuLqW
 Tmmjn0mrn2jCILHIWaLd5CcVLki1ad75smOJA8vazCONYLZrtKkCYMGAdWWzb8UYsXtw
 yKFS+d4OFpHRtFcSXg1qMvlsm2EK9Mvr6sAlOKpFzvM29uygeNuRQydvtgqkQvtZgOv0
 YGIw==
X-Gm-Message-State: AOJu0YzT9TY2hXz6EalysXYm5p+4Q99CPnlP8uVtaTJp78c+sMVwIPBm
 CIWH/gCw5i6eTb4M4l7pUVhwBcro+T69puaUJzXmFoWzlxWQ45KWE7c4L/5vS2IcTiNQngyLX+4
 HkewLVOoitBTSxCV5Q3qKC+YNWvYTi1M/DJ2HEFnaIpAENtXXskDkutCqxBVq648ZXSumKA==
X-Gm-Gg: AY/fxX7wz/hhBHq7K6u95azjZ+O8OYfrxo+ncwTMeHGG6tuFFmgkLA9R0+jKrz9wdHm
 Eamm369Ba1uES/JES64o0R7nSYflbw5EYWbabc7469YRZv2lbNMgcbWTuNDOlk+6gOzmQ0q1H87
 PL9cyfFyl/Y6l9ppf2kPEwnFPfc3EBsuLXsinTWih3NNEG7HIC5z/2qNylG0q7I6Gwv3JxTRiQc
 E2VuAef4wnHmDDmS/Ch7vo33ql9JAKamxBWR6lQV3FPMaHy8ktDEHo1lXZsCsaIJzuhpxmEo/4p
 97ZD/QB6BKncNHlS4aLsiTaQKGuztDwj0OtiWgG2oSfovDXEkBQSB6yKEDMY1oZwY40v/TF6Teh
 XbXh/h7EayFpDQ5D+IWJBFpgpOXECQuLzzz3Vcw6T08xO5tgavQ==
X-Received: by 2002:a05:600c:1e1c:b0:477:58af:a91d with SMTP id
 5b1f17b1804b1-47d84b0aa4bmr3076495e9.5.1767735181442; 
 Tue, 06 Jan 2026 13:33:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHplL48zX9ZxwC2H/aEVBeKrxq1MxoVX9BAZ6lbsi1bWIFFYNRoFVjPv6HvDR7p9Q940Hys1g==
X-Received: by 2002:a05:600c:1e1c:b0:477:58af:a91d with SMTP id
 5b1f17b1804b1-47d84b0aa4bmr3076355e9.5.1767735181028; 
 Tue, 06 Jan 2026 13:33:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f653cd6sm67348115e9.9.2026.01.06.13.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 13:33:00 -0800 (PST)
Message-ID: <76fb4c29-2c7b-4971-92d6-365b5782aec6@redhat.com>
Date: Tue, 6 Jan 2026 22:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panic: Ensure drm_panic_type is initialized to a
 valid value
To: Nathan Chancellor <nathan@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-0-55228bd4b0f8@kernel.org>
 <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-1-55228bd4b0f8@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260105-drm_panic-handle-invalid-drm_panic_screen-v1-1-55228bd4b0f8@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 22en8dQjY0bVeuLJKb5LRCkshEaaCQLv-d5IirqIj-0_1767735181
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
> If a user has set an invalid CONFIG_DRM_PANIC_SCREEN value (such as
> "qr_code" without CONFIG_DRM_PANIC_SCREEN_QR_CODE=y due to missing or
> incorrect Rust dependencies), there is a panic when accessing
> /sys/module/drm/parameters/panic_screen:
> 
>    [   12.218375] BUG: unable to handle page fault for address: 0000000796dd8818
>    [   12.219737] #PF: supervisor read access in kernel mode
>    ...
>    [   12.227167] RIP: 0010:drm_panic_type_get+0x1b/0x30
> 
> If drm_panic_type_set() does not find a valid drm_panic_type enumeration
> in drm_panic_type_map based on the provided value, it does not change
> drm_panic_type from the default -1 value, which is not a valid index for
> accessing drm_panic_type_map in drm_panic_type_get(), resulting in the
> crash.
> 
> Validate the value of CONFIG_DRM_PANIC_SCREEN at boot time via the
> return value of drm_panic_type_set() in drm_panic_init() and explicitly
> fall back to the default of "user" with a message to the user so that
> they can adjust their configuration or fix missing dependencies.
> 
>    [    0.800697] Unsupported value for CONFIG_DRM_PANIC_SCREEN ('qr_code'), falling back to 'user'...
> 

Good catch, thanks for the fix.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> Fixes: e85e9ccf3f84 ("drm/panic: Report invalid or unsupported panic modes")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/gpu/drm/drm_panic.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index eb7ef17b9c71..0cd574dd9d88 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -1072,8 +1072,11 @@ void drm_panic_unregister(struct drm_device *dev)
>    */
>   void __init drm_panic_init(void)
>   {
> -	if (drm_panic_type == -1)
> -		drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL);
> +	if (drm_panic_type == -1 && drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL)) {
> +		pr_warn("Unsupported value for CONFIG_DRM_PANIC_SCREEN ('%s'), falling back to 'user'...\n",
> +			CONFIG_DRM_PANIC_SCREEN);
> +		drm_panic_type = DRM_PANIC_TYPE_USER;
> +	}
>   	drm_panic_qr_init();
>   }
>   
> 

