Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A60C759DF9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 20:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD1110E4F1;
	Wed, 19 Jul 2023 18:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5367310E4F1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 18:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689793011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FslhBD4l5T2qkRClAbGtLS/oR8F6Mx0QNWHGPPx2ZXc=;
 b=Ea9YwJpGpKst/zClR9iYWS+F73l7VcOKYedMHWuglmaQKMJdvvbRKOuTT/n9pbwSN9K6wk
 j3mypXlTFf78bh7KQbWWTZ3oGnr4g5VblgnsyGe8KFyU5ha3o9bYOd2oTW2rG6evaSuRDW
 hVdttayDeP75m/sHaVYhKoqsI9jfCsw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-Onm9CRbLPfaRTP-46mxG5w-1; Wed, 19 Jul 2023 14:56:50 -0400
X-MC-Unique: Onm9CRbLPfaRTP-46mxG5w-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-315a03cae87so488615f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 11:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689793009; x=1690397809;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FslhBD4l5T2qkRClAbGtLS/oR8F6Mx0QNWHGPPx2ZXc=;
 b=jiCfzTF6mQCwRoapQ0+i1VAisWXVkD3SnvtcVCRjh94HIm7GiC0MsCcoZJadF1VGWM
 yy6JkAkQWbsUfgkoP0IkU2HslCwse3CyqMyM6W4jFkZTFisL89yeS++I8r24VEyE+8Pb
 QfiR3RoQGGJI2FvUpoDxoWWphUwFHKQfEMIUHrY3RsBXXcK8Uu+UhxQgj5PbexRc8IpL
 we314MWu8LlmS7BDHcPZH9IMq2agd/FebUdjjIW5vhGG76DUEJqi+VX1SPab+JW3BkjF
 0TGBjb+oHJmN0VWfLAcQOXJv2WfVkMuy6QEX9cO4QcldbAc28EnxxizYpaxhXisu640D
 OT4A==
X-Gm-Message-State: ABy/qLYE5hEo1jDeh6wfyDnmPUUGibTevjRlmwRVBl3KiWAWRbgduDp9
 mbdXFJUKBLpCtT7GTTeXo4dndA5ROhsC0a5O5VBCZtsiZOPa11bVJPNL/JCY60aOyPx42Mjf0UF
 42SBTslFkp3ryECV6Ot+f7dWLfUG8
X-Received: by 2002:a05:6000:1813:b0:30f:c050:88dd with SMTP id
 m19-20020a056000181300b0030fc05088ddmr735919wrh.8.1689793009136; 
 Wed, 19 Jul 2023 11:56:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGhFBq0y3+l95btRu979XI6LgGj62Asu0X0co6wuTkKKmz+b9NDsz2UvdgOLASIra+8Cr9Esw==
X-Received: by 2002:a05:6000:1813:b0:30f:c050:88dd with SMTP id
 m19-20020a056000181300b0030fc05088ddmr735909wrh.8.1689793008883; 
 Wed, 19 Jul 2023 11:56:48 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k8-20020a7bc408000000b003fc01189b0dsm2321805wmi.42.2023.07.19.11.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 11:56:48 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
Subject: Re: [PATCH 04/11] drm/tests: probe-helper: Remove call to
 drm_kunit_helper_free_device()
In-Reply-To: <20230710-kms-kunit-actions-rework-v1-4-722c58d72c72@kernel.org>
References: <20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org>
 <20230710-kms-kunit-actions-rework-v1-4-722c58d72c72@kernel.org>
Date: Wed, 19 Jul 2023 20:56:48 +0200
Message-ID: <87sf9jhgr3.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

> Calling drm_kunit_helper_free_device() to clean up the resources
> allocated by drm_kunit_helper_alloc_device() is now optional and not
> needed in most cases.
>
> Remove it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---

I wonder if makes sense to just squash 2-3 and this one as a single patch.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

