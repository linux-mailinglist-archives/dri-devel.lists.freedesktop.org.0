Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A31748013
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4EC10E1A4;
	Wed,  5 Jul 2023 08:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053DA10E1A4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688546984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mygE2eC1+1F6RcP4Lm9OLsM0G/twLQqV8R8dIF6r2eA=;
 b=J/YsifluszoJ343eM3UBt1Wy4p+tKaqfCyTi5o3g2JPs6eCM71LWJ5TF/U6pkD6uic/Ege
 R7vAlgWY/QK5nfalTqHLcNKWMvCqXhROtTyMV8IUyLWP07Y2oIjV1QWmxsiIlDz4Frh7PG
 Jh9oDtvY2DvxhL8JoBHbZHBkxNNng6I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-tUpsXhRyOWm6PsPvXjA3WQ-1; Wed, 05 Jul 2023 04:49:43 -0400
X-MC-Unique: tUpsXhRyOWm6PsPvXjA3WQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-314256aedcbso2534465f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 01:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688546982; x=1691138982;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mygE2eC1+1F6RcP4Lm9OLsM0G/twLQqV8R8dIF6r2eA=;
 b=Bvl2dVkyQYdQ/SyL5N0HCqGCeNd0w++G8b7QDZjeytsTUPQHkbZANi0zqefRmbl8O1
 e6M0NOyLqEM6zpDrV67WD2iNMHhfOMfd/+tpRJX+cGf3bdFiPhXsTeyRpd2GUA4KYHtJ
 RoSTWQ++bIbNyOWP3iaIrNswAW7NeO7Q/ln28M3PTjSFZhaXXRcQ5HRG6lN9LK+nf/An
 E7Hs0/Dl7uuuF2YHJk8hyu8Ek+d0OqaWu6dHrEN5D5Q2u4UQo9uYItuF6K1rbK/9OIcp
 X298TkTPaotQS1+Fb7ahp4vH/UJ2CpLqXRPJuCbs5sDg+qLw1bYJulyLK8oCVX1iJAdH
 0edw==
X-Gm-Message-State: ABy/qLb8aI6XBDHogeR5z8EFyKmstIttZgXu6C4KXdaZwr953SrCX3/T
 G4YdtLz8tOmAaGWgPslJx5m3IZ2BrcRRhcpS596phcl6Dggi91g15R5agQvdjnwj9MwFoGAceBU
 RklbiYd6r2+p+YnMygJtxMvaq6sic
X-Received: by 2002:adf:e44d:0:b0:313:f97c:d87f with SMTP id
 t13-20020adfe44d000000b00313f97cd87fmr12842669wrm.67.1688546982144; 
 Wed, 05 Jul 2023 01:49:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHiFHQIX6+LSUFE4lngdNXwrF3KteEAZwZqL0tALqI5G9uCMk9AA+C1J9hJqpvVRrGAzg2C2Q==
X-Received: by 2002:adf:e44d:0:b0:313:f97c:d87f with SMTP id
 t13-20020adfe44d000000b00313f97cd87fmr12842658wrm.67.1688546981884; 
 Wed, 05 Jul 2023 01:49:41 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x18-20020adff0d2000000b003141e86e751sm14564867wro.5.2023.07.05.01.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 01:49:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 06/10] drm/exynos: Set fbdev flags
In-Reply-To: <20230704160133.20261-7-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-7-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 10:49:40 +0200
Message-ID: <87r0pmrbdn.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Set fbdev default flags FBNFO_DEFAULT and mark the framebuffer with

FBINFO_DEFAULT, or did you meand FBINFO_FLAG_DEFAULT (the flag your patch
is actually using) ?

I just noticed that are the same... and in patch 04/10 you used the former
for the tegra driver, but here you are using the latter. Is on purpose or
just a mistake ?

> FBINFO_VIRTFB. The framebuffer range is in DMA-able memory and should
> be accessed with the CPU's regular memory ops.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 7ca3424b59ce..28dc398d6e10 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -72,6 +72,7 @@ static int exynos_drm_fbdev_update(struct drm_fb_helper *helper,
>  		return PTR_ERR(fbi);
>  	}
>  
> +	fbi->flags = FBINFO_FLAG_DEFAULT;

The #define FBINFO_FLAG_DEFAULT	FBINFO_DEFAULT seems to be there since the
original v2.6.12-rc2 git import in commit 1da177e4c3f4, so is hard to know
why was introduced. FBINFO_DEFAULT is more used, I will just stick to that:

$ git grep FBINFO_DEFAULT | wc -l
92

$ git grep FBINFO_FLAG_DEFAULT | wc -l
38

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

