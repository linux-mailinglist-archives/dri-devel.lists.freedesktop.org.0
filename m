Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9FF5757D9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 01:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D60010FA04;
	Thu, 14 Jul 2022 23:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB4C10FA04
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 23:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657839912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V3eV0HtQIeNgwSw4KYhB/lbHU6rdtwImxed2P/gkI6w=;
 b=b7GrAY1bxudQTeTRN2YoYJQn2W7LM6pl8dsYsu1DZsa1mY9MSImMjIg0shNc2+K/T7YKsz
 B6yqCdvzqYYW5gOL/yAbm0qXmiK53lmC6L+n8Z2VfVALr5qX0Fn44SHDghF24EXfROvCoG
 d6dSE01owBWB2d/Pt7WiZt6zYLgAiRs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-EXT0b6eoOD-RgkiQcF1Bkw-1; Thu, 14 Jul 2022 17:04:52 -0400
X-MC-Unique: EXT0b6eoOD-RgkiQcF1Bkw-1
Received: by mail-qt1-f198.google.com with SMTP id
 cf20-20020a05622a401400b0031ed2d3fcd6so1952899qtb.20
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 14:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=V3eV0HtQIeNgwSw4KYhB/lbHU6rdtwImxed2P/gkI6w=;
 b=ufOfYz2ZjuiMBCMvGpEZwFOHAUejJ4x6Ui6/OcKLGnbv+GXdEZgHiLb6VxmEJyWf3K
 ugMS9nWd5naoBDu/GWT1dhJ9idrWW2PiZUTGa3GYNFuvQa9zbdUBLGlZqTgadtRdA1I7
 /wd3+uArvKpat39Vd2rlsHfv1ck5V+Y7C/zIyqk8lftjXydmU76oAN2rowZNYvVqlviV
 XJTBKKOi5x4UcUfsLqJ7IuxCYKl24hAEr33seXzE0LqaCJP+no0oe3X6XgNQVehjVrC5
 vMVVwc9SHdaZMcyyvMJmfqPbFLWcg3ui/Og3gbNQYK8oMtUUxCcS1U4G8OU9OIOPmdPU
 jjOQ==
X-Gm-Message-State: AJIora8P2JQ8cBwxEA1PVH3T2yivNm5B8Ba4oJL9Ahf0YOfWREf1/Ee1
 XymVdit0uiTXi2m7sfnci9hV0+HD7V2AC2PYcy9/VtQfp9w3M+RbyJXJKeIqXTofeqoufrNX3+K
 6at04J31bitkewohBUhh3vSzvrRZJ
X-Received: by 2002:a05:622a:58d:b0:317:ca0d:91a5 with SMTP id
 c13-20020a05622a058d00b00317ca0d91a5mr9655873qtb.601.1657832692132; 
 Thu, 14 Jul 2022 14:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sbx+zK8/mPtD0D+YyNPAbK5LK8NiDtBFPc01KiEA2vmrSBhdBxGvlsaL94Yg7djHKtma5eHQ==
X-Received: by 2002:a05:622a:58d:b0:317:ca0d:91a5 with SMTP id
 c13-20020a05622a058d00b00317ca0d91a5mr9655836qtb.601.1657832691869; 
 Thu, 14 Jul 2022 14:04:51 -0700 (PDT)
Received: from [192.168.8.138] ([141.154.49.182])
 by smtp.gmail.com with ESMTPSA id
 k10-20020ac8474a000000b00304bc2acc25sm2306978qtp.6.2022.07.14.14.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 14:04:50 -0700 (PDT)
Message-ID: <e99fa5b8ff05cbfe9e8db8c551acfed86d23f69e.camel@redhat.com>
Subject: Re: [PATCH v2 05/29] drm/nouveau: Don't register backlight when
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
 <christian.koenig@amd.com>, "Pan,  Xinhui" <Xinhui.Pan@amd.com>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, Mark
 Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Thu, 14 Jul 2022 17:04:49 -0400
In-Reply-To: <20220712193910.439171-6-hdegoede@redhat.com>
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-6-hdegoede@redhat.com>
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

You also have permission to push this to drm-misc-whatever

On Tue, 2022-07-12 at 21:38 +0200, Hans de Goede wrote:
> Before this commit when we want userspace to use the acpi_video backlight
> device we register both the GPU's native backlight device and acpi_video's
> firmware acpi_video# backlight device. This relies on userspace preferring
> firmware type backlight devices over native ones.
> 
> Registering 2 backlight devices for a single display really is
> undesirable, don't register the GPU's native backlight device when
> another backlight device should be used.
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index a2141d3d9b1d..91c504c7b82c 100644
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
> @@ -405,6 +407,11 @@ nouveau_backlight_init(struct drm_connector *connector)
>                 goto fail_alloc;
>         }
>  
> +       if (!acpi_video_backlight_use_native()) {
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

