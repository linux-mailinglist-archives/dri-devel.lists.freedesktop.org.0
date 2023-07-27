Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E2765590
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E776B10E590;
	Thu, 27 Jul 2023 14:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7235510E590
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690466883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2WLo0so7vSQCz5mSuOt/gGcMJDALTX0TGumAYHbwwbM=;
 b=WVD16MAc3H9/p8mjGub04jQiZ7I9mFybAUOddSKB7A5sgtkCN1yqt6GV+X7q+V2UrAaG1R
 AFHFJ8gric5DtdJztnd6vqSMS6saLg6OVmOtm3BcNh+0JQP2BJHCL/iqMG/4rstu+nORVw
 D8cUKF8F+rJ+qddUkGtaDnaiwLxOPwk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-XcX2EvC3OHScaz4MlHmjVg-1; Thu, 27 Jul 2023 10:08:02 -0400
X-MC-Unique: XcX2EvC3OHScaz4MlHmjVg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f5df65f9f4so5462795e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 07:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690466881; x=1691071681;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2WLo0so7vSQCz5mSuOt/gGcMJDALTX0TGumAYHbwwbM=;
 b=Dfg8DH/cyOp2oYPkp5TXQQEsFLDeTdQVXftsdEo6/NZtLRRWSoHZxwKkACi2Gy7QLG
 +rUAjKaDHYaLkXrI1flRD8znV+6OrLokzsH/uH3LQYr7jshPtmrWxeGPC1eddR5cjTZy
 SBgyEurCLYIK4cAx+2u6G2G90sQtPwVlAVjHHx11rr1ggzavPogC3YjYOu7ieoSjALfU
 5iLzo9l71+n/A4uf/uheo/VUH6cm3SPXjoBhTCiy56nKVoyU1HAhiRZjjzlkS60dkwey
 vOky5hlJPjms2i0HuflFD4IT5/+P7vRDbiOP3nFuEXj1605WopmGiwWpQdUhTkzFWqQu
 UX0w==
X-Gm-Message-State: ABy/qLaU0RlSHXzMc1spHKBa73/n6lonh7lA2/3QxEoNsIZouZEAk8R1
 uBZgAMF1GKfxL23JJ8hc4PcvZCy9iFxQMei7dusqk9aLbE89kisiMFt+sv9LNLwo1DteGOzs+zC
 wP34n6StkcCuPLNSaMn0Han5BA799
X-Received: by 2002:a7b:c045:0:b0:3fd:2e89:31e2 with SMTP id
 u5-20020a7bc045000000b003fd2e8931e2mr1692232wmc.17.1690466881143; 
 Thu, 27 Jul 2023 07:08:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEV4jneiKEDe4OaGdTfTAZLv22Oiu/PKHqjOR7jaehWNQxZnNwS/CxlRa0KaMfxPmaLk2kZkg==
X-Received: by 2002:a7b:c045:0:b0:3fd:2e89:31e2 with SMTP id
 u5-20020a7bc045000000b003fd2e8931e2mr1692218wmc.17.1690466880849; 
 Thu, 27 Jul 2023 07:08:00 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k3-20020a05600c0b4300b003fc015ae1e1sm1961597wmr.3.2023.07.27.07.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 07:08:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/ssd130x: drop DRM_GEM_SHADOW_PLANE_FUNCS override
In-Reply-To: <20230727122412.2464210-1-arnd@kernel.org>
References: <20230727122412.2464210-1-arnd@kernel.org>
Date: Thu, 27 Jul 2023 16:07:59 +0200
Message-ID: <874jlpv45c.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

Thanks a lot for your patch.

> From: Arnd Bergmann <arnd@arndb.de>
>
> It is not possible for ssd130x_primary_plane_funcs to use both
> its own reset/duplicate/destroy callbacks and the ones from
> DRM_GEM_SHADOW_PLANE_FUNCS:
>
> In file included from drivers/gpu/drm/solomon/ssd130x.c:29:
> include/drm/drm_gem_atomic_helper.h:100:18: error: initialized field overwritten [-Werror=override-init]
>   100 |         .reset = drm_gem_reset_shadow_plane, \
>   101 |         .atomic_duplicate_state = drm_gem_duplicate_shadow_plane_state, \
>   102 |         .atomic_destroy_state = drm_gem_destroy_shadow_plane_state
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/solomon/ssd130x.c:744:9: note: in expansion of macro 'DRM_GEM_SHADOW_PLANE_FUNCS'
>   744 |         DRM_GEM_SHADOW_PLANE_FUNCS,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>

Gah, I missed that. I wonder how this compile warning doesn't show up for me.

> Since the custom callbacks were just added, I assume these are the
> ones it is meant to use, so remvoe the generic overrides.
>
> Fixes: 45b58669e532b ("drm/ssd130x: Allocate buffer in the plane's .atomic_check() callback")

Unfortunately that's not enough, because the plane atomic state handlers
that were introduced in that commit are broken so removing the macro will
regress the driver.

I've posted a patch that drops the macro but also fixes the handlers for
the driver to work with the custom callbacks:

https://lists.freedesktop.org/archives/dri-devel/2023-July/415897.html

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

