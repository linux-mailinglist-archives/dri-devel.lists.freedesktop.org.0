Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC0873F998
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 12:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C264710E2D6;
	Tue, 27 Jun 2023 10:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3025710E2D6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 10:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687860217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uh7BaG+8Uk9WNRPivTpJulFFo4Gb5UVrotSSROD3kag=;
 b=Vg8ERf0U6167d0lNrDiQp37FNwSJG05Lxs+HWTaOEgWXaEIM3lsIzRWQ1rAycMV2REgTHi
 SAaHG49fqPUJnQIcrnyq/gM+vIxIYx5TmAEm87kHncCtq9eNSdXQSdVOAlmTgFQl209yui
 HytxOJF5FHq92DLVAnKMo8/tu3Ou6ds=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-EUxuyon3Mg-7iAz_GDxUew-1; Tue, 27 Jun 2023 06:03:34 -0400
X-MC-Unique: EUxuyon3Mg-7iAz_GDxUew-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fa714fa27aso24685225e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 03:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687860213; x=1690452213;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uh7BaG+8Uk9WNRPivTpJulFFo4Gb5UVrotSSROD3kag=;
 b=bUzOxtwbKlhiXQ7tVB6L/+wUSNrI0IvZA3dlO36ZPtxbuWQRtXbeAI0rJsF0rOvaBu
 tQaG5qgAW34AWBTKyMBnDGq4X6tkkHXXyuZhIs5AVceb2nyQbbM5HYKmrdrAQFpDjPkl
 sjZ7Ip4IKrW+wj9A4pVCk8MljgEJFbAiYcc4M4heKok5yhNBoyFHEscBGAzcdVDlhYUY
 PLxBsq0YgWiXyI54EXEVpIiwD9PBi4iqa0Yw3wgiisQV3Rjw+UbBKo+s5ycMxOyN1TcH
 S9k3Uo6ewhf1jR6EwG0BLvr1ZWt/GXnVtFFFjFS1o7bKoenps8vodV1VZyXAA8gxyFWC
 lXCA==
X-Gm-Message-State: AC+VfDxfNQdZUGITs/QxOltfJ6p5xEMq7xvC3TxLUlhHyokiLjnT6Y2Q
 es+/E4SkuoFuJ9v2NUkzXhZLhGU1tg0nMWGiBpAxCPK7niI/aj9pWZYYL7/hcnHIHaeG0Jo1LMs
 m+JLL20V0UVuqC7oAWd3y/f6SdMJEXRkJ18pc
X-Received: by 2002:a05:600c:219:b0:3fa:8956:22c7 with SMTP id
 25-20020a05600c021900b003fa895622c7mr5575237wmi.33.1687860212871; 
 Tue, 27 Jun 2023 03:03:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6lQ7SdODpVpnyPESRu2utx78bG8FUCHgL22J+7PBY4BInNhoRc1wYt6v77oJ7kZDOeevH/Rw==
X-Received: by 2002:a05:600c:219:b0:3fa:8956:22c7 with SMTP id
 25-20020a05600c021900b003fa895622c7mr5575223wmi.33.1687860212569; 
 Tue, 27 Jun 2023 03:03:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n10-20020a1c720a000000b003fa96620b23sm5527768wmc.12.2023.06.27.03.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 03:03:27 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 6/8] drm/virtio: Use the hotspot properties from
 cursor planes
In-Reply-To: <20230627035839.496399-7-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-7-zack@kde.org>
Date: Tue, 27 Jun 2023 12:03:21 +0200
Message-ID: <87o7l12pee.fsf@minerva.mail-host-address-is-not-set>
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
Cc: David Airlie <airlied@linux.ie>, banackm@vmware.com,
 Gurchetan Singh <gurchetansingh@chromium.org>, krastevm@vmware.com,
 ppaalanen@gmail.com, Gerd Hoffmann <kraxel@redhat.com>, iforbes@vmware.com,
 virtualization@lists.linux-foundation.org, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zack@kde.org> writes:

> From: Zack Rusin <zackr@vmware.com>
>
> Atomic modesetting got support for mouse hotspots via the hotspot
> properties. Port the legacy kms hotspot handling to the new properties
> on cursor planes.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: virtualization@lists.linux-foundation.org
> ---
>  drivers/gpu/drm/virtio/virtgpu_plane.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

