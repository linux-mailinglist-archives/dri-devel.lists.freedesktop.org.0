Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2472576812A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 21:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7972410E20D;
	Sat, 29 Jul 2023 19:03:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4098410E20D
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690657404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D4vJLtxA0NJ6jmpOzvbHQQV+REY8fMJYYEufaXg/T5s=;
 b=US2CPBM1h2z/29UxGACtSx/XkTYvYv8O5T9lAB3d9CpD8Cpj/T56dqn3dqwxsPYnmL4Y/b
 +fBdm/C3uz9Vf4u2etMTf3Ox/kg5nH6K6JKof3/ThrCijdXQj7X+M2GilbiJxt37RDZVIu
 z8POMu0e/YFOoKmKA7T4fZ+Yfi044Mc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-m3VOvMr_Ms2j6jCHUZy0iQ-1; Sat, 29 Jul 2023 15:03:20 -0400
X-MC-Unique: m3VOvMr_Ms2j6jCHUZy0iQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3fbb0c01e71so16977295e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 12:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690657399; x=1691262199;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D4vJLtxA0NJ6jmpOzvbHQQV+REY8fMJYYEufaXg/T5s=;
 b=WyV0uzpZ3oH+9zTozxHwt0RlavWXl6elOeJ6iX6szbf2KD2cBue7ZDWQobCyD8Cvb1
 HKalyXqC/hACHV5SnuP+lG+f1WA80nfWsPme9D6UUu6Kf3tqUXXY0AUIEp+kUbFjO0t9
 ZnkAvvdeEFDRErPYAkgzG6qPFaTN55lUj5M2cWWUb98gkxbpv5wjYZkETTgF6VOF+/2l
 01TGM/SD5+nPgUZ6Z2eWMm1yBhChY4w+WEug4oFx8PnYzfMewzDgJOiWRhKC68YJTUns
 kL7Nbjrggqb7gzcUr2WIjDNeG2duIXIRSqfn5yY32dfv2j+/kAKgZLITdCaaABKDsrv8
 sj6w==
X-Gm-Message-State: ABy/qLboNAGS99e87ezNfGU2BnwkpXW3uDHbaLlBrwfWEwHrVdQsD6bd
 B/DbHcfxounNM1Wb89gqst7sxbxlMv82jfdqLixbA835JVIA15CxJ11F6eliYksqnryIFbj6mDP
 6Zp8Zwcm1RR/TKqSNeMYLiIYY1Wc7
X-Received: by 2002:a05:600c:2a54:b0:3f9:9a93:217f with SMTP id
 x20-20020a05600c2a5400b003f99a93217fmr4166337wme.3.1690657399714; 
 Sat, 29 Jul 2023 12:03:19 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE4j4cqRhKHgoyMzZ0DICM7GYDzVHXr2bMe2AOaf5Psg0v0TZ4tGPj/VEPHCKc30BemZrFmpQ==
X-Received: by 2002:a05:600c:2a54:b0:3f9:9a93:217f with SMTP id
 x20-20020a05600c2a5400b003f99a93217fmr4166326wme.3.1690657399407; 
 Sat, 29 Jul 2023 12:03:19 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 19-20020a05600c229300b003fa95890484sm7124789wmf.20.2023.07.29.12.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 12:03:19 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Dave Airlie
 <airlied@redhat.com>, Sean Paul <sean@poorly.run>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm/udl: Convert to drm_crtc_helper_atomic_check()
In-Reply-To: <dcb09c0c7bed1baee39a72caba098a399ce7f063.1689599767.git.geert+renesas@glider.be>
References: <dcb09c0c7bed1baee39a72caba098a399ce7f063.1689599767.git.geert+renesas@glider.be>
Date: Sat, 29 Jul 2023 21:03:18 +0200
Message-ID: <87a5vey1zd.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert+renesas@glider.be> writes:

> Use the drm_crtc_helper_atomic_check() helper instead of open-coding the
> same operation.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

