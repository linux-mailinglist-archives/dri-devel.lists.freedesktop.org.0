Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2CF6EE619
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 18:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ABF10E778;
	Tue, 25 Apr 2023 16:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBB010E778
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 16:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682441420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1IBNqcRqeTZzne8M/J8hr1xuha01SHIRztHOGGgQpCw=;
 b=F4PxOc5Wg062Z4ca8LWcQA/CxooV+E4DZDKyM9kz9vgcV/nHzUaefC7qRkwS+inTfMypKG
 bASw5eQJpBFPUWVDgYhr0xVQtJg20uqhW/l+O7ytsCAQSUPZZvbR1ZYLg6HcoGy4qIZBNJ
 qi2jIfEoQA0G0I7E9Xkp+L8BIUi7e7M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-1p5sWBOjOJCcH-5hPlm0dQ-1; Tue, 25 Apr 2023 12:50:19 -0400
X-MC-Unique: 1p5sWBOjOJCcH-5hPlm0dQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f6632b85fcso1835431f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Apr 2023 09:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682441418; x=1685033418;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1IBNqcRqeTZzne8M/J8hr1xuha01SHIRztHOGGgQpCw=;
 b=DFaxbKp8Xlr0xmeTeMEsUos1fU2Tp6oU+Qj8Go0e/GkhrwIROR3wc5xQixeFr191Cm
 DBw0CF0nBzx1gYituhZBjCr/tApC4geoBAKfxdHzPI5j15qBDZZh3bGPJPpPkJUg6bMo
 G8TK7FwJ5Rx4pFwfJqHKDvinekSCuoaQnsR60cnUqPjgZq9js/5Mu3BymzAc/t+HZ2eG
 ejy3BOsAuum/QXV3mAeHnfpfNh5LpFPzFSmtw1HZpa3PGOH6ToIqnhEzFHFUFlTuWIMz
 /YFFu4Ez2LNMP1OjhcS+1BcOufnXD5Dcz4X56X1om2D7ay7XFrtB+KT8pEK+fFjiuBmM
 /iYQ==
X-Gm-Message-State: AAQBX9d87Sznfd+sxSOGZjLh0SVkHZdKv2jlvUGZwDf6pLkwpCxu4bG4
 npGzvef/4GbiadthZ8dlYy54d0M+BlyIn56kF1w1N5CQtIVosKQkZ+tE7PJewlTJNoEuwmIhE31
 9eGodQQdqMBWhRI1Xkty6zFvluMEl
X-Received: by 2002:adf:dd85:0:b0:2f1:d17f:cf95 with SMTP id
 x5-20020adfdd85000000b002f1d17fcf95mr13070164wrl.12.1682441418535; 
 Tue, 25 Apr 2023 09:50:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350a3fROSX8v9F9liQzoUUOVdfUK7aaTD4NXiculnVAEJdMY1kulAFQvsEsKKeaI17R2OBKp7fg==
X-Received: by 2002:adf:dd85:0:b0:2f1:d17f:cf95 with SMTP id
 x5-20020adfdd85000000b002f1d17fcf95mr13070145wrl.12.1682441418213; 
 Tue, 25 Apr 2023 09:50:18 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfe552000000b002f3e1122c1asm13541319wrm.15.2023.04.25.09.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 09:50:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, deller@gmx.de, geert@linux-m68k.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com
Subject: Re: [PATCH 6/6] drm/fb-helper: Use fb_{cfb,sys}_{read, write}()
In-Reply-To: <20230425142846.730-7-tzimmermann@suse.de>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-7-tzimmermann@suse.de>
Date: Tue, 25 Apr 2023 18:50:17 +0200
Message-ID: <87y1mfhpo6.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Implement DRM fbdev helpers for reading and writing framebuffer
> memory with the respective fbdev functions. Removes duplicate
> code.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 174 +-------------------------------
>  1 file changed, 4 insertions(+), 170 deletions(-)
>

Very nice cleanup!

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

