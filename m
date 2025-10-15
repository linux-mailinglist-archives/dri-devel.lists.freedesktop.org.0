Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D462CBDD292
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1282510E277;
	Wed, 15 Oct 2025 07:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YV0izV6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39910E277
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760514007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LzkTXYTmCKGCvfwK3/ry/lapzrBc89yPKu36xwanEYc=;
 b=YV0izV6HoekOs57BwHfMWB7l4aE3wikwc8cospaIJQl6utPGnST/q/GBDfJ5Uc3U+peYNn
 JIHor2Bm2UecpnYHnp5QtRtiLK54D4RwVIdK4zSrKAce4OSO2IZ7yXvtRsug7GyO697HHG
 4Q8iviqZu+lQ8yqtAprL22W+e470wRw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-nSjMan67Ma-__WwH8L1ljw-1; Wed, 15 Oct 2025 03:40:05 -0400
X-MC-Unique: nSjMan67Ma-__WwH8L1ljw-1
X-Mimecast-MFC-AGG-ID: nSjMan67Ma-__WwH8L1ljw_1760514004
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47106720618so1314685e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760514004; x=1761118804;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LzkTXYTmCKGCvfwK3/ry/lapzrBc89yPKu36xwanEYc=;
 b=RORsmm92VpYApzGFVjLY2WHFpxkdzjJAXFjsAubbB/HUjenEdE8KKPQfnoLQjxZgbd
 N5H5df65moUtVDODugtwsXHoBLZgEm7SlqAfyEZxk997COgOuV1xgP7VEq7B70YwXN9A
 KH9lHoXWB5K/drGy2p52p3cIjqQwvEhHtlGQSxKEZ4unEb/kju1loyAds0DQy48xzYF/
 FHIzSpBkLHHQIZo+Fk3ZHqCxfGvkkP+limKYpJhcj32rLQ8Xef0IiyhZ1A4MwGwEcM6i
 TFJzymDjSIBbU9hpeEmTAe/43i5+ZOPRINWdRG9kvysNko/CDpmf11M3Wga8lgHHXZQ7
 cGKA==
X-Gm-Message-State: AOJu0YysesjjfQTekEQiO2HZM0Z/T5cL0rmmjd4ZheYwdNnVQDAj2plg
 IOFgD8CiA4lselehJff4mcG0LHzfsX+CDOjWl/Hoxjg/+m3pR8R/9wojt2kE9TH+bxA1/cA4pVQ
 AFzWQnI9mBZ0/Cz4Uiog+1RcjU9v2NkpGs3iRnUjnoyUC1AHeTsX8zxOI6wQ6xtyuCzSfXg==
X-Gm-Gg: ASbGncvv2ydb0iEMYj3Jm+NmfMbtiafEgAZn2BV0sbus9gAMI7tPlrxD5t0nZuOXeJ4
 RvrpRdkN3lXPI9/PQxrJ6gC/QUMpDASZV/S/bVasWriNvILIlquDsCN4FPcEEOlNizppwqq++qB
 yPjzT1fKIjKgD9FfwUv7vWYh/bI051gtKQ9JLhq3ZrhQS+bTIkq9u2Q8qQwdONNMzb6dvaZdYZE
 FICczgMlVGU5xreTqAH9Alhp8oZHQgFw/FOSFuF6X9BYdvX8ayfDoqYlWrFPF6IKBNzgqc2bcnf
 D1+stLqlExHVz+GCwDPv9gRJfwX9mmo8CdNvSGjbs+aF9gOut8WUYLFVbcS3STpUlCLE0QMaZ5z
 btPQT
X-Received: by 2002:a05:600c:529a:b0:46e:37a3:3ec1 with SMTP id
 5b1f17b1804b1-46fa9af1797mr185977695e9.24.1760514002642; 
 Wed, 15 Oct 2025 00:40:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdNerwfF0vb00/yeioQpjHawgZwt2BrniqNsLyL5p25Diqv6C20yihqIBJqWVMUSkW+ExgFQ==
X-Received: by 2002:a05:600c:529a:b0:46e:37a3:3ec1 with SMTP id
 5b1f17b1804b1-46fa9af1797mr185977465e9.24.1760514002238; 
 Wed, 15 Oct 2025 00:40:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc1c5227fsm227745845e9.9.2025.10.15.00.40.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:40:01 -0700 (PDT)
Message-ID: <2eb79263-58cb-4a30-9cef-8d3f60b2782f@redhat.com>
Date: Wed, 15 Oct 2025 09:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/log: avoid WARN when searching for usable
 format
To: Francesco Valla <francesco@valla.it>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it>
 <20251014-drm_draw_conv_check-v2-2-05bef3eb06fb@valla.it>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251014-drm_draw_conv_check-v2-2-05bef3eb06fb@valla.it>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rkx16W2LK8zN5MTdJQ7lA7qmRnV9c2FBk5A6W4SCHPA_1760514004
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

On 14/10/2025 22:08, Francesco Valla wrote:
> Use drm_draw_can_convert_from_xrgb8888() instead of
> drm_draw_color_from_xrgb8888() while searching for a usable color
> format. This avoids a WARN in case the first format is not usable.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
>   drivers/gpu/drm/clients/drm_log.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
> index d239f1e3c456397ad64007b20dde716f5d3d0881..c0150f0c3b4b395e6e2126cf0d9660c967c182ec 100644
> --- a/drivers/gpu/drm/clients/drm_log.c
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -182,7 +182,7 @@ static u32 drm_log_find_usable_format(struct drm_plane *plane)
>   	int i;
>   
>   	for (i = 0; i < plane->format_count; i++)
> -		if (drm_draw_color_from_xrgb8888(0xffffff, plane->format_types[i]) != 0)
> +		if (drm_draw_can_convert_from_xrgb8888(plane->format_types[i]))
>   			return plane->format_types[i];
>   	return DRM_FORMAT_INVALID;
>   }
> 

