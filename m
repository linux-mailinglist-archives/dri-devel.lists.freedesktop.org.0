Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418162F684
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEA510E050;
	Fri, 18 Nov 2022 13:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E345C10E050
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668779091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3wspIbRguKZ3H2ExPVy8laoW380DWu7RPwbmv7AgWgE=;
 b=Bg+Rn+CtuYMadLTNdY/dxUL9YL/I/V2G4wRu5hHwDARleHy/FpOOln3gKQnHkmKxzTxk31
 KFGX7bLk1N8JBN4Nd2HbAEPuEFpRzNBJQCRof3AAjF3jd/Klwz8fylRSq922W6aOqMIk/K
 r6NjCdW+1GEnpJyM2FWy9AQMN5Rymnw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-623-AOuKmayWOYCpo02Yn_e9ow-1; Fri, 18 Nov 2022 08:44:49 -0500
X-MC-Unique: AOuKmayWOYCpo02Yn_e9ow-1
Received: by mail-wr1-f69.google.com with SMTP id
 k7-20020adfc707000000b002416f2e9ad5so1593810wrg.6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 05:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3wspIbRguKZ3H2ExPVy8laoW380DWu7RPwbmv7AgWgE=;
 b=Iv41NzlJ9Gqv+No+oIIbxt28OfRDnau4A73Kz0HreUM1rXfbmEExPhRmOgOdfDHvgH
 i0C/DvGJUOkX55kSyItYRT7v8zEAuZu9dBQ2ULd8h7msTFPhrHhBj91o3XgA08l+8Z8I
 Y+a6m4lYiZueAq7D/G58ULN9KQ+fvqOZdWGWWCuxGPTMDI4F2I68rUmmG7szBUhbXInG
 OCwe7mRfILLG1INMnow3M9F0Q3MhH/POcZVw1UKrYvZyzCefREF6UCC3pgUI5z4cDNPz
 yDSRjHPahYJrPL+dnHcjGigY2S7aaiR7UEt0keKGYiKxQ+J7U4Sby94BBeFoRJFfT70X
 uOtg==
X-Gm-Message-State: ANoB5pnbwa77ir0CwGHk3KA7YKmaCnLJb51j888IA+e0AXM2U/gSzgN7
 Fm1XVKKYxoxaNYCTm+ajfiiLK5fjOo7bf7nz2auAIYMTlNr5N2j4h0xOmAIQDPEAwxvdESxIH1v
 5L7nAScT2FcBx13HcdYcDabhyOBS0
X-Received: by 2002:a05:600c:600c:b0:3cf:81b1:bc7b with SMTP id
 az12-20020a05600c600c00b003cf81b1bc7bmr8389990wmb.121.1668779087012; 
 Fri, 18 Nov 2022 05:44:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4s4c+DL0XV0gYAoWwZ6gcR5oaOQBm2MCyU62ERU5MCR+CeOegBkiaWdMXc1cxLsOsr8Lyy4Q==
X-Received: by 2002:a05:600c:600c:b0:3cf:81b1:bc7b with SMTP id
 az12-20020a05600c600c00b003cf81b1bc7bmr8389972wmb.121.1668779086821; 
 Fri, 18 Nov 2022 05:44:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x11-20020a5d60cb000000b00241bc4880fesm2893039wrt.111.2022.11.18.05.44.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 05:44:46 -0800 (PST)
Message-ID: <6e20b9fc-664e-a324-3304-dae740136a23@redhat.com>
Date: Fri, 18 Nov 2022 14:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/7] drm/cirrus: Decouple fbdev bpp value from color depth
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221116160917.26342-4-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/16/22 17:09, Thomas Zimmermann wrote:
> Cirrus has a preferred color depth of 16 bit; also use it as fbdev
> bpp value. Don't use the color depth directly. It has a different
> meaning than bpp and both cannot be used interchangeably.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/cirrus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index 678c2ef1cae70..cf35b60905032 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -604,7 +604,7 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  	if (ret)
>  		return ret;
>  
> -	drm_fbdev_generic_setup(dev, dev->mode_config.preferred_depth);
> +	drm_fbdev_generic_setup(dev, 16);

Even though this is not strictly needed as you mentioned, I agree that
it's better to decouple it from the color depth and make it explicit.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

