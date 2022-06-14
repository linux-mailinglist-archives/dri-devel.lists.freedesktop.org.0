Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E591D54B244
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 15:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9748510FF20;
	Tue, 14 Jun 2022 13:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B600D10FF73
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 13:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655213224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W2Oyz5BLSx98FrfxVtN7aUrvWLBCLCwgtj+5NpCgj+w=;
 b=eUiNQf9mnZu3R//ap26VmmXyw1szoJojWe33BYD7++V8bsD59FPcJYEpDXK5vxIpS70z8R
 QAsVUdSXh1ccI5OW+zn9+HVPj3j6HN3k8T9IpReN4RABwXMZwiEpcoJWX77yjo5zPlFZeX
 ivG9R45eAZUGtv4V6mUlJ7vathj2K0I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-154-ky3oYegfMKaAD1ETZa0RvA-1; Tue, 14 Jun 2022 09:27:03 -0400
X-MC-Unique: ky3oYegfMKaAD1ETZa0RvA-1
Received: by mail-wr1-f70.google.com with SMTP id
 w8-20020adfde88000000b00213b7fa3a37so1296088wrl.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 06:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W2Oyz5BLSx98FrfxVtN7aUrvWLBCLCwgtj+5NpCgj+w=;
 b=kuA0u0ou2/sHWRlkxmm/k4wige1DY0/28hL6svTT2+nqzGNCWqVwzCBh28uDDo++XY
 FJo7OB3ufaXaZ3/rAQ0PUfi65aXxCMN0oZ2pJqSFATApg+DxIrZVNxvqdp2d4lak7BCN
 GeH9ulSKI3Nn8yrJCHA0K8tLuQnMfE1jOgkTwC60bCj9TEN/VGG3QufIWv6qWiLJf2wW
 J5YhhC0/a/qpORvPyUJ2lkV8juhn3LYwTWk79RGSZaeG8hVcl9w5Y4/ftgxvLqlyBlKK
 2kVlDrF2zM5ARTaVCr9Q7VSM/dUOUHOlLTGFa2s8+wLZxlOLG91gBFOpI0Jdy9S/1rEv
 C5Fg==
X-Gm-Message-State: AOAM532DfAEOr7SpO2UXmNH6lwBjeZkZp78fQRgybUUgiLpVWg0DPHmR
 R1dZM204SyMFINPMoNv9GqU4nL+aB3sgqq8rlygXq91HiuYLOA4e3mBiy3lBeP8Xw33EKftDfKR
 M5ZY84UT3CFDHFzvaumwRe9fC58/b
X-Received: by 2002:a05:600c:4fc6:b0:39c:9417:a8bf with SMTP id
 o6-20020a05600c4fc600b0039c9417a8bfmr4190763wmq.26.1655213222510; 
 Tue, 14 Jun 2022 06:27:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUL6zSdwc+UtaN5DgJibMH4ErsZPfi02dxbJWoJ3Zi5c+po5Kh+BGsd4b+ktM660XxQ1zceA==
X-Received: by 2002:a05:600c:4fc6:b0:39c:9417:a8bf with SMTP id
 o6-20020a05600c4fc600b0039c9417a8bfmr4190664wmq.26.1655213221314; 
 Tue, 14 Jun 2022 06:27:01 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q14-20020adfea0e000000b00213ba4b5d94sm14235877wrm.27.2022.06.14.06.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 06:27:00 -0700 (PDT)
Message-ID: <e0468244-f1bc-e593-0840-252a92a900dd@redhat.com>
Date: Tue, 14 Jun 2022 15:26:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/arm/hdlcd: Take over EFI framebuffer properly
To: Robin Murphy <robin.murphy@arm.com>, liviu.dudau@arm.com
References: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <0f96c44b10dcd1444ad43e6027fd5c6aff34e54d.1655211704.git.robin.murphy@arm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Robin,

On 6/14/22 15:04, Robin Murphy wrote:
> The Arm Juno board EDK2 port has provided an EFI GOP display via HDLCD0
> for some time now, which works nicely as an early framebuffer. However,
> once the HDLCD driver probes and takes over the hardware, it should
> take over the logical framebuffer as well, otherwise the now-defunct GOP
> device hangs about and virtual console output inevitably disappears into
> the wrong place most of the time.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/arm/hdlcd_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
> index af59077a5481..a5d04884658b 100644
> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
> @@ -331,6 +331,8 @@ static int hdlcd_drm_bind(struct device *dev)
>  		goto err_vblank;
>  	}
>  
> +	drm_fb_helper_remove_conflicting_framebuffers(NULL, "hdlcd", false);
> +

Seems you are using an older base, since this function doesn't exist anymore
after commit 603dc7ed917f ("drm/aperture: Inline fbdev conflict helpers into
aperture helpers").

Instead, you should use the drm_aperture_remove_framebuffers() function, i.e:

 +	drm_aperture_remove_framebuffers(false, &hdlcd_driver);

If you do that and re-spin the patch, feel free to add:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

