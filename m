Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A6C4EE9B1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 10:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC48A1120D9;
	Fri,  1 Apr 2022 08:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A961120D9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 08:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648801430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+tAviGUF0V5j/Qt6zb7Aru7+QSlJea9O/L+KzCivGbc=;
 b=X1YvSFf2g83aHqAWLAwyEVk2nktISn/FH07lu+iizmKytyhDurkR8iE0SOt5XpqCcFi5Ip
 nTdVnDV9VwVvjMpU5gwWUysOJ+ypmRVZWgmTltJGOv8vJ1zfWEcm9Sxr8N4ZO9Kz7p7CVy
 1+L4qDlee+0t8/Zs3Maqz1c7ou+ku0M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-ExbdOwqQPImadEyh0NmniA-1; Fri, 01 Apr 2022 04:23:50 -0400
X-MC-Unique: ExbdOwqQPImadEyh0NmniA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o10-20020a1c4d0a000000b0038c6e5fcbaeso865384wmh.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 01:23:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+tAviGUF0V5j/Qt6zb7Aru7+QSlJea9O/L+KzCivGbc=;
 b=MBnF07z4eafZGwkG+JDlOtZEoVZf00WaTbIXQyoKPp/9snYil/xKy51p7XtPI5EIBP
 HoG36U3E1LGS1MgN7bx0WbYdW8KIl3ztF7ILbBZeoujkNhZdBIcBgPjhllD0sceN4gTx
 RpgwaVi/eILaTAgRMYQ3YMIxN7sqDbIyczp0e4WLXVf5v6q5Ey6N3mZAZYFOP9qqY9ig
 aBFygSXxOs5U01Uwkr1OyGjBNFu5mlKM+apYm36YoxP62yt6hF/+TdUtkl/Qw74DqgNM
 WfRG9dlC6cPSktSep3WH+X3kweUK7zGaVrX7o6u6WYW3wBHmSuB38iu+BTQeN8Y9IYGc
 KYeg==
X-Gm-Message-State: AOAM532O/sbSZitEmSWI+RbBxIZwPz3Yb9QxIcFz+tXJEuNaJJ9laZQp
 7zPI3LE3xVkgtAjsGFFzale4uW/0aUWkOby/yUQJYzX6ZMxjW88Npx9kB0wffnzJLcw0pcqbhX1
 4p1+rNGGeyRIRpq/cvOkoofRM5sV2
X-Received: by 2002:a7b:c08b:0:b0:38c:ea9e:51c0 with SMTP id
 r11-20020a7bc08b000000b0038cea9e51c0mr7730535wmh.87.1648801428690; 
 Fri, 01 Apr 2022 01:23:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxXxlT650onwreSpGmzH0kEI8aeC8ZdovEN+VnAHdIo/XkNIEAsHiemIAzcxNbKSU6ZhQrog==
X-Received: by 2002:a7b:c08b:0:b0:38c:ea9e:51c0 with SMTP id
 r11-20020a7bc08b000000b0038cea9e51c0mr7730516wmh.87.1648801428416; 
 Fri, 01 Apr 2022 01:23:48 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d47ca000000b00203fb25165esm1763312wrc.6.2022.04.01.01.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 01:23:48 -0700 (PDT)
Message-ID: <44388bac-967c-ff5e-3a90-716f95073d4f@redhat.com>
Date: Fri, 1 Apr 2022 10:23:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/8] drm/display: Move HDCP helpers into display-helper
 module
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-7-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220322192743.14414-7-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/22/22 20:27, Thomas Zimmermann wrote:
> Move DRM's HDCP helper library into the display/ subdirectory and add
> it to DRM's display helpers. Split the header file into core and helpers.
> Update all affected drivers. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

After fixing Jani's comment about the drm_hdcp_helper_helper.h typo:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[snip]

> diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/display/drm_hdcp_helper.c
> similarity index 99%
> rename from drivers/gpu/drm/drm_hdcp.c
> rename to drivers/gpu/drm/display/drm_hdcp_helper.c
> index ca9b8f697202..0ebdfe7fef8f 100644
> --- a/drivers/gpu/drm/drm_hdcp.c
> +++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
> @@ -13,7 +13,7 @@
>  #include <linux/slab.h>
>  #include <linux/firmware.h>
>  
> -#include <drm/drm_hdcp.h>
> +#include <drm/display/drm_hdcp_helper.h>
>  #include <drm/drm_sysfs.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_device.h>
> @@ -21,7 +21,7 @@
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_connector.h>
>  
> -#include "drm_internal.h"
> +#include "../drm_internal.h"
>  

As far as I can tell drivers/gpu/drm/drm_hdcp.c doesn't use any of the symbols
declared in "drm_internal.h" and this inclusion could just be removed.

If you agree and add a preparatory patch in v2, feel free to also add my R-B.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

