Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 838DE515524
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 22:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8888610F880;
	Fri, 29 Apr 2022 20:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E6D10F880
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 20:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651262704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kcovE1w1Q2ySPHOXXOrSnghDbs+C0kl65FGWnu24ba4=;
 b=UxUocnV4p95fFS/e2p60V+ZiPpUtABQ61AcdSs8jBvW3Ui+J8jgQ/XzeNI0WoyVS6dbFui
 WUT7UJF0MSzL8lZwtLeINQs2MnpKvKcA9y1z+be8G7/iiNNKaH5NqnxC+/UiKO0ue/WLEc
 aXpzMkRGI6IZ/MkcZ4H83WE//B7I0vk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-EYC8U-DBN9qwl6o4EP3L_g-1; Fri, 29 Apr 2022 16:05:01 -0400
X-MC-Unique: EYC8U-DBN9qwl6o4EP3L_g-1
Received: by mail-qt1-f198.google.com with SMTP id
 s3-20020a05622a1a8300b002f3692d5a18so6402544qtc.21
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 13:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=kcovE1w1Q2ySPHOXXOrSnghDbs+C0kl65FGWnu24ba4=;
 b=dcMKyXLll+EbKkZWprwU0wkDRz43/Fal26ytEjGsRwVIP03y+vkoik6rDVS6pUfZNz
 FAvA6IKPyZuEXrLGTCnOU2ym4/1TpU29cZ1Iv5iGzNdGN6BLlMVtNMrAdEAdj3DMPcit
 xafJfkZTpoRL+LPhPfLRojTH77HCWezp/n4ck3w2Q0QrER9Y/wQLRVgFSVtGCWXK5GXi
 mQBYhA6/IBNzlDkG+1CtOjpcj4jm+8J7FY9IC/ZK17LyabBGnX3v8MhLr+Whu37REYtD
 v6XvSvNziG/8glhT/l+ENlCk6BTS/4agpZTdcW1LS3ZmIQUM0pQ7AEMFXew37l3xk/zn
 i2qw==
X-Gm-Message-State: AOAM533coLQn9twLgPGFxEgb/oGvf4toz9d56PdoJFMka5IFRbsF06Vz
 hRoRLsdg6+iR4JSlEaMY52UWyPisXVkccWJAygadPQay5YyyQxMqkK+2F7OfIueFYkUQ1Z6NE53
 HVFuT61Yo/4T9SlZfKJERLl/mWAAu
X-Received: by 2002:a05:620a:470d:b0:69f:b40e:4980 with SMTP id
 bs13-20020a05620a470d00b0069fb40e4980mr624214qkb.18.1651262700560; 
 Fri, 29 Apr 2022 13:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvhd/Pz3dnN/kOghuRQrdjTAxwOX9z2qV4xiYISPavIPxL9eNwnZkwzFKpy8xIW42Aw65MvA==
X-Received: by 2002:a05:620a:470d:b0:69f:b40e:4980 with SMTP id
 bs13-20020a05620a470d00b0069fb40e4980mr624198qkb.18.1651262700355; 
 Fri, 29 Apr 2022 13:05:00 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 q19-20020ac84513000000b002f39b99f671sm81839qtn.11.2022.04.29.13.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 13:04:59 -0700 (PDT)
Message-ID: <5e89bb2eebbe173e1fa4d1c5abc977fb0ae433d9.camel@redhat.com>
Subject: Re: [PATCH 3/4] drm/nouveau: use drm_gem_plane_helper_prepare_fb
From: Lyude Paul <lyude@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Date: Fri, 29 Apr 2022 16:04:58 -0400
In-Reply-To: <20220429134230.24334-3-christian.koenig@amd.com>
References: <20220429134230.24334-1-christian.koenig@amd.com>
 <20220429134230.24334-3-christian.koenig@amd.com>
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Also consider this as permission to push this to drm-misc-next

On Fri, 2022-04-29 at 15:42 +0200, Christian König wrote:
> Instead of manually adjusting the plane state.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 8642b84ea20c..bb8a4601e0d9 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -32,6 +32,7 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_fourcc.h>
>  
>  #include "nouveau_bo.h"
> @@ -558,9 +559,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct
> drm_plane_state *state)
>                         asyw->image.handle[0] = ctxdma->object.handle;
>         }
>  
> -       ret = dma_resv_get_singleton(nvbo->bo.base.resv,
> -                                    DMA_RESV_USAGE_WRITE,
> -                                    &asyw->state.fence);
> +       ret = drm_gem_plane_helper_prepare_fb(plane, state);
>         if (ret)
>                 return ret;
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

