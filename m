Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA8D51C9C2
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 21:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A475910F325;
	Thu,  5 May 2022 19:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 588 seconds by postgrey-1.36 at gabe;
 Thu, 05 May 2022 19:57:31 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B454110F351
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651780650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQdApoYa6nUTANKsVJL2yCvAWducoOnmFhGo9oVvBLo=;
 b=h5sn2L+uS+ybPxJYdEiyVldvi9Hcpp1dDaRPZ8I2qLyzhrA+KfNG21kB+RQFU3LEaSYI1r
 0DEQe19tUYeWWl95bu9pn/Q+7Yu53U9H28l8FPHJFDTHMjUKfVKabaDhUAH5LfhNFy/+Yf
 +JoqwM7JwPZ4E5yNyRbc0vzAjhyYnSY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-8tiCNlEhOVqYoxP-IfCECg-1; Thu, 05 May 2022 15:57:29 -0400
X-MC-Unique: 8tiCNlEhOVqYoxP-IfCECg-1
Received: by mail-qv1-f70.google.com with SMTP id
 j2-20020a0cfd42000000b0045ad9cba5deso678091qvs.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 12:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rQdApoYa6nUTANKsVJL2yCvAWducoOnmFhGo9oVvBLo=;
 b=1EYykZv4MGPIIXXl6eZB1RkjQ8Xt9mP+yqViml52x2pWEBhttnl2l1qKzvyiVzghGG
 8jZHrHNFP938nCnulLVGNzFXRR8zHNxdz7znFQRYxczKk9/mPgwD6YS+yXUMTQ3GbSfR
 eUVQunk/e/9dB09Fmzlu9HhEeHoZPxhgLfKyh2GIPKfXQozcOY/tOeAST8Xl7HQUF5im
 b99dmr/z3Wef04PzFm8tKesg+0c8EIzth3rKR/LzKliQpFsB7n8XiYA3afduRujmA8oh
 tEN2+3h1qD+n6I7Ij4vxmhvswqN6KBJ+P4kbTyPg0w1/GCXMjywFqkj4DOfLseM2pM6c
 Zb2Q==
X-Gm-Message-State: AOAM531OKiSkJuDHVsQ0Nr2PxpdRV0eXCk0HN6XsXKlj3JUnkCcHMv+m
 REPopDh7GYg7tSXzIiP2aG5/RrSn+zH36XA5A0juvHzQwUz26qB9dViEto9rh26EgRfOslQmw/b
 2pFDIweE5/hRcn469XD5pi5XXzsI3
X-Received: by 2002:a37:9381:0:b0:69f:62c6:56a7 with SMTP id
 v123-20020a379381000000b0069f62c656a7mr21018127qkd.643.1651780649370; 
 Thu, 05 May 2022 12:57:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysHvCP5TnQ3sEmfDp/p5w9i9wXshs650VSW1K7lLdusgFc5hlOZKEwi/HjjBeApccdfiF3kQ==
X-Received: by 2002:a37:9381:0:b0:69f:62c6:56a7 with SMTP id
 v123-20020a379381000000b0069f62c656a7mr21018112qkd.643.1651780649132; 
 Thu, 05 May 2022 12:57:29 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 l15-20020ac848cf000000b002f39b99f6c3sm1288303qtr.93.2022.05.05.12.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 12:57:28 -0700 (PDT)
Message-ID: <7574d491866ffa7c1a4607885b76140ba4206477.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: reorder nouveau_drm_device_fini
From: Lyude Paul <lyude@redhat.com>
To: Mark Menzynski <mmenzyns@redhat.com>, linux-kernel@vger.kernel.org
Date: Thu, 05 May 2022 15:57:27 -0400
In-Reply-To: <20220504171851.17188-1-mmenzyns@redhat.com>
References: <20220504171851.17188-1-mmenzyns@redhat.com>
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
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Ben Skeggs <bskeggs@redhat.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hmm, I think we might just need to move the drm_kms_helper_poll_enable() call
to the end here instead of all of nouveau_display_init(). I realized this
because in nouveau_display_init() it seems that we actually rely on
nouveau_display_init() to setup hotplug interrupts - which we do actually need
this early on in the driver probe process.

That being said though, drm_kms_helper_poll_enable() shouldn't be required for
MST short HPD IRQs from working so moving that instead should work.

On Wed, 2022-05-04 at 19:18 +0200, Mark Menzynski wrote:
> Resources needed for output poll workers are destroyed in
> nouveau_fbcon_fini() before output poll workers are cleared in
> nouveau_display_fini(). This means there is a time between fbcon_fini
> and display_fini, where if output poll happens, it crashes.
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
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 561309d447e0..773efdd20d2f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -588,12 +588,6 @@ nouveau_drm_device_init(struct drm_device *dev)
>         if (ret)
>                 goto fail_dispctor;
>  
> -       if (dev->mode_config.num_crtc) {
> -               ret = nouveau_display_init(dev, false, false);
> -               if (ret)
> -                       goto fail_dispinit;
> -       }
> -
>         nouveau_debugfs_init(drm);
>         nouveau_hwmon_init(dev);
>         nouveau_svm_init(drm);
> @@ -601,6 +595,12 @@ nouveau_drm_device_init(struct drm_device *dev)
>         nouveau_fbcon_init(dev);
>         nouveau_led_init(dev);
>  
> +       if (dev->mode_config.num_crtc) {
> +               ret = nouveau_display_init(dev, false, false);
> +               if (ret)
> +                       goto fail_dispinit;
> +       }
> +
>         if (nouveau_pmops_runtime()) {
>                 pm_runtime_use_autosuspend(dev->dev);
>                 pm_runtime_set_autosuspend_delay(dev->dev, 5000);
> @@ -641,15 +641,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
>                 pm_runtime_forbid(dev->dev);
>         }
>  
> +       if (dev->mode_config.num_crtc)
> +               nouveau_display_fini(dev, false, false);
>         nouveau_led_fini(dev);
>         nouveau_fbcon_fini(dev);
>         nouveau_dmem_fini(drm);
>         nouveau_svm_fini(drm);
>         nouveau_hwmon_fini(dev);
>         nouveau_debugfs_fini(drm);
> -
> -       if (dev->mode_config.num_crtc)
> -               nouveau_display_fini(dev, false, false);
>         nouveau_display_destroy(dev);
>  
>         nouveau_accel_fini(drm);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

