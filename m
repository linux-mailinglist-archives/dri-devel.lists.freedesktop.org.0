Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D911089F3F5
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697B6113385;
	Wed, 10 Apr 2024 13:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eryf69YH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF5F113385
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1712755230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ETAJsDKvc5B7lB1rhXcx7y8Da9mQJUUywbUXeVTtPA=;
 b=eryf69YHD5BmzkRGlDPF8vN9wvGBBzqR+ObRj8mzw4dYpnSgOD+IUW9t+SsXDf5CsYjDtK
 wAhyclPwWKQ0po/yH5iouvB1n7kMvzW81vL/1r052nOiVBKZti7olq1CQhzjdYB/A7xWKy
 yyuKz98f60B/7rQP5uBV4wkyv77qRQw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-JXOXY5ZcOqmsplI5QEhfEA-1; Wed, 10 Apr 2024 09:20:28 -0400
X-MC-Unique: JXOXY5ZcOqmsplI5QEhfEA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a5199cc13b2so472171866b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 06:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712755227; x=1713360027;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4ETAJsDKvc5B7lB1rhXcx7y8Da9mQJUUywbUXeVTtPA=;
 b=mObLwgPoUcje5sXcnLNQpdv2aw/8NCldbvc1HfX2aLvnc4Z0o30N6dFMKc2YglbfW4
 wiY46oIOWwPVpQKn5/HlhHSuPnTRxj6RTJCPcqLfzoWUATGn9JqivTiBhXS2SBo3yTYe
 nOZQCvlgHmlBRenbgO88RJMiZR6Tu5XC8vhoI9W1NCuNQhppHqROn8lq2Z8Hxxs5xuMo
 rnQnlVJYgzTxwe6hB6P1xvxJn7p1y1KMu2+BIliVDgjd8qlZbqxk54rKiV12oPYLr7al
 qOXoNmWVEx1My4jevxudKBIbNFBy6gxulcrTwuol81ngkdKArWlvXU0Z/VILL4gDgZEP
 APVQ==
X-Gm-Message-State: AOJu0YyLehaKsUe5NNwKTK36Pu1zKuULBZ8kYSBc9SWNZxtrlWkMVfw5
 VCi0q8KKC+JXUs5nmEkn8qlJU5b4tOtB8nNek5LrO5vk6NtKH0oxYEtdtQxhYEBXu+a8GuN16cP
 3A2131hrXUlS/pbuWzS3CJW+jRVnd0CnmH7hRYFsB8J/4B1moxakV+tvSbPMbRR2QqA==
X-Received: by 2002:a17:906:3503:b0:a51:fffa:c357 with SMTP id
 r3-20020a170906350300b00a51fffac357mr3276203eja.8.1712755226948; 
 Wed, 10 Apr 2024 06:20:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDjoGPH7+ZwwHniOhWTpD4SzAjPGhJL2COHyZPehGncID3cjxgZJxE+T0o+2qPZqTpiPpPQQ==
X-Received: by 2002:a17:906:3503:b0:a51:fffa:c357 with SMTP id
 r3-20020a170906350300b00a51fffac357mr3276183eja.8.1712755226541; 
 Wed, 10 Apr 2024 06:20:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 jl7-20020a17090775c700b00a4e70ede2b7sm7018744ejc.174.2024.04.10.06.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 06:20:25 -0700 (PDT)
Message-ID: <feabcce4-44aa-4b30-ac1f-b2313ddfac15@redhat.com>
Date: Wed, 10 Apr 2024 15:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/43] drm/tiny/gm12u320: Use fbdev-shmem
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 deller@gmx.de, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-16-tzimmermann@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240410130557.31572-16-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/10/24 3:02 PM, Thomas Zimmermann wrote:
> Implement fbdev emulation with fbdev-shmem. Avoids the overhead of
> fbdev-generic's additional shadow buffering. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 0187539ff5eaa..8b4efd39d7c41 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -13,7 +13,7 @@
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_edid.h>
> -#include <drm/drm_fbdev_generic.h>
> +#include <drm/drm_fbdev_shmem.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_fourcc.h>
> @@ -699,7 +699,7 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
>  	if (ret)
>  		goto err_put_device;
>  
> -	drm_fbdev_generic_setup(dev, 0);
> +	drm_fbdev_shmem_setup(dev, 0);
>  
>  	return 0;
>  

