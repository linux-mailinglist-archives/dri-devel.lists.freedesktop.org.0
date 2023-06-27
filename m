Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C04173F7E7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B570910E1C0;
	Tue, 27 Jun 2023 08:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B2710E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687856206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AdnC3/J6G+Ruo92pDJ/hmK7q+0m3PiokppPgZ13dt5M=;
 b=JOUOj3WVJMHbpqj81ew2r8SVUzVH0gXwpE7SRzSsablh1IjJ0l7mwAQOV8geYUfItiFdZD
 CK/9iIj85CFKPO9V7VmCY+POpegfiHgPfyuvEBNv72eaR5c/IemKxW6tQj4y/Y3blIVxcs
 F9/lNkHpKLpo9Na3kbj4FpI2RAi+mr4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-oq3mqtdGOQ-lqJY39AOsKA-1; Tue, 27 Jun 2023 04:56:44 -0400
X-MC-Unique: oq3mqtdGOQ-lqJY39AOsKA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso18569685e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 01:56:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687856203; x=1690448203;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AdnC3/J6G+Ruo92pDJ/hmK7q+0m3PiokppPgZ13dt5M=;
 b=HEEcR0v+qCNviLjx3QZOT4k9L2XFP0MgU1gsrZpbEOvF5uQ0iyNH3sYJRnkjt4VG2B
 Vj34IU/L1bptGcixnFqC/4KBvGaV6NncUZHSY4aCPyWqi5c7hqgtJAnnIm5LvER20iOt
 5I4FGupJQ2sXvK8JGr/0OnVK9p/Vc9d7mP+Nv5wwgMpH/UBNtyq6Bo36CA27+Bh/QTwc
 lB+jxU823vY6T6MjmDg2mOQ1ftMYDekhGHNBKt+Tbvx+Sc06aA4L04YrryQZHJHuKcT5
 ktmqs52gMbfNFY+b3J0P5B4CBzbvV4fjO101p9+3vbswos66ag14OdPzAIH8FjYCwQ4J
 5Ztw==
X-Gm-Message-State: AC+VfDwioEJA3oReGw2Jdue2SzuPLui8/PCg8+OxKbXaVC0oS4GTPbjf
 olcrXGPkW9kYZsNnnl/NjWFaIojMbvPWO3BmH1Vtus/UhGwF2rMTDdeB0ZG+y8wkHVmDacAX5GW
 62kIcurgmodwO7fNtlu6R1hBnPhSm
X-Received: by 2002:a7b:c5d7:0:b0:3fa:8b0b:43e3 with SMTP id
 n23-20020a7bc5d7000000b003fa8b0b43e3mr4721969wmk.41.1687856203567; 
 Tue, 27 Jun 2023 01:56:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5s5BBwoKaElGMVZ/F48Z269vMWQzTXqhD8cbRpXIwCBXNkjnFfHywd5xFYcLZ92lyR2jIGYQ==
X-Received: by 2002:a7b:c5d7:0:b0:3fa:8b0b:43e3 with SMTP id
 n23-20020a7bc5d7000000b003fa8b0b43e3mr4721956wmk.41.1687856203273; 
 Tue, 27 Jun 2023 01:56:43 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i6-20020adffc06000000b00313e421c620sm8925456wrr.54.2023.06.27.01.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:56:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>, Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v3 2/8] drm/atomic: Add support for mouse hotspots
In-Reply-To: <20230627112647.175ec323@eldfell>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-3-zack@kde.org> <20230627112647.175ec323@eldfell>
Date: Tue, 27 Jun 2023 10:56:39 +0200
Message-ID: <87zg4l2shk.fsf@minerva.mail-host-address-is-not-set>
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
 dri-devel@lists.freedesktop.org, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pekka Paalanen <ppaalanen@gmail.com> writes:

> On Mon, 26 Jun 2023 23:58:33 -0400
> Zack Rusin <zack@kde.org> wrote:
>
>> From: Zack Rusin <zackr@vmware.com>
>> 
>> Atomic modesetting code lacked support for specifying mouse cursor
>> hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for setting
>> the hotspot but the functionality was not implemented in the new atomic
>> paths.
>> 
>> Due to the lack of hotspots in the atomic paths userspace compositors
>> completely disable atomic modesetting for drivers that require it (i.e.
>> all paravirtualized drivers).
>> 
>> This change adds hotspot properties to the atomic codepaths throughtout
>> the DRM core and will allow enabling atomic modesetting for virtualized
>> drivers in the userspace.
>> 
>> Signed-off-by: Zack Rusin <zackr@vmware.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> ---
>>  drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++++
>>  drivers/gpu/drm/drm_atomic_uapi.c         | 20 +++++++++
>>  drivers/gpu/drm/drm_plane.c               | 51 +++++++++++++++++++++++
>>  include/drm/drm_plane.h                   | 15 +++++++
>>  4 files changed, 100 insertions(+)
>
> Hi Zack,
>
> where is the UAPI documentation for these new properties? I mean
> something ending up in the HTML docs like what other properties have in
> e.g. https://www.kernel.org/doc/html/latest/gpu/drm-kms.html#plane-composition-properties
>
> Otherwise looks fine to me. Could drm_plane_create_hotspot_properties()
> perhaps assert that the plane type is CURSOR?
>

I thought the same when reviewing but then I noticed this function is only
called from __drm_universal_plane_init() if type is DRM_PLANE_TYPE_CURSOR.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

