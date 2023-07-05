Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69BA747F87
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 10:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1D6910E28D;
	Wed,  5 Jul 2023 08:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002EA10E223
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 08:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688545454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HXRUz+auagzZsOaKQHNMqYO4qOJECVy27UGXYE5lEfo=;
 b=GcCDGJ+dbTk4SpjKEZRn8ZVgDMK4mcVfAPhKkL17le9gVR6GIesH32EdoqOXfRXDDQKuOW
 +W/6o5E1WUgmS2tLQBIwNmJsdgdbZWDR3TBT1wU+2Vc+MMoYoG+5m+34TuGursNZjbnGiR
 qWqzv4UckKeDBxfx2utdVmJZ7vMSMhk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-Kq9uydleMRq5uofMPcRRfA-1; Wed, 05 Jul 2023 04:24:10 -0400
X-MC-Unique: Kq9uydleMRq5uofMPcRRfA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b701c82e83so833891fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jul 2023 01:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688545449; x=1691137449;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HXRUz+auagzZsOaKQHNMqYO4qOJECVy27UGXYE5lEfo=;
 b=OE3Lyw3TNOEqrthKM1MmipkTyjD9Npzv2LroaMZ2MFOdm2HqXAA3lO5sVCgy4qDvP/
 o5TH6v6Yiz1z3OIqOwvABTVEcTWoh1AUW/Px1gYBbDfDnvjxHLtL87gALo7Cp1PwZZjw
 xUKj5tBfKfsUnHHjAMALVoVtfA0QgDgJ7qwKo9nyqnCPCDji3Ixa1j5OGqxM+JM6iMiL
 OFgkqzUHxNMgGxt7z27YvuyyxOtVfRr3ulpl6A3DTKFDp+W+EVhpAbTuHoKw2UOoFfhE
 W+31M8/tHHVmdcc3xEXujCYlv+5ceggbzy62aWDjOKOaz84XgXG61L86WIIK/iILid+b
 WGdQ==
X-Gm-Message-State: ABy/qLaogu2wOBTgoEc/8GvFGXVvYh6vTsKQbQ/DF78AVRmYt6GhIb00
 sg1t1mVAmdMarJ3+YJb2MmqPBJY7wA4amN8Q+IFjlBonlNEeYaKy4i3ElMq4YaTH2ePhar9M+V7
 lmAeHMwsR4kSImG0nQN2G5WHaitvZ
X-Received: by 2002:a2e:90c2:0:b0:2b6:ac18:aaae with SMTP id
 o2-20020a2e90c2000000b002b6ac18aaaemr12062945ljg.11.1688545449237; 
 Wed, 05 Jul 2023 01:24:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHoQycU00p6ugiTa1dDXde4hKV6yZxsdqHhYJgQjyIpKck2z33xRFZIUGg8lxMqFb6zKqgffQ==
X-Received: by 2002:a2e:90c2:0:b0:2b6:ac18:aaae with SMTP id
 o2-20020a2e90c2000000b002b6ac18aaaemr12062929ljg.11.1688545448949; 
 Wed, 05 Jul 2023 01:24:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c26-20020a7bc01a000000b003f7f475c3bcsm1436708wmb.1.2023.07.05.01.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 01:24:08 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: Re: [PATCH 02/10] drm/fbdev-dma: Use fbdev DMA helpers
In-Reply-To: <20230704160133.20261-3-tzimmermann@suse.de>
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-3-tzimmermann@suse.de>
Date: Wed, 05 Jul 2023 10:24:07 +0200
Message-ID: <873522sr4o.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Use fbdev's DMA helpers for fbdev-dma. They are equivalent to the
> previously used system-memory helpers, so no functional changes here.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

