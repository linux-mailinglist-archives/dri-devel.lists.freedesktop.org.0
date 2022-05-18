Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FF252BFE2
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 19:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6435B10E79D;
	Wed, 18 May 2022 17:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B770210E79D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652893524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TRLEjcaMw89+h7bBWjlXiLnoDwDJpSdbFcWF9EAQdJc=;
 b=iNUmQIkRmsm1KR7VvjIoVxRedimexCmgzVhIvdB8YUrO6He+03T484L+OmP74ihaFE/sW0
 MHBEWW8vjSK1Hz8wsbgqNgQFelOc0WYx/zpAhXciCmNtLdzqKB/PiIlXo7Ihl7bggipQvE
 n3rk2cNSqerD3uZOEdJ6+IloPyLwGfg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-C4suQbFCMJGkMb2-6vxzMA-1; Wed, 18 May 2022 13:05:22 -0400
X-MC-Unique: C4suQbFCMJGkMb2-6vxzMA-1
Received: by mail-qt1-f197.google.com with SMTP id
 d15-20020ac85d8f000000b002f3b3b7e0adso2090797qtx.20
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 10:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=TRLEjcaMw89+h7bBWjlXiLnoDwDJpSdbFcWF9EAQdJc=;
 b=aHui5rOQltO3NidV7TVQNkdgJks2RylYPz3zUJC/FM35TvUNdsuezzCIozbYQ24PgT
 iFuRX1GdNNa11549Qh/VcivtcJfwPkaubAy4SPjoHDF4XFnbHabdd73NdKQph7w98vLS
 jsJ9tJi9HpAEV6biXcQP0Q9rixy9c+lsD7eD1w/saSBFWJEc14s16CfoILRlLP1vSYea
 JM7OpzVU3IxYHpfnNeM2z3I2lipf5OJ6D1wG69MrYgEShLcmpbwoNw4UkO6RvR/QUN6y
 GFfV2V/apskO2ZfISH1ft7wtsyABJk5/snJ7RrnmsPSzYuCszNxBZ0Svnd4/yO41mLnA
 yo6A==
X-Gm-Message-State: AOAM532yAlrF0KneVIncNHOL9Xzj9RKTSVkFZpGb/AcTdsJg0loG0cQE
 ycQH/mJo1WxP7HIyThDROaeIvv6rOqYYeL+34ZuT49uxUtWiaLl8sQ0JVs5nx6qgfNPC7upUrHL
 da1K0VFAqEW7us6gysuFuQkwqp+z9
X-Received: by 2002:a05:622a:13d2:b0:2f3:d2aa:7c5a with SMTP id
 p18-20020a05622a13d200b002f3d2aa7c5amr688813qtk.155.1652893522074; 
 Wed, 18 May 2022 10:05:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWXT+ucokDAqDDNsvHx45rk/kOMhw7MyDKCGHWLD4jc69TnlXtDtdyumDrgdXUe4O3YCGvOQ==
X-Received: by 2002:a05:622a:13d2:b0:2f3:d2aa:7c5a with SMTP id
 p18-20020a05622a13d200b002f3d2aa7c5amr688757qtk.155.1652893521745; 
 Wed, 18 May 2022 10:05:21 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 u24-20020a05622a199800b002f3ce9c0601sm1719763qtc.3.2022.05.18.10.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 May 2022 10:05:21 -0700 (PDT)
Message-ID: <e67e2a183d40181420a3536b0a400161357aaee6.camel@redhat.com>
Subject: Re: [PATCH 05/14] drm/nouveau: Don't register backlight when
 another backlight should be used
From: Lyude Paul <lyude@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Xinhui
 <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Mark Gross
 <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Wed, 18 May 2022 13:05:19 -0400
In-Reply-To: <20220517152331.16217-6-hdegoede@redhat.com>
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <20220517152331.16217-6-hdegoede@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Also, ack on this being pushed to drm-misc, along with any other patches I r-b

On Tue, 2022-05-17 at 17:23 +0200, Hans de Goede wrote:
> Before this commit when we want userspace to use the acpi_video backlight
> device we register both the GPU's native backlight device and acpi_video's
> firmware acpi_video# backlight device. This relies on userspace preferring
> firmware type backlight devices over native ones.
> 
> Registering 2 backlight devices for a single display really is
> undesirable, don't register the GPU's native backlight device when
> another backlight device should be used.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index daf9f87477ba..f56ff797c78c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -34,6 +34,8 @@
>  #include <linux/backlight.h>
>  #include <linux/idr.h>
>  
> +#include <acpi/video.h>
> +
>  #include "nouveau_drv.h"
>  #include "nouveau_reg.h"
>  #include "nouveau_encoder.h"
> @@ -404,6 +406,11 @@ nouveau_backlight_init(struct drm_connector *connector)
>                 goto fail_alloc;
>         }
>  
> +       if (acpi_video_get_backlight_type(true) != acpi_backlight_native) {
> +               NV_INFO(drm, "Skipping nv_backlight registration\n");
> +               goto fail_alloc;
> +       }
> +
>         if (!nouveau_get_backlight_name(backlight_name, bl)) {
>                 NV_ERROR(drm, "Failed to retrieve a unique name for the
> backlight interface\n");
>                 goto fail_alloc;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

