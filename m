Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98DC52E442
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 07:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B9811B209;
	Fri, 20 May 2022 05:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1843911B208
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653023897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AojK9fdDlk+robhCF8PY6mP/b2uer1ZGJkY3jjz44AE=;
 b=N8I52IrBOSNy91jFX5//bN2zCNc2jSDWKe8CW7nIG9mhGbViRaNhwwVfRolCkdd/m0OxE8
 U2d0sk9jyQAEtmyp30b3CcYZYiWi6b9Vlqumv3Q4qd9mzW0ckiQLMSlV0a49r5H6N/o6Up
 GBnIP0wyv7XwA8AsvlGq1VI4L9cHq+4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-ph0BMTQcNPmVYQxI83JkHQ-1; Fri, 20 May 2022 01:18:12 -0400
X-MC-Unique: ph0BMTQcNPmVYQxI83JkHQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 o11-20020adfca0b000000b0020adc114131so2205399wrh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 22:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AojK9fdDlk+robhCF8PY6mP/b2uer1ZGJkY3jjz44AE=;
 b=68t5lHYiNUDOzE26Iqxf51IjDE2UO0po8ZMxh1Oyeo5NA8bhhsz6ycbhKBKVCCwYtr
 dX8NmV6GcbeLQRMRSjGc7RwMGlCRS0tD8FyHAPM/aDIuyVL/w7cnXpYArKgwpEssjMBu
 +dH4V4FoD77zYwBj8QBNiUGaAZnmxTrIFhvr+UPK1ZW6jTj0rl3iqOIw8QIulfgsk3GC
 BseX0Vp+Cs8LUoqvWFfSbn6yIbdqzCJSOHItcPu8HUW4r9oxMu69Ss+sgdUbR+smmb5t
 tS+bw1h8t3I3TFoguSw3WUSxKgQjNqdJfyhIf+ovcTzVFX/5xkHcCa7GMeI51XdCeCoj
 qsbg==
X-Gm-Message-State: AOAM533FTJXAs7kPHD97479tnKKVvDDehbqudf/K9Tmg/xpOG8piR9dr
 /w/CYvgKTm7sGj+TFqZDA9GsVy89XHS5ISccEUo/CZPuglRfIaudO9HSIjbQRbMWFHZF+lKBs4t
 DIDq35KjOHZmSSadL6NB81Fgyqr22
X-Received: by 2002:adf:fe42:0:b0:20d:297:f86e with SMTP id
 m2-20020adffe42000000b0020d0297f86emr6731314wrs.382.1653023891707; 
 Thu, 19 May 2022 22:18:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZXqQy9NPRkq8RsuzAXsi3g2v9mePIB4+gjaCXquJOoX1jBb5+EgH3gcFfRjFHtBJgLajfaw==
X-Received: by 2002:adf:fe42:0:b0:20d:297:f86e with SMTP id
 m2-20020adffe42000000b0020d0297f86emr6731295wrs.382.1653023891497; 
 Thu, 19 May 2022 22:18:11 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o9-20020adf8b89000000b0020d0351dbb6sm1345823wra.80.2022.05.19.22.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 22:18:11 -0700 (PDT)
Message-ID: <1f63406f-5160-462a-2e79-0938421057a9@redhat.com>
Date: Fri, 20 May 2022 07:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/2] MAINTAINERS: Broaden scope of simpledrm entry
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220518183006.14548-1-tzimmermann@suse.de>
 <20220518183006.14548-2-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220518183006.14548-2-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/18/22 20:30, Thomas Zimmermann wrote:
> There will be more DRM drivers for firmware-provided framebuffers. Use
> the existing entry for simpledrm instead of adding a new one for each
> driver. Also add DRM's aperture helpers, which are part of the driver's
> infrastructure.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

I think you could push this without waiting for 2/2 to be ready.

>  MAINTAINERS | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c1fd93d9050..43d833273ae9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6388,13 +6388,15 @@ S:	Orphan / Obsolete
>  F:	drivers/gpu/drm/savage/
>  F:	include/uapi/drm/savage_drm.h
>  
> -DRM DRIVER FOR SIMPLE FRAMEBUFFERS
> +DRM DRIVER FOR FIRMWARE FRAMEBUFFERS
>  M:	Thomas Zimmermann <tzimmermann@suse.de>
>  M:	Javier Martinez Canillas <javierm@redhat.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	drivers/gpu/drm/drm_aperture.c
>  F:	drivers/gpu/drm/tiny/simpledrm.c
> +F:	include/drm/drm_aperture.h

I wonder if we could add drivers/firmware/sysfb* as well, it certainly is
related since is the place where different platforms register the device.

But it's not in drivers/gpu, hence the question if we could include it 
(and possibly merge it through drm-misc as well, etc).

Dave, Daniel, what do you think ?

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

