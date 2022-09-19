Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7863F5BD0D5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 17:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0246810E0FA;
	Mon, 19 Sep 2022 15:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D8A10E0FA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663601113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=53BgddQvFVk4yhWCvkUyrw6ywQxNKHUZ3Zz5lHSUhEs=;
 b=JrNTb8spUKK/ItVxzAquTpq3j+kGIq3VIEL4Km9vlEi7o0ajNK6FrIUwFsOML1w1QVRpYx
 bLwnaqFADuhrXTJUZzR/g2Gzizn465KFFul4i6v5tBQYqSBEmhQ3L/ucX2ZHY1LV7huT+T
 YGjMGUgKGRMwfTZjhRPJZWVSmVkS2pM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-10-yBJAA3QpNc6eJ8Ai6Oe47A-1; Mon, 19 Sep 2022 11:25:10 -0400
X-MC-Unique: yBJAA3QpNc6eJ8Ai6Oe47A-1
Received: by mail-wr1-f70.google.com with SMTP id
 d9-20020adfa349000000b0022ad6fb2845so1677046wrb.17
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 08:25:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=53BgddQvFVk4yhWCvkUyrw6ywQxNKHUZ3Zz5lHSUhEs=;
 b=KAoAiofB3NoodHt7d7cAOAM9y5S9oVECq7no1OG4cBew2KaZNa9uT9e77hDvZZbdaY
 wrkjAWYbiNlBSvnYySK8oSdC/CDnb1fifm6+bh3kcD0FADHaAqPSCl9inzKR+GDv8UO7
 PDowP2lQICLZ4OAaBL1cSQsxaZtOHBF0nRWKIhfFBdwp3txoQg39pTgRX80FLUBNYPAO
 MHCGaBY9n5cmNodZxdkqh+yJhB0gisLe4vdc8rtrcky85Kq4NeslmFUeCB91chHgOO4l
 AX5xmrJdvZGrt7gbbVDReQzgC+QbhKqYeMxNCW8pCcw98ZFrWn2fjZNTlPSrrjEehQyA
 iOOw==
X-Gm-Message-State: ACrzQf3Rc9+yCO4Xh+6W9arnog+KWA768BwXz81bstTgRSl6UtyEshpG
 /2PZS2Ux9CAMNM2JfNSUilfZJPtJZw0SGynMI5kMxIjR5fmAqaqiFZWMKHDcieaPG+5wfjepGD3
 sRMbWtlLCky+DuBPXFWgwsOErU8w8
X-Received: by 2002:a05:600c:3511:b0:3b4:bb85:f1e3 with SMTP id
 h17-20020a05600c351100b003b4bb85f1e3mr11821855wmq.0.1663601108501; 
 Mon, 19 Sep 2022 08:25:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5peyCdBSaBGNhioyYQH/zfn1wc1/nsujd98i0o3UTCbOfxUReVxlZawNpVG/zEgrcU9D+S2A==
X-Received: by 2002:a05:600c:3511:b0:3b4:bb85:f1e3 with SMTP id
 h17-20020a05600c351100b003b4bb85f1e3mr11821845wmq.0.1663601108288; 
 Mon, 19 Sep 2022 08:25:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:3d91:d508:5a89:9cf?
 ([2a01:e0a:c:37e0:3d91:d508:5a89:9cf])
 by smtp.gmail.com with ESMTPSA id
 a19-20020a05600c225300b003b49ab8ff53sm14194939wmm.8.2022.09.19.08.25.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Sep 2022 08:25:07 -0700 (PDT)
Message-ID: <9447ffca-4383-eccd-3f9e-f87696b188d4@redhat.com>
Date: Mon, 19 Sep 2022 17:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] drm/mgag200: Force 32 bpp on the console
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, wangyugui@e16-tech.com
References: <20220915150348.31504-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220915150348.31504-1-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/09/2022 17:03, Thomas Zimmermann wrote:
> G200ER does not seem to support 24 bpp, so force the console to
> use 32 bpp. The problem was introduced, when commit 73f54d5d9682
> ("drm/mgag200: Remove special case for G200SE with <2 MiB") changed
> the preferred color depth from 32 bit to 24 bit.
> 
> A setting of 24 is the correct color depth, but G200ER doesn't seem
> to be able to use the respective RGB888 color format. Using 24-bit
> color with forced 32 bpp works around the problem.

Thanks for the patch.
At least on my G200EW, 24 bpp is working well. So maybe only the G200ER 
is affected.
I think it may have a performance penalty, I will try to measure it.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

-- 

Jocelyn

> 
> Reported-by: Wang Yugui <wangyugui@e16-tech.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Wang Yugui <wangyugui@e16-tech.com>
> Fixes: 73f54d5d9682 ("drm/mgag200: Remove special case for G200SE with <2 MiB")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 251a1bb648cc..a222bf76804f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -262,7 +262,11 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	if (ret)
>   		return ret;
>   
> -	drm_fbdev_generic_setup(dev, 0);
> +	/*
> +	 * FIXME: A 24-bit color depth does not work with 24 bpp on
> +	 * G200ER. Force 32 bpp.
> +	 */
> +	drm_fbdev_generic_setup(dev, 32);
>   
>   	return 0;
>   }

