Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845C076395C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 16:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8722C10E484;
	Wed, 26 Jul 2023 14:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116BD10E484
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 14:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690382359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+hJ4X5tXzpgqm5zrMMPo7T0DqV+ewqF/OMUcgOVIHXI=;
 b=gUQ36BNDgHkywqTykwQ8h5vm0QMVj8sk9DRbZu7kfCAUWrYnH666CQsTjvcHkfGTHMxu81
 9wmErqKjNdQKFw+g2eM4d5jhorIoyXd+M+ZEbzKjcQ7RZP5FqdJZ6+1mEoyqxHCKN3xwxn
 FC9EZZ5mu18ydKJcWeRZ8xEH5KFt7xg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-QeyZ7xojOhqpCe6EG3KMLA-1; Wed, 26 Jul 2023 10:39:14 -0400
X-MC-Unique: QeyZ7xojOhqpCe6EG3KMLA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fd2d33fd93so27000755e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 07:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690382352; x=1690987152;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+hJ4X5tXzpgqm5zrMMPo7T0DqV+ewqF/OMUcgOVIHXI=;
 b=TJFeW2Oyfh25A5OQtN6rHDmzo5aja4lZaKaKi8PLUS3cpyLkCgVB+tTZ6m2x1sS4Ub
 vRh/M6OLAdbWkj1TsXlKKeJxxOQd2HUqePbHDaAHpvqIlqO/hKTxgfs8psp6YG33NqJO
 SZfeS+r6FLnabImGE1HfF4NG5N5NIUyUSVAtLls3p+64sB561yAcqDAr1pRrrX5c+GVA
 vooJjv6us6io8xkJFYV2lR2AlS/kMJ+masiKcUFAt11Jd1wMalZx282aVM3rstSWV/KD
 ApTAi7mJbrdXmd6tfasFrO4B0pI960xsuBa37X7Wbs8fUjADN/4k9uVQ9e2YCS/OtT2y
 V1UA==
X-Gm-Message-State: ABy/qLZfH6bVPWRmsgjoijshBJBGqFiWRj2Vnp3Mu1UeNwaNmuFG1hFd
 eAHftjp8dazmIzqMENElEkAc/wAcRuhIsmYNBjP45dblKk0/RgebNLvPzWRTSQE0sGVnvixTZJI
 EBowgqi5GgGCVG+5nc/8q92jNPZBK
X-Received: by 2002:a05:600c:2053:b0:3fb:b2c0:fcec with SMTP id
 p19-20020a05600c205300b003fbb2c0fcecmr1629753wmg.24.1690382352780; 
 Wed, 26 Jul 2023 07:39:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE6E1rZwubPg+oeFHipdkapvGzS/9I+KS1V3vVd0VaboFbD1hvdWcCF63EI8Mqn4lM80eI4Kw==
X-Received: by 2002:a05:600c:2053:b0:3fb:b2c0:fcec with SMTP id
 p19-20020a05600c205300b003fbb2c0fcecmr1629738wmg.24.1690382352559; 
 Wed, 26 Jul 2023 07:39:12 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l13-20020a1ced0d000000b003fba2734f1esm2200070wmh.1.2023.07.26.07.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 07:39:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] drm/ssd130x: Allocate buffer in the plane's
 .atomic_check() callback
In-Reply-To: <20230726105433.389740-2-javierm@redhat.com>
References: <20230726105433.389740-1-javierm@redhat.com>
 <20230726105433.389740-2-javierm@redhat.com>
Date: Wed, 26 Jul 2023 16:39:11 +0200
Message-ID: <877cqm4u0g.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

> Drivers are not allowed to fail after drm_atomic_helper_swap_state() has
> been called and the new atomic state is stored into the current sw state.
>
> Since the struct ssd130x_device .data_array is allocated in the encoder's
> .atomic_enable callback, the operation can fail and this is after the new
> state has been stored. So it can break an atomic mode settings assumption.
>
> Fix this by having custom helpers to allocate, duplicate and destroy the
> plane state, that will take care of allocating and freeing these buffers.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

