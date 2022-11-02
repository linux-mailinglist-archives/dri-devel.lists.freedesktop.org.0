Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00DA6163EC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 14:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CD810E2A6;
	Wed,  2 Nov 2022 13:37:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6554210E1BE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667396221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezfKlpw9NG/xfspFEMSqInXk3hOpdkdRpzDAVN+gS9A=;
 b=EZ24Wm0xMmupk3eJ3TAJsGY3tyT0tBfUyuw8Sq5ezOt6cngmff6VmP6pcH2BXclgELEUl2
 3MxWgJSHJIPz40qfzjghQxTrx8FuccLmr4+ZDxLUGWJEeLC0MfzXdjBiR76UWeZ6q+uUiq
 XMLPVavL7U5iLyfn8vq+Z9zbMZRSBHA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-Jz7C6JmfOLGMDookM1xiGw-1; Wed, 02 Nov 2022 09:37:00 -0400
X-MC-Unique: Jz7C6JmfOLGMDookM1xiGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso7938279wmb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 06:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ezfKlpw9NG/xfspFEMSqInXk3hOpdkdRpzDAVN+gS9A=;
 b=lnagdvqi+6vnty2WrriFnh9EULtR6GvKPMmj6SmrBP6E8T7RW+uNz66L2r4XXRdsNE
 uuBKjWYtlnmtRI0eSg6s2Z1SMcl6127GaY4QAuxNY39ZC9m6xs3EMobHkkMhlxohW7PD
 FTLWey6auRr96JfaUuLn67vQMmZPmG+yzvbEqjA/sAHGZdjnSHD9bnjgkp+qVQMY3JO7
 30jyhObX1Ge1v+bLI+PmM/u9x/FuwUzPNp76uYqdPXsGZvYNrhiUZcf6t6Xvk1L5sumu
 RbNQxy5r0fadh+A62VYapzm6Gziiquf7QsoU62ApiFForW3Rfj5YlMvsQyWnsibwxc9y
 D1dA==
X-Gm-Message-State: ACrzQf2c1I0f3aePaSfKG9PycYPu6HrXVLySaPLVCpKVCHGysjwQSuvG
 6RJKBcAzeaMnopi1xpHRkwsRKxfnP5wPVgVuANxIC5E//GYULF55zW5fmUdTlCV/orHEdyZLNRI
 neBg32RB2A/atauNUORjMG/KEENZR
X-Received: by 2002:a5d:59a5:0:b0:236:8d38:4f1d with SMTP id
 p5-20020a5d59a5000000b002368d384f1dmr15222525wrr.131.1667396219352; 
 Wed, 02 Nov 2022 06:36:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6DmyyVd9dbwhJZdAzV0FclVYj6Tx+o1/LFmGOpcyP9dcxcDUcgxmEp8s4lJz7UhJ7FdB4RPw==
X-Received: by 2002:a5d:59a5:0:b0:236:8d38:4f1d with SMTP id
 p5-20020a5d59a5000000b002368d384f1dmr15222506wrr.131.1667396219110; 
 Wed, 02 Nov 2022 06:36:59 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k5-20020a05600c1c8500b003b47b80cec3sm2302863wms.42.2022.11.02.06.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 06:36:58 -0700 (PDT)
Message-ID: <ffb09945-5f45-027c-a1b8-cbc56302cc4a@redhat.com>
Date: Wed, 2 Nov 2022 14:36:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 2/2] drm/ofdrm: Cast error pointers to void __iomem *
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.stein@ew.tq-group.com, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20221028122229.21780-1-tzimmermann@suse.de>
 <20221028122229.21780-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221028122229.21780-3-tzimmermann@suse.de>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 10/28/22 14:22, Thomas Zimmermann wrote:
> Cast error pointers when returning them as void __iomem *. Fixes
> a number of Sparse warnings, such as the ones shown below.
> 
> ../drivers/gpu/drm/tiny/ofdrm.c:439:31: warning: incorrect type in return expression (different address spaces)
> ../drivers/gpu/drm/tiny/ofdrm.c:439:31:    expected void [noderef] __iomem *
> ../drivers/gpu/drm/tiny/ofdrm.c:439:31:    got void *
> ../drivers/gpu/drm/tiny/ofdrm.c:442:31: warning: incorrect type in return expression (different address spaces)
> ../drivers/gpu/drm/tiny/ofdrm.c:442:31:    expected void [noderef] __iomem *
> ../drivers/gpu/drm/tiny/ofdrm.c:442:31:    got void *
> 
> See [1] for the bug report.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/202210200016.yiQzPIy0-lkp@intel.com/ # [1]
> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 44f13a2b372be..f1c301820d54b 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -438,21 +438,21 @@ static void __iomem *get_cmap_address_of(struct ofdrm_device *odev, struct devic
>  	if (!addr_p)
>  		addr_p = of_get_address(of_node, bar_no, &max_size, &flags);
>  	if (!addr_p)
> -		return ERR_PTR(-ENODEV);
> +		return (void __iomem *)ERR_PTR(-ENODEV);
>  

There's an IOMEM_ERR_PTR() macro already for these cases. If you use
that instead, feel free to add my r-b when posting v3.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

