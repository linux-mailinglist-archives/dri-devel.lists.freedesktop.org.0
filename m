Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1302E62F6CE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 15:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C2A10E73F;
	Fri, 18 Nov 2022 14:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FF710E73F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 14:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668780424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtf8xWRRnev/9J5aMrva2BwzoebqXesgsea5/L2BaLM=;
 b=cj8DLqR8zIK6rGgQ2r9GgQIcXoTTjY6tOiQ+t7ifWs7mFpKYxbbgmafqBF5jH8vOCzw6WW
 ANI7zcTnlM78Wly+mE5D+8fYyuGAg0fKn2SA6b29sp8qj72JlQkQTwTnLB/aDTZm+ouNVR
 GtmkDRTf+iHoY0UUcDrFsI+7awsFXZE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-179-sMW_taRqOiG4O7RsAPO2vg-1; Fri, 18 Nov 2022 09:07:03 -0500
X-MC-Unique: sMW_taRqOiG4O7RsAPO2vg-1
Received: by mail-wm1-f70.google.com with SMTP id
 c126-20020a1c3584000000b003cfffcf7c1aso2270440wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 06:07:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jtf8xWRRnev/9J5aMrva2BwzoebqXesgsea5/L2BaLM=;
 b=kQafGRn4CcRaWL/AEPoF3VnhDSugYDZg1K8qquUl+irs70EsScGFgjGFUfdBjU7/vI
 KhuloI5+LSwwMwuZJkIKlWIWQbZhKhvhJhdwh21lSqRXXyB0mVfwj6zlLakc38AQ32SY
 zVtO7BXoNBFAuPuGFZiLvbntuogYDBB01pONIzBLYCiteaBSavISJhjeJhEWM19qDU42
 PY6CFWMRIGj2X//ujfv+JoHdv4a0H9pn7O8GKcuja8aqMzlKy25pMZb/ugeD/9EC3E79
 0TIA/K/wPt2rk5CjqT9RVf8UziACwMFPlZcyglihPfA8iyw5iqT/LoGzvWy975DrHSMy
 odiA==
X-Gm-Message-State: ANoB5pm5ZIsZdHwqPYOjK5OWyB2ZfKuANky/C7nIpmJpS98oN7xPphWL
 kazGhWO+vPT5Db+UHgqGxN9EVM9NGDFeL4NVVBZRD6ci8inpQiyoVzdKRc25gf1nOC2R346iKQk
 Hk8Qrh0x9QXbiUkB6pCTTQZmKBklG
X-Received: by 2002:a05:600c:4aa9:b0:3cf:68bb:f5b8 with SMTP id
 b41-20020a05600c4aa900b003cf68bbf5b8mr8543265wmp.67.1668780420379; 
 Fri, 18 Nov 2022 06:07:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7JsWo0XJSaikh+OH9lOdzrB9eNLDnM3iaIfJcTWY3Je+9QeWSEM0rljiE4yAeO3GScO9RgbA==
X-Received: by 2002:a05:600c:4aa9:b0:3cf:68bb:f5b8 with SMTP id
 b41-20020a05600c4aa900b003cf68bbf5b8mr8543246wmp.67.1668780420193; 
 Fri, 18 Nov 2022 06:07:00 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o11-20020a1c750b000000b003cfe1dcd354sm4496666wmc.27.2022.11.18.06.06.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 06:06:59 -0800 (PST)
Message-ID: <cc888e07-d319-c9df-b5af-d9df5b999626@redhat.com>
Date: Fri, 18 Nov 2022 15:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 4/7] drm/ofdrm: Set preferred depth from format of scanout
 buffer
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-5-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221116160917.26342-5-tzimmermann@suse.de>
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
> Set the preferred depth from the format of the scanout buffer. The
> value cannot be hardcoded, as the scanout buffer's is only known at
> runtime. Keeping the existing switch statement just duplicates the
> driver's existing logic for format detection.
> 
> Also remove the FIXME comment from the call to drm_fbdev_generic_setup()
> as the driver now handles color depth and bpp values correctly.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

