Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A51C73FA90
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 12:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1702210E08C;
	Tue, 27 Jun 2023 10:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF20110E08C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 10:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687863281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zIrtd34fhQsM0JJS1CVGtChSrcZbhuxBt8Dka9V6tRE=;
 b=WmjRIkQ0mmtQGIlYDDz2Fp48siTWTnqX0xqF89DfIk4hFYwsxX7x5LpNI51HfcL+JQbmxS
 YwmgiRpKZdBBSXtP4764UD1VHhh+/piGGbMiv5S+Q6JGF16awqXd4LW4lQ5a8cR5kaVHwj
 6E2IEyfY5xd7KHpZHWXcd1Pvuv1/V4Q=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-bJaD2FslOmGsA-KnmeLJDg-1; Tue, 27 Jun 2023 06:54:40 -0400
X-MC-Unique: bJaD2FslOmGsA-KnmeLJDg-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b6a2a5f08aso17648961fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 03:54:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687863279; x=1690455279;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zIrtd34fhQsM0JJS1CVGtChSrcZbhuxBt8Dka9V6tRE=;
 b=eFiiQTVGLsXHvp1sJJE+jZB/EquyxYL8JP2KfxJ2AbYeJ6ThWHG7I2/xef9/9RXW5V
 jVK90h0l0SIBgaXoSvM5O4nxeEfcu7iO1th3fKX8bMZ1/h30ddzRGEh0bMW/x/2t3BK3
 QHSFn0jPXKz01jWcMSqmaS9S28GTasCTHS/M/8L+8oluJZ2xLASGuyh4uAQliRyng6Ap
 0r2Jm0ZLAd0s3pJpZImZfRVuXYjDUhQ/dbK/W1v9I8wDMkkJKdxz0yZzT3jOq5TzBwSE
 X3s58QIiN6OUa/rUoWzSr5bWXgOdpSQVem34gZndo0qN20rwNZvdxcy8jUUSaBLH3+Zm
 3TlQ==
X-Gm-Message-State: AC+VfDy+hPKJ+F0taX2tofaUfk/9DOQEccb1wrLfm5MIooNvK1lAVHSo
 h1hy11hxKx2G0hXvCau5brRHDwzPgmTqoV+YB8GAUk6QvAILjQn1YhAAi1S/08e6kSOmrDoxpE/
 HE4Ei6fBLu3hPZ8U7crI6CoJvrHFq
X-Received: by 2002:a05:6512:532:b0:4f8:770f:1b04 with SMTP id
 o18-20020a056512053200b004f8770f1b04mr14117763lfc.0.1687863279309; 
 Tue, 27 Jun 2023 03:54:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7dcM2u/BFBwcyVjjqICCzxRqbvBNQiSgXJMLuN+hUF1nF12aDE9Gc48PjhhJUyAqkNIXZ6lg==
X-Received: by 2002:a05:6512:532:b0:4f8:770f:1b04 with SMTP id
 o18-20020a056512053200b004f8770f1b04mr14117751lfc.0.1687863278976; 
 Tue, 27 Jun 2023 03:54:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c204900b003f93c450657sm10346588wmg.38.2023.06.27.03.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 03:54:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v3 2/8] drm/atomic: Add support for mouse hotspots
In-Reply-To: <20230627133057.1ae7d357@eldfell>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-3-zack@kde.org> <20230627112647.175ec323@eldfell>
 <87zg4l2shk.fsf@minerva.mail-host-address-is-not-set>
 <20230627133057.1ae7d357@eldfell>
Date: Tue, 27 Jun 2023 12:54:36 +0200
Message-ID: <87cz1h2n0z.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, banackm@vmware.com, krastevm@vmware.com,
 dri-devel@lists.freedesktop.org, iforbes@vmware.com, mombasawalam@vmware.com,
 Zack Rusin <zack@kde.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pekka Paalanen <ppaalanen@gmail.com> writes:

> On Tue, 27 Jun 2023 10:56:39 +0200
> Javier Martinez Canillas <javierm@redhat.com> wrote:
>

[...]

>> > Hi Zack,
>> >
>> > where is the UAPI documentation for these new properties? I mean
>> > something ending up in the HTML docs like what other properties have in
>> > e.g. https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#plane-composition-properties
>> >
>> > Otherwise looks fine to me. Could drm_plane_create_hotspot_properties()
>> > perhaps assert that the plane type is CURSOR?
>> >  
>> 
>> I thought the same when reviewing but then I noticed this function is only
>> called from __drm_universal_plane_init() if type is DRM_PLANE_TYPE_CURSOR.
>
> Right, so why bother checking for DRIVER_CURSOR_HOTSPOT either?
> Shouldn't the function be 'static' too, not exported, and not added to
> a header?
>

Agreed. It should either be a static helper function in drm_plane.c and
not an exported symbol (in which case the checks are superflous as you
said) or the function should not make assumptions about what was checked
by the callers.

I believe that the former would be better and only make it accessible to
drivers if that is found to be needed later.

>
> Thanks,
> pq

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

