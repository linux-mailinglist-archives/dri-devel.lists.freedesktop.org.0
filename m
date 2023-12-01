Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EAF800611
	for <lists+dri-devel@lfdr.de>; Fri,  1 Dec 2023 09:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A360C10E81C;
	Fri,  1 Dec 2023 08:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A6410E81D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Dec 2023 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701420156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r0SUTWfnIuMyMvbVNiUleFZUEEojlqZ62paYlpowE08=;
 b=HO57W+v1ZZ1Zh6GaExzUyRsfPfHlJ/cXtN/gSR1b7JtFMVlZGIqmAZxu1n4EOceKH96bGc
 mhYMU1qQI6eoHzuEkIdRJoJQuiFVItbRu7UYWeLrgpJ2SMgzLru1kgfDzidiF9fkhFJi4s
 0QyVHOZLR6kUyHyqMM+X4ypq2PnFB88=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-wGz1_CBOM8a31IFLVpGBMA-1; Fri, 01 Dec 2023 03:42:34 -0500
X-MC-Unique: wGz1_CBOM8a31IFLVpGBMA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-50bc71772e2so2192303e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Dec 2023 00:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701420153; x=1702024953;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r0SUTWfnIuMyMvbVNiUleFZUEEojlqZ62paYlpowE08=;
 b=GYtESJzPjgP1NTm5SbDoGT8m9Oe1KDc3N2BVJos+2aAMZPxILJqz4RpFDmG0xUyhtE
 JPS1RkygHm6RBIsPKVboxXF7roV52nkKfF01ygzeWgDYogIxod0/NWh19mKWhbFsMCFJ
 03hyzIIUuzMAM8vvJM+H1n3RYdcavlQ+953LfGHzzoFUX+4a4A7GZa3IfFiw7kzDu1w4
 ZRr62/XwCYfgQf3Wke+H362XYVlb6g2vZ40LGCMX1BE6kMTA/N8slB46/j+NfNjQP5DX
 D3xumci3oNkOLdCOCLGy7qEQwsJdk5+eCZwP4pYy8SocOc2ZyAwHdTIvXKabbbBlecdw
 uFFQ==
X-Gm-Message-State: AOJu0YyKD5bmEaEK9SUa8Dh8WW9Gf3oMaNBjrRgor/ucfGWvgWbNjmv9
 NMnvK8POJ+y4Bn6YSZcbxh26FpGxxIVik81EZhXJqpc8enpJx/7kZmxBPrTM5OIjwhiPnXkakzd
 3J2vg3tcEhU0pyg9ZJlUhuIpvT5EI
X-Received: by 2002:a05:6512:2203:b0:50b:c34f:581e with SMTP id
 h3-20020a056512220300b0050bc34f581emr616132lfu.62.1701420153234; 
 Fri, 01 Dec 2023 00:42:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENDHPjLiQN61B6qKN5xDZ9Ku0d8jCKVggUUor5+9ZzH4L3f9+qxhGVMI7KzSvI9vjTuqAjlA==
X-Received: by 2002:a05:6512:2203:b0:50b:c34f:581e with SMTP id
 h3-20020a056512220300b0050bc34f581emr616117lfu.62.1701420152928; 
 Fri, 01 Dec 2023 00:42:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b19-20020a05600c4e1300b0040648217f4fsm8339573wmq.39.2023.12.01.00.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 00:42:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 suijingfeng@loongson.cn
Subject: Re: [PATCH 5/8] drm/solomon: Do not include <drm/drm_plane_helper.h>
In-Reply-To: <20231128104723.20622-6-tzimmermann@suse.de>
References: <20231128104723.20622-1-tzimmermann@suse.de>
 <20231128104723.20622-6-tzimmermann@suse.de>
Date: Fri, 01 Dec 2023 09:42:31 +0100
Message-ID: <871qc6mhzc.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/solomon/ssd130x.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
> index acf7cedf0c1ab..075c5c3ee75ac 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.h
> +++ b/drivers/gpu/drm/solomon/ssd130x.h
> @@ -17,7 +17,6 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
> -#include <drm/drm_plane_helper.h>
>  
>  #include <linux/regmap.h>
>  
> -- 
> 2.43.0
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

