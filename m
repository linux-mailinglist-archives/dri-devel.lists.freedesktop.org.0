Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD2F550B12
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jun 2022 16:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B5010E23B;
	Sun, 19 Jun 2022 14:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E333810E23B
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655647551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+J06pEWNoK09LE9zoo+UMEiuOGdfbFj8J1eghL4774g=;
 b=HNGIiNO/5v73rhzy1UMrQyGTd9wVQKHJeLxN3ZjWVRF6bi6gnxOJ2llEDRrSFSGa++W/UL
 S3crjcbOheWe7C7EFKA8hGTkKwrxXsiyKefLnUM0HoLxMmVwK/xI6c2Ynm8/4KBNy0GmzT
 FZAPgOO34ORkqV3AzuTn5q8KSv/Pmf8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-3HPRWlpvPMeIlhw3fUQOjw-1; Sun, 19 Jun 2022 10:05:43 -0400
X-MC-Unique: 3HPRWlpvPMeIlhw3fUQOjw-1
Received: by mail-wr1-f71.google.com with SMTP id
 i16-20020adfa510000000b0021b8e9f7666so115994wrb.19
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 07:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+J06pEWNoK09LE9zoo+UMEiuOGdfbFj8J1eghL4774g=;
 b=hgEariNqzPika5dCYmcJ9aEclOiTOoRq0OoUCaWIwcYVBsRTapiRE5vbvy6+htWkK+
 bIzmmWoKj8jqyfIBb6EMbq6ZsM+kRiUzaqit2iij1RHwwwPy9IT8FL/6/4ukS40g05r+
 tWbHZ/6LSo+pYD8ll2MgH4AiGGa058ryVRG+Klb3rvPtGNjOhM8gUO+m82ywKSLKDzsd
 aF8AhRuiDyGgu/T9FGN8r4iuX/7lHM30EEzbLki4Uf8R2xvi98qK0oQaN1zcaOQYfykn
 guyjk4OrYS6GjbE5Q/VfGmVbapxRPF7pBF2HAew5fDu9/JR+at5B2UasGPBPU1g0Fa5q
 G/Zg==
X-Gm-Message-State: AJIora85JcRhaI+WRH+qu3DwtUHZls9I+6OXPuZcbJZG4iKOeeYI4det
 v8p0VNxGgyJS8Dl6mLQhTvvyYJQkH2qXIcAXXMCPp+XBrl/l+of3rJxq+iwsqCYTu7vllnAliyH
 qH3UGMPJWjaLFrZ5jGJ2w6TIapfyl
X-Received: by 2002:a05:600c:1d1c:b0:39c:7ac8:1faa with SMTP id
 l28-20020a05600c1d1c00b0039c7ac81faamr19974653wms.202.1655647542081; 
 Sun, 19 Jun 2022 07:05:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sqkvbNnOzZl+cwco0T7PXHEFnwFug7R2dDPBw4OF+u7KwsLzh4D4k2GwyDOt/mPsx86e/HuQ==
X-Received: by 2002:a05:600c:1d1c:b0:39c:7ac8:1faa with SMTP id
 l28-20020a05600c1d1c00b0039c7ac81faamr19974621wms.202.1655647541837; 
 Sun, 19 Jun 2022 07:05:41 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1c2501000000b0039747cf8354sm11553979wml.39.2022.06.19.07.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Jun 2022 07:05:41 -0700 (PDT)
Message-ID: <40d294df-de91-3f36-7d70-13cad54ac34f@redhat.com>
Date: Sun, 19 Jun 2022 16:05:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm: hisilicon: depends on MMU
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
References: <20220531025557.29593-1-rdunlap@infradead.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220531025557.29593-1-rdunlap@infradead.org>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 patches@lists.linux.dev, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Huang Rui <ray.huang@amd.com>,
 John Stultz <jstultz@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tian Tao <tiantao6@hisilicon.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Randy,

On 5/31/22 04:55, Randy Dunlap wrote:
> Prevent a kconfig warning when MMU is not enabled by making
> DRM_HISI_HIBMC depend on MMU.
> 
> WARNING: unmet direct dependencies detected for DRM_TTM
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=m] && MMU [=n]
>   Selected by [m]:
>   - DRM_TTM_HELPER [=m] && HAS_IOMEM [=y] && DRM [=m]
>   - DRM_HISI_HIBMC [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && (ARM64 || COMPILE_TEST [=y])
> 
> Fixes: 4f7f1973b0c8 ("drm/vram: fix Kconfig")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

