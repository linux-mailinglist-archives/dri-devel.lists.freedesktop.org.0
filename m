Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC56A5CD8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 17:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E397A10E051;
	Tue, 28 Feb 2023 16:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6132310E051
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 16:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677600670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t7IBO5aYl69umpGyTeyvZekqQInZMv1t8j+p55wYs/4=;
 b=da/5GdHlNARGSqLmwgrcen+e9j1eSvbwT+jM3fdkpFivegTK2iylPV45CD4O5sQo70aOXy
 doXcpxoqEzHbMfmc27vZoiqfFKBJFX7Ch6nX2um/flEXzKFRkSumaBaVoYVX9ZO7DuSBz7
 cyTivjOCrepDwEpz8KCFX1Wr4aOOiVk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-ymxV-x3vODuGq0Tm2MOOFA-1; Tue, 28 Feb 2023 11:11:06 -0500
X-MC-Unique: ymxV-x3vODuGq0Tm2MOOFA-1
Received: by mail-wr1-f69.google.com with SMTP id
 l5-20020a5d6745000000b002c91cb49949so1669260wrw.14
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 08:11:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677600662;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t7IBO5aYl69umpGyTeyvZekqQInZMv1t8j+p55wYs/4=;
 b=cUtHYQ9b5uUjjOdCDNqBwDlQkZ9Ik8ebhtskJrXzWrbur+g2aet1VdXfzj/bz4lRdi
 EJzwTPkqx6ArkCzlq2F0gWUkDqkWr2PM9fL4tHorTKvUFNH8r9za01Y92KPEnjMm58i0
 hiuEa5JooLwXH5NmQUaYxov7SKr/z6/0BkPPDN6Tdh1x3b9SViOs6ADtwJSxfC6PqJWe
 RAj7qmVh6vKvN4D9Zpl1DXf43hppVDRVqaMhOA6z8NdWkbfZXNmmh1TCrJXbIqOaGilB
 aGVVEkuAfDNfN3CY/1vezlnT0TySiv9lZcwC/AwRgTD2RcnNVd+4RiWI1fjA3k4o+NeT
 fCUA==
X-Gm-Message-State: AO0yUKUaEEGKu5kox3KrbME8XEzZF8wMBaYmM+qvfVCal6YpwQ342+JM
 pyiCugdqvY28yNjuqjvNQK3dJ/jg+VxEjdxgehdnLctM9TNQyqfm192ikkZOKyxeZWup4JDj3hQ
 m1nfXLyrSngXFT+CwxVeqShHvOzzT
X-Received: by 2002:a5d:6542:0:b0:2c7:434e:9a5a with SMTP id
 z2-20020a5d6542000000b002c7434e9a5amr2710704wrv.65.1677600662598; 
 Tue, 28 Feb 2023 08:11:02 -0800 (PST)
X-Google-Smtp-Source: AK7set+C4Sx+1qgWlESMbjldUwgs92cnO8HMzCf0I1Pku6si91VTDTWk4Zh3ewsOtCPt8aCThrr3VA==
X-Received: by 2002:a5d:6542:0:b0:2c7:434e:9a5a with SMTP id
 z2-20020a5d6542000000b002c7434e9a5amr2710693wrv.65.1677600662295; 
 Tue, 28 Feb 2023 08:11:02 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o25-20020a05600c511900b003dfe549da4fsm18453097wms.18.2023.02.28.08.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 08:11:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4] drm/virtio: Add option to disable KMS support
In-Reply-To: <20230228155406.2881252-1-robdclark@gmail.com>
References: <20230228155406.2881252-1-robdclark@gmail.com>
Date: Tue, 28 Feb 2023 17:11:00 +0100
Message-ID: <87bkldhisr.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 open list <linux-kernel@vger.kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ryan Neph <ryanneph@chromium.org>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rob Clark <robdclark@gmail.com> writes:

Hello Rob,

> From: Rob Clark <robdclark@chromium.org>
>
> Add a build option to disable modesetting support.  This is useful in
> cases where the guest only needs to use the GPU in a headless mode, or
> (such as in the CrOS usage) window surfaces are proxied to a host
> compositor.
>
> As the modesetting ioctls are a big surface area for potential security
> bugs to be found (it's happened in the past, we should assume it will
> again in the future), it makes sense to have a build option to disable
> those ioctls in cases where they serve no legitimate purpose.
>
> v2: Use more if (IS_ENABLED(...))
> v3: Also permit the host to advertise no scanouts
> v4: Spiff out commit msg
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---

The patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

