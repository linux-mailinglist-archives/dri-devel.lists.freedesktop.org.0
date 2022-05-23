Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB96531552
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 19:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C47FD1120E1;
	Mon, 23 May 2022 17:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E461120E1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 17:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653327431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BYIDCnf/Zf8QzS2kJ2TsL1URkSHu4rYCBHFAM1s78Bs=;
 b=X4g92M/O9cr8MOyAjlxlKgzzOsLO5gKyOjVE62z+FZcUBd3EzLGJGQhpGP4JqStuwz8wg3
 2FZ19yMeYhUC8HS6YTjqiIRYt2xK9Qz7JyHi+yGgi6pO0UCO1Cu/dshT2Ca9f5TSg2FPrn
 g6knrRJ4oiUokNZcqm7z0hNKi51WXRE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-IBKY5Jl5MqqZUYz0U-dwzQ-1; Mon, 23 May 2022 13:37:10 -0400
X-MC-Unique: IBKY5Jl5MqqZUYz0U-dwzQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 g3-20020ac81243000000b002f917ea21c5so8206910qtj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 10:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=BYIDCnf/Zf8QzS2kJ2TsL1URkSHu4rYCBHFAM1s78Bs=;
 b=Pedes+dC09DY3AV9jjZVMicE48u5QtNV/AIh1BIH5NqlaIOph8qxhfrCj8Vbp8nWqK
 VZNeYdcKwYVJKCai/zulTZKVsujuEXz5S8VARnhPCaCIv6ELoFzASjsKQHpq2nvRNogP
 B26uK9s+5Q+ektMssLJWQnsO5/n6uqzi7YUCoWLZRVLfWTurdsZxn8ujUT+7rqmYHCgU
 7aKJ24njqYciY5GAGFNPOglKSfKxSXJp9HH47RFSnRKNUVA60yrC/XC3lfKQNAbbMTlq
 v+qLNx/1mKcHIIs0YB1l9uYJMTb+u7fBipMio+RS0KsFTH9ZuzMg/Gf2lrU5361Vcnh0
 q0wQ==
X-Gm-Message-State: AOAM532T++BdAHe9SN87akw6/vXMMB2/CaKHqb/y3jcQgwf9KiV7EQ2H
 2DBj+tUA8qYMs88vf1MrLrqrrAT8jsFxOPG3pAjjlhoQTPX280McUs7RhAIbIIZEL97Xjvk0tJ+
 85nCHSJqw8nw/blVx6Y8ELV8QUr52
X-Received: by 2002:ad4:5bc1:0:b0:42c:531c:ef12 with SMTP id
 t1-20020ad45bc1000000b0042c531cef12mr18148397qvt.15.1653327430151; 
 Mon, 23 May 2022 10:37:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFSlrvT0UAwxLdqZ1fz1PXc+yVuTdzO7/sMFpZ8cj76cv99LCVVGr1j1/NEpUjri+Na5pRww==
X-Received: by 2002:ad4:5bc1:0:b0:42c:531c:ef12 with SMTP id
 t1-20020ad45bc1000000b0042c531cef12mr18148377qvt.15.1653327429953; 
 Mon, 23 May 2022 10:37:09 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 w15-20020ac84d0f000000b002f90517bc25sm4619030qtv.41.2022.05.23.10.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 10:37:09 -0700 (PDT)
Message-ID: <36bd82b1a95cb4cbbecac188a4c4e27cf890cdd4.camel@redhat.com>
Subject: Re: [PATCH v3] drm/nouveau: clear output poll workers before
 nouveau_fbcon_destroy()
From: Lyude Paul <lyude@redhat.com>
To: Mark Menzynski <mmenzyns@redhat.com>, linux-kernel@vger.kernel.org
Date: Mon, 23 May 2022 13:37:07 -0400
In-Reply-To: <20220523113541.10562-1-mmenzyns@redhat.com>
References: <20220523113541.10562-1-mmenzyns@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a bit, thanks!

On Mon, 2022-05-23 at 13:35 +0200, Mark Menzynski wrote:
> Resources needed for output poll workers are destroyed in
> nouveau_fbcon_fini() before output poll workers are cleared in
> nouveau_display_fini(). This means there is a time between fbcon_fini()
> and display_fini(), where if output poll happens, it crashes.
> 
> This patch introduces another output poll clearing before fbcon
> resources are destroyed.
> 
> BUG: KASAN: use-after-free in
> __drm_fb_helper_initial_config_and_unlock.cold+0x1f3/0x291
> [drm_kms_helper]
> 
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> index 4f9b3aa5deda..5226323e55d3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -39,6 +39,7 @@
>  
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_atomic.h>
> @@ -605,6 +606,7 @@ nouveau_fbcon_fini(struct drm_device *dev)
>         if (!drm->fbcon)
>                 return;
>  
> +       drm_kms_helper_poll_fini(dev);
>         nouveau_fbcon_accel_fini(dev);
>         nouveau_fbcon_destroy(dev, drm->fbcon);
>         kfree(drm->fbcon);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

