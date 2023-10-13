Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBA57C8C27
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 19:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E02210E044;
	Fri, 13 Oct 2023 17:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881A610E044
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697217383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S6qAY1noOCEw65hmURuRKhrSwc0+16tXTERnI7Z29lQ=;
 b=KhKjX3o6okz+djL+0gmbae4zGe2Mrn1NYhb8OL1kBVkeTNL59jUsP3vD2n8zQuP9nHWZEy
 +1WYZM19jmJ1G8uOwazpe/Kw0njoylD5LYoE6vjSrW6UGoNZ1xNGB9zYmu0DHItmuJBT6w
 7HQJfHRJ5Y/QsYGEaeRjcwXP9Y/6gFI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-yDpNPdw5MOu2QUmZXuIkQQ-1; Fri, 13 Oct 2023 13:16:22 -0400
X-MC-Unique: yDpNPdw5MOu2QUmZXuIkQQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3247f646affso1092317f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 10:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697217381; x=1697822181;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S6qAY1noOCEw65hmURuRKhrSwc0+16tXTERnI7Z29lQ=;
 b=sYwuwceOrqLr2Gvv5+veOzP36nu7QV1w0zOkaeXvGsizLk4dUBiiDNMiOy6FwxSaT8
 9oZBezQULDSMLmV0Ir1NSCqfafku0gOCbyS0jkWDyG7WtJuodH6+dfg6O9nannsO9dBy
 Ls0DayJpVVXs1QroQ+h/8o5iz52pAkDWvXFqhcGmg/zudygv9hjVkXymbbmNbFhb7tPD
 9TpjzG0ePX9tkUcMKcw8PtsP0iQNL3gv/LqDzW13vZ5Wnv3DUYsYL/0L/6J1G4WgXFuC
 TpMXfb8T/i4D7dVEGkM4OGYD4JP3sMPnKtJt4CS6gZ2HjGitspwoxGZAwwL6GkNJoupz
 Aigg==
X-Gm-Message-State: AOJu0Yyig6IyljOO0SV8vIvKtGziOR0xojYOujdLNAU7NZBVpgPkERAO
 oArScQvOpYDt3C3JsTrkA0ri6LUiEn4dRtkWKmo/Ffoa00ufZ15fqV86jvUgfbZaZDfx+fVAwBa
 HKriyaMo3TfJjLxm6s7LL0nDlA2jR
X-Received: by 2002:adf:cc10:0:b0:32d:8373:f1e0 with SMTP id
 x16-20020adfcc10000000b0032d8373f1e0mr553592wrh.19.1697217381022; 
 Fri, 13 Oct 2023 10:16:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNaBvMWIFZNIS3sqaD8QxntmHU3JJw7iUBrONUezS8MBXqak8gRi9yGIh4BGX8HAKBTpUk8w==
X-Received: by 2002:adf:cc10:0:b0:32d:8373:f1e0 with SMTP id
 x16-20020adfcc10000000b0032d8373f1e0mr553581wrh.19.1697217380676; 
 Fri, 13 Oct 2023 10:16:20 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c14-20020adfed8e000000b00317b0155502sm21087582wro.8.2023.10.13.10.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 10:16:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v5 6/7] drm/ssd130x: Fix atomic_check for disabled planes
In-Reply-To: <20231009141018.11291-7-tzimmermann@suse.de>
References: <20231009141018.11291-1-tzimmermann@suse.de>
 <20231009141018.11291-7-tzimmermann@suse.de>
Date: Fri, 13 Oct 2023 19:16:19 +0200
Message-ID: <87wmvq30kc.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> The plane's atomic_check returns -EINVAL if the CRTC has not been
> set. This is the case for disabled planes, for which atomic_check
> should return 0. For disabled planes, it also omits the mandatory
> call to drm_atomic_helper_check_plane_state().
>
> Replace the test with the boiler-plate code that first invokes
> drm_atomic_helper_check_plane_state() and then tests for the plane
> to be visible. Return early for non-visible planes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: d51f9fbd98b6 ("drm/ssd130x: Store the HW buffer in the driver-private CRTC state")
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Tested-by: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> ---

I've picked this since it's an unrelated fix to the rest of the series.

Pushed to drm-misc (drm-misc-next) because the offending commit is not
in mainline yet. Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

