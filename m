Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B238D307C
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 10:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C36E10E123;
	Wed, 29 May 2024 08:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L4HMLEMO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202D610E123
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1716970440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uA6xkDpBDBv0Pede4O9Bhc1jEnUuZpOgNchQ5M2rx9I=;
 b=L4HMLEMO+xl41GgEC4dBM1sfr6Xun6OiaPYlGVbHVGlPe07NVy76T7pV/qy080Xe2ugeOY
 SaGmDfiEJzJNzy0toDYYWEPWWjEv2OCOFn/pL4tzUrbvUKEjrxAe1ZbyUE+JyosqKgsew7
 57Q23ppoQcxabojISOR0Yj+0wQh3ogo=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-d-7gnnqZN0ia2Y8ZfJsx-g-1; Wed, 29 May 2024 04:13:58 -0400
X-MC-Unique: d-7gnnqZN0ia2Y8ZfJsx-g-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-529a8c727d3so1643756e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 01:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716970437; x=1717575237;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uA6xkDpBDBv0Pede4O9Bhc1jEnUuZpOgNchQ5M2rx9I=;
 b=wlYvBpxQoHDKjnbur7inedJbEfZVNK96RHt4PvlfrXgTBR3q6LH1j8+66zOuAPlyC2
 EJxDuvUDV3TU7K7SNYyDfOLB6kBkqMPZ0Mc2wW7m/pFegqdjhEPhrOgMr5cSLSmXPD5A
 WogkPTMfEvia99zzSSJ3m0RXGBFob/5eY7f1H8DLsjP5sQOLaGakHYkdaizUqSMJOFKI
 Js98jOHpeNMGko4oV3R1LxoTO8JifvYu2XJ0Wgk0YN3YryLdjodmoGCRBJuIzFC4q3B3
 jRMx3ekMBBIh3nz8s430BMSsqgdWjdBhZjsVRS+XKzwnrI8xN0GJfQAetoixXSmdqfQ+
 e0lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkBBfTeGFnRghrt6hpoksAcpoakMeEuAVsApYyvgxK5JQuUvte0UK/5SqdPusrzIfv/ePT4bxQ3V1WOzR07QzSpmNMF6PlOO5d53Db+2Sj
X-Gm-Message-State: AOJu0Yw6j7feBrbJfFYPTfY7nDw2usLdFg3GzCSnyCpk33NHp5lPfrgi
 msSfXKeGzR0U1la9mtFz1Ikrrr+Fuse/BmpESKSDYfdSaTnxw+wmsamdJZKBmrhs0l256radBb9
 mqVaP7eKPZlcm0NO7WhAmPT1EgNdcmALoph+0Aj24jOFcY/6wZez6d6BPLL+IO8Ag/A==
X-Received: by 2002:a05:6512:3ca0:b0:51d:1d42:3eef with SMTP id
 2adb3069b0e04-52965b39a01mr17153684e87.29.1716970436736; 
 Wed, 29 May 2024 01:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF91LhbQ4xNYnr9pEFoIbT00oSKdkKO+oULgmQYLO/NGeumTW/UalTZfnHhy8glLfcustu7kA==
X-Received: by 2002:a05:6512:3ca0:b0:51d:1d42:3eef with SMTP id
 2adb3069b0e04-52965b39a01mr17153660e87.29.1716970436208; 
 Wed, 29 May 2024 01:13:56 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4210145cbb5sm205151015e9.30.2024.05.29.01.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 01:13:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH] drm/display: Fix HDMI state helper dependency
In-Reply-To: <20240529080013.2325748-1-mripard@kernel.org>
References: <20240529080013.2325748-1-mripard@kernel.org>
Date: Wed, 29 May 2024 10:13:55 +0200
Message-ID: <87plt511do.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> During the life of the series that introduced the
> DRM_DISPLAY_HDMI_STATE_HELPER option, we reworked the Kconfig option
> dependency setup to rely on depends on with commit f6d2dc03fa85 ("drm:
> Switch DRM_DISPLAY_HDMI_HELPER to depends on") which got reverted later
> on because it was creating too many issues by commit d7c128cb775e
> ("Revert "drm: Switch DRM_DISPLAY_HDMI_HELPER to depends on"").
>
> However, since the series was out of tree at that time,
> DRM_DISPLAY_HDMI_STATE_HELPER wasn't properly updated to take the revert
> into account and is now creating build issues.
>
> Let's switch the depends on to a select to fix this.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405290332.Sqtt0ix0-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202405290438.TOYhXMIn-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202405290803.c3178DYT-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202405291109.PQdqc46g-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202405291221.a0NStxHE-lkp@intel.com/
> Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

