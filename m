Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E25EF5BABE8
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E0310E380;
	Fri, 16 Sep 2022 11:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A1910E380
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663326048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZbmxGQFx5NUyXDI3oRsG3PEO6C5R/qvXpxefqzSfSQ=;
 b=giJ7hbNUiDHT3emcOcs8tNgjxn1GH1TxNCtOLmv4ZNTUDmCAhR21pSCPWgyQVnIaOhvyFX
 Owxbk4LQnctd5EFqP7jYfVNgVFm3MdA2jsT3FtLRT0Itow227SZzTLBRTxDxTun3c2jlQh
 eKSVkfII9Ob628o8vLorX1YDuj5RuTw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-493-t017jYMTO2KXEpG8Mpe8tg-1; Fri, 16 Sep 2022 07:00:47 -0400
X-MC-Unique: t017jYMTO2KXEpG8Mpe8tg-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg2-20020a05600c3c8200b003b33080cff8so692063wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 04:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2ZbmxGQFx5NUyXDI3oRsG3PEO6C5R/qvXpxefqzSfSQ=;
 b=RqUAVr9oFYzSPR4pE/AnjzODdIueETUjIFGrbK8NVpDzd+zD6wwM1DZuWPv0otQZg8
 wxWDcSVR4QvAHYoUYemOHhPrtB3ErLpMtrmLqIVewLHOlgXYHoavekbsdQuRxJ5Sh8OW
 mthIJU8AMnXDDwgY7nnZhm+T0eCY6Dzcabj7p3iH7LlLR2anJs7HTrkXyF1p4M8NUly0
 UfUD3jRZRrF/E6SamlLAw0J5035HPa9pk3J/cCNRSh7pbHq+sOmQnjjBRJ4DBwrjrWyh
 2j74GjzM5mCNDWtDRAtixtUA1XtT2kPfwc2u14iJ+MLYHZfVhyFAjv1BRP2H91y63UQ5
 YA9A==
X-Gm-Message-State: ACrzQf0SGpuihTmEPiigCVugwSr0A8+UGDLfnBCnRXcVAKipQevHHdRD
 MMDyj5HasHa6BNhIYf7IhZ9M052IFVTM8B2xqGLzNtJGXGZFZrNV7ImtYrk7J07BnTSKMtK7k1+
 v+Yf0aYUTmDn2LONZmruRZHWVsZSN
X-Received: by 2002:a5d:5848:0:b0:22a:c104:c2f1 with SMTP id
 i8-20020a5d5848000000b0022ac104c2f1mr2519366wrf.699.1663326044917; 
 Fri, 16 Sep 2022 04:00:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43fBOdh9afnK2x5mvyniWJnGPpavwwlgRXAzXhit5u76P4eHdYTeO9LfpPvGZhI/+XXh73Tw==
X-Received: by 2002:a5d:5848:0:b0:22a:c104:c2f1 with SMTP id
 i8-20020a5d5848000000b0022ac104c2f1mr2519331wrf.699.1663326044582; 
 Fri, 16 Sep 2022 04:00:44 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b14-20020adff90e000000b00225307f43fbsm4772079wrr.44.2022.09.16.04.00.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Sep 2022 04:00:43 -0700 (PDT)
Message-ID: <e15772ac-5ad5-37a1-9957-0b1f2fc5284c@redhat.com>
Date: Fri, 16 Sep 2022 13:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/4] drm/plane: Remove drm_plane_init()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220909105947.6487-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 9/9/22 12:59, Thomas Zimmermann wrote:
> Open-code drm_plane_init() and remove the function from DRM. The
> implementation of drm_plane_init() is a simple wrapper around a call
> to drm_universal_plane_init(), so drivers can just use that instead.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> index 37e63e98cd08..33f29736024a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
> @@ -296,9 +296,10 @@ nv10_overlay_init(struct drm_device *device)
>  		break;
>  	}
>  
> -	ret = drm_plane_init(device, &plane->base, 3 /* both crtc's */,
> -			     &nv10_plane_funcs,
> -			     formats, num_formats, false);
> +	ret = drm_universal_plane_init(device, &plane->base, 3 /* both crtc's */,
> +				       &nv10_plane_funcs,
> +				       formats, num_formats, NULL,
> +				       DRM_PLANE_TYPE_OVERLAY, NULL);

Not only drm_plane_init() doesn't add much value but makes the code
harder to read. Since by calling drm_universal_plane_init() instead,
it's explicit whether the initialized plane is primary or an overlay.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

