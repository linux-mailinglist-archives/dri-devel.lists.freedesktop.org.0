Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BE673F710
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045CC10E2AB;
	Tue, 27 Jun 2023 08:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5F910E2AB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687854417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8rtWVv0EL741DRzDjUllIDtQPY8B5mWR0btwemUl7xE=;
 b=POPSefyALzq2v3dHVkqGHojHgkfTeOZjuzWmXHgHb8jbm++FXiIZpi1I9kM+lEtNTrWfT7
 uUhmFcNXzYttmhmRwNW88NumZJkpe283qT5VgFBoMHTNKSZAWEfO2ETLMXkc0RlCpk5Sdg
 OsOXgJn2QWdoRZrQHHnqBpSzePph0iQ=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-KPTngAxeMFKtZM8bR6NTtg-1; Tue, 27 Jun 2023 04:26:55 -0400
X-MC-Unique: KPTngAxeMFKtZM8bR6NTtg-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-4f96aa6af57so3480337e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 01:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687854414; x=1690446414;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8rtWVv0EL741DRzDjUllIDtQPY8B5mWR0btwemUl7xE=;
 b=k0hrFSCC/IUjceb1h+olThcIwJhw/jL76/Hj6ylH0uBydht6IRZeDhmDzWdaPWmL9x
 L9W98ZOBPmYEVlZtYJgGaBygmBtIVE8JFdDM8Ts5u7y90owIv76L2fLmdnhkHE921aGD
 vQ3ibJ3ulZlfO2vTdZBz4wk5/97MHhsqD3PS3uRgSo94uNOONr9V3kxLNmGggnnp6yJt
 CYnuxY2D4i8QyfnbHCwOST/4/zBS+ww+PBatRnVwGezrLNQOL4xS7jkrfDN7kDgKBZoo
 m0p+rd1WjoWDkv+x20fs/rADYDgEzbRmfyRV0ZBJxIhHMULR0ib9WNqDUOqD8ogOo28f
 VYuw==
X-Gm-Message-State: AC+VfDypEej2F97n5lZDoukQ4LIvR8R/OOl9eeF1cYz1HzoSjtn+UvTq
 tAMAHApCZZ2f0uWplhKSbp903nndqD8WHZWJacqghDra5ZybJHQQEMO1ESt9cCr3wrIo3FTgxMK
 5xEzJw4X9nkapHzNFGUu4t1W5Ri/S
X-Received: by 2002:a19:6457:0:b0:4f8:5604:4b50 with SMTP id
 b23-20020a196457000000b004f856044b50mr17471142lfj.64.1687854414092; 
 Tue, 27 Jun 2023 01:26:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4gMLmvg0ErLZiC0/qz9kyD8D8kBlD0tBf8HFjVdpwUt1NiUlbupacFiOJlc/k+zzRwZBBYBg==
X-Received: by 2002:a19:6457:0:b0:4f8:5604:4b50 with SMTP id
 b23-20020a196457000000b004f856044b50mr17471127lfj.64.1687854413766; 
 Tue, 27 Jun 2023 01:26:53 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d9-20020a5d6dc9000000b0030ae53550f5sm9635481wrz.51.2023.06.27.01.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:26:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
In-Reply-To: <20230627035839.496399-2-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-2-zack@kde.org>
Date: Tue, 27 Jun 2023 10:26:51 +0200
Message-ID: <875y7948fo.fsf@minerva.mail-host-address-is-not-set>
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
Cc: krastevm@vmware.com, David Airlie <airlied@linux.ie>, banackm@vmware.com,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 stable@vger.kernel.org, iforbes@vmware.com,
 virtualization@lists.linux-foundation.org, mombasawalam@vmware.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Zack Rusin <zack@kde.org> writes:

Hello Zack,

> From: Zack Rusin <zackr@vmware.com>
>
> Cursor planes on virtualized drivers have special meaning and require
> that the clients handle them in specific ways, e.g. the cursor plane
> should react to the mouse movement the way a mouse cursor would be
> expected to and the client is required to set hotspot properties on it
> in order for the mouse events to be routed correctly.
>
> This breaks the contract as specified by the "universal planes". Fix it
> by disabling the cursor planes on virtualized drivers while adding
> a foundation on top of which it's possible to special case mouse cursor
> planes for clients that want it.
>
> Disabling the cursor planes makes some kms compositors which were broken,
> e.g. Weston, fallback to software cursor which works fine or at least
> better than currently while having no effect on others, e.g. gnome-shell
> or kwin, which put virtualized drivers on a deny-list when running in
> atomic context to make them fallback to legacy kms and avoid this issue.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: 681e7ec73044 ("drm: Allow userspace to ask for universal plane list (v2)")
> Cc: <stable@vger.kernel.org> # v5.4+
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: virtualization@lists.linux-foundation.org
> Cc: spice-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_plane.c          | 13 +++++++++++++
>  drivers/gpu/drm/qxl/qxl_drv.c        |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c  |  2 +-
>  include/drm/drm_drv.h                |  9 +++++++++
>  include/drm/drm_file.h               | 12 ++++++++++++
>  7 files changed, 38 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..a4a39f4834e2 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -678,6 +678,19 @@ int drm_mode_getplane_res(struct drm_device *dev, void *data,
>  		    !file_priv->universal_planes)
>  			continue;
>  
> +		/*
> +		 * If we're running on a virtualized driver then,
> +		 * unless userspace advertizes support for the
> +		 * virtualized cursor plane, disable cursor planes
> +		 * because they'll be broken due to missing cursor
> +		 * hotspot info.
> +		 */
> +		if (plane->type == DRM_PLANE_TYPE_CURSOR &&
> +		    drm_core_check_feature(dev, DRIVER_CURSOR_HOTSPOT)	&&

Nit: you have a tab instead of an space before && but this can just be
fixed when applying.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

